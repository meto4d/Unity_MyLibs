#pragma once

#include "stdafx.h"

#include "vector3f_for_unity.h"

#include <iostream>
#include <iomanip>
#include <math.h>


//コンストラクタ
Vector3f::Vector3f() : x(0.0f), y(0.0f), z(0.0f) {}

Vector3f::Vector3f(float x) : x(x), y(x), z(x) {}

Vector3f::Vector3f(float x, float y, float z) : x(x), y(y), z(z) {}

Vector3f::Vector3f(const Vector3f& v) : x(v.x), y(v.y), z(v.z) {}

Vector3f::Vector3f(const Vector3f& start, const Vector3f& end) {
	this->x = end.x - start.x;
	this->y = end.y - start.y;
	this->z = end.z - start.z;
}

//関数

const void Vector3f::set(float x, float y, float z) {
	this->x = x;
	this->y = y;
	this->z = z;
}

const void Vector3f::add(const Vector3f& v) {
	this->x += v.x;
	this->y += v.y;
	this->z += v.z;
}

const void Vector3f::sub(const Vector3f& v) {
	this->x -= v.x;
	this->y -= v.y;
	this->z -= v.z;
}

const void Vector3f::mul(float n) {
	this->x *= n;
	this->y *= n;
	this->z *= n;
}

const void Vector3f::normalize() {
	float _l = 1.0f / sqrt(
		this->x * this->x + this->y * this->y + this->z * this->z);
	this->x *= _l;
	this->y *= _l;
	this->z *= _l;
}

const void Vector3f::invert() {
	this->x *= -1.0f;
	this->y *= -1.0f;
	this->z *= -1.0f;
}

//dot product
const float Vector3f::dotProduct(const Vector3f& v){
	return this->x * v.x + this->y * v.y + this->z * v.z;
}

//cross product
const void Vector3f::crossProduct(const Vector3f& v1, const Vector3f& v2) {
	this->x = v1.y * v2.z - v1.z * v2.y;
	this->y = v1.z * v2.x - v1.x * v2.z;
	this->z = v1.x * v2.y - v1.y * v2.x;
}


const float Vector3f::magnitude()
{
	return sqrtf(this->x*this->x + this->y*this->y + this->z*this->z);
}

const float Vector3f::sqrMagnitude()
{
	return (this->x*this->x + this->y*this->y + this->z*this->z);
}



float Vector3f::Dot(const Vector3f& v1, const Vector3f& v2)
{

	return v1.x * v2.x + v1.y * v2.y + v1.z * v2.z;
}

Vector3f Vector3f::vec;

Vector3f Vector3f::Scale(const Vector3f& v1, const Vector3f& v2)
{
	vec.x = v1.x * v2.x;
	vec.y = v1.y * v2.y;
	vec.z = v1.z * v2.z;

	return vec;
}

Vector3f Vector3f::Cross(const Vector3f& v1, const Vector3f& v2)
{

	vec.x = v1.y * v2.z - v1.z * v2.y;
	vec.y = v1.z * v2.x - v1.x * v2.z;
	vec.z = v1.x * v2.y - v1.y * v2.x;

	return vec;
}

bool Vector3f::operator == (const Vector3f& v)
{
	if (this->x == v.x)
	if (this->y == v.y)
	if (this->z == v.z)
		return true;

	return false;

}
bool Vector3f::operator != (const Vector3f& v)
{
	return !(*this == v);
}

Vector3f& Vector3f::operator = (const Vector3f& v)
{
	this->x = v.x;
	this->y = v.y;
	this->z = v.z;

	return *this;
}

Vector3f& Vector3f::operator + (const Vector3f& v)
{
	this->x += v.x;
	this->y += v.y;
	this->z += v.z;

	return *this;
}

Vector3f& Vector3f::operator - (const Vector3f& v)
{
	this->x -= v.x;
	this->y -= v.y;
	this->z -= v.z;

	return *this;
}

Vector3f& Vector3f::operator * (const float& f)
{
	this->x *= f;
	this->y *= f;
	this->z *= f;

	return *this;
}

Vector3f& Vector3f::operator / (const float& f)
{
	this->x /= f;
	this->y /= f;
	this->z /= f;

	return *this;
}

std::ostream& operator << (std::ostream &os, const Vector3f& v)
{
	os << std::scientific << std::setprecision(2) << "(" << v.x << ", " << v.y << ", " << v.z << ")" << std::fixed;
	return os;
}

//static const変数

const Vector3f Vector3f::back = Vector3f(0.0f, 0.0f, -1.0f);
const Vector3f Vector3f::down = Vector3f(0.0f, -1.0f, 0.0f);
const Vector3f Vector3f::forward = Vector3f(0.0f, 0.0f, 1.0f);
const Vector3f Vector3f::left = Vector3f(-1.0f, 0.0f, 0.0f);
const Vector3f Vector3f::one = Vector3f(1.0f, 1.0f, 1.0f);
const Vector3f Vector3f::right = Vector3f(1.0f, 0.0f, 0.0f);
const Vector3f Vector3f::up = Vector3f(0.0f, 1.0f, 0.0f);
const Vector3f Vector3f::zero = Vector3f(0.0f, 0.0f, 0.0f);
