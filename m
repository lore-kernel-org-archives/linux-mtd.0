Received: from mail-qa0-x231.google.com ([2607:f8b0:400d:c00::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZTKu-0006ZZ-5I
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 22:25:01 +0000
Received: by mail-qa0-f49.google.com with SMTP id i13so143303qae.15
 for <linux-mtd@lists.infradead.org>; Thu, 24 Oct 2013 15:24:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1382652737-20239-5-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1382652737-20239-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1382652737-20239-5-git-send-email-ezequiel.garcia@free-electrons.com>
Date: Fri, 25 Oct 2013 00:24:38 +0200
Message-ID: <CAAfyv37SL94Ohwqqs6u5AMvdj4aAgQMGRe_9zze=TcS5An_U0w@mail.gmail.com>
Subject: Re: [PATCH 4/5] mtd: nand: omap2: Use devm_kzalloc
From: Belisko Marek <marek.belisko@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=UTF-8
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>, Felipe Balbi <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, Oct 25, 2013 at 12:12 AM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
> This simplifies the error path and makes the code less error-prone.
>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>  drivers/mtd/nand/omap2.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index e01a936..d4cafb0 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1837,7 +1837,7 @@ static int omap_nand_probe(struct platform_device *pdev)
>                 return -ENODEV;
>         }
>
> -       info = kzalloc(sizeof(struct omap_nand_info), GFP_KERNEL);
> +       info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
>         if (!info)
>                 return -ENOMEM;
>
> @@ -2066,9 +2066,6 @@ out_release_mem_region:
>         if (info->gpmc_irq_fifo > 0)
>                 free_irq(info->gpmc_irq_fifo, info);
>         release_mem_region(info->phys_base, info->mem_size);
> -out_free_info:
You remove ^^^^ statement but it's still used in line ~1868 as return when
cannot get resource.
> -       kfree(info);
> -
>         return err;
>  }
>
> @@ -2091,7 +2088,6 @@ static int omap_nand_remove(struct platform_device *pdev)
>         nand_release(&info->mtd);
>         iounmap(info->nand.IO_ADDR_R);
>         release_mem_region(info->phys_base, info->mem_size);
> -       kfree(info);
>         return 0;
>  }
>
> --
> 1.8.1.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-omap" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
