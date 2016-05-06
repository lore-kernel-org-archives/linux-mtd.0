Received: from mail-pf0-x234.google.com ([2607:f8b0:400e:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayhp6-0001sP-VJ
 for linux-mtd@lists.infradead.org; Fri, 06 May 2016 15:37:49 +0000
Received: by mail-pf0-x234.google.com with SMTP id y69so50626036pfb.1
 for <linux-mtd@lists.infradead.org>; Fri, 06 May 2016 08:37:28 -0700 (PDT)
Date: Fri, 6 May 2016 08:37:24 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH] mtd: spi-nor: support GigaDevice gd25lq64c
Message-ID: <20160506153724.GA88242@google.com>
References: <1462496421-76186-1-git-send-email-computersforpeace@gmail.com>
 <572BF4E2.1040106@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <572BF4E2.1040106@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 06, 2016 at 03:35:30AM +0200, Marek Vasut wrote:
> On 05/06/2016 03:00 AM, Brian Norris wrote:
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -832,6 +832,7 @@ static const struct flash_info spi_nor_ids[] = {
> >  	/* GigaDevice */
> >  	{ "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64, SECT_4K) },
> >  	{ "gd25q64", INFO(0xc84017, 0, 64 * 1024, 128, SECT_4K) },
> > +	{ "gd25lq64c", INFO(0xc86017, 0, 64 * 1024, 128, SECT_4K | SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> 
> It's enough to use one SECT_4K , it will work just fine :-)

Of course :) Maybe I should read my own patch next time. Will send v2
shortly.

Thanks,
Brian

> >  	{ "gd25q128", INFO(0xc84018, 0, 64 * 1024, 256, SECT_4K) },
> 
> 
> -- 
> Best regards,
> Marek Vasut
