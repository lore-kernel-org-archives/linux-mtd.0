Received: from mail-da0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TJ3Xy-0001zU-JH
 for linux-mtd@lists.infradead.org; Tue, 02 Oct 2012 14:34:07 +0000
Received: by dajq27 with SMTP id q27so2095724daj.36
 for <linux-mtd@lists.infradead.org>; Tue, 02 Oct 2012 07:34:05 -0700 (PDT)
Message-ID: <506AFB49.6010109@gmail.com>
Date: Tue, 02 Oct 2012 20:03:45 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH 8/8] mtd_nandbiterrs: Replace msg macro with pr_info
References: <506AF985.30104@gmail.com>
In-Reply-To: <506AF985.30104@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Iwo Mergler <Iwo.Mergler@netcommwireless.com.au>,
 Brian Norris <computersforpeace@gmail.com>,
 Adrian Hunter <ext-adrian.hunter@nokia.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove msg macro and use pr_fmt to add the prefix

Signed-off-by: Vikram Narayanan <vikram186@gmail.com>
---
 drivers/mtd/tests/mtd_nandbiterrs.c |   68 +++++++++++++++++-----------------
 1 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/mtd/tests/mtd_nandbiterrs.c b/drivers/mtd/tests/mtd_nandbiterrs.c
index 072fc43..b94c4ac 100644
--- a/drivers/mtd/tests/mtd_nandbiterrs.c
+++ b/drivers/mtd/tests/mtd_nandbiterrs.c
@@ -39,6 +39,9 @@
  * this program; see the file COPYING. If not, write to the Free Software
  * Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
  */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -48,8 +51,6 @@
 #include <linux/slab.h>
 #include "mtd_tests.h"
 
-#define msg(FMT, VA...) pr_info("mtd_nandbiterrs: "FMT, ##VA)
-
 static int dev;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
@@ -105,11 +106,11 @@ static int write_page(int log)
 	size_t written;
 
 	if (log)
-		msg("write_page\n");
+		pr_info("write_page\n");
 
 	err = mtd_write(mtd, offset, mtd->writesize, &written, wbuffer);
 	if (err || written != mtd->writesize) {
-		msg("error: write failed at %#llx\n", (long long)offset);
+		pr_info("error: write failed at %#llx\n", (long long)offset);
 		if (!err)
 			err = -EIO;
 	}
@@ -124,7 +125,7 @@ static int rewrite_page(int log)
 	struct mtd_oob_ops ops;
 
 	if (log)
-		msg("rewrite page\n");
+		pr_info("rewrite page\n");
 
 	ops.mode      = MTD_OPS_RAW; /* No ECC */
 	ops.len       = mtd->writesize;
@@ -137,7 +138,7 @@ static int rewrite_page(int log)
 
 	err = mtd_write_oob(mtd, offset, &ops);
 	if (err || ops.retlen != mtd->writesize) {
-		msg("error: write_oob failed (%d)\n", err);
+		pr_info("error: write_oob failed (%d)\n", err);
 		if (!err)
 			err = -EIO;
 	}
@@ -154,7 +155,7 @@ static int read_page(int log)
 	struct mtd_ecc_stats oldstats;
 
 	if (log)
-		msg("read_page\n");
+		pr_info("read_page\n");
 
 	/* Saving last mtd stats */
 	memcpy(&oldstats, &mtd->ecc_stats, sizeof(oldstats));
@@ -164,7 +165,7 @@ static int read_page(int log)
 		err = mtd->ecc_stats.corrected - oldstats.corrected;
 
 	if (err < 0 || read != mtd->writesize) {
-		msg("error: read failed at %#llx\n", (long long)offset);
+		pr_info("error: read failed at %#llx\n", (long long)offset);
 		if (err >= 0)
 			err = -EIO;
 	}
@@ -178,11 +179,11 @@ static int verify_page(int log)
 	unsigned i, errs = 0;
 
 	if (log)
-		msg("verify_page\n");
+		pr_info("verify_page\n");
 
 	for (i = 0; i < mtd->writesize; i++) {
 		if (rbuffer[i] != hash(i+seed)) {
-			msg("Error: page offset %u, expected %02x, got %02x\n",
+			pr_info("Error: page offset %u, expected %02x, got %02x\n",
 				i, hash(i+seed), rbuffer[i]);
 			errs++;
 		}
@@ -207,13 +208,13 @@ static int insert_biterror(unsigned byte)
 		for (bit = 7; bit >= 0; bit--) {
 			if (CBIT(wbuffer[byte], bit)) {
 				BCLR(wbuffer[byte], bit);
-				msg("Inserted biterror @ %u/%u\n", byte, bit);
+				pr_info("Inserted biterror @ %u/%u\n", byte, bit);
 				return 0;
 			}
 		}
 		byte++;
 	}
-	msg("biterror: Failed to find a '1' bit\n");
+	pr_info("biterror: Failed to find a '1' bit\n");
 	return -EIO;
 }
 
@@ -225,7 +226,7 @@ static int incremental_errors_test(void)
 	unsigned i;
 	unsigned errs_per_subpage = 0;
 
-	msg("incremental biterrors test\n");
+	pr_info("incremental biterrors test\n");
 
 	for (i = 0; i < mtd->writesize; i++)
 		wbuffer[i] = hash(i+seed);
