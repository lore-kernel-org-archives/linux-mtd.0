Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F51C4167B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Dec 2023 07:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yywllFqwzpbZY40HYuUpmOd5AnczY5qy296gcrubaAE=; b=E1fe+DZ7/2Cxs7
	RlQQQC4hdnMXBaSGibfyPcx1kpT/ZF/4v2GcH/ebhYS6ouYYgwLWpbTGKWGG0udmvCBoZXQsNzj3s
	bfsUWKRA3YZqSMxk49txxhSqvUVOWFtyoxUM3eZAznHtJcLEFdB3ylZq6WD8ip/cWDXPqZDhkVbdn
	qlPrCZsRNyRWJt5k6yUZdjjdt/SFI22sEbjCxanMK/72yhpmASodqBMY0RmhxWRgQlSpsEPSs/Wzu
	MFEbNLd7gmKNQas5gWYa4mt4uL7Z75NUZVoXgdC+6Edeh7W6UQ94/0Y0Ict/ilew1sCOthIoTqloB
	tKg/Oj+INFsrjAqoS3CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAmE2-009Hz8-1M;
	Wed, 06 Dec 2023 07:21:42 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rAmDz-009HyE-2v;
	Wed, 06 Dec 2023 07:21:39 +0000
Date: Tue, 5 Dec 2023 23:21:39 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: Christoph Hellwig <hch@infradead.org>, axboe@kernel.dk,
	roger.pau@citrix.com, colyli@suse.de, kent.overstreet@gmail.com,
	joern@lazybastard.org, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com,
	josef@toxicpanda.com, dsterba@suse.com, nico@fluxnic.net,
	xiang@kernel.org, chao@kernel.org, tytso@mit.edu,
	adilger.kernel@dilger.ca, agruenba@redhat.com, jack@suse.com,
	konishi.ryusuke@gmail.com, willy@infradead.org,
	akpm@linux-foundation.org, hare@suse.de, p.raghav@samsung.com,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org, gfs2@lists.linux.dev,
	linux-nilfs@vger.kernel.org, yi.zhang@huawei.com,
	yangerkun@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
Subject: Re: [PATCH -next RFC 02/14] xen/blkback: use bdev api in
 xen_update_blkif_status()
Message-ID: <ZXAhA0WUXoF5YEq4@infradead.org>
References: <20231205123728.1866699-1-yukuai1@huaweicloud.com>
 <20231205123728.1866699-3-yukuai1@huaweicloud.com>
 <ZXAMwBD8pd48qwX/@infradead.org>
 <783b5515-db42-c77f-62ab-050f7cc8ef5e@huaweicloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <783b5515-db42-c77f-62ab-050f7cc8ef5e@huaweicloud.com>
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

On Wed, Dec 06, 2023 at 02:56:05PM +0800, Yu Kuai wrote:
> > > -	invalidate_inode_pages2(
> > > -			blkif->vbd.bdev_handle->bdev->bd_inode->i_mapping);
> > > +	invalidate_bdev(blkif->vbd.bdev_handle->bdev);
> > 
> > blkbak is a bdev exported.   I don't think it should ever call
> > invalidate_inode_pages2, through a wrapper or not.
> 
> I'm not sure about this. I'm not familiar with xen/blkback, but I saw
> that xen-blkback will open a bdev from xen_vbd_create(), hence this
> looks like a dm/md for me, hence it sounds reasonable to sync +
> invalidate the opened bdev while initialization. Please kindly correct
> me if I'm wrong.

I guess we have enough precedence for this, so the switchover here
isn't wrong.  But all this invalidating of the bdev cache seems to
be asking for trouble.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
