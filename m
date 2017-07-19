From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@free-electrons.com>,
 Nadav Haklai <nadavh@marvell.com>, Shadi Ammouri <shadi@marvell.com>,
 Yehuda Yitschak <yehuday@marvell.com>, Omri Itach <omrii@marvell.com>,
 Hanna Hawa <hannah@marvell.com>, Igal Liberman <igall@marvell.com>,
 Marcin Wojtas <mw@semihalf.com>
Subject: [PATCH 0/2] Enable NAND support on Armada 7K/8K
Date: Wed, 19 Jul 2017 17:31:24 +0200
Message-Id: <20170719153126.16905-1-gregory.clement@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

this short series enables the NAND controller on the Armada 7K/8K
SoCs. The IP used is the same that the other mvebu SoC, so we only
need to be bale to build it for this SoCs and updating the device
tree.

The first patch should go to mtd and the second one to arm-soc through
mvebu.

The patches are completely independent.

Thanks,

Gregory

Gregory CLEMENT (2):
  mtd: nand: pxa3xx_nand: enable building on mvebu 64-bit platforms
  ARM64: dts: marvell: add NAND support on the CP110 master

 arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi | 14 ++++++++++++++
 drivers/mtd/nand/Kconfig                             |  2 +-
 2 files changed, 15 insertions(+), 1 deletion(-)

-- 
2.13.2
