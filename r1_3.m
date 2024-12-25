% データの準備
frequency = [10, 100, 500, 1000, 2000, 3000, 4000, 4500, 4800, 5000, 6000, 8000, 10000, 50000, 100000];
gain = [-34.59, -28.79, -18.59, -13.53, -8.29, -5.59, -4.09, -3.52, -3.17, -3.08, -2.33, -1.43, -1.00, -0.09, -0.09]; % 電圧利得(dB)
phase = [NaN, NaN, 90, 80, 70, 60, 50, 45, 45.2, NaN, 40, 32, 27, 7, NaN]; % 位相差(度)

% NaNを除去して補間する（スプライン補間）
valid_idx = find(~isnan(phase)); % 有効なデータのインデックスを取得
% 100000 Hzの位相差を反映させないように補間範囲を制限
valid_idx = valid_idx(valid_idx < length(frequency)); % 100000Hzを除外

% 補間を実行（100000 Hzを反映させずに補間）
phase_interp = interp1(frequency(valid_idx), phase(valid_idx), frequency(1:end-1), 'spline', 'extrap'); % 端も含む補間

% 図を作成 (1つのグラフに2つの縦軸を使用)
figure;

% 左側の縦軸 (電圧利得)
yyaxis left;
semilogx(frequency, gain, '-b', 'LineWidth', 2); % 対数表示で電圧利得をプロット
hold on;
plot(frequency, gain, 'bo', 'MarkerFaceColor', 'b'); % 電圧利得のデータ点をプロット
ylabel('電圧利得 (dB)'); % 左側のラベル

% 右側の縦軸 (位相差)
yyaxis right;
semilogx(frequency(1:end-1), phase_interp, '--r', 'LineWidth', 2); % 100000 Hzを除外した位相差をプロット
hold on;
plot(frequency(valid_idx), phase(valid_idx), 'ro', 'MarkerFaceColor', 'r'); % 元のデータ点をプロット
ylabel('位相差 (°)'); % 右側のラベル

% 軸ラベルとタイトルの設定
xlabel('周波数 (Hz)');
title('周波数に対する電圧利得と位相差');
grid on;

% 凡例の追加
legend('電圧利得 (dB)', '位相差 (補間)', '電圧利得 (データ点)', '位相差 (データ点)', 'Location', 'best');

hold off;

