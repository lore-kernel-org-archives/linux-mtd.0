Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHeS0-0003c5-QR
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 20:47:45 +0000
Message-ID: <55AEAFDA.3000008@nod.at>
Date: Tue, 21 Jul 2015 22:47:22 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, dedekind1@gmail.com,
 jack@suse.com
CC: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 13/25] ubifs: introduce a field named as budgeted to
 ubifs_inode
References: <1437467876-22106-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1437467876-22106-14-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1437467876-22106-14-git-send-email-yangds.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 21.07.2015 um 10:37 schrieb Dongsheng Yang:
> There is a long-term pain in ubifs, we have to introduce a
> ui_mutex in ubifs_inode to solve two problems below:
> 
> 1: make some process atomic, such as ubifs_rename.
> 2: make sure we budget space for inode before dirting it.
> 
> About 1, it's true and we have to do it.
> 
> About 2, we can do it better.
> 	There is a ubifs_assert(mutex_is_locked(&ui->mutex)) in
> ubifs_dirty_inode(). But there is probably some processes
> are very long, and we can not make all of it into a pair of
> lock/unlock ui->mutex.
> 
> E.g: dquot_disable().
> 	It would mark the quota files as dirty and write the
> inode back. We can do a budget before this function, but we
> can not make the whole dquot_disable() into mutex_lock/mutex_unlock.
> Because we need to lock the ui_mutex in dquot_disable().
> 
> So, this commit introduce a ui->budgeted to allow us to make
> budgeting and dirting in two different lock windows.
> 
> Result:
> 	ubifs_budget_space()
> 	mutex_lock();
> 	ui->budgeted = 1;
> 	mutex_unlock();
> 	...
> 	dquot_disable();

I'm confused by this changelog.

Why do you need ui->budgeted? You set it but never read it
except in an ubifs_assert().

> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
>  fs/ubifs/file.c  |  7 +++++++
>  fs/ubifs/ioctl.c |  1 +
>  fs/ubifs/super.c | 14 +++++++++++++-
>  fs/ubifs/ubifs.h |  1 +
>  4 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> index dc8bf0b..113c3a6 100644
> --- a/fs/ubifs/file.c
> +++ b/fs/ubifs/file.c
> @@ -307,6 +307,7 @@ static int write_begin_slow(struct address_space *mapping,
>  			 * budget we allocated.
>  			 */
>  			ubifs_release_dirty_inode_budget(c, ui);
> +		ui->budgeted = 1;
>  	}
>  
>  	*pagep = page;
> @@ -357,6 +358,7 @@ static int allocate_budget(struct ubifs_info *c, struct page *page,
>  		 * we need to budget the inode change.
>  		 */
>  		req.dirtied_ino = 1;
> +		ui->budgeted = 1;
>  	} else {
>  		if (PageChecked(page))
>  			/*
> @@ -384,6 +386,7 @@ static int allocate_budget(struct ubifs_info *c, struct page *page,
>  				 * needs a budget.
>  				 */
>  				req.dirtied_ino = 1;
> +			ui->budgeted = 1;
>  		}
>  	}
>  
> @@ -1237,6 +1240,7 @@ static int do_setattr(struct ubifs_info *c, struct inode *inode,
>  	do_attr_changes(inode, attr);
>  
>  	release = ui->dirty;
> +	ui->budgeted = 1;
>  	if (attr->ia_valid & ATTR_SIZE)
>  		/*
>  		 * Inode length changed, so we have to make sure
> @@ -1397,6 +1401,7 @@ static int ubifs_update_time(struct inode *inode, struct timespec *time,
>  		iflags |= I_DIRTY_SYNC;
>  
>  	release = ui->dirty;
> +	ui->budgeted = 1;
>  	__mark_inode_dirty(inode, iflags);
>  	mutex_unlock(&ui->ui_mutex);
>  	if (release)
> @@ -1430,6 +1435,7 @@ static int update_mctime(struct inode *inode)
>  		mutex_lock(&ui->ui_mutex);
>  		inode->i_mtime = inode->i_ctime = ubifs_current_time(inode);
>  		release = ui->dirty;
> +		ui->budgeted = 1;
>  		mark_inode_dirty_sync(inode);
>  		mutex_unlock(&ui->ui_mutex);
>  		if (release)
> @@ -1556,6 +1562,7 @@ static int ubifs_vm_page_mkwrite(struct vm_area_struct *vma,
>  		mutex_lock(&ui->ui_mutex);
>  		inode->i_mtime = inode->i_ctime = ubifs_current_time(inode);
>  		release = ui->dirty;
> +		ui->budgeted = 1;
>  		mark_inode_dirty_sync(inode);
>  		mutex_unlock(&ui->ui_mutex);
>  		if (release)
> diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
> index 3c7b29d..f015b81 100644
> --- a/fs/ubifs/ioctl.c
> +++ b/fs/ubifs/ioctl.c
> @@ -128,6 +128,7 @@ static int setflags(struct inode *inode, int flags)
>  	ubifs_set_inode_flags(inode);
>  	inode->i_ctime = ubifs_current_time(inode);
>  	release = ui->dirty;
> +	ui->budgeted = 1;
>  	mark_inode_dirty_sync(inode);
>  	mutex_unlock(&ui->ui_mutex);
>  
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index 2491fff..5fa21d6 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -331,6 +331,7 @@ static int ubifs_write_inode(struct inode *inode, struct writeback_control *wbc)
>  	}
>  
>  	ui->dirty = 0;
> +	ui->budgeted = 0;
>  	mutex_unlock(&ui->ui_mutex);
>  	ubifs_release_dirty_inode_budget(c, ui);
>  	return err;
> @@ -386,12 +387,23 @@ done:
>  static void ubifs_dirty_inode(struct inode *inode, int flags)
>  {
>          struct ubifs_inode *ui = ubifs_inode(inode);
> +	int need_unlock = 0;
>  
> -	ubifs_assert(mutex_is_locked(&ui->ui_mutex));
> +	if (unlikely(!mutex_is_locked(&ui->ui_mutex))) {
> +		/* We need to lock ui_mutex to access ui->budgeted */
> +		mutex_lock(&ui->ui_mutex);
> +		need_unlock = 1;
> +	}
> +
> +	/* Check the budget for this inode */
> +	ubifs_assert(ui->budgeted);
>  	if (!ui->dirty) {
>  		ui->dirty = 1;
>  		dbg_gen("inode %lu",  inode->i_ino);
>  	}
> +
> +	if (need_unlock)
> +		mutex_unlock(&ui->ui_mutex);
>  }
>  
>  static int ubifs_statfs(struct dentry *dentry, struct kstatfs *buf)
> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
> index 9754bb6..28392a6 100644
> --- a/fs/ubifs/ubifs.h
> +++ b/fs/ubifs/ubifs.h
> @@ -410,6 +410,7 @@ struct ubifs_inode {
>  	unsigned int xattr_cnt;
>  	unsigned int xattr_names;
>  	unsigned int dirty:1;
> +	unsigned int budgeted:1;

Please document that new flag too.

Thanks,
//richard
