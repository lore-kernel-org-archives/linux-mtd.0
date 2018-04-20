Date: Fri, 20 Apr 2018 22:23:50 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Xiaolei Li <xiaolei.li@mediatek.com>
Cc: <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: Re: [PATCH v2 4/4] mtd: rawnand: mtk: Add new nfc capability
 maximize_fdm_ecc
Message-ID: <20180420222350.620e4db7@bbrezillon>
In-Reply-To: <1523864464-41059-5-git-send-email-xiaolei.li@mediatek.com>
References: <1523864464-41059-1-git-send-email-xiaolei.li@mediatek.com>
 <1523864464-41059-5-git-send-email-xiaolei.li@mediatek.com>
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

On Mon, 16 Apr 2018 15:41:04 +0800
Xiaolei Li <xiaolei.li@mediatek.com> wrote:

> For some MTK NAND chips, BootROM will access more than one byte
> ECC protected FDM data, but now we fix ECC protected FDM byte as 1.
> This will make some chips be failed to boot up.
> 
> This patch adds one new nfc capability maximize_fdm_ecc to maximize ECC
> protected FDM bytes if it is true.
> 
> Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
> ---
>  drivers/mtd/nand/raw/mtk_nand.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>  mode change 100644 => 100755 drivers/mtd/nand/raw/mtk_nand.c
> 
> diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
> old mode 100644
> new mode 100755
> index 03a4df2..7025132
> --- a/drivers/mtd/nand/raw/mtk_nand.c
> +++ b/drivers/mtd/nand/raw/mtk_nand.c
> @@ -111,6 +111,7 @@ struct mtk_nfc_caps {
>  	u8 pageformat_spare_shift;
>  	u8 nfi_clk_div;
>  	u8 max_sector;
> +	bool maximize_fdm_ecc;
>  };
>  
>  struct mtk_nfc_bad_mark_ctl {
> @@ -1151,8 +1152,8 @@ static void mtk_nfc_set_fdm(struct mtk_nfc_fdm *fdm, struct mtd_info *mtd)
>  	if (fdm->reg_size > NFI_FDM_MAX_SIZE)
>  		fdm->reg_size = NFI_FDM_MAX_SIZE;
>  
> -	/* bad block mark storage */
> -	fdm->ecc_size = 1;
> +	/* Reserve at least one byte for bad mark */
> +	fdm->ecc_size = nfc->caps->maximize_fdm_ecc ? fdm->reg_size : 1;
>  }
>  
>  static void mtk_nfc_set_bad_mark_ctl(struct mtk_nfc_bad_mark_ctl *bm_ctl,
> @@ -1413,6 +1414,7 @@ static int mtk_nfc_nand_chips_init(struct device *dev, struct mtk_nfc *nfc)
>  	.pageformat_spare_shift = 4,
>  	.nfi_clk_div = 1,
>  	.max_sector = 16,
> +	.maximize_fdm_ecc = false,
>  };
>  
>  static const struct mtk_nfc_caps mtk_nfc_caps_mt2712 = {
> @@ -1423,6 +1425,7 @@ static int mtk_nfc_nand_chips_init(struct device *dev, struct mtk_nfc *nfc)
>  	.pageformat_spare_shift = 16,
>  	.nfi_clk_div = 2,
>  	.max_sector = 16,
> +	.maximize_fdm_ecc = false,
>  };
>  
>  static const struct mtk_nfc_caps mtk_nfc_caps_mt7622 = {
> @@ -1433,6 +1436,7 @@ static int mtk_nfc_nand_chips_init(struct device *dev, struct mtk_nfc *nfc)
>  	.pageformat_spare_shift = 4,
>  	.nfi_clk_div = 1,
>  	.max_sector = 8,
> +	.maximize_fdm_ecc = false,
>  };

So, you introduce a new flag, but all existing SoCs are setting it to
false. Can you please send a patch series containing all the
modifications, or at least point to a branch containing all the changes
you intend to push so that we know why the changes are required?
Your first version of this patchset was better in this regard.

>  
>  static const struct of_device_id mtk_nfc_id_table[] = {
