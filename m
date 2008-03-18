Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jbehm-0008Fr-DP
	for linux-mtd@lists.infradead.org; Tue, 18 Mar 2008 16:30:26 +0000
Received: from [192.168.12.28] (unknown [10.149.0.1])
	by buildserver.ru.mvista.com (Postfix) with ESMTP id B82858814
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Mar 2008 21:30:43 +0400 (SAMT)
Message-ID: <47DFEE70.2020506@ru.mvista.com>
Date: Tue, 18 Mar 2008 19:31:44 +0300
From: Andrei Dolnikov <adolnikov@ru.mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH][MTD][NOR]Add support for the SST 36VF3203 flash chip
References: <20080303180121.GA9206@ru.mvista.com>
In-Reply-To: <20080303180121.GA9206@ru.mvista.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, mtd folks,

I've posted the patch a couple of weeks ago. Just wanted check if it can 
be ACK-ed?

Thanks,
Andrei.

Andrei Dolnikov wrote:
> Add support for the SST 36VF3203 flash chip. It is used on Emerson KSI8560 board.
>
> Signed-off-by: Andrei Dolnikov <adolnikov@ru.mvista.com>
>
> ---
>  jedec_probe.c |   13 +++++++++++++
>  1 files changed, 13 insertions(+)
>
> diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
> index 6405938..15e061b 100644
> --- a/drivers/mtd/chips/jedec_probe.c
> +++ b/drivers/mtd/chips/jedec_probe.c
> @@ -160,6 +160,7 @@
>  #define SST49LF030A	0x001C
>  #define SST49LF040A	0x0051
>  #define SST49LF080A	0x005B
> +#define SST36VF3203	0x7354
>  
>  /* Toshiba */
>  #define TC58FVT160	0x00C2
> @@ -1412,6 +1413,18 @@ static const struct amd_flash_info jedec_table[] = {
>  			ERASEINFO(0x1000,256)
>  		}
>  	}, {
> +		.mfr_id		= MANUFACTURER_SST,
> +		.dev_id		= SST36VF3203,
> +		.name		= "SST 36VF3203",
> +		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
> +		.uaddr		= MTD_UADDR_0x0AAA_0x0555,
> +		.dev_size	= SIZE_4MiB,
> +		.cmd_set	= P_ID_AMD_STD,
> +		.nr_regions	= 1,
> +		.regions	= {
> +			ERASEINFO(0x10000,64),
> +		}
> +	}, {
>  		.mfr_id		= MANUFACTURER_ST,
>  		.dev_id		= M29F800AB,
>  		.name		= "ST M29F800AB",
> _______________________________________________
> Linuxppc-dev mailing list
> Linuxppc-dev@ozlabs.org
> https://ozlabs.org/mailman/listinfo/linuxppc-dev
>   
