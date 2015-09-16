Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zc9jO-00079i-R7
 for linux-mtd@lists.infradead.org; Wed, 16 Sep 2015 10:14:27 +0000
Date: Wed, 16 Sep 2015 12:14:02 +0200
From: Jan Kara <jack@suse.cz>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: viro@ZenIV.linux.org.uk, jack@suse.cz, dedekind1@gmail.com,
 richard.weinberger@gmail.com, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v3 11/39] fs: quota: replace opened calling of ->sync_fs
 with sync_filesystem
Message-ID: <20150916101402.GE13325@quack.suse.cz>
References: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1442307754-13233-12-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1442307754-13233-12-git-send-email-yangds.fnst@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue 15-09-15 17:02:06, Dongsheng Yang wrote:
> There are only two places in whole kernel to call ->sync_fs directly. It
> will sync fs even in read-only mode. It's not a good idea and some filesystem
> would warn out if you are syncing in read-only mode. But sync_filesystem()
> does filter this case out. Let's call sync_filesystem() here instead.
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>

So I'd prefer ubifs used hidden system inodes for quota files, set
DQUOT_QUOTA_SYS_FILE flag and so this code calling sync_fs() could be
completely avoided.

I don't like calling sync_filesystem() from quota code. Mainly, it does
much more work than ->sync_fs() for most filesystems (it flushes all files
to disk). Just adding a check for read-only filesystem would look better to
me.

									Honza
> ---
>  fs/quota/dquot.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/quota/dquot.c b/fs/quota/dquot.c
> index 140397a..0bda7fa 100644
> --- a/fs/quota/dquot.c
> +++ b/fs/quota/dquot.c
> @@ -668,8 +668,7 @@ int dquot_quota_sync(struct super_block *sb, int type)
>  	/* This is not very clever (and fast) but currently I don't know about
>  	 * any other simple way of getting quota data to disk and we must get
>  	 * them there for userspace to be visible... */
> -	if (sb->s_op->sync_fs)
> -		sb->s_op->sync_fs(sb, 1);
> +	sync_filesystem(sb);
>  	sync_blockdev(sb->s_bdev);
>  
>  	/*
> @@ -2043,7 +2042,7 @@ int dquot_disable(struct super_block *sb, int type, unsigned int flags)
>  	/*
>  	 * Skip everything if there's nothing to do. We have to do this because
>  	 * sometimes we are called when fill_super() failed and calling
> -	 * sync_fs() in such cases does no good.
> +	 * sync_filesystem() in such cases does no good.
>  	 */
>  	if (!sb_any_quota_loaded(sb)) {
>  		mutex_unlock(&dqopt->dqonoff_mutex);
> @@ -2110,8 +2109,7 @@ int dquot_disable(struct super_block *sb, int type, unsigned int flags)
>  
>  	/* Sync the superblock so that buffers with quota data are written to
>  	 * disk (and so userspace sees correct data afterwards). */
> -	if (sb->s_op->sync_fs)
> -		sb->s_op->sync_fs(sb, 1);
> +	sync_filesystem(sb);
>  	sync_blockdev(sb->s_bdev);
>  	/* Now the quota files are just ordinary files and we can set the
>  	 * inode flags back. Moreover we discard the pagecache so that
> -- 
> 1.8.4.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
