#pragma once

#ifndef _VECTOR3F_H_
#define _VECTOR3F_H_

#include <iostream>
#include <math.h>

class Vector3f {
public:
	float x;
	float y;
	float z;

	//コンストラクタ
	Vector3f();

	Vector3f(float x);

	Vector3f(float x, float y, float z);

	Vector3f(const Vector3f& v);

	Vector3f(const Vector3f& start, const Vector3f& end);

	//関数

	const void set(float x, float y, float z);

	const void add(const Vector3f& v);

	const void sub(const Vector3f& v);

	const void mul(float n);

	const void normalize();

	const void invert();

	//dot product
	const float dotProduct(const Vector3f& v);

	//cross product
	const void crossProduct(const Vector3f& v1, const Vector3f& v2);


	const float magnitude();

	const float sqrMagnitude();

	bool operator == (const Vector3f& v);
	bool operator != (const Vector3f& v);
	Vector3f& operator = (const Vector3f& v);
	Vector3f& operator + (const Vector3f& v);
	Vector3f& operator - (const Vector3f& v);
	Vector3f& operator * (const float& v);
	Vector3f& operator / (const float& v);

	friend std::ostream& operator << (std::ostream &stream, const Vector3f& v);

	//Static:
private:
	static Vector3f vec;

public:

	static const Vector3f back;
	static const Vector3f down;
	static const Vector3f forward;
	static const Vector3f left;
	static const Vector3f one;
	static const Vector3f right;
	static const Vector3f up;
	static const Vector3f zero;

	static float Dot(const Vector3f& v1, const Vector3f& v2);

	static Vector3f Scale(const Vector3f& v1, const Vector3f& v2);

	static Vector3f Cross(const Vector3f& v1, const Vector3f& v2);

};

#endif
