Received: from mail-lf0-x22e.google.com ([2a00:1450:4010:c07::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aO1Y2-0002DT-1w
 for linux-mtd@lists.infradead.org; Tue, 26 Jan 2016 11:12:35 +0000
Received: by mail-lf0-x22e.google.com with SMTP id c192so102481619lfe.2
 for <linux-mtd@lists.infradead.org>; Tue, 26 Jan 2016 03:12:13 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/6] Versatile flash protection in DT
Date: Tue, 26 Jan 2016 12:11:59 +0100
Message-Id: <1453806725-4880-1-git-send-email-linus.walleij@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch set augments the physmap driver to react to the
"arm,versatile-flash" compatible string by installing special
VPP/writeprotect handling so that the corresponding boardfile
code can be removed from the ARM boardfiles.

The patches pretty much speak for themselves, I would eventually
like to have the two mtd patches merged into the MTD tree
by themselves, and the rest of the patches merged into the
ARM SoC tree, as there is no compile-time dependency between
them and we can do a smooth transition along with other
cleanup patches in the ARM SoC tree.

Linus Walleij (6):
  mtd: augment the "arm,versatile-flash" bindings
  mtd: physmap_of: add a hook for Versatile write protection
  ARM: versatile: move flash registration to the device tree
  ARM: integrator: move flash registration to device tree
  ARM: realview: add flash devices to the PB1176 DTS
  ARM: realview: fix up PB11MP flash compat strings

 .../devicetree/bindings/mtd/arm-versatile.txt      |  20 +-
 arch/arm/boot/dts/arm-realview-pb1176.dts          |  32 +++
 arch/arm/boot/dts/arm-realview-pb11mp.dts          |   4 +-
 arch/arm/boot/dts/integrator.dtsi                  |   3 +-
 arch/arm/boot/dts/versatile-ab.dts                 |   5 +-
 arch/arm/mach-integrator/integrator_ap.c           |  62 -----
 arch/arm/mach-integrator/integrator_cp.c           |  51 -----
 arch/arm/mach-versatile/versatile_dt.c             |  47 ----
 drivers/mtd/maps/Kconfig                           |  10 +
 drivers/mtd/maps/Makefile                          |   1 +
 drivers/mtd/maps/physmap_of.c                      |   6 +
 drivers/mtd/maps/physmap_of_versatile.c            | 253 +++++++++++++++++++++
 drivers/mtd/maps/physmap_of_versatile.h            |  16 ++
 13 files changed, 344 insertions(+), 166 deletions(-)
 create mode 100644 drivers/mtd/maps/physmap_of_versatile.c
 create mode 100644 drivers/mtd/maps/physmap_of_versatile.h

-- 
2.4.3
