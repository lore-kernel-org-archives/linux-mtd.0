Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YuPXl-00009u-WB
 for linux-mtd@lists.infradead.org; Mon, 18 May 2015 18:13:38 +0000
Received: by pabts4 with SMTP id ts4so161725002pab.3
 for <linux-mtd@lists.infradead.org>; Mon, 18 May 2015 11:13:17 -0700 (PDT)
Date: Mon, 18 May 2015 11:13:09 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [PATCH 2/7] mtd: brcmnand: do not make local variable static
Message-ID: <20150518181309.GQ11598@ld-irv-0074>
References: <1431877266-28566-1-git-send-email-hauke@hauke-m.de>
 <1431877266-28566-3-git-send-email-hauke@hauke-m.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1431877266-28566-3-git-send-email-hauke@hauke-m.de>
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com, rjui@broadcom.com,
 zajec5@gmail.com, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, May 17, 2015 at 05:41:01PM +0200, Hauke Mehrtens wrote:
> Remove static in front of ctrl. This variable should not be shared
> between different instances of brcmnand_probe(), it should be local to
> this function and stored on the stack.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index bae30ab..a48ad49 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -2069,7 +2069,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *dn = dev->of_node, *child;
> -	static struct brcmnand_controller *ctrl;
> +	struct brcmnand_controller *ctrl;
>  	struct resource *res;
>  	int ret;
>  

Good catch. Applied this to l2-mtd.git. I'll come back to the others.
