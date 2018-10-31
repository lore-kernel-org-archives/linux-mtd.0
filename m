Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHrX9-0000zd-Ep
 for linux-mtd@lists.infradead.org; Wed, 31 Oct 2018 14:31:49 +0000
Date: Wed, 31 Oct 2018 15:31:25 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Schrempf Frieder <frieder.schrempf@kontron.De>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "david.wolfe@nxp.com"
 <david.wolfe@nxp.com>, "fabio.estevam@nxp.com" <fabio.estevam@nxp.com>,
 "prabhakar.kushwaha@nxp.com" <prabhakar.kushwaha@nxp.com>,
 "yogeshnarayan.gaur@nxp.com" <yogeshnarayan.gaur@nxp.com>, "han.xu@nxp.com"
 <han.xu@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Subject: Re: [PATCH v2 00/12] Port the FSL QSPI driver to the SPI framework
Message-ID: <20181031153125.3c5dfca1@bbrezillon>
In-Reply-To: <dd4b9af1-82f3-469e-e70f-2858e85a5dfe@kontron.de>
References: <1530789310-16254-1-git-send-email-frieder.schrempf@exceet.de>
 <20181031144055.32e1c8f1@bbrezillon>
 <dd4b9af1-82f3-469e-e70f-2858e85a5dfe@kontron.de>
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

On Wed, 31 Oct 2018 13:54:29 +0000
Schrempf Frieder <frieder.schrempf@kontron.De> wrote:

> Hi Boris,
> 
> On 31.10.18 14:40, Boris Brezillon wrote:
> > Hi Frieder, Yogesh,
> > 
> > On Thu,  5 Jul 2018 13:14:56 +0200
> > Frieder Schrempf <frieder.schrempf@exceet.de> wrote:
> >   
> >> Now that the SPI memory interface was introduced by Boris [1], it is
> >> possible to move drivers from mtd/spi-nor to the SPI framework in order
> >> to use them for different type of SPI memory chips.
> >>
> >> Patch 1 adds a function spi_mem_get_name() to the SPI memory interface
> >> and a ->name field to struct spi_mem.
> >> Patch 2 uses it in m25p80.c to make it possible for SPI controller
> >> drivers to provide a custom naming scheme for the flash chip.
> >> This is needed to avoid breaking compatibility of mtdparts when switching
> >> from the old to the new driver.
> >>
> >> Patch 3 adds a driver for the Freescale QSPI controller to the SPI
> >> framework. Together with m25p80.c it can be used to interface SPI
> >> NOR flashes just as the old driver did. For this to work properly a few
> >> minor changes to the devicetrees are necessary (see patches 5 to 7).
> >>
> >> Patch 8 changes the defconfigs to use the new driver and patch 9 removes
> >> the old driver.
> >>
> >> Patch 10 and 11 remove 'fsl,qspi-has-second-chip' from the devicetrees.
> >> Patch 12 adjusts the MAINTAINERS file.
> >>
> >> The new driver was tested with i.MX6UL and a Micron SPI NOR @ 60MHz.
> >> The read performance of the new driver is almost the same or even better
> >> than the old driver, depending on the block size.
> >> The write performance is a bit slower on average (~10-15%).
> >>
> >> The new driver was also tested with the SPI NAND framework [2] and a
> >> Winbond W25M02GV flash.
> >>
> >> If someone has a board that uses both chips selects and/or both busses,
> >> it would be really nice to have the driver be tested on such a setup.  
> > 
> > Any progress on this front? Yogesh, can you please remind us the
> > remaining issues? I'd really like to make some progress, otherwise the
> > conversion to spi-mem will take ages.  
> 
> I definitely want to continue this. I just did not have the time to work 
> on it.
> 
> I think the only remaining blocking issues is the one that Yogesh 
> reported while testing with two chips on the same bus.

Maybe you can send a new version rebased on v4.20-rc1 (when it's out)
and push it somewhere so that Yogesh can test it (again). Yogesh, can we
please make some progress on this? If you really have a bug, that'd be
great to have a serious investigation on what is causing this bug. The
explanation we had so far were not really helpful in understanding the
problem.
