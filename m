Date: Wed, 8 Jan 2014 20:36:03 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Rodolfo Giometti <giometti@enneenne.com>
Subject: Re: NAND support for Armada 370
Message-ID: <20140108233603.GB2595@localhost>
References: <20140102124407.GF10251@enneenne.com>
 <20140102144236.270c4a6a@skate>
 <20140103112926.GP10251@enneenne.com>
 <20140103145336.GA9618@localhost>
 <20140106153438.GX10251@enneenne.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140106153438.GX10251@enneenne.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory =?utf-8?Q?Cl=C3=A9ment?= <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Rodolfo,

(Ccing MTD list so they can review this as well)

On Mon, Jan 06, 2014 at 04:34:38PM +0100, Rodolfo Giometti wrote:
> On Fri, Jan 03, 2014 at 11:53:37AM -0300, Ezequiel Garcia wrote:
> > 
> > Can you modify the above message so the ECC step size is also printed?
> > I'll help you prepare a suitable fix to support your NAND.
> 
> After some attemps I found this configuration... however I'd like to
> have your opinion about it since I'm not so sure that I correctly
> understood what each parameter means. :-)
> 

Sorry for being so unresponsive these days, I've been on vacation.
I'll review your patch on Monday.

In fact, already took a quick look and it looks good. I have a few
doubts:

1. Do we need the ECC layout? (MTD already provides defaults)

2. Is this compatible with Marvell's U-Boot? (can you write from U-Boot,
and read from Linux, and viceversa?)

Regards and thanks a lot for your contribution!
Ezequiel

> From 8fc320506e1573dbff4844f4d98e20ff91c43ffd Mon Sep 17 00:00:00 2001
> From: Rodolfo Giometti <giometti@linux.it>
> Date: Mon, 6 Jan 2014 16:18:49 +0100
> Subject: [PATCH] mtd pxa3xx_nand.c: add support for 2048 bytes page size
>  layout
> 
> Signed-off-by: Rodolfo Giometti <giometti@linux.it>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 31aae53..2a7a0b2 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -286,6 +286,16 @@ static struct nand_bbt_descr bbt_mirror_descr = {
>  	.pattern = bbt_mirror_pattern
>  };
>  
> +static struct nand_ecclayout ecc_layout_2KB_bch4bit = {
> +	.eccbytes = 32,
> +	.eccpos = {
> +		32, 33, 34, 35, 36, 37, 38, 39,
> +		40, 41, 42, 43, 44, 45, 46, 47,
> +		48, 49, 50, 51, 52, 53, 54, 55,
> +		56, 57, 58, 59, 60, 61, 62, 63},
> +	.oobfree = { {2, 30} }
> +};
> +
>  static struct nand_ecclayout ecc_layout_4KB_bch4bit = {
>  	.eccbytes = 64,
>  	.eccpos = {
> @@ -1360,6 +1370,17 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
>  	 * Required ECC: 4-bit correction per 512 bytes
>  	 * Select: 16-bit correction per 2048 bytes
>  	 */
> +	} else if (strength == 4 && ecc_stepsize == 512 && page_size == 2048) {
> +		info->ecc_bch = 1;
> +		info->chunk_size = 2048;
> +		info->spare_size = 32;
> +		info->ecc_size = 32;
> +		ecc->mode = NAND_ECC_HW;
> +		ecc->size = info->chunk_size;
> +		ecc->layout = &ecc_layout_2KB_bch4bit;
> +		ecc->strength = 16;
> +		return 1;
> +
>  	} else if (strength == 4 && ecc_stepsize == 512 && page_size == 4096) {
>  		info->ecc_bch = 1;
>  		info->chunk_size = 2048;
> -- 
> 1.8.1.2
> 


-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
