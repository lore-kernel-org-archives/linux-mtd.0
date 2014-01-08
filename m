Received: from 7.mo3.mail-out.ovh.net ([46.105.57.200]
 helo=mo3.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0u29-0006Tt-T9
 for linux-mtd@lists.infradead.org; Wed, 08 Jan 2014 14:23:03 +0000
Received: from mail408.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo3.mail-out.ovh.net (Postfix) with SMTP id ECD1E10181C4
 for <linux-mtd@lists.infradead.org>; Wed,  8 Jan 2014 15:22:38 +0100 (CET)
From: Boris BREZILLON <b.brezillon@overkiz.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>,
 David Woodhouse <dwmw2@infradead.org>,
 Grant Likely <grant.likely@linaro.org>
Subject: [RFC PATCH 0/9] mtd: nand: add sunxi NAND Flash Controller support
Date: Wed,  8 Jan 2014 15:21:55 +0100
Message-Id: <1389190924-26226-1-git-send-email-b.brezillon@overkiz.com>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, dev@linux-sunxi.org,
 linux-kernel@vger.kernel.org, Boris BREZILLON <b.brezillon@overkiz.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This series add the sunxi NFC support with up to 8 NAND chip connected.
I'm still in the early stages drivers development and some key features are
missing, but it's usable (I tested it on the cubietruck board).

Here's what's missing:
 - HW ECC support
 - DMA support
 - HW randomization support
 - many more improvements

This series depends on Emilio's patch series implementing mod0 clks
(http://lists.infradead.org/pipermail/linux-arm-kernel/2013-July/185478.html)
+ an other patch not yet posted
(http://git.elopez.com.ar/linux/commits/5b4eb3ac406b9c98965714d40e8dd6da943d1ab0)


Best Regards,

Boris

Boris BREZILLON (9):
  mtd: nand: retrieve ECC requirements from Hynix READ ID byte 4
  mtd: nand: define struct nand_timings
  of: mtd: add NAND timings retrieval support
  of: mtd: add NAND timings bindings documentation
  mtd: nand: add sunxi NFC support
  mtd: nand: add sunxi NFC dt bindings doc
  ARM: dt/sunxi: add NFC node to Allwinner A20 SoC
  ARM: dt/sunxi: add NFC pinctrl pin definitions
  ARM: sunxi/dt: enable NAND on cubietruck board

 Documentation/devicetree/bindings/mtd/nand.txt     |   34 +
 .../devicetree/bindings/mtd/sunxi-nand.txt         |   71 ++
 arch/arm/boot/dts/sun7i-a20-cubietruck.dts         |   33 +
 arch/arm/boot/dts/sun7i-a20.dtsi                   |   35 +
 drivers/mtd/nand/Kconfig                           |    6 +
 drivers/mtd/nand/Makefile                          |    1 +
 drivers/mtd/nand/nand_base.c                       |   37 ++
 drivers/mtd/nand/sunxi_nfc.c                       |  700 ++++++++++++++++++++
 drivers/of/of_mtd.c                                |   47 ++
 include/linux/mtd/nand.h                           |   44 ++
 include/linux/of_mtd.h                             |    9 +
 11 files changed, 1017 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/sunxi-nand.txt
 create mode 100644 drivers/mtd/nand/sunxi_nfc.c

-- 
1.7.9.5
