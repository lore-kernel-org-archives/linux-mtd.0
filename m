Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z25dr-0000Hc-5C
 for linux-mtd@lists.infradead.org; Mon, 08 Jun 2015 22:35:40 +0000
Message-ID: <557618A1.8020203@nod.at>
Date: Tue, 09 Jun 2015 00:35:13 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 linux-mtd@lists.infradead.org, adrian.hunter@intel.com,
 dedekind1@gmail.com
Subject: Re: [PATCH RESEND] ubifs: Introduce a mount option of force_atime.
References: <1433758060-18614-1-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1433758060-18614-1-git-send-email-yangds.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Cc: linux-fsdevel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 08.06.2015 um 12:07 schrieb Dongsheng Yang:
> Currently, ubifs does not support access time anyway. I understand
> that there is a overhead to update inode in each access from user.
> 
> But for the following two reasons, I think we can make it optional
> to user.
> 
> (1). More and more flash storage in server are trying to use ubifs,
> it is not only for a device such as mobile phone any more, we want
> to use it in more and more generic way. Then we need to compete
> with some other main filesystems. From this point, access time is
> necessary to us, at least as a choice to user currently.
> 
> (2). The default mount option about atime is relatime currently,
> it's much relaxy compared with strictatime. Then we don't update
> the inode in any accessing. So the overhead is not too much.
> It's really acceptable.
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
> 	It's a RESEND patch to cc to fsdevel as Artem suggested.
> I would rename force_atime to enable_atime in next version.
> 
>  fs/ubifs/file.c  |  4 ++++
>  fs/ubifs/super.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++++---
>  fs/ubifs/ubifs.h |  5 +++++
>  3 files changed, 58 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> index 35efc10..e683890 100644
> --- a/fs/ubifs/file.c
> +++ b/fs/ubifs/file.c
> @@ -1541,11 +1541,15 @@ static const struct vm_operations_struct ubifs_file_vm_ops = {
>  static int ubifs_file_mmap(struct file *file, struct vm_area_struct *vma)
>  {
>  	int err;
> +	struct inode *inode = file->f_mapping->host;
> +	struct ubifs_info *c = inode->i_sb->s_fs_info;
>  
>  	err = generic_file_mmap(file, vma);
>  	if (err)
>  		return err;
>  	vma->vm_ops = &ubifs_file_vm_ops;
> +	if (c->force_atime)
> +		file_accessed(file);
>  	return 0;
>  }
>  
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index 75e6f04..8c2773b 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -128,7 +128,9 @@ struct inode *ubifs_iget(struct super_block *sb, unsigned long inum)
>  	if (err)
>  		goto out_ino;
>  
> -	inode->i_flags |= (S_NOCMTIME | S_NOATIME);
> +	inode->i_flags |= S_NOCMTIME;
> +	if (!c->force_atime)
> +		inode->i_flags |= S_NOATIME;
>  	set_nlink(inode, le32_to_cpu(ino->nlink));
>  	i_uid_write(inode, le32_to_cpu(ino->uid));
>  	i_gid_write(inode, le32_to_cpu(ino->gid));
> @@ -378,15 +380,47 @@ done:
>  	clear_inode(inode);
>  }
>  
> +/*
> + * There is only one possible caller of ubifs_dirty_inode without holding
> + * ui->ui_mutex, file_accessed. We are going to support atime if user
> + * set the mount option of force_atime. In that case, ubifs_dirty_inode
> + * need to lock ui->ui_mutex by itself and do a budget by itself.
> + */
>  static void ubifs_dirty_inode(struct inode *inode, int flags)
>  {
>  	struct ubifs_inode *ui = ubifs_inode(inode);
> +	int locked = mutex_is_locked(&ui->ui_mutex);
> +	struct ubifs_info *c = inode->i_sb->s_fs_info;
> +	int ret = 0;
> +
> +	if (!locked)
> +		mutex_lock(&ui->ui_mutex);

Please try as hard as possible to avoid conditional locking.

Thanks,
//richard
