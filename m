Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMLyV-0003sJ-NK
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 20:04:44 +0000
Date: Mon, 3 Aug 2015 22:04:18 +0200
From: Jan Kara <jack@suse.cz>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: viro@ZenIV.linux.org.uk, jack@suse.cz, dedekind1@gmail.com,
 richard.weinberger@gmail.com, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 10/35] fs: dquot: skip invalidate_bdev if bdev is NULL
Message-ID: <20150803200418.GE23810@quack.suse.cz>
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-11-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438235311-23788-11-git-send-email-yangds.fnst@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu 30-07-15 13:48:06, Dongsheng Yang wrote:
> There would be a NULL pointer dereference if bdev is NULL
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>

The patch looks good. You can add:

Reviewed-by: Jan Kara <jack@suse.com>

								Honza

> ---
>  fs/quota/dquot.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/quota/dquot.c b/fs/quota/dquot.c
> index 20d1f74..140397a 100644
> --- a/fs/quota/dquot.c
> +++ b/fs/quota/dquot.c
> @@ -2208,7 +2208,8 @@ static int vfs_load_quota_inode(struct inode *inode, int type, int format_id,
>  		 * of the cache could fail because of other unrelated dirty
>  		 * data */
>  		sync_filesystem(sb);
> -		invalidate_bdev(sb->s_bdev);
> +		if (sb->s_bdev)
> +			invalidate_bdev(sb->s_bdev);
>  	}
>  	mutex_lock(&dqopt->dqonoff_mutex);
>  	if (sb_has_quota_loaded(sb, type)) {
> -- 
> 1.8.4.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
