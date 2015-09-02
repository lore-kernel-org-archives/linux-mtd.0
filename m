Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWvwn-0001aT-52
 for linux-mtd@lists.infradead.org; Wed, 02 Sep 2015 00:30:43 +0000
Received: by paap5 with SMTP id p5so4714759paa.0
 for <linux-mtd@lists.infradead.org>; Tue, 01 Sep 2015 17:30:20 -0700 (PDT)
Date: Tue, 1 Sep 2015 17:30:17 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Jonas Gorski <jogo@openwrt.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: Decouple SPI NOR's device_node from
 controller device
Message-ID: <20150902003017.GN81844@google.com>
References: <1440148160-14355-1-git-send-email-marex@denx.de>
 <201508212034.50804.marex@denx.de>
 <CAOiHx=kU_Pg3RXojJPtPWdyVwwn+GAVotw0pR4hF4FDQPNXEtg@mail.gmail.com>
 <201508212316.21111.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201508212316.21111.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 21, 2015 at 11:16:21PM +0200, Marek Vasut wrote:
> On Friday, August 21, 2015 at 10:49:46 PM, Jonas Gorski wrote:
> > On Fri, Aug 21, 2015 at 8:34 PM, Marek Vasut <marex@denx.de> wrote:
> > > On Friday, August 21, 2015 at 04:15:11 PM, Jonas Gorski wrote:
> > >> > This patch is inspired by 5844feeaa4154d1c46d3462c7a4653d22356d8b4
> > >> > mtd: nand: add common DT init code
> > >> 
> > >> I know that this commit named it dn for nand, but IMHO "dn" isn't a
> > >> very readable member name, so I would suggest using something with
> > >> "node" in it (just using of_node as well seems to be common). I see no
> > >> place where the name length might become an issue.
> > > 
> > > I thought .dn was supposed to be abbrev for device_node ;-)
> > 
> > Sure, if you know what it is supposed to stand for it is obvious ;-).
> > And from a "stylistic" point of view, struct spi_nor has members
> > called page_size, flash_read or cmd_buf and not ps, fr, or cb so using
> > dn instead of e.g. dev_node seems a bit odd.
> 
> On the other hand, the .dn is consistent across the MTD subsystem.
> I don't have a strong prefference though.

I just stuck in nand_chip::dn since we needed something, and because
I've seen it used as a function parameter name and a local variable name
all over the place, enough that it just seemed natural. But a field name
is probably a bit more important. I'd be OK with making the "standard"
a bit more verbose, and maybe even changing the one in struct nand_chip.

How about:

  flash_node <-- this one leaves room for a controller node, if we
                 eventually need it
  device_node
  dev_node
  of_node <-- this one is commonly used, but mostly out of legacy
              reasons. We're not really dealing with Open Firmware

?

Pick one and run with it.

Brian
