Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JdU8b-0004YU-5i
	for linux-mtd@lists.infradead.org; Sun, 23 Mar 2008 17:37:41 +0000
Date: Sun, 23 Mar 2008 18:37:26 +0100
From: Sebastian Siewior <bigeasy@tglx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH RESEND] [MTD] [NAND] fix possible Ooops in rfc_from4
Message-ID: <20080323173726.GB24462@www.tglx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Cc: Andrew Morton <akpm@linux-foundation.org>, Paul Mundt <lethal@linux-sh.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I found this while I was looking how the rs_lib is working.
The rs_decoder is initialized _after_ the nand core code read the BBT
table and _after_ the partition table has been added. The driver has a
private BBT description which is in located in flash data so we Ooops
if there is a bit flip _or_ if a bit flips while reading the partition
table.
This patch moves the initialization of the rs_lib before the first
possible access by nand core.

Signed-off-by: Sebastian Siewior <bigeasy@linutronix.de>
---
 drivers/mtd/nand/rtc_from4.c |   50 ++++++++++++++++++++++++-----------------
 1 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/nand/rtc_from4.c b/drivers/mtd/nand/rtc_from4.c
index 0f6ac25..26f8821 100644
--- a/drivers/mtd/nand/rtc_from4.c
+++ b/drivers/mtd/nand/rtc_from4.c
@@ -478,6 +478,7 @@ static int __init rtc_from4_init(void)
 	struct nand_chip *this;
 	unsigned short bcr1, bcr2, wcr2;
 	int i;
+	int ret;
 
 	/* Allocate memory for MTD device structure and private data */
 	rtc_from4_mtd = kmalloc(sizeof(struct mtd_info) + sizeof(struct nand_chip), GFP_KERNEL);
@@ -537,6 +538,22 @@ static int __init rtc_from4_init(void)
 	this->ecc.hwctl = rtc_from4_enable_hwecc;
 	this->ecc.calculate = rtc_from4_calculate_ecc;
 	this->ecc.correct = rtc_from4_correct_data;
+
+	/* We could create the decoder on demand, if memory is a concern.
+	 * This way we have it handy, if an error happens
+	 *
+	 * Symbolsize is 10 (bits)
+	 * Primitve polynomial is x^10+x^3+1
+	 * first consecutive root is 0
+	 * primitve element to generate roots = 1
+	 * generator polinomial degree = 6
+	 */
+	rs_decoder = init_rs(10, 0x409, 0, 1, 6);
+	if (!rs_decoder) {
+		printk(KERN_ERR "Could not create a RS decoder\n");
+		ret = -ENOMEM;
+		goto err_1;
+	}
 #else
 	printk(KERN_INFO "rtc_from4_init: using software ECC detection.\n");
 
@@ -549,8 +566,8 @@ static int __init rtc_from4_init(void)
 
 	/* Scan to find existence of the device */
 	if (nand_scan(rtc_from4_mtd, RTC_FROM4_MAX_CHIPS)) {
-		kfree(rtc_from4_mtd);
-		return -ENXIO;
+		ret = -ENXIO;
+		goto err_2;
 	}
 
 	/* Perform 'device recovery' for each chip in case there was a power loss. */
@@ -566,28 +583,19 @@ static int __init rtc_from4_init(void)
 #endif
 
 	/* Register the partitions */
-	add_mtd_partitions(rtc_from4_mtd, partition_info, NUM_PARTITIONS);
+	ret = add_mtd_partitions(rtc_from4_mtd, partition_info, NUM_PARTITIONS);
+	if (ret)
+		goto err_3;
 
-#ifdef RTC_FROM4_HWECC
-	/* We could create the decoder on demand, if memory is a concern.
-	 * This way we have it handy, if an error happens
-	 *
-	 * Symbolsize is 10 (bits)
-	 * Primitve polynomial is x^10+x^3+1
-	 * first consecutive root is 0
-	 * primitve element to generate roots = 1
-	 * generator polinomial degree = 6
-	 */
-	rs_decoder = init_rs(10, 0x409, 0, 1, 6);
-	if (!rs_decoder) {
-		printk(KERN_ERR "Could not create a RS decoder\n");
-		nand_release(rtc_from4_mtd);
-		kfree(rtc_from4_mtd);
-		return -ENOMEM;
-	}
-#endif
 	/* Return happy */
 	return 0;
+err_3:
+	nand_release(rtc_from4_mtd);
+err_2:
+	free_rs(rs_decoder);
+err_1:
+	kfree(rtc_from4_mtd);
+	return ret;
 }
 
 module_init(rtc_from4_init);
-- 
1.5.4.3
