Received: from conuserg-10.nifty.com ([210.131.2.77])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0jie-0008DT-C4
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 07:08:07 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 0/2] mtd: nand: Add generic helpers check, match,
 maximize ECC settings
Date: Wed, 19 Apr 2017 16:06:56 +0900
Message-Id: <1492585618-13655-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This series is based on the discusson:
https://patchwork.kernel.org/patch/9653063/

Before sending the whole v4 series for the Denali driver,
here is my proposal.

1/2: add generic helpers to the NAND framework

2/2: is an example. Please see how those 3 helper functions
are used.  Please do not apply this.



Masahiro Yamada (2):
  mtd: nand: add generic helpers to check, match, maximize ECC settings
  mtd: nand: denali: show how to use generic helpers (do not apply)

 .../devicetree/bindings/mtd/denali-nand.txt        |   17 +
 drivers/mtd/nand/denali.c                          | 1693 +++++++++-----------
 drivers/mtd/nand/denali.h                          |  297 ++--
 drivers/mtd/nand/denali_dt.c                       |   29 +-
 drivers/mtd/nand/denali_pci.c                      |   11 +-
 drivers/mtd/nand/nand_base.c                       |  178 ++
 include/linux/mtd/nand.h                           |   31 +
 7 files changed, 1178 insertions(+), 1078 deletions(-)

-- 
2.7.4
