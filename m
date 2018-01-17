Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eblxi-0005tA-KL
 for linux-mtd@lists.infradead.org; Wed, 17 Jan 2018 11:33:00 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 3/8] mtd: nand: mxc: Add buffer argument to copy_spare
Date: Wed, 17 Jan 2018 12:32:08 +0100
Message-Id: <20180117113213.15455-4-s.hauer@pengutronix.de>
In-Reply-To: <20180117113213.15455-1-s.hauer@pengutronix.de>
References: <20180117113213.15455-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With following patches we will have to copy the spare data to/from
other buffers, so add the buffer as argument to copy_spare().

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 019c58579dbc..ab9cd45237d3 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -262,14 +262,14 @@ static void memcpy16_toio(void __iomem *trg, const void *src, int size)
  * holds a page in natural order, i.e. writesize bytes data + oobsize bytes
  * spare) and the NFC buffer.
  */
-static void copy_spare(struct mtd_info *mtd, bool bfrom)
+static void copy_spare(struct mtd_info *mtd, bool bfrom, void *buf)
 {
 	struct nand_chip *this = mtd_to_nand(mtd);
 	struct mxc_nand_host *host = nand_get_controller_data(this);
 	u16 i, oob_chunk_size;
 	u16 num_chunks = mtd->writesize / 512;
 
-	u8 *d = host->data_buf + mtd->writesize;
+	u8 *d = buf;
 	u8 __iomem *s = host->spare0;
 	u16 sparebuf_size = host->devtype_data->spare_len;
 
@@ -1295,7 +1295,7 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 
 		memcpy32_fromio(host->data_buf, host->main_area0,
 				mtd->writesize);
-		copy_spare(mtd, true);
+		copy_spare(mtd, true, host->data_buf + mtd->writesize);
 		break;
 
 	case NAND_CMD_SEQIN:
@@ -1314,7 +1314,7 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 
 	case NAND_CMD_PAGEPROG:
 		memcpy32_toio(host->main_area0, host->data_buf, mtd->writesize);
-		copy_spare(mtd, false);
+		copy_spare(mtd, false, host->data_buf + mtd->writesize);
 		host->devtype_data->send_page(mtd, NFC_INPUT);
 		host->devtype_data->send_cmd(host, command, true);
 		WARN_ONCE(column != -1 || page_addr != -1,
-- 
2.11.0
