Received: from smtp.gentoo.org ([140.211.166.183])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQWzz-0004Jf-RK
 for linux-mtd@lists.infradead.org; Sat, 15 Aug 2015 08:39:32 +0000
Date: Sat, 15 Aug 2015 10:38:59 +0200
From: Alexis Ballier <aballier@gentoo.org>
To: Marek Vasut <marex@denx.de>
Cc: Ben Hutchings <ben@decadent.org.uk>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, open list <linux-kernel@vger.kernel.org>, Gabor Juhos
 <juhosg@openwrt.org>, "open list:MEMORY TECHNOLOGY DEVICES \(MTD\)"
 <linux-mtd@lists.infradead.org>, Huang Shijie <shijie.huang@intel.com>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, "Bean Huo  =?UTF-8?B?6ZyN5paM5paM?= \(beanhuo\)"
 <beanhuo@micron.com>
Subject: Re: [PATCH] mtd: spi-nor: Add support for sst25wf020a.
Message-ID: <20150815103859.0a15da43@gentoo.org>
In-Reply-To: <201508142245.14289.marex@denx.de>
References: <1439573741-24491-1-git-send-email-aballier@gentoo.org>
 <201508142245.14289.marex@denx.de>
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

On Fri, 14 Aug 2015 22:45:14 +0200
Marek Vasut <marex@denx.de> wrote:

> On Friday, August 14, 2015 at 07:35:39 PM, Alexis Ballier wrote:
> > It is a 256KiB flash with 4 KiB erase sectors
> > and 64KiB overlay blocks.
> > 
> > This is the one available on Hardkernel's Odroid U3 shield.
> > 
> > Signed-off-by: Alexis Ballier <aballier@gentoo.org>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c
> > b/drivers/mtd/spi-nor/spi-nor.c index d78831b..e521b35 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -636,6 +636,7 @@ static const struct spi_device_id spi_nor_ids[]
> > = { { "sst25wf512",  INFO(0xbf2501, 0, 64 * 1024,  1, SECT_4K |
> > SST_WRITE) 
> },
> >  	{ "sst25wf010",  INFO(0xbf2502, 0, 64 * 1024,  2, SECT_4K
> > | SST_WRITE) 
> },
> >  	{ "sst25wf020",  INFO(0xbf2503, 0, 64 * 1024,  4, SECT_4K
> > | SST_WRITE) 
> },
> > +	{ "sst25wf020a", INFO(0x621612, 0, 64 * 1024,  4,
> > SECT_4K) },
> 
> Is the SST_WRITE not needed on this device ?


Tried that at first and it didn't work (writes were silently not
performed).

I'm no expert here, but I don't see anything about auto address
increment in the spec:
http://ww1.microchip.com/downloads/en/DeviceDoc/20005139E.pdf
and it uses the page program command (0x02).

Alexis.


[...]
