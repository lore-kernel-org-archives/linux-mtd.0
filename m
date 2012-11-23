Received: from mail-ie0-f177.google.com ([209.85.223.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TbrvU-00021t-NT
 for linux-mtd@lists.infradead.org; Fri, 23 Nov 2012 12:00:12 +0000
Received: by mail-ie0-f177.google.com with SMTP id k13so1307805iea.36
 for <linux-mtd@lists.infradead.org>; Fri, 23 Nov 2012 04:00:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1353671885-2287-1-git-send-email-elezegarcia@gmail.com>
References: <1353671885-2287-1-git-send-email-elezegarcia@gmail.com>
Date: Fri, 23 Nov 2012 09:00:07 -0300
Message-ID: <CALF0-+VAhU096eheLABBLz+zzxGaxw8uXSUtA+=agv6oADLw8A@mail.gmail.com>
Subject: Re: [PATCH 4/5] ubi: Replace memcpy with struct assignment
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: Ezequiel Garcia <elezegarcia@gmail.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 23, 2012 at 8:58 AM, Ezequiel Garcia <elezegarcia@gmail.com> wrote:
> This kind of memcpy() is error-prone. Its replacement with a struct
> assignment is prefered because it's type-safe and much easier to read.
>
> Found by coccinelle. Hand patched and reviewed.
> Tested by compilation only.
>
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @@
> identifier struct_name;
> struct struct_name to;
> struct struct_name from;
> expression E;
> @@
> -memcpy(&(to), &(from), E);
> +to = from;
> // </smpl>
>
> Cc: Artem Bityutskiy <dedekind1@gmail.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
> Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
> ---
>  drivers/mtd/ubi/build.c |    3 +--
>  drivers/mtd/ubi/upd.c   |    6 ++----
>  drivers/mtd/ubi/vmt.c   |    2 +-
>  3 files changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index 344b4cb..fb59604 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -825,8 +825,7 @@ static int autoresize(struct ubi_device *ubi, int vol_id)
>                  * No available PEBs to re-size the volume, clear the flag on
>                  * flash and exit.
>                  */
> -               memcpy(&vtbl_rec, &ubi->vtbl[vol_id],
> -                      sizeof(struct ubi_vtbl_record));
> +               vtbl_rec = ubi->vtbl[vol_id];
>                 err = ubi_change_vtbl_record(ubi, vol_id, &vtbl_rec);
>                 if (err)
>                         ubi_err("cannot clean auto-resize flag for volume %d",
> diff --git a/drivers/mtd/ubi/upd.c b/drivers/mtd/ubi/upd.c
> index 9f2ebd8..ec2c2dc 100644
> --- a/drivers/mtd/ubi/upd.c
> +++ b/drivers/mtd/ubi/upd.c
> @@ -64,8 +64,7 @@ static int set_update_marker(struct ubi_device *ubi, struct ubi_volume *vol)
>                 return 0;
>         }
>
> -       memcpy(&vtbl_rec, &ubi->vtbl[vol->vol_id],
> -              sizeof(struct ubi_vtbl_record));
> +       vtbl_rec = ubi->vtbl[vol->vol_id];
>         vtbl_rec.upd_marker = 1;
>
>         mutex_lock(&ubi->device_mutex);
> @@ -93,8 +92,7 @@ static int clear_update_marker(struct ubi_device *ubi, struct ubi_volume *vol,
>
>         dbg_gen("clear update marker for volume %d", vol->vol_id);
>
> -       memcpy(&vtbl_rec, &ubi->vtbl[vol->vol_id],
> -              sizeof(struct ubi_vtbl_record));
> +       vtbl_rec = ubi->vtbl[vol->vol_id];
>         ubi_assert(vol->upd_marker && vtbl_rec.upd_marker);
>         vtbl_rec.upd_marker = 0;
>
> diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
> index 9169e58..99ef8a1 100644
> --- a/drivers/mtd/ubi/vmt.c
> +++ b/drivers/mtd/ubi/vmt.c
> @@ -535,7 +535,7 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs)
>         }
>
>         /* Change volume table record */
> -       memcpy(&vtbl_rec, &ubi->vtbl[vol_id], sizeof(struct ubi_vtbl_record));
> +       vtbl_rec = ubi->vtbl[vol_id];
>         vtbl_rec.reserved_pebs = cpu_to_be32(reserved_pebs);
>         err = ubi_change_vtbl_record(ubi, vol_id, &vtbl_rec);
>         if (err)
> --
> 1.7.8.6
>

Oops, subject says "[PATCH 4/5] ..." but this is not part of any series.

So patch subject should be:
"[PATCH] ubi: Replace memcpy with struct assignment"

Sorry,

    Ezequiel
