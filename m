From: Andrea Adami <andrea.adami@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Lee Jones <lee.jones@linaro.org>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Linus Walleij <linus.walleij@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/9] mtd: sharpslpart partition parser
Date: Wed, 28 Jun 2017 22:30:27 +0200
Message-Id: <1498681836-3765-1-git-send-email-andrea.adami@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patchset introduces a simple partition parser for the Sharp SL
Series PXA handhelds. More details in the commit text.

I have set in cc the ARM PXA maintainers because this is the MTD part of
a planned wider patchset cleaning the Zaurus board files. The MFD maintainers
are also in cc (tmio.h change).

Changelog:
v1 initial import of 2.4 sources [1]
v2 refactor applying many suggested fixes [2]
v3 put the partition parser types in the platform data [3]
v4 refactor after ML review [4]

[1] http://support.ezaurus.com/developer/source/source_dl.asp
[2] https://github.com/LinuxPDA/linux/commits/sharpslpart_v2
[3] https://github.com/LinuxPDA/linux/commits/sharpslpart_v3
[4] https://github.com/LinuxPDA/linux/commits/sharpslpart_v4

Andrea Adami (9):
  mtd: sharpslpart: add sharpslpart MTD partition parser
  mtd: nand: sharpsl.h: support partition parser types
  mfd: tmio.h: support partition parser types
  mtd: nand: sharpsl.c: take in account partition parser types
  mtd: nand: tmio_nand.c: take in account partition parser types
  ARM: pxa: corgi.c: remove hardcoded partitioning, use sharpslpart
    parser
  ARM: pxa: tosa.c: remove hardcoded partitioning, use sharpslpart
    parser
  ARM: pxa: spitz.c: remove hardcoded partitioning, use sharpslpart
    parser
  ARM: pxa: poodle.c: remove hardcoded partitioning, use sharpslpart
    parser

 arch/arm/mach-pxa/corgi.c    |  31 +---
 arch/arm/mach-pxa/poodle.c   |  28 +---
 arch/arm/mach-pxa/spitz.c    |  34 +---
 arch/arm/mach-pxa/tosa.c     |  28 +---
 drivers/mtd/Kconfig          |   8 +
 drivers/mtd/Makefile         |   1 +
 drivers/mtd/nand/sharpsl.c   |   2 +-
 drivers/mtd/nand/tmio_nand.c |   4 +-
 drivers/mtd/sharpslpart.c    | 391 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/tmio.h     |   1 +
 include/linux/mtd/sharpsl.h  |   1 +
 11 files changed, 439 insertions(+), 90 deletions(-)
 create mode 100644 drivers/mtd/sharpslpart.c

-- 
2.7.4
