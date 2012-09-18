Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TDtA7-00065d-G9
 for linux-mtd@lists.infradead.org; Tue, 18 Sep 2012 08:28:08 +0000
Received: by weyr3 with SMTP id r3so4586511wey.36
 for <linux-mtd@lists.infradead.org>; Tue, 18 Sep 2012 01:28:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1347452786-10208-1-git-send-email-richard.genoud@gmail.com>
References: <1347452786-10208-1-git-send-email-richard.genoud@gmail.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 18 Sep 2012 10:27:44 +0200
Message-ID: <CACQ1gAg7Kb7v1HZVdF1N2CtmUSGEYJwB+Un2GUJFDX+==6yO8g@mail.gmail.com>
Subject: Re: [PATCH] MTD: nandsim: BUG: Fail if overridesize is too big
To: David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/9/12 Richard Genoud <richard.genoud@gmail.com>:
> If override size is too big, the module was actually loaded instead of
> failing, because retval was not set.
>
> This lead to memory corruption with the use of the freed structs nandsim
> and nand_chip.
>
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
> ---
>  drivers/mtd/nand/nandsim.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
> index cf0cd31..5d881180 100644
> --- a/drivers/mtd/nand/nandsim.c
> +++ b/drivers/mtd/nand/nandsim.c
> @@ -2333,6 +2333,7 @@ static int __init ns_init_module(void)
>                 uint64_t new_size = (uint64_t)nsmtd->erasesize << overridesize;
>                 if (new_size >> overridesize != nsmtd->erasesize) {
>                         NS_ERR("overridesize is too big\n");
> +                       retval = -EINVAL;
>                         goto err_exit;
>                 }
>                 /* N.B. This relies on nand_scan not doing anything with the size before we change it */
> --
> 1.7.2.5
>
Hi Artem, David.

As this is a bug fix, it should be pushed to 3.6-rc7, shouldn't it ?

Regards,
Richard.
