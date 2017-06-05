Received: from conuserg-10.nifty.com ([210.131.2.77])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dI1LW-00080a-BZ
 for linux-mtd@lists.infradead.org; Mon, 05 Jun 2017 23:23:42 +0000
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
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v4 00/23] mtd: nand: denali: Denali NAND IP patch bomb
Date: Tue,  6 Jun 2017 08:21:39 +0900
Message-Id: <1496704922-12261-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series intends to solve various problems.

[1] The driver just retrieves the OOB area as-is
    whereas the controller uses syndrome page layout.
[2] Many NAND chip specific parameters are hard-coded in the driver.
[3] ONFi devices are not working
[4] It can not read Bad Block Marker

Outstanding changes are:
- Fix raw/oob callbacks for syndrome page layout
- Implement setup_data_interface() callback
- Fix/implement more commands for ONFi devices
- Allow to skip the driver internal bounce buffer
- Support PIO in case DMA is not supported
- Switch from ->cmdfunc over to ->cmd_ctrl

18 patches were merged at v2.
11 patches were merged at v3.
Here is the rest of the series.

v1: https://lkml.org/lkml/2016/11/26/144
v2: https://lkml.org/lkml/2017/3/22/804
v3: https://lkml.org/lkml/2017/3/30/90


Masahiro Yamada (23):
  mtd: nand: denali_dt: clean up resource ioremap
  mtd: nand: denali: use BIT() and GENMASK() for register macros
  mtd: nand: add generic helpers to check, match, maximize ECC settings
  mtd: nand: denali: avoid hard-coding ECC step, strength, bytes
  mtd: nand: denali: remove Toshiba and Hynix specific fixup code
  mtd: nand: denali_dt: add compatible strings for UniPhier SoC variants
  mtd: nand: denali: set NAND_ECC_CUSTOM_PAGE_ACCESS
  mtd: nand: denali: do not propagate NAND_STATUS_FAIL to waitfunc()
  mtd: nand: denali: remove unneeded find_valid_banks()
  mtd: nand: denali: handle timing parameters by setup_data_interface()
  mtd: nand: denali: rework interrupt handling
  mtd: nand: denali: fix NAND_CMD_STATUS handling
  mtd: nand: denali: fix NAND_CMD_PARAM handling
  mtd: nand: denali: switch over to cmd_ctrl instead of cmdfunc
  mtd: nand: denali: fix bank reset function to detect the number of
    chips
  mtd: nand: denali: use interrupt instead of polling for bank reset
  mtd: nand: denali: propagate page to helpers via function argument
  mtd: nand: denali: merge struct nand_buf into struct denali_nand_info
  mtd: nand: denali: use flag instead of register macro for direction
  mtd: nand: denali: fix raw and oob accessors for syndrome page layout
  mtd: nand: denali: skip driver internal bounce buffer when possible
  mtd: nand: denali: use non-managed kmalloc() for DMA buffer
  mtd: nand: denali: enable bad block table scan

 .../devicetree/bindings/mtd/denali-nand.txt        |   13 +
 drivers/mtd/nand/denali.c                          | 1701 +++++++++-----------
 drivers/mtd/nand/denali.h                          |  294 ++--
 drivers/mtd/nand/denali_dt.c                       |   54 +-
 drivers/mtd/nand/denali_pci.c                      |   15 +-
 drivers/mtd/nand/nand_base.c                       |  219 +++
 include/linux/mtd/nand.h                           |   35 +
 7 files changed, 1235 insertions(+), 1096 deletions(-)

-- 
2.7.4
