Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B1CC4829E
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 20:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vdq+RydSUhuwvT4YInanLp2Ql2SR7DuBMC4yu4+ng7s=; b=oAx6+K7HTyOK9H
	bBqoI89ALLbRrFSxvnEDRh7MABjHEd435w9tDs1FJblnVaxKacB6zKqPSRYd/pi4VS911+aAxko8I
	RaE97j5tsilaTcnbyIDubEI2ueCCUlgs2XeN6LB0GdDjhLpJEU8RkRIhp/cqGx6Taj5Gb9rh6uLp/
	GYlkLNM9hxaN9Va1rF3+altHdErbneTiZ6f6vqMRpaVuroi0yoNJ8ODXJMo1TZhT2GS24rfxbRZ0J
	DDngxbUPXrmW7AGCiKZt0iSfYeTylAqjxMeQAkGZ2fJllMVNEs0nkKWBMApEWHT5D5qTX2693qaUH
	eKjWwMjv2rGvTHtyC3sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raicb-000000006Oy-248M;
	Thu, 15 Feb 2024 20:46:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raica-000000006Od-2F75
	for linux-mtd@bombadil.infradead.org;
	Thu, 15 Feb 2024 20:46:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+z4rGQZFoYCxvDM9qJAlIrA1bhvxNK4if0wFnknwVx0=; b=Qr11ufeKpYMp/5SmMRUGLxjkIH
	OcE6xSonUXi/Z4FT6k0dfVSoYfhUP+1eI1XJ0dtFcff+vYcB+YuDOOAKgMk8i1+UwnnJmisvw0Msh
	yePHlf0Se3XDEhDJnWDG04CY77dL0DgCBQOWFwOI9DiJ5p+A6ui/tYK4M6ejZdZzkktBrihrKMau3
	/NeVVC7nUPcrMbvcOS1zTvEhuNAubHPDOLFT8O6Gnx8RgLGGHj9xo/UbIcCYYAPnntX7rXpREDP5T
	VuTKXljaLTDBTS8t40GGEKQRQYvib2B/80Wx8MM8DYVgwNaDzMa5MW6BCwYf8dJW9rXjEdCD+xDQ7
	ichts9YA==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raicZ-00000002oX1-15EN;
	Thu, 15 Feb 2024 20:46:15 +0000
Date: Thu, 15 Feb 2024 20:46:15 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 00/15] ubifs folio conversion
Message-ID: <Zc54F3q6O1gYiMA4@casper.infradead.org>
References: <20240120230824.2619716-1-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240120230824.2619716-1-willy@infradead.org>
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

On Sat, Jan 20, 2024 at 11:08:08PM +0000, Matthew Wilcox (Oracle) wrote:
> This patchset converts ubifs to use folios throughout.  I made some
> attempt to support large folios, but more work definitely needs to be
> done before it can be enabled.  It's not clear to me whether it's worth
> doing, so I've left that for you ;-)

It's been four weeks ... do I need to do anything to make sure this hits
the next merge window?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
