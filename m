Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=teyla.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MATGC-0002Fy-Nb
	for linux-mtd@lists.infradead.org; Sat, 30 May 2009 18:26:35 +0000
From: Ben Dooks <ben-linux@fluff.org>
To: linux-mtd@lists.infradead.org
Subject: [MTD] [NAND] S3C2410: Added a kerneldoc for s3c2410_nand_set
Date: Sat, 30 May 2009 18:41:35 +0100
Message-Id: <1243705298-21814-9-git-send-email-ben-linux@fluff.org>
In-Reply-To: <1243705298-21814-8-git-send-email-ben-linux@fluff.org>
References: <1243705298-21814-1-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-2-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-3-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-4-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-5-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-6-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-7-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-8-git-send-email-ben-linux@fluff.org>
Cc: Michel Pollet <buserror@gmail.com>, Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Michel Pollet <buserror@gmail.com>

Converted the old comnent to kerneldoc.

Signed-off-by: Michel Pollet <buserror@gmail.com>
[ben-linux@fluff.org: updated subject]
Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/plat-s3c/include/plat/nand.h |   22 ++++++++++++----------
 1 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/arm/plat-s3c/include/plat/nand.h b/arch/arm/plat-s3c/include/plat/nand.h
index 9855467..350ec95 100644
--- a/arch/arm/plat-s3c/include/plat/nand.h
+++ b/arch/arm/plat-s3c/include/plat/nand.h
@@ -10,17 +10,19 @@
  * published by the Free Software Foundation.
 */
 
-/* struct s3c2410_nand_set
+/**
+ * struct s3c2410_nand_set - define a set of one or more nand chips
+ * @disable_ecc:	Entirely disable ECC - Dangerous
+ * @nr_chips:		Number of chips in this set
+ * @nr_partitions:	Number of partitions pointed to be partitoons (or zero)
+ * @name:		Name of set (optional)
+ * @nr_map:		Map for low-layer logical to physical chip numbers (option)
+ * @partitions:		The mtd partition list
  *
- * define an set of one or more nand chips registered with an unique mtd
- *
- * nr_chips	 = number of chips in this set
- * nr_partitions = number of partitions pointed to be partitoons (or zero)
- * name		 = name of set (optional)
- * nr_map	 = map for low-layer logical to physical chip numbers (option)
- * partitions	 = mtd partition list
-*/
-
+ * define a set of one or more nand chips registered with an unique mtd. Also
+ * allows to pass flag to the underlying NAND layer. 'disable_ecc' will trigger
+ * a warning at boot time.
+ */
 struct s3c2410_nand_set {
 	unsigned int		disable_ecc:1;
 
-- 
1.5.6.5
