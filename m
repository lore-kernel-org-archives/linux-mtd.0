Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210A1C4706F
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Dec 2023 18:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UujOzLc3Q57QXM72n89poybniz7YFHLJKJw+C3G2mJA=; b=N5PUgB1jL7vQEu
	npfKxkm/6YLbZocPtUAmMoGUcGS4nt8aOLUhOggrQR6LyCFiilAcW4rP+9R65ABZJhXicUUsrUUFN
	xJj+R6+/alcy/U7tH5iQvjosg2LePDzh4t2epBxuPg3FT/AZ+jidqmOLqb1ABZlpkrMRh0OVGXQ/d
	Zz61bVXS731K1ocAmqj1va+egviPPdrGSHUJib+Vh4KEKKxRJ2+J3DTurWYLD+R8irtxSCeluSy2k
	GUGXKMMxIh8So0H22X8ahrvt4rQrQHCx/CmhZjJTC8A28kO+ktifa0h+W5FC+CPFFt+7+gkB0Y7xZ
	tiTZj7UZo7x8EN34tZSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rH6uZ-008Kbz-0d;
	Sat, 23 Dec 2023 18:39:47 +0000
Received: from out-186.mta1.migadu.com ([2001:41d0:203:375::ba])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rH6uW-008KYS-37
	for linux-mtd@lists.infradead.org;
	Sat, 23 Dec 2023 18:39:46 +0000
Date: Sat, 23 Dec 2023 13:39:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1703356772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nl8KqWKpD6wWjbvJJznLUba3EPd6rpJb9056eV80EZI=;
	b=mLUUfEd7gfPYDe3oleQ9tbdyTO5xnWBH1tZ17cgI4qqbATl0NNgyxkk9s86/LqjribMhXF
	icSGv6krf/Bb8nP/Rk+sLamzbNdocnFQ0i9s/yQOF2bzXjM3YAZVaDOCpBwjSIvilLWEoR
	/klCC3TPr9UUNblk28yYvK2TJLs04lQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Matthew Wilcox <willy@infradead.org>
Cc: Yu Kuai <yukuai1@huaweicloud.com>, axboe@kernel.dk, 
	roger.pau@citrix.com, colyli@suse.de, kent.overstreet@gmail.com, joern@lazybastard.org, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, sth@linux.ibm.com, 
	hoeppner@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com, 
	dsterba@suse.com, viro@zeniv.linux.org.uk, brauner@kernel.org, nico@fluxnic.net, 
	xiang@kernel.org, chao@kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca, 
	jack@suse.com, konishi.ryusuke@gmail.com, akpm@linux-foundation.org, 
	hare@suse.de, p.raghav@samsung.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, linux-nilfs@vger.kernel.org, 
	yukuai3@huawei.com, yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH RFC v3 for-6.8/block 09/17] btrfs: use bdev apis
Message-ID: <j52xmye4qmjqv4mq524ppvqr7naicobnwn2qfcvftbj4zoowga@t6klttrjtq2d>
References: <20231221085712.1766333-1-yukuai1@huaweicloud.com>
 <20231221085712.1766333-10-yukuai1@huaweicloud.com>
 <ZYcZi5YYvt5QHrG9@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZYcZi5YYvt5QHrG9@casper.infradead.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231223_103945_164659_1C1C95C8 
X-CRM114-Status: GOOD (  14.97  )
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

On Sat, Dec 23, 2023 at 05:31:55PM +0000, Matthew Wilcox wrote:
> On Thu, Dec 21, 2023 at 04:57:04PM +0800, Yu Kuai wrote:
> > @@ -3674,16 +3670,17 @@ struct btrfs_super_block *btrfs_read_dev_one_super(struct block_device *bdev,
> >  		 * Drop the page of the primary superblock, so later read will
> >  		 * always read from the device.
> >  		 */
> > -		invalidate_inode_pages2_range(mapping,
> > -				bytenr >> PAGE_SHIFT,
> > +		invalidate_bdev_range(bdev, bytenr >> PAGE_SHIFT,
> >  				(bytenr + BTRFS_SUPER_INFO_SIZE) >> PAGE_SHIFT);
> >  	}
> >  
> > -	page = read_cache_page_gfp(mapping, bytenr >> PAGE_SHIFT, GFP_NOFS);
> > -	if (IS_ERR(page))
> > -		return ERR_CAST(page);
> > +	nofs_flag = memalloc_nofs_save();
> > +	folio = bdev_read_folio(bdev, bytenr);
> > +	memalloc_nofs_restore(nofs_flag);
> 
> This is the wrong way to use memalloc_nofs_save/restore.  They should be
> used at the point that the filesystem takes/releases whatever lock is
> also used during reclaim.  I don't know btrfs well enough to suggest
> what lock is missing these annotations.

Yes, but considering this is a cross-filesystem cleanup I wouldn't want
to address that in this patchset. And the easier, more incremental
approach for the conversion would be to first convert every GFP_NOFS
usage  to memalloc_nofs_save() like this patch does, as small local
changes, and then let the btrfs people combine them and move them to the
approproate location in a separate patchstet.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
