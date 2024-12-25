% データの入力
frequency = [50, 100, 500, 1000, 2000, 5000, 10000, 20000];  % 周波数 (Hz)
phase_difference = [160, 150, 120, 115, 125, 130, 150, 170]; % 位相差 (degree)
voltage_gain = [3.43902439, 3.972972973, 9.407894737, 19, 30.5, 47.5, 56, 60]; % 電圧利得

% グラフのプロット
figure;

% 位相差のプロット
yyaxis left;
semilogx(frequency, phase_difference, 'o', 'MarkerSize', 8, 'LineWidth', 1.5); % 点のみプロット
ylabel('位相差(deg)');  % 左のy軸ラベル
ylim([0 180]);  % y軸を0から180度に制限

% 電圧利得のプロット
yyaxis right;
semilogx(frequency, voltage_gain, 's', 'MarkerSize', 8, 'LineWidth', 1.5); % 点のみプロット
ylabel('電圧利得(倍)');  % 右のy軸ラベル

% 軸ラベルとグラフの詳細設定
xlabel('周波数(Hz)');
title('');
legend('位相差', '電圧利得');
grid on;
