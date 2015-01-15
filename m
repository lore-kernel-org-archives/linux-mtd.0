Received: from mail-ig0-x229.google.com ([2607:f8b0:4001:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBpVM-0002zR-Op
 for linux-mtd@lists.infradead.org; Thu, 15 Jan 2015 18:50:53 +0000
Received: by mail-ig0-f169.google.com with SMTP id z20so41454igj.0
 for <linux-mtd@lists.infradead.org>; Thu, 15 Jan 2015 10:50:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1421278927-3237-1-git-send-email-dehrenberg@chromium.org>
References: <1421278927-3237-1-git-send-email-dehrenberg@chromium.org>
Date: Thu, 15 Jan 2015 10:50:30 -0800
Message-ID: <CAAK6Zt20KwOYgcAm-_PCVove16hsgHbLwGFJdw1V5hD=X5n81w@mail.gmail.com>
Subject: Re: [PATCH] UBI: block: Export ubiblock major number
From: Daniel Ehrenberg <dehrenberg@google.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Grant Grundler <grundler@chromium.org>,
 Gwendal Grignou <gwendal@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dan Ehrenberg <dehrenberg@chromium.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Please ignore this patch. I've found a way to do achieve the same
thing for my without exporting the major number--I can just check
whether the block device's disk_name is ubiblock.

Thanks,
Dan

On Wed, Jan 14, 2015 at 3:42 PM, Dan Ehrenberg <dehrenberg@chromium.org> wrote:
> This patch exports the ubiblock major number so that it is usable from
> other pieces of kernel code. This is useful, for example, if you have
> another piece of kernel code which wants to determine whether a block
> device is an ubiblock device or not.
>
> Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
> ---
>  drivers/mtd/ubi/block.c | 3 ++-
>  include/linux/mtd/ubi.h | 2 ++
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
> index 6c8333d..faf35d4 100644
> --- a/drivers/mtd/ubi/block.c
> +++ b/drivers/mtd/ubi/block.c
> @@ -94,7 +94,8 @@ struct ubiblock {
>  /* Linked list of all ubiblock instances */
>  static LIST_HEAD(ubiblock_devices);
>  static DEFINE_MUTEX(devices_mutex);
> -static int ubiblock_major;
> +int ubiblock_major;
> +EXPORT_SYMBOL(ubiblock_major);
>
>  static int __init ubiblock_set_param(const char *val,
>                                      const struct kernel_param *kp)
> diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
> index c3918a0..8603d87 100644
> --- a/include/linux/mtd/ubi.h
> +++ b/include/linux/mtd/ubi.h
> @@ -230,4 +230,6 @@ static inline int ubi_read(struct ubi_volume_desc *desc, int lnum, char *buf,
>  {
>         return ubi_leb_read(desc, lnum, buf, offset, len, 0);
>  }
> +
> +extern int ubiblock_major;
>  #endif /* !__LINUX_UBI_H__ */
> --
> 2.2.0.rc0.207.ga3a616c
>
