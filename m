Received: from mail-ob0-x231.google.com ([2607:f8b0:4003:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UbkAc-00038A-En
 for linux-mtd@lists.infradead.org; Mon, 13 May 2013 04:15:31 +0000
Received: by mail-ob0-f177.google.com with SMTP id uz6so1157130obc.22
 for <linux-mtd@lists.infradead.org>; Sun, 12 May 2013 21:15:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <004501ce4aeb$bc1006e0$343014a0$@samsung.com>
References: <004501ce4aeb$bc1006e0$343014a0$@samsung.com>
Date: Mon, 13 May 2013 09:45:08 +0530
Message-ID: <CAKohpo=Zv5X333=7DuQS3CoipzXdAiUM63X_HgSA3S2gX2a33g@mail.gmail.com>
Subject: Re: [PATCH 01/26] mtd: devices: spear_smi: remove unnecessary
 platform_set_drvdata()
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jingoo Han <jg1.han@samsung.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 7 May 2013 11:55, Jingoo Han <jg1.han@samsung.com> wrote:
> The driver core clears the driver data to NULL after device_release
> or on probe failure, since commit 0998d0631001288a5974afc0b2a5f568bcdecb4d
> (device-core: Ensure drvdata = NULL when no driver is bound).
> Thus, it is not needed to manually clear the device driver data to NULL.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  drivers/mtd/devices/spear_smi.c |    5 +----
>  1 files changed, 1 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
> index 8a82b8b..e290ef8 100644
> --- a/drivers/mtd/devices/spear_smi.c
> +++ b/drivers/mtd/devices/spear_smi.c
> @@ -995,14 +995,12 @@ static int spear_smi_probe(struct platform_device *pdev)
>                 ret = spear_smi_setup_banks(pdev, i, pdata->np[i]);
>                 if (ret) {
>                         dev_err(&dev->pdev->dev, "bank setup failed\n");
> -                       goto err_bank_setup;
> +                       goto err_irq;
>                 }
>         }
>
>         return 0;
>
> -err_bank_setup:
> -       platform_set_drvdata(pdev, NULL);
>  err_irq:
>         clk_disable_unprepare(dev->clk);
>  err:
> @@ -1040,7 +1038,6 @@ static int spear_smi_remove(struct platform_device *pdev)
>         }
>
>         clk_disable_unprepare(dev->clk);
> -       platform_set_drvdata(pdev, NULL);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
