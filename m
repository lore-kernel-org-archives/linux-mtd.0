Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073CFC4167B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Dec 2023 05:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5zvQVQS0hW15ED0YmCan7qPxwfyh3VHv69acnEGvjQo=; b=CyBagD7nXtIihz
	dtA7CacT2aFvTZnMM1HAEnK9h6Qtcp+TwM39iOQw6S5uegfZgTPH08SSR0355Xi1NdlAPDyK45eBj
	HXFnEL1+JK4UzHBAC6rAX0bMFfBPyKFPcPuyKnEc2vuoxlv3ruADlBtXCV7JPO3x0QDP1Z3c4+6qX
	ts4iDdwEb65aDee6MgUfLV5nuuwWk1rXz2yCoEs7FxQLw5G0n6s0CM+8/8OoUEcOw+Ws9iSdqtFht
	gVXZE52+6L2WGM1hIHSoZ1ZnEpoQAznJYygmeoQvnihErPh2OvzQz5v6khA4wYbfZCvIh4bBDxpXu
	tA3cDwAnsfwybzvJoc9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAkrZ-0098Os-3D;
	Wed, 06 Dec 2023 05:54:26 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rAkrP-0098Oa-0t;
	Wed, 06 Dec 2023 05:54:15 +0000
Date: Tue, 5 Dec 2023 21:54:15 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de,
	kent.overstreet@gmail.com, joern@lazybastard.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
	dsterba@suse.com, nico@fluxnic.net, xiang@kernel.org,
	chao@kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca,
	agruenba@redhat.com, jack@suse.com, konishi.ryusuke@gmail.com,
	willy@infradead.org, akpm@linux-foundation.org, hare@suse.de,
	p.raghav@samsung.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	gfs2@lists.linux.dev, linux-nilfs@vger.kernel.org,
	yukuai3@huawei.com, yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH -next RFC 00/14] block: don't access bd_inode directly
 from other modules
Message-ID: <ZXAMh02h4FAwt2FY@infradead.org>
References: <20231205123728.1866699-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231205123728.1866699-1-yukuai1@huaweicloud.com>
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

On Tue, Dec 05, 2023 at 08:37:14PM +0800, Yu Kuai wrote:
> From: Yu Kuai <yukuai3@huawei.com>
> 
> Patch 1 add some bdev apis, then follow up patches will use these apis
> to avoid access bd_inode directly, and hopefully the field bd_inode can
> be removed eventually(after figure out a way for fs/buffer.c).

What tree is this against?  It fails to apply to either Jens'
for-6.8/block or Linus tree in the very first patch.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
