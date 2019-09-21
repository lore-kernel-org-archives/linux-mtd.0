Return-Path: <SRS0=szY+=XQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 437F4C49ED7
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Sep 2019 07:37:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15255206B6
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Sep 2019 07:37:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YUTgDbI+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15255206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IIQ908hK0yN6lgSRZqYhXIf9JxkndNxRHFm6q6aXzWg=; b=YUTgDbI+6kFqc0
	D/Lzc5WYsLf3ov7ff3dN44SHhOKZRJ/LYrDbR54Ms+f9pcPTUKCfuTBvXXYSDQiXBZnG7sV1xa4FI
	sSAD1Na/SXe+zw2LUQoJw2843iB24ASVNkXNHlY5Mbfxo6e0t0t9x8rQvnUOl/tv5s6xBv0zD8WLy
	GtTld9Gmf2HWXGVDfFFmZyKbrS+eBzsooG78uoD6oGfvCLR/HkuQGCebLfYLbnbs7KGQN/jYwAdPL
	o/E5CcOnAAmEHeSnKnlDdHyOSn8qhxpnU90moBMgWqRKqTburZpFsnNZfPDbejxNFi7rnw8zltupQ
	mCxhynb5nK1CV5ZFp44Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBZxA-0007Ay-Ts; Sat, 21 Sep 2019 07:37:13 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBZwp-0006y1-2Y
 for linux-mtd@lists.infradead.org; Sat, 21 Sep 2019 07:36:52 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 7DCC7613E499;
 Sat, 21 Sep 2019 09:36:42 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id pDRSi2FE9BcI; Sat, 21 Sep 2019 09:36:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 36990613E49B;
 Sat, 21 Sep 2019 09:36:42 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 74EVnzMEAycD; Sat, 21 Sep 2019 09:36:42 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 171ED613E499;
 Sat, 21 Sep 2019 09:36:42 +0200 (CEST)
Date: Sat, 21 Sep 2019 09:36:42 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Message-ID: <1224182178.3529.1569051402039.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] UBI/UBIFS/JFFS2 updates for 5.4-rc1
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF60 (Linux)/8.8.12_GA_3809)
Thread-Index: XWVcrwQH697MbsYhdr9Nkm4o9xdpbw==
Thread-Topic: UBI/UBIFS/JFFS2 updates for 5.4-rc1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190921_003651_407744_357F2481 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Linus,

The following changes since commit 089cf7f6ecb266b6a4164919a2e69bd2f938374a:

  Linux 5.3-rc7 (2019-09-02 09:57:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/upstream-5.4-rc1

for you to fetch changes up to 6a379f67454a3c740671ed6c7793b76ffecef50b:

  jffs2: Fix memory leak in jffs2_scan_eraseblock() error path (2019-09-15 22:42:41 +0200)

Please note that there is a small merge conflict between
9163e0184bd7d5f ("ubifs: Fix memory leak bug in alloc_ubifs_info() error path")
from UBIFS tree and 

50d7aad57710e2b ("vfs: Convert ubifs to use the new mount API")
from VFS tree.

----------------------------------------------------------------
This pull request contains the following changes for UBI, UBIFS and JFFS2:

UBI:
- Be less stupid when placing a fastmap anchor
- Try harder to get an empty PEB in case of contention
- Make ubiblock to warn if image is not a multiple of 512

UBIFS:
- Various fixes in error paths

JFFS2:
- Various fixes in error paths

----------------------------------------------------------------
Christoph Hellwig (1):
      jffs2: Remove jffs2_gc_fetch_page and jffs2_gc_release_page

Colin Ian King (1):
      ubifs: Remove redundant assignment to pointer fname

Jia-Ju Bai (1):
      jffs2: Fix possible null-pointer dereferences in jffs2_add_frag_to_fragtree()

Richard Weinberger (2):
      ubi: Don't do anchor move within fastmap area
      ubi: block: Warn if volume size is not multiple of 512

Wenwen Wang (4):
      ubifs: Fix memory leak in read_znode() error path
      ubifs: Fix memory leak in __ubifs_node_verify_hmac error path
      ubifs: Fix memory leak bug in alloc_ubifs_info() error path
      jffs2: Fix memory leak in jffs2_scan_eraseblock() error path

Zhihao Cheng (1):
      ubi: ubi_wl_get_peb: Increase the number of attempts while getting PEB

 drivers/mtd/ubi/block.c      | 43 +++++++++++++++++++++++++++++++++++--------
 drivers/mtd/ubi/fastmap-wl.c |  6 +++---
 drivers/mtd/ubi/wl.c         |  6 ++++++
 fs/jffs2/fs.c                | 27 ---------------------------
 fs/jffs2/gc.c                | 21 +++++++++++++--------
 fs/jffs2/nodelist.c          |  2 +-
 fs/jffs2/os-linux.h          |  3 ---
 fs/jffs2/scan.c              |  5 ++++-
 fs/ubifs/auth.c              |  4 +++-
 fs/ubifs/debug.c             |  1 -
 fs/ubifs/super.c             |  4 +++-
 fs/ubifs/tnc_misc.c          |  1 +
 12 files changed, 69 insertions(+), 54 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
