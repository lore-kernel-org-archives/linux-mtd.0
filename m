Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V91OS-0000Un-5W
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2013 23:19:20 +0000
Received: by mail-pd0-f172.google.com with SMTP id z10so4057121pdj.31
 for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2013 16:18:56 -0700 (PDT)
Date: Mon, 12 Aug 2013 16:18:50 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v4 08/14] mtd: nand: pxa3xx: Remove hardcoded mtd name
Message-ID: <20130812231850.GA7267@brian-ubuntu>
References: <1376327699-7973-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1376327699-7973-9-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376327699-7973-9-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, Daniel Mack <zonque@gmail.com>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 12, 2013 at 02:14:53PM -0300, Ezequiel Garcia wrote:
> There's no advantage in using a hardcoded name for the mtd device.
> Instead use the provided by the platform_device.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> Tested-by: Daniel Mack <zonque@gmail.com>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 17a3e2c..5bbb8b8 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -244,8 +244,6 @@ static struct pxa3xx_nand_flash builtin_flash_types[] = {
>  /* Define a default flash type setting serve as flash detecting only */
>  #define DEFAULT_FLASH_TYPE (&builtin_flash_types[0])
>  
> -const char *mtd_names[] = {"pxa3xx_nand-0", "pxa3xx_nand-1", NULL};
> -
>  #define NDTR0_tCH(c)	(min((c), 7) << 19)
>  #define NDTR0_tCS(c)	(min((c), 7) << 16)
>  #define NDTR0_tWH(c)	(min((c), 7) << 11)
> @@ -1091,8 +1089,6 @@ KEEP_CONFIG:
>  		host->row_addr_cycles = 3;
>  	else
>  		host->row_addr_cycles = 2;
> -
> -	mtd->name = mtd_names[0];
>  	return nand_scan_tail(mtd);
>  }
>  
> @@ -1314,6 +1310,8 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
>  	probe_success = 0;
>  	for (cs = 0; cs < pdata->num_cs; cs++) {
>  		struct mtd_info *mtd = info->host[cs]->mtd;
> +
> +		mtd->name = pdev->name;

I notice a potential improvement here: use dev_name(&pdev->dev) instead of
pdev->name. There is slight difference between the two, I think, where
dev_name() will have automatically append an index suffix (i.e.,
"pxa3xx-nand.0") whereas pdev->name may just be "pxa3xx-nand".

If that tests out fine for you, just submit a follow-up patch. Or maybe I'm
wrong about pdev->name vs. dev_name(). Either way, it's not worth a series
resend.

>  		info->cs = cs;
>  		ret = pxa3xx_nand_scan(mtd);
>  		if (ret) {

Thanks,
Brian
