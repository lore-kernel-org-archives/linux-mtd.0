Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1czU2q-0005qo-Ah
 for linux-mtd@lists.infradead.org; Sat, 15 Apr 2017 20:11:45 +0000
Received: by mail-wr0-x242.google.com with SMTP id u18so16157086wrc.1
 for <linux-mtd@lists.infradead.org>; Sat, 15 Apr 2017 13:11:22 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] mtd: sharpslpart partition parser
Date: Sat, 15 Apr 2017 22:11:15 +0200
Message-Id: <1492287078-22369-1-git-send-email-andrea.adami@gmail.com>
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
a planned wider patchset cleaning the Zaurus board files.

Andrea Adami (3):
  mtd: sharpsl: add sharpslpart MTD partition parser
  mtd: nand: sharpsl.c: prefer sharpslpart MTD partition parser
  mtd: nand: tmio_nand.c: prefer sharpslpart MTD partition parser

 drivers/mtd/Kconfig          |   8 ++
 drivers/mtd/Makefile         |   2 +
 drivers/mtd/nand/sharpsl.c   |   4 +-
 drivers/mtd/nand/tmio_nand.c |   4 +-
 drivers/mtd/sharpsl_ftl.c    | 309 +++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/sharpsl_ftl.h    |  34 +++++
 drivers/mtd/sharpslpart.c    | 142 ++++++++++++++++++++
 7 files changed, 501 insertions(+), 2 deletions(-)
 create mode 100644 drivers/mtd/sharpsl_ftl.c
 create mode 100644 drivers/mtd/sharpsl_ftl.h
 create mode 100644 drivers/mtd/sharpslpart.c

-- 
2.7.4
