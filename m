Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfUh2-0004C6-KK
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2015 15:13:49 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Andrea Scian <rnd4@dave-tech.it>,
 =?UTF-8?q?Bean=20Huo=20=E9=9C=8D=E6=96=8C=E6=96=8C=20=28beanhuo=29?=
 <beanhuo@micron.com>,
 =?UTF-8?q?Karl=20Zhang=20=E5=BC=A0=E5=8F=8C=E9=94=A3=20=28karlzhang=29?=
 <karlzhang@micron.com>, Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>, Stefan Roese <sr@denx.de>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 0/5] mtd: nand/UBI: add power-cut emulation
Date: Fri, 25 Sep 2015 17:09:13 +0200
Message-Id: <1443193758-22071-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This series aims at adding a power-cut emulation layer at the nandsim
level.
The final goal is to support MLC NAND emulation in nandsim in order to
validate the work done in the NAND, UBI and UBIFS layers to reliably
support those chips.

Even though the UBI layer already provides a power-cut emulation
infrastructure, I decided to add one at the nandsim layer for the
following reasons:
- IMO it is cleaner to isolate MLC NAND emulation in the NAND layer
- emulating unstable bits in UBI is not so easy: the unstable bits
  issue happens when a program or erase operation is interrupted (by a
  power-cut) while it is almost finished. In this case the next read
  operation will succeed (return the expected data), but not the following
  ones.
  Emulating this problem requires knowing which block/page was being
  accessed when the power-cut occurred, and if we want to validate that
  UBI (not UBIFS) is robust to such errors, we have to reattach the mtd
  partition to the UBI layer, and by doing that we loose the information
  of which page/block was being programmed/erased when the power-cut
  occurred.
  By implementing the power-cut emulation at the nandsim level, we can
  easily detach/attach the emulated device, and check still keep those
  information.
- emulating paired pages in UBI is a bit easier but still requires some
  knowledge about the pairing scheme (which differs from one chip to
  another), and I'm not sure yet how this will be exposed by the MTD/NAND
  layers.

This being said, I might be wrong in my assumptions, so feel free to
comment on that decision.

Regarding the code itself, this series adds a simple power-cut emulation
layer, and modifies the intermediate layers (NAND and UBI) to forward
emulated power-cut errors and let the UBIFS layer switch into read-only
mode.

Paired pages and unstable bits emulation is not part of the series, but
can be added on top of those changes by tweaking the actions taken in
nandsim when a power-cut is emulated.

Also, I'm not sure about the method used to inform NAND core when a
power-cut was emulated: I'm currently adding a virtual NAND status flag,
but adding a new field in the nand_chip struct might be a better approach.
This would also allow us to compile out code sections that are only useful
when doing NAND emulation.

Best Regards,

Boris

Boris Brezillon (5):
  mtd: nand: add basic stuff to support power-cut emulation
  mtd: nand: return -EROFS in case of power-cut emulation
  UBI: switch the UBI device in read-only mode when mtd returns -EROFS
  mtd: nand: nandsim: implement ->get_status()
  mtd: nand: nandsim: add support for power-cut emulation

 drivers/mtd/nand/nand_base.c |  34 ++++++--
 drivers/mtd/nand/nandsim.c   | 182 ++++++++++++++++++++++++++++++++++++++++---
 drivers/mtd/ubi/io.c         |   4 +-
 include/linux/mtd/nand.h     |   4 +
 4 files changed, 207 insertions(+), 17 deletions(-)

-- 
1.9.1
