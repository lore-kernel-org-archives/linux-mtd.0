Received: from mail-vc0-x22f.google.com ([2607:f8b0:400c:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlYiw-0005ng-Vu
 for linux-mtd@lists.infradead.org; Sat, 17 May 2014 07:08:04 +0000
Received: by mail-vc0-f175.google.com with SMTP id hu19so7242651vcb.6
 for <linux-mtd@lists.infradead.org>; Sat, 17 May 2014 00:07:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1400308369-24375-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1400308369-24375-1-git-send-email-Julia.Lawall@lip6.fr>
Date: Sat, 17 May 2014 04:07:39 -0300
Message-ID: <CAOMZO5AymcCnC6Awt2LiGP9yz=baRA0HLoLRUSBgNeg3b5=9xQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: delete unneeded call to platform_get_drvdata
From: Fabio Estevam <festevam@gmail.com>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, May 17, 2014 at 3:32 AM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> Platform_get_drvdata is an accessor function, and has no purpose if its
> result is not used.
>
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @@
> identifier x;
> type T;
> @@
> - T x = platform_get_drvdata(...);
> ... when != x
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---
>  drivers/mtd/nand/bf5xx_nand.c |    4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
> index b7a2494..b5fbd48 100644
> --- a/drivers/mtd/nand/bf5xx_nand.c
> +++ b/drivers/mtd/nand/bf5xx_nand.c
> @@ -840,15 +840,11 @@ out_err_kzalloc:
>
>  static int bf5xx_nand_suspend(struct platform_device *dev, pm_message_t pm)
>  {
> -       struct bf5xx_nand_info *info = platform_get_drvdata(dev);
> -
>         return 0;
>  }
>
>  static int bf5xx_nand_resume(struct platform_device *dev)
>  {
> -       struct bf5xx_nand_info *info = platform_get_drvdata(dev);
> -
>         return 0;

In this case bf5xx_nand_suspend/resume could be removed?
