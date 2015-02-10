Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1YLG2w-0008KI-1F
 for linux-mtd@lists.infradead.org; Tue, 10 Feb 2015 19:00:36 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/6] mtd: mxc-nand: Do the word to byte mangling in the
 read_byte callback
Date: Tue, 10 Feb 2015 19:59:57 +0100
Message-Id: <1423594800-24214-4-git-send-email-u.kleine-koenig@pengutronix.de>
In-Reply-To: <1423594800-24214-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1423594800-24214-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When the hardware operates in 16 bit mode it always reads 16 bits even
for operations that only have the lower 8 bits defined. So the upper
bits must be discarded. Do this in the read_byte callback instead of
when reading the NAND id to support reading byte wise more than 5 bytes
and at other occations (like reading the ONFI parameter page).

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c | 34 ++++++++++------------------------
 1 file changed, 10 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index d9637ae34719..aa98a0dddcfb 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -552,30 +552,17 @@ static void send_page_v1(struct mtd_info *mtd, unsigned int ops)
 
 static void send_read_id_v3(struct mxc_nand_host *host)
 {
-	struct nand_chip *this = &host->nand;
-
 	/* Read ID into main buffer */
 	writel(NFC_ID, NFC_V3_LAUNCH);
 
 	wait_op_done(host, true);
 
 	memcpy32_fromio(host->data_buf, host->main_area0, 16);
-
-	if (this->options & NAND_BUSWIDTH_16) {
-		/* compress the ID info */
-		host->data_buf[1] = host->data_buf[2];
-		host->data_buf[2] = host->data_buf[4];
-		host->data_buf[3] = host->data_buf[6];
-		host->data_buf[4] = host->data_buf[8];
-		host->data_buf[5] = host->data_buf[10];
-	}
 }
 
 /* Request the NANDFC to perform a read of the NAND device ID. */
 static void send_read_id_v1_v2(struct mxc_nand_host *host)
 {
-	struct nand_chip *this = &host->nand;
-
 	/* NANDFC buffer 0 is used for device ID output */
 	writew(host->active_cs << 4, NFC_V1_V2_BUF_ADDR);
 
@@ -585,15 +572,6 @@ static void send_read_id_v1_v2(struct mxc_nand_host *host)
 	wait_op_done(host, true);
 
 	memcpy32_fromio(host->data_buf, host->main_area0, 16);
-
-	if (this->options & NAND_BUSWIDTH_16) {
-		/* compress the ID info */
-		host->data_buf[1] = host->data_buf[2];
-		host->data_buf[2] = host->data_buf[4];
-		host->data_buf[3] = host->data_buf[6];
-		host->data_buf[4] = host->data_buf[8];
-		host->data_buf[5] = host->data_buf[10];
-	}
 }
 
 static uint16_t get_dev_status_v3(struct mxc_nand_host *host)
@@ -719,9 +697,17 @@ static u_char mxc_nand_read_byte(struct mtd_info *mtd)
 	if (host->status_request)
 		return host->devtype_data->get_dev_status(host) & 0xFF;
 
-	ret = *(uint8_t *)(host->data_buf + host->buf_start);
-	host->buf_start++;
+	if (nand_chip->options & NAND_BUSWIDTH_16) {
+		/* only take the lower byte of each word */
+		ret = *(uint16_t *)(host->data_buf + host->buf_start);
+
+		host->buf_start += 2;
+	} else {
+		ret = *(uint8_t *)(host->data_buf + host->buf_start);
+		host->buf_start++;
+	}
 
+	pr_debug("%s: ret=0x%hhx (start=%u)\n", __func__, ret, host->buf_start);
 	return ret;
 }
 
-- 
2.1.4
