Received: from mail-ob0-x22c.google.com ([2607:f8b0:4003:c01::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhCUE-0001WE-KF
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2015 08:11:39 +0000
Received: by obbda8 with SMTP id da8so25580754obb.1
 for <linux-mtd@lists.infradead.org>; Wed, 30 Sep 2015 01:11:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1443535053-4673-1-git-send-email-bywxiaobai@163.com>
References: <1443446807-4838-1-git-send-email-bywxiaobai@163.com>
 <1443535053-4673-1-git-send-email-bywxiaobai@163.com>
Date: Wed, 30 Sep 2015 10:11:17 +0200
Message-ID: <CAFLxGvwdvW8k07ENLQP7PyXrznVf0UKsnZMUCGahULqsDrgfGQ@mail.gmail.com>
Subject: Re: [PATCH] fs/ubifs: remove unnecessary new_valid_dev check
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Yaowei Bai <bywxiaobai@163.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 29, 2015 at 3:57 PM, Yaowei Bai <bywxiaobai@163.com> wrote:
> As currently new_valid_dev always returns 1, so new_valid_dev check is not
> needed, remove it.
>
> Signed-off-by: Yaowei Bai <bywxiaobai@163.com>
> ---
>  fs/ubifs/dir.c  | 3 ---
>  fs/ubifs/misc.h | 9 ++-------
>  2 files changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index 5c27c66..1dd9267 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -787,9 +787,6 @@ static int ubifs_mknod(struct inode *dir, struct dentry *dentry,
>
>         dbg_gen("dent '%pd' in dir ino %lu", dentry, dir->i_ino);
>
> -       if (!new_valid_dev(rdev))
> -               return -EINVAL;
> -
>         if (S_ISBLK(mode) || S_ISCHR(mode)) {
>                 dev = kmalloc(sizeof(union ubifs_dev_desc), GFP_NOFS);
>                 if (!dev)
> diff --git a/fs/ubifs/misc.h b/fs/ubifs/misc.h
> index ee7cb5e..8ece6ca 100644
> --- a/fs/ubifs/misc.h
> +++ b/fs/ubifs/misc.h
> @@ -155,13 +155,8 @@ static inline int ubifs_wbuf_sync(struct ubifs_wbuf *wbuf)
>   */
>  static inline int ubifs_encode_dev(union ubifs_dev_desc *dev, dev_t rdev)
>  {
> -       if (new_valid_dev(rdev)) {
> -               dev->new = cpu_to_le32(new_encode_dev(rdev));
> -               return sizeof(dev->new);
> -       } else {
> -               dev->huge = cpu_to_le64(huge_encode_dev(rdev));
> -               return sizeof(dev->huge);
> -       }
> +       dev->new = cpu_to_le32(new_encode_dev(rdev));
> +       return sizeof(dev->new);
>  }

Reviewed-by: Richard Weinberger <richard@nod.at>

-- 
Thanks,
//richard
