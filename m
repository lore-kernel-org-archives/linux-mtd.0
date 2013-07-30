Received: from [94.23.35.102] (helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4I0q-00045e-E4
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 22:03:25 +0000
Date: Tue, 30 Jul 2013 19:02:56 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/4] mtd: nand: add accessors, macros for in-memory BBT
Message-ID: <20130730220254.GB2404@localhost>
References: <1374647279-14083-1-git-send-email-computersforpeace@gmail.com>
 <1374647279-14083-2-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1374647279-14083-2-git-send-email-computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Here's my attempt at reviewing this patchset, given the recent
discussion about needing more MTD reviewing.

I don't have enough experience with the NAND core to say anything about this,
but I noticed you're doing a bunch of related but not necessarily tied changes.

IMHO, splitting this patch further might make reviewing a lot easier, see below.

On Tue, Jul 23, 2013 at 11:27:56PM -0700, Brian Norris wrote:
> There is an abundance of magic numbers and complicated shifting/masking
> logic in the in-memory BBT code, and due to the complicated
> shifting/masking, we often store the block number multiplied by 2.
> Together, these features make the code unnecessary complex and hard to
> read.
> 
> This patch adds macros to represent the 00b, 01b, 10b, and 11b
> memory-BBT magic numbers, as well as two accessor functions for reading
> and marking the memory-BBT bitfield for a given block.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/nand/nand_bbt.c | 132 ++++++++++++++++++++++++--------------------
>  1 file changed, 72 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
> index 2672643..3f18776 100644
> --- a/drivers/mtd/nand/nand_bbt.c
> +++ b/drivers/mtd/nand/nand_bbt.c
> @@ -71,6 +71,28 @@
>  #include <linux/export.h>
>  #include <linux/string.h>
>  
> +#define BBT_BLOCK_GOOD		0x00
> +#define BBT_BLOCK_WORN		0x01
> +#define BBT_BLOCK_RESERVED	0x02
> +#define BBT_BLOCK_FACTORY_BAD	0x03
> +
> +#define BBT_ENTRY_MASK		0x03
> +#define BBT_ENTRY_SHIFT		2
> +

You can have one patch to change all the magic numbers into this nice
macros.

[...]
> -			for (j = 0; j < 8; j += bits, act += 2) {
> +			for (j = 0; j < 8; j += bits, act++) {
>  				uint8_t tmp = (dat >> j) & msk;
>  				if (tmp == msk)
>  					continue;
>  				if (reserved_block_code && (tmp == reserved_block_code)) {
>  					pr_info("nand_read_bbt: reserved block at 0x%012llx\n",
> -						 (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
> -					this->bbt[offs + (act >> 3)] |= 0x2 << (act & 0x06);
> +						 (loff_t)(offs + act) <<
> +						 this->bbt_erase_shift);
> +					bbt_mark_entry(this, offs + act,
> +							BBT_BLOCK_RESERVED);

And then another patch to use the new accesors.

[...]
>  int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
>  {
>  	struct nand_chip *this = mtd->priv;
> -	int block;
> -	uint8_t res;
> +	int block, res;
>  
> -	/* Get block number * 2 */

And then a third patch to make the block * 2 -> block change.

> -	block = (int)(offs >> (this->bbt_erase_shift - 1));
> -	res = (this->bbt[block >> 3] >> (block & 0x06)) & 0x03;
> +	block = (int)(offs >> this->bbt_erase_shift);
> +	res = bbt_get_entry(this, block);
>  
>  	pr_debug("nand_isbad_bbt(): bbt info for offs 0x%08x: "
>  			"(block %d) 0x%02x\n",
> -			(unsigned int)offs, block >> 1, res);
> +			(unsigned int)offs, block, res);
>  
> -	switch ((int)res) {
> -	case 0x00:
> +	switch (res) {

Mmm.. and then if you are really paranoid (like me) you can
make the uint8_t -> int type change in another patch.

> +	case BBT_BLOCK_GOOD:
>  		return 0;
> -	case 0x01:
> +	case BBT_BLOCK_WORN:
>  		return 1;
> -	case 0x02:
> +	case BBT_BLOCK_RESERVED:
>  		return allowbbt ? 0 : 1;
>  	}
>  	return 1;
> -- 
> 1.8.3.2
> 

Hope this is of any help!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
