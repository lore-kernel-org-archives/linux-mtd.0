Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ew5ui-0002ly-7L
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2018 12:53:53 +0000
Received: by mail-wm0-x22e.google.com with SMTP id x7so3820595wmc.0
 for <linux-mtd@lists.infradead.org>; Wed, 14 Mar 2018 05:53:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <22711116.lYnEpaWOtA@blindfold>
References: <CWLP265MB0721344DBE1B7785E7D2C6A5D2DE0@CWLP265MB0721.GBRP265.PROD.OUTLOOK.COM>
 <22711116.lYnEpaWOtA@blindfold>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 14 Mar 2018 13:53:39 +0100
Message-ID: <CAFLxGvzZNYiqQy2GnkyOfcZ+fnx1SVisVc=ntL90vk1gFf2YyA@mail.gmail.com>
Subject: Re: power loss results in mounting failure on SLC NAND
To: Richard Weinberger <richard@nod.at>
Cc: martin bayern <martinbayern@outlook.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
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

On Fri, Mar 9, 2018 at 9:12 PM, Richard Weinberger <richard@nod.at> wrote:
> Martin,
>
> Am Freitag, 9. M=C3=A4rz 2018, 20:39:27 CET schrieb martin bayern:
>> Hi
>>
>> I encountered one issue on my board during power loss immunity testing. =
It
>> has SLC Nand and Linux 4.2. From my initial analysis, seems the issue is
>> related to fastmap.
>>
>> When disabling fastmap, the corrupted PEB, which was damaged by power-cu=
t
>> when erasing it, can be re-erased during Ubi attaching. So, in the end, =
I
>> can=E2=80=99t see mounting failure.
>>
>> But, if enable fastmap, I will see mounting failure.
>>
>> I tracked Ubi source code, during attaching, Ubi will scan every PEB, an=
d
>> read EC&Vid pages if both pages are damaged, will erase it later due to
>> uncompleted erase before.  While for the fastmap case, it doesn=E2=80=99=
t scan each
>> PEB, so, maybe it will miss re-erase corrupted PEB?
>
> So, in this case the upper layer, namely UBIFS, will be unhappy because i=
t
> cannot deal with the ECC error, right?
> I fear fastmap changed the semantics of UBI a bit and UBIFS trips over th=
at.
>
> Does the following patch make UBIFS happy again?
> If so, we need to improve it further, to be more smart and check every ma=
pping
> only once.
>
> diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
> index 250e30fac61b..617742948442 100644
> --- a/drivers/mtd/ubi/eba.c
> +++ b/drivers/mtd/ubi/eba.c
> @@ -490,6 +490,37 @@ int ubi_eba_unmap_leb(struct ubi_device *ubi, struct
> ubi_volume *vol,
>         return err;
>  }
>
> +int fixup_mapping(struct ubi_device *ubi, struct ubi_volume *vol, int ln=
um,
> int *pnum)
> +{
> +       int err;
> +       struct ubi_vid_io_buf *vidb;
> +
> +       if (!ubi->fast_attach)
> +               return 0;
> +
> +       vidb =3D ubi_alloc_vid_buf(ubi, GFP_NOFS);
> +       if (!vidb)
> +               return -ENOMEM;
> +
> +       err =3D ubi_io_read_vid_hdr(ubi, *pnum, vidb, 0);
> +       if (err > 0 && err !=3D UBI_IO_BITFLIPS) {
> +               int torture =3D 0;
> +
> +               if (err =3D=3D UBI_IO_BAD_HDR_EBADMSG || err =3D=3D UBI_I=
O_FF_BITFLIPS)
> +                       torture =3D 1;
> +
> +               down_read(&ubi->fm_eba_sem);
> +               vol->eba_tbl->entries[lnum].pnum =3D UBI_LEB_UNMAPPED;
> +               up_read(&ubi->fm_eba_sem);
> +               ubi_wl_put_peb(ubi, vol->vol_id, lnum, *pnum, torture);
> +
> +               *pnum =3D -1;
> +       }
> +
> +       ubi_free_vid_buf(vidb);
> +       return 0;
> +}
> +
>  /**
>   * ubi_eba_read_leb - read data.
>   * @ubi: UBI device description object
> @@ -522,6 +553,13 @@ int ubi_eba_read_leb(struct ubi_device *ubi, struct
> ubi_volume *vol, int lnum,
>                 return err;
>
>         pnum =3D vol->eba_tbl->entries[lnum].pnum;
> +
> +       if (pnum >=3D 0) {
> +               err =3D fixup_mapping(ubi, vol, lnum, &pnum);
> +               if (err < 0)
> +                       goto out_unlock;
> +       }
> +
>         if (pnum < 0) {
>                 /*
>                  * The logical eraseblock is not mapped, fill the whole b=
uffer
> @@ -931,6 +969,12 @@ int ubi_eba_write_leb(struct ubi_device *ubi, struct
> ubi_volume *vol, int lnum,
>
>         pnum =3D vol->eba_tbl->entries[lnum].pnum;
>         if (pnum >=3D 0) {
> +               err =3D fixup_mapping(ubi, vol, lnum, &pnum);
> +               if (err < 0)
> +                       goto out;
> +       }
> +
> +       if (pnum >=3D 0) {
>                 dbg_eba("write %d bytes at offset %d of LEB %d:%d, PEB %d=
",
>                         len, offset, vol_id, lnum, pnum);
>

Did this help?

--=20
Thanks,
//richard
