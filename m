Received: from ithilien.qualcomm.com ([129.46.51.59])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19zipR-0004WI-6G
	for <linux-mtd@lists.infradead.org>; Wed, 17 Sep 2003 21:23:09 +0100
Received: from crowley.qualcomm.com (crowley.qualcomm.com [129.46.61.151])
	h8HKMQuI027817	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Sep 2003 13:22:26 -0700 (PDT)
Received: from HKING.qualcomm.com (hking.qualcomm.com [129.46.71.236])
	h8HKMOix019959	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Sep 2003 13:22:24 -0700 (PDT)
Message-Id: <5.2.0.9.2.20030917131152.054a7210@e2k.qualcomm.com>
Date: Wed, 17 Sep 2003 13:22:08 -0700
To: linux-mtd@lists.infradead.org
From: Howard King <hking@qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: kernel crashed at genprobe_
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Also, I forgot to mention to you that the 1st block of the flash memory are
 > write-protected since the reset words are there.  Don't know if that cause
 > the crash?
 >
 > =============
 > I follow this document (from the link you gave to us) and use "make
 > xconfig" to enable the mtd from the kernel:
I followed your link to get this document:
ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs/mtd/mtd-jffs-HOWTO.txt

I did the following things:
- down load the patch
- re-configure the linux kernel to enable the mtd and jffs options by 
following the HOWTO doc;
- we have 64-bit bus width, I specified 8 (octets) for bus width;
- we have 4 flash chips (8M * 4 = 32MB), I specified 4 interleave for cfi probe
- our flash chip is: AM29LV641DL12EI/T.
- it is our custom 8260 board;
- the first block is write-protected due to the existence of reset word
- the flash address starts 0xfe000000 and length is 0x2000000 (32MB);
- the boot rom is located at 0xfff00100

The kernel crashed after displaying "physmap flash device: 2000000 at
fe000000".
Based on the description at page 7, this output is just reporting what
parameters I have compiled into the system.  It also said we need to check
physmap.c which uses ioremap() to map the physical memory into an area of
logical memory.
I did change it to ioremap_noncache() but it still crashed at
genprobe_new_chips().

We use BDI2000 debugger to burn the U-BOOT code to the flash for our board 
and boot
correctly.  We need the file system so we can boot up the linux from flash.

Howard King
