Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD8EC46CD2
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 17:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oAvk3JMD8R6YulSvNxYfKpLgW/9HxAOMhfjIpKdJMUc=; b=XjydVwMF9a0vUb
	POC4zOfDkBasqPxeJQW7ssPMHvk/PF+ZS/y8RkCdiLRkG/AQLJWzIQp3u0J6AKQ0OTrhBvN9e/evH
	izTQGoWeLYrdOnJ+knH17uyo+kdMbDGIsvFO7WmPSLRPgOaJhGbudL4GGyCCsk33CcvGuuoQ2vkip
	0hv6821Oq3UIkggIycyN0pfdVCuYrPskIEiSImLonkDaaBui2i1EcSC4unM4Z7tIRCgkW5KaLXndP
	xLhN2LyAiHPXwOA0eSaHnsYr3aNeO/UZbQsPxAJmSp1zXR8q4JBiQDuMeDvjC5K/aFvtvuyHNePUe
	TwbVmpQf5O90whyHqCXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rShR5-004Zry-2c;
	Wed, 24 Jan 2024 17:53:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rShQz-004Zmz-2u
	for linux-mtd@bombadil.infradead.org;
	Wed, 24 Jan 2024 17:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=KIHKjMrmXii2s6PaWw+dbO58TgoigeoBYMJZiEihKLo=; b=u6WyCK/n6JslhJJsotj+W8YNSA
	IPcH/vK7jOnPI6nB4w8qPCR8XoeXHQ36FRQv83ixZO+gs08sMdLcwDvkVyOy9rmGDnV3NWfQx0TuJ
	JDDtQGqJZM/chiDMtpByXkAYv1JLd2dImuZKI2UJ9y2juPHxEBQUb8ihMuw1X+0dyZR7NZKVqk/pu
	SoGZFHQaf39DHDFNPlR7gPC7mN6M7lZTc5S/mHULI7ltHyYiJ5hy06Yhitnp8e6O1PRjquuXeqZDe
	2JTuLnVTjj/KDehs55NOIpmY5jFKf1FlW+VWJEUwJYriQSdOJrRrsjb3DFppiFDN1YxusnaNfuSOl
	ckXNajTg==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rShQu-00000007LVJ-2h20;
	Wed, 24 Jan 2024 17:53:04 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2 00/15] ubifs folio conversion
Date: Wed, 24 Jan 2024 17:52:43 +0000
Message-ID: <20240124175302.1750912-1-willy@infradead.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

This patchset converts ubifs to use folios throughout.  I made some
attempt to support large folios, but more work definitely needs to be
done before it can be enabled.  It's not clear to me whether it's worth
doing, so I've left that for you ;-)

The first patch fixes a misplaced call to SetPageUptodate which has been
with us since the initial merge of ubifs.  It looks to be a pretty hard
race to hit, which is why it probably hasn't affected anyone.

With my usual test config, this saves about 2kB of kernel text (almost
1%).  Some functions shrink more than others, eg ubifs_write_begin
reduces by almost a third.  YMMV with different configs.

I've done a few other updates while I'm in here; eg setting/clearing
PageError is pointless because the VFS doesn't use it and ubifs doesn't
test it.  And we're phasing out use of PagePrivate / folio_test_private()
in favour of just testing whether folio->private is set.

I ran this through xfstests and it didn't seem any worse.

v2:
 - Incorporate feedback from Zhihao Cheng
   - Avoid setting PageUptodate in write_begin_slow() as well
   - Check len == folio_size(), not >=
   - Add R-b tags
 - Don't bother clearing PageUptodate in ubifs_write_begin as we don't
   set it now.

Matthew Wilcox (Oracle) (15):
  ubifs: Set page uptodate in the correct place
  ubifs: Convert from writepage to writepages
  ubifs: Convert ubifs_writepage to use a folio
  ubifs: Use a folio in do_truncation()
  ubifs: Convert do_writepage() to take a folio
  ubifs: Convert ubifs_vm_page_mkwrite() to use a folio
  ubifs: Convert write_begin_slow() to use a folio
  ubifs: Convert ubifs_write_begin() to use a folio
  ubifs: Convert ubifs_write_end() to use a folio
  ubifs: Convert do_readpage() to take a folio
  ubifs: Convert allocate_budget() to work on a folio
  ubifs: Convert cancel_budget() to take a folio
  ubifs: Pass a folio into ubifs_bulk_read() and ubifs_do_bulk_read()
  ubifs: Use a folio in ubifs_do_bulk_read()
  ubifs: Convert populate_page() to take a folio

 Documentation/mm/page_cache.rst |  10 +
 fs/ubifs/file.c                 | 443 ++++++++++++++++----------------
 2 files changed, 231 insertions(+), 222 deletions(-)

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
