From: Guochun Mao <guochun.mao@mediatek.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
CC: Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Richard
 Weinberger <richard@nod.at>, Mark Rutland <mark.rutland@arm.com>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] mtk-nor: update dt bindings and add suspend/resume support
Date: Thu, 21 Sep 2017 20:45:04 +0800
Message-ID: <1505997906-30921-1-git-send-email-guochun.mao@mediatek.com>
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

These patches affect mtk-quadspi module in mtk/spi-nor.
Add new compatible strings in dt bindings, add suspend/resume
support in mtk-quadspi driver.

Guochun Mao (2):
  dt-bindings: mtd: add new compatible strings and improve description
  mtd: mtk-nor: add suspend/resume support

 .../devicetree/bindings/mtd/mtk-quadspi.txt        | 15 +++--
 drivers/mtd/spi-nor/mtk-quadspi.c                  | 70 ++++++++++++++++++----
 2 files changed, 67 insertions(+), 18 deletions(-)

-- 
1.9.1
