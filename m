Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWHWk-0000Dq-T1
 for linux-mtd@lists.infradead.org; Mon, 10 Dec 2018 09:07:00 +0000
Date: Mon, 10 Dec 2018 10:06:37 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Marek Vasut
 <marek.vasut@gmail.com>, Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 Vignesh R <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [RFC PATCH 01/34] mtd: spi-nor: Add a new hook to let part
 specific code tweak the config
Message-ID: <20181210100637.3229b425@bbrezillon>
In-Reply-To: <a998a19b-bc82-8900-d57c-3cf39a3a2422@nokia.com>
References: <20181207092637.18687-1-boris.brezillon@bootlin.com>
 <20181207092637.18687-2-boris.brezillon@bootlin.com>
 <a998a19b-bc82-8900-d57c-3cf39a3a2422@nokia.com>
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

On Fri, 7 Dec 2018 16:29:02 +0000
"Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
wrote:

> >  static const struct flash_info *spi_nor_match_id(const char *name)
> >  {
> >  	const struct flash_info *id = spi_nor_ids;
> > @@ -3805,6 +3821,18 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
> >  	if (info->flags & SPI_NOR_NO_FR)
> >  		params.hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
> >  
> > +	/*
> > +	 * Post SFDP fixups. Has to be called before spi_nor_setup() because
> > +	 * some fixups might modify params that are then used by
> > +	 * spi_nor_setup() to select the opcodes.
> > +	 */
> > +	ret = spi_nor_post_sfdp_fixups(nor, &params);
> > +	if (ret) {
> > +		dev_err(dev, "failed in the post-SFDP fixups (err %d)\n",
> > +			ret);  
> 
> You don't report an error in patch 34, I think there should be a consistent
> approach to this...

Patch 34 shouldn't have been part of this series :), but I agree, we
should be consistent.

> 
> > +		return ret;
> > +	}
> > +
> >  	/*
> >  	 * Configure the SPI memory:
> >  	 * - select op codes for (Fast) Read, Page Program and Sector Erase.
> >   
> 
