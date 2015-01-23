From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Gregory Clement <gregory.clement@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 0/2] ARM: mvebu: a385-db-ap: Enable the NAND controller
Date: Fri, 23 Jan 2015 16:41:41 +0100
Message-Id: <1422027703-3763-1-git-send-email-maxime.ripard@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>,
 Thomas Petazzoni <thomas@free-electrons.com>, Seif Mazareeb <seif@marvell.com>,
 linux-kernel@vger.kernel.org, Sudhakar Gundubogula <sudhakar@marvell.com>,
 Nadav Haklai <nadavh@marvell.com>, Boris Brezillon <boris@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This patch serie enable the NAND support on the Armada 385 Access
Point DB.

In the process, some timeouts were found when we were accessing a
freshly erased NAND page, which turned out to be an issue when
draining the read FIFO where we were not following the datasheet.

This has been fixed with the first patch, with stable CC'd. The second
patch just enables the NAND controller in the DT.

Thanks,
Maxime

Maxime Ripard (2):
  mtd: nand: pxa3xx: Fix PIO FIFO draining
  ARM: mvebu: a385-db-ap: Enable the NAND

 arch/arm/boot/dts/armada-385-db-ap.dts | 13 ++++++++++++
 drivers/mtd/nand/pxa3xx_nand.c         | 36 ++++++++++++++++++++++++++++------
 2 files changed, 43 insertions(+), 6 deletions(-)

-- 
2.2.2
