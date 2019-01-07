Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggXdd-0000SX-2m
 for linux-mtd@lists.infradead.org; Mon, 07 Jan 2019 16:20:30 +0000
Date: Mon, 7 Jan 2019 17:20:03 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "richard@nod.at" <richard@nod.at>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>, "david.wolfe@nxp.com" <david.wolfe@nxp.com>,
 "fabio.estevam@nxp.com" <fabio.estevam@nxp.com>,
 "prabhakar.kushwaha@nxp.com" <prabhakar.kushwaha@nxp.com>,
 "yogeshnarayan.gaur@nxp.com" <yogeshnarayan.gaur@nxp.com>, "han.xu@nxp.com"
 <han.xu@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 4/7] mtd: fsl-quadspi: Remove the driver as it was
 replaced by spi-fsl-qspi.c
Message-ID: <20190107172003.1bca8a66@bbrezillon>
In-Reply-To: <20190107092823.11188-5-frieder.schrempf@kontron.de>
References: <20190107092823.11188-1-frieder.schrempf@kontron.de>
 <20190107092823.11188-5-frieder.schrempf@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 7 Jan 2019 09:29:53 +0000
Schrempf Frieder <frieder.schrempf@kontron.de> wrote:

> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> There's a new driver using the SPI memory interface of the SPI framework
> at spi/spi-fsl-qspi.c, which can be used together with m25p80.c to
> replace the functionality of this SPI NOR driver.
> 
> The new driver is already in use and this code is not compiled anymore,
> so let's remove it.
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Acked-by: Han Xu <han.xu@nxp.com>
> Tested-by: Han Xu <han.xu@nxp.com>

Acked-by: Boris Brezillon <bbrezillon@kernel.org>
