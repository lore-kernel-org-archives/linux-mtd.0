Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cw088-0006pi-Kt
	for linux-mtd@lists.infradead.org; Tue, 01 Feb 2005 10:39:54 -0500
Date: Tue, 1 Feb 2005 16:39:46 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050201153945.GA26068@synertronixx3>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: I need still help with XIP, kernel boots now :)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi people!

Now I need definately have XIP to get running :/

I use 2.6.11-rc2-mm2 and put the "xipu" patches into it, which make the
"make xipuImage" available and the XIP Kernel boots now. heureka.

Due to the fakt I have no hardware partiotionable Flash devices I need
to utlize the mtd software support to cexist with an XIP Kernel
(CONFIG_MTD_XIP=y). I changed the xip.h to

#if defined(CONFIG_ARCH_SA1100) || defined(CONFIG_ARCH_PXA) || defined(CONFIG_ARCH_IMX)

#include <asm/hardware.h>
#ifdef CONFIG_ARCH_PXA
#include <asm/arch/pxa-regs.h>
#endif

#ifdef CONFIG_ARCH_IMX
#include <asm/arch/imx-regs.h>
#endif /* CONFIG_ARCH_IMX */

#endif /* CONFIG_ARCH_ */

#if defined(CONFIG_ARCH_PXA)

#define xip_irqpending()        (ICIP & ICMR)

/* we sample OSCR and convert desired delta to usec (1/4 ~= 1000000/3686400) */
#define xip_currtime()          (OSCR)
#define xip_elapsed_since(x)    (signed)((OSCR - (x)) / 4)

#elif defined (CONFIG_ARCH_IMX)

#define xip_irqpending()        (( IMX_INTENABLEH  & IMX_NIPNDH ) || ( IMX_INTENABLEL & IMX_NIPNDL ))

/* we hopefully too :p */
#define xip_currtime()          (IMX_TCN(1))
#define xip_elapsed_since(x)    (signed)((IMX_TCN(1) - (x)) / 4)

#elif

So, when I read datasheet correct, pxa's ICIP corresponds to i.MX's NIPNDx 
and pxa's ICMR to i.MX's INTENABLEx.

When I boot the xipuImage with / mounted ro it boots most often to the
loginprompt, I can login and do stuff. But when / is mounted rw the
system brakes. this happens after 

Probing scb9328_flash at physical address 0x10000000 (16-bit buswidth)
scb9328_flash: Found 1 x16 devices at 0x0 in 16-bit bank              
Intel/Sharp Extended Query Table at 0x0031             
cfi_cmdset_0001: write suspend disabled    
Using buffer write method              
cfi_cmdset_0001: Erase suspend on write enabled
5 cmdlinepart partitions found on MTD device scb9328_flash
Creating 5 MTD partitions on "scb9328_flash":             
0x00000000-0x00020000 : "U-boot"             
0x00020000-0x00040000 : "U-boot_env"
0x00040000-0x00140000 : "kernel"    
0x00140000-0x00540000 : "root"  
0x00540000-0x00940000 : "fs"
NET: Registered protocol family 2
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP established hash table entries: 1024 (order: 1, 8192 bytes)
TCP bind hash table entries: 1024 (order: 0, 4096 bytes)       
TCP: Hash tables configured (established 1024 bind 1024)

Its also possible to mount / ro and mount rw a fourth partition after
logging in, kernel freezes then.

So I have an error in my setup. Is xip.h the only place, which should be
adapted from pxa/sa1100 to i.MX?

When compiling the cmopiler warns:

  CC      drivers/mtd/chips/cfi_probe.o
/tmp/ccnLmXio.s: Assembler messages:
/tmp/ccnLmXio.s:3: Warning: ignoring changed section attributes for .data
  CC      drivers/mtd/chips/cfi_util.o
/tmp/ccjtGCIO.s: Assembler messages:
/tmp/ccjtGCIO.s:13: Warning: ignoring changed section attributes for .data
  CC      drivers/mtd/chips/cfi_cmdset_0001.o

Is this fatal and needs to be adjusted in platform stuff or arch stuff?

Regards, Konsti


-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
