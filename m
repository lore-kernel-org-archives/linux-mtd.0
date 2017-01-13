From: Guochun Mao <guochun.mao@mediatek.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Russell
 King <linux@armlinux.org.uk>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/2] add nor flash node for mt2701
Date: Fri, 13 Jan 2017 15:13:27 +0800
Message-ID: <1484291609-20195-1-git-send-email-guochun.mao@mediatek.com>
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

This patch series based on v4.10-rc2, include MT2701 spinor node and bindings.

Dependent on "Add clock and power domain DT nodes for Mediatek MT2701"[1].

[1] http://lists.infradead.org/pipermail/linux-mediatek/2016-December/007637.html

Guochun Mao (2):
  Documentation: mtk-quadspi: update DT bindings
  arm: dts: mt2701: add nor flash node

 .../devicetree/bindings/mtd/mtk-quadspi.txt        |  4 +++-
 arch/arm/boot/dts/mt2701-evb.dts                   | 25 ++++++++++++++++++++++
 arch/arm/boot/dts/mt2701.dtsi                      | 12 +++++++++++
 3 files changed, 40 insertions(+), 1 deletion(-)

--
1.8.1.1.dirty
