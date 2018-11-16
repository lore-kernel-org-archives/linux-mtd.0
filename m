Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNn5N-0006li-RK
 for linux-mtd@lists.infradead.org; Fri, 16 Nov 2018 22:59:39 +0000
Received: by mail-oi1-f195.google.com with SMTP id v6so8666976oif.2
 for <linux-mtd@lists.infradead.org>; Fri, 16 Nov 2018 14:59:27 -0800 (PST)
Message-ID: <5bef4bcd.1c69fb81.20780.023d@mx.google.com>
Date: Fri, 16 Nov 2018 16:59:24 -0600
From: Rob Herring <robh@kernel.org>
To: Schrempf Frieder <frieder.schrempf@kontron.De>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek  Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Mark  Brown <broonie@kernel.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "david.wolfe@nxp.com" <david.wolfe@nxp.com>,
 "fabio.estevam@nxp.com" <fabio.estevam@nxp.com>,
 "prabhakar.kushwaha@nxp.com" <prabhakar.kushwaha@nxp.com>,
 "yogeshnarayan.gaur@nxp.com" <yogeshnarayan.gaur@nxp.com>,
 "han.xu@nxp.com" <han.xu@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 Schrempf Frieder <frieder.schrempf@kontron.De>,
 Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 4/9] dt-bindings: spi: Move the bindings for the FSL
 QSPI  driver
References: <1542116782-13118-1-git-send-email-frieder.schrempf@kontron.de>
 <1542116782-13118-5-git-send-email-frieder.schrempf@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1542116782-13118-5-git-send-email-frieder.schrempf@kontron.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 13 Nov 2018 13:47:34 +0000, Schrempf Frieder wrote:
> Move the documentation of the old SPI NOR driver to the place of the new
> SPI memory interface based driver.
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  .../bindings/{mtd/fsl-quadspi.txt => spi/spi-fsl-qspi.txt}           | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
