Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZToUw-0001Dh-3f
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2015 09:57:03 +0000
Date: Mon, 24 Aug 2015 11:56:30 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Maxime Ripard
 <maxime.ripard@free-electrons.com>, linux-sunxi@googlegroups.com
Subject: Re: [PATCH] nand: sunxi: fix write to USER_DATA reg
Message-ID: <20150824115630.53287671@bbrezillon>
In-Reply-To: <1438250466-18396-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1438250466-18396-1-git-send-email-boris.brezillon@free-electrons.com>
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

Hi Brian,

On Thu, 30 Jul 2015 12:01:06 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> The USER_DATA register cannot be accessed using byte accessors on A13
> SoCs, thus triggering a bug when using memcpy_toio on this register.
> Declare a temporary u32 variable to store the USER_DATA value and access
> the register with writel.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Could you consider taking this patch for 4.3 (if it's too late for
4.3-rc1, could you queue it for -rc2)?

BTW, I'd like to add

Cc: <stable@vger.kernel.org> # 3.19+

should I resend a new version or could you add it while you're applying
the patch on your branch?

Thanks,

Boris

> ---
>  drivers/mtd/nand/sunxi_nand.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
> index 6f93b29..5e374ab 100644
> --- a/drivers/mtd/nand/sunxi_nand.c
> +++ b/drivers/mtd/nand/sunxi_nand.c
> @@ -624,6 +624,8 @@ static int sunxi_nfc_hw_ecc_write_page(struct mtd_info *mtd,
>  	writel(tmp, nfc->regs + NFC_REG_ECC_CTL);
>  
>  	for (i = 0; i < ecc->steps; i++) {
> +		u32 user_data;
> +
>  		if (i)
>  			chip->cmdfunc(mtd, NAND_CMD_RNDIN, i * ecc->size, -1);
>  
> @@ -632,16 +634,16 @@ static int sunxi_nfc_hw_ecc_write_page(struct mtd_info *mtd,
>  		offset = layout->eccpos[i * ecc->bytes] - 4 + mtd->writesize;
>  
>  		/* Fill OOB data in */
> -		if (oob_required) {
> -			tmp = 0xffffffff;
> -			memcpy_toio(nfc->regs + NFC_REG_USER_DATA_BASE, &tmp,
> -				    4);
> +		if (!oob_required) {
> +			user_data = 0xffffffff;
>  		} else {
> -			memcpy_toio(nfc->regs + NFC_REG_USER_DATA_BASE,
> -				    chip->oob_poi + offset - mtd->writesize,
> -				    4);
> +			memcpy(&user_data,
> +			       chip->oob_poi + layout->oobfree[i].offset, 4);
> +			user_data = le32_to_cpu(user_data);
>  		}
>  
> +		writel(user_data, nfc->regs + NFC_REG_USER_DATA_BASE);
> +
>  		chip->cmdfunc(mtd, NAND_CMD_RNDIN, offset, -1);
>  
>  		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
> @@ -772,13 +774,13 @@ static int sunxi_nfc_hw_syndrome_ecc_write_page(struct mtd_info *mtd,
>  		/* Fill OOB data in */
>  		if (oob_required) {
>  			tmp = 0xffffffff;
> -			memcpy_toio(nfc->regs + NFC_REG_USER_DATA_BASE, &tmp,
> -				    4);
>  		} else {
> -			memcpy_toio(nfc->regs + NFC_REG_USER_DATA_BASE, oob,
> -				    4);
> +			memcpy(&tmp, oob, sizeof(tmp));
> +			tmp = le32_to_cpu(tmp);
>  		}
>  
> +		writel(tmp, nfc->regs + NFC_REG_USER_DATA_BASE);
> +
>  		tmp = NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ACCESS_DIR |
>  		      (1 << 30);
>  		writel(tmp, nfc->regs + NFC_REG_CMD);



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
