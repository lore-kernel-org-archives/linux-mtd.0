Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2okC-0004VF-Kj
 for linux-mtd@lists.infradead.org; Thu, 20 Sep 2018 02:31:06 +0000
Received: by mail-qk1-x742.google.com with SMTP id p84-v6so3973251qke.1
 for <linux-mtd@lists.infradead.org>; Wed, 19 Sep 2018 19:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20180916215735.31393-1-richard@nod.at>
In-Reply-To: <20180916215735.31393-1-richard@nod.at>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 20 Sep 2018 12:00:41 +0930
Message-ID: <CACPK8Xd_fNNEYbtY6HEnB6kOnqTWBC5stPVUbc2gMHpne4J6jQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "ubifs: xattr: Don't operate on deleted inodes"
To: Richard Weinberger <richard@nod.at>, Greg KH <gregkh@linuxfoundation.org>
Cc: linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 koen.vandeputte@ncentric.com, Eddie James <eajames.ibm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 17 Sep 2018 at 07:30, Richard Weinberger <richard@nod.at> wrote:
>
> This reverts commit 11a6fc3dc743e22fb50f2196ec55bee5140d3c52.
> UBIFS wants to assert that xattr operations are only issued on files
> with positive link count. The said patch made this operations return
> -ENOENT for unlinked files such that the asserts will no longer trigger.
> This was wrong since xattr operations are perfectly fine on unlinked
> files.
> Instead the assertions need to be fixed/removed.
>
> Cc: <stable@vger.kernel.org>
> Fixes: 11a6fc3dc743 ("ubifs: xattr: Don't operate on deleted inodes")
> Reported-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
> Signed-off-by: Richard Weinberger <richard@nod.at>

The bad commit 11a6fc3dc743 was included in 4.18.7, and broke our
systems which use overlayfs on top of ubifs.

This patch didn't apply cleanly for me to 4.18.8 (an encoding issue?),
but I did a revert of the offending commit which did the trick.

Tested-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel


> ---
>  fs/ubifs/xattr.c | 24 ------------------------
>  1 file changed, 24 deletions(-)
>
> diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
> index 61afdfee4b28..f5ad1ede7990 100644
> --- a/fs/ubifs/xattr.c
> +++ b/fs/ubifs/xattr.c
> @@ -152,12 +152,6 @@ static int create_xattr(struct ubifs_info *c, struct inode *host,
>         ui->data_len = size;
>
>         mutex_lock(&host_ui->ui_mutex);
> -
> -       if (!host->i_nlink) {
> -               err = -ENOENT;
> -               goto out_noent;
> -       }
> -
>         host->i_ctime = current_time(host);
>         host_ui->xattr_cnt += 1;
>         host_ui->xattr_size += CALC_DENT_SIZE(fname_len(nm));
> @@ -190,7 +184,6 @@ static int create_xattr(struct ubifs_info *c, struct inode *host,
>         host_ui->xattr_size -= CALC_XATTR_BYTES(size);
>         host_ui->xattr_names -= fname_len(nm);
>         host_ui->flags &= ~UBIFS_CRYPT_FL;
> -out_noent:
>         mutex_unlock(&host_ui->ui_mutex);
>  out_free:
>         make_bad_inode(inode);
> @@ -242,12 +235,6 @@ static int change_xattr(struct ubifs_info *c, struct inode *host,
>         mutex_unlock(&ui->ui_mutex);
>
>         mutex_lock(&host_ui->ui_mutex);
> -
> -       if (!host->i_nlink) {
> -               err = -ENOENT;
> -               goto out_noent;
> -       }
> -
>         host->i_ctime = current_time(host);
>         host_ui->xattr_size -= CALC_XATTR_BYTES(old_size);
>         host_ui->xattr_size += CALC_XATTR_BYTES(size);
> @@ -269,7 +256,6 @@ static int change_xattr(struct ubifs_info *c, struct inode *host,
>  out_cancel:
>         host_ui->xattr_size -= CALC_XATTR_BYTES(size);
>         host_ui->xattr_size += CALC_XATTR_BYTES(old_size);
> -out_noent:
>         mutex_unlock(&host_ui->ui_mutex);
>         make_bad_inode(inode);
>  out_free:
> @@ -496,12 +482,6 @@ static int remove_xattr(struct ubifs_info *c, struct inode *host,
>                 return err;
>
>         mutex_lock(&host_ui->ui_mutex);
> -
> -       if (!host->i_nlink) {
> -               err = -ENOENT;
> -               goto out_noent;
> -       }
> -
>         host->i_ctime = current_time(host);
>         host_ui->xattr_cnt -= 1;
>         host_ui->xattr_size -= CALC_DENT_SIZE(fname_len(nm));
> @@ -521,7 +501,6 @@ static int remove_xattr(struct ubifs_info *c, struct inode *host,
>         host_ui->xattr_size += CALC_DENT_SIZE(fname_len(nm));
>         host_ui->xattr_size += CALC_XATTR_BYTES(ui->data_len);
>         host_ui->xattr_names += fname_len(nm);
> -out_noent:
>         mutex_unlock(&host_ui->ui_mutex);
>         ubifs_release_budget(c, &req);
>         make_bad_inode(inode);
> @@ -561,9 +540,6 @@ static int ubifs_xattr_remove(struct inode *host, const char *name)
>
>         ubifs_assert(c, inode_is_locked(host));
>
> -       if (!host->i_nlink)
> -               return -ENOENT;
> -
>         if (fname_len(&nm) > UBIFS_MAX_NLEN)
>                 return -ENAMETOOLONG;
>
> --
> 2.19.0
>
