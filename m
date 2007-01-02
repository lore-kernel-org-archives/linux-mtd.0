Received: from mail.artecdesign.ee ([62.65.32.9] helo=postikukk.artecdesign.ee)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H1kUr-0000X9-Ih
	for linux-mtd@lists.infradead.org; Tue, 02 Jan 2007 09:20:13 -0500
Received: from malvek.artecdesign.ee ([62.65.32.4] helo=moby)
	by postikukk.artecdesign.ee with smtp (Exim 4.50) id 1H1kWj-0006GK-IA
	for linux-mtd@lists.infradead.org; Tue, 02 Jan 2007 16:22:15 +0200
Date: Tue, 2 Jan 2007 16:21:44 +0200
From: Indrek Kruusa <indrek.kruusa@artecdesign.ee>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] cs553x_nand.c: support partitions; cs553x_cleanup() fix
Message-Id: <20070102162144.52a71884.indrek.kruusa@artecdesign.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Patch for drivers/mtd/nand/cs553x_nand.c:
- support partitions
- cs553x_cleanup(): try the cleanup for all chip selects

Signed-off-by: Indrek Kruusa <indrek.kruusa@artecdesign.ee>


--- cs553x_nand.c_git	2007-01-02 15:13:06.000000000 +0200
+++ cs553x_nand.c	2007-01-02 15:45:38.000000000 +0200
@@ -273,12 +273,21 @@
 	return 0;
 }
 
+
+#ifdef CONFIG_MTD_PARTITIONS
+const char *part_probes[] = { "cmdlinepart", NULL };
+#endif
+
+
 static int __init cs553x_init(void)
 {
 	int err = -ENXIO;
 	int i;
 	uint64_t val;
 
+	int mtd_parts_nb = 0;
+	struct mtd_partition *mtd_parts = 0;
+
 	/* If the CPU isn't a Geode GX or LX, abort */
 	if (!is_geode())
 		return -ENXIO;
@@ -307,9 +316,20 @@
 	   do mtdconcat etc. if we want to. */
 	for (i = 0; i < NR_CS553X_CONTROLLERS; i++) {
 		if (cs553x_mtd[i]) {
-			add_mtd_device(cs553x_mtd[i]);
 
 			/* If any devices registered, return success. Else the last error. */
+#ifdef CONFIG_MTD_PARTITIONS
+			cs553x_mtd[i]->name = "cs553x_nand";
+			mtd_parts_nb = parse_mtd_partitions(cs553x_mtd[i], part_probes, &mtd_parts, 0);
+			if (mtd_parts_nb > 0) {
+				printk(KERN_NOTICE "Using command line partition definition\n");
+				add_mtd_partitions(cs553x_mtd[i], mtd_parts, mtd_parts_nb);
+			} else {
+				add_mtd_device(cs553x_mtd[i]);
+			}
+#else
+			add_mtd_device(cs553x_mtd[i]);
+#endif
 			err = 0;
 		}
 	}
@@ -329,7 +349,7 @@
 		void __iomem *mmio_base;
 
 		if (!mtd)
-			break;
+			continue;
 
 		this = cs553x_mtd[i]->priv;
 		mmio_base = this->IO_ADDR_R;
