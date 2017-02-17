Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ceqJv-00034o-Un
 for linux-mtd@lists.infradead.org; Fri, 17 Feb 2017 21:44:07 +0000
Received: by mail-wm0-x243.google.com with SMTP id r18so4643110wmd.3
 for <linux-mtd@lists.infradead.org>; Fri, 17 Feb 2017 13:43:43 -0800 (PST)
Subject: Re: [PATCH V2, 2/2] mtd: nand: brcmnand: Check flash #WP pin status
 before nand erase/program
To: Kamal Dasu <kdasu.kdev@gmail.com>, linux-mtd@lists.infradead.org
References: <1487270812-6882-1-git-send-email-kdasu.kdev@gmail.com>
 <1487270812-6882-2-git-send-email-kdasu.kdev@gmail.com>
Cc: f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at, cyrille.pitchen@atmel.com
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <1c718482-719a-190b-8e86-ca21f6bf330f@gmail.com>
Date: Fri, 17 Feb 2017 22:38:04 +0100
MIME-Version: 1.0
In-Reply-To: <1487270812-6882-2-git-send-email-kdasu.kdev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/16/2017 07:46 PM, Kamal Dasu wrote:
> brcmnand controller v6.x and v7.x lets driver to enable disable #WP pin
> via NAND_WP bit in CS_SELECT register. Driver implementation assumes that
> setting/resetting the bit would assert/de-assert  #WP pin instantaneously
> from the flash part's perspective, and was proceeding to erase/program
> without verifying flash status byte for protection bit. In rigorous
> testing this was causing rare data corruptions with erase and/or
> subsequent programming. To fix this added verification logic to
> brcmandn_wp_set() by reading  flash status and verifying protection bit
> indicating #WP pin status.  The new logic makes sure controller as well
> as the flash is ready to accept commands.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 53 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index c7c4efe..2f082a3 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -101,6 +101,9 @@ struct brcm_nand_dma_desc {
>  #define BRCMNAND_MIN_BLOCKSIZE	(8 * 1024)
>  #define BRCMNAND_MIN_DEVSIZE	(4ULL * 1024 * 1024)
>  
> +#define FLASH_RDY	(NAND_STATUS_READY)

Drop extra parenthesis

> +#define NAND_CTRL_RDY	(INTFC_CTLR_READY | INTFC_FLASH_READY)
> +
>  /* Controller feature flags */
>  enum {
>  	BRCMNAND_HAS_1K_SECTORS			= BIT(0),
> @@ -765,12 +768,57 @@ enum {
>  	CS_SELECT_AUTO_DEVICE_ID_CFG		= BIT(30),
>  };
>  
> -static int brcmnand_set_wp(struct brcmnand_host *host, int en)
> +static void bcmnand_ctrl_busy_poll(struct brcmnand_controller *ctrl, u32 mask)
> +{
> +	unsigned long timeout = jiffies + msecs_to_jiffies(200);
> +
> +	while ((brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS) & mask) !=
> +		mask) {

Ewww, make this into something like ...

while (true) { / for (;;) {
 reg = read.....
 if ((reg & mask) == mask)
   ...
 if (time ....)
   dev_warn...
 cpu_relax();
}

But then again, there's the readx_poll_timeout() , which seems like
exactly the thing you implemented here .

> +		if (time_after(jiffies, timeout)) {
> +			dev_warn(ctrl->dev, "timeout on ctrl_ready\n");
> +			break;
> +		}
> +		cpu_relax();
> +	}
> +}
> +
> +static inline void brcmnand_set_wp_reg(struct brcmnand_controller *ctrl, int en)
>  {
> -	struct brcmnand_controller *ctrl = host->ctrl;
>  	u32 val = en ? CS_SELECT_NAND_WP : 0;
>  
>  	brcmnand_rmw_reg(ctrl, BRCMNAND_CS_SELECT, CS_SELECT_NAND_WP, 0, val);
> +}
> +
> +static int brcmnand_set_wp(struct brcmnand_host *host, int en)
> +{
> +	struct brcmnand_controller *ctrl = host->ctrl;
> +	struct mtd_info *mtd = nand_to_mtd(&host->chip);
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	u32 sts_reg;
> +	bool is_wp;
> +
> +	/*
> +	 * make sure ctrl/flash ready before and after
> +	 * changing state of WP PIN
> +	 */
> +	bcmnand_ctrl_busy_poll(ctrl, NAND_CTRL_RDY | FLASH_RDY);
> +	brcmnand_set_wp_reg(ctrl, en);
> +	chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
> +	bcmnand_ctrl_busy_poll(ctrl, NAND_CTRL_RDY | FLASH_RDY);
> +	sts_reg = brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS);
> +	/* NAND_STATUS_WP 0x80 = not protected, 0x00 = protected */
> +	is_wp = (sts_reg & NAND_STATUS_WP) ? false : true;

I dont think you need the ternary op here.

> +	if (is_wp != en) {
> +		u32 nand_wp = brcmnand_read_reg(ctrl, BRCMNAND_CS_SELECT);
> +
> +		nand_wp &= CS_SELECT_NAND_WP;
> +		dev_err_ratelimited(&host->pdev->dev,
> +				    "#WP %s sts:0x%x expected %s NAND_WP 0x%x\n",
> +				    is_wp ? "On" : "Off",  sts_reg & 0xff,
> +				    en ? "On" : "Off", nand_wp ? 1 : 0);
> +		return -EINVAL;
> +	}
>  
>  	return 0;
>  }
> @@ -1167,6 +1215,7 @@ static void brcmnand_send_cmd(struct brcmnand_host *host, int cmd)
>  	BUG_ON(ctrl->cmd_pending != 0);
>  	ctrl->cmd_pending = cmd;
>  
> +	bcmnand_ctrl_busy_poll(ctrl, NAND_CTRL_RDY);
>  	intfc = brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS);
>  	WARN_ON(!(intfc & INTFC_CTLR_READY));
>  
> 


-- 
Best regards,
Marek Vasut
