Return-Path: <SRS0=DcMO=E7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62871C56202
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 16:30:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 028EE20857
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 16:30:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QQ43SuxE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 028EE20857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=20VqAv9fGHaabI8/WetOjC5lDBwwrkKeO6tqzS9XYRk=; b=QQ43SuxE0WBwcOXXLPUFOqTRR
	qUDbugTowTErMknnrLV9I3piymvm6qNkOq7HIefA4W3PbRRqWnY8Gkv3DVGs9dvc1mZUNzLM0pNtw
	Ajf+pAnKKmeam023tk/zzo/e+RA3xzwK4jlu83LDzqa2w0Pav2Vay4zUt0azaBobobOuaDQ1NnjwJ
	+hyvLOMtMGbh0XeSC5S9XdlyFIm8Pt03CFcPyn7etcN1zDbbxwDyxSe4x8VlN0hG0A9Vtusu1buj1
	SkzLBXiv3BakWd4eV96Qjy5K7ezOu5lORrXMDNtLOGDiNl1R/HlmPWfRTe90xgRaaYvJNgdR+Dg6k
	3grZF5XGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khxfg-0001wg-3J; Wed, 25 Nov 2020 16:29:32 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khxfd-0001vx-RT
 for linux-mtd@lists.infradead.org; Wed, 25 Nov 2020 16:29:30 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 948AB68B02; Wed, 25 Nov 2020 17:29:26 +0100 (CET)
Date: Wed, 25 Nov 2020 17:29:26 +0100
From: Christoph Hellwig <hch@lst.de>
To: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 23/45] block: remove i_bdev
Message-ID: <20201125162926.GA1024@lst.de>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-24-hch@lst.de> <X71g4Tm+3RiRg4Gf@mtj.duckdns.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X71g4Tm+3RiRg4Gf@mtj.duckdns.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_112930_035085_2FC9826C 
X-CRM114-Status: GOOD (  22.64  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>,
 Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, linux-mm@kvack.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-fsdevel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 02:37:05PM -0500, Tejun Heo wrote:
> On Tue, Nov 24, 2020 at 02:27:29PM +0100, Christoph Hellwig wrote:
> > Switch the block device lookup interfaces to directly work with a dev_t
> > so that struct block_device references are only acquired by the
> > blkdev_get variants (and the blk-cgroup special case).  This means that
> > we not don't need an extra reference in the inode and can generally
>      ^
>      now
> > simplify handling of struct block_device to keep the lookups contained
> > in the core block layer code.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> ...
> > @@ -1689,14 +1599,12 @@ static int blkdev_open(struct inode * inode, struct file * filp)
> >  	if ((filp->f_flags & O_ACCMODE) == 3)
> >  		filp->f_mode |= FMODE_WRITE_IOCTL;
> >  
> > -	bdev = bd_acquire(inode);
> > -	if (bdev == NULL)
> > -		return -ENOMEM;
> > -
> > +	bdev = blkdev_get_by_dev(inode->i_rdev, filp->f_mode, filp);
> > +	if (IS_ERR(bdev))
> > +		return PTR_ERR(bdev);
> >  	filp->f_mapping = bdev->bd_inode->i_mapping;
> >  	filp->f_wb_err = filemap_sample_wb_err(filp->f_mapping);
> > -
> > -	return blkdev_get(bdev, filp->f_mode, filp);
> > +	return 0;
> >  }
> 
> I was wondering whether losing the stale bdev flushing in bd_acquire() would
> cause user-visible behavior changes but can't see how it would given that
> userland has no way of holding onto a specific instance of block inode.
> Maybe it's something worth mentioning in the commit message?

With stale bdev flushing do you mean the call to bd_forget if
i_bdev exists but is unhashed?  It doesn't actually flush anything but
just detaches the old bdev from the inode so that the new one can be
attached.  That problem goes away by definition if we don't attach
the bdev to the inode.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
