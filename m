Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dYdzh-0007YH-GC
 for linux-mtd@lists.infradead.org; Fri, 21 Jul 2017 19:53:51 +0000
Received: by mail-wr0-x243.google.com with SMTP id p12so4958664wrc.5
 for <linux-mtd@lists.infradead.org>; Fri, 21 Jul 2017 12:53:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1496418222-23483-4-git-send-email-pali.rohar@gmail.com>
References: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
 <1496418222-23483-4-git-send-email-pali.rohar@gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 21 Jul 2017 21:53:26 +0200
Message-ID: <CAFLxGvxjUgj=R6h9suNf4+eXRRtomw-WshxKpW5H1QY3EE1=1g@mail.gmail.com>
Subject: Re: [PATCH 3/5] mtd: block2mtd: Fallback to read-only mode
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Joern Engel <joern@lazybastard.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pali,

On Fri, Jun 2, 2017 at 5:43 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wrot=
e:
> Sometimes block device is readonly (e.g. loopbacks). This patch allows
> block2mtd to fallback and create read-only MTD_ROM device instead of
> fatal failure.
>
> Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> ---
>  drivers/mtd/devices/block2mtd.c |   39 ++++++++++++++++++++++++++++++++-=
------
>  1 file changed, 32 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2=
mtd.c
> index 5ba5fad..ad96937 100644
> --- a/drivers/mtd/devices/block2mtd.c
> +++ b/drivers/mtd/devices/block2mtd.c
> @@ -38,6 +38,7 @@ struct block2mtd_dev {
>         struct block_device *blkdev;
>         struct mtd_info mtd;
>         struct mutex write_mutex;
> +       bool ro_mode;
>  };
>
>
> @@ -212,7 +213,10 @@ static void block2mtd_free_device(struct block2mtd_d=
ev *dev)
>         if (dev->blkdev) {
>                 invalidate_mapping_pages(dev->blkdev->bd_inode->i_mapping=
,
>                                         0, -1);
> -               blkdev_put(dev->blkdev, FMODE_READ|FMODE_WRITE|FMODE_EXCL=
);
> +               if (dev->ro_mode)
> +                       blkdev_put(dev->blkdev, FMODE_READ);
> +               else
> +                       blkdev_put(dev->blkdev, FMODE_READ|FMODE_WRITE|FM=
ODE_EXCL);
>         }
>
>         kfree(dev);
> @@ -240,6 +244,13 @@ static struct block2mtd_dev *add_device(char *devnam=
e, uint32_t erase_size,
>         /* Get a handle on the device */
>         bdev =3D blkdev_get_by_path(devname, mode, dev);
>
> +       /* Try fallback to read only mode */
> +       if (IS_ERR(bdev)) {
> +               bdev =3D blkdev_get_by_path(devname, FMODE_READ, dev);
> +               if (!IS_ERR(bdev))
> +                       dev->ro_mode =3D true;
> +       }
> +

Please use bdev_read_only() instead of blindly trying again with another mo=
de.

>  #ifndef MODULE
>         /*
>          * We might not have the root device mounted at this point.
> @@ -261,6 +272,13 @@ static struct block2mtd_dev *add_device(char *devnam=
e, uint32_t erase_size,
>                 if (!devt)
>                         continue;
>                 bdev =3D blkdev_get_by_dev(devt, mode, dev);
> +
> +               /* Try fallback to read only mode */
> +               if (IS_ERR(bdev)) {
> +                       bdev =3D blkdev_get_by_path(devname, FMODE_READ, =
dev);
> +                       if (!IS_ERR(bdev))
> +                               dev->ro_mode =3D true;
> +               }

Same here.

>         }
>  #endif
>
> @@ -295,16 +313,22 @@ static struct block2mtd_dev *add_device(char *devna=
me, uint32_t erase_size,
>
>         dev->mtd.name =3D name;
>
> +       if (dev->ro_mode) {
> +               dev->mtd.type =3D MTD_ROM;
> +               dev->mtd.flags =3D MTD_CAP_ROM;
> +       } else {
> +               dev->mtd.type =3D MTD_RAM;
> +               dev->mtd.flags =3D MTD_CAP_RAM;
> +               dev->mtd._erase =3D block2mtd_erase;
> +               dev->mtd._write =3D block2mtd_write;
> +               dev->mtd._sync =3D block2mtd_sync;
> +       }
> +
>         dev->mtd.size =3D dev->blkdev->bd_inode->i_size & PAGE_MASK;
>         dev->mtd.erasesize =3D erase_size;
>         dev->mtd.writesize =3D write_size;
>         dev->mtd.subpage_sft =3D subpage_sft;
>         dev->mtd.writebufsize =3D PAGE_SIZE;
> -       dev->mtd.type =3D MTD_RAM;
> -       dev->mtd.flags =3D MTD_CAP_RAM;
> -       dev->mtd._erase =3D block2mtd_erase;
> -       dev->mtd._write =3D block2mtd_write;
> -       dev->mtd._sync =3D block2mtd_sync;
>         dev->mtd._read =3D block2mtd_read;
>         dev->mtd.priv =3D dev;
>         dev->mtd.owner =3D THIS_MODULE;
> @@ -315,9 +339,10 @@ static struct block2mtd_dev *add_device(char *devnam=
e, uint32_t erase_size,
>         }
>
>         list_add(&dev->list, &blkmtd_device_list);
> -       pr_info("mtd%d: [%s] erase_size =3D %dKiB [%d], write_size =3D %d=
KiB [%d], subpage_sft =3D %d\n",
> +       pr_info("mtd%d: [%s] mode =3D %s, erase_size =3D %dKiB [%d], writ=
e_size =3D %dKiB [%d], subpage_sft =3D %d\n",
>                 dev->mtd.index,
>                 dev->mtd.name + strlen("block2mtd: "),
> +               (dev->ro_mode ? "RO" : "R/W"),
>                 dev->mtd.erasesize >> 10, dev->mtd.erasesize,
>                 dev->mtd.writesize >> 10, dev->mtd.writesize,
>                 dev->mtd.subpage_sft);
> --
> 1.7.9.5
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



--=20
Thanks,
//richard
