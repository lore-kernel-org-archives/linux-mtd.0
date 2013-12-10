Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqRx7-0000Ti-DQ
 for linux-mtd@lists.infradead.org; Tue, 10 Dec 2013 18:22:38 +0000
From: Marek Vasut <marex@denx.de>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCHv2 00/10] Add memory mapped support for ti qspi,
 m25p80 serial flash.
Date: Tue, 10 Dec 2013 19:22:10 +0100
References: <1386339891-32717-1-git-send-email-sourav.poddar@ti.com>
 <201312101349.13564.marex@denx.de> <20131210161143.GK29268@sirena.org.uk>
In-Reply-To: <20131210161143.GK29268@sirena.org.uk>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201312101922.10618.marex@denx.de>
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, balbi@ti.com,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 bcousson@baylibre.com, Sourav Poddar <sourav.poddar@ti.com>,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, December 10, 2013 at 05:11:43 PM, Mark Brown wrote:
> On Tue, Dec 10, 2013 at 01:49:13PM +0100, Marek Vasut wrote:
> > My question is, shall we not wait for the new SPI NOR framework to be
> > well fleshed out and only then implement this controller driver on top
> > of it ?
> > 
> > I have a feeling this patchset adds quite a lot of ad-hoc hacks into the
> > m25p80 driver, which would become dead code once converted to the SPI
> > NOR framework.
> 
> There is some stuff that pushes up into the controller in that while the
> device is in memory mapped mode as far as I can tell it's not safe to do
> other accesses so if someone's put more than one device on the SPI bus
> we need to handle interactions there.

OK, so it's either-or . That seems OK, you might want to have two drivers for 
this ip block, one to handle it as a SPI block and one to handle it as a SPI-NOR 
block. ... that is of course, if these two modes can't work together.

Best regards,
Marek Vasut
