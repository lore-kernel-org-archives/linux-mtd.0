Received: from guitar.tcltek.co.il ([192.115.133.116] helo=mx.tkos.co.il)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YkqqI-0005Zy-I3
 for linux-mtd@lists.infradead.org; Wed, 22 Apr 2015 09:21:16 +0000
Date: Wed, 22 Apr 2015 12:20:43 +0300
From: Baruch Siach <baruch@tkos.co.il>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: i.MX25 NFC with 8 bit ecc strength
Message-ID: <20150422092043.GA5428@tarshish>
References: <20150420045614.GC5428@tarshish>
 <20150420073702.GA2552@pengutronix.de>
 <20150420091130.GD5428@tarshish>
 <20150420154818.GE2552@pengutronix.de>
 <20150421062428.GJ5428@tarshish>
 <20150421073936.GI2552@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20150421073936.GI2552@pengutronix.de>
Cc: Shawn Guo <shawn.guo@linaro.org>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Uwe,

On Tue, Apr 21, 2015 at 09:39:36AM +0200, Uwe Kleine-König wrote:
> While understanding the problem I produced the following (untested)
> patch:

I intend to use this patch as part of a series fixing the large oob issue. Can 
you add your SoB please?

Thanks,
baruch

> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index dca63a70e783..fc835d352e1c 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -807,32 +807,49 @@ static void mxc_nand_select_chip_v2(struct mtd_info *mtd, int chip)
>  }
>  
>  /*
> - * Function to transfer data to/from spare area.
> + * The controller splits a page into data chunks of 512 bytes + partial oob.
> + * There are writesize / 512 such chunks, the size of the partial oob parts is
> + * oobsize / #chunks rounded down to a multiple of 2. The last oob chunk then
> + * contains additionally the byte lost by rounding (if any).
> + * This function handles the needed shuffling between host->data_buf (which
> + * holds a page in natural order, i.e. writesize bytes data + oobsize bytes
> + * spare) and the NFC buffer.
>   */
>  static void copy_spare(struct mtd_info *mtd, bool bfrom)
>  {
>  	struct nand_chip *this = mtd->priv;
>  	struct mxc_nand_host *host = this->priv;
>  	u16 i, j;
> -	u16 n = mtd->writesize >> 9;
> +
> +	u16 num_chunks = mtd->writesize / 512;
> +
>  	u8 *d = host->data_buf + mtd->writesize;
>  	u8 __iomem *s = host->spare0;
> -	u16 t = host->devtype_data->spare_len;
> +	u16 sparebuf_size = host->devtype_data->spare_len;
>  
> -	j = (mtd->oobsize / n >> 1) << 1;
> +	/* size of oob chunk for all but possibly the last one */
> +	oob_chunk_size = (mtd->oobsize / num_chunks >> 1) << 1;
>  
>  	if (bfrom) {
> -		for (i = 0; i < n - 1; i++)
> -			memcpy32_fromio(d + i * j, s + i * t, j);
> +		for (i = 0; i < num_chunks - 1; i++)
> +			memcpy32_fromio(d + i * oob_chunk_size,
> +					s + i * sparebuf_size,
> +					oob_chunk_size);
>  
>  		/* the last section */
> -		memcpy32_fromio(d + i * j, s + i * t, mtd->oobsize - i * j);
> +		memcpy32_fromio(d + i * oob_chunk_size,
> +				s + i * sparebuf_size,
> +				mtd->oobsize - i * oob_chunk_size);
>  	} else {
> -		for (i = 0; i < n - 1; i++)
> -			memcpy32_toio(&s[i * t], &d[i * j], j);
> +		for (i = 0; i < num_chunks - 1; i++)
> +			memcpy32_toio(&s[i * sparebuf_size],
> +				      &d[i * oob_chunk_size],
> +				      oob_chunk_size);
>  
>  		/* the last section */
> -		memcpy32_toio(&s[i * t], &d[i * j], mtd->oobsize - i * j);
> +		memcpy32_toio(&s[oob_chunk_size * sparebuf_size],
> +			      &d[i * oob_chunk_size],
> +			      mtd->oobsize - i * oob_chunk_size);
>  	}
>  }

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
