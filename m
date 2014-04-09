Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXwI0-0005Mf-Ru
 for linux-mtd@lists.infradead.org; Wed, 09 Apr 2014 17:27:59 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: EXPORT symbols which could be used by
 module drivers
Date: Wed, 9 Apr 2014 19:27:30 +0200
References: <1397023781-1103-1-git-send-email-computersforpeace@gmail.com>
 <201404091043.38198.marex@denx.de> <20140409170720.GB32070@ld-irv-0074>
In-Reply-To: <20140409170720.GB32070@ld-irv-0074>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404091927.31018.marex@denx.de>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, April 09, 2014 at 07:07:20 PM, Brian Norris wrote:
> On Wed, Apr 09, 2014 at 10:43:38AM +0200, Marek Vasut wrote:
> > On Wednesday, April 09, 2014 at 08:09:41 AM, Brian Norris wrote:
> > > Fix errors like this:
> > >     ERROR: "spi_nor_ids" [drivers/mtd/devices/m25p80.ko] undefined!
> > >     ERROR: "spi_nor_scan" [drivers/mtd/devices/m25p80.ko] undefined!
> > >     make[1]: *** [__modpost] Error 1
> > >     make: *** [modules] Error 2
> > 
> > Why not EXPORT_SYMBOL_GPL ?
> 
> _GPL probably makes more sense. Squashed this in and pushed to
> l2-mtd.git/spinor.

Thanks!

btw Brian, completely off-topic, but is there a special ML for SPI NOR stuff or 
is all of that going through linux-mtd ?

Best regards,
Marek Vasut
