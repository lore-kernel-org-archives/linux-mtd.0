Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRX0k-0003b5-M5
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 02:52:27 +0000
Received: by pacgr6 with SMTP id gr6so121569014pac.2
 for <linux-mtd@lists.infradead.org>; Mon, 17 Aug 2015 19:52:06 -0700 (PDT)
Date: Mon, 17 Aug 2015 19:47:35 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-mtd@lists.infradead.org,
 Graham Moore <grmoore@opensource.altera.com>,
 Alan Tull <atull@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Vikas MANOCHA <vikas.manocha@st.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 devicetree@vger.kernel.org, Huang Shijie <shijie.huang@intel.com>
Subject: Re: [PATCH V7 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
Message-ID: <20150818024735.GA15907@localhost>
References: <1439522892-7524-1-git-send-email-marex@denx.de>
 <1439522892-7524-2-git-send-email-marex@denx.de>
 <201508140532.34935.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201508140532.34935.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 14, 2015 at 05:32:34AM +0200, Marek Vasut wrote:
> On Friday, August 14, 2015 at 05:28:12 AM, Marek Vasut wrote:
> 
> > +	/* Get flash device data */
> > +	for_each_available_child_of_node(dev->of_node, np) {
...
> --->8---
> 
> > +		/*
> > +		 * Here is a 'nasty hack' from Marek Vasut to pick
> > +		 * up OF properties from flash device subnode.
> > +		 */
> > +		nor->dev->of_node = np;
> > +
> > +		ret = spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
> > +		if (ret)
> > +			goto probe_failed;
> 
> The only bizzare thing is this stuff above ^ . If I want to pass for example 
> "m25p,fast-read" to the SPI NOR connected to this controller, I have to set

Do we really want to extend m25p80 properties like 'm25p,fast-read' to
all SPI NOR controllers? Are they necessary? It seems that there has
been some attempt to do so, but I'm not sure if that's by good design or
just by accident.

> up the nor->dev->of_node, otherwise the of_node would point to the controller.
> I am positive this is wrong, but I'm not quite sure how to repair this.
> Brian, can you please comment on this one bit ?

The problem is that spi_nor_scan() is assuming that nor->dev represents
a flash device, not a flash controller (to which we might connect
multiple flash). So we need to provide a way for spi_nor_scan() to find
the flash device_node, not the controller device_node. Easy option:

 (a) add a field to struct spi_nor, like I did to nand_chip [1]; e.g.,
     spi_nor::dn.

In doing that, we might then reevaluate what spi_nor::dev is supposed to
mean (and clarify the doc comments in include/linux/mtd/spi-nor.h
accordingly). Currently, it's used to shoe-horn in DT support (badly),
as well as to provide mostly auxiliary info, like naming, debug info
(dev_{dbg,info,err,etc...}()), and simliar. The latter half can actually
be problematic too, since they start to become less useful once you have
more than one flash connected to a single controller. e.g., you'll get
colliding MTD names (via dev_name(nor->dev)) and debug info is suddenly
less obvious (which flash chip is the log message from?).

So, we might want to do something in the long run to avoid the mixing of
layers that looks more like:

 (b) remove 'dev' from struct spi_nor entirely

We can do debug prints and such with spi-nor-specific printk()
formatters (e.g., snor_{info,dbg,err,etc...}()) and stop assuming that
dev_name(nor->dev) is actually a good name for an MTD.

While we're at it... we may also want a larger rework to allow spi-nor.c
to better support a notion of controllers (using the existing platform
device) and flash devices (mostly without the use of struct device, and
mostly using struct spi_nor as-is). You'll notice that controllers that
want to support multiple flash are starting to develop much of the same
initialization boiler-plate code.

Anyway, that's my rambling thoughts for now. I think (a) is pretty
straightforward, correct, and quickly attainable, so you can ignore the
remaining bits in the context of upstreaming this driver.

Brian

[1] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=5844feeaa4154d1c46d3462c7a4653d22356d8b4
