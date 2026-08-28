<h1><span style="color:#1f618d">LPF_FIR</span></h1>

<p><strong>Đồ án môn học 1</strong></p>
<p>Thiết kế bộ lọc thông thấp đáp ứng xung hữu hạn với tần số cắt <span style="color:#e67e22">150Hz</span> cho mục đích lọc nhiễu cho tín hiệu điện tim <span style="color:#e74c3c">ECG</span>.</p>

<hr>

<h3><span style="color:#2e4053">QUY TRÌNH THỰC HIỆN!!!</span></h3>

<p><span style="color:#27ae60"><strong>Phần 1:</strong></span> Mở thư mục <em>Pre-Process</em> và tiến hành tải về sau đó chạy file Python tên <span style="color:#2980b9">WFDB_toolbox_FOR_ECG.py</span> để chạy các mẫu data 16 bit được lưu từ thư viện data của datasheet <em>PTB-XL</em> về. Sau khi đã chạy xong thì sẽ có 1 file txt là file tín hiệu đó nhưng đo ở kênh <strong>V4</strong> ở dạng số bù 2 với kiểu dấu chấm tĩnh <strong>Q4.12</strong>, sau đó lại chạy tiếp file <span style="color:#2980b9">tao_nhieu.py</span> để có được 1 data đã được cộng nhiễu ban đầu. Các code Python này là thuộc thư viện toolbox WFDB của <em>Physionet</em> tạo ra nhằm truy xuất dữ liệu của datasheet.</p>

<p><span style="color:#27ae60"><strong>Phần 2:</strong></span> Code <strong>Verilog</strong>, ở đây có 2 thư mục là <em>Source</em> và <em>Testbench</em>, tiến hành import vào Vivado như thường và chạy <span style="color:#8e44ad">toptest</span> để có thể chạy ở Module cao nhất và <span style="color:#8e44ad">TB_toptest</span> là testcase cao nhất.</p>

<p><span style="color:#27ae60"><strong>Phần 3:</strong></span> Code <strong>Matlab</strong> và dùng <strong>Simulink</strong> để so sánh 2 loại mô phỏng, mở file <span style="color:#16a085">"kiemtra_sum_test.m"</span> trong thư mục <em>Matlab</em>, tiến hành chạy lần đầu để nạp giá trị vào Simulink qua khối <em>From.workspace</em> và chạy <span style="color:#16a085">"mophong_1.mat"</span> là workspace có chứa sẵn 21 hệ số của bộ lọc cho khối <em>LPF_Block</em> trong Simulink. Tiến hành mở thư mục <em>Simulink</em> và chạy <span style="color:#16a085">"final_2.slx"</span> để mở mô phỏng, tiến hành chạy và sau đó quay về <span style="color:#16a085">"kiemtra_sum_test.m"</span> để kiểm tra và so sánh 2 dạng mô phỏng.</p>

<hr>

<p>Phần thư mục <em>Matlab</em> đã bao gồm FilterDesigner được cấu hình sẵn tên là <span style="color:#d35400">Heso_final.fda</span></p>
