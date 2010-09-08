Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OtGK5-0005AA-Oj
	for linux-mtd@lists.infradead.org; Wed, 08 Sep 2010 08:48:06 +0000
Received: by fxm12 with SMTP id 12so4633475fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Sep 2010 01:47:57 -0700 (PDT)
Subject: Re: [PATCH] mtd: fix the build warning for fsl_upm.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roy Zang <tie-fei.zang@freescale.com>
In-Reply-To: <1283917561-13930-1-git-send-email-tie-fei.zang@freescale.com>
References: <1283917561-13930-1-git-send-email-tie-fei.zang@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Sep 2010 11:46:28 +0300
Message-ID: <1283935588.2979.62.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org, cbouatmailru@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-09-08 at 11:46 +0800, Roy Zang wrote:
> Fix the build warning:
> 
> drivers/mtd/nand/fsl_upm.c: In function 'fun_chip_init':
> drivers/mtd/nand/fsl_upm.c:190: warning: format '%x' expects type 'unsigned int', but argument 3 has type 'resource_size_t'
> 
> Signed-off-by: Roy Zang <tie-fei.zang@freescale.com>
> ---
>  drivers/mtd/nand/fsl_upm.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
> index 4eff8b2..dc61ecf 100644
> --- a/drivers/mtd/nand/fsl_upm.c
> +++ b/drivers/mtd/nand/fsl_upm.c
> @@ -186,8 +186,8 @@ static int __devinit fun_chip_init(struct fsl_upm_nand *fun,
>  	if (!flash_np)
>  		return -ENODEV;
>  
> -	fun->mtd.name = kasprintf(GFP_KERNEL, "%x.%s", io_res->start,
> -				  flash_np->name);
> +	fun->mtd.name = kasprintf(GFP_KERNEL, "%x.%s", 
> +			(unsigned int)io_res->start, flash_np->name);

No, you should use %llx and (u64) cast since resourse_size_t can be
anything up to u64.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
