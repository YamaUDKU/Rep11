% 共通データ
I_D = [   1,    2,    5,   10,   20,   50,  100,  200,  500];
voltage = [2.21, 2.26, 2.31, 2.33, 2.36, 2.40, 2.43, 2.46, 2.51];
voltage2 = [1.46, 1.50, 1.55, 1.58, 1.62, 1.66, 1.69, 1.72, 1.76, 1.79, 1.83, 1.91];

log_current = log10(I_D);

% 最小二乗法による回帰直線
coefficients = polyfit(voltage, log_current, 1); % 1次多項式フィット
a = coefficients(1); % 傾き
b = coefficients(2); % 切片

% 回帰直線の計算
fit_line = polyval(coefficients, voltage);

% R^2 値の計算
SS_res = sum((log_current - fit_line).^2); % 残差平方和
SS_tot = sum((log_current - mean(log_current)).^2); % 全体平方和
R2 = 1 - (SS_res / SS_tot);

% n 値の計算
e = 1.602176634e-19; % 電荷素量 (C)
k_B = 1.380649e-23; % ボルツマン定数 (J/K)
T = 300; % 室温 (K)
n = (e / (a * k_B * T)) * log10(exp(1));

% 結果の表示
fprintf('回帰直線: log10(I) = %.2f * V + %.2f\n', a, b);
fprintf('R^2値: %.4f\n', R2);
fprintf('n値: %.2f\n', n);
