Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bM3Zq-0004JB-FQ
 for linux-mtd@lists.infradead.org; Sun, 10 Jul 2016 01:30:35 +0000
Received: by mail-pf0-x242.google.com with SMTP id g202so276126pfb.1
 for <linux-mtd@lists.infradead.org>; Sat, 09 Jul 2016 18:30:14 -0700 (PDT)
Date: Sat, 9 Jul 2016 18:30:10 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mtd@lists.infradead.org, Kamal Dasu <kdasu.kdev@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 "open list:BROADCOM STB NAND FLASH DRIVER"
 <bcm-kernel-feedback-list@broadcom.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: nand: brcmnand: Change BUG_ON in brcmnand_send_cmd
Message-ID: <20160710013010.GA12327@localhost>
References: <1467999399-22288-1-git-send-email-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1467999399-22288-1-git-send-email-f.fainelli@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 08, 2016 at 10:36:39AM -0700, Florian Fainelli wrote:
> Change the BUG_ON() condition in brcmnand_send_cmd() which checks for
> the interrupt status "controller ready" bit to a WARN_ON.
> 
> There is no good reason to kill the system when this condition occur
> because we could have systems which listed the NAND controller as
> available (e.g: from Device Tree), but the NAND chip could be
> malfunctioning and not responding.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Acked-by: Brian Norris <computersforpeace@gmail.com>

> ---
> Note that I even hesitated to remove that completely, but there is
> some value in knowing about this condition since it helps figuring
> out what could be wrong.
> 
>  drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index b6062a2f3dfd..72bdc283778d 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -1165,7 +1165,7 @@ static void brcmnand_send_cmd(struct brcmnand_host *host, int cmd)
>  	ctrl->cmd_pending = cmd;
>  
>  	intfc = brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS);
> -	BUG_ON(!(intfc & INTFC_CTLR_READY));
> +	WARN_ON(!(intfc & INTFC_CTLR_READY));
>  
>  	mb(); /* flush previous writes */
>  	brcmnand_write_reg(ctrl, BRCMNAND_CMD_START,
> -- 
> 2.7.4
> 
