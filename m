Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dwldD-0002m1-8e
 for linux-mtd@lists.infradead.org; Tue, 26 Sep 2017 08:54:21 +0000
Received: by mail-wr0-x244.google.com with SMTP id g50so1914300wra.3
 for <linux-mtd@lists.infradead.org>; Tue, 26 Sep 2017 01:53:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1506401697-449-1-git-send-email-hyc.lee@gmail.com>
References: <1506401697-449-1-git-send-email-hyc.lee@gmail.com>
From: Hyeoncheol Lee <hyc.lee@gmail.com>
Date: Tue, 26 Sep 2017 17:53:56 +0900
Message-ID: <CANFS6bZsHW_XFoKdwLs9+8vpWxVtRff9T_OCYX43nHcUFBwrOA@mail.gmail.com>
Subject: Re: [PATCH] ubi: Remove ubi_io_is_bad call from scan_peb
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>
Cc: kernel-team@lge.com, linux-mtd@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, Hyunchul Lee <cheol.lee@lge.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Please, ignore this patch. I made a mistake.
while headers are read, ubi_io_is_bad is called only when chk_io is true.

2017-09-26 13:54 GMT+09:00 Hyunchul Lee <hyc.lee@gmail.com>:
> From: Hyunchul Lee <cheol.lee@lge.com>
>
> When erase count and volume identifier headers are read,
> ubi_io_is_bad is called. So instead of calling ubi_io_is_bad
> from scan_peb, use the result.
>
> this patch reduces the attach time by about 15% in my
> environment.
>
> ARMv7 1GHZ based board, 66.8MiB MTD partition
>                 before          after
> attach time     308.365 usec    257.100 usec
>
> Signed-off-by: Hyunchul Lee <cheol.lee@lge.com>
> ---
>  drivers/mtd/ubi/attach.c | 15 ++++++---------
>  drivers/mtd/ubi/io.c     |  9 ++++++---
>  drivers/mtd/ubi/ubi.h    |  2 ++
>  3 files changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
> index 93ceea4..07b9162 100644
> --- a/drivers/mtd/ubi/attach.c
> +++ b/drivers/mtd/ubi/attach.c
> @@ -962,15 +962,6 @@ static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai,
>
>         dbg_bld("scan PEB %d", pnum);
>
> -       /* Skip bad physical eraseblocks */
> -       err = ubi_io_is_bad(ubi, pnum);
> -       if (err < 0)
> -               return err;
> -       else if (err) {
> -               ai->bad_peb_count += 1;
> -               return 0;
> -       }
> -
>         err = ubi_io_read_ec_hdr(ubi, pnum, ech, 0);
>         if (err < 0)
>                 return err;
> @@ -999,6 +990,9 @@ static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai,
>                 ec = UBI_UNKNOWN;
>                 bitflips = 1;
>                 break;
> +       case UBI_IO_BAD_BLK:
> +               ai->bad_peb_count += 1;
> +               return 0;
>         default:
>                 ubi_err(ubi, "'ubi_io_read_ec_hdr()' returned unknown code %d",
>                         err);
> @@ -1136,6 +1130,9 @@ static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai,
>                 if (err)
>                         return err;
>                 goto adjust_mean_ec;
> +       case UBI_IO_BAD_BLK:
> +               ai->bad_peb_count += 1;
> +               return 0;
>         default:
>                 ubi_err(ubi, "'ubi_io_read_vid_hdr()' returned unknown code %d",
>                         err);
> diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
> index 8290432..ae52e7e 100644
> --- a/drivers/mtd/ubi/io.c
> +++ b/drivers/mtd/ubi/io.c
> @@ -117,6 +117,7 @@ static int self_check_write(struct ubi_device *ubi, const void *buf, int pnum,
>   * o %UBI_IO_BITFLIPS if all the requested data were successfully read, but
>   *   correctable bit-flips were detected; this is harmless but may indicate
>   *   that this eraseblock may become bad soon (but do not have to);
> + * o %UBI_IO_BAD_BLK if the erabse block is bad
>   * o %-EBADMSG if the MTD subsystem reported about data integrity problems, for
>   *   example it can be an ECC error in case of NAND; this most probably means
>   *   that the data is corrupted;
> @@ -137,7 +138,9 @@ int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
>         ubi_assert(len > 0);
>
>         err = self_check_not_bad(ubi, pnum);
> -       if (err)
> +       if (err == -EBADSLT)
> +               return UBI_IO_BAD_BLK;
> +       else if (err)
>                 return err;
>
>         /*
> @@ -1131,7 +1134,7 @@ int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
>   * @ubi: UBI device description object
>   * @pnum: physical eraseblock number to check
>   *
> - * This function returns zero if the physical eraseblock is good, %-EINVAL if
> + * This function returns zero if the physical eraseblock is good, %-EBADSLT if
>   * it is bad and a negative error code if an error occurred.
>   */
>  static int self_check_not_bad(const struct ubi_device *ubi, int pnum)
> @@ -1147,7 +1150,7 @@ static int self_check_not_bad(const struct ubi_device *ubi, int pnum)
>
>         ubi_err(ubi, "self-check failed for PEB %d", pnum);
>         dump_stack();
> -       return err > 0 ? -EINVAL : err;
> +       return err > 0 ? -EBADSLT : err;
>  }
>
>  /**
> diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
> index 5fe6265..5c5207d 100644
> --- a/drivers/mtd/ubi/ubi.h
> +++ b/drivers/mtd/ubi/ubi.h
> @@ -107,6 +107,7 @@
>   *                         data integrity error reported by the MTD driver
>   *                         (uncorrectable ECC error in case of NAND)
>   * UBI_IO_BITFLIPS: bit-flips were detected and corrected
> + * UBI_IO_BAD_BLK: bad erase block
>   *
>   * Note, it is probably better to have bit-flip and ebadmsg as flags which can
>   * be or'ed with other error code. But this is a big change because there are
> @@ -118,6 +119,7 @@ enum {
>         UBI_IO_BAD_HDR,
>         UBI_IO_BAD_HDR_EBADMSG,
>         UBI_IO_BITFLIPS,
> +       UBI_IO_BAD_BLK,
>  };
>
>  /*
> --
> 1.9.1
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
