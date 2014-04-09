Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXw6J-00053F-Jo
 for linux-mtd@lists.infradead.org; Wed, 09 Apr 2014 17:15:52 +0000
Received: by mail-pd0-f180.google.com with SMTP id v10so2688476pde.25
 for <linux-mtd@lists.infradead.org>; Wed, 09 Apr 2014 10:15:27 -0700 (PDT)
Date: Wed, 9 Apr 2014 10:07:20 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] mtd: spi-nor: EXPORT symbols which could be used by
 module drivers
Message-ID: <20140409170720.GB32070@ld-irv-0074>
References: <1397023781-1103-1-git-send-email-computersforpeace@gmail.com>
 <201404091043.38198.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201404091043.38198.marex@denx.de>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 09, 2014 at 10:43:38AM +0200, Marek Vasut wrote:
> On Wednesday, April 09, 2014 at 08:09:41 AM, Brian Norris wrote:
> > Fix errors like this:
> > 
> >     ERROR: "spi_nor_ids" [drivers/mtd/devices/m25p80.ko] undefined!
> >     ERROR: "spi_nor_scan" [drivers/mtd/devices/m25p80.ko] undefined!
> >     make[1]: *** [__modpost] Error 1
> >     make: *** [modules] Error 2
> 
> Why not EXPORT_SYMBOL_GPL ?

_GPL probably makes more sense. Squashed this in and pushed to
l2-mtd.git/spinor.

Thanks,
Brian
