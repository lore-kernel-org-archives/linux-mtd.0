Date: Sun, 8 Aug 2010 09:19:50 +0300
From: Baruch Siach <baruch@tkos.co.il>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 6/8] mxc_nand: fix correct_data function
Message-ID: <20100808061950.GB21128@jasper.tkos.co.il>
References: <1281102791-8089-1-git-send-email-s.hauer@pengutronix.de>
	<1281102791-8089-7-git-send-email-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1281102791-8089-7-git-send-email-s.hauer@pengutronix.de>
Cc: John Ogness <john.ogness@linutronix.de>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sascha,

On Fri, Aug 06, 2010 at 03:53:09PM +0200, Sascha Hauer wrote:
> The v2 controller has a totally different mechanism to check
> whether the data we read had ecc errors or not. Implement this.
> The mechanism in the v2 controller happens to be identical to
> the v3 controller.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/mtd/nand/mxc_nand.c |   42 ++++++++++++++++++++++++++++++++++++++++--
>  1 files changed, 40 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index 48b6dca..a6dc5a5 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -94,6 +94,7 @@ struct mxc_nand_host {
>  	struct clk		*clk;
>  	int			clk_act;
>  	int			irq;
> +	int			eccsize;

This new mxc_nand_host field doesn't get initialized in this patch, although 
it is used in the .correct implementation. The next patch in this series 
includes the eccsize initialization code. This might break bisect. Won't it be 
safer to switch the order of these patches?

baruch

>  	wait_queue_head_t	irq_waitq;
>  
> @@ -342,7 +343,7 @@ static void mxc_nand_enable_hwecc(struct mtd_info *mtd, int mode)
>  	 */
>  }
>  
> -static int mxc_nand_correct_data(struct mtd_info *mtd, u_char *dat,
> +static int mxc_nand_correct_data_v1(struct mtd_info *mtd, u_char *dat,
>  				 u_char *read_ecc, u_char *calc_ecc)
>  {
>  	struct nand_chip *nand_chip = mtd->priv;
> @@ -364,6 +365,40 @@ static int mxc_nand_correct_data(struct mtd_info *mtd, u_char *dat,
>  	return 0;
>  }
>  
> +static int mxc_nand_correct_data_v2_v3(struct mtd_info *mtd, u_char *dat,
> +				 u_char *read_ecc, u_char *calc_ecc)
> +{
> +	struct nand_chip *nand_chip = mtd->priv;
> +	struct mxc_nand_host *host = nand_chip->priv;
> +	u32 ecc_stat, err;
> +	int no_subpages = 1;
> +	int ret = 0;
> +	u8 ecc_bit_mask, err_limit;
> +
> +	ecc_bit_mask = (host->eccsize == 4) ? 0x7 : 0xf;
> +	err_limit = (host->eccsize == 4) ? 0x4 : 0x8;
> +
> +	no_subpages = mtd->writesize >> 9;
> +
> +	ecc_stat = readl(NFC_V1_V2_ECC_STATUS_RESULT);
> +
> +	do {
> +		err = ecc_stat & ecc_bit_mask;
> +		if (err > err_limit) {
> +			printk(KERN_WARNING "UnCorrectable RS-ECC Error\n");
> +			return -1;
> +		} else {
> +			ret += err;
> +		}
> +		ecc_stat >>= 4;
> +	} while (--no_subpages);
> +
> +	mtd->ecc_stats.corrected += ret;
> +	pr_debug("%d Symbol Correctable RS-ECC Error\n", ret);
> +
> +	return ret;
> +}
> +
>  static int mxc_nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat,
>  				  u_char *ecc_code)
>  {
> @@ -790,7 +825,10 @@ static int __init mxcnd_probe(struct platform_device *pdev)
>  	if (pdata->hw_ecc) {
>  		this->ecc.calculate = mxc_nand_calculate_ecc;
>  		this->ecc.hwctl = mxc_nand_enable_hwecc;
> -		this->ecc.correct = mxc_nand_correct_data;
> +		if (nfc_is_v1())
> +			this->ecc.correct = mxc_nand_correct_data_v1;
> +		else
> +			this->ecc.correct = mxc_nand_correct_data_v2_v3;
>  		this->ecc.mode = NAND_ECC_HW;
>  	} else {
>  		this->ecc.mode = NAND_ECC_SOFT;

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
