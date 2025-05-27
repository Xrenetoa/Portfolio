% Başlangıç koşulları
x0 = 0; % İlk pozisyon X ekseninde (m)
z0 = 0; % İlk pozisyon Z ekseninde (m)
v0 = 100; % Rampa çıkış hızı (m/s)
theta0 = deg2rad(70); % İlk uçuş yolu açısı (radyan)
g = 9.801; % Yerçekimi ivmesi (m/s^2)
dt = 0.01; % Zaman adımı (s)
t_final = 50; % Toplam süre (s)

% İlk hız bileşenleri
vx0 = v0 * cos(theta0);
vz0 = v0 * sin(theta0);

% Zaman ve pozisyon vektörleri
t = 0:dt:t_final;
x = zeros(size(t));
z = zeros(size(t));
vx = vx0;
vz = vz0;

% Euler yöntemi ile çözüm
for i = 2:length(t)
    x(i) = x(i-1) + vx * dt;
    z(i) = z(i-1) + vz * dt;
    vz = vz - g * dt;
    
    % Roket yer yüzeyine çarptığında döngüyü sonlandır
    if z(i) < 0
        z(i) = 0;
        break;
    end
    
    % Tepe noktasına ulaşma kontrolü
    if t(i) >= 24.7
        vz = 0; % Tepe noktasında hız sıfırlanır
    end
end

% Sonuçları çizdirme
plot(x, z);
xlabel('Menzil [m]');
ylabel('Yükseklik [m]');
title('Roket Uçuş Yörüngesi');
