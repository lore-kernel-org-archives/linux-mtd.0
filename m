Message-ID: <503C9E7A.7060401@gmail.com>
Date: Tue, 28 Aug 2012 12:33:30 +0200
From: =?UTF-8?B?R2HDq3RhbiBDYXJsaWVy?= <gcembed@gmail.com>
MIME-Version: 1.0
To: =?UTF-8?B?R2HDq3RhbiBDYXJsaWVy?= <gcembed@gmail.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 1/1] mxc_nand : allow swapping the Bad block Indicator
 for NFC v1.
References: <1345811288.2848.308.camel@sauron.fi.intel.com>
 <1345825064-9147-1-git-send-email-gcembed@gmail.com>
In-Reply-To: <1345825064-9147-1-git-send-email-gcembed@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Russell King <linux@arm.linux.org.uk>, J.Lambrecht@TELEVIC.com,
 David Woodhouse <dwmw2@infradead.org>, Sascha Hauer <kernel@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
Any comments for this patch ?
Regards,
Gaëtan Carlier.

On 08/24/2012 06:17 PM, Gaëtan Carlier wrote:
> Swap the BI-byte on position 0x7D0 with a data byte at 0x835.  To fix a bug
> in Freescale imx NFC v1 SoC's for 2K page NAND flashes: imx27 and imx31.
> Warning: The same solution needs to be applied to the boot loader and the
> flash programmer.
>
> This is a modified version of patch sent by Jürgen Lambrecht :
> [PATCH] Add 'config IMX_NFC_V1_BISWAP' to swap the Bad block Indicator,
> and use for imx27pdk nand support.
>
>   v3: - use accessor function for I/O memory accesses as suggested by Artem
>         Bityutskiy
>       - rename function name as suggested by Artem Bityutskiy
>
>   v2: - Use a flag in a mxc_nand_platform structure instead of adding option
>         in Kconfig
>
>   v1: - Original patch "Add 'config IMX_NFC_V1_BISWAP'" by Jürgen Lambrecht
>
> Signed-off-by: Gaëtan Carlier <gcembed@gmail.com>
> ---
>   arch/arm/plat-mxc/include/mach/mxc_nand.h |    2 ++
>   drivers/mtd/nand/mxc_nand.c               |   26 ++++++++++++++++++++++++++
>   2 files changed, 28 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/plat-mxc/include/mach/mxc_nand.h b/arch/arm/plat-mxc/include/mach/mxc_nand.h
> index 6bb96ef..7c04437 100644
> --- a/arch/arm/plat-mxc/include/mach/mxc_nand.h
> +++ b/arch/arm/plat-mxc/include/mach/mxc_nand.h
> @@ -26,6 +26,8 @@ struct mxc_nand_platform_data {
>   	unsigned int width;	/* data bus width in bytes */
>   	unsigned int hw_ecc:1;	/* 0 if suppress hardware ECC */
>   	unsigned int flash_bbt:1; /* set to 1 to use a flash based bbt */
> +	unsigned int biswap:1;	/* set to 1 to swap the Bad Block Indicator
> +				   NFC v1 workaround */
>   	struct mtd_partition *parts;	/* partition table */
>   	int nr_parts;			/* size of parts */
>   };
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index 3f94e1f..24fc9e1 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -682,6 +682,26 @@ static int mxc_nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat,
>   	return 0;
>   }
>
> +/*
> + * Swap the BI-byte on position 0x7D0 with a data byte at 0x835.
> + * To fix a bug in NFC v1 SoC's for 2K page NAND flashes: imx27 and imx31.
> + * Warning: The same solution needs to be applied to the boot loader and the
> + * flash programmer.
> + */
> +static void nfcv1_bi_swap_quirk(struct mtd_info *mtd)
> +{
> +	struct nand_chip *nand_chip = mtd->priv;
> +	struct mxc_nand_host *host = nand_chip->priv;
> +	unsigned short temp1, temp2, new_temp1;
> +
> +	temp1 = ioread16(host->main_area0 + 0x7D0);
> +	temp2 = ioread16(host->main_area0 + 0x834);
> +	new_temp1 = (temp1 & 0xFF00) | (temp2 >> 8);
> +	temp2 = (temp2 & 0x00FF) | (temp1 << 8);
> +	iowrite16(new_temp1, host->main_area0 + 0x7D0);
> +	iowrite16(temp2, host->main_area0 + 0x834);
> +}
> +
>   static u_char mxc_nand_read_byte(struct mtd_info *mtd)
>   {
>   	struct nand_chip *nand_chip = mtd->priv;
> @@ -1093,6 +1113,9 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
>
>   		host->devtype_data->send_page(mtd, NFC_OUTPUT);
>
> +		if ((mtd->writesize > 512) && nfc_is_v1() && host->pdata.biswap)
> +			nfcv1_bi_swap_quirk(mtd);
> +
>   		memcpy32_fromio(host->data_buf, host->main_area0,
>   				mtd->writesize);
>   		copy_spare(mtd, true);
> @@ -1112,6 +1135,9 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
>   	case NAND_CMD_PAGEPROG:
>   		memcpy32_toio(host->main_area0, host->data_buf, mtd->writesize);
>   		copy_spare(mtd, false);
> +		if ((mtd->writesize > 512) && nfc_is_v1() && host->pdata.biswap)
> +			nfcv1_bi_swap_quirk(mtd);
> +
>   		host->devtype_data->send_page(mtd, NFC_INPUT);
>   		host->devtype_data->send_cmd(host, command, true);
>   		mxc_do_addr_cycle(mtd, column, page_addr);
>
