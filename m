Received: from mail-bw0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXaAC-0006rY-Ax
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2011 15:09:05 +0000
Received: by bkcje16 with SMTP id je16so4360282bkc.36
 for <linux-mtd@lists.infradead.org>; Mon, 05 Dec 2011 07:09:02 -0800 (PST)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/7] MTD: MAPS: bcm963xx-flash: clean up printk usage
Date: Mon,  5 Dec 2011 16:08:07 +0100
Message-Id: <1323097691-16414-4-git-send-email-jonas.gorski@gmail.com>
In-Reply-To: <1323097691-16414-1-git-send-email-jonas.gorski@gmail.com>
References: <1323097691-16414-1-git-send-email-jonas.gorski@gmail.com>
Cc: linux-mips@linux-mips.org, Artem Bityutskiy <Artem.Bityutskiy@intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>,
 Ralf Baechle <ralf@linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace raw printk's with their pr_XXX equivalent and unify broken up
strings so they become grepable.

Also replace the PFX definition with a pr_fmt().

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 drivers/mtd/maps/bcm963xx-flash.c |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/maps/bcm963xx-flash.c b/drivers/mtd/maps/bcm963xx-flash.c
index 58cbaf2..ce2ca2a 100644
--- a/drivers/mtd/maps/bcm963xx-flash.c
+++ b/drivers/mtd/maps/bcm963xx-flash.c
@@ -18,6 +18,8 @@
  * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
@@ -33,8 +35,6 @@
 #define BCM63XX_BUSWIDTH	2		/* Buswidth */
 #define BCM63XX_EXTENDED_SIZE	0xBFC00000	/* Extended flash address */
 
-#define PFX KBUILD_MODNAME ": "
-
 static struct mtd_partition *parsed_parts;
 
 static struct mtd_info *bcm963xx_mtd_info;
@@ -79,8 +79,8 @@ static int parse_cfe_partitions(struct mtd_info *master,
 	tagversion = &(buf->tag_version[0]);
 	boardid = &(buf->board_id[0]);
 
-	printk(KERN_INFO PFX "CFE boot tag found with version %s "
-				"and board type %s\n", tagversion, boardid);
+	pr_info("CFE boot tag found with version %s and board type %s\n",
+		tagversion, boardid);
 
 	kerneladdr = kerneladdr - BCM63XX_EXTENDED_SIZE;
 	rootfsaddr = kerneladdr + kernellen;
@@ -139,13 +139,13 @@ static int parse_cfe_partitions(struct mtd_info *master,
 	parts[curpart].size = master->size - parts[0].size - parts[3].size;
 
 	for (i = 0; i < nrparts; i++)
-		printk(KERN_INFO PFX "Partition %d is %s offset %lx and "
-					"length %lx\n", i, parts[i].name,
-					(long unsigned int)(parts[i].offset),
-					(long unsigned int)(parts[i].size));
+		pr_info("Partition %d is %s offset %lx and length %lx\n", i,
+			parts[i].name, (long unsigned int)(parts[i].offset),
+			(long unsigned int)(parts[i].size));
+
+	pr_info("Spare partition is offset %x and length %x\n",	spareaddr,
+		sparelen);
 
-	printk(KERN_INFO PFX "Spare partition is offset %x and length %x\n",
-							spareaddr, sparelen);
 	*pparts = parts;
 	vfree(buf);
 
-- 
1.7.2.5
