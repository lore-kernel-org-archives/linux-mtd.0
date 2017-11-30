Date: Thu, 30 Nov 2017 22:16:02 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: <xiaolei.li@mediatek.com>
Cc: <computersforpeace@gmail.com>, <dwmw2@infradead.org>,
 <linux-mtd@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <rogercc.lin@mediatek.com>, <srv_heupstream@mediatek.com>,
 <bayi.cheng@mediatek.com>
Subject: Re: [PATCH v2] mtd: nand: mtk: use nand_reset() to reset NAND
 devices in resume function
Message-ID: <20171130221602.25497316@bbrezillon>
In-Reply-To: <1509588307-38511-1-git-send-email-xiaolei.li@mediatek.com>
References: <1509588307-38511-1-git-send-email-xiaolei.li@mediatek.com>
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

On Thu, 2 Nov 2017 10:05:07 +0800
<xiaolei.li@mediatek.com> wrote:

> From: Xiaolei Li <xiaolei.li@mediatek.com>
> 
> Previously, we only select chips and then send reset command to a NAND
> device during resuming nand driver. There is a lack of deselecting chips.
> It is advised to reset and initialize a NAND device using nand_reset().
> 

Applied.

Thanks,

Boris

> Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
> ---
>  drivers/mtd/nand/mtk_nand.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/mtk_nand.c b/drivers/mtd/nand/mtk_nand.c
> index d86a7d1..6d0101e 100644
> --- a/drivers/mtd/nand/mtk_nand.c
> +++ b/drivers/mtd/nand/mtk_nand.c
> @@ -1540,7 +1540,6 @@ static int mtk_nfc_resume(struct device *dev)
>  	struct mtk_nfc *nfc = dev_get_drvdata(dev);
>  	struct mtk_nfc_nand_chip *chip;
>  	struct nand_chip *nand;
> -	struct mtd_info *mtd;
>  	int ret;
>  	u32 i;
>  
> @@ -1553,11 +1552,8 @@ static int mtk_nfc_resume(struct device *dev)
>  	/* reset NAND chip if VCC was powered off */
>  	list_for_each_entry(chip, &nfc->chips, node) {
>  		nand = &chip->nand;
> -		mtd = nand_to_mtd(nand);
> -		for (i = 0; i < chip->nsels; i++) {
> -			nand->select_chip(mtd, i);
> -			nand->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
> -		}
> +		for (i = 0; i < chip->nsels; i++)
> +			nand_reset(nand, i);
>  	}
>  
>  	return 0;
