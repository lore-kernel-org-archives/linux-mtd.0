Received: from mail-bk0-x232.google.com ([2a00:1450:4008:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VIxCr-00082V-3C
 for linux-mtd@lists.infradead.org; Mon, 09 Sep 2013 08:52:26 +0000
Received: by mail-bk0-f50.google.com with SMTP id mz11so2112291bkb.23
 for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2013 01:52:01 -0700 (PDT)
Message-ID: <522D8C2F.6040501@gmail.com>
Date: Mon, 09 Sep 2013 10:51:59 +0200
From: Daniel Mack <zonque@gmail.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [RFC/PATCH] mtd: nand: pxa3xx: Remove redundant device probing
References: <1378478428-25280-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1378478428-25280-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1378478428-25280-2-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>,
 haojian.zhuang@gmail.com, b32955@freescale.com, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

On 06.09.2013 16:40, Ezequiel Garcia wrote:
> There's no need to go through this internal probe/auto-detect
> procedure, since the nand core code will take care of that.
> This commit removes the configuration and detection functions,
> together with the built-in flash device table.
> 
> Besides being unneeded, it's also wrong to take care of such details
> wich rightfully belong to the NAND base code. Removing this wrong
> code, prevents the proliferation of the same mistake in future drivers.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
> This patch doesn't build, because it needs some other patches to be
> applied first. It's not meant for inclusion, but to discuss about
> the possibility of engaging such agressive cleanup on this driver.

Which patch is needed to make this one apply?

> @@ -1064,69 +989,18 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
>  {
>  	struct pxa3xx_nand_host *host = mtd->priv;
>  	struct pxa3xx_nand_info *info = host->info_data;
> -	struct platform_device *pdev = info->pdev;
> -	struct pxa3xx_nand_platform_data *pdata = dev_get_platdata(&pdev->dev);
> -	struct nand_flash_dev pxa3xx_flash_ids[2], *def = NULL;
> -	const struct pxa3xx_nand_flash *f = NULL;
>  	struct nand_chip *chip = mtd->priv;
> -	uint32_t id = -1;
> -	uint64_t chipsize;
> -	int i, ret, num;
> +	int ret;
>  
> -	if (pdata->keep_config && !pxa3xx_nand_detect_config(info))
> -		goto KEEP_CONFIG;

The keep_config pdata setting was necessary in the past in order to
purely rely on the nand controller timing settings as configured by the
bootloader.

I'd like to have another look and test your patch, if you tell me its
dependecy chain.


Daniel
