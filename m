Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=kira.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O7ctu-000701-Kt
	for linux-mtd@lists.infradead.org; Thu, 29 Apr 2010 23:12:12 +0000
Message-Id: <20100429231204.169647403@fluff.org.uk>
Date: Fri, 30 Apr 2010 00:11:37 +0100
From: Ben Dooks <ben@simtec.co.uk>
To: linux-arm-kernel@lists.arm.linux.org.uk
Subject: [patch 1/2] kirkwood: allow machines to register RnB line with mtd
	driver
References: <20100429231136.086930268@fluff.org.uk>
Content-Disposition: inline;
	filename=slinux/arm/kirkwood/allow-mtd-ready-not-busy-registration.patch
Cc: Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a kirkwood_nand_init_rnb() call to allow boards which
have RnB line detection to register this instead of a
static delay.

Signed-off-by: Ben Dooks <ben@simtec.co.uk>
Cc: Linux MTD <linux-mtd@lists.infradead.org>

Index: linux-2.6-2.6.32.9/arch/arm/mach-kirkwood/common.c
===================================================================
--- linux-2.6-2.6.32.9.orig/arch/arm/mach-kirkwood/common.c	2010-02-23 15:38:51.%N +0000
+++ linux-2.6-2.6.32.9/arch/arm/mach-kirkwood/common.c	2010-03-11 13:25:01.%N +0000
@@ -305,6 +305,15 @@
 	platform_device_register(&kirkwood_nand_flash);
 }
 
+void __init kirkwood_nand_init_rnb(struct mtd_partition *parts, int nr_parts,
+				   int (*dev_ready)(struct mtd_info *))
+{
+	kirkwood_clk_ctrl |= CGC_RUNIT;
+	kirkwood_nand_data.parts = parts;
+	kirkwood_nand_data.nr_parts = nr_parts;
+	kirkwood_nand_data.dev_ready = dev_ready;
+	platform_device_register(&kirkwood_nand_flash);
+}
 
 /*****************************************************************************
  * SoC RTC
Index: linux-2.6-2.6.32.9/arch/arm/mach-kirkwood/common.h
===================================================================
--- linux-2.6-2.6.32.9.orig/arch/arm/mach-kirkwood/common.h	2010-02-23 15:38:51.%N +0000
+++ linux-2.6-2.6.32.9/arch/arm/mach-kirkwood/common.h	2010-03-11 13:25:01.%N +0000
@@ -16,6 +16,7 @@
 struct mv_sata_platform_data;
 struct mvsdio_platform_data;
 struct mtd_partition;
+struct mtd_info;
 
 /*
  * Basic Kirkwood init functions used early by machine-setup.
@@ -41,6 +42,7 @@
 void kirkwood_uart0_init(void);
 void kirkwood_uart1_init(void);
 void kirkwood_nand_init(struct mtd_partition *parts, int nr_parts, int delay);
+void kirkwood_nand_init_rnb(struct mtd_partition *parts, int nr_parts, int (*dev_ready)(struct mtd_info *));
 
 extern int kirkwood_tclk;
 extern struct sys_timer kirkwood_timer;
