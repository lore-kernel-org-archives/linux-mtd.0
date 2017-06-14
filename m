Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dLAdm-0006pN-7n
 for linux-mtd@lists.infradead.org; Wed, 14 Jun 2017 15:55:33 +0000
Received: by mail-ot0-x244.google.com with SMTP id k4so468329otd.0
 for <linux-mtd@lists.infradead.org>; Wed, 14 Jun 2017 08:55:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3b8362cf-da22-fbb0-de80-9f9bf8ec4326@huawei.com>
References: <58B689F1.3000000@huawei.com>
 <3b8362cf-da22-fbb0-de80-9f9bf8ec4326@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 14 Jun 2017 17:55:04 +0200
Message-ID: <CAFLxGvyL_=kmym7AM-d_VPDXFi9ToZp44yXUxQmaQzmk+yX_pQ@mail.gmail.com>
Subject: Re: [PATCH] fs/jffs2: Fix a Invalid argument error when mkdir in
 jffs2 which is mounted as overlayfs
To: yangshukui <yangshukui@huawei.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

.yangshukui,

On Wed, Jun 14, 2017 at 8:30 AM, yangshukui <yangshukui@huawei.com> wrote:
> In jffs2 filesystem, I mount a overlayfs, after rmdir  and mkdir, 'Invalid
> argument' error will appear.
> It can be reproduced like this,
>
> [root@localhost mnt]# mkdir -p overlay-mkdir
> [root@localhost overlay-mkdir]# pwd;mount|grep jffs2
> /root/mnt/overlay-mkdir
> /dev/mtdblock0 on /root/mnt type jffs2 (rw,relatime)
>
> [root@localhost mnt]# cd overlay-mkdir/
> [root@localhost overlay-mkdir]# mkdir -p merged  lower/hello  upper work
> [root@localhost overlay-mkdir]# mount -t overlay overlay
> -olowerdir=lower,upperdir=upper,workdir=work merged
> [root@localhost overlay-mkdir]# rmdir merged/hello
> [root@localhost overlay-mkdir]# mkdir merged/hello
> mkdir: cannot create directory merged/hello Invalid argument
>
> From: Shukui Yang <yangshukui@huawei.com>
> Date: Wed, 14 Jun 2017 14:03:51 +0800
> Subject: [PATCH] fs/jffs2: fix a Invalid argument error when mkdir in jffs2
> which is
>  mounted as overlayfs
>
> Signed-off-by:  Shukui Yang <yangshukui@huawei.com>
> ---
>  fs/jffs2/dir.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
> index cfbceb1..9a95d98 100644
> --- a/fs/jffs2/dir.c
> +++ b/fs/jffs2/dir.c
> @@ -34,8 +34,8 @@ static int jffs2_symlink (struct inode *,struct dentry
> *,const char *);
>  static int jffs2_mkdir (struct inode *,struct dentry *,umode_t);
>  static int jffs2_rmdir (struct inode *,struct dentry *);
>  static int jffs2_mknod (struct inode *,struct dentry *,umode_t,dev_t);
> -static int jffs2_rename (struct inode *, struct dentry *,
> -                        struct inode *, struct dentry *);
> +static int jffs2_rename2 (struct inode *, struct dentry *,
> +                        struct inode *, struct dentry *, unsigned int);
>
>  const struct file_operations jffs2_dir_operations =
>  {
> @@ -57,7 +57,7 @@ const struct inode_operations jffs2_dir_inode_operations =
>         .mkdir =        jffs2_mkdir,
>         .rmdir =        jffs2_rmdir,
>         .mknod =        jffs2_mknod,
> -       .rename =       jffs2_rename,
> +       .rename2 =      jffs2_rename2,

->rename2 is no longer available, did you develop against an old kernel?

>         .get_acl =      jffs2_get_acl,
>         .set_acl =      jffs2_set_acl,
>         .setattr =      jffs2_setattr,
> @@ -865,3 +865,8 @@ static int jffs2_rename (struct inode *old_dir_i, struct
> dentry *old_dentry,
>         return 0;
>  }
>
> +static int jffs2_rename2 (struct inode *old_dir_i, struct dentry
> *old_dentry,
> +                        struct inode *new_dir_i, struct dentry *new_dentry,
> unsigned int flags)
> +{
> +       return jffs2_rename(old_dir_i, old_dentry, new_dir_i, new_dentry);
> +}

I fear this is not correct. You cannot ignore rename flags.
For proper overlayfs support you need to implement RENAME_WHITEOUT
and RENAME_EXCHANGE features.

-- 
Thanks,
//richard
