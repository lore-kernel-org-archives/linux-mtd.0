Received: from mail-ob0-x233.google.com ([2607:f8b0:4003:c01::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VeqwZ-0002b8-5C
 for linux-mtd@lists.infradead.org; Fri, 08 Nov 2013 18:38:10 +0000
Received: by mail-ob0-f179.google.com with SMTP id wn1so577753obc.24
 for <linux-mtd@lists.infradead.org>; Fri, 08 Nov 2013 10:37:45 -0800 (PST)
Date: Fri, 8 Nov 2013 10:37:39 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [PATCHv3 2/2] drivers: mtd: m25p80: Add quad read support.
Message-ID: <20131108183739.GC20061@ld-irv-0074.broadcom.com>
References: <1383748535-20462-1-git-send-email-sourav.poddar@ti.com>
 <1383748535-20462-3-git-send-email-sourav.poddar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1383748535-20462-3-git-send-email-sourav.poddar@ti.com>
Cc: marex@denx.de, linux-mtd@lists.infradead.org, balbi@ti.com,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 06, 2013 at 08:05:35PM +0530, Sourav Poddar wrote:
> Some flash also support quad read mode.
> Adding support for adding quad mode in m25p80
> for spansion and macronix flash.
> 
> Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
> ---
> v2->v3:
> Re arrange the code based on the cleanup done as
> first patch of the series.
>  drivers/mtd/devices/m25p80.c |  149 ++++++++++++++++++++++++++++++++++++++++-
>  1 files changed, 145 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index cfafdce..7460fb3 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> +static inline int set_quad_mode(struct m25p *flash, u32 jedec_id)

I would drop the inline here. This isn't a critical path function, nor
is it particularly small.

> +{
> +	int status;
> +
> +	switch (JEDEC_MFR(jedec_id)) {
> +	case CFI_MFR_MACRONIX:
> +		status = macronix_quad_enable(flash);
> +		if (status) {
> +			dev_err(&flash->spi->dev,
> +				"Macronix quad-read not enabled");
> +			return -EINVAL;
> +		}
> +		return status;
> +	default:
> +		status = spansion_quad_enable(flash);
> +		if (status) {
> +			dev_err(&flash->spi->dev,
> +				"Spansion quad-read not enabled");
> +			return -EINVAL;
> +		}
> +		return status;
> +	}
> +}
> +
> +/*
>   * Erase the whole flash memory
>   *
>   * Returns 0 if successful, non-zero otherwise.

...

> @@ -397,6 +516,7 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
>  		return -EINVAL;
>  	}
>  
> +

Extraneous new line?

>  	t[0].tx_buf = flash->command;
>  	t[0].len = m25p_cmdsz(flash) + dummy;
>  	spi_message_add_tail(&t[0], &m);
> @@ -727,6 +847,7 @@ struct flash_info {
>  #define	SST_WRITE	0x04		/* use SST byte programming */
>  #define	M25P_NO_FR	0x08		/* Can't do fastread */
>  #define	SECT_4K_PMC	0x10		/* OPCODE_BE_4K_PMC works uniformly */
> +#define	M25P80_QUAD_READ	0x20    /* Flash supports Quad Read */
>  };
>  
>  #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\

...

> @@ -1089,12 +1220,19 @@ static int m25p_probe(struct spi_device *spi)
>  		flash->flash_read = M25P80_FAST;
>  	}
>  
> -	/* Some devices cannot do fast-read, no matter what DT tells us */
> -	if (info->flags & M25P_NO_FR)
> +	/*
> +	 * Some devices cannot do fast-read, no matter what DT tells us
> +	 * Some device might support Quad read also. So, If fast read and quad
> +	 * read both are not supported, default to NORMAL mode.
> +	 */
> +	if ((info->flags & M25P_NO_FR) || !(info->flags & M25P80_QUAD_READ))
>  		flash->flash_read = M25P80_NORMAL;
>  

Did I miss something earlier, or did you just sneak this hunk into v3?
This is incorrect. It effectively drops all support for FAST_READ in
devices that don't support QUAD_READ, due the second clause of your ||.

Similarly, I just realized you placed the QUAD_READ check before the
fast/normal checks, which means that fast/normal-read will often
override quad-read. This also is not what we want.

Since I already started fixing up your patch, I'll just send out the v4
and let you guys take a look at it.

Brian
