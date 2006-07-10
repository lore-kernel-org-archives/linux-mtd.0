Received: from n1.cetrtapot.si ([212.30.80.17])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FzvS5-0004uV-DU
	for linux-mtd@lists.infradead.org; Mon, 10 Jul 2006 09:06:31 -0400
Received: from localhost (localhost.dmz.cetrtapot.si [127.0.0.1])
	by n1.cetrtapot.si (Postfix) with ESMTP id 92F70BB77
	for <linux-mtd@lists.infradead.org>;
	Mon, 10 Jul 2006 15:05:15 +0200 (CEST)
Received: from n1.cetrtapot.si ([127.0.0.1])
	by localhost (n1.dmz.cetrtapot.si [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 64868-06 for <linux-mtd@lists.infradead.org>;
	Mon, 10 Jul 2006 15:04:56 +0200 (CEST)
Received: from [192.1.1.75] (unknown [192.168.66.2])
	by n1.cetrtapot.si (Postfix) with ESMTP id 3B297BB84
	for <linux-mtd@lists.infradead.org>;
	Mon, 10 Jul 2006 15:04:56 +0200 (CEST)
Message-ID: <44B25073.4020601@cetrtapot.si>
Date: Mon, 10 Jul 2006 15:04:51 +0200
From: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 2/7] mtd: Add map file for mpc83xx boards
References: <9FCDBA58F226D911B202000BDBAD467306E04FD3@zch01exm40.ap.freescale.net>
	<1151504861.17134.39.camel@pmac.infradead.org>
In-Reply-To: <1151504861.17134.39.camel@pmac.infradead.org>
Content-Type: multipart/mixed; boundary="------------090907040107000307010407"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------090907040107000307010407
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

David Woodhouse wrote:
> Use a platform device and physmap. Or better still, extend physmap to
> handle of_devices too and just stick the flash information in the device
> tree.
> 

Hi,

I would like to make flash map driver with physmap or platform device, 
but am not really sure where to start. Is there an implementation 
already in place, like an example? If I understand this correctly when 
using physmap there is no need to create drivers/mtd/maps/xxxx-flash.c file?

I've tried to use platform device like in arch/arm/mach-pxa/lubbock.c, 
but I haven't seen any MTD device upon boot - instead I had to use 
drivers/mtd/maps/lubbock.c like flash map to make /porc/mtd show something.

I've attached my PXA ARM board with some bits from lubbock.c for flash 
platform device. If someone spots whats missing there let me know!

best regards,
hinko

-- 
ČETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenija
Tel. +386 (0) 4 280 66 37
E-mail: hinko.kocevar@cetrtapot.si
Http: www.cetrtapot.si


--------------090907040107000307010407
Content-Type: text/x-patch;
 name="trizeps2.c.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="trizeps2.c.diff"

diff -urN linux-2.6.17-clean/arch/arm/mach-pxa/trizeps2.c linux-2.6.17-stab2/arch/arm/mach-pxa/trizeps2.c
--- linux-2.6.17-clean/arch/arm/mach-pxa/trizeps2.c	1970-01-01 01:00:00.000000000 +0100
+++ linux-2.6.17-stab2/arch/arm/mach-pxa/trizeps2.c	2006-07-03 18:24:59.000000000 +0200
@@ -0,0 +1,278 @@
+/*
+ *  linux/arch/arm/mach-pxa/trizeps2.c
+ *
+ *  Support for the Keith & Koep Trizeps2 PXA25x CPU module.
+ *
+ *  Author:	Hinko Kocevar
+ *  Created:	Jun 29, 2006
+ *  Copyright:	Hinko Kocevar <hinkocevar@gmail.com>
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 as
+ *  published by the Free Software Foundation.
+ */
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/platform_device.h>
+#include <linux/sysdev.h>
+#include <linux/major.h>
+#include <linux/fb.h>
+#include <linux/interrupt.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
+
+#include <asm/setup.h>
+#include <asm/memory.h>
+#include <asm/mach-types.h>
+#include <asm/hardware.h>
+#include <asm/irq.h>
+#include <asm/sizes.h>
+
+#include <asm/mach/arch.h>
+#include <asm/mach/map.h>
+#include <asm/mach/irq.h>
+#include <asm/mach/flash.h>
+
+
+#include <asm/arch/bitfield.h>
+#include <asm/arch/pxa-regs.h>
+#include <asm/arch/trizeps2.h>
+#include <asm/arch/pxafb.h>
+
+#include "generic.h"
+
+#define DEBUG_TRIZEPS2
+#ifdef DEBUG_TRIZEPS2
+#define DPRINTK(fmt, args...) printk("%s: " fmt, __FUNCTION__ , ## args)
+#else
+#define DPRINTK( x... )
+#endif
+
+
+/*
+ * Backlight power control is connected to pin 37
+ * on NetTerm 40-pin LCD connector (unused IRQ_PIC
+ */
+static void trizeps2_backlight_power(int on)
+{
+    if (on)
+    {
+#ifdef CONFIG_ARCH_TRIZEPS2_KK_NETTERM
+        /* enable backlight, set GPIO0 low */
+        GPCR(0) |= GPIO_bit(0);
+        /* GPIO0 output */
+        GPDR(0) |= GPIO_bit(0);
+#elif CONFIG_ARCH_TRIZEPS2_IM_GREENFLASH1
+        /* enable LCD, set GPIO1 high */
+        GPSR(1) |= GPIO_bit(1);
+        /* GPIO1 output */
+        GPDR(1) |= GPIO_bit(1);
+#endif
+    }
+    else
+    {
+#ifdef CONFIG_ARCH_TRIZEPS2_KK_NETTERM
+	/* disable backlight, set GPIO0 high */
+	GPSR(0) |= GPIO_bit(0);
+	/* GPIO0 input */
+	/* GPDR(0) &= ~GPIO_bit(0); */
+#elif CONFIG_ARCH_TRIZEPS2_IM_GREENFLASH1
+	/* disable LCD, set GPIO1 low */
+	GPCR(1) |= GPIO_bit(1);
+#endif
+    }
+}
+
+/*
+ * LCD power control is connected to pin 25 on
+ * NetTerm 40-pin LCD connector (L_DISP)
+ *
+ * LCD power control is connected to GPIO0 on
+ * GreenFLASH1 board (LCD_ON).
+ */
+static void trizeps2_lcd_power(int on)
+{
+    if (on)
+    {
+#ifdef CONFIG_ARCH_TRIZEPS2_KK_NETTERM
+	/* enable LCD, set GPIO1 high */
+	GPSR(1) |= GPIO_bit(1);
+	/* GPIO1 output */
+	GPDR(1) |= GPIO_bit(1);
+#elif CONFIG_ARCH_TRIZEPS2_IM_GREENFLASH1
+	/* enable LCD, set GPIO0 high */
+	GPSR(0) |= GPIO_bit(0);
+	/* GPIO0 output */
+	GPDR(0) |= GPIO_bit(0);
+#endif
+    }
+    else
+    {
+#ifdef CONFIG_ARCH_TRIZEPS2_KK_NETTERM
+	/* disable LCD, set GPIO1 low */
+	GPCR(1) |= GPIO_bit(1);
+#elif CONFIG_ARCH_TRIZEPS2_IM_GREENFLASH1
+	/* disable LCD, set GPIO0 low */
+	GPCR(0) |= GPIO_bit(0);
+	/* GPIO0 input */
+	/* GPDR(0) &= ~GPIO_bit(0); */
+#endif
+    }
+}
+    
+
+static void __init trizeps2_init_irq(void)
+{
+	pxa_init_irq();
+
+	pxa_gpio_mode(GPIO19_DREQ1 | GPIO_ALT_FN_1_IN);
+	pxa_gpio_mode(GPIO46_STRXD_MD);
+	pxa_gpio_mode(GPIO47_STTXD_MD);
+
+	/* 
+	 * NOTE:
+	 * disable IRQ PROBE of GPIO0 and GPIO1 to make sure
+	 * LCD and BL is not powered off in probe_irq_on().
+	 */
+	set_irq_flags(1, IRQF_VALID);
+	set_irq_flags(2, IRQF_VALID);
+
+	set_irq_flags(61, IRQF_VALID);  // disable PROBE
+}
+
+static struct platform_device trizeps2_audio_device = {
+	.name	= "pxa2xx-ac97",
+	.id		= -1,
+};
+
+static struct resource smc91x_resources[] = {
+	[0] = {
+		.name	= "smc91x-regs",
+		.start	= TRIZEPS2_ETH_PHYS,    /*0x0c000300*/
+		.end	= 0x0c0fffff,
+		.flags	= IORESOURCE_MEM,
+	},
+	[1] = {
+		.start	= TRIZEPS2_ETH_IRQ,
+		.end	= TRIZEPS2_ETH_IRQ,
+		.flags	= IORESOURCE_IRQ,
+	},
+};
+
+static struct platform_device smc91x_device = {
+	.name	= "smc91x",
+	.id		= -1,
+	.num_resources	= ARRAY_SIZE(smc91x_resources),
+	.resource	= smc91x_resources,
+};
+
+static struct resource flash_resources[] = {
+	[0] = {
+		.start	= 0x00000000,
+		.end	= SZ_16M - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+};
+
+static struct mtd_partition trizeps2_partitions[] = {
+	{
+		.name =		"Bootloader",
+		.size =		0x00060000,
+		.offset =	0,
+		.mask_flags =	MTD_WRITEABLE  /* force read-only */
+	},{
+		.name =		"Kernel",
+		.size =		0x00200000,
+		.offset =	0x00060000,
+	},{
+		.name =		"Filesystem",
+		.size =		MTDPART_SIZ_FULL,
+		.offset =	0x00260000
+	}
+};
+
+static struct flash_platform_data trizeps2_flash_data[1] = {
+	{
+		.map_name	= "cfi_probe",
+		.parts		= trizeps2_partitions,
+		.nr_parts	= ARRAY_SIZE(trizeps2_partitions),
+	    	.width		= 2,
+		.name		= "application-flash",
+	}, 
+};
+
+static struct platform_device trizeps2_flash_device[1] = {
+	{
+		.name		= "pxa2xx-flash",
+		.id		= 0,
+		.dev = {
+			.platform_data = &trizeps2_flash_data[0],
+		},
+		.resource = &flash_resources[0],
+		.num_resources = 1,
+	},
+};
+
+static struct platform_device *devices[] __initdata = {
+	&trizeps2_audio_device,
+	&smc91x_device,
+	&trizeps2_flash_device[0],
+};
+
+/*
+ * Hitachi SX14Q LCD properties struct
+ */
+static struct pxafb_mach_info hitachi_sx14q __initdata = {
+	.pixclock		= 173521,
+	.xres			= 320,
+	.yres			= 240,
+	.bpp			= 8,
+	.hsync_len		= 1,
+	.left_margin		= 1,
+	.right_margin		= 1,
+	.vsync_len		= 10,
+	.upper_margin		= 0,
+	.lower_margin		= 0,
+	.sync			= FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
+	.cmap_greyscale		= 0,
+	.cmap_inverse		= 0,
+	.cmap_static		= 0,
+	.lccr0			= LCCR0_Pas | LCCR0_Sngl | LCCR0_Color,
+	.lccr3			= LCCR3_PCP | LCCR3_Acb(255),
+	.pxafb_backlight_power	= trizeps2_backlight_power,
+	.pxafb_lcd_power	= trizeps2_lcd_power,
+};
+
+static void __init trizeps2_init(void)
+{
+	set_pxa_fb_info(&hitachi_sx14q);
+	(void) platform_add_devices(devices, ARRAY_SIZE(devices));
+}
+
+static void __init trizeps2_map_io(void)
+{
+	pxa_map_io();
+
+	/* This is for the SMC chip select */
+	pxa_gpio_mode(GPIO79_nCS_3_MD);
+
+	/* setup sleep mode values */
+	PWER  = 0x00000002;
+	PFER  = 0x00000000;
+	PRER  = 0x00000002;
+	PGSR0 = 0x00008000;
+	PGSR1 = 0x003F0202;
+	PGSR2 = 0x0001C000;
+	PCFR |= PCFR_OPDE;
+}
+
+MACHINE_START(TRIZEPS2, "Keith & Koep Trizeps2 PXA25x CPU module")
+	/* Maintainer: Hinko Kocevar */
+	.phys_io	= 0x40000000,
+	.io_pg_offst	= (io_p2v(0x40000000) >> 18) & 0xfffc,
+	.map_io		= trizeps2_map_io,
+	.init_irq	= trizeps2_init_irq,
+	.timer		= &pxa_timer,
+	.init_machine	= trizeps2_init,
+MACHINE_END

--------------090907040107000307010407--
