Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGVUI-0003jR-3t
 for linux-mtd@lists.infradead.org; Fri, 24 Jun 2016 18:05:55 +0000
Received: by mail-wm0-x22b.google.com with SMTP id f126so31267216wma.1
 for <linux-mtd@lists.infradead.org>; Fri, 24 Jun 2016 11:05:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1466703038-13044-1-git-send-email-richard@nod.at>
References: <1466703038-13044-1-git-send-email-richard@nod.at>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 24 Jun 2016 15:05:31 -0300
Message-ID: <CAAEAJfC4jKniYR=Y609_O3vfufoQFFamrgRXc33UuW4jLaTE4g@mail.gmail.com>
Subject: Re: [PATCH] ubi: Make volume resize power cut aware
To: Richard Weinberger <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, stable@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi guys,

I have a few questions.

On 23 June 2016 at 14:30, Richard Weinberger <richard@nod.at> wrote:
> When the volume resize operation shrinks a volume,
> LEBs will be unmapped. Since unmapping will not erase these
> LEBs immediately we have to wait for that operation to finish.
> Otherwise in case of a power cut right after writing the new
> volume table the UBI attach process can find more LEBs than the
> volume table knows. This will render the UBI image unattachable.
>
> Fix this issue by waiting for erase to complete and write the new volume =
table afterward.
>
> Cc: <stable@vger.kernel.org>
> Reported-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mtd/ubi/vmt.c | 25 ++++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
> index 10059df..0138f52 100644
> --- a/drivers/mtd/ubi/vmt.c
> +++ b/drivers/mtd/ubi/vmt.c
> @@ -488,13 +488,6 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, =
int reserved_pebs)
>                 spin_unlock(&ubi->volumes_lock);
>         }
>
> -       /* Change volume table record */
> -       vtbl_rec =3D ubi->vtbl[vol_id];
> -       vtbl_rec.reserved_pebs =3D cpu_to_be32(reserved_pebs);
> -       err =3D ubi_change_vtbl_record(ubi, vol_id, &vtbl_rec);
> -       if (err)
> -               goto out_acc;
> -
>         if (pebs < 0) {
>                 for (i =3D 0; i < -pebs; i++) {
>                         err =3D ubi_eba_unmap_leb(ubi, vol, reserved_pebs=
 + i);
> @@ -512,6 +505,24 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, =
int reserved_pebs)
>                 spin_unlock(&ubi->volumes_lock);
>         }
>
> +       /*
> +        * When we shrink a volume we have to flush all pending (erase) w=
ork.
> +        * Otherwise it can happen that upon next attach UBI finds a LEB =
with
> +        * lnum > highest_lnum and refuses to attach.
> +        */
> +       if (pebs < 0) {
> +               err =3D ubi_wl_flush(ubi, vol_id, UBI_ALL);
> +               if (err)
> +                       goto out_acc;
> +       }
> +

What will happen if the power-cut happens right here,
before the volume table is written?

> +       /* Change volume table record */
> +       vtbl_rec =3D ubi->vtbl[vol_id];
> +       vtbl_rec.reserved_pebs =3D cpu_to_be32(reserved_pebs);
> +       err =3D ubi_change_vtbl_record(ubi, vol_id, &vtbl_rec);
> +       if (err)
> +               goto out_acc;
> +
>         vol->reserved_pebs =3D reserved_pebs;
>         if (vol->vol_type =3D=3D UBI_DYNAMIC_VOLUME) {
>                 vol->used_ebs =3D reserved_pebs;


Also, should we have a similar change for ubi_remove_volume?
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
