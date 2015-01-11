Received: from mail-qc0-x22f.google.com ([2607:f8b0:400d:c01::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAMNN-0001JB-Mq
 for linux-mtd@lists.infradead.org; Sun, 11 Jan 2015 17:32:34 +0000
Received: by mail-qc0-f175.google.com with SMTP id p6so15378209qcv.6
 for <linux-mtd@lists.infradead.org>; Sun, 11 Jan 2015 09:32:12 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Sun, 11 Jan 2015 12:32:09 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/12] block_dev: only write bdev inode on close
Message-ID: <20150111173209.GK25319@htj.dyndns.org>
References: <1420739133-27514-1-git-send-email-hch@lst.de>
 <1420739133-27514-5-git-send-email-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1420739133-27514-5-git-send-email-hch@lst.de>
Cc: David Howells <dhowells@redhat.com>, linux-nfs@vger.kernel.org,
 Jens Axboe <axboe@fb.com>, linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Thu, Jan 08, 2015 at 06:45:25PM +0100, Christoph Hellwig wrote:
> Since "bdi: reimplement bdev_inode_switch_bdi()" the block device code

018a17bdc865 ("bdi: reimplement bdev_inode_switch_bdi()") would be
better.

> writes out all dirty data whenever switching the backing_dev_info for
> a block device inode.  But a block device inode can only be dirtied
> when it is in use, which means we only have to write it out on the
> final blkdev_put, but not when doing a blkdev_get.
> @@ -1464,9 +1469,11 @@ static void __blkdev_put(struct block_device *bdev, fmode_t mode, int for_part)
>  		WARN_ON_ONCE(bdev->bd_holders);
>  		sync_blockdev(bdev);
>  		kill_bdev(bdev);
> -		/* ->release can cause the old bdi to disappear,
> -		 * so must switch it out first
> +		/*
> +		 * ->release can cause the queue to disappaear, so flush all
                                                         ^^^^^
							 typo
> +		 * dirty data before.
>  		 */
> +		bdev_write_inode(bdev->bd_inode);

Is this an optimization or something necessary for the following
changes?  If latter, maybe it's a good idea to state why this is
necessary in the description?  Otherwise,

 Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
