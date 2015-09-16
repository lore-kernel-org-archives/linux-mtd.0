Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zc9Jn-0000Q8-1Q
 for linux-mtd@lists.infradead.org; Wed, 16 Sep 2015 09:48:00 +0000
Date: Wed, 16 Sep 2015 11:47:35 +0200
From: Jan Kara <jack@suse.cz>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: viro@ZenIV.linux.org.uk, jack@suse.cz, dedekind1@gmail.com,
 richard.weinberger@gmail.com, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v3 15/39] fs: quota: introduce a callback of
 restore_iflags to quotactl_ops
Message-ID: <20150916094735.GC13325@quack.suse.cz>
References: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1442307754-13233-16-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1442307754-13233-16-git-send-email-yangds.fnst@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue 15-09-15 17:02:10, Dongsheng Yang wrote:
> In dquot_disable, we need to restore the iflags of quota files
> and mark the inodes to dirty. But that's pain to file-systems
> working in out-place-updating way, such as btrfs and ubifs. when
> they are going to update inode, they have to reserve space for
> this inode.
> 
> So we can not mark_inode_dirty() in dquot_disable for them. To solve
> this kind of problem, the common solution is introduce a callback
> to allow file-systems to do the inode_dirty work by themselves,
> the similar way with update_time().
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>

So do you have a good reason to have quota files accessible from userspace?
Because the experience with ext2/3/4 which did this originally taught me it
is a pain in the ass. It is easier to have quota data stored in dedicated
system inodes which are invisible from userspace (ext4 can do it this way,
xfs, ocfs2, gfs2 as well). Then you don't have to bother with flushing
quota files, switching inode bits etc. when enabling / disabling quotas.
Also it makes more sense logically since quota information is really a part
of filesystem metadata.

The only larger disadvantage is that you have to have support for handling
quota files in mkfs and fsck. But in the long run the additional work is
worth it.

								Honza
> ---
>  fs/quota/dquot.c      | 51 ++++++++++++++++++++++++++++++++++-----------------
>  include/linux/quota.h |  4 ++++
>  2 files changed, 38 insertions(+), 17 deletions(-)
> 
> diff --git a/fs/quota/dquot.c b/fs/quota/dquot.c
> index c73f44d..3f08e69 100644
> --- a/fs/quota/dquot.c
> +++ b/fs/quota/dquot.c
> @@ -2020,6 +2020,33 @@ int dquot_file_open(struct inode *inode, struct file *file)
>  }
>  EXPORT_SYMBOL(dquot_file_open);
>  
> +static int generic_restore_iflags(struct super_block *sb, struct inode **toputinode,
> +					unsigned int *old_flags)
> +{
> +	int cnt = 0;
> +	struct quota_info *dqopt = sb_dqopt(sb);
> +
> +	for (cnt = 0; cnt < MAXQUOTAS; cnt++)
> +		if (toputinode[cnt]) {
> +			mutex_lock(&dqopt->dqonoff_mutex);
> +			/* If quota was reenabled in the meantime, we have
> +			 * nothing to do */
> +			if (!sb_has_quota_loaded(sb, cnt)) {
> +				mutex_lock(&toputinode[cnt]->i_mutex);
> +				toputinode[cnt]->i_flags &= ~(S_IMMUTABLE |
> +				  S_NOATIME | S_NOQUOTA);
> +				toputinode[cnt]->i_flags |= old_flags[cnt];
> +				truncate_inode_pages(&toputinode[cnt]->i_data,
> +						     0);
> +				mutex_unlock(&toputinode[cnt]->i_mutex);
> +				mark_inode_dirty_sync(toputinode[cnt]);
> +			}
> +			mutex_unlock(&dqopt->dqonoff_mutex);
> +		}
> +
> +	return 0;
> +}
> +
>  /*
>   * Turn quota off on a device. type == -1 ==> quotaoff for all types (umount)
>   */
> @@ -2028,6 +2055,7 @@ int dquot_disable(struct super_block *sb, int type, unsigned int flags)
>  	int cnt, ret = 0;
>  	struct quota_info *dqopt = sb_dqopt(sb);
>  	struct inode *toputinode[MAXQUOTAS];
> +	unsigned int *old_flags = dqopt->old_flags;
>  
>  	/* Cannot turn off usage accounting without turning off limits, or
>  	 * suspend quotas and simultaneously turn quotas off. */
> @@ -2111,28 +2139,17 @@ int dquot_disable(struct super_block *sb, int type, unsigned int flags)
>  	 * disk (and so userspace sees correct data afterwards). */
>  	sync_filesystem(sb);
>  	sync_blockdev(sb->s_bdev);
> +
>  	/* Now the quota files are just ordinary files and we can set the
>  	 * inode flags back. Moreover we discard the pagecache so that
>  	 * userspace sees the writes we did bypassing the pagecache. We
>  	 * must also discard the blockdev buffers so that we see the
>  	 * changes done by userspace on the next quotaon() */
> -	for (cnt = 0; cnt < MAXQUOTAS; cnt++)
> -		if (toputinode[cnt]) {
> -			mutex_lock(&dqopt->dqonoff_mutex);
> -			/* If quota was reenabled in the meantime, we have
> -			 * nothing to do */
> -			if (!sb_has_quota_loaded(sb, cnt)) {
> -				mutex_lock(&toputinode[cnt]->i_mutex);
> -				toputinode[cnt]->i_flags &= ~(S_IMMUTABLE |
> -				  S_NOATIME | S_NOQUOTA);
> -				toputinode[cnt]->i_flags |= dqopt->old_flags[cnt];
> -				truncate_inode_pages(&toputinode[cnt]->i_data,
> -						     0);
> -				mutex_unlock(&toputinode[cnt]->i_mutex);
> -				mark_inode_dirty_sync(toputinode[cnt]);
> -			}
> -			mutex_unlock(&dqopt->dqonoff_mutex);
> -		}
> +	if (sb->s_qcop->restore_iflags)
> +		ret = sb->s_qcop->restore_iflags(sb, toputinode, old_flags);
> +	else
> +		ret = generic_restore_iflags(sb, toputinode, old_flags);
> +
>  	if (sb->s_bdev)
>  		invalidate_bdev(sb->s_bdev);
>  put_inodes:
> diff --git a/include/linux/quota.h b/include/linux/quota.h
> index fcfee5a..64e52e4 100644
> --- a/include/linux/quota.h
> +++ b/include/linux/quota.h
> @@ -428,6 +428,10 @@ struct quotactl_ops {
>  	int (*set_dqblk)(struct super_block *, struct kqid, struct qc_dqblk *);
>  	int (*get_state)(struct super_block *, struct qc_state *);
>  	int (*rm_xquota)(struct super_block *, unsigned int);
> +	/*
> +	 * used in quota_disable to restore the i_flags of quota files.
> +	 */
> +	int (*restore_iflags)(struct super_block *sb, struct inode **, unsigned int *);
>  };
>  
>  struct quota_format_type {
> -- 
> 1.8.4.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
