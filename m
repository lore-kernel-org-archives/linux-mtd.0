Received: from outbound01.mx-relay.com ([5.39.185.33]
 helo=outbound01-b.mx-relay.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dyvpk-00082P-2h
 for linux-mtd@lists.infradead.org; Mon, 02 Oct 2017 08:12:15 +0000
Received: from [145.131.171.178] (rt171bb131-145-178.routit.net
 [145.131.171.178]) by outbound01-b.mx-relay.com with ESMTP id
 plCAO38i0W2t2y1q (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <linux-mtd@lists.infradead.org>; Mon, 02 Oct 2017 10:06:26 +0200 (CEST)
Received: from localhost (localhost.localhost [127.0.0.1])
 by router38.aimvalley.nl (Postfix) with ESMTP id DAFD7639F5
 for <linux-mtd@lists.infradead.org>; Mon,  2 Oct 2017 10:06:23 +0200 (CEST)
Received: from mail5.aimvalley.nl (mail5.aimsys.nl [10.10.0.115])
 by router38.aimvalley.nl (Postfix) with ESMTPS id 86E6C639F1
 for <linux-mtd@lists.infradead.org>; Mon,  2 Oct 2017 10:06:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail5.aimvalley.nl (Postfix) with ESMTP id 6C47914C4C70
 for <linux-mtd@lists.infradead.org>; Mon,  2 Oct 2017 10:06:22 +0200 (CEST)
Received: from mail5.aimvalley.nl ([127.0.0.1])
 by localhost (mail5.aimvalley.nl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Q5ObTOvzvZgS for <linux-mtd@lists.infradead.org>;
 Mon,  2 Oct 2017 10:06:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail5.aimvalley.nl (Postfix) with ESMTP id B1A3914C54D6
 for <linux-mtd@lists.infradead.org>; Mon,  2 Oct 2017 10:06:21 +0200 (CEST)
Received: from mail5.aimvalley.nl ([127.0.0.1])
 by localhost (mail5.aimvalley.nl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id nRg5ObOGm3Ce for <linux-mtd@lists.infradead.org>;
 Mon,  2 Oct 2017 10:06:21 +0200 (CEST)
Received: from linvm302.aimsys.nl (unknown [10.10.23.2])
 by mail5.aimvalley.nl (Postfix) with ESMTPSA id 8F59714C4C70
 for <linux-mtd@lists.infradead.org>; Mon,  2 Oct 2017 10:06:21 +0200 (CEST)
Subject: Re: ubifs robustness with early power cut warning
To: linux-mtd@lists.infradead.org
References: <CAAEsGz+1T6eAHW_adm-RKHoaK6gv=ZtRdcMTum6+s1TXR0PzEQ@mail.gmail.com>
From: Kees Trommel <ctrommel@aimvalley.nl>
Message-ID: <740e523e-2373-0e8c-6480-ecd68fff6ef3@aimvalley.nl>
Date: Mon, 2 Oct 2017 10:06:21 +0200
MIME-Version: 1.0
In-Reply-To: <CAAEsGz+1T6eAHW_adm-RKHoaK6gv=ZtRdcMTum6+s1TXR0PzEQ@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------F44F39A404F1E83AE3A83F5E"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------F44F39A404F1E83AE3A83F5E
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Doug,

Attached a patch file with an implementation that I developed for our 
custom board that has an early powerdown (is dying) signal (GPIO pin).

The idea is that when an "I am dying" condition is detected no erase or 
program is started by the mtd layer. It is assumed that an erase or 
program started before the board starts to die will be completed 
successfully.

Kees.

On 09/30/17 01:20, Doug Crawford wrote:
> We have an embedded system with an early power loss warning.  The
> power supply drives a powerdown signal connected to a GPIO pin on the
> CPU.  When AC power is switched off the power supply drives this
> signal low for 500 milliseconds before the CPU gets held in reset.  If
> AC power is switched back on before 500 milliseconds the powerdown
> signal goes high again and the system is expected to continue running
> normally.
>
> I am wondering if there is a way to easily modify ubifs/ubi such that
> when the powerdown gpio is low VFS or UBIFS or UBI freezes or pauses
> further writes to the NAND.  If powerdown recovers to high again then
> the filesystem would unfreeze and allow further writes?  Has anyone
> implemented something like this before?  I know UBIFS/UBI is designed
> to be very resilient to power cuts, but I am thinking this technique
> might make the system even more resilient.  If I were to make this
> change which file would be the right one to hook into:
> fs/ubifs/super.c?
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



--------------F44F39A404F1E83AE3A83F5E
Content-Type: text/x-patch;
 name="mtd_dying.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="mtd_dying.patch"

diff -urN mtd_dying.org/arch/arm/configs/ls1021a_defconfig mtd_dying.new/arch/arm/configs/ls1021a_defconfig
--- mtd_dying.org/arch/arm/configs/ls1021a_defconfig	2017-10-02 09:49:04.866784219 +0200
+++ mtd_dying.new/arch/arm/configs/ls1021a_defconfig	2017-10-02 09:40:59.346787515 +0200
@@ -26,6 +26,7 @@
 CONFIG_ARCH_VIRT=y
 CONFIG_ARCH_MXC=y
 CONFIG_SOC_LS1021A=y
+CONFIG_BOARD_PSD=y
 CONFIG_ARM_LPAE=y
 # CONFIG_CACHE_L2X0 is not set
 CONFIG_PCI=y
diff -urN mtd_dying.org/arch/arm/mach-imx/Kconfig mtd_dying.new/arch/arm/mach-imx/Kconfig
--- mtd_dying.org/arch/arm/mach-imx/Kconfig	2017-10-02 09:39:36.812537914 +0200
+++ mtd_dying.new/arch/arm/mach-imx/Kconfig	2017-10-02 09:40:59.360156438 +0200
@@ -626,6 +626,14 @@
 	help
 	  This enables support for Freescale LS1021A processor.
 
+config BOARD_PSD
+	bool "AimValley PSD support"
+	depends on SOC_LS1021A
+	select CONSOLE_POLL
+
+	help
+	  This enables support for the AimValley PSD board.
+
 endif
 
 source "arch/arm/mach-imx/devices/Kconfig"
diff -urN mtd_dying.org/arch/arm/mach-imx/Makefile mtd_dying.new/arch/arm/mach-imx/Makefile
--- mtd_dying.org/arch/arm/mach-imx/Makefile	2017-10-02 09:39:36.827457495 +0200
+++ mtd_dying.new/arch/arm/mach-imx/Makefile	2017-10-02 09:40:59.374071091 +0200
@@ -109,4 +109,6 @@
 
 obj-$(CONFIG_SOC_LS1021A) += mach-ls1021a.o
 
+obj-$(CONFIG_BOARD_PSD) += board-psd.o
+
 obj-y += devices/
diff -urN mtd_dying.org/arch/arm/mach-imx/board-psd.c mtd_dying.new/arch/arm/mach-imx/board-psd.c
--- mtd_dying.org/arch/arm/mach-imx/board-psd.c	1970-01-01 01:00:00.000000000 +0100
+++ mtd_dying.new/arch/arm/mach-imx/board-psd.c	2017-10-02 09:43:40.170792532 +0200
@@ -0,0 +1,87 @@
+/*
+ * PSD specific kernel customizations
+ *
+ * Copyright (c) 2016 AimValley B.V., the Netherlands
+ * You may only use or distribute this file if you have a valid license agreement with AimValley B.V.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
+ * MA 02110-1301, USA.
+ */
+
+#include "linux/printk.h"
+#include <linux/kmsg_dump.h>
+#include "linux/reboot.h"
+#include "linux/gpio.h"
+#include "linux/mtd/mtd.h"
+#include "linux/interrupt.h"
+#include "linux/tty_driver.h"
+
+#define DYING_GASP_GPIO     447
+#define CPU_SELF_RESET_GPIO 391
+
+struct tty_driver *tty = NULL;
+int tty_line = 0;
+
+static void psd_power_off_handler(void)
+{
+	pr_emerg("Cold restart\n");
+	kmsg_dump(KMSG_DUMP_POWEROFF);
+	gpio_set_value(CPU_SELF_RESET_GPIO, 1);
+}
+
+static int psd_is_dying(void)
+{
+	return gpio_get_value(DYING_GASP_GPIO);
+}
+
+static irqreturn_t psd_is_dying_irq(int irq, void* data)
+{
+	u8* s;
+
+	(void) data;
+	(void) irq;
+
+        s = "I am dying ....";
+
+	while (*s) {
+		tty->ops->poll_put_char(tty, tty_line, *s);
+		s++;
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int __init psd_board_init(void)
+{
+	gpio_request(CPU_SELF_RESET_GPIO, "reset");
+	gpio_direction_output(CPU_SELF_RESET_GPIO, 0);
+	gpio_export(CPU_SELF_RESET_GPIO, false);
+
+	kernel_power_off_handler(psd_power_off_handler);
+
+	gpio_request(DYING_GASP_GPIO, "dying gasp");
+	gpio_direction_input(DYING_GASP_GPIO);
+	gpio_export(DYING_GASP_GPIO, false);
+
+	mtd_register_is_dying(psd_is_dying);
+
+	tty = tty_find_polling_driver("ttyS0", &tty_line);
+
+	return request_irq(gpio_to_irq(DYING_GASP_GPIO),
+                           psd_is_dying_irq,
+                           IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+                           "dying gasp",
+                           NULL);
+}
+late_initcall(psd_board_init);
diff -urN mtd_dying.org/drivers/mtd/mtdcore.c mtd_dying.new/drivers/mtd/mtdcore.c
--- mtd_dying.org/drivers/mtd/mtdcore.c	2017-10-02 09:39:36.738676605 +0200
+++ mtd_dying.new/drivers/mtd/mtdcore.c	2017-10-02 09:40:59.286219059 +0200
@@ -73,6 +73,7 @@
 
 static LIST_HEAD(mtd_notifiers);
 
+static int (*mtd_is_dying)(void) = NULL;
 
 #define MTD_DEVT(index) MKDEV(MTD_CHAR_MAJOR, (index)*2)
 
@@ -806,6 +807,8 @@
 		return -EINVAL;
 	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
+	if (mtd_is_dying && mtd_is_dying())
+		return -EPERM;
 	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
 	if (!instr->len) {
 		instr->state = MTD_ERASE_DONE;
@@ -897,6 +900,8 @@
 		return -EINVAL;
 	if (!mtd->_write || !(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
+	if (mtd_is_dying && mtd_is_dying())
+		return -EPERM;
 	if (!len)
 		return 0;
 	return mtd->_write(mtd, to, len, retlen, buf);
@@ -1204,6 +1209,27 @@
 }
 EXPORT_SYMBOL_GPL(mtd_kmalloc_up_to);
 
+/**
+ * mtd_register_is_dying - register an "is dying" callback function
+ * @is_dying: pointer to a function that returns whether the board 
+ *            "is dying" or not
+ *
+ * This routine registers an "is dying" callback function. The callback 
+ * function returns 1 if the board is dying. The board is supposed to be dying 
+ * if the board supply voltage drops below a certain voltage and soon (in few 
+ * milli seconds) will be completely powered down. This function is called in
+ * each mtd_write and mtd_erase and if the board is dying the write or erase
+ * will fail.
+ *
+ * Note: It assumes that a write or erase started before the board starts dying
+ *       can be finished before the CPU and NAND device runs out of power.
+ */
+void mtd_register_is_dying(int (*is_dying)(void))
+{
+    mtd_is_dying = is_dying;
+}
+EXPORT_SYMBOL_GPL(mtd_register_is_dying);
+
 #ifdef CONFIG_PROC_FS
 
 /*====================================================================*/
diff -urN mtd_dying.org/include/linux/mtd/mtd.h mtd_dying.new/include/linux/mtd/mtd.h
--- mtd_dying.org/include/linux/mtd/mtd.h	2017-10-02 09:39:36.766934179 +0200
+++ mtd_dying.new/include/linux/mtd/mtd.h	2017-10-02 09:40:59.314882784 +0200
@@ -422,4 +422,6 @@
 
 unsigned mtd_mmap_capabilities(struct mtd_info *mtd);
 
+void mtd_register_is_dying(int (*is_dying)(void));
+
 #endif /* __MTD_MTD_H__ */
diff -urN mtd_dying.org/include/linux/reboot.h mtd_dying.new/include/linux/reboot.h
--- mtd_dying.org/include/linux/reboot.h	2017-10-02 09:39:36.757224289 +0200
+++ mtd_dying.new/include/linux/reboot.h	2017-10-02 09:40:59.298836982 +0200
@@ -63,6 +63,7 @@
 extern void kernel_restart(char *cmd);
 extern void kernel_halt(void);
 extern void kernel_power_off(void);
+extern void kernel_power_off_handler(void (*power_off)(void));
 
 extern int C_A_D; /* for sysctl */
 void ctrl_alt_del(void);

--------------F44F39A404F1E83AE3A83F5E--
