Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vt9Zj-0003NL-9U
 for linux-mtd@lists.infradead.org; Wed, 18 Dec 2013 05:21:40 +0000
Received: by mail-pd0-f180.google.com with SMTP id q10so7762948pdj.39
 for <linux-mtd@lists.infradead.org>; Tue, 17 Dec 2013 21:21:17 -0800 (PST)
Date: Wed, 18 Dec 2013 13:21:09 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
Subject: Re: [PATCH v5] mtd: gpmi: Deal with bitflips in erased regions regions
Message-ID: <20131218052108.GA1696@gmail.com>
References: <1387287942-20694-1-git-send-email-eliedebrauwer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1387287942-20694-1-git-send-email-eliedebrauwer@gmail.com>
Cc: b32955@freescale.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 17, 2013 at 02:45:42PM +0100, Elie De Brauwer wrote:
>  
> +	/* Set the tolerance for bitflips when reading erased blocks. */
> +	erase_threshold = gf_len / 2;
> +	if (erase_threshold > ecc_strength)
> +		erase_threshold = ecc_strength;
> +
I was about to give you my ACK, but i find you used a wrong ecc strength
here.  The "ecc_strength" is just half of the real ECC strength used by
the BCH. Please read this line in the function:
268	ecc_strength  = bch_geo->ecc_strength >> 1;

Could you please send a new version patch ?


> +	writel(erase_threshold & BM_BCH_MODE_ERASE_THRESHOLD_MASK,
> +		r->bch_regs + HW_BCH_MODE);
> +
>  	/* Set *all* chip selects to use layout 0. */
>  	writel(0, r->bch_regs + HW_BCH_LAYOUTSELECT);
>  
> @@ -1094,6 +1103,15 @@ int gpmi_is_ready(struct gpmi_nand_data *this, unsigned chip)
>  	return reg & mask;
>  }
>  
> +/*
> + * Count the number of 0 bits in a supposed to be
> + * erased region and correct them. Return the number
> + * of bitflips or zero when the region was correct.
> + */
> +static unsigned int erased_sector_bitflips(unsigned char *data,
> +					unsigned int chunk,
> +					struct bch_geometry *geo)
> +{
> +	unsigned int flip_bits = 0;
> +	int i;
> +	int base = geo->ecc_chunk_size * chunk;
> +
> +	/* Count bitflips */
> +	for (i = 0; i < geo->ecc_chunk_size; i++)
> +		flip_bits += hweight8(~data[base + i]);
> +
> +	/* Correct bitflips by 0xFF'ing this chunk. */
> +	if (flip_bits)
> +		memset(&data[base], 0xFF, geo->ecc_chunk_size);
> +
> +	return flip_bits;
> +}

Since a new version patch is inevitable, i want to give more comment
about this function.


Does the following code run faster then above?
static unsigned int erased_sector_bitflips(unsigned char *data,
					unsigned int chunk,
					struct bch_geometry *geo)
{
	unsigned int flip_bits = 0;
	int i;
	int base = geo->ecc_chunk_size * chunk;
	int tmp;

	for (i = 0; i < geo->ecc_chunk_size; i++) {
		tmp = hweight8(~data[base + i]);

		if (tmp) {
			data[base + i] = 0xff;
			flip_bits += tmp;
		}
	}

	return flip_bits;
}

I am not sure this code is faster then your code, i do not have time to
do a test to compare the two functions.

If you think your function is better, just ignore my code, it is okay to
me.

I really very appreciate at your work!

thanks
Huang Shijie
