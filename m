Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OTXqX-0007dW-NT
	for linux-mtd@lists.infradead.org; Tue, 29 Jun 2010 10:15:18 +0000
Received: by fxm20 with SMTP id 20so1488254fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 Jun 2010 03:15:16 -0700 (PDT)
From: Kulikov Vasiliy <segooon@gmail.com>
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Subject: [PATCH 05/25] mtd_dataflash: remove casts from void*
Date: Tue, 29 Jun 2010 14:15:13 +0400
Message-Id: <1277806514-30874-1-git-send-email-segooon@gmail.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, linux-kernel@vger.kernel.org,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
	"Robert P. J. Day" <rpjday@crashcourse.ca>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove unnesessary casts from void*.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/mtd/devices/mtd_dataflash.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 1981740..c5015cc 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -141,7 +141,7 @@ static int dataflash_waitready(struct spi_device *spi)
  */
 static int dataflash_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
-	struct dataflash	*priv = (struct dataflash *)mtd->priv;
+	struct dataflash	*priv = mtd->priv;
 	struct spi_device	*spi = priv->spi;
 	struct spi_transfer	x = { .tx_dma = 0, };
 	struct spi_message	msg;
@@ -231,7 +231,7 @@ static int dataflash_erase(struct mtd_info *mtd, struct erase_info *instr)
 static int dataflash_read(struct mtd_info *mtd, loff_t from, size_t len,
 			       size_t *retlen, u_char *buf)
 {
-	struct dataflash	*priv = (struct dataflash *)mtd->priv;
+	struct dataflash	*priv = mtd->priv;
 	struct spi_transfer	x[2] = { { .tx_dma = 0, }, };
 	struct spi_message	msg;
 	unsigned int		addr;
@@ -304,7 +304,7 @@ static int dataflash_read(struct mtd_info *mtd, loff_t from, size_t len,
 static int dataflash_write(struct mtd_info *mtd, loff_t to, size_t len,
 				size_t * retlen, const u_char * buf)
 {
-	struct dataflash	*priv = (struct dataflash *)mtd->priv;
+	struct dataflash	*priv = mtd->priv;
 	struct spi_device	*spi = priv->spi;
 	struct spi_transfer	x[2] = { { .tx_dma = 0, }, };
 	struct spi_message	msg;
@@ -515,7 +515,7 @@ static ssize_t otp_read(struct spi_device *spi, unsigned base,
 static int dataflash_read_fact_otp(struct mtd_info *mtd,
 		loff_t from, size_t len, size_t *retlen, u_char *buf)
 {
-	struct dataflash	*priv = (struct dataflash *)mtd->priv;
+	struct dataflash	*priv = mtd->priv;
 	int			status;
 
 	/* 64 bytes, from 0..63 ... start at 64 on-chip */
@@ -532,7 +532,7 @@ static int dataflash_read_fact_otp(struct mtd_info *mtd,
 static int dataflash_read_user_otp(struct mtd_info *mtd,
 		loff_t from, size_t len, size_t *retlen, u_char *buf)
 {
-	struct dataflash	*priv = (struct dataflash *)mtd->priv;
+	struct dataflash	*priv = mtd->priv;
 	int			status;
 
 	/* 64 bytes, from 0..63 ... start at 0 on-chip */
@@ -553,7 +553,7 @@ static int dataflash_write_user_otp(struct mtd_info *mtd,
 	const size_t		l = 4 + 64;
 	uint8_t			*scratch;
 	struct spi_transfer	t;
-	struct dataflash	*priv = (struct dataflash *)mtd->priv;
+	struct dataflash	*priv = mtd->priv;
 	int			status;
 
 	if (len > 64)
-- 
1.7.0.4
