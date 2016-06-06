Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b9zGH-00023P-5V
 for linux-mtd@lists.infradead.org; Mon, 06 Jun 2016 18:28:29 +0000
Received: by mail-pa0-x241.google.com with SMTP id ug1so2279400pab.1
 for <linux-mtd@lists.infradead.org>; Mon, 06 Jun 2016 11:28:07 -0700 (PDT)
Date: Mon, 6 Jun 2016 11:28:03 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Michal Suchanek <hramrach@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marex@denx.de>, Han Xu <han.xu@nxp.com>,
 linux-spi@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: m25p80: consider max_transfer_size when reading
Message-ID: <20160606182803.GA128439@google.com>
References: <56D22823.7090005@gmail.com> <20160405193952.GA5243@localhost>
 <57041B43.2000109@gmail.com> <20160405210727.GB5243@localhost>
 <5706B084.2070909@gmail.com> <20160505235700.GA99474@google.com>
 <20160506121431.GQ6292@sirena.org.uk>
 <77a22258-95ca-031a-825d-a9e98e30a162@gmail.com>
 <20160606174003.GE7510@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160606174003.GE7510@sirena.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 06, 2016 at 06:40:03PM +0100, Mark Brown wrote:
> On Sat, Jun 04, 2016 at 12:22:37AM +0200, Heiner Kallweit wrote:
> > Am 06.05.2016 um 14:14 schrieb Mark Brown:
> 
> > > Yes, it's called the maximum transfer size because it is the maximum
> > > size of a transfer, not because it's the maximum size of a message.
> 
> > I'd like to come back to this discussion. You said best would be to fix
> > the chip driver. To do this and calculate an appropriate value for
> > max_transfer_size the chip driver would have to know that the spi_device
> > is a spi-nor device.
> 
> That doesn't make any sense, the controller hardware doesn't magically
> change based on what is connected to it.

I believe Heiner has an (unstated here, but stated elsewhere?)
assumption that his driver has a maximum *message* size, not *transfer*
size. So he's explaining how to work around that by implicitly figuring
out what the message size would be based on a transfer size, I think.

What I don't understand yet is whether there's some HW limitation, or
just a SW limitation, for handling *transfers* as large as
SPCOM_TRANLEN_MAX in drivers/spi/spi-fsl-espi.c, with potentially
multiple of those transfers in a single message. I would think that each
SPI transfer can mostly be handled individually. But if not, then as
mentioned previously, we'd need a new API for that: ->max_msg_size().

Brian
