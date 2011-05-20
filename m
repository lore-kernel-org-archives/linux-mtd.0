Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QNP53-0006F5-61
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 12:45:27 +0000
Message-ID: <4DD67E3A.4090802@nokia.com>
Date: Fri, 20 May 2011 15:44:10 +0100
From: "Maxin B. John" <john.maxin@nokia.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] drivers: mtd: mtdswap: fix possible null dereference
References: <4DD3B4C2.30301@nokia.com> <1305870365.2630.92.camel@localhost>	
	<4DD65673.8080801@nokia.com> <1305886801.2630.132.camel@localhost>	
	<4DD66B11.4070605@nokia.com> <1305893433.2630.142.camel@localhost>
In-Reply-To: <1305893433.2630.142.camel@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>, linux-mtd@lists.infradead.org,
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
index fed215c..fd78853 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -1450,7 +1450,13 @@ static void mtdswap_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	}
 
 	oinfo = mtd->ecclayout;
-	if (!mtd->oobsize || !oinfo || oinfo->oobavail < MTDSWAP_OOBSIZE) {
+	if (!oinfo) {
+		printk(KERN_ERR "%s: mtd%d does not have OOB\n",
+			MTDSWAP_PREFIX, mtd->index);
+		return;
+	}
+
+	if (!mtd->oobsize || oinfo->oobavail < MTDSWAP_OOBSIZE) {
 		printk(KERN_ERR "%s: Not enough free bytes in OOB, "
 			"%d available, %zu needed.\n",
 			MTDSWAP_PREFIX, oinfo->oobavail, MTDSWAP_OOBSIZE);
