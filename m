Received: from mail-oa0-f47.google.com ([209.85.219.47])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WBeFL-0004aw-Bh
 for linux-mtd@lists.infradead.org; Fri, 07 Feb 2014 05:45:04 +0000
Received: by mail-oa0-f47.google.com with SMTP id m1so3625366oag.6
 for <linux-mtd@lists.infradead.org>; Thu, 06 Feb 2014 21:44:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <000401cf2302$1768bac0$463a3040$%han@samsung.com>
References: <000201cf2301$b168d250$143a76f0$%han@samsung.com>
 <000401cf2302$1768bac0$463a3040$%han@samsung.com>
Date: Fri, 7 Feb 2014 11:14:42 +0530
Message-ID: <CAKohpomONjQQRUmXE5UWTkXuHB=hOTEN8f_A5TMVZjNrnwgtBA@mail.gmail.com>
Subject: Re: [PATCH 2/8] mtd: spear_smi: Remove unnecessary OOM messages
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jingoo Han <jg1.han@samsung.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6 February 2014 11:40, Jingoo Han <jg1.han@samsung.com> wrote:
> The site-specific OOM messages are unnecessary, because they
> duplicate the MM subsystem generic OOM message.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  drivers/mtd/devices/spear_smi.c |    2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
> index 4238214..363da96 100644
> --- a/drivers/mtd/devices/spear_smi.c
> +++ b/drivers/mtd/devices/spear_smi.c
> @@ -913,7 +913,6 @@ static int spear_smi_probe(struct platform_device *pdev)
>         if (np) {
>                 pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
>                 if (!pdata) {
> -                       pr_err("%s: ERROR: no memory", __func__);
>                         ret = -ENOMEM;
>                         goto err;
>                 }
> @@ -943,7 +942,6 @@ static int spear_smi_probe(struct platform_device *pdev)
>         dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_ATOMIC);
>         if (!dev) {
>                 ret = -ENOMEM;
> -               dev_err(&pdev->dev, "mem alloc fail\n");
>                 goto err;
>         }

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
