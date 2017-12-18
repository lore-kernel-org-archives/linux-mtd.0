From: Guochun Mao <guochun.mao@mediatek.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Marek Vasut
 <marek.vasut@gmail.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Mark Rutland
 <mark.rutland@arm.com>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V1 1/1] mtd: mtk-nor: modify functions' name more generally
Date: Mon, 18 Dec 2017 09:47:34 +0800
Message-ID: <1513561655-10570-1-git-send-email-guochun.mao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since more and more Mediatek's SoC can use this driver to control
spi-nor flash, functions' name with "mt8173_" is no longer properly.
Replacing "mt8173_" with "mtk_" will be more accurate to describe
these functions' usable scope.

Guochun Mao (1):
  mtd: mtk-nor: modify functions' name more generally

 drivers/mtd/spi-nor/mtk-quadspi.c | 240 +++++++++++++++++++-------------------
 1 file changed, 120 insertions(+), 120 deletions(-)

-- 
1.9.1
