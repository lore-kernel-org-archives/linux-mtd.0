Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GprKX-00047c-Sw
	for linux-mtd@lists.infradead.org; Thu, 30 Nov 2006 14:12:25 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1GprKC-0000L7-Ii
	for linux-mtd@lists.infradead.org; Thu, 30 Nov 2006 20:12:00 +0100
Received: from bas17-toronto12-1096795652.dsl.bell.ca ([65.95.198.4])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Nov 2006 20:12:00 +0100
Received: from fmandarino by bas17-toronto12-1096795652.dsl.bell.ca with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Nov 2006 20:12:00 +0100
To: linux-mtd@lists.infradead.org
From: Frank Mandarino <fmandarino@endrelia.com>
Subject: [PATCH] at91_nand CMDLINE_PARTS support
Date: Thu, 30 Nov 2006 14:11:30 -0500
Message-ID: <eknad3$uen$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

The following patch allows you to specify at91_nand partitions on the
kernel command line using the mtdparts variable, if
CONFIG_MTD_CMDLINE_PARTS is set.

Regards,
../fam
--
Frank Mandarino                                fmandarino(a)endrelia.com
Endrelia Technologies Inc.
Toronto, Ontario, Canada


[PATCH] [MTD] at91_nand.c: CMDLINE_PARTS support

This patch allows you to specify at91_nand partitions on the
kernel command line using the mtdparts variable, if
CONFIG_MTD_CMDLINE_PARTS is set.

Signed-off-by: Frank Mandarino <fmandarino@endrelia.com>


diff --git a/drivers/mtd/nand/at91_nand.c b/drivers/mtd/nand/at91_nand.c
index a58ed37..0d18fed 100644
--- a/drivers/mtd/nand/at91_nand.c
+++ b/drivers/mtd/nand/at91_nand.c
@@ -82,6 +82,12 @@ static void at91_nand_disable(struct at9
 		at91_set_gpio_value(host->board->enable_pin, 1);
 }

+#ifdef CONFIG_MTD_PARTITIONS
+#ifdef CONFIG_MTD_CMDLINE_PARTS
+const char *part_probes[] = { "cmdlinepart", NULL };
+#endif
+#endif
+
 /*
  * Probe for the NAND device.
  */
@@ -148,6 +154,12 @@ #endif
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
 		printk(KERN_ERR "at91_nand: No parititions defined, or unsupported
device.\n");
