Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1amyOv-0003Jl-5M
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2016 06:54:17 +0000
Received: by mail-pa0-x234.google.com with SMTP id tt10so137701666pab.3
 for <linux-mtd@lists.infradead.org>; Sun, 03 Apr 2016 23:53:56 -0700 (PDT)
Date: Sun, 3 Apr 2016 23:53:53 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mtd@lists.infradead.org, Kamal Dasu <kdasu.kdev@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>,
 Simon Arlott <simon@fire.lp0.eu>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM STB NAND FLASH DRIVER"
 <bcm-kernel-feedback-list@broadcom.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: brcmnand: Add support for v6.2 controllers
Message-ID: <20160404065353.GE13995@localhost>
References: <1457652859-767-1-git-send-email-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1457652859-767-1-git-send-email-f.fainelli@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Boris, Richard

On Thu, Mar 10, 2016 at 03:34:16PM -0800, Florian Fainelli wrote:
> Document and match the brcm,brcmnand-v6.2 compatible string, the controller has
> a register layout identical to the v6.0 version and supports prefetch. Update the
> command shift logic to account for v6.2 controller which are the first ones to
> use a shift of 0 (6.1 used a shift of 24).

Ah yes, another blip in the ever-shifting register layout of this
controller. Fun!

> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Acked-by: Brian Norris <computersforpeace@gmail.com>

> ---
>  Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt | 1 +
>  drivers/mtd/nand/brcmnand/brcmnand.c                    | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> index c2546ced9c02..deb24cbdda82 100644
> --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> @@ -24,6 +24,7 @@ Required properties:
>                           brcm,brcmnand-v5.0
>                           brcm,brcmnand-v6.0
>                           brcm,brcmnand-v6.1
> +                         brcm,brcmnand-v6.2
>                           brcm,brcmnand-v7.0
>                           brcm,brcmnand-v7.1
>                           brcm,brcmnand
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index e0528397306a..0b7a698cc233 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -601,7 +601,7 @@ static void brcmnand_wr_corr_thresh(struct brcmnand_host *host, u8 val)
>  
>  static inline int brcmnand_cmd_shift(struct brcmnand_controller *ctrl)
>  {
> -	if (ctrl->nand_version < 0x0700)
> +	if (ctrl->nand_version < 0x0602)
>  		return 24;
>  	return 0;
>  }
> @@ -2115,6 +2115,7 @@ static const struct of_device_id brcmnand_of_match[] = {
>  	{ .compatible = "brcm,brcmnand-v5.0" },
>  	{ .compatible = "brcm,brcmnand-v6.0" },
>  	{ .compatible = "brcm,brcmnand-v6.1" },
> +	{ .compatible = "brcm,brcmnand-v6.2" },
>  	{ .compatible = "brcm,brcmnand-v7.0" },
>  	{ .compatible = "brcm,brcmnand-v7.1" },
>  	{},
> -- 
> 2.1.0
> 
