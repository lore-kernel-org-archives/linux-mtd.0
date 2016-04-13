Received: from mail-lf0-x22e.google.com ([2a00:1450:4010:c07::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqSIF-0006wJ-DI
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 21:25:48 +0000
Received: by mail-lf0-x22e.google.com with SMTP id j11so86588701lfb.1
 for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2016 14:25:25 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 13 Apr 2016 18:25:23 -0300
Message-ID: <CAEVGjpo0J7nsoSX7LHqypUH=83unohxk5QTyP=dQevmZOLMq_w@mail.gmail.com>
Subject: Bit flip detection after boot
From: Raphael Pereira <raphael@rmi.inf.br>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a custom board with a GPMI interface (Freescale i.MX233) with
kernel 4.1.18 using Micron MT29F4G08ABADAWP (nand: 512 MiB, SLC, erase
size: 128 KiB, page size: 2048, OOB size: 64).

When I boot, the flash gets recognized and works flawless. I can
ubiformat, ubiattach, mount, copy a lot of files, umount, remount,
check and test in whatever way I need. No problem arrises.
The problem is that when I shut the system down (turn it off) and boot
again, all used blocks are marked as badblocks.

I have used another flash (Toshiba with w/ erase size: 256KiB) and it
works perfectly, with no problem at all.

Trying to find out what might be the problem, I found BBT DTS option,
so I enabled it and, instead of marking all blocks as bad, I end up
with UBI detecting bit-flips on all sectors, but correctable flips, so
I can use the flash normally (although it takes a lot of time to boot
because of the many messages "ubi0: fixable bit-flip detected at PEB
XXX".

I have changed the chip a lot of times and have checked my hardware
and I am quite sure it is not a hardware problem. I think that some
structure detection of the flash is wrong in the kernel for this
particular case (i.MX233 BCH + MT29F4G08ABADAWP).

Can someone guide me in debugging this problem?

Best Regards,

--
Raphael Derosso Pereira
raphael@rmi.inf.br
+55-41-8877-1762
