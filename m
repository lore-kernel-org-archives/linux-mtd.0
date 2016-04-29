Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aw42v-0001mh-8U
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2016 08:45:10 +0000
Date: Fri, 29 Apr 2016 10:44:46 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Han Xu <han.xu@nxp.com>
Cc: <shijie.huang@arm.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <standby24x7@gmail.com>, <jkosina@suse.cz>,
 <fabio.estevam@freescale.com>, <fransklaver@gmail.com>, <hofrat@osadl.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] mtd: nand: gpmi: correct bitflip for erased NAND page
Message-ID: <20160429104446.269492fa@bbrezillon>
In-Reply-To: <1456268693-8630-4-git-send-email-han.xu@nxp.com>
References: <1456268693-8630-1-git-send-email-han.xu@nxp.com>
 <1456268693-8630-4-git-send-email-han.xu@nxp.com>
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

Hi Han,

On Tue, 23 Feb 2016 17:04:51 -0600
Han Xu <han.xu@nxp.com> wrote:

> i.MX6QP and i.MX7D BCH module integrated a new feature to detect the
> bitflip number for erased NAND page. So for these two platform, set the
> erase threshold to ecc_strength and if bitflip detected, GPMI driver will
> correct the data to all 0xFF.

You're 2 different things in this patch:
1/ adding support for mx6qp
2/ handling bitflips in erased pages with the bitflip count feature

This should be split in 2 different patches.

