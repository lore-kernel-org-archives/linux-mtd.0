Date: Fri, 20 Apr 2018 22:18:43 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Xiaolei Li <xiaolei.li@mediatek.com>
Cc: <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: Re: [PATCH v2 3/4] mtd: rawnand: mtk: Replace max_sector_size with
 sector size array
Message-ID: <20180420221843.45f9d006@bbrezillon>
In-Reply-To: <1523864464-41059-4-git-send-email-xiaolei.li@mediatek.com>
References: <1523864464-41059-1-git-send-email-xiaolei.li@mediatek.com>
 <1523864464-41059-4-git-send-email-xiaolei.li@mediatek.com>
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

On Mon, 16 Apr 2018 15:41:03 +0800
Xiaolei Li <xiaolei.li@mediatek.com> wrote:

> Remove max_sector_size from struct mtk_nfc_caps, and use sector size
> array and number of sector size to show sector sizes that controller
> supports.
> 
> Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>

I don't see the point of this patch. I was seeing a clear benefit when
you were moving to the generic ECC selection code, but since you've
dropped this part from the patch series, this patch becomes useless.

Am I missing something?

> ---
>  drivers/mtd/nand/raw/mtk_nand.c | 32 +++++++++++++++++++++++++++-----
>  1 file changed, 27 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
> index 6977da3..03a4df2 100644
> --- a/drivers/mtd/nand/raw/mtk_nand.c
> +++ b/drivers/mtd/nand/raw/mtk_nand.c
> @@ -106,10 +106,11 @@
>  struct mtk_nfc_caps {
>  	const u8 *spare_size;
>  	u8 num_spare_size;
> +	const int *sector_size;
> +	int num_sector_size;
>  	u8 pageformat_spare_shift;
>  	u8 nfi_clk_div;
>  	u8 max_sector;
> -	u32 max_sector_size;
>  };
>  
>  struct mtk_nfc_bad_mark_ctl {
> @@ -178,6 +179,14 @@ struct mtk_nfc {
>  	16, 26, 27, 28
>  };
>  
> +static const int sector_size_max_1k[] = {
> +	1024, 512
> +};
> +
> +static const int sector_size_max_512[] = {
> +	512
> +};
> +
>  static inline struct mtk_nfc_nand_chip *to_mtk_nand(struct nand_chip *nand)
>  {
>  	return container_of(nand, struct mtk_nfc_nand_chip, nand);
> @@ -258,6 +267,16 @@ static inline u8 nfi_readb(struct mtk_nfc *nfc, u32 reg)
>  	return readb_relaxed(nfc->regs + reg);
>  }
>  
> +static int mtk_nfc_max_sector_size(struct mtk_nfc *nfc)
> +{
> +	int i, sector_size = 0;
> +
> +	for (i = 0; i < nfc->caps->num_sector_size; i++)
> +		sector_size = max(sector_size, nfc->caps->sector_size[i]);
> +
> +	return sector_size;
> +}
> +
>  static void mtk_nfc_hw_reset(struct mtk_nfc *nfc)
>  {
>  	struct device *dev = nfc->dev;
> @@ -1207,7 +1226,7 @@ static int mtk_nfc_ecc_init(struct device *dev, struct mtd_info *mtd)
>  		 */
>  		if (nand->ecc.size < 1024) {
>  			if (mtd->writesize > 512 &&
> -			    nfc->caps->max_sector_size > 512) {
> +			    mtk_nfc_max_sector_size(nfc) > 512) {
>  				nand->ecc.size = 1024;
>  				nand->ecc.strength <<= 1;
>  			} else {
> @@ -1389,28 +1408,31 @@ static int mtk_nfc_nand_chips_init(struct device *dev, struct mtk_nfc *nfc)
>  static const struct mtk_nfc_caps mtk_nfc_caps_mt2701 = {
>  	.spare_size = spare_size_mt2701,
>  	.num_spare_size = 16,
> +	.sector_size = sector_size_max_1k,
> +	.num_sector_size = 2,
>  	.pageformat_spare_shift = 4,
>  	.nfi_clk_div = 1,
>  	.max_sector = 16,
> -	.max_sector_size = 1024,
>  };
>  
>  static const struct mtk_nfc_caps mtk_nfc_caps_mt2712 = {
>  	.spare_size = spare_size_mt2712,
>  	.num_spare_size = 19,
> +	.sector_size = sector_size_max_1k,
> +	.num_sector_size = 2,
>  	.pageformat_spare_shift = 16,
>  	.nfi_clk_div = 2,
>  	.max_sector = 16,
> -	.max_sector_size = 1024,
>  };
>  
>  static const struct mtk_nfc_caps mtk_nfc_caps_mt7622 = {
>  	.spare_size = spare_size_mt7622,
>  	.num_spare_size = 4,
> +	.sector_size = sector_size_max_512,
> +	.num_sector_size = 1,
>  	.pageformat_spare_shift = 4,
>  	.nfi_clk_div = 1,
>  	.max_sector = 8,
> -	.max_sector_size = 512,
>  };
>  
>  static const struct of_device_id mtk_nfc_id_table[] = {
