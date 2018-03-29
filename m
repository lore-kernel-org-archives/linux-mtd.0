Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f1dwq-0003Jd-PJ
 for linux-mtd@lists.infradead.org; Thu, 29 Mar 2018 20:15:02 +0000
Date: Thu, 29 Mar 2018 22:14:48 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: jedec_probe: add Eon EN29LV400A IDs
Message-ID: <20180329221448.203c4775@bbrezillon>
In-Reply-To: <20180303223145.27903-1-linus.walleij@linaro.org>
References: <20180303223145.27903-1-linus.walleij@linaro.org>
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

On Sat,  3 Mar 2018 23:31:45 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> This adds the JEDEC IDs for Eon EN29LV400A variants
> EN29LV400AB and EN29LV400AT. This chip is found in the
> D-Link DNS-313.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied.

Thanks,

Boris

> ---
>  drivers/mtd/chips/jedec_probe.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
> index b479bd81120b..6f7e7e1b3fe5 100644
> --- a/drivers/mtd/chips/jedec_probe.c
> +++ b/drivers/mtd/chips/jedec_probe.c
> @@ -53,6 +53,8 @@
>  #define AT49BV32XT	0x00C9
>  
>  /* Eon */
> +#define EN29LV400AT	0x22B9
> +#define EN29LV400AB	0x22BA
>  #define EN29SL800BB	0x226B
>  #define EN29SL800BT	0x22EA
>  
> @@ -641,6 +643,36 @@ static const struct amd_flash_info jedec_table[] = {
>  			ERASEINFO(0x10000,63),
>  			ERASEINFO(0x02000,8)
>  		}
> +	}, {
> +		.mfr_id		= CFI_MFR_EON,
> +		.dev_id		= EN29LV400AT,
> +		.name		= "Eon EN29LV400AT",
> +		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
> +		.uaddr		= MTD_UADDR_0x0AAA_0x0555,
> +		.dev_size	= SIZE_512KiB,
> +		.cmd_set	= P_ID_AMD_STD,
> +		.nr_regions	= 4,
> +		.regions	= {
> +			ERASEINFO(0x10000,7),
> +			ERASEINFO(0x08000,1),
> +			ERASEINFO(0x02000,2),
> +			ERASEINFO(0x04000,1),
> +		}
> +	}, {
> +		.mfr_id		= CFI_MFR_EON,
> +		.dev_id		= EN29LV400AB,
> +		.name		= "Eon EN29LV400AB",
> +		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
> +		.uaddr		= MTD_UADDR_0x0AAA_0x0555,
> +		.dev_size	= SIZE_512KiB,
> +		.cmd_set	= P_ID_AMD_STD,
> +		.nr_regions	= 4,
> +		.regions	= {
> +			ERASEINFO(0x04000,1),
> +			ERASEINFO(0x02000,2),
> +			ERASEINFO(0x08000,1),
> +			ERASEINFO(0x10000,7),
> +		}
>  	}, {
>  		.mfr_id		= CFI_MFR_EON,
>  		.dev_id		= EN29SL800BT,



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
