% データの準備 (ここでは例としてのデータ)
frequency = [10, 100, 500, 1000, 2000, 3000, 4000, 4500, 4800, 5000, 6000, 8000, 10000, 50000, 100000];
gain = [-34.59, -28.79, -18.59, -13.53, -8.29, -5.59, -4.09, -3.52, -3.17, -3.08, -2.33, -1.43, -1.00, -0.09, -0.09]; % 電圧利得(dB)
phase = [NaN, NaN, 90, 80, 70, 60, 50, 45, 45.2, NaN, 40, 32, 27, 7, NaN]; % 位相差(度)

% NaNを補間する（スプライン補間を使用）
phase_interp = phase;
nan_idx = isnan(phase); % NaNのインデックスを取得
phase_interp(nan_idx) = interp1(frequency(~nan_idx), phase(~nan_idx), frequency(nan_idx), 'spline');

% 対数グラフで2つのy軸を作成
figure;
[ax, h1, h2] = plotyy(frequency, gain, frequency, phase_interp);

% 横軸のスケールを対数表示
set(ax(1), 'XScale', 'log');
set(ax(2), 'XScale', 'log');

% 軸ラベルの設定
xlabel('周波数 (Hz)');
ylabel(ax(1), '電圧利得 (dB)'); % 左側のy軸
ylabel(ax(2), '位相差 (°)');    % 右側のy軸

% グラフの線のスタイルを設定
set(h1, 'LineStyle', '-', 'Color', 'b', 'LineWidth', 2); % 電圧利得の線
set(h2, 'LineStyle', '--', 'Color', 'r', 'LineWidth', 2); % 補間された位相差の線

% 元のデータ点をプロット (NaNではないもののみプロット)
hold on;
plot(ax(2), frequency(~nan_idx), phase(~nan_idx), 'ro', 'MarkerFaceColor', 'r'); % 位相差のデータ点を表示

% タイトルの設定
title('周波数に対する電圧利得と位相差');

% 凡例の追加
legend([h1, h2], {'電圧利得 (dB)', '位相差 (°)'}, 'Location', 'best');

hold off;