> 
> Signed-off-by: Han Xu <han.xu@nxp.com>
> ---
>  drivers/mtd/nand/gpmi-nand/bch-regs.h  | 10 ++++++++++
>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |  5 +++++
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 24 +++++++++++++++++++++++-
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.h |  5 ++++-
>  4 files changed, 42 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/bch-regs.h b/drivers/mtd/nand/gpmi-nand/bch-regs.h
> index 53e58bc..a84d72b 100644
> --- a/drivers/mtd/nand/gpmi-nand/bch-regs.h
> +++ b/drivers/mtd/nand/gpmi-nand/bch-regs.h
> @@ -30,7 +30,13 @@
>  #define BM_BCH_CTRL_COMPLETE_IRQ		(1 << 0)
>  
>  #define HW_BCH_STATUS0				0x00000010
> +
>  #define HW_BCH_MODE				0x00000020
> +#define BP_BCH_MODE_ERASE_THRESHOLD		0
> +#define BM_BCH_MODE_ERASE_THRESHOLD	(0xff << BP_BCH_MODE_ERASE_THRESHOLD)
> +#define BF_BCH_MODE_ERASE_THRESHOLD(v)		\
> +	(((v) << BP_BCH_MODE_ERASE_THRESHOLD) & BM_BCH_MODE_ERASE_THRESHOLD)
> +
>  #define HW_BCH_ENCODEPTR			0x00000030
>  #define HW_BCH_DATAPTR				0x00000040
>  #define HW_BCH_METAPTR				0x00000050
> @@ -125,4 +131,8 @@
>  	)
>  
>  #define HW_BCH_VERSION				0x00000160
> +#define HW_BCH_DEBUG1				0x00000170
> +#define BP_BCH_DEBUG1_ERASED_ZERO_COUNT	0
> +#define BM_BCH_DEBUG1_ERASED_ZERO_COUNT		\
> +		(0x1ff << BP_BCH_DEBUG1_ERASED_ZERO_COUNT)
>  #endif
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> index 8acbe04..2c43213 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> @@ -298,6 +298,11 @@ int bch_set_geometry(struct gpmi_nand_data *this)
>  			| BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(block_size, this),
>  			r->bch_regs + HW_BCH_FLASH0LAYOUT1);
>  
> +	/* Set erase threshold to ecc_strength for mx6qp and mx7 */
> +	if (GPMI_IS_MX6QP(this) || GPMI_IS_MX7(this))
> +		writel(BF_BCH_MODE_ERASE_THRESHOLD(ecc_strength),
> +			r->bch_regs + HW_BCH_MODE);
> +
>  	/* Set *all* chip selects to use layout 0. */
>  	writel(0, r->bch_regs + HW_BCH_LAYOUTSELECT);
>  
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index 1aba6e6..6b3ca3b 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -71,6 +71,12 @@ static const struct gpmi_devdata gpmi_devdata_imx6q = {
>  	.max_chain_delay = 12,
>  };
>  
> +static const struct gpmi_devdata gpmi_devdata_imx6qp = {
> +	.type = IS_MX6QP,
> +	.bch_max_ecc_strength = 40,
> +	.max_chain_delay = 12,
> +};
> +
>  static const struct gpmi_devdata gpmi_devdata_imx6sx = {
>  	.type = IS_MX6SX,
>  	.bch_max_ecc_strength = 62,
> @@ -1010,6 +1016,7 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  {
>  	struct gpmi_nand_data *this = nand_get_controller_data(chip);
>  	struct bch_geometry *nfc_geo = &this->bch_geometry;
> +	void __iomem *bch_regs = this->resources.bch_regs;
>  	void          *payload_virt;
>  	dma_addr_t    payload_phys;
>  	void          *auxiliary_virt;
> @@ -1018,6 +1025,7 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  	unsigned char *status;
>  	unsigned int  max_bitflips = 0;
>  	int           ret;
> +	int flag = 0;
>  
>  	dev_dbg(this->dev, "page number is : %d\n", page);
>  	ret = read_page_prepare(this, buf, nfc_geo->payload_size,
> @@ -1050,9 +1058,16 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  	status = auxiliary_virt + nfc_geo->auxiliary_status_offset;
>  
>  	for (i = 0; i < nfc_geo->ecc_chunk_count; i++, status++) {
> -		if ((*status == STATUS_GOOD) || (*status == STATUS_ERASED))
> +		if (*status == STATUS_GOOD)
>  			continue;
>  
> +		if (*status == STATUS_ERASED) {
> +			if (GPMI_IS_MX6QP(this) || GPMI_IS_MX7(this))
> +				if (readl(bch_regs + HW_BCH_DEBUG1))
> +					flag = 1;

You should update max_bitflips here.

> +			continue;
> +		}
> +
>  		if (*status == STATUS_UNCORRECTABLE) {
>  			mtd->ecc_stats.failed++;
>  			continue;
> @@ -1081,6 +1096,10 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  			nfc_geo->payload_size,
>  			payload_virt, payload_phys);
>  
> +	/* if bitflip occurred in erased page, change data to all 0xff */
> +	if (flag)
> +		memset(buf, 0xff, nfc_geo->payload_size);

I guess your controller does not support subpage writes, but it would
be safer to set the ECC chunk buf to 0xff in the
if (*status == STATUS_ERASED) condition. And you should also set the
->oob_poi buffer to 0xff.

> +
>  	return max_bitflips;
>  }
>  
> @@ -1988,6 +2007,9 @@ static const struct of_device_id gpmi_nand_id_table[] = {
>  		.compatible = "fsl,imx6q-gpmi-nand",
>  		.data = &gpmi_devdata_imx6q,
>  	}, {
> +		.compatible = "fsl,imx6qp-gpmi-nand",
> +		.data = (void *)&gpmi_devdata_imx6qp,

You don't need this (void *) cast.

> +	}, {
>  		.compatible = "fsl,imx6sx-gpmi-nand",
>  		.data = &gpmi_devdata_imx6sx,
>  	}, {
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> index a82555f..605d96e 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> @@ -123,6 +123,7 @@ enum gpmi_type {
>  	IS_MX23,
>  	IS_MX28,
>  	IS_MX6Q,
> +	IS_MX6QP,
>  	IS_MX6SX,
>  	IS_MX7D,
>  };
> @@ -305,9 +306,11 @@ void gpmi_copy_bits(u8 *dst, size_t dst_bit_off,
>  #define GPMI_IS_MX23(x)		((x)->devdata->type == IS_MX23)
>  #define GPMI_IS_MX28(x)		((x)->devdata->type == IS_MX28)
>  #define GPMI_IS_MX6Q(x)		((x)->devdata->type == IS_MX6Q)
> +#define GPMI_IS_MX6QP(x)	((x)->devdata->type == IS_MX6QP)
>  #define GPMI_IS_MX6SX(x)	((x)->devdata->type == IS_MX6SX)
>  #define GPMI_IS_MX7D(x)		((x)->devdata->type == IS_MX7D)
>  
> -#define GPMI_IS_MX6(x)		(GPMI_IS_MX6Q(x) || GPMI_IS_MX6SX(x))
> +#define GPMI_IS_MX6(x)		(GPMI_IS_MX6Q(x) || GPMI_IS_MX6QP(x)\

Missing space at the end of the line => "GPMI_IS_MX6QP(x) \"

> +	   || GPMI_IS_MX6SX(x))

And can you align this on the opening parenthesis?

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
