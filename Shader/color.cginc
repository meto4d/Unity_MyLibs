//#include "UnityCG.cginc"
#define PI 3.1415926535897932384626433832795028841971693993
#define FLT_MIN          1.175494351e-38F

inline float3 RGB2HSV(float3 rgb)
{
	float minValue = min(rgb.x, min(rgb.y, rgb.z));
	float maxValue = max(rgb.x, max(rgb.y, rgb.z));

	float hue = lerp(
		0,
		lerp(
			lerp(
				(rgb.x - rgb.z) / (maxValue - minValue) + 5,
				(rgb.z - rgb.y) / (maxValue - minValue) + 3,
				step(0, rgb.x - minValue)
			),
			(rgb.y - rgb.x) / (maxValue - minValue) + 1,
			step(0, minValue - rgb.z)
		),
		step(0, maxValue - minValue)
	);
	//if (minValue == maxValue) {
	//	hue = 0;
	//}
	//else if (minValue == rgb.z) {
	//	hue = 60 * (rgb.y - rgb.x) / (maxValue - minValue) + 60;
	//}
	//else if (minValue == rgb.x) {
	//	hue = 60 * (rgb.z - rgb.y) / (maxValue - minValue) + 180;
	//}
	//else if (minValue == rgb.y) {
	//	hue = 60 * (rgb.x - rgb.z) / (maxValue - minValue) + 300;
	//}

	hue /= 6.0f;
	hue += step(0, -hue);
	hue -= step(1, hue);

	return float3(hue, (maxValue - minValue) / maxValue, maxValue);

}

inline float4 RGB2HSV(float4 rgba)
{
	float3 h = RGB2HSV(rgba.rgb);
	return float4(h.r, h.g, h.b, rgba.a);

}

inline float3 HSV2RGB(float3 hsv)
{
	float3 outc;
	float3 minmax;
	minmax.z = hsv.z; //max
	minmax.y = hsv.z - hsv.y; //min
	minmax.x = hsv.x * 6; //minmax.x = hsv.x * 360;
	
	//if (trunc(minmax.x) > 5.0f) minmax.x -= 6.0f;
	minmax.x -= step(5.0f, trunc(minmax.x)) * 6.0f;

	//if (trunc(minmax.x) < 0.0f) minmax.x += 6.0f;
	minmax.x += step(0.0f, -trunc(minmax.x)) * 6.0f;


	switch (trunc(minmax.x))
	{
	case 0:
		outc.x = minmax.z;
		outc.y = (minmax.x) * (minmax.z - minmax.y) + minmax.y;
		outc.z = minmax.y;
		break;

	case 1:
		outc.x = (2 - minmax.x) * (minmax.z - minmax.y) + minmax.y;
		outc.y = minmax.x * 60;
		outc.z = minmax.y;
		break;

	case 2:
		outc.x = minmax.y;
		outc.y = minmax.x * 60;
		outc.z = (minmax.x - 2) * (minmax.z - minmax.y) + minmax.y;
		break;

	case 3:
		outc.x = minmax.y;
		outc.y = (4 - minmax.x) * (minmax.z - minmax.y) + minmax.y;
		outc.z = minmax.x * 60;
		break;

	case 4:
		outc.x = (minmax.x - 4) * (minmax.z - minmax.y) + minmax.y;
		outc.y = minmax.y;
		outc.z = minmax.z;
		break;

	case 5:
		outc.x = minmax.z;
		outc.y = minmax.y;
		outc.z = (6 - minmax.x) * (minmax.z - minmax.y) + minmax.y;
		break;

	default:
		outc = float3(0, 0, 0);
		break;
	}

	return outc;
}

inline float4 HSV2RGB(float4 hsva)
{
	float3 hsv = HSV2RGB(hsv.xyz);
	return float4(hsv.x, hsv.y, hsv.z, hsva.a);
}

inline float3 RGB2HSL(flaot3 rgb)
{
	float minValue = min(rgb.x, min(rgb.y, rgb.z));
	float maxValue = max(rgb.x, max(rgb.y, rgb.z));

	float hue = lerp(
		0,
		lerp(
			lerp(
				(rgb.x - rgb.y) / (maxValue - minValue) + 4,
				(rgb.z - rgb.x) / (maxValue - minValue) + 2,
				step(0, rgb.y - maxValue)
			),
			(rgb.y - rgb.z) / (maxValue - minValue),
			step(0, rgb.x - maxValue)
		),
		step(0, maxValue - minValue)
	);

	float sat = lerp(
		(maxValue - minValue) / (maxValue + minValue),
		(maxValue - minValue) / (2 - (maxValue + minValue)),
		step(1.0f, (minValue + maxValue))
	);

	return float3(hue / 6, sat, (minValue + maxValue) / 2)
}

inline float4 RGB2HSL(float4 rgba)
{
	float3 hsl = RGB2HSL(rgba.rgb);
	return (hsl.x, hsl.y, hsl.z, rgb.a);
}

inline float3 HSL2RGB(float3 hsl)
{
	float maxV = lerp(
		hsl.z * (1.0f + hsl.y),
		hsl.z + (1.0f - hsl.z) * hsl.y,
		step(0.5f, hsl.z)
	);
	float minV = lerp(
		hsl.z * (1.0f - hsl.y),
		hsl.z - (1.0f - hsl.z) * hsl.y,
		step(0.5f, hsl.z)
	);

	float3 outc = float3(0, 0, 0);

	hsl.x *= 6;
	switch (trunc(hsl.x))
	{
	case 0:
		outc.x = maxV;
		outc.y = hsl.x * (maxV - minV) + minV;
		outc.z = minV;
		break;

	case 1:
		outc.x = (2 - hsl.x) * (maxV - minV) + minV;
		outc.y = maxV;
		outc.z = minV;
		break;

	case 2:
		outc.x = minV;
		outc.y = maxV;
		outc.z = (hsl.x - 2) * (maxV - minV) + minV;
		break;

	case 3:
		outc.x = minV;
		outc.y = (3 - hsl.x) * (maxV - minV) + minV;
		outc.z = maxV;
		break;


	case 4:
		outc.x = minV;
		outc.y = maxV;
		outc.z = (hsl.x - 3) * (maxV - minV) + minV;
		break;

	case 5:
		outc.x = minV;
		outc.y = (5 - hsl.x) * (maxV - minV) + minV;
		outc.z = maxV;
		break;


	case 6:
		outc.x = minV;
		outc.y = maxV;
		outc.z = (hsl.x - 5) * (maxV - minV) + minV;
		break;
	}

	return outc;
}

inline float4 HSL2RGB(float4 hsla)
{
	float3 rgb = HSL2RGB(hsl.xyz);
	return float4(rgb.r, rgb.g, rgb.b, hsla.a);
}
