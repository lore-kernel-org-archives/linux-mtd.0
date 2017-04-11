Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cy1fL-00058f-Kk
 for linux-mtd@lists.infradead.org; Tue, 11 Apr 2017 19:41:29 +0000
Date: Tue, 11 Apr 2017 21:41:06 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: linux-mtd@lists.infradead.org, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@atmel.com
Subject: Re: [PATCH V6, 1/1] mtd: nand: brcmnand: Check flash #WP pin status
 before nand erase/program
Message-ID: <20170411214106.36b94f34@bbrezillon>
In-Reply-To: <1488575813-12660-2-git-send-email-kdasu.kdev@gmail.com>
References: <1488575813-12660-1-git-send-email-kdasu.kdev@gmail.com>
 <1488575813-12660-2-git-send-email-kdasu.kdev@gmail.com>
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

On Fri,  3 Mar 2017 16:16:53 -0500
Kamal Dasu <kdasu.kdev@gmail.com> wrote:

> On brcmnand controller v6.x and v7.x, the #WP pin is controlled through
> the NAND_WP bit in CS_SELECT register.
> 
> The driver currently assumes that toggling the #WP pin is
> instantaneously enabling/disabling write-protection, but it actually
> takes some time to propagate the new state to the internal NAND chip
> logic. This behavior is sometime causing data corruptions when an
> erase/program operation is executed before write-protection has really
> been disabled.

Applied.

Thanks,

Boris

> 
> Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 61 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 58 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index 42ebd73..7419c5c 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -101,6 +101,9 @@ struct brcm_nand_dma_desc {
>  #define BRCMNAND_MIN_BLOCKSIZE	(8 * 1024)
>  #define BRCMNAND_MIN_DEVSIZE	(4ULL * 1024 * 1024)
>  
> +#define NAND_CTRL_RDY			(INTFC_CTLR_READY | INTFC_FLASH_READY)
> +#define NAND_POLL_STATUS_TIMEOUT_MS	100
> +
>  /* Controller feature flags */
>  enum {
>  	BRCMNAND_HAS_1K_SECTORS			= BIT(0),
> @@ -765,6 +768,31 @@ enum {
>  	CS_SELECT_AUTO_DEVICE_ID_CFG		= BIT(30),
>  };
>  
> +static int bcmnand_ctrl_poll_status(struct brcmnand_controller *ctrl,
> +				    u32 mask, u32 expected_val,
> +				    unsigned long timeout_ms)
> +{
> +	unsigned long limit;
> +	u32 val;
> +
> +	if (!timeout_ms)
> +		timeout_ms = NAND_POLL_STATUS_TIMEOUT_MS;
> +
> +	limit = jiffies + msecs_to_jiffies(timeout_ms);
> +	do {
> +		val = brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS);
> +		if ((val & mask) == expected_val)
> +			return 0;
> +
> +		cpu_relax();
> +	} while (time_after(limit, jiffies));
> +
> +	dev_warn(ctrl->dev, "timeout on status poll (expected %x got %x)\n",
> +		 expected_val, val & mask);
> +
> +	return -ETIMEDOUT;
> +}
> +
>  static inline void brcmnand_set_wp(struct brcmnand_controller *ctrl, bool en)
>  {
>  	u32 val = en ? CS_SELECT_NAND_WP : 0;
> @@ -1024,12 +1052,39 @@ static void brcmnand_wp(struct mtd_info *mtd, int wp)
>  
>  	if ((ctrl->features & BRCMNAND_HAS_WP) && wp_on == 1) {
>  		static int old_wp = -1;
> +		int ret;
>  
>  		if (old_wp != wp) {
>  			dev_dbg(ctrl->dev, "WP %s\n", wp ? "on" : "off");
>  			old_wp = wp;
>  		}
> +
> +		/*
> +		 * make sure ctrl/flash ready before and after
> +		 * changing state of #WP pin
> +		 */
> +		ret = bcmnand_ctrl_poll_status(ctrl, NAND_CTRL_RDY |
> +					       NAND_STATUS_READY,
> +					       NAND_CTRL_RDY |
> +					       NAND_STATUS_READY, 0);
> +		if (ret)
> +			return;
> +
>  		brcmnand_set_wp(ctrl, wp);
> +		chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
> +		/* NAND_STATUS_WP 0x00 = protected, 0x80 = not protected */
> +		ret = bcmnand_ctrl_poll_status(ctrl,
> +					       NAND_CTRL_RDY |
> +					       NAND_STATUS_READY |
> +					       NAND_STATUS_WP,
> +					       NAND_CTRL_RDY |
> +					       NAND_STATUS_READY |
> +					       (wp ? 0 : NAND_STATUS_WP), 0);
> +
> +		if (ret)
> +			dev_err_ratelimited(&host->pdev->dev,
> +					    "nand #WP expected %s\n",
> +					    wp ? "on" : "off");
>  	}
>  }
>  
> @@ -1157,15 +1212,15 @@ static irqreturn_t brcmnand_dma_irq(int irq, void *data)
>  static void brcmnand_send_cmd(struct brcmnand_host *host, int cmd)
>  {
>  	struct brcmnand_controller *ctrl = host->ctrl;
> -	u32 intfc;
> +	int ret;
>  
>  	dev_dbg(ctrl->dev, "send native cmd %d addr_lo 0x%x\n", cmd,
>  		brcmnand_read_reg(ctrl, BRCMNAND_CMD_ADDRESS));
>  	BUG_ON(ctrl->cmd_pending != 0);
>  	ctrl->cmd_pending = cmd;
>  
> -	intfc = brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS);
> -	WARN_ON(!(intfc & INTFC_CTLR_READY));
> +	ret = bcmnand_ctrl_poll_status(ctrl, NAND_CTRL_RDY, NAND_CTRL_RDY, 0);
> +	WARN_ON(ret);
>  
>  	mb(); /* flush previous writes */
>  	brcmnand_write_reg(ctrl, BRCMNAND_CMD_START,
