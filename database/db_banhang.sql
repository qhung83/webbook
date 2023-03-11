-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 05, 2023 lúc 04:02 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_banhang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `BrandID` int(11) UNSIGNED NOT NULL,
  `BrandName` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`BrandID`, `BrandName`) VALUES
(19, 'Phụ Nữ Việt Nam'),
(18, 'NXB Hội Nhà Văn'),
(20, 'A Crazy Mind'),
(21, 'Higashino Keigo'),
(22, 'Duncan Bannatyne'),
(23, 'Harvard Business Review'),
(24, 'Yoshichi Shimada, Saburo Ishikawa'),
(25, 'Park In Seo, Choi Sang');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `CatID` int(11) UNSIGNED NOT NULL,
  `CatName` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`CatID`, `CatName`) VALUES
(1, 'Manga-comic'),
(2, 'Kinh tế'),
(3, 'Văn học');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `details`
--

CREATE TABLE `details` (
  `DetailID` int(11) UNSIGNED NOT NULL,
  `ProID` int(11) NOT NULL,
  `Duongkinhmat` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Chongnuoc` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Chatlieumat` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Nangluongsudung` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Sizeday` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Chatlieuday` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Chatlieuvo` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Kieudang` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Xuatxu` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Chedobaohanh` varchar(200) CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetails`
--

CREATE TABLE `orderdetails` (
  `ID` int(11) UNSIGNED NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ProID` int(11) NOT NULL,
  `TenSanPham` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` bigint(20) NOT NULL,
  `Amount` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) UNSIGNED NOT NULL,
  `OrderDate` datetime NOT NULL DEFAULT current_timestamp(),
  `UserID` int(11) NOT NULL,
  `Tenkhachhang` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Total` bigint(20) NOT NULL,
  `Phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Trangthai` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Đang chờ xử lý'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `ProID` int(11) UNSIGNED NOT NULL,
  `ProName` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci NOT NULL,
  `Price` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Viewer` int(11) NOT NULL,
  `Sold` int(11) NOT NULL,
  `Date` datetime DEFAULT current_timestamp(),
  `CatID` int(11) NOT NULL,
  `BrandID` int(11) NOT NULL,
  `images` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`ProID`, `ProName`, `Description`, `Price`, `Quantity`, `Viewer`, `Sold`, `Date`, `CatID`, `BrandID`, `images`) VALUES
