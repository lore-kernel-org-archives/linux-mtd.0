Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JUd9J-0001LS-RE
	for linux-mtd@lists.infradead.org; Thu, 28 Feb 2008 07:25:50 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JUd9F-0002lZ-VX
	for linux-mtd@lists.infradead.org; Thu, 28 Feb 2008 07:25:46 +0000
Received: from 82-135-208-232.ip.zebra.lt ([82.135.208.232])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Feb 2008 07:25:45 +0000
Received: from augulis.darius by 82-135-208-232.ip.zebra.lt with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Feb 2008 07:25:45 +0000
To: linux-mtd@lists.infradead.org
From: Darius <augulis.darius@gmail.com>
Subject: [PATCH] Boot XIP kernel for IMX
Date: Thu, 28 Feb 2008 09:24:26 +0200
Message-ID: <fq5nlh$h6g$2@ger.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------040802030001000909000905"
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------040802030001000909000905
Content-Type: text/plain; charset=ISO-8859-13; format=flowed
Content-Transfer-Encoding: 7bit

Adds possibility to boot XIP kernel from flash for IMX.
I have tested it with M9328MXLADS V2.0 board.
It does NOT support write to flash, it only does support booting xip 
kernel. Somebody can continue and make feature to have rw rootfs in the 
flash with XIP kernel together:)

--------------040802030001000909000905
Content-Type: text/plain;
 name="patch-imx-xip-support-2.6.24.3"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-imx-xip-support-2.6.24.3"

diff -uprN -X linux-2.6.24.3-vanilla//Documentation/dontdiff linux-2.6.24.3-vanilla/arch/arm/Kconfig linux-2.6.24.3/arch/arm/Kconfig
--- linux-2.6.24.3-vanilla/arch/arm/Kconfig	2008-01-25 00:58:37.000000000 +0200
+++ linux-2.6.24.3/arch/arm/Kconfig	2008-02-27 14:51:50.000000000 +0200
@@ -244,6 +244,7 @@ config ARCH_IMX
 	select GENERIC_GPIO
 	select GENERIC_TIME
 	select GENERIC_CLOCKEVENTS
+	select ARCH_MTD_XIP
 	help
 	  Support for Motorola's i.MX family of processors (MX1, MXL).
diff -uprN -X linux-2.6.24.3-vanilla//Documentation/dontdiff linux-2.6.24.3-vanilla/include/asm-arm/arch-imx/imx-regs.h linux-2.6.24.3/include/asm-arm/arch-imx/imx-regs.h
--- linux-2.6.24.3-vanilla/include/asm-arm/arch-imx/imx-regs.h	2008-01-25 00:58:37.000000000 +0200
+++ linux-2.6.24.3/include/asm-arm/arch-imx/imx-regs.h	2008-02-13 17:58:42.000000000 +0200
@@ -348,6 +348,10 @@
 #define IMX_INTENABLEH     __REG(IMX_AITC_BASE+0x10)
 #define IMX_INTENABLEL     __REG(IMX_AITC_BASE+0x14)
 
+#define IMX_NIPNDH	__REG(IMX_AITC_BASE+0x58) 		/* Normal Interrupt Pending Register High */
+#define IMX_NIPNDL 	__REG(IMX_AITC_BASE+0x5C)		/* Normal Interrupt Pending Register Low  */
+
+
 /*
  *  General purpose timers
  */
diff -uprN -X linux-2.6.24.3-vanilla//Documentation/dontdiff linux-2.6.24.3-vanilla/include/asm-arm/arch-imx/mtd-xip.h linux-2.6.24.3/include/asm-arm/arch-imx/mtd-xip.h
--- linux-2.6.24.3-vanilla/include/asm-arm/arch-imx/mtd-xip.h	1970-01-01 03:00:00.000000000 +0300
+++ linux-2.6.24.3/include/asm-arm/arch-imx/mtd-xip.h	2008-02-27 15:00:22.000000000 +0200
@@ -0,0 +1,37 @@
+/*
+ * MTD primitives for XIP support. Architecture specific functions
+ *
+ * Do not include this file directly. It's included from linux/mtd/xip.h
+ * 
+ * Author:	
+ * Created:	Nov 2, 2004
+ * Copyright:	(C) 2004 MontaVista Software, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * $Id: xip.h,v 1.2 2004/12/01 15:49:10 nico Exp $
+ */
+
+#ifndef __ARCH_IMX_MTD_XIP_H__
+#define __ARCH_IMX_MTD_XIP_H__
+
+#include <asm/arch/imx-regs.h>
+
+#define xip_irqpending()        (( IMX_INTENABLEH  & IMX_NIPNDH ) || ( IMX_INTENABLEL & IMX_NIPNDL ))
+#define xip_currtime()          (IMX_TCN(1))
+#define xip_elapsed_since(x)    (signed)((IMX_TCN(1) - (x)) / 4)
+
+/*
+#define xip_irqpending()        ( IMX_NIPNDH || IMX_NIPNDL )
+#define xip_currtime()          (IMX_TCN(IMX_TIM1_BASE))
+#define xip_elapsed_since(x)    (signed)((IMX_TCN(IMX_TIM1_BASE) -(x)) * 31)
+*/
+
+//#define xip_cpu_idle()  asm volatile ("mcr p14, 0, %0, c7, c0, 0" :: "r" (1))
+
+#warning IMX_MTD_XIP enabled!
+
+#endif /* __ARCH_IMX_MTD_XIP_H__ */
+

--------------040802030001000909000905--
