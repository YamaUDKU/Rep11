% 定数の定義
C = 1e-7;   % キャパシタンス (ファラド)
L = 1e-2;   % インダクタンス (ヘンリー)
R = 100;    % 抵抗 (オーム)

% より広い周波数範囲と高解像度でプロット
omega = logspace(2, 7, 5000); % 100 rad/sから10,000,000 rad/sまで

% 計算とプロットは同じ
Z = 1 ./ ( (R * (1 - omega.^2 * C * L)) ./ (1i * omega * L) + 1 );

figure;
plot(real(Z), imag(Z), 'b-');
xlabel('実部 Re(Z)');
ylabel('虚部 Im(Z)');
title('Z(\omega) の複素平面上の詳細な軌跡');
grid on;