(110, 'Người Bà Tài Giỏi Vùng Saga - Tập 2', 'Người bà tài giỏi vùng Saga 2 – Đứa trẻ Saga đích thực  Năm Chiêu Hòa thứ 33 (1958), cậu bé Akihiro được mẹ gửi từ Hiroshima tới sống cùng bà ngoại tại vùng quê Saga nghèo khó. Kể từ đó cuộc sống của Akihiro hoàn toàn thay đổi. Từ một đứa trẻ nhõng nhẽo mít ướt, giờ đây Akihiro đã biết tự làm rất nhiều việc: thổi cơm, xách nước, quét dọn, vớt thức ăn ngoài sông,…', 45000, 0, 0, 0, '2023-01-05 21:24:48', 1, 24, 'anh33.jpg'),
(109, 'Người Bà Tài Giỏi Vùng Saga - Tập 1', 'NGƯỜI BÀ TÀI GIỎI VÙNG SAGA – Tạm biệt Hiroshima, xin chào Saga!  Bộ truyện được họa sĩ Saburo Ishikawa minh họa dựa trên cuốn hồi ký của nghệ sĩ hài Yoshichi Shimada, kể về tuổi thơ bên người bà tại vùng đất Saga cằn cỗi, nghèo khó', 52000, 0, 0, 0, '2023-01-05 21:24:00', 1, 24, 'anh32.jpg'),
(108, 'Người Bà Tài Giỏi Vùng Saga - Tập 7 ', 'Người bà tài giỏi vùng Saga 7 – Vị khách ngoại quốc xuất hiện!  Cậu bé Akihiro vẫn đang sống cùng bà ngoại ở vùng ngoại ô Saga nghèo khó mà ấm áp tình người. Tuy rất nhớ người mẹ thân yêu ở Hiroshima, nhưng sự xuất hiện của những vị khách “dữ thần” từ nơi khác đến đã khiến cho Akihiro chẳng còn thời gian để buồn phiền nữa.', 52000, 0, 0, 0, '2023-01-05 21:22:58', 1, 24, 'anh31.jpg'),
(107, 'HBR On - AI Và Kỷ Nguyên Máy Móc Mới', 'Cuốn sách bao gồm các bài viết về chủ đề trí tuệ nhân tạo (AI) và các ứng dụng của trí tuệ nhân tạo cũng như thuật toán trong cuộc sống và công việc.  Cuốn sách cho bạn biết:  AI đang được ứng dụng vào doanh nghiệp như thế nào.', 188000, 0, 0, 0, '2023-01-05 21:20:41', 2, 23, 'anh23.jpg'),
(106, 'Tiền Đẻ Ra Tiền - Đầu Tư Tài Chính Thông Minh', 'Sau sự thành công của hai cuốn sách “Thức tỉnh và thay đổi cuộc đời bạn: Bí quyết thành công của triệu phú Anh” và “Quản lý thời gian thông minh của người thành đạt: Bí quyết thành công của triệu phú Anh” là những câu chuyện, những lời khuyên dựa trên những kinh nghiệm phong phú của cuộc đời mình và nhằm mục đích truyền cảm hứng động lực làm giàu cho mọi công dân đều có thể trở thành triệu phú, thì triệu phú người Anh và tác giả của nhiều đầu sách nổi tiếng Duncan Bannatyne đã cho ra mắt cuốn sách “ Tiền Đẻ Ra Tiền – Đầu Tư Tài Chính Thông Minh”.', 96000, 0, 0, 0, '2023-01-05 21:19:06', 2, 22, 'anh22.jpg'),
(101, 'Đầu Tư Chứng Khoán: Chơi Trò May Rủi Hay Tích Lũy Tài Chính', 'Cuốn sách “Đầu tư chứng khoán: Chơi trò may rủi hay tích lũy tài chính?” giúp cho độc giả hiểu rõ những kiến thức cơ bản về đầu tư: cách tính tỷ suất lợi nhuận, những rủi ro trong đầu tư chứng khoán, các công cụ đầu tư, sự khác nhau giữa giá và giá trị, các chiến lược đầu tư, và đặc biệt là sự khác biệt giữa đầu tư may rủi và đầu tư có phương pháp để tích lũy tài chính.', 240000, 0, 0, 0, '2023-01-05 16:50:00', 2, 18, 'anh21.jpg'),
(100, 'Ngôi Nhà Của Người Cá Say Ngủ (Tái Bản 2020)', 'Ngôi nhà của người cá say ngủ là tác phẩm thứ hai của nhà văn Higashino Keigo được xuất bản trong năm 2015, cũng là tác phẩm thứ hai kỷ niệm 30 năm cầm bút của ông. Trong tác phẩm này, Keigo đã lấn sâu ngòi bút của mình vào một đề tài tâm lý xã hội và y học khó nhằn, để lại trong lòng người đọc rất nhiều trăn trở.', 103000, 0, 0, 0, '2023-01-05 16:11:17', 3, 21, 'anh15.jpg'),
(99, 'Điều Kỳ Diệu Của Tiệm Tạp Hóa Namiya (Tái Bản 2018)', 'Một đêm vội vã lẩn trốn sau phi vụ khoắng đồ nhà người, Atsuya, Shota và Kouhei đã rẽ vào lánh tạm trong một căn nhà hoang bên con dốc vắng người qua lại. Căn nhà có vẻ khi xưa là một tiệm tạp hóa với biển hiệu cũ kỹ bám đầy bồ hóng, khiến người ta khó lòng đọc được trên đó viết gì. Định bụng nghỉ tạm một đêm rồi sáng hôm sau chuồn sớm, cả ba không ngờ chờ đợi cả bọn sẽ là một đêm không ngủ, với bao điều kỳ bí bắt đầu từ một phong thư bất ngờ gửi đến…', 84000, 0, 0, 0, '2023-01-05 16:10:14', 3, 21, 'anh14.jpg'),
(102, 'Cây Cam Ngọt Của Tôi', '“Vị chua chát của cái nghèo hòa trộn với vị ngọt ngào khi khám phá ra những điều khiến cuộc đời này đáng sống... một tác phẩm kinh điển của Brazil.” - Booklist  “Một cách nhìn cuộc sống gần như hoàn chỉnh từ con mắt trẻ thơ… có sức mạnh sưởi ấm và làm tan nát cõi lòng, dù người đọc ở lứa tuổi nào.” - The National', 75000, 0, 0, 0, '2023-01-05 21:15:22', 3, 18, 'cay_cam.jpg'),
(103, 'Yêu Những Ngày Nắng Chẳng Ghét Những Ngày Mưa', 'Sau thành công của “Tô bình yên vẽ hạnh phúc” và “Mình chỉ là người bình thường”, chàng họa sĩ nổi tiếng đa tài Kulzsc đã quay trở lại với “Yêu những ngày nắng Chẳng ghét những ngày mưa”. Cuốn sách là sự kết hợp hài hòa và thú vị của thể loại Sách tản văn và Sách tô màu.  Đặc biệt hơn cả, “Yêu những ngày nắng Chẳng ghét những ngày mưa” còn là hành trình VẼ ĐỂ CHỮA LÀNH. Qua 168 trang sách, Kulzsc khéo léo dẫn bạn vào thế giới đầy màu sắc với đầy đủ cung bậc cảm xúc. Nơi bạn có thể thoải mái bật cười nhưng đồng thời cũng có thể thả lỏng để nỗi buồn trôi đi.', 102000, 0, 0, 0, '2023-01-05 21:16:25', 3, 19, 'anh11.jpg'),
(98, 'Có Ai Ở Đó Không?', '\"CÓ AI Ở ĐÓ KHÔNG\" – cuốn sách giúp bạn giải thoát khỏi “giếng sâu” của tâm hồn  Có bao giờ bạn giật mình tỉnh dậy giữa đêm, thảng thốt bật lên tiếng gọi ai đó nhưng chợt nhận ra bản thân chẳng có một ai để cất lên tiếng gọi ấy không?  Có bao giờ bạn tự mình thụt vào vỏ ốc rồi đắm mình xuống đại dương rộng lớn của cuộc đời, tưởng như muốn trốn tránh hết thảy nhưng sâu thẳm trong tâm hồn vẫn mong chờ một cái nắm tay níu giữ không?  Cuốn sách mới nhất từ A Crazy Mind là một ấn phẩm mang đầy những câu hỏi như vậy.', 77000, 0, 0, 0, '2023-01-05 16:08:51', 3, 19, 'anh13.jpg'),
(104, 'Những Đêm Không Ngủ Những Ngày Chậm Trôi', '“Những đêm không ngủ, những ngày chậm trôi” đại diện cho một hành tinh mới - nơi nỗi đau tinh thần được đưa ra ánh sáng và chữa lành.  Cuốn sách là tập hợp những câu chuyện có thật của những số phận khác nhau đang gặp phải các vấn đề về tâm lý: trầm cảm, rối loạn lo âu, rối loạn lưỡng cực… và những người đang học tập và làm việc trong ngành tâm lý học. ', 68000, 0, 0, 0, '2023-01-05 21:17:11', 3, 20, 'anh12.jpg'),
(105, 'Những Đêm Không Ngủ Những Ngày Chậm Trôi', '“Những đêm không ngủ, những ngày chậm trôi” đại diện cho một hành tinh mới - nơi nỗi đau tinh thần được đưa ra ánh sáng và chữa lành.  Cuốn sách là tập hợp những câu chuyện có thật của những số phận khác nhau đang gặp phải các vấn đề về tâm lý: trầm cảm, rối loạn lo âu, rối loạn lưỡng cực… và những người đang học tập và làm việc trong ngành tâm lý học. ', 68000, 0, 0, 0, '2023-01-05 21:18:32', 3, 20, 'anh12.jpg'),
(111, 'Đội Quân Nhí Nhố - Tập 38', 'Là một bộ manhwa hài hước của Hàn Quốc do hai tác giả Park In-seo và Choi Sang sáng tác. Nhân vật chính của truyện là các thầy trò cực kỳ nhí nhố, với các tình tiết hài không đụng hàng luôn làm độc giả bất ngờ, đồng thời liên tục xuất hiện các nhân vật mới. Đội quân nhí nhố là bộ tranh truyện hài hước, vui nhộn của Hàn Quốc, được xem là \"đối thủ xứng tầm\" so với Ô Long Viện của Đài Loan. Nhân vật chính của bộ truyện cũng là các thầy trò cực kỳ phá phách, nghịch ngợm, luôn bày ra hàng đống trò quậy phá không-đụng-hàng.', 20000, 0, 0, 0, '2023-01-05 21:26:16', 1, 25, 'anh34.jpg'),
(112, 'Đội Quân Nhí Nhố - Tập 28', 'Là một bộ manhwa hài hước của Hàn Quốc do hai tác giả Park In-seo và Choi Sang sáng tác. Nhân vật chính của truyện là các thầy trò cực kỳ nhí nhố, với các tình tiết hài không đụng hàng luôn làm độc giả bất ngờ, đồng thời liên tục xuất hiện các nhân vật mới. Đội quân nhí nhố là bộ tranh truyện hài hước, vui nhộn của Hàn Quốc, được xem là \"đối thủ xứng tầm\" so với Ô Long Viện của Đài Loan. Nhân vật chính của bộ truyện cũng là các thầy trò cực kỳ phá phách, nghịch ngợm, luôn bày ra hàng đống trò quậy phá không-đụng-hàng.', 20000, 0, 0, 0, '2023-01-05 21:27:02', 1, 25, 'anh35.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('Io7OdHKsVGv_kF12V-CHLNEU8OkPUeC2', 1672998782, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":true,\"user\":{\"f_ID\":1,\"f_Username\":\"admin\",\"f_Password\":\"1\",\"f_Name\":\"Admin\",\"f_Email\":\"admin1011@gmail.com\",\"f_DOB\":\"2000-10-10\",\"f_Permission\":\"admin\"},\"cart\":[{\"ProId\":\"101\",\"Quantity\":1},{\"ProId\":\"100\",\"Quantity\":0}]}'),
('Lkj7yua0mlZkiCyJksvvkv5t2Geh4kwR', 1673013541, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":false}'),
('PviIG6medEPm4s2FvhgpOak1tK9qrhsY', 1672998407, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":false}'),
('jmKtwbH32mtZgiA5ZhqvntEy77fo7pny', 1673013921, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":true,\"user\":{\"f_ID\":1,\"f_Username\":\"admin\",\"f_Password\":\"1\",\"f_Name\":\"Admin\",\"f_Email\":\"admin1011@gmail.com\",\"f_DOB\":\"2000-10-10\",\"f_Permission\":\"admin\"},\"cart\":[]}'),
('qVFhwjPrPkg7GPROC7ZsCTjOVapJ4Uor', 1673017207, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":true,\"user\":{\"f_ID\":1,\"f_Username\":\"admin\",\"f_Password\":\"1\",\"f_Name\":\"Admin\",\"f_Email\":\"admin1011@gmail.com\",\"f_DOB\":\"2000-10-10\",\"f_Permission\":\"admin\"},\"cart\":[{\"ProId\":\"111\",\"Quantity\":2}]}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `f_ID` int(11) NOT NULL,
  `f_Username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_Password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `f_Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_DOB` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `f_Permission` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'khachhang'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`f_ID`, `f_Username`, `f_Password`, `f_Name`, `f_Email`, `f_DOB`, `f_Permission`) VALUES
(1, 'admin', '1', 'Admin', 'admin1011@gmail.com', '2000-10-10', 'admin'),
(3, 'quanghuy', '1', 'Bùi Quang Huy', 'buiquanghuy1011@gmail.com', '10-11-2000', 'khachhang'),
(23, 'buihuy', '1', 'Bùi Quang Huy', ',buiquanghuy1011@gmail.com', '2021-11-10T00:00', 'khachhang');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`BrandID`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CatID`);

--
-- Chỉ mục cho bảng `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`DetailID`);

--
-- Chỉ mục cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProID`);

--
-- Chỉ mục cho bảng `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`f_ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `BrandID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `CatID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `details`
--
ALTER TABLE `details`
  MODIFY `DetailID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `ProID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `f_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
