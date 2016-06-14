From: Aleksei Mamlin <mamlinav@gmail.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-sunxi@googlegroups.com, Aleksei Mamlin <mamlinav@gmail.com>
Subject: [PATCH v2 0/4] dts: sunxi: Add sunxi NAND Flash Controller support
Date: Tue, 14 Jun 2016 14:17:34 +0300
Message-Id: <1465903058-9211-1-git-send-email-mamlinav@gmail.com>
In-Reply-To: <1465208664-9366-1-git-send-email-mamlinav@gmail.com>
References: <1465208664-9366-1-git-send-email-mamlinav@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This series adds the sunxi NAND Flash Controller pin definitions and nodes to
dts.

Changes since v1:
- Remove patch with Hynix H27UBG8T2BTR-BC MLC NAND chip definition.
- Remove patches with NAND support on Marsboard A10 board and Wexler TAB7200.
- Enable only the pin groups that are actually used by sunxi boards.
- Enable DMA support. Depends on sunxi NFC DMA support([1], [2]), merged into
  linux-nand.

[1] http://lists.infradead.org/pipermail/linux-mtd/2016-April/066899.html
[2] http://lists.infradead.org/pipermail/linux-mtd/2016-April/066898.html

Boris Brezillon (4):
  ARM: dts: sun4i: Add A10 NAND controller pin definitions
  ARM: dts: sun4i: Add NFC node to Allwinner A10 SoC
  ARM: dts: sun7i: Add A20 NAND controller pin definitions
  ARM: dts: sun7i: Add NFC node to Allwinner A20 SoC

 arch/arm/boot/dts/sun4i-a10.dtsi | 65 ++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/sun7i-a20.dtsi | 65 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 130 insertions(+)

-- 
2.7.3
