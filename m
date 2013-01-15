Received: from bsmtp1.bon.at ([213.33.87.15] helo=bsmtp.bon.at)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tv8si-0000Cb-1K
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2013 15:56:57 +0000
From: Roman Schneider <schneider@at.festo.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: mxc_nand: compress ID info for send_read_id_v3
Date: Tue, 15 Jan 2013 16:56:24 +0100
Message-Id: <1358265384-23138-1-git-send-email-schneider@at.festo.com>
Cc: Roman Schneider <schneider@at.festo.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

---
 Also compress the id in case of a v3 NAND flash controller (i.mx51, i.mx53)
 and 16Bit buswidth.

 drivers/mtd/nand/mxc_nand.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 45204e4..20e1241 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -530,12 +530,23 @@ static void send_page_v1(struct mtd_info *mtd, unsigned int ops)
 
 static void send_read_id_v3(struct mxc_nand_host *host)
 {
+	struct nand_chip *this = &host->nand;
+
 	/* Read ID into main buffer */
 	writel(NFC_ID, NFC_V3_LAUNCH);
 
 	wait_op_done(host, true);
 
 	memcpy32_fromio(host->data_buf, host->main_area0, 16);
+
+	if (this->options & NAND_BUSWIDTH_16) {
+		/* compress the ID info */
+		host->data_buf[1] = host->data_buf[2];
+		host->data_buf[2] = host->data_buf[4];
+		host->data_buf[3] = host->data_buf[6];
+		host->data_buf[4] = host->data_buf[8];
+		host->data_buf[5] = host->data_buf[10];
+	}
 }
 
 /* Request the NANDFC to perform a read of the NAND device ID. */
-- 
1.7.2.5
