Subject: Re: [PATCH 1/2] mtd/chips: add SST39WF160x NOR-flashes
From: David Woodhouse <dwmw2@infradead.org>
To: Wolfram Sang <w.sang@pengutronix.de>
In-Reply-To: <1272334774-17019-1-git-send-email-w.sang@pengutronix.de>
References: <1272334774-17019-1-git-send-email-w.sang@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 14 May 2010 01:44:48 +0100
Message-ID: <1273797888.9999.591.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Guillaume LECERF <glecerf@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-04-27 at 04:19 +0200, Wolfram Sang wrote:
> Due to a broken CFI, they have to be added to jedec_probe.
> 
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Cc: David Woodhouse <David.Woodhouse@intel.com>
> ---
> 
> Sadly, those two cannot be detected using Guillaume's SST-patchset.

Why not? Guillaume has patches which add quirks for specific SST chips;
what is fundamentally different about these chips that means you can't
take the same approach?

>  drivers/mtd/chips/jedec_probe.c |   30 ++++++++++++++++++++++++++++++
>  1 files changed, 30 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
> index 8db1148..6850b23 100644
> --- a/drivers/mtd/chips/jedec_probe.c
> +++ b/drivers/mtd/chips/jedec_probe.c
> @@ -166,6 +166,8 @@
>  #define SST39LF160	0x2782
>  #define SST39VF1601	0x234b
>  #define SST39VF3201	0x235b
> +#define SST39WF1601	0x274b
> +#define SST39WF1602	0x274a
>  #define SST39LF512	0x00D4
>  #define SST39LF010	0x00D5
>  #define SST39LF020	0x00D6
> @@ -1529,6 +1531,34 @@ static const struct amd_flash_info jedec_table[] = {
>  			ERASEINFO(0x1000,256)
>  		}
>  	}, {
> +		/* CFI is broken: reports AMD_STD, but needs custom uaddr */
> +		.mfr_id		= MANUFACTURER_SST,
> +		.dev_id		= SST39WF1601,
> +		.name		= "SST 39WF1601",
> +		.devtypes	= CFI_DEVICETYPE_X16,
> +		.uaddr		= MTD_UADDR_0xAAAA_0x5555,
> +		.dev_size	= SIZE_2MiB,
> +		.cmd_set	= P_ID_AMD_STD,
> +		.nr_regions	= 2,
> +		.regions	= {
> +			ERASEINFO(0x1000,256),
> +			ERASEINFO(0x1000,256)
> +		}
> +	}, {
> +		/* CFI is broken: reports AMD_STD, but needs custom uaddr */
> +		.mfr_id		= MANUFACTURER_SST,
> +		.dev_id		= SST39WF1602,
> +		.name		= "SST 39WF1602",
> +		.devtypes	= CFI_DEVICETYPE_X16,
> +		.uaddr		= MTD_UADDR_0xAAAA_0x5555,
> +		.dev_size	= SIZE_2MiB,
> +		.cmd_set	= P_ID_AMD_STD,
> +		.nr_regions	= 2,
> +		.regions	= {
> +			ERASEINFO(0x1000,256),
> +			ERASEINFO(0x1000,256)
> +		}
> +	}, {
>  		.mfr_id		= MANUFACTURER_SST,     /* should be CFI */
>  		.dev_id		= SST39VF3201,
>  		.name		= "SST 39VF3201",


-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
