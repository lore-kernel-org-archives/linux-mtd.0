Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eqKvO-0005ec-Uh
 for linux-mtd@lists.infradead.org; Mon, 26 Feb 2018 15:42:53 +0000
Date: Mon, 26 Feb 2018 16:42:31 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 cluster-devel@redhat.com, linux-mtd@lists.infradead.org,
 linux-ntfs-dev@lists.sourceforge.net
Subject: Re: [PATCH 4/4] fs: move I_DIRTY_INODE to fs.h
Message-ID: <20180226154231.xmjs72osfwiahme6@quack2.suse.cz>
References: <20180221155449.25542-1-hch@lst.de>
 <20180221155449.25542-5-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180221155449.25542-5-hch@lst.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed 21-02-18 07:54:49, Christoph Hellwig wrote:
> And use it in a few more places rather than opencoding the values.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks fine to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/ext4/inode.c    | 4 ++--
>  fs/fs-writeback.c  | 9 +++------
>  fs/gfs2/super.c    | 2 +-
>  include/linux/fs.h | 3 ++-
>  4 files changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index c94780075b04..6d2a18991fcb 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -5032,12 +5032,12 @@ static int other_inode_match(struct inode * inode, unsigned long ino,
>  
>  	if ((inode->i_ino != ino) ||
>  	    (inode->i_state & (I_FREEING | I_WILL_FREE | I_NEW |
> -			       I_DIRTY_SYNC | I_DIRTY_DATASYNC)) ||
> +			       I_DIRTY_INODE)) ||
>  	    ((inode->i_state & I_DIRTY_TIME) == 0))
>  		return 0;
>  	spin_lock(&inode->i_lock);
>  	if (((inode->i_state & (I_FREEING | I_WILL_FREE | I_NEW |
> -				I_DIRTY_SYNC | I_DIRTY_DATASYNC)) == 0) &&
> +				I_DIRTY_INODE)) == 0) &&
>  	    (inode->i_state & I_DIRTY_TIME)) {
>  		struct ext4_inode_info	*ei = EXT4_I(inode);
>  
> diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
> index d4d04fee568a..1280f915079b 100644
> --- a/fs/fs-writeback.c
> +++ b/fs/fs-writeback.c
> @@ -1343,7 +1343,7 @@ __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
>  
>  	dirty = inode->i_state & I_DIRTY;
>  	if (inode->i_state & I_DIRTY_TIME) {
> -		if ((dirty & (I_DIRTY_SYNC | I_DIRTY_DATASYNC)) ||
> +		if ((dirty & I_DIRTY_INODE) ||
>  		    wbc->sync_mode == WB_SYNC_ALL ||
>  		    unlikely(inode->i_state & I_DIRTY_TIME_EXPIRED) ||
>  		    unlikely(time_after(jiffies,
> @@ -2112,7 +2112,6 @@ static noinline void block_dump___mark_inode_dirty(struct inode *inode)
>   */
>  void __mark_inode_dirty(struct inode *inode, int flags)
>  {
> -#define I_DIRTY_INODE (I_DIRTY_SYNC | I_DIRTY_DATASYNC)
>  	struct super_block *sb = inode->i_sb;
>  	int dirtytime;
>  
> @@ -2122,7 +2121,7 @@ void __mark_inode_dirty(struct inode *inode, int flags)
>  	 * Don't do this for I_DIRTY_PAGES - that doesn't actually
>  	 * dirty the inode itself
>  	 */
> -	if (flags & (I_DIRTY_SYNC | I_DIRTY_DATASYNC | I_DIRTY_TIME)) {
> +	if (flags & (I_DIRTY_INODE | I_DIRTY_TIME)) {
>  		trace_writeback_dirty_inode_start(inode, flags);
>  
>  		if (sb->s_op->dirty_inode)
> @@ -2197,7 +2196,7 @@ void __mark_inode_dirty(struct inode *inode, int flags)
>  			if (dirtytime)
>  				inode->dirtied_time_when = jiffies;
>  
> -			if (inode->i_state & (I_DIRTY_INODE | I_DIRTY_PAGES))
> +			if (inode->i_state & I_DIRTY)
>  				dirty_list = &wb->b_dirty;
>  			else
>  				dirty_list = &wb->b_dirty_time;
> @@ -2221,8 +2220,6 @@ void __mark_inode_dirty(struct inode *inode, int flags)
>  	}
>  out_unlock_inode:
>  	spin_unlock(&inode->i_lock);
> -
> -#undef I_DIRTY_INODE
>  }
>  EXPORT_SYMBOL(__mark_inode_dirty);
>  
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index 620be0521866..cf5c7f3080d2 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -800,7 +800,7 @@ static void gfs2_dirty_inode(struct inode *inode, int flags)
>  	int need_endtrans = 0;
>  	int ret;
>  
> -	if (!(flags & (I_DIRTY_DATASYNC|I_DIRTY_SYNC)))
> +	if (!(flags & I_DIRTY_INODE))
>  		return;
>  	if (unlikely(test_bit(SDF_SHUTDOWN, &sdp->sd_flags)))
>  		return;
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 2a815560fda0..86112ab0a1c0 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2014,7 +2014,8 @@ static inline void init_sync_kiocb(struct kiocb *kiocb, struct file *filp)
>  #define I_WB_SWITCH		(1 << 13)
>  #define I_OVL_INUSE			(1 << 14)
>  
> -#define I_DIRTY (I_DIRTY_SYNC | I_DIRTY_DATASYNC | I_DIRTY_PAGES)
> +#define I_DIRTY_INODE (I_DIRTY_SYNC | I_DIRTY_DATASYNC)
> +#define I_DIRTY (I_DIRTY_INODE | I_DIRTY_PAGES)
>  #define I_DIRTY_ALL (I_DIRTY | I_DIRTY_TIME)
>  
>  extern void __mark_inode_dirty(struct inode *, int);
> -- 
> 2.14.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
