Received: from mail-ob0-x22d.google.com ([2607:f8b0:4003:c01::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ahkRm-00017K-Bt
 for linux-mtd@lists.infradead.org; Sun, 20 Mar 2016 20:59:39 +0000
Received: by mail-ob0-x22d.google.com with SMTP id fp4so160720025obb.2
 for <linux-mtd@lists.infradead.org>; Sun, 20 Mar 2016 13:59:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1458343511-11538-1-git-send-email-agruenba@redhat.com>
References: <1458343511-11538-1-git-send-email-agruenba@redhat.com>
Date: Sun, 20 Mar 2016 21:59:17 +0100
Message-ID: <CAFLxGvzuteirzq_jWQNCVxZZJ+qPDwaXWJPkh-V=hZbXCtWSBg@mail.gmail.com>
Subject: Re: [PATCH] ubifs: Remove unused header
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Mar 19, 2016 at 12:25 AM, Andreas Gruenbacher
<agruenba@redhat.com> wrote:
> UBIFS does not support POSIX ACLs, so there is no need for including any
> POSIX ACL hesders.
>
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>  fs/ubifs/xattr.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
> index c7f4d434..b043e04 100644
> --- a/fs/ubifs/xattr.c
> +++ b/fs/ubifs/xattr.c
> @@ -59,7 +59,6 @@
>  #include <linux/fs.h>
>  #include <linux/slab.h>
>  #include <linux/xattr.h>
> -#include <linux/posix_acl_xattr.h>
>
>  /*
>   * Limit the number of extended attributes per inode so that the total size
> --
> 2.4.3

Applied.

-- 
Thanks,
//richard
