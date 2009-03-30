Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LoFB3-0007h9-Dx
	for linux-mtd@lists.infradead.org; Mon, 30 Mar 2009 10:57:20 +0000
Message-ID: <49D0A586.4080503@grandegger.com>
Date: Mon, 30 Mar 2009 12:57:10 +0200
From: Wolfgang Grandegger <wg@grandegger.com>
MIME-Version: 1.0
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Subject: Re: [PATCH 1/2] NAND: Add support for oob size 128
References: <20090325104836.325599143@denx.de>
	<20090325105020.607040279@denx.de>
	<20090325150551.GA4414@Chamillionaire.breakpoint.cc>
In-Reply-To: <20090325150551.GA4414@Chamillionaire.breakpoint.cc>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
	linux-mtd@lists.infradead.org, Ilya Yanok <yanok@emcraft.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sebastian,

Sebastian Andrzej Siewior wrote:
> * Wolfgang Grandegger | 2009-03-25 11:48:37 [+0100]:
> 
>> Signed-off-by: Ilya Yanok <yanok@emcraft.com>
>> Acked-by: Wolfgang Grandegger <wg@grandegger.com>
> 
> You seem to forgot a few bits (subpage_sft & max page size). I had this
> patch in my tree like for ever and forgot post it here. I did however
> merge the mtd-utils bits allready :)

I see. Your patch works fine for my board as well and I have added my
"acked-by" line below. David, could you please consider this patch for
kernel inclusion.

Thanks,

Wolfgang.

> From: Thomas Gleixner <tglx@linutronix.de>
> Date: Wed, 12 Dec 2007 17:27:03 +0100
> Subject: [PATCH] [MTD] Add support for 4k pages.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Sebastian Siewior <bigeasy@linutronix.de>
Acked-by: Wolfgang Grandegger <wg@grandegger.com

> ---
>  drivers/mtd/nand/nand_base.c |   18 ++++++++++++++++++
>  include/linux/mtd/nand.h     |    4 ++--
>  2 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 0a9c9cd..c3266fd 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -82,6 +82,20 @@ static struct nand_ecclayout nand_oob_64 = {
>  		 .length = 38}}
>  };
>  
> +static struct nand_ecclayout nand_oob_128 = {
> +	.eccbytes = 48,
> +	.eccpos = {
> +		   80, 81, 82, 83, 84, 85, 86, 87,
> +		   88, 89, 90, 91, 92, 93, 94, 95,
> +		   96, 97, 98, 99, 100, 101, 102, 103,
> +		   104, 105, 106, 107, 108, 109, 110, 111,
> +		   112, 113, 114, 115, 116, 117, 118, 119,
> +		   120, 121, 122, 123, 124, 125, 126, 127},
> +	.oobfree = {
> +		{.offset = 2,
> +		 .length = 78}}
> +};
> +
>  static int nand_get_device(struct nand_chip *chip, struct mtd_info *mtd,
>  			   int new_state);
>  
> @@ -2550,6 +2564,9 @@ int nand_scan_tail(struct mtd_info *mtd)
>  		case 64:
>  			chip->ecc.layout = &nand_oob_64;
>  			break;
> +		case 128:
> +			chip->ecc.layout = &nand_oob_128;
> +			break;
>  		default:
>  			printk(KERN_WARNING "No oob scheme defined for "
>  			       "oobsize %d\n", mtd->oobsize);
> @@ -2671,6 +2688,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>  			break;
>  		case 4:
>  		case 8:
> +		case 16:
>  			mtd->subpage_sft = 2;
>  			break;
>  		}
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 733d3f3..b90e683 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -43,8 +43,8 @@ extern void nand_wait_ready(struct mtd_info *mtd);
>   * is supported now. If you add a chip with bigger oobsize/page
>   * adjust this accordingly.
>   */
> -#define NAND_MAX_OOBSIZE	64
> -#define NAND_MAX_PAGESIZE	2048
> +#define NAND_MAX_OOBSIZE	128
> +#define NAND_MAX_PAGESIZE	4096
>  
>  /*
>   * Constants for hardware specific CLE/ALE/NCE function
