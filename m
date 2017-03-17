Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1corGs-0004Y9-PP
 for linux-mtd@lists.infradead.org; Fri, 17 Mar 2017 12:46:25 +0000
From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rahul Bedarkar <rahul.bedarkar@imgtec.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: [RFC 6/6] mtd: spi-nor: enable OTP support for s25fl016k
Date: Fri, 17 Mar 2017 18:13:56 +0530
Message-ID: <1489754636-21461-7-git-send-email-rahul.bedarkar@imgtec.com>
In-Reply-To: <1489754636-21461-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1489754636-21461-1-git-send-email-rahul.bedarkar@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

s25fl016k has 3 OTP areas of 256 bytes each. First bank starts at
0x1000, second at 0x2000 and third at 0x3000.

When OTP area is unlocked, it can be rewritten. Lock bit for first,
second and third area is bit 3, 4, 5 of Status Register 2.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index a91fa4c..0fd7573 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1077,7 +1077,11 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "s25sl064a",  INFO(0x010216,      0,  64 * 1024, 128, 0) },
 	{ "s25fl004k",  INFO(0xef4013,      0,  64 * 1024,   8, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25fl008k",  INFO(0xef4014,      0,  64 * 1024,  16, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25fl016k",  INFO(0xef4015,      0,  64 * 1024,  32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{
+		"s25fl016k", INFO(0xef4015, 0, 64 * 1024, 32,
+		SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_OTP)
+		OTP_INFO(256, 3, 0x1000, 0x1000)
+	},
 	{ "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128, SECT_4K) },
 	{ "s25fl116k",  INFO(0x014015,      0,  64 * 1024,  32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25fl132k",  INFO(0x014016,      0,  64 * 1024,  64, SECT_4K) },
@@ -1586,6 +1590,28 @@ static loff_t spi_nor_otp_offset_to_addr(struct spi_nor *nor, loff_t offset)
 	return addr;
 }
 
+static int winbond_get_user_otp_info(struct mtd_info *mtd, size_t len,
+	size_t *retlen, struct otp_info *otpinfo)
+{
+	int i, ret;
+	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+
+	ret = read_cr(nor);
+	if (ret < 0)
+		return ret;
+
+#define WINBOND_SR2_LB1_BIT	3	/* Lock bit for security register 1 */
+
+	for (i = 0; i < nor->n_otps; i++) {
+		otpinfo[i].start = i * nor->otp_size;
+		otpinfo[i].length = nor->otp_size;
+		otpinfo[i].locked = !!(ret & BIT(WINBOND_SR2_LB1_BIT + i));
+	}
+
+	*retlen = nor->n_otps * sizeof(*otpinfo);
+	return 0;
+}
+
 static ssize_t spi_nor_read_security_reg(struct spi_nor *nor, loff_t from,
 	size_t len, u_char *buf)
 {
@@ -1783,6 +1809,14 @@ static int spi_nor_set_otp_info(struct spi_nor *nor,
 	}
 
 	switch (JEDEC_MFR(info)) {
+	case SNOR_MFR_WINBOND:
+		nor->otp_read_opcode = 0x48;
+		nor->otp_program_opcode = 0x42;
+		nor->otp_erase_opcode = 0x44;
+		nor->otp_read_dummy = 8;
+
+		mtd->_get_user_prot_info = winbond_get_user_otp_info;
+		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.6.2
