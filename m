Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D0AC4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Nov 2023 16:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7JUx2VxVa1Q/up1ON2k8zg3bD5Wkn6IL2mkVbld1NYY=; b=iO0c0U5LbJ9Db+
	orYobT8XYSRmcP2IQL5dj9k3ro8m2ek7jIY/x07tWq02Lbx5OicRW5jNGLyjj/6zY2p33kFiqeF4S
	sEzBPhL06RtFp6BpBkd5r7TzSmkK9e4ocJS2Bz9jI4RXkPYYecGqeqFT2qUAVHdox3epZFiHuWjmu
	H66r06CYJNvToDPPYkAFN7/LKW8iGZSOPt32LKYiaYaAyUyPWYiM2Mxqq+kk/LEOYvFWhAjvhVRdu
	ICUoX0TOReNInkE8WCOaN7vkp6wPNd/wPpL68YhrE/i/6EF54rrTPrDxYktdnhToK/DG2bvTksmpH
	rvMmhRskBOZ9/t0mHpFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eXV-0030FC-2x;
	Mon, 27 Nov 2023 16:32:53 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eXO-0030D4-22;
	Mon, 27 Nov 2023 16:32:46 +0000
Date: Mon, 27 Nov 2023 08:32:46 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: Christoph Hellwig <hch@infradead.org>, ming.lei@redhat.com,
	axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de,
	kent.overstreet@gmail.com, joern@lazybastard.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
	dsterba@suse.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
	nico@fluxnic.net, xiang@kernel.org, chao@kernel.org, tytso@mit.edu,
	adilger.kernel@dilger.ca, agruenba@redhat.com, jack@suse.com,
	konishi.ryusuke@gmail.com, dchinner@redhat.com,
	linux@weissschuh.net, min15.li@samsung.com, dlemoal@kernel.org,
	willy@infradead.org, akpm@linux-foundation.org, hare@suse.de,
	p.raghav@samsung.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org, gfs2@lists.linux.dev,
	linux-nilfs@vger.kernel.org, yi.zhang@huawei.com,
	yangerkun@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
Subject: Re: [PATCH block/for-next v2 01/16] block: add a new helper to get
 inode from block_device
Message-ID: <ZWTErvnMf7HiO1Wj@infradead.org>
References: <20231127062116.2355129-1-yukuai1@huaweicloud.com>
 <20231127062116.2355129-2-yukuai1@huaweicloud.com>
 <ZWRDeQ4K8BiYnV+X@infradead.org>
 <6acdeece-7163-3219-95e2-827e54eadd0c@huaweicloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6acdeece-7163-3219-95e2-827e54eadd0c@huaweicloud.com>
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

On Mon, Nov 27, 2023 at 09:07:22PM +0800, Yu Kuai wrote:
> 1) Is't okay to add a new helper to pass in bdev for following apis?


For some we already have them (e.g. bdev_nr_bytes to read the bdev)
size, for some we need to add them.  The big thing that seems to
stick out is page cache API, and I think that is where we need to
define maintainable APIs for file systems and others to use the
block device page cache.  Probably only in folio versions and not
pages once if we're touching the code anyay

> 2) For the file fs/buffer.c, there are some special usage like
> following that I don't think it's good to add a helper:
> 
> spin_lock(&bd_inode->i_mapping->private_lock);
> 
> Is't okay to move following apis from fs/buffer.c directly to
> block/bdev.c?
> 
> __find_get_block
> bdev_getblk

I'm not sure moving is a good idea, but we might end up the
some kind of low-level access from buffer.c, be that special
helpers, a separate header or something else.  Let's sort out
the rest of the kernel first.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
