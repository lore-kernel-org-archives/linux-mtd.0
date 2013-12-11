Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqhwN-0000Co-OI
 for linux-mtd@lists.infradead.org; Wed, 11 Dec 2013 11:26:57 +0000
From: Marek Vasut <marex@denx.de>
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [PATCHv2 00/10] Add memory mapped support for ti qspi,
 m25p80 serial flash.
Date: Wed, 11 Dec 2013 11:44:22 +0100
References: <1386339891-32717-1-git-send-email-sourav.poddar@ti.com>
 <201312101349.13564.marex@denx.de> <52A7E7A5.5000909@ti.com>
In-Reply-To: <52A7E7A5.5000909@ti.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201312111144.23012.marex@denx.de>
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, balbi@ti.com,
 linux-spi@vger.kernel.org, broonie@kernel.org, linux-mtd@lists.infradead.org,
 bcousson@baylibre.com, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, December 11, 2013 at 05:18:45 AM, Sourav Poddar wrote:
> Hi Marek,
> 
> On Tuesday 10 December 2013 06:19 PM, Marek Vasut wrote:
> > On Friday, December 06, 2013 at 03:24:41 PM, Sourav Poddar wrote:
> >> The patch series aims to add memory mapped support for TI qspi
> >> contoller and also add support for the same in serial flash
> >> driver(m25p80).
> > 
> > My question is, shall we not wait for the new SPI NOR framework to be
> > well fleshed out and only then implement this controller driver on top
> > of it ?
> 
> I think it will still take lot of time for spi framework to come to
> alignment
> and get merged in the mainline. Till then, m25p80 development should
> go on independently. Once, the spi framework is ready, I can myself port
> this into the new framework.

Sure, but I also think Huang is coming close to the new framework. Have you seen 
his latest patchset ( Message-ID: <1386318764-15882-1-git-send-email-
b32955@freescale.com> ) ? I think you two should really start working on the new 
framework instead of bending drivers all around.

> > I have a feeling this patchset adds quite a lot of ad-hoc hacks into the
> > m25p80 driver, which would become dead code once converted to the SPI
> > NOR framework.
> 
> I dont think that spi framework till now provides capabilities which can
> be used
> to handle memory mapped cases.

Not yet, so please bring it up in the discussion there :)

> I did a quad mode support for m25p80 which easily got cloned into the
> new spi framework.
> Same can be done for the memory mapped support too

The quad mode didn't need any new hooks in the m25p80, did it ? That's the 
difference here.

Best regards,
Marek Vasut
