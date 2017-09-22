Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dvJJr-0002ng-Si
 for linux-mtd@lists.infradead.org; Fri, 22 Sep 2017 08:28:21 +0000
Received: by mail-wm0-x243.google.com with SMTP id r136so582013wmf.3
 for <linux-mtd@lists.infradead.org>; Fri, 22 Sep 2017 01:27:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1506045694-19648-1-git-send-email-clay@daemons.net>
References: <1506045694-19648-1-git-send-email-clay@daemons.net>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 22 Sep 2017 10:27:57 +0200
Message-ID: <CAFLxGvySYo1GR=PCxKL9gO4WPjFEPoLDYv0ifcRxxdkEJA6GUA@mail.gmail.com>
Subject: Re: [PATCH] ubi: Fix race condition between ubi volume creation and
 udev
To: Clay McClure <clay@daemons.net>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 22, 2017 at 4:01 AM, Clay McClure <clay@daemons.net> wrote:
> Similar to commit 714fb87e8bc0 ("ubi: Fix race condition between ubi
> device creation and udev"), we should make the volume active before
> registering it.
>
> Signed-off-by: Clay McClure <clay@daemons.net>
> ---
>  drivers/mtd/ubi/vmt.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
> index 85237cf661f9..3fd8d7ff7a02 100644
> --- a/drivers/mtd/ubi/vmt.c
> +++ b/drivers/mtd/ubi/vmt.c
> @@ -270,6 +270,12 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
>                         vol->last_eb_bytes = vol->usable_leb_size;
>         }
>
> +       /* Make volume "available" before it becomes accessible via sysfs */
> +       spin_lock(&ubi->volumes_lock);
> +       ubi->volumes[vol_id] = vol;
> +       ubi->vol_count += 1;
> +       spin_unlock(&ubi->volumes_lock);
> +
>         /* Register character device for the volume */
>         cdev_init(&vol->cdev, &ubi_vol_cdev_operations);
>         vol->cdev.owner = THIS_MODULE;
> @@ -298,11 +304,6 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
>         if (err)
>                 goto out_sysfs;
>
> -       spin_lock(&ubi->volumes_lock);
> -       ubi->volumes[vol_id] = vol;
> -       ubi->vol_count += 1;
> -       spin_unlock(&ubi->volumes_lock);
> -
>         ubi_volume_notify(ubi, vol, UBI_VOLUME_ADDED);
>         self_check_volumes(ubi);
>         return err;
> @@ -315,6 +316,10 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
>          */
>         cdev_device_del(&vol->cdev, &vol->dev);
>  out_mapping:
> +       spin_lock(&ubi->volumes_lock);
> +       ubi->volumes[vol_id] = NULL;
> +       ubi->vol_count -= 1;
> +       spin_unlock(&ubi->volumes_lock);
>         ubi_eba_destroy_table(eba_tbl);
>  out_acc:
>         spin_lock(&ubi->volumes_lock);
> --

Uhh, yes. Thanks for catching this!

-- 
Thanks,
//richard
