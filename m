Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QMdZ1-000837-7e
	for linux-mtd@lists.infradead.org; Wed, 18 May 2011 10:01:12 +0000
Message-ID: <4DD3B4C2.30301@nokia.com>
Date: Wed, 18 May 2011 13:00:02 +0100
From: maxin <john.maxin@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] drivers: mtd: mtdswap: fix possible null dereference
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This patch fixes the possible null dereference of the variable "oinfo"
Thanks to Coverity for spotting this.

Signed-off-by: Maxin B. John <john.maxin@nokia.com>
---
diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index fed215c..863987c 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -1450,7 +1450,12 @@ static void mtdswap_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	}
 
 	oinfo = mtd->ecclayout;
-	if (!mtd->oobsize || !oinfo || oinfo->oobavail < MTDSWAP_OOBSIZE) {
+	if (!oinfo) {
+		printk(KERN_ERR "Not enough free bytes available for ECC");
+		return;
+	}
+
+	if (!mtd->oobsize || oinfo->oobavail < MTDSWAP_OOBSIZE) {
 		printk(KERN_ERR "%s: Not enough free bytes in OOB, "
 			"%d available, %zu needed.\n",
 			MTDSWAP_PREFIX, oinfo->oobavail, MTDSWAP_OOBSIZE);
