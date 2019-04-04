Return-Path: <SRS0=4b6q=SG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6284C4360F
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Apr 2019 22:35:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85221206DF
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Apr 2019 22:35:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PniIezR2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85221206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ttzorVRRbcHbmtYpGfDnE/8QgEgS3H/sQRoA/JYqDSU=; b=PniIezR2q8Y+/C
	ZZPgqkwrvvYNAEdxIYNKhuUMQ0lD9g16Mit3/A2++AAnTE+PEPXkfpbwAJbmepw1wDKklWq07e8Ph
	HG9hekQqNRONA9NZ7dTWDH5fQE16D1bCUI0KcV6ij1Jwp7uegaZesPzP8Cbo8dP/BXB81h7cCVvYs
	fMuaWPmFX4OBGTHhS4iwhJQWnIJ2o5AykVLcjVX+hwurrkYTrVxUMrd2X2k7cBDTxWVv4x2EMWD4f
	6XCm263L5b0NA+C+JP6AFg9eOZizI6m8Ya5cxoFY2alnEQjosjRkqRu8zBBXFaJ6fq2ejacb+pFBb
	sL0DbLi50/lt+H42eTmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCAwr-0008Id-Ba; Thu, 04 Apr 2019 22:35:05 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCAwo-0007mf-9R
 for linux-mtd@lists.infradead.org; Thu, 04 Apr 2019 22:35:04 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 2802018011B38;
 Fri,  5 Apr 2019 00:34:58 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/3] UBIFS: xattr deletion rework
Date: Fri,  5 Apr 2019 00:34:35 +0200
Message-Id: <20190404223438.29408-1-richard@nod.at>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_153502_554964_F6213053 
X-CRM114-Status: GOOD (  11.54  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, stefan@agner.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

UBIFS handles xattrs in most cases just like files.
An inode can have child entries, which are inodes for xattrs.
If an inode with xattrs is unlinked, only the hosting inode is
referenced in the journal and the orphan list. Upon recovery
all xattrs will be looked up from the TNC and also deleted.

This works in theory, but not in practice. The problem is that
in many places UBIFS internally assumes that a directory inode
can only be deleted if the directory is empty. Since xattr
hosting inodes are treated like directories but you can unlink
such an inode before all xattrs are gone, this assumption is violated.
Therefore it can happen that the garbage collector consumes a LEB
which hosts the information about xattr inodes because the host inode
itself got unlinked. Upon recovery UBIFS is no longer able to
locate these inodes and the free space accounting can get confused.
This can lead to all kind of filesystem corruptions.

The solution is to log every inode in the journal upon unlink.
This approach has one downside, we need to lower the amount of allowed
xattrs per inode.
With this changes applied UBIFS still supports dozens of xattrs per
inode.

Hunting down this issue down was anything but easy.
I'd like to thank Toradex AG for supporing this bug hunt.
Special thanks to Stefan Agner for his constant support and testing my
debug patches over and over.

Richard Weinberger (3):
  ubifs: journal: Handle xattrs like files
  ubifs: orphan: Handle xattrs like files
  ubifs: Limit number of xattrs per inode

 fs/ubifs/dir.c     |  15 +++-
 fs/ubifs/journal.c |  72 ++++++++++++++++---
 fs/ubifs/misc.h    |   8 +++
 fs/ubifs/orphan.c  | 208 ++++++++++++++++++++++++++++++++++++-----------------
 fs/ubifs/super.c   |   2 +
 fs/ubifs/ubifs.h   |   4 ++
 fs/ubifs/xattr.c   |  71 ++++++++++++++++--
 7 files changed, 294 insertions(+), 86 deletions(-)

-- 
2.16.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
