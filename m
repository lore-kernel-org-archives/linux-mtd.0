Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFC1C63777
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 08:18:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6C3820872
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 08:18:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l9vHB9bN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6C3820872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nKQHVh90sOruw5wFaxAItyZ8r9c935GZpNjTANxr5YM=; b=l9vHB9bN3c19EwVA8SyvLitOk
	CpiPxu2UydfuDdEOwxm1+Dq9I3CxbsuckbUOHopKWpyhBVatq59FjuQxyFGtobDIEyAd8z/30i+Qq
	weHNQYGHjmNQQsP7JDpEJjW4ymAJfCPxwOaZS+qKYC7Wo9DWzLSQZBxtx8rluSNfiYDley/j5pj1G
	2xsSGoG9W13Lg67ntFbbfEkW2+hGbfqrQJcX1B2yI63L+VcGpi7mXick73Uhb1706oYYkZ57MQ3An
	/8FEyaC1mIE5w5jXRJLd6VjLJNdGLDAIIx/eBtGwAVBkqx5va87bgaVphHKaMARkVFCsq2LNzoZiZ
	gW2h4V6rQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiCSZ-0007fj-N2; Thu, 26 Nov 2020 08:16:59 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiCSU-0007es-G6
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 08:16:58 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id AF45968B02; Thu, 26 Nov 2020 09:16:50 +0100 (CET)
Date: Thu, 26 Nov 2020 09:16:50 +0100
From: Christoph Hellwig <hch@lst.de>
To: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 25/45] block: reference struct block_device from struct
 hd_struct
Message-ID: <20201126081650.GA18807@lst.de>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-26-hch@lst.de> <X714udEyPuGarVYp@mtj.duckdns.org>
 <20201125164515.GB1975@lst.de> <X768hzEnD/ySog5b@mtj.duckdns.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X768hzEnD/ySog5b@mtj.duckdns.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_031657_837901_B3729D07 
X-CRM114-Status: GOOD (  13.20  )
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

On Wed, Nov 25, 2020 at 03:20:23PM -0500, Tejun Heo wrote:
> Agreed. It'd be nice to replace the stale comment.

I've updated the comment.

> > Jan added lookup_sem in commit 56c0908c855afbb to prevent a three way
> > race between del_gendisk and blkdev_open due to the weird bdev vs
> > gendisk lifetime rules.  None of that can happen with the new lookup
> > scheme.
> 
> Understood. I think it'd be worthwhile to note that in the commit log.

So after the idea of just holding a disk reference from each bdev did
not work out very well I've reworked this a bit, and lookup_sem stays,
but becomes global to protect the disk lookup (similar to the previous
global bdev_map_lock).

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
