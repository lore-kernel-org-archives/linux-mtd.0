Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB924C433E2
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 15:13:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D364221EE
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 15:13:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v5omIrvI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GPkxwUMd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D364221EE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wb6BorNJr+xK1RO4ur4Q/tDx8TQu5pwUxVe+RRDKnzQ=; b=v5omIrvIi2GHRz4Oaj8mK9tdNx
	VcAhvgveagkcA74MB72bVrQWPaV3pSovdGv6/8yjn79ot98XpTXNd3N4/9B1wnawQxGbZhrispFq0
	3PnpoYFsWZYSWE6/mm7pqNMtiZu3Fhj3yYPryUxyolTK1FUt5psgTHKYA+DR/lJGg0iYkQ3bbokN2
	u/zobr2s6eCYTuYLf12OJcZiNkMaw34XB13Wr/x4/74iDBmXvjUykqqPktsYDBfkoFkCEBF802dub
	oFdqkDUi2IhtU6Jom/ydYYhYM0F+Cml8pnWn5wEWxxgg1Vsjf+dIUO5QF9B/7SPSrpX7+fnExL83D
	qOE8f7Lw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIvaE-0000yR-7r; Thu, 17 Sep 2020 15:12:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIvYp-00005o-Pd; Thu, 17 Sep 2020 15:10:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=lu11y1IB6qPsE9QG9F+oQMlPRPTZIY05Da6y3WAX60M=; b=GPkxwUMdgSb1OJ4/VmsY06Tw3d
 wGaBexmE5C59ZCk9mEQrvh9oEg9vXINOmQweMRoeaKlDN+2g7USOiJ7p9L6bGvMTgyOEzZOtR669A
 jIht28BCCCPOx7e6FE0aFJU+a0OyffBNocDLpE1149X17KE2LrFn/XIZhTexixrbCr/7fuXh5bEIC
 5+5CsSw56eGm4LgIdvEOovoEjzYZrFmqYQ0NKJCGq7JspTlxSRfyl5i2MbjOV1DdvtIMrAzZjoYaL
 ynre9v/sxNEHLDS79EF6RrWV5KTmLFDCVpjgtJr0LUrFEcYXA87AZmSArmQz3cvHn2mHKHdPH2VNi
 a4wd79ow==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kIvYi-0001PE-2q; Thu, 17 Sep 2020 15:10:52 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH 00/13] Allow readpage to return a locked page
Date: Thu, 17 Sep 2020 16:10:37 +0100
Message-Id: <20200917151050.5363-1-willy@infradead.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
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
Cc: linux-cifs@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 ecryptfs@vger.kernel.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, v9fs-developer@lists.sourceforge.net,
 ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Linus recently made the page lock more fair.  That means that the old
pattern where we returned from ->readpage with the page unlocked and
then attempted to re-lock it will send us to the back of the queue for
this page's lock.

Ideally all filesystems would return from ->readpage with the
page Uptodate and Locked, but it's a bit painful to convert all the
asynchronous readpage implementations to synchronous.  These ones are
already synchronous, so convert them while I work on iomap.

A further benefit is that a synchronous readpage implementation allows
us to return an error to someone who might actually care about it.
There's no need to SetPageError, but I don't want to learn about how
a dozen filesystems handle I/O errors (hint: they're all different),
so I have not attempted to change that.

Please review your filesystem carefully.  I've tried to catch all the
places where a filesystem calls its own internal readpage implementation
without going through ->readpage, but I may have missed some.

Matthew Wilcox (Oracle) (13):
  mm: Add AOP_UPDATED_PAGE return value
  9p: Tell the VFS that readpage was synchronous
  afs: Tell the VFS that readpage was synchronous
  ceph: Tell the VFS that readpage was synchronous
  cifs: Tell the VFS that readpage was synchronous
  cramfs: Tell the VFS that readpage was synchronous
  ecryptfs: Tell the VFS that readpage was synchronous
  fuse: Tell the VFS that readpage was synchronous
  hostfs: Tell the VFS that readpage was synchronous
  jffs2: Tell the VFS that readpage was synchronous
  ubifs: Tell the VFS that readpage was synchronous
  udf: Tell the VFS that readpage was synchronous
  vboxsf: Tell the VFS that readpage was synchronous

 Documentation/filesystems/locking.rst |  7 ++++---
 Documentation/filesystems/vfs.rst     | 21 ++++++++++++++-------
 fs/9p/vfs_addr.c                      |  6 +++++-
 fs/afs/file.c                         |  3 ++-
 fs/ceph/addr.c                        |  9 +++++----
 fs/cifs/file.c                        |  8 ++++++--
 fs/cramfs/inode.c                     |  5 ++---
 fs/ecryptfs/mmap.c                    | 11 ++++++-----
 fs/fuse/file.c                        |  2 ++
 fs/hostfs/hostfs_kern.c               |  2 ++
 fs/jffs2/file.c                       |  6 ++++--
 fs/ubifs/file.c                       | 16 ++++++++++------
 fs/udf/file.c                         |  3 +--
 fs/vboxsf/file.c                      |  2 ++
 include/linux/fs.h                    |  5 +++++
 mm/filemap.c                          | 12 ++++++++++--
 16 files changed, 80 insertions(+), 38 deletions(-)

-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
