Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cKNwI-0007rb-QF
 for linux-mtd@lists.infradead.org; Fri, 23 Dec 2016 11:23:07 +0000
Subject: Re: [PATCH v5 0/3] Static memory controllers for the Aspeed SoC
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 <linux-mtd@lists.infradead.org>
References: <1482339439-26402-1-git-send-email-clg@kaod.org>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, <devicetree@vger.kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Joel
 Stanley" <joel@jms.id.au>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <cabe37bd-29af-5256-2349-bdc666f0d489@atmel.com>
Date: Fri, 23 Dec 2016 12:22:43 +0100
MIME-Version: 1.0
In-Reply-To: <1482339439-26402-1-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 21/12/2016 à 17:57, Cédric Le Goater a écrit :
> Hello,
> 
> Here is a series introducing a new driver for the different memory
> controllers of the Aspeed AST2500 and AST2400 SoCs. Each SoC has at
> least a memory controller for the BMC firmware and another one for the
> host firmware. The register set are mostly compatible but there are
> some slight differences on the AST2400.
> 
> The driver only supports SPI type flash.
> 
> Tested on:
> 
>  * OpenPOWER Palmetto (AST2400) with
>  	FMC controller : n25q256a
> 	SPI controller : mx25l25635e and n25q512ax3
> 
>  * Evaluation board (AST2500) with
>  	FMC controller : w25q256 
> 	SPI controller : w25q256
> 
>  * OpenPOWER Witherspoon (AST2500) with
>  	FMC controller : mx25l25635e * 2
> 	SPI controller : mx66l1g45g
> 
> Changes since v4:
>  - improved IO routines with Cyrille's suggestions
>  - added dummy bytes hanling for fast read commands
>  - removed the 'label' property from jedec,spi-nor. Needs more
>    discussion.
> 
> Changes since v3:
>  - reworked IO routines to use io{read,write}32_rep
>  - changed config option to SPI_ASPEED_SMC
>  - fixed aspeed_smc_chip_setup_init() returned value
> 
> Changes since v2:
>  - splitted patch to distinguish AST2400 and AST2500 controllers
>  - fixed controller names
>  - introduced prepare/unprepare ops
>  - introduced a aspeed_smc_setup_flash() routine
>  - various cleanups
> 
> Changes since v1:
>  - added a set4b ops to handle difference in the controllers
>  - simplified the IO routines
>  - prepared for fast read using dummy cycles
> 
> Work in progress:
>  - read optimization using higher SPI clock frequencies
>  - command mode to direct reads from AHB
>  - DMA support
> 
> Thanks,
> 
> C.
> 
> Cédric Le Goater (3):
>   mtd: spi-nor: add memory controllers for the Aspeed AST2500 SoC
>   mtd: aspeed: add memory controllers for the Aspeed AST2400 SoC
>   mtd: spi-nor: bindings for the Aspeed memory controllers
> 
>  .../devicetree/bindings/mtd/aspeed-smc.txt         |  51 ++
>  drivers/mtd/spi-nor/Kconfig                        |  10 +
>  drivers/mtd/spi-nor/Makefile                       |   1 +
>  drivers/mtd/spi-nor/aspeed-smc.c                   | 759 +++++++++++++++++++++
>  4 files changed, 821 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/aspeed-smc.txt
>  create mode 100644 drivers/mtd/spi-nor/aspeed-smc.c
> 

Applied to git://github.com/spi-nor/linux.git

Thanks!
