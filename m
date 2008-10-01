Received: from web58908.mail.re1.yahoo.com ([66.196.100.237])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kl8uy-0002Vx-SQ
	for linux-mtd@lists.infradead.org; Wed, 01 Oct 2008 21:07:33 +0000
Date: Wed, 1 Oct 2008 14:00:51 -0700 (PDT)
From: Philip Rakity <prakity@yahoo.com>
Subject: PATCH - add cmdline partition support to cafe (eg mtdparts= boot
	command)
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <148191.46055.qm@web58908.mail.re1.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Folks,

Could we please incorporate this info the main line linux code.  Adds command line mtdparts= support for cafe_nand flash.

NOTE:  I changed where add_mtd_device was done so that there is NOT a complete flash mount point following by the partitions that were added.  Before this n+1 partitions were added.  1 partition for the complete flash and then n partitions.

Philip
--- cafe_nand.c.ORIGINAL    2008-10-01 13:53:11.000000000 -0700
+++ cafe_nand.c    2008-10-01 13:55:01.000000000 -0700
@@ -87,8 +87,12 @@
 module_param_array(timing, int, &numtimings, 0644);
 
 #ifdef CONFIG_MTD_PARTITIONS
+#ifdef CONFIG_MTD_CMDLINE_PARTS
+static const char *part_probes[] = { "cmdlinepart", "RedBoot", NULL };
+#else
 static const char *part_probes[] = { "RedBoot", NULL };
 #endif
+#endif
 
 /* Hrm. Why isn't this already conditional on something in the struct device? */
 #define cafe_dev_dbg(dev, args...) do { if (debug) dev_dbg(dev, ##args); } while(0)
@@ -628,7 +632,7 @@
     struct cafe_priv *cafe;
     struct mtd_partition *parts;
     uint32_t ctrl;
-    int nr_parts;
+    int nr_parts = 0;
     int err = 0;
 
     /* Very old versions shared the same PCI ident for all three
@@ -796,17 +800,21 @@
 
     pci_set_drvdata(pdev, mtd);
 
-    /* We register the whole device first, separate from the partitions */
-    add_mtd_device(mtd);
-
 #ifdef CONFIG_MTD_PARTITIONS
+#ifdef CONFIG_MTD_CMDLINE_PARTS
+     mtd->name = "cafe_nand";
+#endif
     nr_parts = parse_mtd_partitions(mtd, part_probes, &parts, 0);
     if (nr_parts > 0) {
         cafe->parts = parts;
-        dev_info(&cafe->pdev->dev, "%d RedBoot partitions found\n", nr_parts);
+        dev_info(&cafe->pdev->dev, "%d partitions found\n", nr_parts);
         add_mtd_partitions(mtd, parts, nr_parts);
     }
 #endif
+
+    /* We register the whole device first, separate from the partitions */
+    if (nr_parts <= 0)
+        add_mtd_device(mtd);
     goto out;
 
Signed off by Philip Rakity -- October 1, 2008



      
