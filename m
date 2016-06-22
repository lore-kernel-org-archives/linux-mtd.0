Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFiNd-0000K0-5U
 for linux-mtd@lists.infradead.org; Wed, 22 Jun 2016 13:39:48 +0000
Subject: Re: [PATCH 0/2] mtd: spi-nor: add driver for Atmel QSPI controller
To: <computersforpeace@gmail.com>
References: <cover.1465830154.git.cyrille.pitchen@atmel.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
CC: <linux-mtd@lists.infradead.org>, <nicolas.ferre@atmel.com>,
 <boris.brezillon@free-electrons.com>, <marex@denx.de>,
 <linux-kernel@vger.kernel.org>
Message-ID: <576A950B.3010506@atmel.com>
Date: Wed, 22 Jun 2016 15:39:23 +0200
MIME-Version: 1.0
In-Reply-To: <cover.1465830154.git.cyrille.pitchen@atmel.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Almost a year has passed since the first publication of the driver for the
Atmel Quad SPI controller:
https://patchwork.kernel.org/patch/6808311/

I totally understand the previous versions needed to be discussed as they were
based on a deep rework of the spi-nor framework to enhance the support of Quad
SPI protocols but this latest version does not require any modification of the
spi-nor framework: now the driver only supports SPI 1-1-1 and 1-1-4 protocols
like other spi-nor controller drivers already accepted.

So I guess this time there is no reason not to integrate this version.

I've also included this very same patch inside my latest series for Quad SPI
protocols support and SFDP table parsing.
Honestly the Atmel QSPI controller driver itself has nothing to do in this
series dedicated to support of Quad SPI memories but the QSPI controller of
the sama5d2 SoC is the only hardware I can use to test my patches.

Also, since patch 5/9 "mtd: spi-nor: add support of SPI protocols like
SPI 1-2-2 and SPI 1-4-4" updates all drivers calling spi_nor_scan(), including
atmel-quadspi.c, I needed to include the Atmel QSPI controller driver first
in the series before actually doing the core modifications of spi-nor.c.
https://patchwork.ozlabs.org/patch/638138/

I'm not trying to by-pass or short-cut the review process but I feel that
there is currently no discussion or other feedbacks suggesting that the
QSPI controller driver itself needs further modifications.

Best regards,

Cyrille


Le 13/06/2016 17:10, Cyrille Pitchen a écrit :
> Hi all,
> 
> this series of patches adds support to the Atmel QSPI controller.
> It was tested on a sama5d2 xplained board + Macronix mx25l25673g QSPI
> memory.
> 
> The driver limits its support of Quad SPI memories to the SPI 1-1-4
> protocol for Fast Read operations and SPI 1-1-1 protocol for all other
> commands.
> 
> The series is based on next-20160609
> 
> Best regards,
> 
> Cyrille
> 
> Cyrille Pitchen (2):
>   Documentation: atmel-quadspi: add binding file for Atmel QSPI driver
>   mtd: atmel-quadspi: add driver for Atmel QSPI controller
> 
>  .../devicetree/bindings/mtd/atmel-quadspi.txt      |  32 +
>  drivers/mtd/spi-nor/Kconfig                        |   9 +
>  drivers/mtd/spi-nor/Makefile                       |   1 +
>  drivers/mtd/spi-nor/atmel-quadspi.c                | 741 +++++++++++++++++++++
>  4 files changed, 783 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
>  create mode 100644 drivers/mtd/spi-nor/atmel-quadspi.c
> 
