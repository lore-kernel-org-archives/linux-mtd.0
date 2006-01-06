Received: from mailout.stusta.mhn.de ([141.84.69.5])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eux8U-0004AX-4q
	for linux-mtd@lists.infradead.org; Fri, 06 Jan 2006 14:20:29 -0500
Date: Fri, 6 Jan 2006 20:20:17 +0100
From: Adrian Bunk <bunk@stusta.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20060106192017.GA12131@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [2.6 patch] drivers/mtd/: small cleanups
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch contains the following cleanups:
- chips/sharp.c: make two needlessly global functions static
- move some declarations to a header file where they belong to


Signed-off-by: Adrian Bunk <bunk@stusta.de>

---

 drivers/mtd/chips/sharp.c |    7 +++----
 drivers/mtd/inftlcore.c   |    5 -----
 include/linux/mtd/inftl.h |    5 +++++
 3 files changed, 8 insertions(+), 9 deletions(-)

--- linux-2.6.15-rc5-mm2-full/include/linux/mtd/inftl.h.old	2005-12-13 00:38:32.000000000 +0100
+++ linux-2.6.15-rc5-mm2-full/include/linux/mtd/inftl.h	2005-12-13 00:40:26.000000000 +0100
@@ -52,6 +52,11 @@
 int INFTL_mount(struct INFTLrecord *s);
 int INFTL_formatblock(struct INFTLrecord *s, int block);
 
+extern char inftlmountrev[];
+
+void INFTL_dumptables(struct INFTLrecord *s);
+void INFTL_dumpVUchains(struct INFTLrecord *s);
+
 #endif /* __KERNEL__ */
 
 #endif /* __MTD_INFTL_H__ */
--- linux-2.6.15-rc5-mm2-full/drivers/mtd/inftlcore.c.old	2005-12-13 00:39:14.000000000 +0100
+++ linux-2.6.15-rc5-mm2-full/drivers/mtd/inftlcore.c	2005-12-13 00:40:43.000000000 +0100
@@ -47,9 +47,6 @@
  */
 #define MAX_LOOPS 10000
 
-extern void INFTL_dumptables(struct INFTLrecord *inftl);
-extern void INFTL_dumpVUchains(struct INFTLrecord *inftl);
-
 static void inftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 {
 	struct INFTLrecord *inftl;
@@ -885,8 +882,6 @@
 	.owner		= THIS_MODULE,
 };
 
-extern char inftlmountrev[];
-
 static int __init init_inftl(void)
 {
 	printk(KERN_INFO "INFTL: inftlcore.c $Revision: 1.19 $, "

--- linux-2.6.15-mm1-full/drivers/mtd/chips/sharp.c.old	2006-01-06 19:37:50.000000000 +0100
+++ linux-2.6.15-mm1-full/drivers/mtd/chips/sharp.c	2006-01-06 19:38:32.000000000 +0100
@@ -64,7 +64,7 @@
 
 #undef AUTOUNLOCK  /* automatically unlocks blocks before erasing */
 
-struct mtd_info *sharp_probe(struct map_info *);
+static struct mtd_info *sharp_probe(struct map_info *);
 
 static int sharp_probe_map(struct map_info *map,struct mtd_info *mtd);
 
@@ -96,7 +96,6 @@
 	struct flchip chips[1];
 };
 
-struct mtd_info *sharp_probe(struct map_info *map);
 static void sharp_destroy(struct mtd_info *mtd);
 
 static struct mtd_chip_driver sharp_chipdrv = {
@@ -107,7 +106,7 @@
 };
 
 
-struct mtd_info *sharp_probe(struct map_info *map)
+static struct mtd_info *sharp_probe(struct map_info *map)
 {
 	struct mtd_info *mtd = NULL;
 	struct sharp_info *sharp = NULL;
@@ -581,7 +580,7 @@
 
 }
 
-int __init sharp_probe_init(void)
+static int __init sharp_probe_init(void)
 {
 	printk("MTD Sharp chip driver <ds@lineo.com>\n");
 
