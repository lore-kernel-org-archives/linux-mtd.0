Received: from mail-gw1-out.broadcom.com ([216.31.210.62])
 by casper.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3SyI-0004wr-Rj
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2015 18:14:44 +0000
Subject: Re: [PATCH] mtd: brcmnand: drop brcmnand_host::of_node field
To: Brian Norris <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
References: <1448935287-144366-1-git-send-email-computersforpeace@gmail.com>
CC: Julia Lawall <julia.lawall@lip6.fr>,
 <bcm-kernel-feedback-list@broadcom.com>, Kamal Dasu <kdasu.kdev@gmail.com>
From: Scott Branden <sbranden@broadcom.com>
Message-ID: <565DD627.5010400@broadcom.com>
Date: Tue, 1 Dec 2015 09:17:27 -0800
MIME-Version: 1.0
In-Reply-To: <1448935287-144366-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Looks good.

On 15-11-30 06:01 PM, Brian Norris wrote:
> We don't actually need to stash a copy of this device_node indefinitely;
> we only need it in brcmnand_init_cs().
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: <bcm-kernel-feedback-list@broadcom.com>
> Cc: Kamal Dasu <kdasu.kdev@gmail.com>
Acked-by: Scott Branden <sbranden@broadcom.com>

> ---
>   drivers/mtd/nand/brcmnand/brcmnand.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index ad756f626f4b..35d78f739d91 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -176,7 +176,6 @@ struct brcmnand_cfg {
>
>   struct brcmnand_host {
>   	struct list_head	node;
> -	struct device_node	*of_node;
>
>   	struct nand_chip	chip;
>   	struct mtd_info		mtd;
> @@ -1902,10 +1901,9 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
>   	return 0;
>   }
>
> -static int brcmnand_init_cs(struct brcmnand_host *host)
> +static int brcmnand_init_cs(struct brcmnand_host *host, struct device_node *dn)
>   {
>   	struct brcmnand_controller *ctrl = host->ctrl;
> -	struct device_node *dn = host->of_node;
>   	struct platform_device *pdev = host->pdev;
>   	struct mtd_info *mtd;
>   	struct nand_chip *chip;
> @@ -2239,9 +2237,8 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
>   			}
>   			host->pdev = pdev;
>   			host->ctrl = ctrl;
> -			host->of_node = child;
>
> -			ret = brcmnand_init_cs(host);
> +			ret = brcmnand_init_cs(host, child);
>   			if (ret) {
>   				devm_kfree(dev, host);
>   				continue; /* Try all chip-selects */
>
