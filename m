Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K3aX8-0003sS-Qj
	for linux-mtd@lists.infradead.org; Tue, 03 Jun 2008 17:42:55 +0000
Date: Tue, 3 Jun 2008 19:42:45 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: [RFC/PATCH 2/3] NAND multiple plane feature
Message-ID: <20080603174244.GC1224@logfs.org>
References: <alpine.LFD.1.10.0805281342150.23606@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.LFD.1.10.0805281342150.23606@pentafluge.infradead.org>
Cc: linux-mtd@lists.infradead.org, tglx@linutronix.de, dwmw2@infradead.org,
	vasiliy.leonenko@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 28 May 2008 14:08:01 +0100, Alexey Korolev wrote:
>
> @@ -2449,9 +2453,6 @@ int nand_scan_tail(struct mtd_info *mtd)
>  		}
>  	}
>  
> -	if (!chip->write_page)
> -		chip->write_page = nand_write_page;
> -

Why is this removed?

> @@ -2593,6 +2594,21 @@ int nand_scan_tail(struct mtd_info *mtd)
>  
>  	/* propagate ecc.layout to mtd_info */
>  	mtd->ecclayout = chip->ecc.layout;
> +	if (chip->numplanes > 1) {
> +		for (oobfree_len = 0; chip->ecc.layout->oobfree[oobfree_len].length; oobfree_len++)
> +			;

Empty loop body.  And the header doesn't seem to have a side-effect
either.  If it does, it can sure use a comment.

> +		i = 0;
> +		while (i < chip->numplanes) {

		for (i = 0; i < chip->numplanes; i++) ?

> +			for (j = 0; j < oobfree_len ; j++) {
> +				chip->ecc.layout->oobfree[j + i * oobfree_len].length = chip->ecc.layout->oobfree[j].length;
> +				chip->ecc.layout->oobfree[j + i * oobfree_len].offset = chip->ecc.layout->oobfree[j].offset + chip->oob_phys_size * i;

Even if I sound like Andrew Morton, what is the meaning of i and j?
Maybe rename the variable so future readers don't ask that question?
Add a helper variable for chip->ecc.layout->oobfree and I might even be
able to understand what this code does. ;)

> +			}
> +			for (j = 0; j < chip->ecc.layout->eccbytes; j++)
> +				chip->ecc.layout->eccpos[j + i * chip->ecc.layout->eccbytes] = chip->ecc.layout->eccpos[j] + chip->oob_phys_size * i;
> +			i++;
> +		}
> +		chip->ecc.layout->eccbytes *= chip->numplanes;
> +	}
>  
>  	/* Check, if we should skip the bad block table scan */
>  	if (chip->options & NAND_SKIP_BBTSCAN)
> diff -Nurp linux-2.6.24.3/drivers/mtd/nand/nand_bbt.c linux-2.6.24.3-dp/drivers/mtd/nand/nand_bbt.c
> --- linux-2.6.24.3/drivers/mtd/nand/nand_bbt.c	2008-02-26 03:20:20.000000000 +0300
> +++ linux-2.6.24.3-dp/drivers/mtd/nand/nand_bbt.c	2008-05-28 14:57:56.000000000 +0400
> @@ -75,12 +75,15 @@
>   * pattern area contain 0xff
>   *
>  */
> -static int check_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_descr *td)
> +static int check_pattern(struct mtd_info *mtd, uint8_t *buf, int len, int paglen, struct nand_bbt_descr *td)
>  {
>  	int i, end = 0;
> +	struct nand_chip *this = mtd->priv;
> +	int plane_num = 0;
>  	uint8_t *p = buf;
>  
> -	end = paglen + td->offs;
> +	do {
> +	end = this->page_phys_size + td->offs;

The loop wants indentation.

>  	if (td->options & NAND_BBT_SCANEMPTY) {
>  		for (i = 0; i < end; i++) {
>  			if (p[i] != 0xff)
> @@ -103,6 +106,10 @@ static int check_pattern(uint8_t *buf, i
>  				return -1;
>  		}
>  	}
> +	p += len - end;
> +	plane_num++;
> +	}
> +	while (plane_num < this->numplanes);

	} while (plane_num < this->numplanes);

> -		if (p[td->offs + i] != td->pattern[i])
> +		if (p[this->oob_phys_size * plane_num + td->offs + i] != td->pattern[i])

This is beyond me.  Without context I have no clue what it does.  And
even with context it is hard work to figure it out.  Not good.

My first thought was to move the calculation of
"p[this->oob_phys_size * plane_num + td->offs + i]" to an inline
function.  But I doubt whether that is much better.  Ideas?

>  			return -1;
>  	}
> +	plane_num++;
> +	}
> +	while (plane_num < this->numplanes);

Add indentation, remove newline.

> -#define NAND_MAX_OOBSIZE	64
> -#define NAND_MAX_PAGESIZE	2048
> +#define NAND_MAX_OOBSIZE	128
> +#define NAND_MAX_PAGESIZE	4096

Are there chips with four planes around already?

Jörn

-- 
He who knows that enough is enough will always have enough.
-- Lao Tsu
