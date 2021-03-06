table1 = [
    4.8 0.14 5.2 0.16 4.5 0.13
    5.9 1.11 6.1 1.21 5.7 1.03
    3.4 0.27 3.6 0.34 3.1 0.29
    4.2 0.36 4.4 0.4  3.9 0.35
    3.8 0.2  4.5 0.35 3.5 0.16
    3.4 0.14 5.3 0.47 2.9 0.11
    3.3 0.09 4.3 0.17 3.1 0.08
    4   0.13 4.5 0.2  3.7 0.13
    4.8 0.23 5.1 0.37 4.5 0.15
    5.2 0.17 5.3 0.22 5.1 0.17
    5.4 0.17 5.6 0.2  5.3 0.21
    5.7 0.2  5.8 0.24 5.6 0.21
    5.5 0.18 5.5 0.15 5.4 0.23
    ];

table2 = [
    4.8  0.14 5.2 0.16    4.5  0.13
    4.1  0.18 4.6 0.39    3.8  0.21
    2.8  0.15 2.9 0.22    2.7  0.2
    3.6  0.22 2.8 0.16    4.1  0.3
    6.1  0.74 7.3 1.48    5.2  0.41
    2.9  0.23 3.1 0.29    2.7  0.23
    4.5  0.18 4.4 0.23    4.6  0.19
    3    0.53 3.6 0.9     2.2  0.24
    3.8  0.13 3.6 0.15    4    0.21
    3.7  0.15 3.7 0.17    3.6  0.24
    4.6  0.24 4.7 0.32    4.4  0.21
    4    0.16 4.9 0.3	  3.6  0.18
    2.7  0.06 0.0 1.0E-10 2.7  0.06
    5.4  0.22 5   0.26    5.9  0.33
    4.6  0.1  4.5 0.12    4.7  0.14
    5    0.19 5.1 0.21    4.9  0.26
    2.2  0.18 2.4 0.26    2.2  0.15
    7.2  0.31 7.7 0.42    6.7  0.32
    4.9  0.2  4.5 0.22    5.2  0.31
    5.9  0.27 5.6 0.36    6.2  0.38
    4.4  0.19 4.3 0.35    4.4  0.24
    2.6  0.21 2.7 0.37    2.5  0.16
    6.3  0.42 6.1 0.34    6.6  0.55
    6.5  0.65 6.3 0.51    6.7  0.78
    10.6 0.81 9.2 0.71    12.2 1.05
    3.4	 0.13 3.3 0.15    3.5  0.12
    4.6	 0.28 4.3 0.28    4.9  0.45
    5.2	 0.19 5.1 0.26    5.3  0.19
    3	 0.23 3.2 0.37    2.8  0.23
    5	 0.15 5   0.2     5    0.15
    8.8	 0.4  9.1 0.56    8.5  0.47
    4.7	 0.12 4.6 0.2     4.7  0.16
    3.2	 0.23 3	  0.25    3.4  0.26
    6.1	 0.77 5.5 0.67    6.5  0.95
    5.6	 0.17 6.2 0.28    5.1  0.22
    3.2	 0.17 5.1 0.74    2.7  0.11
    6.3	 0.22 6.4 0.31    6.3  0.3
    7.9	 0.41 7.7 0.47    8.1  0.67
    6.2	 0.31 6   0.44    6.4  0.42
    4	 0.14 4.4 0.28    3.9  0.14
    ];

table_mid = zeros(13,3,40);
table_min = zeros(13,3,40);
table_max = zeros(13,3,40);

for age = 1:13
    for sex = 1:3
        for sick = 1:40
            uncertain_1 = table1(age,sex*2);
            uncertain_2 = table2(sick,sex*2);
            total_certainty = 1/uncertain_1 + 1/uncertain_2;
            confidence_delta = 1.96 / total_certainty;
            
            table_mid(age,sex,sick) = table1(age,sex*2-1)/(uncertain_1*total_certainty) + table2(sick,sex*2-1)/(uncertain_2*total_certainty);
            table_min(age,sex,sick) = table_mid(age,sex,sick) - confidence_delta;
            table_max(age,sex,sick) = table_mid(age,sex,sick) + confidence_delta;
        end
    end
end