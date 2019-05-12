Return-Path: <SRS0=9VLx=TM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA00DC04A6B
	for <linux-mtd@archiver.kernel.org>; Sun, 12 May 2019 21:42:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B5A02089E
	for <linux-mtd@archiver.kernel.org>; Sun, 12 May 2019 21:42:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JraBzWNK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B5A02089E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5XEnnT3ZkJnG94VUFW5h0o0n0LVhfMYS3kLwGfiHF+o=; b=JraBzWNKXju8f5
	QVuXPYc5Z4CXfXTZ7Lsgz/gL9kNJQ6RrxLaTKMhdMBdXqyEJ9YAqhYcgE+SVUewdvGVBGitAzc9Ho
	vbfBIxAaG36SONShPCVPxJAoybx0Q42UVqToSaJY8rd5Mf2qew7fAidSR4zKtqfyeCCW1OX1MNOSB
	27VZOwvEWC5adV37WZQpHgNZTStVVe8W6hKyCdC0tmbo8sji/lQ/304TozOvT0zNRxIP6aBeWtUqN
	ZRS1wCWsYVlGGpe7U/iuV1TDks640roH0YCK1dvdA1lpd1iGcHvueXeG0stFYG1dtW2360FafpMSb
	LVvp2U7b9jW+3WKMYZpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPwEp-0004jW-5h; Sun, 12 May 2019 21:42:31 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPwEl-0004iS-QN
 for linux-mtd@lists.infradead.org; Sun, 12 May 2019 21:42:29 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 9EDAB6083105;
 Sun, 12 May 2019 23:42:26 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id D2MeRBObez8u; Sun, 12 May 2019 23:42:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 499036083106;
 Sun, 12 May 2019 23:42:26 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id wrwgI9aogwER; Sun, 12 May 2019 23:42:26 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2A0B06083105;
 Sun, 12 May 2019 23:42:26 +0200 (CEST)
Date: Sun, 12 May 2019 23:42:26 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Message-ID: <2058307720.56057.1557697346125.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] UBI/UBIFS changes for v5.2-rc1
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.8_GA_3025 (ZimbraWebClient - FF60 (Linux)/8.8.8_GA_1703)
Thread-Index: q2S9vZko+Wx+u2XNEMK1d3JpTp5ORg==
Thread-Topic: UBI/UBIFS changes for v5.2-rc1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190512_144227_998774_0A516260 
X-CRM114-Status: UNSURE (   8.05  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Linus,

The following changes since commit 37624b58542fb9f2d9a70e6ea006ef8a5f66c30b:

  Linux 5.1-rc7 (2019-04-28 17:04:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/upstream-5.2-rc1

for you to fetch changes up to 04d37e5a8b1fad2d625727af3d738c6fd9491720:

  ubi: wl: Fix uninitialized variable (2019-05-07 21:58:33 +0200)

----------------------------------------------------------------
This pull request contains the following changes for UBI/UBIFS

- fscrypt framework usage updates
- One huge fix for xattr unlink
- Cleanup of fscrypt ifdefs
- Fix for our new UBIFS auth feature

----------------------------------------------------------------
Andrey Abramov (1):
      ubifs: find.c: replace swap function with built-in one

Arnd Bergmann (1):
      ubifs: work around high stack usage with clang

Eric Biggers (2):
      ubifs: remove unnecessary calls to set up directory key
      ubifs: remove unnecessary #ifdef around fscrypt_ioctl_get_policy()

Gustavo A. R. Silva (1):
      ubi: wl: Fix uninitialized variable

Richard Weinberger (3):
      ubifs: journal: Handle xattrs like files
      ubifs: orphan: Handle xattrs like files
      ubifs: Limit number of xattrs per inode

Sascha Hauer (4):
      ubifs: Do not skip hash checking in data nodes
      ubifs: Remove #ifdef around CONFIG_FS_ENCRYPTION
      ubifs: Remove ifdefs around CONFIG_UBIFS_ATIME_SUPPORT
      ubifs: Drop unnecessary setting of zbr->znode

YueHaibing (1):
      ubifs: remove unused function __ubifs_shash_final

 drivers/mtd/ubi/wl.c    |   2 +-
 fs/ubifs/auth.c         |  35 +++-----
 fs/ubifs/debug.c        |   1 -
 fs/ubifs/dir.c          |  29 ++++---
 fs/ubifs/file.c         |  16 ++--
 fs/ubifs/find.c         |   9 +--
 fs/ubifs/ioctl.c        |  11 +--
 fs/ubifs/journal.c      |  72 ++++++++++++++---
 fs/ubifs/misc.h         |   8 ++
 fs/ubifs/orphan.c       | 208 ++++++++++++++++++++++++++++++++----------------
 fs/ubifs/sb.c           |   7 +-
 fs/ubifs/super.c        |  22 ++---
 fs/ubifs/tnc.c          |  15 ++--
 fs/ubifs/ubifs.h        |   6 +-
 fs/ubifs/xattr.c        |  71 +++++++++++++++--
 include/linux/fscrypt.h |  11 +++
 16 files changed, 345 insertions(+), 178 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
