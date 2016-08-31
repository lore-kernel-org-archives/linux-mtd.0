Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bezyL-0004t4-8E
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 07:30:14 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 33/46] mtd: nandsim: Relax page size restrictions
Date: Wed, 31 Aug 2016 09:28:40 +0200
Message-Id: <20160831072853.27822-34-dwalter@sigma-star.at>
In-Reply-To: <20160831072853.27822-1-dwalter@sigma-star.at>
References: <20160831072853.27822-1-dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Richard Weinberger <richard@nod.at>

Allow any page size as long it is a power of two and less
than KMALLOC_MAX_SIZE.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index f0b6c1f..75bf45a74 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -176,9 +176,6 @@ MODULE_PARM_DESC(bch,		 "Enable BCH ecc and set how many bits should "
 MODULE_PARM_DESC(defaults,	 "Register a MTD during module load using default values and module parametes. "
 				 "Set to N if you want to use the nandsimctl user space tool to setup nandsim.");
 
-/* The largest possible page size */
-#define NS_LARGEST_PAGE_SIZE	4096
-
 /* Busy-wait delay macros (microseconds, milliseconds) */
 #define NS_UDELAY(ns, us) \
 	do { if (ns->do_delays) udelay(us); } while (0)
@@ -247,10 +244,8 @@ MODULE_PARM_DESC(defaults,	 "Register a MTD during module load using default val
 
 #define OPT_ANY          0xFFFFFFFF /* any chip supports this operation */
 #define OPT_PAGE512      0x00000002 /* 512-byte  page chips */
-#define OPT_PAGE2048     0x00000008 /* 2048-byte page chips */
+#define OPT_LARGEPAGE    0x00000008 /* >= 2048-byte page chips */
 #define OPT_PAGE512_8BIT 0x00000040 /* 512-byte page chips with 8-bit bus width */
-#define OPT_PAGE4096     0x00000080 /* 4096-byte page chips */
-#define OPT_LARGEPAGE    (OPT_PAGE2048 | OPT_PAGE4096) /* 2048 & 4096-byte page chips */
 #define OPT_SMALLPAGE    (OPT_PAGE512) /* 512-byte page chips */
 
 /* Remove action bits from state */
@@ -858,13 +853,18 @@ static int init_nandsim(struct mtd_info *mtd, struct nandsim_params *nsparam)
 		ns->options |= OPT_PAGE512;
 		if (ns->busw == 8)
 			ns->options |= OPT_PAGE512_8BIT;
-	} else if (ns->geom.pgsz == 2048) {
-		ns->options |= OPT_PAGE2048;
-	} else if (ns->geom.pgsz == 4096) {
-		ns->options |= OPT_PAGE4096;
-	} else {
-		pr_err("unknown page size %u\n", ns->geom.pgsz);
-		return -EIO;
+	} else if (ns->geom.pgsz >= 2048) {
+		ns->options |= OPT_LARGEPAGE;
+	}
+
+	if (!is_power_of_2(ns->geom.pgsz)) {
+		pr_err("page size is not a power of two.\n");
+		return -EINVAL;
+	}
+
+	if (ns->geom.pgszoob > KMALLOC_MAX_SIZE) {
+		pr_err("page size plus oob too large: %u.\n", ns->geom.pgszoob);
+		return -EINVAL;
 	}
 
 	if (ns->options & OPT_SMALLPAGE) {
-- 
2.8.3
