Received: from mail-ob0-x236.google.com ([2607:f8b0:4003:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UjpxI-0002R9-Nb
 for linux-mtd@lists.infradead.org; Tue, 04 Jun 2013 12:03:13 +0000
Received: by mail-ob0-f182.google.com with SMTP id va7so183761obc.13
 for <linux-mtd@lists.infradead.org>; Tue, 04 Jun 2013 05:02:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1367581063-24295-1-git-send-email-sachin.kamat@linaro.org>
References: <1367581063-24295-1-git-send-email-sachin.kamat@linaro.org>
Date: Tue, 4 Jun 2013 17:32:45 +0530
Message-ID: <CAK9yfHysGeinDQdVVMYs3j5Vb9cNGiMhtXg4TgOZTSHU5ZuN+Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: onenand/generic: Remove redundant
 platform_set_drvdata()
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: artem.bityutskiy@linux.intel.com, kyungmin.park@samsung.com,
 dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3 May 2013 17:07, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Commit 0998d06310 (device-core: Ensure drvdata = NULL when no
> driver is bound) removes the need to set driver data field to
> NULL.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/mtd/onenand/generic.c |    2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/mtd/onenand/generic.c b/drivers/mtd/onenand/generic.c
> index 9f11562..42520a3 100644
> --- a/drivers/mtd/onenand/generic.c
> +++ b/drivers/mtd/onenand/generic.c
> @@ -94,8 +94,6 @@ static int generic_onenand_remove(struct platform_device *pdev)
>         struct resource *res = pdev->resource;
>         unsigned long size = resource_size(res);
>
> -       platform_set_drvdata(pdev, NULL);
> -
>         if (info) {
>                 onenand_release(&info->mtd);
>                 release_mem_region(res->start, size);
> --
> 1.7.9.5
>


Ping on this series.


-- 
With warm regards,
Sachin
