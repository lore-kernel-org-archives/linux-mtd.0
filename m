Received: from 213-97-242-113.uc.nombres.ttd.es ([213.97.242.113] helo=rebirth.wojtyla.org)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16kPJh-0004yw-00
	for <linux-mtd@lists.infradead.org>; Mon, 11 Mar 2002 12:54:17 +0000
Received: from devil.teleline.es (devil.iqc-services.local [192.168.197.3])
	by rebirth.wojtyla.org (8.11.6/8.8.7) with ESMTP id g2BDj9h15132
	for <linux-mtd@lists.infradead.org>; Mon, 11 Mar 2002 14:45:09 +0100
Message-Id: <5.1.0.14.2.20020311140356.01e90ec0@pop3.terra.es>
Date: Mon, 11 Mar 2002 14:05:31 +0100
To: linux-mtd@lists.infradead.org
From: Securez <securez@teleline.es>
Subject: Problems compiling MTD
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hello i'm using uClinux on a MC68VZ328 booting form the flash 
http://www.openhardware.net/Dragonix .
I want to get MTD working to use JFFS on it, but i get this errors:

drivers/mtd/mtdlink.o: In function 
`physmap_read8':/home/devil/new-kernel/uClinux-dist/linux-2.4.x/drivers/mtd/maps/physmap.c:24: 
undefined reference to `__raw_readb'drivers/mtd/mtdlink.o: In function 
`physmap_read16':/home/devil/new-kernel/uClinux-dist/linux-2.4.x/drivers/mtd/maps/physmap.c:29: 
undefined reference to `__raw_readw'drivers/mtd/mtdlink.o: In function 
`physmap_read32':/home/devil/new-kernel/uClinux-dist/linux-2.4.x/drivers/mtd/maps/physmap.c:34: 
undefined reference to `__raw_readl'drivers/mtd/mtdlink.o: In function 
`physmap_write8':/home/devil/new-kernel/uClinux-dist/linux-2.4.x/drivers/mtd/maps/physmap.c:44: 
undefined reference to `__raw_writeb'drivers/mtd/mtdlink.o: In function 
`physmap_write16':/home/devil/new-kernel/uClinux-dist/linux-2.4.x/drivers/mtd/maps/physmap.c:50: 
undefined reference to `__raw_writew'drivers/mtd/mtdlink.o: In function 
`physmap_write32':/home/devil/new-kernel/uClinux-dist/linux-2.4.x/drivers/mtd/maps/physmap.c:56: 
undefined reference to `__raw_writel'make[1]: *** [linux] Error 1make[1]: 
Leaving directory `/home/devil/new-kernel/uClinux-dist/linux-2.4.x'

I redefine this references in include/asm/io.h to solve this, where need to 
go this?? is correct here??

#define __raw_readb readb
#define __raw_readw readw
#define __raw_readl readl
.
..

After this the kernel compiles ok.
I program the flash, and when i reboot, the kernel seems ok, but when a 
message appears in the console:
physmap flash device:40000 at 2000000
The system reboots, :(.

What is happend??
