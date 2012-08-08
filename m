Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SzEB5-0005Lz-Ij
 for linux-mtd@lists.infradead.org; Wed, 08 Aug 2012 21:52:32 +0000
Received: by yenr9 with SMTP id r9so1440744yen.36
 for <linux-mtd@lists.infradead.org>; Wed, 08 Aug 2012 14:52:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1344393061-21037-1-git-send-email-lu.jiang@windriver.com>
References: <1344393061-21037-1-git-send-email-lu.jiang@windriver.com>
Date: Wed, 8 Aug 2012 23:52:26 +0200
Message-ID: <CAFLxGvzoXrOhmG=0Jd5My_sEowsUXrG3=HWHR8JUYkCFs-cWHg@mail.gmail.com>
Subject: Re: [PATCH] UBI:Force ubi driver load after mtd device drivers
From: richard -rw- weinberger <richard.weinberger@gmail.com>
To: Jiang Lu <lu.jiang@windriver.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 8, 2012 at 4:31 AM, Jiang Lu <lu.jiang@windriver.com> wrote:
> To implement rootfs on mtd device with UBIFS, kernel need create a
> UBIFS device when booting:
>
> drivers/mtd/ubi/build.c ubi_init()
> for (i = 0; i < mtd_devs; i++) {
>         ...
>         mtd = open_mtd_device(p->name);
>         if (IS_ERR(mtd)) {
>                 err = PTR_ERR(mtd);
>                 goto out_detach;
>         }
>
>         ubi_attach_mtd_dev()
>         ...
> }
> module_init(ubi_init);
>
> Kernel can not create the UBIFS device without corresponding mtd
> partiton.
>
> Some NAND device can not guarenteen the mtd patition created before
> UBIFS deivce driver loading. Such as SPI NAND deivce, the mtd partition
> will create after SPI bus driver loaded.
>
> UBI device driver must load after other mtd device drivers to make sure
> the mtd partition already exist when creating UBI deivce.
>
> The patch updates the UBI device driver's initial routine to
> late_initcall level.
>
> Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
> ---
>  drivers/mtd/ubi/build.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index 0fde9fc..efbcaef 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -1275,7 +1275,7 @@ out:
>         ubi_err("UBI error: cannot initialize UBI, error %d", err);
>         return err;
>  }
> -module_init(ubi_init);
> +late_initcall(ubi_init);

Cant we use a simple initrd in such a case?
Within the initrd you can load the ubi module after your SPI NAND is done.

-- 
Thanks,
//richard
