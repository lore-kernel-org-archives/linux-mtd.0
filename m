Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97F4C77B73
	for <linux-mtd@archiver.kernel.org>; Wed, 24 May 2023 06:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ott5TO0YtkpyKC9pe/Vn7AY6NFCcX3UT5zLyRe03a3A=; b=th8v45j/H0yzUI
	N/GmSpx/lOPFdbkEpNg6ClYJWJfiiqBQ1pNIhqNeDjaHyfJkFy6u/1JyzVqmrmCqjCcM6w9TAswJ4
	4pGoLT4qLxSdUBbfZtCYEBO6Ui/iKSuVOgBHkDhu2gHoMvE5KypHjjLn95otqTi2OwJGyv7f9gtG8
	tH92/2jTCXjwCuNuIXdCtcykouKo60DaOt2CXiY4YISXgwk7HBQCgx2tf7vwJ37BuAO8vjrnQdI+v
	sLmBdLHk0M5774UrrjtXdAJDCls+qWk89UTfyUoB7DYn34LLFqyLiRXCeW535/oK8FHHBQU9Z6l23
	nBs8ThKAQD99SlbXm7eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1hg3-00CT5c-0S;
	Wed, 24 May 2023 06:08:51 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1hg0-00CT4s-1m
	for linux-mtd@lists.infradead.org;
	Wed, 24 May 2023 06:08:49 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 4CF6E68CFE; Wed, 24 May 2023 08:08:45 +0200 (CEST)
Date: Wed, 24 May 2023 08:08:44 +0200
From: Christoph Hellwig <hch@lst.de>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mike Snitzer <snitzer@kernel.org>,
	Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Pavel Machek <pavel@ucw.cz>,
	dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 15/24] block: move the code to do early boot lookup of
 block devices to block/
Message-ID: <20230524060844.GC19611@lst.de>
References: <20230523074535.249802-1-hch@lst.de> <20230523074535.249802-16-hch@lst.de> <b384f464-92c6-6a14-4072-1faa9fa6a6a8@infradead.org> <e96e4e85-7371-2859-b9a5-0f2c1f3b97d9@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e96e4e85-7371-2859-b9a5-0f2c1f3b97d9@infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_230848_732501_10E8BE33 
X-CRM114-Status: GOOD (  14.01  )
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

On Tue, May 23, 2023 at 09:59:50PM -0700, Randy Dunlap wrote:
> >>  	root=		[KNL] Root filesystem
> >> -			See early_lookup_bdev comment in init/do_mounts.c.
> >> +			See early_lookup_bdev comment in block/early-lookup.c
> > 
> > Patch 13 does this:
> > 
> >  	root=		[KNL] Root filesystem
> > -			See name_to_dev_t comment in init/do_mounts.c.
> > +			See early_lookup_bdev comment in init/do_mounts.c.
> > 
> > Should this latter chunk be dropped?
> > 
> 
> Oh, oops, reverse order of patches?

Patch 13 renames the function, this patch moves it.  So I think this
correct, but feel free to double check my foggy brain :)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
