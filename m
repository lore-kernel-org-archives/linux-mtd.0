Return-Path: <SRS0=bCBt=FV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C32BC4361B
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Dec 2020 21:45:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82C9B23B6E
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Dec 2020 21:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82C9B23B6E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kqa+U2kPOKqDCICcfmdUgrOfaI8REthbcH7RJpEuH94=; b=riT2KAjmfEb0USn5QF8/c0KQng
	K1zfH89NlT2LDlIcyIEloOuN5iC0S/BM3EfyxaGqp5B3RTzlZ5TDfo1ENqEOgeqA1Vyg+pzS1dAES
	vEwmDCQ1Xyr/d4zrZ7JjnB1ARBXfnFFei/5mkmJpFaMU01IORg1AFf1VOkG35MJxgiYzfU7Gxy3B2
	nlglKu2ZsrfGuZsdYwo43JBsvBQ/ujZZrWkQSM2tEDxchdxuQeHfz/fbjnUC8yUnfBSJGrboS8NVx
	xGMNC9uk3NLAuU/AcNc5bSFbBOaosdsy3BIxov073eDLS2W5NPNWjq1xLKioWVugbNl5fv2QpP4Q/
	9WayKE1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kq14e-00061K-Ed; Thu, 17 Dec 2020 21:44:36 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kq14c-00060a-2J
 for linux-mtd@lists.infradead.org; Thu, 17 Dec 2020 21:44:35 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 569D4627AFCE;
 Thu, 17 Dec 2020 22:44:22 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id MUWZ5Ib-p4CA; Thu, 17 Dec 2020 22:44:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id AE3CB627AFF0;
 Thu, 17 Dec 2020 22:44:21 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Ho1x2lLklSZJ; Thu, 17 Dec 2020 22:44:21 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8BD42627AFCE;
 Thu, 17 Dec 2020 22:44:21 +0100 (CET)
Date: Thu, 17 Dec 2020 22:44:21 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Message-ID: <2026739641.140019.1608241461469.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] JFFS2, UBI and UBIFS updates for 5.11-rc1
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Index: GQILcsYmmMsZqedHlVTLw1jJcSYSlA==
Thread-Topic: JFFS2, UBI and UBIFS updates for 5.11-rc1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_164434_354047_E6DDEE0D 
X-CRM114-Status: UNSURE (   9.54  )
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

The following changes since commit b65054597872ce3aefbc6a666385eabdf9e288da:

  Linux 5.10-rc6 (2020-11-29 15:50:50 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-5.11-rc1

for you to fetch changes up to b80a974b8c58164ed57b0f025a47b8f003198d9e:

  ubifs: ubifs_dump_node: Dump all branches of the index node (2020-12-13 22:12:42 +0100)

----------------------------------------------------------------
This pull request contains changes for JFFS2, UBI and UBIFS:

JFFS2:
- Fix for a remount regression
- Fix for an abnormal GC exit
- Fix for a possible NULL pointer issue while mounting

UBI:
- Add support ECC-ed NOR flash
- Removal of dead code

UBIFS:
- Make node dumping debug code more reliable
- Various cleanups: less ifdefs, less typos
- Fix for an info leak

----------------------------------------------------------------
Chengguang Xu (1):
      ubifs: Code cleanup by removing ifdef macro surrounding

Chengsong Ke (2):
      ubifs: Fix the printing type of c->big_lpt
      ubifs: Remove the redundant return in dbg_check_nondata_nodes_order

Fangping Liang (1):
      ubifs: Fixed print foramt mismatch in ubifs

Jamie Iles (1):
      jffs2: Fix NULL pointer dereference in rp_size fs option parsing

Pratyush Yadav (1):
      ubi: Do not zero out EC and VID on ECC-ed NOR flashes

Randy Dunlap (2):
      ubifs: Delete duplicated words + other fixes
      jffs2: Fix if/else empty body warnings

Richard Weinberger (1):
      ubifs: wbuf: Don't leak kernel memory to flash

Tom Rix (1):
      jffs2: remove trailing semicolon in macro definition

Wang ShaoBo (1):
      ubifs: Fix error return code in ubifs_init_authentication()

Zhe Li (1):
      jffs2: Fix GC exit abnormally

Zhihao Cheng (5):
      ubifs: Limit dumping length by size of memory which is allocated for the node
      Revert "ubifs: Fix out-of-bounds memory access caused by abnormal value of node_len"
      ubifs: Pass node length in all node dumping callers
      ubifs: ubifs_dump_sleb: Remove unused function
      ubifs: ubifs_dump_node: Dump all branches of the index node

k00524021 (1):
      ubi: Remove useless code in bytes_str_to_int

lizhe (2):
      jffs2: Fix ignoring mounting options problem during remounting
      jffs2: Allow setting rp_size to zero during remounting

 drivers/mtd/ubi/build.c |   6 +--
 drivers/mtd/ubi/io.c    |   9 +++-
 fs/jffs2/debug.h        |  23 +++++-----
 fs/jffs2/jffs2_fs_sb.h  |   1 +
 fs/jffs2/nodelist.h     |   4 +-
 fs/jffs2/readinode.c    |  16 +++++++
 fs/jffs2/super.c        |  32 ++++++++++---
 fs/ubifs/auth.c         |   4 +-
 fs/ubifs/commit.c       |   4 +-
 fs/ubifs/debug.c        | 116 ++++++++++++++++++++++++++++--------------------
 fs/ubifs/debug.h        |   5 +--
 fs/ubifs/dir.c          |   4 +-
 fs/ubifs/file.c         |   8 +---
 fs/ubifs/io.c           |  52 ++++++++++------------
 fs/ubifs/journal.c      |   3 +-
 fs/ubifs/lpt.c          |   4 +-
 fs/ubifs/master.c       |   4 +-
 fs/ubifs/orphan.c       |   6 ++-
 fs/ubifs/recovery.c     |   6 +--
 fs/ubifs/replay.c       |   6 +--
 fs/ubifs/sb.c           |   2 +-
 fs/ubifs/scan.c         |   4 +-
 fs/ubifs/super.c        |   6 +--
 fs/ubifs/tnc.c          |  10 ++---
 fs/ubifs/tnc_misc.c     |   7 ++-
 fs/ubifs/ubifs.h        |  10 +++--
 26 files changed, 203 insertions(+), 149 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
