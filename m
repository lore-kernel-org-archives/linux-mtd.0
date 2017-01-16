Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cT7PB-0000hk-8S
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 13:33:03 +0000
Received: by mail-wm0-x241.google.com with SMTP id r144so30872112wme.0
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2017 05:32:40 -0800 (PST)
Subject: Re: [PATCH] mtd: bcm47xxsflash: use platform_(set|get)_drvdata
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <20170116130409.2686-1-zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <976e2fab-e095-f7a8-97cb-ab9884d38115@gmail.com>
Date: Mon, 16 Jan 2017 14:31:46 +0100
MIME-Version: 1.0
In-Reply-To: <20170116130409.2686-1-zajec5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/16/2017 02:04 PM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> We have generic place & helpers for storing platform driver data so
> there is no reason for using custom priv pointer.
> 
> This patch will be followed by cleaning struct bcma_sflash which will go
> through another tree where bcma development happens.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Acked-by: Marek Vasut <marek.vasut@gmail.com>

> ---
>  drivers/mtd/devices/bcm47xxsflash.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
> index 514be04..4decd8c 100644
> --- a/drivers/mtd/devices/bcm47xxsflash.c
> +++ b/drivers/mtd/devices/bcm47xxsflash.c
> @@ -284,7 +284,6 @@ static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
>  	b47s = devm_kzalloc(dev, sizeof(*b47s), GFP_KERNEL);
>  	if (!b47s)
>  		return -ENOMEM;
> -	sflash->priv = b47s;
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	if (!res) {
> @@ -334,6 +333,8 @@ static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
>  	b47s->size = sflash->size;
>  	bcm47xxsflash_fill_mtd(b47s, &pdev->dev);
>  
> +	platform_set_drvdata(pdev, b47s);
> +
>  	err = mtd_device_parse_register(&b47s->mtd, probes, NULL, NULL, 0);
>  	if (err) {
>  		pr_err("Failed to register MTD device: %d\n", err);
> @@ -349,8 +350,7 @@ static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
>  
>  static int bcm47xxsflash_bcma_remove(struct platform_device *pdev)
>  {
> -	struct bcma_sflash *sflash = dev_get_platdata(&pdev->dev);
> -	struct bcm47xxsflash *b47s = sflash->priv;
> +	struct bcm47xxsflash *b47s = platform_get_drvdata(pdev);
>  
>  	mtd_device_unregister(&b47s->mtd);
>  	iounmap(b47s->window);
> 


-- 
Best regards,
Marek Vasut
