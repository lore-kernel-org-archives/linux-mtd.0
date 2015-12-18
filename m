Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aA1yo-0006eX-Ot
 for linux-mtd@lists.infradead.org; Fri, 18 Dec 2015 20:50:24 +0000
Date: Fri, 18 Dec 2015 21:50:00 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: <linux-mtd@lists.infradead.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v5] mtd: nand: bcm47xx: use the mtd instance embedded in
 struct nand_chip
Message-ID: <20151218215000.2b0adda9@bbrezillon>
In-Reply-To: <1450467498-35553-1-git-send-email-computersforpeace@gmail.com>
References: <1450467498-35553-1-git-send-email-computersforpeace@gmail.com>
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

On Fri, 18 Dec 2015 11:38:18 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> From: Boris BREZILLON <boris.brezillon@free-electrons.com>
> 
> struct nand_chip now embeds an mtd device. Make use of this mtd instance.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Looks good to me, not we can have both a SoB and an AB tag coming from
the same person, but

Acked-by: Boris Brezillon <boris.brezillon@free-elctrons.com>

> ---
> Rebased Boris's patch to l2-mtd.git
> 
>  drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h |  1 -
>  drivers/mtd/nand/bcm47xxnflash/main.c          | 10 ++++++----
>  drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c   |  2 +-
>  3 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h b/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h
> index c005a62330b1..8ea75710a854 100644
> --- a/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h
> +++ b/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h
> @@ -12,7 +12,6 @@ struct bcm47xxnflash {
>  	struct bcma_drv_cc *cc;
>  
>  	struct nand_chip nand_chip;
> -	struct mtd_info mtd;
>  
>  	unsigned curr_command;
>  	int curr_page_addr;
> diff --git a/drivers/mtd/nand/bcm47xxnflash/main.c b/drivers/mtd/nand/bcm47xxnflash/main.c
> index 0b3acc439181..2c9bffb614c5 100644
> --- a/drivers/mtd/nand/bcm47xxnflash/main.c
> +++ b/drivers/mtd/nand/bcm47xxnflash/main.c
> @@ -27,6 +27,7 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
>  {
>  	struct bcma_nflash *nflash = dev_get_platdata(&pdev->dev);
>  	struct bcm47xxnflash *b47n;
> +	struct mtd_info *mtd;
>  	int err = 0;
>  
>  	b47n = devm_kzalloc(&pdev->dev, sizeof(*b47n), GFP_KERNEL);
> @@ -34,8 +35,9 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	b47n->nand_chip.priv = b47n;
> -	b47n->mtd.dev.parent = &pdev->dev;
> -	b47n->mtd.priv = &b47n->nand_chip; /* Required */
> +	mtd = nand_to_mtd(&b47n->nand_chip);
> +	mtd->dev.parent = &pdev->dev;
> +	mtd->priv = &b47n->nand_chip; /* Required */
>  	b47n->cc = container_of(nflash, struct bcma_drv_cc, nflash);
>  
>  	if (b47n->cc->core->bus->chipinfo.id == BCMA_CHIP_ID_BCM4706) {
> @@ -51,7 +53,7 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, b47n);
>  
> -	err = mtd_device_parse_register(&b47n->mtd, probes, NULL, NULL, 0);
> +	err = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
>  	if (err) {
>  		pr_err("Failed to register MTD device: %d\n", err);
>  		return err;
> @@ -64,7 +66,7 @@ static int bcm47xxnflash_remove(struct platform_device *pdev)
>  {
>  	struct bcm47xxnflash *nflash = platform_get_drvdata(pdev);
>  
> -	nand_release(&nflash->mtd);
> +	nand_release(nand_to_mtd(&nflash->nand_chip));
>  
>  	return 0;
>  }
> diff --git a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
> index e5b2e48658c4..652478035a7d 100644
> --- a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
> +++ b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
> @@ -421,7 +421,7 @@ int bcm47xxnflash_ops_bcm4706_init(struct bcm47xxnflash *b47n)
>  			(w4 << 24 | w3 << 18 | w2 << 12 | w1 << 6 | w0));
>  
>  	/* Scan NAND */
> -	err = nand_scan(&b47n->mtd, 1);
> +	err = nand_scan(nand_to_mtd(&b47n->nand_chip), 1);
>  	if (err) {
>  		pr_err("Could not scan NAND flash: %d\n", err);
>  		goto exit;



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
