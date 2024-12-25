% データの準備
frequency = [10, 100, 500, 1000, 2000, 3000, 4000, 4500, 4800, 5000, 6000, 8000, 10000, 50000, 100000];
gain = [-34.59, -28.79, -18.59, -13.53, -8.29, -5.59, -4.09, -3.52, -3.17, -3.08, -2.33, -1.43, -1.00, -0.09, -0.09]; % 電圧利得(dB)
phase = [NaN, NaN, 90, 80, 70, 60, 50, 45, 45.2, NaN, 40, 32, 27, 7, NaN]; % 位相差(度)

% NaNを除去して補間する（スプライン補間を使用、端のデータは無視）
valid_idx = find(~isnan(phase)); % 有効なデータのインデックスを取得
interp_range = valid_idx(1):valid_idx(end); % 有効データの範囲を取得
phase_interp = NaN(size(phase)); % 初期化（すべてNaN）
phase_interp(interp_range) = interp1(frequency(valid_idx), phase(valid_idx), frequency(interp_range), 'spline'); % 有効範囲のみ補間

% 図を作成 (横に並べて表示するためにsubplotを使用)
figure;

% 1つ目のグラフ (frequency vs gain)
subplot(1, 2, 1); % 1行2列の1つ目
semilogx(frequency, gain, '-b', 'LineWidth', 2); % 対数表示でプロット
hold on;
plot(frequency, gain, 'bo', 'MarkerFaceColor', 'b'); % 電圧利得のデータ点をプロット
xlabel('周波数 (Hz)');
ylabel('電圧利得 (dB)');
title('周波数 vs 電圧利得');
grid on;

% 2つ目のグラフ (frequency vs phase)
subplot(1, 2, 2); % 1行2列の2つ目
semilogx(frequency, phase_interp, '--r', 'LineWidth', 2); % 補間された位相差
hold on;
plot(frequency(valid_idx), phase(valid_idx), 'ro', 'MarkerFaceColor', 'r'); % 元のデータ点をプロット
xlabel('周波数 (Hz)');
ylabel('位相差 (°)');
title('周波数 vs 位相差');
grid on;

% グラフの配置を調整
sgtitle('周波数と電圧利得、位相差の関係'); % 上に共通のタイトルを追加
