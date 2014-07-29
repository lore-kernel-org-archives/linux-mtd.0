Received: from mail-vc0-x231.google.com ([2607:f8b0:400c:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XCAPD-00077t-N9
 for linux-mtd@lists.infradead.org; Tue, 29 Jul 2014 16:37:44 +0000
Received: by mail-vc0-f177.google.com with SMTP id hy4so14017909vcb.36
 for <linux-mtd@lists.infradead.org>; Tue, 29 Jul 2014 09:37:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53D768B5.6090409@huawei.com>
References: <53D7677A.6000905@huawei.com>
	<53D768B5.6090409@huawei.com>
Date: Tue, 29 Jul 2014 18:37:05 +0200
Message-ID: <CAFLxGvy6tYQnPMA2VKw8frfAQf7rN6jk72eDZ18n9sAp3Zq8XQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2] UBI: New ioctl() to support ubidump
From: Richard Weinberger <richard.weinberger@gmail.com>
To: hujianyang <hujianyang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Bill Pringlemeir <bpringlemeir@nbsps.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 29, 2014 at 11:26 AM, hujianyang <hujianyang@huawei.com> wrote:
> An ioctl() return pnum of a specified leb.
>
>
> Signed-off-by: hujianyang <hujianyang@huawei.com>
> ---
>  drivers/mtd/ubi/cdev.c      | 26 ++++++++++++++++++++++++++
>  include/uapi/mtd/ubi-user.h | 12 ++++++++++++
>  2 files changed, 38 insertions(+)
>
> diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
> index 7646220..6fa7346 100644
> --- a/drivers/mtd/ubi/cdev.c
> +++ b/drivers/mtd/ubi/cdev.c
> @@ -581,6 +581,32 @@ static long vol_cdev_ioctl(struct file *file, unsigned int cmd,
>                 break;
>         }
>
> +       /* Get pnum of a specified leb command */
> +       case UBI_IOCEBGETPNUM:
> +       {
> +               struct ubi_lnum2pnum_req req;
> +               int pnum;
> +
> +               err = copy_from_user(&req, argp,
> +                               sizeof(struct ubi_lnum2pnum_req));
> +               if (err) {
> +                       err = -EFAULT;
> +                       break;
> +               }
> +
> +               err = ubi_is_mapped(desc, req.lnum);
> +               if (err <= 0)
> +                       break;
> +               pnum = vol->eba_tbl[req.lnum];
> +               req.pnum = pnum;

Isn't this racy?
i.e. If a LEB change happens between ubi_is_mapped() and "pnum =
vol->eba_tbl[req.lnum]".

> +               err = copy_to_user(argp, &req,
> +                               sizeof(struct ubi_lnum2pnum_req));
> +               if (err)
> +                       err = -EFAULT;
> +               break;
> +       }
> +
>         default:
>                 err = -ENOTTY;
>                 break;
> diff --git a/include/uapi/mtd/ubi-user.h b/include/uapi/mtd/ubi-user.h
> index 1927b0d..fc41ddb 100644
> --- a/include/uapi/mtd/ubi-user.h
> +++ b/include/uapi/mtd/ubi-user.h
> @@ -205,6 +205,8 @@
>  #define UBI_IOCVOLCRBLK _IOW(UBI_VOL_IOC_MAGIC, 7, struct ubi_blkcreate_req)
>  /* Remove the R/O block device */
>  #define UBI_IOCVOLRMBLK _IO(UBI_VOL_IOC_MAGIC, 8)
> +/* Get pnum of a specified leb */
> +#define UBI_IOCEBGETPNUM _IOW(UBI_VOL_IOC_MAGIC, 9, struct ubi_lnum2pnum_req)
>
>  /* Maximum MTD device name length supported by UBI */
>  #define MAX_UBI_MTD_NAME_LEN 127
> @@ -442,4 +444,14 @@ struct ubi_blkcreate_req {
>         __s8  padding[128];
>  }  __packed;
>
> +/**
> + * struct ubi_lnum2pnum_req - a data structure used in lnum translate requests.
> + * @lnum: logical eraseblock num to translate
> + * @pnum: physical eraseblock num @lnum mapped
> + */
> +struct ubi_lnum2pnum_req {
> +       __s32 lnum;
> +       __s32 pnum;
> +}  __packed;
> +
>  #endif /* __UBI_USER_H__ */
> --
> 1.8.1.4
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Thanks,
//richard
