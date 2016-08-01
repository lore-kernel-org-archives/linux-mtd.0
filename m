Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bU8xC-000654-MD
 for linux-mtd@lists.infradead.org; Mon, 01 Aug 2016 08:52:07 +0000
Received: by mail-wm0-x243.google.com with SMTP id q128so25211199wma.1
 for <linux-mtd@lists.infradead.org>; Mon, 01 Aug 2016 01:51:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1469994143-13977-1-git-send-email-richard@nod.at>
References: <1469994143-13977-1-git-send-email-richard@nod.at>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Mon, 1 Aug 2016 10:51:44 +0200
Message-ID: <CAHpGcMK9181WG9SzWYmPsh1ZdY-hMjga+4YG2D9sRS+7ywDp7A@mail.gmail.com>
Subject: Re: [PATCH] ubifs: Fix xattr generic handler usage
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, stable@vger.kernel.org,
 Andreas Gruenbacher <agruenba@redhat.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2016-07-31 21:42 GMT+02:00 Richard Weinberger <richard@nod.at>:
> UBIFS uses full names to work with xattrs, therefore we have to use
> xattr_full_name() to obtain the xattr prefix as string.
>
> Cc: <stable@vger.kernel.org>
> Cc: Andreas Gruenbacher <agruenba@redhat.com>
> Fixes: 2b88fc21ca ("ubifs: Switch to generic xattr handlers")
> Signed-off-by: Richard Weinberger <richard@nod.at>

Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>

> ---
>  fs/ubifs/xattr.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
> index b5fc279..c63710f 100644
> --- a/fs/ubifs/xattr.c
> +++ b/fs/ubifs/xattr.c
> @@ -575,7 +575,8 @@ static int ubifs_xattr_get(const struct xattr_handler *handler,
>         dbg_gen("xattr '%s', ino %lu ('%pd'), buf size %zd", name,
>                 inode->i_ino, dentry, size);
>
> -       return  __ubifs_getxattr(inode, name, buffer, size);
> +       name = xattr_full_name(handler, name);
> +       return __ubifs_getxattr(inode, name, buffer, size);
>  }
>
>  static int ubifs_xattr_set(const struct xattr_handler *handler,
> @@ -586,6 +587,8 @@ static int ubifs_xattr_set(const struct xattr_handler *handler,
>         dbg_gen("xattr '%s', host ino %lu ('%pd'), size %zd",
>                 name, inode->i_ino, dentry, size);
>
> +       name = xattr_full_name(handler, name);
> +
>         if (value)
>                 return __ubifs_setxattr(inode, name, value, size, flags);
>         else
> --
> 2.7.3
>
