Message-Id: <200807301934.m6UJYwtM012279@imap1.linux-foundation.org>
Subject: [patch 03/13] mtd: diskonchip.c fix sparse endian warnings
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Wed, 30 Jul 2008 12:34:57 -0700
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
	viro@zeniv.linux.org.uk, harvey.harrison@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Harvey Harrison <harvey.harrison@gmail.com>

Signed-off-by: Harvey Harrison <harvey.harrison@gmail.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/nand/diskonchip.c |   30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff -puN drivers/mtd/nand/diskonchip.c~mtd-diskonchipc-fix-sparse-endian-warnings drivers/mtd/nand/diskonchip.c
--- a/drivers/mtd/nand/diskonchip.c~mtd-diskonchipc-fix-sparse-endian-warnings
+++ a/drivers/mtd/nand/diskonchip.c
@@ -1125,9 +1125,9 @@ static inline int __init nftl_partscan(s
 		goto out;
 	mh = (struct NFTLMediaHeader *)buf;
 
-	mh->NumEraseUnits = le16_to_cpu(mh->NumEraseUnits);
-	mh->FirstPhysicalEUN = le16_to_cpu(mh->FirstPhysicalEUN);
-	mh->FormattedSize = le32_to_cpu(mh->FormattedSize);
+	le16_to_cpus(&mh->NumEraseUnits);
+	le16_to_cpus(&mh->FirstPhysicalEUN);
+	le32_to_cpus(&mh->FormattedSize);
 
 	printk(KERN_INFO "    DataOrgID        = %s\n"
 			 "    NumEraseUnits    = %d\n"
@@ -1235,12 +1235,12 @@ static inline int __init inftl_partscan(
 	doc->mh1_page = doc->mh0_page + (4096 >> this->page_shift);
 	mh = (struct INFTLMediaHeader *)buf;
 
-	mh->NoOfBootImageBlocks = le32_to_cpu(mh->NoOfBootImageBlocks);
-	mh->NoOfBinaryPartitions = le32_to_cpu(mh->NoOfBinaryPartitions);
-	mh->NoOfBDTLPartitions = le32_to_cpu(mh->NoOfBDTLPartitions);
-	mh->BlockMultiplierBits = le32_to_cpu(mh->BlockMultiplierBits);
-	mh->FormatFlags = le32_to_cpu(mh->FormatFlags);
-	mh->PercentUsed = le32_to_cpu(mh->PercentUsed);
+	le32_to_cpus(&mh->NoOfBootImageBlocks);
+	le32_to_cpus(&mh->NoOfBinaryPartitions);
+	le32_to_cpus(&mh->NoOfBDTLPartitions);
+	le32_to_cpus(&mh->BlockMultiplierBits);
+	le32_to_cpus(&mh->FormatFlags);
+	le32_to_cpus(&mh->PercentUsed);
 
 	printk(KERN_INFO "    bootRecordID          = %s\n"
 			 "    NoOfBootImageBlocks   = %d\n"
@@ -1277,12 +1277,12 @@ static inline int __init inftl_partscan(
 	/* Scan the partitions */
 	for (i = 0; (i < 4); i++) {
 		ip = &(mh->Partitions[i]);
-		ip->virtualUnits = le32_to_cpu(ip->virtualUnits);
-		ip->firstUnit = le32_to_cpu(ip->firstUnit);
-		ip->lastUnit = le32_to_cpu(ip->lastUnit);
-		ip->flags = le32_to_cpu(ip->flags);
-		ip->spareUnits = le32_to_cpu(ip->spareUnits);
-		ip->Reserved0 = le32_to_cpu(ip->Reserved0);
+		le32_to_cpus(&ip->virtualUnits);
+		le32_to_cpus(&ip->firstUnit);
+		le32_to_cpus(&ip->lastUnit);
+		le32_to_cpus(&ip->flags);
+		le32_to_cpus(&ip->spareUnits);
+		le32_to_cpus(&ip->Reserved0);
 
 		printk(KERN_INFO	"    PARTITION[%d] ->\n"
 			"        virtualUnits    = %d\n"
_
