Shader "Custom/Macedonia" {
	Properties {
		_Flag("Flag flag", Range(0,1)) = 0.125
		_FlagE("Flag Edge", Range(0,1)) = 0.03
		_ColorB("ColorB", Color) = (1,0,0.101,1)
		_ColorF("ColorF", Color) = (1,1,0,1)
		_Resolut("Resolution", float) = 10.0
		_AngAcc("Angular Acceleration", float) = 1.0

		//_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Glossiness ("Smoothness", Range(0,1)) = 0.5
		_Metallic ("Metallic", Range(0,1)) = 0.0
	}
	SubShader {
		Tags { "RenderType"="Fade" }
		LOD 200

	Pass{
		AlphaToMask On
		CGPROGRAM
		
#pragma vertex vert
#pragma fragment frag
#define PI 3.1415926535897932384626433832795028841971693993
#define PI2 (180.0 / PI)
#define PI3 (PI / 180.0)
#define Inver2 (1 / sqrt(2))

#include "UnityCG.cginc"

		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0

		float  _Flag;
		float  _FlagE;
		float4 _ColorB;
		float4 _ColorF;
		float  _Resolut;
		float  _AngAcc;

		struct appdata
		{
			float4 vertex : POSITION;
			float2 uv : TEXCOORD0;
		};

		struct v2f
		{
			float2 uv : TEXCOORD0;
			UNITY_FOG_COORDS(1)
			float4 vertex : SV_POSITION;
		};

		half _Glossiness;
		half _Metallic;

		// Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
		// See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
		// #pragma instancing_options assumeuniformscaling
		UNITY_INSTANCING_BUFFER_START(Props)
			// put more per-instance properties here
		UNITY_INSTANCING_BUFFER_END(Props)

		// 頂点シェーダ
		v2f vert(appdata v)
		{
			v2f o;
			o.vertex = UnityObjectToClipPos(v.vertex);
			o.uv = v.uv;

			return o;
		}

		// フラグメントシェーダ
		float4 frag(v2f i) : SV_Target
		{
			float r = sqrt(pow(i.uv.y - 0.5, 2) + pow(i.uv.x - 0.5, 2));

			return lerp(
				lerp(_ColorB, _ColorF, step(sin(_Resolut * (atan2(i.uv.y - 0.5, i.uv.x - 0.5) + _Time.y * _AngAcc)), 0.0)),
				lerp(_ColorB, _ColorF, step(r, _Flag * Inver2)),
				step(r, (_Flag + _FlagE) * Inver2)
			);
		}

		ENDCG
	}
	}
	FallBack "Diffuse"
}
