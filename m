Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0E4C4167B
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Nov 2023 05:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k128satZ3WbESk++/wXqJbjKjldM7ugLy5HfanndeN4=; b=N2kw1I83MYtnaK
	gvi02WPI3x+ohGzcRA5JqUfpHQzx1QAPtPgxJ1kbInc6OeXrrX4LgccfbfdZmqyPsNrwiokayLgK0
	eUGbef52+UgYsDnAC/+frNb2ouQr+wIFZcfPqzmqB5hPzgzOBgd5qKAo59Px5wcVK4tDw8y4irv88
	LFNGNiy+8gsm1ETrBbe9L3Q+q9zPE1ttnflNEYN+ASO+e45919bo5oCBopoP8V2y7m5EEa5AVyl18
	UeC9sE68a+zc6lKn62T/EFzkOjq+PlVW9Oy0aZWyc8+tqS2h5+T5fyGH4odt3C1wQlqvrXu645ary
	d2MWRHIQBw8bNt9R9e3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7qxP-004BQB-1U;
	Tue, 28 Nov 2023 05:48:27 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1r7qxI-004BPZ-2N;
	Tue, 28 Nov 2023 05:48:20 +0000
Date: Mon, 27 Nov 2023 21:48:20 -0800
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
Message-ID: <ZWV/JBxrrGXzY0gr@infradead.org>
References: <20231127062116.2355129-1-yukuai1@huaweicloud.com>
 <20231127062116.2355129-2-yukuai1@huaweicloud.com>
 <ZWRDeQ4K8BiYnV+X@infradead.org>
 <6acdeece-7163-3219-95e2-827e54eadd0c@huaweicloud.com>
 <ZWTErvnMf7HiO1Wj@infradead.org>
 <bc64da80-e9bd-84cb-f173-876623303131@huaweicloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bc64da80-e9bd-84cb-f173-876623303131@huaweicloud.com>
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

On Tue, Nov 28, 2023 at 09:35:56AM +0800, Yu Kuai wrote:
> Thanks for the advice! In case I'm understanding correctly, do you mean
> that all other fs/drivers that is using pages versions can safely switch
> to folio versions now?

If you never allocate a high-order folio pages are identical to folios.
So yes, we can do folio based interfaces only, and also use that as
an opportunity to convert over the callers.

> By the way, my orginal idea was trying to add a new field 'bd_flags'
> in block_devcie, and then add a new bit so that bio_check_ro() will
> only warn once for each partition. Now that this patchset will be quite
> complex, I'll add a new bool field 'bd_ro_warned' to fix the above
> problem first, and then add 'bd_flags' once this patchset is done.

Yes, please do a minimal version if you can find space where the
rmw cycles don't cause damage to neighbouring fields.  Or just leave
the current set of warnings in if it's too hard.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
