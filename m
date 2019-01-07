Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggREF-0005sk-IQ
 for linux-mtd@lists.infradead.org; Mon, 07 Jan 2019 09:29:52 +0000
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "broonie@kernel.org"
 <broonie@kernel.org>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>,
 "Marek Vasut" <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
CC: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "david.wolfe@nxp.com" <david.wolfe@nxp.com>, "fabio.estevam@nxp.com"
 <fabio.estevam@nxp.com>, "prabhakar.kushwaha@nxp.com"
 <prabhakar.kushwaha@nxp.com>, "yogeshnarayan.gaur@nxp.com"
 <yogeshnarayan.gaur@nxp.com>, "han.xu@nxp.com" <han.xu@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, Schrempf Frieder
 <frieder.schrempf@kontron.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 2/7] dt-bindings: spi: Move the bindings for the FSL QSPI
 driver
Date: Mon, 7 Jan 2019 09:29:49 +0000
Message-ID: <20190107092823.11188-3-frieder.schrempf@kontron.de>
References: <20190107092823.11188-1-frieder.schrempf@kontron.de>
In-Reply-To: <20190107092823.11188-1-frieder.schrempf@kontron.de>
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Move the documentation of the old SPI NOR driver to the place of the new
SPI memory interface based driver.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/{mtd/fsl-quadspi.txt =3D> spi/spi-fsl-qspi.txt}           | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Docume=
ntation/devicetree/bindings/spi/spi-fsl-qspi.txt
similarity index 100%
rename from Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
rename to Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt
--=20
2.17.1
