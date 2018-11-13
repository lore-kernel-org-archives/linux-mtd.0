Received: from skedge04.snt-world.com ([91.208.41.69])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMZ3E-00062w-UJ
 for linux-mtd@lists.infradead.org; Tue, 13 Nov 2018 13:48:22 +0000
From: Schrempf Frieder <frieder.schrempf@kontron.De>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "david.wolfe@nxp.com" <david.wolfe@nxp.com>,
 "fabio.estevam@nxp.com" <fabio.estevam@nxp.com>, "prabhakar.kushwaha@nxp.com"
 <prabhakar.kushwaha@nxp.com>, "yogeshnarayan.gaur@nxp.com"
 <yogeshnarayan.gaur@nxp.com>, "han.xu@nxp.com" <han.xu@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, Schrempf Frieder
 <frieder.schrempf@kontron.De>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>,
 "Andrew Morton" <akpm@linux-foundation.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v5 9/9] MAINTAINERS: Move the Freescale QSPI driver to the SPI
 framework
Date: Tue, 13 Nov 2018 13:48:05 +0000
Message-ID: <1542116782-13118-10-git-send-email-frieder.schrempf@kontron.de>
References: <1542116782-13118-1-git-send-email-frieder.schrempf@kontron.de>
In-Reply-To: <1542116782-13118-1-git-send-email-frieder.schrempf@kontron.de>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The driver was ported to the SPI framework so it can be used as
a generic SPI memory driver and not only for SPI NOR.
Reflect this transition in the MAINTAINERS file.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f485597..1ff3c5b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5932,9 +5932,9 @@ F:	Documentation/devicetree/bindings/ptp/ptp-qoriq.tx=
t
=20
 FREESCALE QUAD SPI DRIVER
 M:	Han Xu <han.xu@nxp.com>
-L:	linux-mtd@lists.infradead.org
+L:	linux-spi@vger.kernel.org
 S:	Maintained
-F:	drivers/mtd/spi-nor/fsl-quadspi.c
+F:	drivers/spi/spi-fsl-qspi.c
=20
 FREESCALE QUICC ENGINE LIBRARY
 M:	Qiang Zhao <qiang.zhao@nxp.com>
--=20
2.7.4
