Received: from za-gw.sanpeople.com ([196.211.225.226])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HjUq6-0004m8-9Y
	for linux-mtd@lists.infradead.org; Thu, 03 May 2007 02:30:56 -0400
Subject: [PATCH] [MTD] at91_nand.c: CMDLINE_PARTS support
From: Andrew Victor <andrew@sanpeople.com>
To: dwmw2@infradead.org
Content-Type: text/plain
Message-Id: <1178173004.14657.146.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Date: 03 May 2007 08:16:44 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch allows you to specify at91_nand partitions on the
kernel command line using the mtdparts variable, if
CONFIG_MTD_CMDLINE_PARTS is set.

Signed-off-by: Frank Mandarino <fmandarino@endrelia.com>
Signed-off-by: Andrew Victor <andrew@sanpeople.com>


diff -urN -x CVS linux-2.6.21/drivers/mtd/nand/at91_nand.c linux-2.6/drivers/mtd/nand/at91_nand.c
--- linux-2.6.21/drivers/mtd/nand/at91_nand.c	Thu Apr 26 05:08:32 2007
+++ linux-2.6/drivers/mtd/nand/at91_nand.c	Wed Jan 31 15:18:47 2007
@@ -82,6 +82,10 @@
 		at91_set_gpio_value(host->board->enable_pin, 1);
 }
 
+#ifdef CONFIG_MTD_PARTITIONS
+const char *part_probes[] = { "cmdlinepart", NULL };
+#endif
+
 /*
  * Probe for the NAND device.
  */
@@ -151,6 +155,12 @@
 #ifdef CONFIG_MTD_PARTITIONS
 	if (host->board->partition_info)
 		partitions = host->board->partition_info(mtd->size, &num_partitions);
+#ifdef CONFIG_MTD_CMDLINE_PARTS
+	else {
+		mtd->name = "at91_nand";
+		num_partitions = parse_mtd_partitions(mtd, part_probes, &partitions, 0);
+	}
+#endif
 
 	if ((!partitions) || (num_partitions == 0)) {
 		printk(KERN_ERR "at91_nand: No parititions defined, or unsupported device.\n");
