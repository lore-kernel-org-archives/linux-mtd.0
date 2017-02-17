Received: from smtprelay0187.hostedemail.com ([216.40.44.187]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cecjI-0003j1-8e
 for linux-mtd@lists.infradead.org; Fri, 17 Feb 2017 07:13:23 +0000
From: Joe Perches <joe@perches.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 24/35] drivers/mtd: Convert remaining uses of pr_warning to
 pr_warn
Date: Thu, 16 Feb 2017 23:11:37 -0800
Message-Id: <10bf2a94655fb273ec96ec7b5e93bab8d0c8d17f.1487314667.git.joe@perches.com>
In-Reply-To: <cover.1487314666.git.joe@perches.com>
References: <cover.1487314666.git.joe@perches.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To enable eventual removal of pr_warning

This makes pr_warn use consistent for drivers/mtd

Prior to this patch, there were 7 uses of pr_warning and
31 uses of pr_warn in drivers/mtd

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 12 ++++++++----
 drivers/mtd/nand/cmx270_nand.c      |  4 ++--
 drivers/mtd/ofpart.c                |  4 ++--
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 9dca881bb378..56aa6b75213d 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -323,7 +323,8 @@ static void fixup_sst38vf640x_sectorsize(struct mtd_info *mtd)
 	 * it should report a size of 8KBytes (0x0020*256).
 	 */
 	cfi->cfiq->EraseRegionInfo[0] = 0x002003ff;
-	pr_warning("%s: Bad 38VF640x CFI data; adjusting sector size from 64 to 8KiB\n", mtd->name);
+	pr_warn("%s: Bad 38VF640x CFI data; adjusting sector size from 64 to 8KiB\n",
+		mtd->name);
 }
 
 static void fixup_s29gl064n_sectors(struct mtd_info *mtd)
@@ -333,7 +334,8 @@ static void fixup_s29gl064n_sectors(struct mtd_info *mtd)
 
 	if ((cfi->cfiq->EraseRegionInfo[0] & 0xffff) == 0x003f) {
 		cfi->cfiq->EraseRegionInfo[0] |= 0x0040;
-		pr_warning("%s: Bad S29GL064N CFI data; adjust from 64 to 128 sectors\n", mtd->name);
+		pr_warn("%s: Bad S29GL064N CFI data; adjust from 64 to 128 sectors\n",
+			mtd->name);
 	}
 }
 
@@ -344,7 +346,8 @@ static void fixup_s29gl032n_sectors(struct mtd_info *mtd)
 
 	if ((cfi->cfiq->EraseRegionInfo[1] & 0xffff) == 0x007e) {
 		cfi->cfiq->EraseRegionInfo[1] &= ~0x0040;
-		pr_warning("%s: Bad S29GL032N CFI data; adjust from 127 to 63 sectors\n", mtd->name);
+		pr_warn("%s: Bad S29GL032N CFI data; adjust from 127 to 63 sectors\n",
+			mtd->name);
 	}
 }
 
@@ -358,7 +361,8 @@ static void fixup_s29ns512p_sectors(struct mtd_info *mtd)
 	 * which is not permitted by CFI.
 	 */
 	cfi->cfiq->EraseRegionInfo[0] = 0x020001ff;
-	pr_warning("%s: Bad S29NS512P CFI data; adjust to 512 sectors\n", mtd->name);
+	pr_warn("%s: Bad S29NS512P CFI data; adjust to 512 sectors\n",
+		mtd->name);
 }
 
 /* Used to fix CFI-Tables of chips without Extended Query Tables */
diff --git a/drivers/mtd/nand/cmx270_nand.c b/drivers/mtd/nand/cmx270_nand.c
index 226ac0bcafc6..949b9400dcb7 100644
--- a/drivers/mtd/nand/cmx270_nand.c
+++ b/drivers/mtd/nand/cmx270_nand.c
@@ -145,7 +145,7 @@ static int __init cmx270_init(void)
 
 	ret = gpio_request(GPIO_NAND_CS, "NAND CS");
 	if (ret) {
-		pr_warning("CM-X270: failed to request NAND CS gpio\n");
+		pr_warn("CM-X270: failed to request NAND CS gpio\n");
 		return ret;
 	}
 
@@ -153,7 +153,7 @@ static int __init cmx270_init(void)
 
 	ret = gpio_request(GPIO_NAND_RB, "NAND R/B");
 	if (ret) {
-		pr_warning("CM-X270: failed to request NAND R/B gpio\n");
+		pr_warn("CM-X270: failed to request NAND R/B gpio\n");
 		goto err_gpio_request;
 	}
 
diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index 464470122493..2861c7079d7b 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -166,8 +166,8 @@ static int parse_ofoldpart_partitions(struct mtd_info *master,
 	if (!part)
 		return 0; /* No partitions found */
 
-	pr_warning("Device tree uses obsolete partition map binding: %s\n",
-			dp->full_name);
+	pr_warn("Device tree uses obsolete partition map binding: %s\n",
+		dp->full_name);
 
 	nr_parts = plen / sizeof(part[0]);
 
-- 
2.10.0.rc2.1.g053435c
