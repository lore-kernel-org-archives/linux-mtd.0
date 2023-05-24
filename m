Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2F0C77B7C
	for <linux-mtd@archiver.kernel.org>; Wed, 24 May 2023 06:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9C6ImriLI9z1nko3QQFXe8Jf2MWzQs0VDY64WZxTogA=; b=lCWSaxhGIk9n4v
	kqtDBmHfSZpzyFIFItQFkS4S78b251uqmlbsMEtvPKmIOmuJLsHyRHqj15VWIb3A+KksPGIsPTZo7
	RFFeBoSLKWcuwUOl/rvzKWg26KbH8In9eUKRU0lJDrOtK/r4v/wz4idQJS8C3Bn2RUgRnL6JJJ5yt
	wWlcWNtGh8f5uMAlRBJvQ63nf0HTK0CKIUDgsxGmQSziUQUNTd9+qvxlLiWEmw7f16O29fthoYW5p
	yZ04iEzLDIpHamj+QPGBmp4MrhlfnfkIXeRdwH/WVXppmZuCwutRKboYHmwlxEFSvKJfwUvK9H0qs
	wbZdnDfDUJBZZiVKm0jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1heY-00CSv9-25;
	Wed, 24 May 2023 06:07:18 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1heU-00CStT-39
	for linux-mtd@lists.infradead.org;
	Wed, 24 May 2023 06:07:16 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id BB12668CFE; Wed, 24 May 2023 08:06:59 +0200 (CEST)
Date: Wed, 24 May 2023 08:06:59 +0200
From: Christoph Hellwig <hch@lst.de>
To: Mike Snitzer <snitzer@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Pavel Machek <pavel@ucw.cz>,
	dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 19/24] dm: remove dm_get_dev_t
Message-ID: <20230524060659.GB19611@lst.de>
References: <20230523074535.249802-1-hch@lst.de> <20230523074535.249802-20-hch@lst.de> <ZGzujNVLaQD2npwH@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZGzujNVLaQD2npwH@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_230715_159769_B2B1FD39 
X-CRM114-Status: GOOD (  13.06  )
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

On Tue, May 23, 2023 at 12:49:16PM -0400, Mike Snitzer wrote:
> > -		dev = dm_get_dev_t(path);
> > -		if (!dev)
> > +		r = lookup_bdev(path, &dev);
> > +		if (r)
> > +			r = early_lookup_bdev(path, &dev);
> > +		if (r)
> >  			return -ENODEV;
> >  	}
> >  	if (dev == disk_devt(t->md->disk))
> 
> OK, but you aren't actually propagating the exact error code.  Did
> you intend to change the return from -ENODEV to r?

Yes, thanks.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
