Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ECE0V-0000vG-Pu
	for linux-mtd@lists.infradead.org; Mon, 05 Sep 2005 06:15:26 -0400
Date: Mon, 5 Sep 2005 12:15:07 +0200
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050905101502.GA21861@synertronixx3>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: XIP on 2.6.13 broken
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi People!

I recently ported my code running perfect on 2.6.12 to 2.6.13.
I use an Intel K3 Flash device (cfi_cmdset_0001.c).

However, the recent XIP on 2.6.13 is very unstable. It mostly freezes
when the bootup init.d processes start to read/write the / partition.
Sometimes it comes to live but for example usb-storage gets an
garbaged read (ls -la) from an mounted usb-device.
linux-wlan-ng is not able to issue one succesful ping command.
The error seemed to be either in the usb host-controller driver or in
the linux-wlan-ng package so I searched the error there for a couple
of days. 

But I found out, the system is working perfect when I disable
xip!

Well, I think I followed the change from the #ifdef mess in
include/linux/mtd/xip.h to asm/arch/mtd-xip.h correct...

Here it is:

#ifndef __ARCH_IMX_MTD_XIP_H__
#define __ARCH_IMX_MTD_XIP_H__

#include <asm/arch/imx-regs.h>

#define xip_irqpending()        ( IMX_NIPNDH || IMX_NIPNDL )

#define xip_currtime()          (IMX_TCN(IMX_TIM1_BASE))
#define xip_elapsed_since(x)    (signed)((IMX_TCN(IMX_TIM1_BASE) -(x)) * 31)

#define xip_iprefetch() asm volatile (".rep 8; nop; .endr");

#define xip_cpu_idle()  asm volatile ("mcr p14, 0, %0, c7, c0, 0" :: "r" (1))

#warning KGK 

#endif /* __ARCH_IMX_MTD_XIP_H__ */


Hm, well, where could I start to search for a significant change?

Regards, Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
