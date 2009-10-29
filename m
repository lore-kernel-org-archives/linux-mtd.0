Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N3UJe-0001KN-7B
	for linux-mtd@lists.infradead.org; Thu, 29 Oct 2009 12:41:27 +0000
Date: Thu, 29 Oct 2009 13:41:16 +0100
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd
	<linux-mtd@lists.infradead.org>
Subject: [PATCH v12 2/4]: mtdoops: Add a maximum MTD partition size
Message-ID: <20091029134116.354237ba@marrow.netinsight.se>
In-Reply-To: <20091029133535.2ea65f72@marrow.netinsight.se>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
	<20091029133535.2ea65f72@marrow.netinsight.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A configurable maximum MTD partition size for mtdoops avoids mistakes
where the user gives e.g., a rootfs partition to mtdoops (which will
happily erase it).

Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
---
 drivers/mtd/Kconfig   |   13 +++++++++++++
 drivers/mtd/mtdoops.c |   11 +++++++----
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index ecf90f5..9a69af8 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -315,6 +315,19 @@ config MTD_OOPS
 	  To use, add console=ttyMTDx to the kernel command line,
 	  where x is the MTD device number to use.
 
+config MTD_OOPS_MAX_MTD_SIZE
+	int "Maximum MTD oops partition size (kbytes)"
+	default 4096
+	range 8 1048576
+	depends on MTD_OOPS
+	help
+	  This parameter sets the maximum MTD partition size for use with
+	  MTD oops. The default value is used as a safeguard against using
+	  e.g., a root filesystem partition as a MTDoops device (in which
+	  case it will be erased).
+
+	  No need to change unless you have a very large MTDoops partition.
+
 source "drivers/mtd/chips/Kconfig"
 
 source "drivers/mtd/maps/Kconfig"
diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 209f8f4..dc94a70 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -298,6 +298,12 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 	if (mtd->index != cxt->mtd_index || cxt->mtd_index < 0)
 		return;
 
+	if (mtd->size > CONFIG_MTD_OOPS_MAX_MTD_SIZE * 1024) {
+		printk(KERN_ERR "mtdoops: MTD partition %d too big for mtdoops (limit %d KiB)\n",
+		       mtd->index, CONFIG_MTD_OOPS_MAX_MTD_SIZE);
+		return;
+	}
+
 	if (mtd->size < mtd->erasesize * 2) {
 		printk(KERN_ERR "mtdoops: MTD partition %d not big enough for mtdoops\n",
 		       mtd->index);
@@ -318,10 +324,7 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 		return;
 	}
 	cxt->mtd = mtd;
-	if (mtd->size > INT_MAX)
-		cxt->oops_pages = INT_MAX / OOPS_PAGE_SIZE;
-	else
-		cxt->oops_pages = (int)mtd->size / OOPS_PAGE_SIZE;
+	cxt->oops_pages = (int)mtd->size / OOPS_PAGE_SIZE;
 
 	find_next_position(cxt);
 
-- 
1.6.0.4
