Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YX4hC-00089F-Vj
 for linux-mtd@lists.infradead.org; Sun, 15 Mar 2015 09:18:56 +0000
Date: Sun, 15 Mar 2015 10:18:30 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: rnd4@dave-tech.it, Andrea Scian <andrea.scian@dave.eu>
Subject: Re: [PATCH 2/2] mtd: nand: use nand_chip badblockbits when checking
 bad block pattern
Message-ID: <20150315101830.012dc4cb@bbrezillon>
In-Reply-To: <1425643938-24749-3-git-send-email-rnd4@dave-tech.it>
References: <1425643938-24749-1-git-send-email-rnd4@dave-tech.it>
 <1425643938-24749-3-git-send-email-rnd4@dave-tech.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Andrea,

On Fri,  6 Mar 2015 13:12:18 +0100
rnd4@dave-tech.it wrote:

> From: Andrea Scian <andrea.scian@dave.eu>
> 
> Use nand_chip->badblockbits like it's used inside nand_base.c when scanning
> bad block markers.
> This is particularly useful when using MLC NAND
> 
> Signed-off-by: Andrea Scian <andrea.scian@dave.eu>
> ---
>  drivers/mtd/nand/nand_bbt.c |   19 ++++++++++++++++---
>  include/linux/mtd/bbm.h     |    3 +++
>  2 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
> index 2672643..dba7f8b 100644
> --- a/drivers/mtd/nand/nand_bbt.c
> +++ b/drivers/mtd/nand/nand_bbt.c
> @@ -127,9 +127,21 @@ static int check_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_desc
>   */
>  static int check_short_pattern(uint8_t *buf, struct nand_bbt_descr *td)
>  {
> -	/* Compare the pattern */
> -	if (memcmp(buf + td->offs, td->pattern, td->len))
> -		return -1;
> +	if (likely(td->toleratedbitdiff == 0)) {

I know I'm the one who suggested the toleratedbitdiff variable name,
but maybe you should follow the naming convention in this file:
tolerated_bit_diff.

> +		/* Compare the pattern */
> +		if (memcmp(buf + td->offs, td->pattern, td->len))
> +			return -1;
> +	} else {
> +		int i, nbitdiff = 0;
> +		uint8_t tmp;
> +
> +		for (i = 0; i < td->len; i++) {
> +			tmp = buf[td->offs + i] ^ td->pattern[i];
> +			nbitdiff += hweight8(tmp);
> +			if (nbitdiff > td->toleratedbitdiff)
> +				return -1;
> +		}
> +	}
>  	return 0;
>  }
>  
> @@ -1309,6 +1321,7 @@ static int nand_create_badblock_pattern(struct nand_chip *this)
>  	bd->len = (this->options & NAND_BUSWIDTH_16) ? 2 : 1;
>  	bd->pattern = scan_ff_pattern;
>  	bd->options |= NAND_BBT_DYNAMICSTRUCT;
> +	bd->toleratedbitdiff = 8-this->badblockbits;
>  	this->badblock_pattern = bd;
>  	return 0;
>  }
> diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
> index 211ff67..0714337 100644
> --- a/include/linux/mtd/bbm.h
> +++ b/include/linux/mtd/bbm.h
> @@ -48,6 +48,8 @@
>   *              bad) block in the stored bbt
>   * @pattern:	pattern to identify bad block table or factory marked good /
>   *		bad blocks, can be NULL, if len = 0
> + * @toleratedbitdiff: number of tolerated bit difference (in a byte) between
> + *		pattern and buffer

Why do you want to make this value a per byte value. I mean, if we have
a pattern taking more than one byte, it makes sense to specify the
total number of tolerated bitflips for the whole pattern.
BTW, the implementation does not match your description (this value
represent the number of tolerated bitflips for the whole pattern).

>   *
>   * Descriptor for the bad block table marker and the descriptor for the
>   * pattern which identifies good and bad blocks. The assumption is made
> @@ -64,6 +66,7 @@ struct nand_bbt_descr {
>  	int maxblocks;
>  	int reserved_block_code;
>  	uint8_t  *pattern;
> +	int toleratedbitdiff;

Do we really need to add a new field, can't we pass this value when
calling check_short_pattern.

Best Regards,

Boris



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
