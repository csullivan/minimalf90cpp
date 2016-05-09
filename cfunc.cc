#include <iostream>

using namespace std;


double cfunc(int& x) {
  cout << "In C++ compiled code" << endl;
  return x*x;
}
extern"C" double cfunc_(int& x) {
  return cfunc(x);
}
