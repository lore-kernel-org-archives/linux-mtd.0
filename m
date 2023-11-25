Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39735C4167B
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Nov 2023 14:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nGkvnPanTVCtRB1aQW/BQ8X+GNxX+2bbR5kBw0LxQ8k=; b=eGq+b4FkNypNU+
	NXHJ7De1P5AofNaad2h2aCvbJg2e8aLWIQdAwq0Qn7bs/J642Qm+u12wvVZyh9cg3UvO9G1cRJIBx
	s9XSDUCs7GYlVnEYuqhZf/Wt0GJlbufj2LV/uBMOTxaz5SbbKMErSLVS0iXC36Qs4unkzDyoUUQhj
	q5sjN7emdkAM3QnwvvMzqwrYGFJZmG7R8HINuq5lMbNIHDowYWKDm5dePxCk+SN4VLVdarstDzuag
	ubHB6eSD/u10v7G5eYgsCW3VDUV363a/lzJ4QZBZpMHV7CFvR1Qbvnb8YZoBONy0gDueKKczG3g2v
	IEeWyX3f1xyF/rpUELIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6tiS-009M1L-2L;
	Sat, 25 Nov 2023 14:33:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6tiQ-009M0z-0c
	for linux-mtd@lists.infradead.org;
	Sat, 25 Nov 2023 14:33:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD2BD60C23;
	Sat, 25 Nov 2023 14:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF1EC433C9;
	Sat, 25 Nov 2023 14:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700922779;
	bh=oSd7BcOK3bP0I8DfntCNNyxB1mRx7mQJk5aYCZ56Jps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tb+b1AGjl66gEFJb49YPJaFeRIASRiFOTSxrZYFb/9UEMzhBhJ7dj03XjtnQqURkF
	 TfRgGHRdUiAjOE44N/FKpf7JzCF5V8n47LggUk8mYZ6WAEYe+BIWeDP2a/vA3Woy4L
	 +jv6Fe3Kj+6ny2tml8PShu+0hReicMnk89ZJEMIM=
Date: Sat, 25 Nov 2023 14:32:55 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: hch@infradead.org, ming.lei@redhat.com, axboe@kernel.dk,
	roger.pau@citrix.com, colyli@suse.de, kent.overstreet@gmail.com,
	joern@lazybastard.org, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com,
	josef@toxicpanda.com, dsterba@suse.com, viro@zeniv.linux.org.uk,
	brauner@kernel.org, nico@fluxnic.net, xiang@kernel.org,
	chao@kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca,
	agruenba@redhat.com, jack@suse.com, konishi.ryusuke@gmail.com,
	dchinner@redhat.com, linux@weissschuh.net, min15.li@samsung.com,
	dlemoal@kernel.org, willy@infradead.org, akpm@linux-foundation.org,
	p.raghav@samsung.com, hare@suse.de, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org, gfs2@lists.linux.dev,
	linux-nilfs@vger.kernel.org, yukuai3@huawei.com,
	yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH -next] block: remove field 'bd_inode' from block_device
Message-ID: <2023112544-subpanel-national-58e5@gregkh>
References: <20231125093912.141486-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231125093912.141486-1-yukuai1@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_063302_342646_1741976B 
X-CRM114-Status: GOOD (  20.05  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Nov 25, 2023 at 05:39:12PM +0800, Yu Kuai wrote:
> From: Yu Kuai <yukuai3@huawei.com>
> 
> block_devcie is allocated from bdev_alloc() by bdev_alloc_inode(), and
> currently block_device contains a pointer that point to the address of
> inode, while such inode is allocated together:
> 
> bdev_alloc
>  inode = new_inode()
>   // inode is &bdev_inode->vfs_inode
>  bdev = I_BDEV(inode)
>   // bdev is &bdev_inode->bdev
>  bdev->inode = inode
> 
> Add a new helper to get address of inode from bdev by add operation
> instead of memory access, which is more efficiency. Also prepare to
> add a new field 'bd_flags' in the first cacheline(64 bytes).
> 
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  block/bdev.c                       | 39 +++++++++++++++++-------------
>  block/blk-zoned.c                  |  4 +--
>  block/fops.c                       |  4 +--
>  block/genhd.c                      |  8 +++---
>  block/ioctl.c                      |  8 +++---
>  block/partitions/core.c            |  9 ++++---
>  drivers/block/xen-blkback/xenbus.c |  2 +-
>  drivers/md/bcache/super.c          |  2 +-
>  drivers/mtd/devices/block2mtd.c    | 12 ++++-----
>  drivers/s390/block/dasd_ioctl.c    |  2 +-
>  drivers/scsi/scsicam.c             |  2 +-
>  fs/bcachefs/util.h                 |  2 +-
>  fs/btrfs/disk-io.c                 |  6 ++---
>  fs/btrfs/volumes.c                 |  4 +--
>  fs/btrfs/zoned.c                   |  2 +-
>  fs/buffer.c                        |  8 +++---
>  fs/cramfs/inode.c                  |  2 +-
>  fs/erofs/data.c                    |  2 +-
>  fs/ext4/dir.c                      |  2 +-
>  fs/ext4/ext4_jbd2.c                |  2 +-
>  fs/ext4/super.c                    |  8 +++---
>  fs/gfs2/glock.c                    |  2 +-
>  fs/gfs2/ops_fstype.c               |  2 +-
>  fs/jbd2/journal.c                  |  3 ++-
>  fs/jbd2/recovery.c                 |  2 +-
>  fs/nilfs2/segment.c                |  2 +-
>  include/linux/blk_types.h          | 10 ++++++--
>  include/linux/blkdev.h             |  4 +--
>  include/linux/buffer_head.h        |  4 +--
>  29 files changed, 86 insertions(+), 73 deletions(-)

You should do this as a patch series, add the helper function that does
nothing, convert all the different portions of the kernel as different
patches, and _then_ change the implementation of the block layer to
handle the change in the structure.

Otherwise this is going to be hard to get accepted.

Also, one note:

> @@ -85,6 +84,13 @@ struct block_device {
>  #define bdev_kobj(_bdev) \
>  	(&((_bdev)->bd_device.kobj))
>  
> +static inline struct inode *bdev_inode(struct block_device *bdev)
> +{
> +	void *inode = bdev + 1;

That's crazy, if something changes, this will keep working yet the
kernel will break and no one will know why.

Please use container_of(), that's what it is there for, this exact type
of thing.  Or if not, are you just assuming that the memory location
right after bdev is the inode?  That's a tough assumption, how are you
going to assure it really stays there?

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
