Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXXQ5-0006dX-6I
 for linux-mtd@lists.infradead.org; Thu, 03 Sep 2015 16:31:26 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Decouple SPI NOR's device_node from
 controller device
Date: Thu, 3 Sep 2015 18:20:45 +0200
Cc: Jonas Gorski <jogo@openwrt.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
References: <1440148160-14355-1-git-send-email-marex@denx.de>
 <201508212316.21111.marex@denx.de> <20150902003017.GN81844@google.com>
In-Reply-To: <20150902003017.GN81844@google.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201509031820.45665.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, September 02, 2015 at 02:30:17 AM, Brian Norris wrote:
> On Fri, Aug 21, 2015 at 11:16:21PM +0200, Marek Vasut wrote:
> > On Friday, August 21, 2015 at 10:49:46 PM, Jonas Gorski wrote:
> > > On Fri, Aug 21, 2015 at 8:34 PM, Marek Vasut <marex@denx.de> wrote:
> > > > On Friday, August 21, 2015 at 04:15:11 PM, Jonas Gorski wrote:
> > > >> > This patch is inspired by 5844feeaa4154d1c46d3462c7a4653d22356d8b4
> > > >> > mtd: nand: add common DT init code
> > > >> 
> > > >> I know that this commit named it dn for nand, but IMHO "dn" isn't a
> > > >> very readable member name, so I would suggest using something with
> > > >> "node" in it (just using of_node as well seems to be common). I see
> > > >> no place where the name length might become an issue.
> > > > 
> > > > I thought .dn was supposed to be abbrev for device_node ;-)
> > > 
> > > Sure, if you know what it is supposed to stand for it is obvious ;-).
> > > And from a "stylistic" point of view, struct spi_nor has members
> > > called page_size, flash_read or cmd_buf and not ps, fr, or cb so using
> > > dn instead of e.g. dev_node seems a bit odd.
> > 
> > On the other hand, the .dn is consistent across the MTD subsystem.
> > I don't have a strong prefference though.
> 
> I just stuck in nand_chip::dn since we needed something, and because
> I've seen it used as a function parameter name and a local variable name
> all over the place, enough that it just seemed natural. But a field name
> is probably a bit more important. I'd be OK with making the "standard"
> a bit more verbose, and maybe even changing the one in struct nand_chip.
> 
> How about:
> 
>   flash_node <-- this one leaves room for a controller node, if we
>                  eventually need it

I like this one the most, exactly because of your reasoning.

>   device_node
>   dev_node
>   of_node <-- this one is commonly used, but mostly out of legacy
>               reasons. We're not really dealing with Open Firmware
> 
> ?
> 
> Pick one and run with it.
> 
> Brian

Best regards,
Marek Vasut
