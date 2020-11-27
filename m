Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BEEC2D0E4
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 15:25:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6373221F1
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 15:25:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YIrJwPIP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6373221F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+E9ECefoeTNBGEH+C4KpDsN8DK4OPhwW1/MT3Pnrrg0=; b=YIrJwPIP36hnpCIQ3v7YQ70oZ
	ATJBQtpoRi/qSTU1azw83IPIOVpKzjHOxAoLopSMKBPhCLUSdIqJZv2lF/gyBSQ+vd1YmELp5ug70
	QgL8AoFEOso/h8JQrvfuT/WRvJV4SIaIDXVBM6hmhxhcQFmt8aOB0Sv9dqwlsZe+bfoxjTAs90Bkl
	CgNykihqg4VsPg6xvApryhkSh/rbPdkJYiSs/CIw6+3KZPoCLOxaQ9SJRZ+zBPI123Nt60yIaXbz4
	i1WYVhDQgNh0vumqzEnKVfGYKfQVKg4NsaZDEp0kyQSp+iHcU6JxdLhZut/3lADQEqjwZjmXQiq2C
	fcMgqIaRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kifbc-000229-Ox; Fri, 27 Nov 2020 15:24:16 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kifba-00020F-3S
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 15:24:15 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6661868B05; Fri, 27 Nov 2020 16:24:07 +0100 (CET)
Date: Fri, 27 Nov 2020 16:24:07 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 41/44] block: switch disk_part_iter_* to use a struct
 block_device
Message-ID: <20201127152407.GA7115@lst.de>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-42-hch@lst.de> <20201127125341.GD27162@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201127125341.GD27162@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_102414_269576_83F11981 
X-CRM114-Status: GOOD (  18.20  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Tejun Heo <tj@kernel.org>, linux-bcache@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Nov 27, 2020 at 01:53:41PM +0100, Jan Kara wrote:
> On Thu 26-11-20 14:04:19, Christoph Hellwig wrote:
> > Switch the partition iter infrastructure to iterate over block_device
> > references instead of hd_struct ones mostly used to get at the
> > block_device.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> The patch mostly looks good. Two comments below.
> 
> > diff --git a/block/genhd.c b/block/genhd.c
> > index 28299b24173be1..b58595f2ca33b1 100644
> > --- a/block/genhd.c
> > +++ b/block/genhd.c
> > @@ -233,7 +233,7 @@ EXPORT_SYMBOL_GPL(disk_part_iter_init);
> >   * CONTEXT:
> >   * Don't care.
> >   */
> > -struct hd_struct *disk_part_iter_next(struct disk_part_iter *piter)
> > +struct block_device *disk_part_iter_next(struct disk_part_iter *piter)
> >  {
> >  	struct disk_part_tbl *ptbl;
> >  	int inc, end;
> 
> There's:
> 
>         /* put the last partition */
>         disk_put_part(piter->part);
>         piter->part = NULL;
> 
> at the beginning of disk_part_iter_next() which also needs switching to
> bdput(), doesn't it?

That is switched to call disk_part_iter_exit in patch 13.

> 
> > @@ -271,8 +271,7 @@ struct hd_struct *disk_part_iter_next(struct disk_part_iter *piter)
> >  		      piter->idx == 0))
> >  			continue;
> >  
> > -		get_device(part_to_dev(part->bd_part));
> > -		piter->part = part->bd_part;
> > +		piter->part = bdgrab(part);
> 
> bdgrab() could return NULL if we are racing with delete_partition() so I
> think we need to take care of that.

bdgrab never retuns NULL..

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
