Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y7gOv-0003hC-LC
 for linux-mtd@lists.infradead.org; Sun, 04 Jan 2015 08:19:06 +0000
Received: by mail-pa0-f51.google.com with SMTP id ey11so26654198pad.38
 for <linux-mtd@lists.infradead.org>; Sun, 04 Jan 2015 00:18:43 -0800 (PST)
Sender: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Sun, 04 Jan 2015 17:18:38 +0900 (JST)
Message-Id: <20150104.171838.243342727322803372.konishi.ryusuke@lab.ntt.co.jp>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 6/8] nilfs2: set up s_bdi like the generic mount_bdev code
From: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>
In-Reply-To: <1419929859-24427-7-git-send-email-hch@lst.de>
References: <1419929859-24427-1-git-send-email-hch@lst.de>
 <1419929859-24427-7-git-send-email-hch@lst.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: Jens Axboe <axboe@fb.com>, David Howells <dhowells@redhat.com>,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mm@kvack.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 30 Dec 2014 09:57:37 +0100, Christoph Hellwig <hch@lst.de> wrote:
> mapping->backing_dev_info will go away, so don't rely on it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good for me.

Acked-by: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>

> ---
>  fs/nilfs2/super.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/fs/nilfs2/super.c b/fs/nilfs2/super.c
> index 2e5b3ec..3d4bbac 100644
> --- a/fs/nilfs2/super.c
> +++ b/fs/nilfs2/super.c
> @@ -1057,7 +1057,6 @@ nilfs_fill_super(struct super_block *sb, void *data, int silent)
>  {
>  	struct the_nilfs *nilfs;
>  	struct nilfs_root *fsroot;
> -	struct backing_dev_info *bdi;
>  	__u64 cno;
>  	int err;
>  
> @@ -1077,8 +1076,7 @@ nilfs_fill_super(struct super_block *sb, void *data, int silent)
>  	sb->s_time_gran = 1;
>  	sb->s_max_links = NILFS_LINK_MAX;
>  
> -	bdi = sb->s_bdev->bd_inode->i_mapping->backing_dev_info;
> -	sb->s_bdi = bdi ? : &default_backing_dev_info;
> +	sb->s_bdi = &bdev_get_queue(sb->s_bdev)->backing_dev_info;
>  
>  	err = load_nilfs(nilfs, sb);
>  	if (err)
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-fsdevel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
