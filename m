From: Guochun Mao <guochun.mao@mediatek.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
CC: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger
 <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Russell
 King <linux@armlinux.org.uk>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] mtd: mtk-nor: set controller's address width according to
 nor flas
Date: Wed, 5 Apr 2017 16:37:41 +0800
Message-ID: <1491381462-21893-1-git-send-email-guochun.mao@mediatek.com>
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

Guochun Mao (1):
  mtd: mtk-nor: set controller's address width according to nor flash

 drivers/mtd/spi-nor/mtk-quadspi.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

-- 
1.9.1
