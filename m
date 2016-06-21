Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFMxB-00083f-PW
 for linux-mtd@lists.infradead.org; Tue, 21 Jun 2016 14:47:03 +0000
Date: Tue, 21 Jun 2016 16:46:39 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH] mtd: nand: gpmi: Fix ecc strength calculation
Message-ID: <20160621164639.23fde5d6@bbrezillon>
In-Reply-To: <1466519749-7729-1-git-send-email-s.hauer@pengutronix.de>
References: <1466519749-7729-1-git-send-email-s.hauer@pengutronix.de>
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

On Tue, 21 Jun 2016 16:35:49 +0200
Sascha Hauer <s.hauer@pengutronix.de> wrote:

> BCH ECC correction works in chunks of 512 bytes, so a 2k page size nand
> is divided into 4 chunks. Hardware requires that each chunk has a full
> number of bytes, so when we need 9 bits per chunk we must round up to
> two bytes. The current code misses that and calculates a ECC strength
> of 18 for a 2048+128 byte page size NAND. ECC strength of 18 requires
> 30 bytes per chunk, so a total of 4 * (512 + 30) + 10 = 2178 bytes when
> the device only has a page size of 2176 bytes.

AFAIR, the GPMI/ECC engine operates at the bit level (which is a pain
to deal with BTW), and is only requiring a byte alignment on the total
number of ECC bits. So here, DIV_ROUND_UP(18 * 13 * 4, 8) = 117, which
fits in the 118 bytes (128 bytes - 10 bytes of 'metadata').

Han, can you confirm that?

> 
> Fix this by first calculating the number of bytes per chunk we have
> available for ECC which also makes it easier to follow the calculation.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 28 ++++++++--------------------
>  1 file changed, 8 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index 6e46156..95fb3dc 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -119,32 +119,20 @@ static irqreturn_t bch_irq(int irq, void *cookie)
>  	return IRQ_HANDLED;
>  }
>  
> -/*
> - *  Calculate the ECC strength by hand:
> - *	E : The ECC strength.
> - *	G : the length of Galois Field.
> - *	N : The chunk count of per page.
> - *	O : the oobsize of the NAND chip.
> - *	M : the metasize of per page.
> - *
> - *	The formula is :
> - *		E * G * N
> - *	      ------------ <= (O - M)
> - *                  8
> - *
> - *      So, we get E by:
> - *                    (O - M) * 8
> - *              E <= -------------
> - *                       G * N
> - */
>  static inline int get_ecc_strength(struct gpmi_nand_data *this)
>  {
>  	struct bch_geometry *geo = &this->bch_geometry;
>  	struct mtd_info	*mtd = nand_to_mtd(&this->nand);
>  	int ecc_strength;
> +	int n;
> +
> +	/* number of ecc bytes we have per chunk */
> +	n = (mtd->oobsize - geo->metadata_size) / geo->ecc_chunk_count;
> +
> +	/* in bits */
> +	n <<= 3;
>  
> -	ecc_strength = ((mtd->oobsize - geo->metadata_size) * 8)
> -			/ (geo->gf_len * geo->ecc_chunk_count);
> +	ecc_strength = n / geo->gf_len;
>  
>  	/* We need the minor even number. */
>  	return round_down(ecc_strength, 2);
