Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSewg-0000ae-0d
 for linux-mtd@lists.infradead.org; Fri, 21 Aug 2015 05:32:54 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH V7 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
Date: Fri, 21 Aug 2015 07:32:06 +0200
Cc: linux-mtd@lists.infradead.org,
 Graham Moore <grmoore@opensource.altera.com>,
 Alan Tull <atull@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Vikas MANOCHA <vikas.manocha@st.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 devicetree@vger.kernel.org, Huang Shijie <shijie.huang@intel.com>
References: <1439522892-7524-1-git-send-email-marex@denx.de>
 <201508140532.34935.marex@denx.de> <20150818024735.GA15907@localhost>
In-Reply-To: <20150818024735.GA15907@localhost>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201508210732.06556.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, August 18, 2015 at 04:47:35 AM, Brian Norris wrote:

Hi!

[...]

> > The only bizzare thing is this stuff above ^ . If I want to pass for
> > example "m25p,fast-read" to the SPI NOR connected to this controller, I
> > have to set
> 
> Do we really want to extend m25p80 properties like 'm25p,fast-read' to
> all SPI NOR controllers? Are they necessary? It seems that there has
> been some attempt to do so, but I'm not sure if that's by good design or
> just by accident.

I guess we might want to support at least the m25p,fast-read prop.
I think it might be a good idea to let the SPI NOR framework parse
the common props, while also let the SPI NOR controller drivers parse
whatever props they need.

> > up the nor->dev->of_node, otherwise the of_node would point to the
> > controller. I am positive this is wrong, but I'm not quite sure how to
> > repair this. Brian, can you please comment on this one bit ?
> 
> The problem is that spi_nor_scan() is assuming that nor->dev represents
> a flash device, not a flash controller (to which we might connect
> multiple flash). So we need to provide a way for spi_nor_scan() to find
> the flash device_node, not the controller device_node. Easy option:

Right.

>  (a) add a field to struct spi_nor, like I did to nand_chip [1]; e.g.,
>      spi_nor::dn.
> 
> In doing that, we might then reevaluate what spi_nor::dev is supposed to
> mean (and clarify the doc comments in include/linux/mtd/spi-nor.h
> accordingly). Currently, it's used to shoe-horn in DT support (badly),
> as well as to provide mostly auxiliary info, like naming, debug info
> (dev_{dbg,info,err,etc...}()), and simliar. The latter half can actually
> be problematic too, since they start to become less useful once you have
> more than one flash connected to a single controller. e.g., you'll get
> colliding MTD names (via dev_name(nor->dev)) and debug info is suddenly
> less obvious (which flash chip is the log message from?).

Right. Would it make sense to have one device per one SPI NOR flash and
then another one for the controller ?

> So, we might want to do something in the long run to avoid the mixing of
> layers that looks more like:
> 
>  (b) remove 'dev' from struct spi_nor entirely
> 
> We can do debug prints and such with spi-nor-specific printk()
> formatters (e.g., snor_{info,dbg,err,etc...}()) and stop assuming that
> dev_name(nor->dev) is actually a good name for an MTD.

I cannot say I'm very fond of introducing new ad-hoc kernel printing
facility just for the sake of dealing with this.

> While we're at it... we may also want a larger rework to allow spi-nor.c
> to better support a notion of controllers (using the existing platform
> device) and flash devices (mostly without the use of struct device, and
> mostly using struct spi_nor as-is).

See my question about the devices above please, I'm not quite sure here.

> You'll notice that controllers that
> want to support multiple flash are starting to develop much of the same
> initialization boiler-plate code.

Yep, I tweaked the Cadence driver such, that the boilerplate code is nicely
isolated in a separate function now, so this would also be visible :)

> Anyway, that's my rambling thoughts for now. I think (a) is pretty
> straightforward, correct, and quickly attainable

I just did that, it was a couple lines of code. I think I need to write a
better commit message for it before I send it out.

> so you can ignore the
> remaining bits in the context of upstreaming this driver.
> 
> Brian
> 
> [1]
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id
> =5844feeaa4154d1c46d3462c7a4653d22356d8b4
