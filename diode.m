% 共通データ
I_D = [   1,    2,    5,   10,   20,   50,  100,  200,  500, 1000, 2000, 5000];
V_blue = [2.21, 2.26, 2.31, 2.33, 2.36, 2.40, 2.43, 2.46, 2.51, 2.56, 2.62, 2.74];
V_red  = [1.46, 1.50, 1.55, 1.58, 1.62, 1.66, 1.69, 1.72, 1.76, 1.79, 1.83, 1.91];

% mA単位に変換（線形スケール用）
I_D_mA = I_D / 1000;    % μA → mA

% --- Script 1: 青色データ（リニアスケール）---

figure;
plot(V_blue, I_D_mA, 'bo', 'LineWidth', 1.5, 'MarkerFaceColor', 'none');
xlabel('電圧 (V)', 'FontSize', 12);
ylabel('電流 (mA)', 'FontSize', 12);
grid on;
% --- Script 2: 赤色データ（リニアスケール）---

figure;
plot(V_red, I_D_mA, 'ro', 'LineWidth', 1.5, 'MarkerFaceColor', 'none');
xlabel('電圧 (V)', 'FontSize', 12);
ylabel('電流 (mA)', 'FontSize', 12);
grid on;

% --- Script 3: 青色データ（片対数スケール）---

figure;
semilogy(V_blue, I_D, 'bo', 'LineWidth', 1.5, 'MarkerFaceColor', 'none');
xlabel('電圧 (V)', 'FontSize', 12);
ylabel('電流 (\muA)', 'FontSize', 12);
grid on;

% --- Script 4: 赤色データ（片対数スケール）---

figure;
semilogy(V_red, I_D, 'ro', 'LineWidth', 1.5, 'MarkerFaceColor', 'none');
xlabel('電圧 (V)', 'FontSize', 12);
ylabel('電流 (\muA)', 'FontSize', 12);
grid on;

