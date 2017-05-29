Date: Mon, 29 May 2017 18:48:42 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Xiaolei Li <xiaolei.li@mediatek.com>
Cc: <computersforpeace@gmail.com>, <matthias.bgg@gmail.com>,
 <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <robh+dt@kernel.org>,
 <rogercc.lin@mediatek.com>, <yt.shen@mediatek.com>,
 <srv_heupstream@mediatek.com>
Subject: Re: [PATCH v3 3/4] mtd: nand: mediatek: add support for different
 MTK NAND FLASH Controller IP
Message-ID: <20170529184842.06ec8275@bbrezillon>
In-Reply-To: <1494851979-14416-4-git-send-email-xiaolei.li@mediatek.com>
References: <1494851979-14416-1-git-send-email-xiaolei.li@mediatek.com>
 <1494851979-14416-4-git-send-email-xiaolei.li@mediatek.com>
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

Hi Xiaolei,

On Mon, 15 May 2017 20:39:38 +0800
Xiaolei Li <xiaolei.li@mediatek.com> wrote:

> ECC strength and spare size supported may be different among MTK NAND
> FLASH Controller IPs.
> 
> This patch contains changes as following:
> (1) add new struct mtk_nfc_caps to support different spare size.
> (2) add new struct mtk_ecc_caps to support different ecc strength.
> (3) remove ECC_CNFG_xBIT define, use a for loop to do ecc strength config.
> (4) remove PAGEFMT_SPARE_ define, use a for loop to do spare format config.
> (5) malloc ecc->eccdata buffer according to max ecc strength of this IP.
> 
> Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
> ---
>  drivers/mtd/nand/mtk_ecc.c  | 181 ++++++++++++++++++--------------------------
>  drivers/mtd/nand/mtk_ecc.h  |   2 +-
>  drivers/mtd/nand/mtk_nand.c | 175 +++++++++++++++++++++---------------------
>  3 files changed, 166 insertions(+), 192 deletions(-)
> 
> diff --git a/drivers/mtd/nand/mtk_ecc.c b/drivers/mtd/nand/mtk_ecc.c
> index dbf2562..ae51303 100644
> --- a/drivers/mtd/nand/mtk_ecc.c
> +++ b/drivers/mtd/nand/mtk_ecc.c
> @@ -33,26 +33,6 @@

[...]

> -static void mtk_nfc_set_spare_per_sector(u32 *sps, struct mtd_info *mtd)
> +static int cmp_map(const void *m0, const void *m1)
> +{
> +	return *(u8 *)m0 > *(u8 *)m1 ? 1 : -1;
> +}
> +
> +static int mtk_nfc_set_spare_per_sector(u32 *sps, struct mtd_info *mtd)
>  {
>  	struct nand_chip *nand = mtd_to_nand(mtd);
> -	u32 spare[] = {16, 26, 27, 28, 32, 36, 40, 44,
> -			48, 49, 50, 51, 52, 62, 63, 64};
> +	struct mtk_nfc *nfc = nand_get_controller_data(nand);
> +	u8 *spare;
>  	u32 eccsteps, i;
>  
> +	spare = vmalloc(nfc->caps->num_spare_size);
> +	if (!spare)
> +		return -ENOMEM;
> +
> +	memcpy(spare, nfc->caps->spare_size, nfc->caps->num_spare_size);
> +
> +	/*
> +	 * Spare size array of some IP may be not sorted, because the spare
> +	 * size does not always increase as the spare size bitfiled value of
> +	 * register NFI_PAGEFMT. So, sort it here.
> +	 */
> +	sort(spare, nfc->caps->num_spare_size, sizeof(u8), cmp_map, NULL);
> +

Let's avoid this dup+sort dance. If it's not sorted, we'd better
iterate over all entries of the table and pick the best one (the array
is rather small, so it shouldn't be a problem).

>  	eccsteps = mtd->writesize / nand->ecc.size;
>  	*sps = mtd->oobsize / eccsteps;
>  
>  	if (nand->ecc.size == 1024)
>  		*sps >>= 1;
>  
> -	for (i = 0; i < ARRAY_SIZE(spare); i++) {
> +	for (i = 0; i < nfc->caps->num_spare_size; i++) {
>  		if (*sps <= spare[i]) {
>  			if (!i)
>  				*sps = spare[i];
