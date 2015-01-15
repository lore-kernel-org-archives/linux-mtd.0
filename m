Received: from mail-ie0-x235.google.com ([2607:f8b0:4001:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBpX0-00049t-PK
 for linux-mtd@lists.infradead.org; Thu, 15 Jan 2015 18:52:36 +0000
Received: by mail-ie0-f181.google.com with SMTP id rl12so16563692iec.12
 for <linux-mtd@lists.infradead.org>; Thu, 15 Jan 2015 10:52:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1421268043-7476-1-git-send-email-dehrenberg@chromium.org>
References: <1421268043-7476-1-git-send-email-dehrenberg@chromium.org>
Date: Thu, 15 Jan 2015 10:52:10 -0800
Message-ID: <CAAK6Zt1LuEcZ4NpDgRXDc-Jknv0pMCtM7u+CP+y6tY8CpuzUFQ@mail.gmail.com>
Subject: Re: [PATCH] UBI: block: Configurable device major number
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

Please ignore this patch. I've found a better way to achieve the same
thing--modify dm to accept paths like /dev/ubiblock3_0 (parsed the
same as root=) as arguments for the target, rather than only paths in
the filesystem and major:minor pairs.

Thanks,
Dan

On Wed, Jan 14, 2015 at 12:40 PM, Dan Ehrenberg <dehrenberg@chromium.org> wrote:
> By default UBI block devices use a dynamic major number. This
> config option can replace that with a static major number. Set
> to the new major number, or 0 for dynamic. This is useful if
> you want to use an ubiblock as the root filesystem in an
> indirect way, e.g., though DM and need to refer to it before
> userspace is up.
>
> Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
> ---
>  drivers/mtd/ubi/Kconfig | 13 +++++++++++++
>  drivers/mtd/ubi/block.c |  7 ++++++-
>  2 files changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
> index f0855ce..5ac8d63 100644
> --- a/drivers/mtd/ubi/Kconfig
> +++ b/drivers/mtd/ubi/Kconfig
> @@ -103,4 +103,17 @@ config MTD_UBI_BLOCK
>
>            If in doubt, say "N".
>
> +config MTD_UBI_BLOCK_MAJOR
> +       int "Major device number for UBI block devices"
> +       default 0
> +       range 0 256
> +       depends on MTD_UBI_BLOCK
> +       help
> +          By default UBI block devices use a dynamic major number. This
> +          config option can replace that with a static major number. Set
> +          to the new major number, or 0 for dynamic. This is useful if
> +          you want to use an ubiblock as the root filesystem in an
> +          indirect way, e.g., though DM and need to refer to it before
> +          userspace is up.
> +
>  endif # MTD_UBI
> diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
> index 6b6bce2..6c8333d 100644
> --- a/drivers/mtd/ubi/block.c
> +++ b/drivers/mtd/ubi/block.c
> @@ -635,9 +635,14 @@ int __init ubiblock_init(void)
>  {
>         int ret;
>
> -       ubiblock_major = register_blkdev(0, "ubiblock");
> +       ubiblock_major = register_blkdev(CONFIG_MTD_UBI_BLOCK_MAJOR,
> +                                        "ubiblock");
>         if (ubiblock_major < 0)
>                 return ubiblock_major;
> +       if (CONFIG_MTD_UBI_BLOCK_MAJOR) {
> +               BUG_ON(ubiblock_major);
> +               ubiblock_major = CONFIG_MTD_UBI_BLOCK_MAJOR;
> +       }
>
>         /* Attach block devices from 'block=' module param */
>         ret = ubiblock_create_from_param();
> --
> 2.2.0.rc0.207.ga3a616c
>
