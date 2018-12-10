Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWH2g-0006TS-DF
 for linux-mtd@lists.infradead.org; Mon, 10 Dec 2018 08:35:57 +0000
Date: Mon, 10 Dec 2018 09:35:32 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Vignesh R <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Marek Vasut
 <marek.vasut@gmail.com>, Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Richard
 Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
Subject: Re: [RFC PATCH 13/34] mtd: spi-nor: Add the concept of SPI NOR
 manufacturer driver
Message-ID: <20181210093532.5b3de67a@bbrezillon>
In-Reply-To: <e0db2bce-df36-9068-cc41-149e9c919b1e@ti.com>
References: <20181207092637.18687-1-boris.brezillon@bootlin.com>
 <20181207092637.18687-14-boris.brezillon@bootlin.com>
 <e0db2bce-df36-9068-cc41-149e9c919b1e@ti.com>
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

Hi Vignesh,

On Mon, 10 Dec 2018 13:50:03 +0530
Vignesh R <vigneshr@ti.com> wrote:

> >  static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
> >  {
> >  	int			tmp;
> > @@ -1734,13 +1751,21 @@ static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
> >  		return ERR_PTR(tmp);
> >  	}
> >  
> > -	for (tmp = 0; tmp < ARRAY_SIZE(spi_nor_ids) - 1; tmp++) {
> > -		info = &spi_nor_ids[tmp];
> > -		if (info->id_len) {
> > -			if (!memcmp(info->id, id, info->id_len))
> > -				return &spi_nor_ids[tmp];
> > +	for (tmp = 0; tmp < ARRAY_SIZE(manufacturers); tmp++) {
> > +		info = spi_nor_search_part_by_id(manufacturers[tmp]->parts,
> > +						 manufacturers[tmp]->nparts,
> > +						 id);  
> 
> This could probably be optimized a bit by comparing manufacturer ID and
> then looking through parts list of that particular manufacturer only.
> (with expection of winbond manufacturer ID, where will have to go
> through spansion parts list as well)

That's what I did at first, but it doesn't work. Some manufacturer IDs
are prefixed by one or several continuation codes (0x7F). That was done
to extend the 256 IDs space (see spec JEP106AX). We could have the
manufacturer ID encoded with an array of byte instead of a single byte,
but there's more: some flashes that are supposed to used continuation
codes, just output the last (non-continuation) byte (see the ISSI IDs
here [1] if you need a proof ;-)). So we're screwed.

Regards,

Boris

[1]https://elixir.bootlin.com/linux/v4.20-rc6/source/drivers/mtd/spi-nor/spi-nor.c#L1351
