Received: from mxout10.netvision.net.il ([194.90.6.38])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K3mc6-0008Lc-TS
	for linux-mtd@lists.infradead.org; Wed, 04 Jun 2008 06:36:51 +0000
Received: from mail.linux-boards.com ([62.90.235.247])
	by mxout10.netvision.net.il
	(Sun Java System Messaging Server 6.2-8.04 (built Feb 28 2007))
	with ESMTP id <0K1X001BZEIRIT80@mxout10.netvision.net.il> for
	linux-mtd@lists.infradead.org; Wed, 04 Jun 2008 09:40:03 +0300 (IDT)
Date: Wed, 04 Jun 2008 09:36:51 +0300
From: Mike Rapoport <mike@compulab.co.il>
Subject: Re: [PATCH] Add support to AMD AM29SL800D[BT] NOR flash chips
In-reply-to: <483BC42D.6050507@compulab.co.il>
To: David Woodhouse <dwmw2@infradead.org>
Message-id: <48463803.7090403@compulab.co.il>
MIME-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 7BIT
References: <483BC42D.6050507@compulab.co.il>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David,
Any chance you can look at it please?

Mike Rapoport wrote:
> This patch add support for non-CFI AMD AM29SL800D[BT] NOR flash chips
> 
> Signed-off-by: Mike Rapoport <mike@compulab.co.il>
> ---
>  drivers/mtd/chips/jedec_probe.c |   32 ++++++++++++++++++++++++++++++++
>  1 files changed, 32 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
> index aa07575..02e375b 100644
> --- a/drivers/mtd/chips/jedec_probe.c
> +++ b/drivers/mtd/chips/jedec_probe.c
> @@ -58,6 +58,8 @@
>  #define AM29LV040B	0x004F
>  #define AM29F032B	0x0041
>  #define AM29F002T	0x00B0
> +#define AM29SL800DB	0x226B
> +#define AM29SL800DT	0x22EA
> 
>  /* Atmel */
>  #define AT49BV512	0x0003
> @@ -522,6 +524,36 @@ static const struct amd_flash_info jedec_table[] = {
>  			ERASEINFO(0x04000,1),
>  		}
>  	}, {
> +		.mfr_id		= MANUFACTURER_AMD,
> +		.dev_id		= AM29SL800DT,
> +		.name		= "AMD AM29SL800DT",
> +		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
> +		.uaddr		= MTD_UADDR_0x0AAA_0x0555,
> +		.dev_size	= SIZE_1MiB,
> +		.cmd_set	= P_ID_AMD_STD,
> +		.nr_regions	= 4,
> +		.regions	= {
> +			ERASEINFO(0x10000,15),
> +			ERASEINFO(0x08000,1),
> +			ERASEINFO(0x02000,2),
> +			ERASEINFO(0x04000,1),
> +		}
> +	}, {
> +		.mfr_id		= MANUFACTURER_AMD,
> +		.dev_id		= AM29SL800DB,
> +		.name		= "AMD AM29SL800DB",
> +		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
> +		.uaddr		= MTD_UADDR_0x0AAA_0x0555,
> +		.dev_size	= SIZE_1MiB,
> +		.cmd_set	= P_ID_AMD_STD,
> +		.nr_regions	= 4,
> +		.regions	= {
> +			ERASEINFO(0x04000,1),
> +			ERASEINFO(0x02000,2),
> +			ERASEINFO(0x08000,1),
> +			ERASEINFO(0x10000,15),
> +		}
> +	}, {
>  		.mfr_id		= MANUFACTURER_ATMEL,
>  		.dev_id		= AT49BV512,
>  		.name		= "Atmel AT49BV512",

-- 
Sincerely yours,
Mike.
