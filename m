Received: from mail.z9.com ([64.142.101.243])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNAOz-00011J-Lo
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 22:09:34 +0000
Received: from GPontisPC by z9.com (MDaemon PRO v12.5.4)
 with ESMTP id md50000202983.msg
 for <linux-mtd@lists.infradead.org>; Wed, 25 Apr 2012 15:09:32 -0700
From: "George Pontis" <GPontis@z9.com>
To: <linux-mtd@lists.infradead.org>
Subject: atmel_nand, DMA, and "Fall back to CPU I/O"
Date: Wed, 25 Apr 2012 15:09:14 -0700
Message-ID: <037801cd2330$0cd747d0$2685d770$@com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Working with 3.0.13 kernel and the at91sam9g45, 8b NAND flash with rootfs in
NAND

At boot, the kernel shows 22 DMA warnings, then another 260 as UBIFS mounts
the root FS:

atmel_nand atmel_nand: Fall back to CPU I/O

The Atmel nand driver is being passed an address, 0xc80000000, that fails
the test
for being at or higher than high_memory. The memory layout looks like this:

Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
    DMA     : 0xffa00000 - 0xffe00000   (   4 MB)
    vmalloc : 0xc8800000 - 0xfee00000   ( 870 MB)
    lowmem  : 0xc0000000 - 0xc8000000   ( 128 MB)
    modules : 0xbf000000 - 0xc0000000   (  16 MB)
      .init : 0xc0008000 - 0xc0027000   ( 124 kB)
      .text : 0xc0027000 - 0xc0456d8c   (4288 kB)
      .data : 0xc0458000 - 0xc0480ae0   ( 163 kB)
       .bss : 0xc0480b04 - 0xc04ab8b4   ( 172 kB)

Is it normal for a driver to get an address that is not inside one of these
ranges, whether
it used vmalloc or not ?

If the driver is not going to get pointers to a DMA-safe area, would it not
be better
to disable DMA, or at least set the default use_dma=0 ? 

George
