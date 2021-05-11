Return-Path: <SRS0=SBmy=KG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C0FC433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 11 May 2021 10:38:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7C4361164
	for <linux-mtd@archiver.kernel.org>; Tue, 11 May 2021 10:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7C4361164
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZGqgrrEoo+SBQptEmxbiraMmPQ2kGlopeUZfrxa/yoA=; b=g7o2tgLIFs/Ryu3+1rGwAktzw
	UEUnK3L8HMsScLHrUrhofaotryjGHkMAkKLxTQiM4+sSFI1rBDYVSeAets6tsH7d7rl7B5KgxtsvX
	IgXmy0jy0vGahdZUcmImnBplCGFSK1sE4SpDjSeVAzrg8O/1EfXcK50uh0K89C0z0GGnbNSCKHRK1
	6Pro0zhTeGAWe+R1UlUMLr/IrBUsVSfElOmTZu5i8H8HBRz25Hrw8sduZcFh2FtoRtox7yaWLeCDp
	QD9uG0GdFNGSLkl2lsm+VTDpxH4+RRB/XDB45N1m1u6QLE+6G23Z4FaDFBtMNKOX17LHhCNmi+cc2
	2jLN8BC+Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgPle-00GyYh-CH; Tue, 11 May 2021 10:37:34 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgLHW-00GN8A-9R
 for linux-mtd@desiato.infradead.org; Tue, 11 May 2021 05:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yco034uI0B68LYEKYpkjV38JBFJeCq3hmyI5CzmrJfI=; b=LmDe9LaSzgSwaMJhv/WfpLl1Y5
 dwR9Z7dVPBrq3Q+YT6hohTdh1Z4xhnJOghyMzxb+hJn5RgS9WLNjQsW7go8GK5gu54bFTRSOxfxr/
 DX3qaPSVYKr8TNIkC4XVFl8R1Dx6LXVPQzeB4uwjK43IvBtyR6c5qGL0LWVrA85NXmmQVgxxNVKxs
 G0nB3UQ50haUoUvYO0Z08CDCMHge8mG39Fr9RdNbrIwIeLUG8IcqprD0T7sDc8Wqo8sUWbP4vzUb/
 y4GxCFsugM/ws/NYJRfuGM5XbyRFh29RPdbAJ90vnwFXPCgflufl7DWYFCQFC6/zO6BlvOYJfAAsZ
 HWx7vYbQ==;
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgLHP-009K5S-Tm
 for linux-mtd@lists.infradead.org; Tue, 11 May 2021 05:50:05 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6E35167373; Tue, 11 May 2021 07:49:55 +0200 (CEST)
Date: Tue, 11 May 2021 07:49:55 +0200
From: Christoph Hellwig <hch@lst.de>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>,
 Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v4] mtd: super: don't rely on mtdblock device minor
Message-ID: <20210511054955.GA6542@lst.de>
References: <20210510121837.14274d4f@xps13> <YG9qzC/SaD7SNWVm@makrotopia.org>
 <YHRj5MUb5MGdPQqw@makrotopia.org> <YJmx3Ru/5oyq6Y1a@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJmx3Ru/5oyq6Y1a@makrotopia.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_225004_128456_80FF4049 
X-CRM114-Status: GOOD (  16.28  )
/bin/ln: failed to access
 'reaver_cache/texts/20210510_225004_128456_80FF4049': No such file or
 directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_225004_128456_80FF4049 
X-CRM114-Status: GOOD (  11.87  )
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

On Mon, May 10, 2021 at 11:21:17PM +0100, Daniel Golle wrote:
> For blktrans devices with partitions (ie. part_bits != 0) the
> assumption that the minor number of the mtdblock device matches
> the mtdnum doesn't hold true.
> Properly resolve mtd device from blktrans layer instead.

Why are you changing the legacy lookup method that is clearly deprecated
in favor of the mdt* syntax?

> +
> +	if (MAJOR(bdev->bd_dev) == MTD_BLOCK_MAJOR) {
> +		if (!bdev->bd_disk)
> +			goto error_mtdblock;

bdev->bd_disk can't be NULL.

>  
> +		blktrans_dev = (struct mtd_blktrans_dev *)(bdev->bd_disk->private_data);

Overly long line due to the not actually required cast.

But more importantly you can't just look at the private data of a random
block device that you just opened.  There is absolutely no guarantee that
it actually points to a specific private data.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
