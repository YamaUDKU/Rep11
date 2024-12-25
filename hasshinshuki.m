% データの定義
N = [5, 7, 9, 11]; % 段数
T = [48.8, 63.7, 78.4, 88.4]; % 発振周期 [ns]

% プロット
figure;
plot(N, T, 'o', 'LineWidth', 1.5, 'MarkerSize', 8);
grid on;

% 軸ラベルとタイトル
xlabel('段数 N', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('発振周期 T [ns]', 'Interpreter', 'latex', 'FontSize', 12);

% 軸範囲の調整（必要に応じて）
xlim([min(N)-1, max(N)+1]);
ylim([min(T)-10, max(T)+10]);
