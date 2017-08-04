From: Guochun Mao <guochun.mao@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Richard
 Weinberger <richard@nod.at>, Mark Rutland <mark.rutland@arm.com>, Russell
 King <linux@armlinux.org.uk>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5] dt-bindings: mtd: add new compatible strings and improve
 description
Date: Fri, 4 Aug 2017 16:10:38 +0800
Message-ID: <1501834239-25581-1-git-send-email-guochun.mao@mediatek.com>
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

Correct compatibles description and explicate fallback compatible.

Guochun Mao (1):
  dt-bindings: mtd: add new compatible strings and improve description

 Documentation/devicetree/bindings/mtd/mtk-quadspi.txt | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

-- 
1.9.1
