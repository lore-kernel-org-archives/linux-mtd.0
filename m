Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF0FC4167B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Dec 2023 07:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gcza+mxSGU1u7Dub79hN32B0Lykl+GzSI21xU0h2vTY=; b=jFFSv+QodbwO07
	J7WaZo3HlsEmRb9+7npeJ7uVCrCEOyrB8/dIrFUMi5LEgeWjB2a+L9NCzhYSd7KYTo+gMuDHdUWdZ
	FdZz6BP3V0HWT9f/N/g5psjBiO5GEhk+jFVdqx/lCouVAAu8bGhISGogEvj7M4XBrFyfrqUEJw3C0
	7oqinvhEEm51AaHA9khbmHhX6JpZeJNV38Ib3W5JH5Ob3eioOA6Ogibj/gC6Uasq3k9sEKEk7uzDM
	Bi8XvV2zOlV6IF5hXjW51ofTOO4sVpPa/TmvKaONHMlnA/BG9tUtgdTccnsVnW2CTSZ16LWAWHPZq
	OaCCxnZfsBgNObQCTHVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAmCx-009Hlz-0Y;
	Wed, 06 Dec 2023 07:20:35 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rAmCo-009HjE-0N;
	Wed, 06 Dec 2023 07:20:26 +0000
Date: Tue, 5 Dec 2023 23:20:26 -0800
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
Subject: Re: [PATCH -next RFC 01/14] block: add some bdev apis
Message-ID: <ZXAgut2MTKw50OLI@infradead.org>
References: <20231205123728.1866699-1-yukuai1@huaweicloud.com>
 <20231205123728.1866699-2-yukuai1@huaweicloud.com>
 <ZXARKD0OmjLrvHmU@infradead.org>
 <aafabc6e-fd98-f927-44d7-3ef76e2acaf8@huaweicloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aafabc6e-fd98-f927-44d7-3ef76e2acaf8@huaweicloud.com>
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

On Wed, Dec 06, 2023 at 02:50:56PM +0800, Yu Kuai wrote:
> I'm a litter confused, so there are 3 use cases:
> 1) use GFP_USER, default gfp from bdev_alloc.
> 2) use GFP_KERNEL
> 3) use GFP_NOFS
> 
> I understand that you're suggesting memalloc_nofs_save() to distinguish
> 2 and 3, but how can I distinguish 1?

You shouldn't.  Diverging from the default flags except for clearing
the FS or IO flags is simply a bug.  Note that things like block2mtd
should probably also ensure a noio allocation if they aren't doing that
yet.

> >   - use memalloc_nofs_save in extet instead of using
> >     mapping_gfp_constraint to clear it from the mapping flags
> >   - remove __ext4_sb_bread_gfp and just have buffer.c helper that does
> >     the right thing (either by changing the calling conventions of an
> >     existing one, or adding a new one).
> 
> Thanks for the suggestions, but I'm not sure how to do this yet, I must
> read more ext4 code.

the nofs save part should be trivial.  You can just skip the rest for
now as it's not needed for this patch series.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
