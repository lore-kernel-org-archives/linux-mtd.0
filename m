Message-ID: <5511593F.2080407@ti.com>
Date: Tue, 24 Mar 2015 14:31:59 +0200
From: Roger Quadros <rogerq@ti.com>
MIME-Version: 1.0
To: <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: Prevent possible kernel lockup in
 nand_command()
References: <1424705199-11337-1-git-send-email-rogerq@ti.com>
In-Reply-To: <1424705199-11337-1-git-send-email-rogerq@ti.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Cc: nm@ti.com, nsekhar@ti.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, ezequiel.garcia@free-electrons.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 23/02/15 17:26, Roger Quadros wrote:
> If a NAND device is not really present or pin muxes are not correctly
> configured we can lock up the kernel waiting infinitely for NAND_STATUS
> to be ready.
> 
> This can be easily reproduced on TI's DRA7-evm board by booting it
> without NAND support in u-boot and disabling NAND pin muxes in the kernel.
> 
> Add timeout when waiting for NAND_CMD_RESET completion. As per ONFi v4.0
> tRST can be upto 250ms for EZ-NAND and 5ms for raw NAND.

Any comments on this patch?

cheers,
-roger
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Tested-by: Nishanth Menon <nm@ti.com>
> ---
>  drivers/mtd/nand/nand_base.c | 27 +++++++++++++++++++++++----
>  1 file changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index df7eb4f..d1e6695 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -566,6 +566,25 @@ void nand_wait_ready(struct mtd_info *mtd)
>  EXPORT_SYMBOL_GPL(nand_wait_ready);
>  
>  /**
> + * nand_wait_status_ready - [GENERIC] Wait for the ready status after commands.
> + * @mtd: MTD device structure
> + * @timeo: Timeout in ms
> + *
> + * Wait for status ready (i.e. command done) or timeout.
> + */
> +static void nand_wait_status_ready(struct mtd_info *mtd, unsigned long timeo)
> +{
> +	register struct nand_chip *chip = mtd->priv;
> +
> +	timeo = jiffies + msecs_to_jiffies(timeo);
> +	do {
> +		if ((chip->read_byte(mtd) & NAND_STATUS_READY))
> +			break;
> +		touch_softlockup_watchdog();
> +	} while (time_before(jiffies, timeo));
> +};
> +
> +/**
>   * nand_command - [DEFAULT] Send command to NAND device
>   * @mtd: MTD device structure
>   * @command: the command to be sent
> @@ -643,8 +662,8 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
>  			       NAND_CTRL_CLE | NAND_CTRL_CHANGE);
>  		chip->cmd_ctrl(mtd,
>  			       NAND_CMD_NONE, NAND_NCE | NAND_CTRL_CHANGE);
> -		while (!(chip->read_byte(mtd) & NAND_STATUS_READY))
> -				;
> +		/* EZ-NAND can take upto 250ms as per ONFi v4.0 */
> +		nand_wait_status_ready(mtd, 250);
>  		return;
>  
>  		/* This applies to read commands */
> @@ -740,8 +759,8 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
>  			       NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
>  		chip->cmd_ctrl(mtd, NAND_CMD_NONE,
>  			       NAND_NCE | NAND_CTRL_CHANGE);
> -		while (!(chip->read_byte(mtd) & NAND_STATUS_READY))
> -				;
> +		/* EZ-NAND can take upto 250ms as per ONFi v4.0 */
> +		nand_wait_status_ready(mtd, 250);
>  		return;
>  
>  	case NAND_CMD_RNDOUT:
> 
