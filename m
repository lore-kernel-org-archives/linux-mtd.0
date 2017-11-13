Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eEFgF-0003YR-1b
 for linux-mtd@lists.infradead.org; Mon, 13 Nov 2017 14:25:46 +0000
Received: by mail-wm0-x243.google.com with SMTP id l8so9678960wmg.4
 for <linux-mtd@lists.infradead.org>; Mon, 13 Nov 2017 06:25:22 -0800 (PST)
Subject: Re: [PATCH] mtd: chips: Add PMC flash memory description
To: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org
References: <20171112063047.13797-1-prasannatsmkumar@gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <60de6798-8ed1-5df7-3ff6-701727ac9b32@gmail.com>
Date: Mon, 13 Nov 2017 15:23:33 +0100
MIME-Version: 1.0
In-Reply-To: <20171112063047.13797-1-prasannatsmkumar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/12/2017 07:30 AM, PrasannaKumar Muralidharan wrote:
> Add PMC flash memory description.
> 
> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> ---
> This patch is taken from OpenWRT [1]. This is compile tested only. As
> there is no signed off by or author info in the commit [1] I have kept
> only my signed off by line. If this is incorrect please advice what I
> should do.
> 
> 1. https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/adm5120/patches-3.18/102-jedec_pmc_39lvxxx_chips.patch;h=00148fa602b68c25ff8cd936924b77f6c99caa07;hb=c03d4317a6bc891cb4a5e89cbdd77f37c23aff86

I'm not a big fan of adding untested stuff into the kernel.

>  drivers/mtd/chips/jedec_probe.c | 52 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
> index 7c0b27d..d315491 100644
> --- a/drivers/mtd/chips/jedec_probe.c
> +++ b/drivers/mtd/chips/jedec_probe.c
> @@ -115,6 +115,10 @@
>  #define UPD29F064115	0x221C
>  
>  /* PMC */
> +#define PM39LV512	0x001B
> +#define PM39LV010	0x001C
> +#define PM39LV020	0x003D
> +#define PM39LV040	0x003E
>  #define PM49FL002	0x006D
>  #define PM49FL004	0x006E
>  #define PM49FL008	0x006A
> @@ -1261,6 +1265,54 @@ static const struct amd_flash_info jedec_table[] = {
>  		}
>  	}, {
>  		.mfr_id		= CFI_MFR_PMC,
> +		.dev_id		= PM39LV512,
> +		.name		= "PMC Pm39LV512",
> +		.devtypes	= CFI_DEVICETYPE_X8,
> +		.uaddr		= MTD_UADDR_0x0555_0x02AA,
> +		.dev_size	= SIZE_64KiB,
> +		.cmd_set	= P_ID_AMD_STD,
> +		.nr_regions	= 1,
> +		.regions	= {
> +			ERASEINFO(0x01000,16),
> +		}
> +	}, {
> +		.mfr_id		= CFI_MFR_PMC,
> +		.dev_id		= PM39LV010,
> +		.name		= "PMC Pm39LV010",
> +		.devtypes	= CFI_DEVICETYPE_X8,
> +		.uaddr		= MTD_UADDR_0x0555_0x02AA,
> +		.dev_size	= SIZE_128KiB,
> +		.cmd_set	= P_ID_AMD_STD,
> +		.nr_regions	= 1,
> +		.regions	= {
> +			ERASEINFO(0x01000,32),
> +		}
> +	}, {
> +		.mfr_id		= CFI_MFR_PMC,
> +		.dev_id		= PM39LV020,
> +		.name		= "PMC Pm39LV020",
> +		.devtypes	= CFI_DEVICETYPE_X8,
> +		.uaddr		= MTD_UADDR_0x0555_0x02AA,
> +		.dev_size	= SIZE_256KiB,
> +		.cmd_set	= P_ID_AMD_STD,
> +		.nr_regions	= 1,
> +		.regions	= {
> +			ERASEINFO(0x01000,64),
> +		}
> +	}, {
> +		.mfr_id		= CFI_MFR_PMC,
> +		.dev_id		= PM39LV040,
> +		.name		= "PMC Pm39LV040",
> +		.devtypes	= CFI_DEVICETYPE_X8,
> +		.uaddr		= MTD_UADDR_0x0555_0x02AA,
> +		.dev_size	= SIZE_512KiB,
> +		.cmd_set	= P_ID_AMD_STD,
> +		.nr_regions	= 1,
> +		.regions	= {
> +			ERASEINFO(0x01000,128),
> +		}
> +	}, {
> +		.mfr_id		= CFI_MFR_PMC,
>  		.dev_id		= PM49FL002,
>  		.name		= "PMC Pm49FL002",
>  		.devtypes	= CFI_DEVICETYPE_X8,
> 


-- 
Best regards,
Marek Vasut
