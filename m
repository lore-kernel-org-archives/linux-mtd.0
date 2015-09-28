Received: from mail-ob0-x242.google.com ([2607:f8b0:4003:c01::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zgdyn-0002lZ-L3
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2015 19:20:54 +0000
Received: by obri8 with SMTP id i8so11764596obr.2
 for <linux-mtd@lists.infradead.org>; Mon, 28 Sep 2015 12:20:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1443452004-5831-1-git-send-email-bywxiaobai@163.com>
References: <1443446807-4838-1-git-send-email-bywxiaobai@163.com>
 <1443452004-5831-1-git-send-email-bywxiaobai@163.com>
Date: Mon, 28 Sep 2015 21:20:32 +0200
Message-ID: <CAFLxGvx=BTm4z2e5C=Fy6Hj7mF4Lqhvxe7j6EzsZhkPQqeHXrA@mail.gmail.com>
Subject: Re: [PATCH 17/17] fs/ubifs: remove unnecessary new_valid_dev check
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

On Mon, Sep 28, 2015 at 4:53 PM, Yaowei Bai <bywxiaobai@163.com> wrote:
> As new_valid_dev always returns 1, so new_valid_dev check is not
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
> index ee7cb5e..0197ed6 100644
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
> +       dev->huge = cpu_to_le64(huge_encode_dev(rdev));
> +       return sizeof(dev->huge);

Please be careful.

dev->new = cpu_to_le32(new_encode_dev(rdev));
return sizeof(dev->huge);

...is the correct branch. You enabled the dead one.

-- 
Thanks,
//richard
