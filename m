Date: Tue, 30 Aug 2016 09:52:10 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: <rogercc.lin@mediatek.com>
Cc: <xiaolei.li@mediatek.com>, <steven.liu@mediatek.com>, <robh@kernel.org>,
 <computersforpeace@gmail.com>, <jorge.ramirez-ortiz@linaro.org>,
 <daniel.thompson@linaro.org>, <linux-mtd@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <dwmw2@infradead.org>,
 <blogic@openwrt.org>
Subject: Re: [PATCH v3 2/2] mtd: nand: fix chances to create incomplete ECC
 data when writing
Message-ID: <20160830095210.13fc2612@bbrezillon>
In-Reply-To: <1472526132-12049-3-git-send-email-rogercc.lin@mediatek.com>
References: <1472526132-12049-1-git-send-email-rogercc.lin@mediatek.com>
 <1472526132-12049-3-git-send-email-rogercc.lin@mediatek.com>
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

On Tue, 30 Aug 2016 11:02:12 +0800
<rogercc.lin@mediatek.com> wrote:

> From: RogerCC Lin <rogercc.lin@mediatek.com>
> 
> When mtk_nfc_do_write_page() comparing the sector number,because the
> sector number field is at the 12th-bit position of NFI_BYTELEN
> register,the masked register should be shifted 12 bits before being
> compared.The result of this bug may cause the second subpage has
> incomplete ECC parity bytes.
> 
> Signed-off-by: RogerCC Lin <rogercc.lin@mediatek.com>
> ---
>  drivers/mtd/nand/mtk_nand.c |    9 +++++----
>  1 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/mtk_nand.c b/drivers/mtd/nand/mtk_nand.c
> index ddaa2ac..260bd20 100644
> --- a/drivers/mtd/nand/mtk_nand.c
> +++ b/drivers/mtd/nand/mtk_nand.c
> @@ -93,6 +93,7 @@
>  #define		NFI_FSM_MASK		(0xf << 16)
>  #define NFI_ADDRCNTR		(0x70)
>  #define		CNTR_MASK		GENMASK(16, 12)
> +#define		ADDRCNTR_SEC_SHIFT	(12)

While you're at it, define

#define			ADDRCNTR_SEC(val)	\
			(((val) & CNTR_MASK) >> ADDRCNTR_SEC_SHIFT)

>  #define NFI_STRADDR		(0x80)
>  #define NFI_BYTELEN		(0x84)
>  #define NFI_CSEL		(0x90)
> @@ -699,8 +700,8 @@ static int mtk_nfc_do_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>  	}
>  
>  	ret = readl_poll_timeout_atomic(nfc->regs + NFI_ADDRCNTR, reg,
> -					(reg & CNTR_MASK) >= chip->ecc.steps,
> -					10, MTK_TIMEOUT);
> +		((reg & CNTR_MASK) >> ADDRCNTR_SEC_SHIFT) >= chip->ecc.steps,

and use it here
				ADDRCNTR_SEC(reg) >= chip->ecc.steps

> +		10, MTK_TIMEOUT);
>  	if (ret)
>  		dev_err(dev, "hwecc write timeout\n");
>  
> @@ -902,8 +903,8 @@ static int mtk_nfc_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
>  		dev_warn(nfc->dev, "read ahb/dma done timeout\n");
>  
>  	rc = readl_poll_timeout_atomic(nfc->regs + NFI_BYTELEN, reg,
> -				       (reg & CNTR_MASK) >= sectors, 10,
> -				       MTK_TIMEOUT);
> +		((reg & CNTR_MASK) >> ADDRCNTR_SEC_SHIFT) >= sectors,
> +		10, MTK_TIMEOUT);
>  	if (rc < 0) {
>  		dev_err(nfc->dev, "subpage done timeout\n");
>  		bitflips = -EIO;
