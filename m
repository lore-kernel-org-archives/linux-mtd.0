Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DFEC47DDF
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Jan 2024 23:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xr6mDjYVecSCR6oT8xgiXLlhw/DNZwzhFmfFvCluRVI=; b=YmiNQblkPagWvz
	7UfFec4SaALL/prhEgdSoMLzUTFu9Zn0y3yiyq1WvQOOIEtRNpysrlnG2SRF1tR/5BsejkT8Ry8bi
	OzClqaLXj3ENDE4GZLeG4Pec1EmEHu9OGKPSVZtGOd7cmfK5D+OJwvFIw4+ALO8ot3iTNMqG2t7Yi
	B9tP7Y4UpMYnDFnmwVFa+Zfg61bip3XPPPX9RmBzWvPgzihIbEZAVv/Rchd4EzydKLBXKtzmQ5wNq
	qJZF5utu73YMoasBAiflXjBahC/kTUp2VsNjqHO5WnZWz28S504Rf9JekGy2CPHUNh9i7BNkakR2r
	2cSVi65zaFx0AWg0ZElQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKS8-008ZN7-24;
	Sat, 20 Jan 2024 23:08:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKRz-008ZJZ-07
	for linux-mtd@bombadil.infradead.org;
	Sat, 20 Jan 2024 23:08:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=aKPU1GuhbqrjhCwGcCbXEW4LCUpoELTARGXwBlRSxWI=; b=c1PhC0+vcyPiG1ObWdWIEhoxgu
	yHUT3CM4wWlowx1Q4x1icwNK5Mu+/IJZnhao6vGN+KFe52PXz6LQeajhVBthlu9VCKhcfHkPGdefA
	JAVRYmeRQq2YusYOlO389u4EEnXGesX+0yOqWFidarK3+0Z5riwHOuFSbHyfxQ+wea3zAMcGLCcae
	zGxZ8hv8ZWPZ7/5n+Eqt+J1YcX2HRyR1dDGrCL1ES4oR5rAiyxInIz02ulaK3ec6Ay/SGTtB0dgha
	aHX9yx0Eq1xtxw1aLCYzhDLYkhzHDrC9MoXkx3EOmcdrLwE/cZsESb33Jox0oQlRcHtFvrQwvJW7p
	YL1UkMkg==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rRKRu-0000000AzVl-36k2;
	Sat, 20 Jan 2024 23:08:26 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 00/15] ubifs folio conversion
Date: Sat, 20 Jan 2024 23:08:08 +0000
Message-ID: <20240120230824.2619716-1-willy@infradead.org>
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
 2 files changed, 232 insertions(+), 221 deletions(-)

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
