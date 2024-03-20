#include <iostream>
using namespace std;
void main() {
    // differentiation
    float T, t, dt, num, anal;
    cout << " T t ? = ";
    cin >> T >> t;
    cout << " dt ? = ";
    cin >> dt;
    anal = -T / pow(t, 2);
    num = T * (1 / (t + dt) - 1 / t) / dt;

    cout << " num " << num << " anal " << anal << endl;
    cout << " error = " << (num - anal) / anal * 100 << "%\n";
   
    // integration
    float a, b, N;
    cout << "a b N = ";
    cin >> a >> b >> N;
    anal = T * log(b / a);
    dt = (b - a) / N;
    num = 0;
    for (int i = 0; i < N; i++) {
        num += T * pow(a + dt * i, -1) * dt;
    }
    cout << "num " << num << " anal " << anal << endl;
    cout << "error = " << (num - anal) / anal * 100 << "%\n";
}