@@ -242,9 +243,9 @@ static int incremental_errors_test(void)
 
 		err = read_page(1);
 		if (err > 0)
-			msg("Read reported %d corrected bit errors\n", err);
+			pr_info("Read reported %d corrected bit errors\n", err);
 		if (err < 0) {
-			msg("After %d biterrors per subpage, read reported error %d\n",
+			pr_info("After %d biterrors per subpage, read reported error %d\n",
 				errs_per_subpage, err);
 			err = 0;
 			goto exit;
@@ -252,11 +253,11 @@ static int incremental_errors_test(void)
 
 		err = verify_page(1);
 		if (err) {
-			msg("ECC failure, read data is incorrect despite read success\n");
+			pr_info("ECC failure, read data is incorrect despite read success\n");
 			goto exit;
 		}
 
-		msg("Successfully corrected %d bit errors per subpage\n",
+		pr_info("Successfully corrected %d bit errors per subpage\n",
 			errs_per_subpage);
 
 		for (i = 0; i < subcount; i++) {
@@ -288,7 +289,7 @@ static int overwrite_test(void)
 
 	memset(bitstats, 0, sizeof(bitstats));
 
-	msg("overwrite biterrors test\n");
+	pr_info("overwrite biterrors test\n");
 
 	for (i = 0; i < mtd->writesize; i++)
 		wbuffer[i] = hash(i+seed);
@@ -306,18 +307,18 @@ static int overwrite_test(void)
 		err = read_page(0);
 		if (err >= 0) {
 			if (err >= MAXBITS) {
-				msg("Implausible number of bit errors corrected\n");
+				pr_info("Implausible number of bit errors corrected\n");
 				err = -EIO;
 				break;
 			}
 			bitstats[err]++;
 			if (err > max_corrected) {
 				max_corrected = err;
-				msg("Read reported %d corrected bit errors\n",
+				pr_info("Read reported %d corrected bit errors\n",
 					err);
 			}
 		} else { /* err < 0 */
-			msg("Read reported error %d\n", err);
+			pr_info("Read reported error %d\n", err);
 			err = 0;
 			break;
 		}
@@ -325,7 +326,7 @@ static int overwrite_test(void)
 		err = verify_page(0);
 		if (err) {
 			bitstats[max_corrected] = opno;
-			msg("ECC failure, read data is incorrect despite read success\n");
+			pr_info("ECC failure, read data is incorrect despite read success\n");
 			break;
 		}
 
@@ -334,9 +335,9 @@ static int overwrite_test(void)
 
 	/* At this point bitstats[0] contains the number of ops with no bit
 	 * errors, bitstats[1] the number of ops with 1 bit error, etc. */
-	msg("Bit error histogram (%d operations total):\n", opno);
+	pr_info("Bit error histogram (%d operations total):\n", opno);
 	for (i = 0; i < max_corrected; i++)
-		msg("Page reads with %3d corrected bit errors: %d\n",
+		pr_info("Page reads with %3d corrected bit errors: %d\n",
 			i, bitstats[i]);
 
 exit:
@@ -347,36 +348,35 @@ static int __init mtd_nandbiterrs_init(void)
 {
 	int err = 0;
 
-	msg("\n");
-	msg("==================================================\n");
-	msg("MTD device: %d\n", dev);
+	printk(KERN_INFO "\n==================================================\n");
+	pr_info("MTD device: %d\n", dev);
 
 	mtd = get_mtd_device(NULL, dev);
 	if (IS_ERR(mtd)) {
 		err = PTR_ERR(mtd);
-		msg("error: cannot get MTD device\n");
+		pr_info("error: cannot get MTD device\n");
 		goto exit_mtddev;
 	}
 
 	if (mtd->type != MTD_NANDFLASH) {
-		msg("this test requires NAND flash\n");
+		pr_info("this test requires NAND flash\n");
 		err = -ENODEV;
 		goto exit_nand;
 	}
 
-	msg("MTD device size %llu, eraseblock=%u, page=%u, oob=%u\n",
+	pr_info("MTD device size %llu, eraseblock=%u, page=%u, oob=%u\n",
 		(unsigned long long)mtd->size, mtd->erasesize,
 		mtd->writesize, mtd->oobsize);
 
 	subsize  = mtd->writesize >> mtd->subpage_sft;
 	subcount = mtd->writesize / subsize;
 
-	msg("Device uses %d subpages of %d bytes\n", subcount, subsize);
+	pr_info("Device uses %d subpages of %d bytes\n", subcount, subsize);
 
 	offset     = page_offset * mtd->writesize;
 	eraseblock = mtd_div_by_eb(offset, mtd);
 
-	msg("Using page=%u, offset=%llu, eraseblock=%u\n",
+	pr_info("Using page=%u, offset=%llu, eraseblock=%u\n",
 		page_offset, offset, eraseblock);
 
 	wbuffer = kmalloc(mtd->writesize, GFP_KERNEL);
@@ -409,8 +409,8 @@ static int __init mtd_nandbiterrs_init(void)
 		goto exit_error;
 
 	err = -EIO;
-	msg("finished successfully.\n");
-	msg("==================================================\n");
+	pr_info("finished successfully.\n");
+	printk(KERN_INFO "==================================================\n");
 
 exit_error:
 	kfree(rbuffer);
-- 
1.7.4.1
