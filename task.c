#include <stdio.h>
#include <math.h>
#include <stdbool.h>

double expSin(double x) {
    return (expf(x) - expf(-x)) / 2;
}

bool is_good(double x, double y) {
    if (x < y) {
        return (x / y) < 0.999;
    } else {
        return (y / x) < 0.999;
    }
}

double mySin(double x) {
    double result = x;
    double sample = expSin(x);
    double myX = x;
    double fact = 1;
    int i = 1;
    while (is_good(result, sample)) {
        myX = myX * x * x;
        i++;
        fact *= i;
        i++;
        fact *= i;
        result += (myX / fact);
    }
    return result;
}

double diff(double x, double y) {
    if (x < y) {
        return (x / y);
    } else {
        return (y / x);
    }
}

int main()
{
    double x;
    scanf("%lf", &x);
    double ans = mySin(x);
    printf("ExpSin: ");
    printf("%.5f\n", expSin(x));
    printf("ExpSin: ");
    printf("%.5f\n\n", ans);
    printf("Difference: ");
    printf("%.5f", diff(ans, expSin(x)));
}
