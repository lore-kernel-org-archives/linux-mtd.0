Return-Path: <SRS0=HLk0=BU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9466EC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2020 18:28:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 518CC207FF
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2020 18:28:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UbIlcOgZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 518CC207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H/6DAGGub8V009r5bldbaC1A22QFEriOjaJCe+MQAX8=; b=UbIlcOgZMXry0uIqxKcgPYvo+d
	RaevIj+eWq5MrqluqyQJ0s0KcLdQ0JaTZKNVXgMDms3Gh3X8E/oWOPs3NFBb2CZJ8NPMhdT6yIm2s
	8kJJoahKHo8WRdsU0n1t4TdMRr92JNSd7CuTV5kXBtrW+Ii87ldpoARs+5Aagxt9pJDLYUgHsrwKn
	lRUwQ8bpIt/IhVJLDnsXgiyV5V6cc6oi4rlsD2VMI0AUATZKZb0HvkbmV3WR1twGfBS1LIMEnc/yn
	cIdHev59yN3H+fBkyBWom4sQSWloZ2FtcxankJGsjCtuyPs5tycQY6xxS9YDNrHlfOcD1bpxmrwv4
	dP3Dpk2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5CWQ-0004ER-6E; Mon, 10 Aug 2020 18:27:46 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5CWN-0004Dl-FI
 for linux-mtd@lists.infradead.org; Mon, 10 Aug 2020 18:27:44 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id CA06161D8ABB;
 Mon, 10 Aug 2020 20:27:33 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id zb-VI0CWQOcx; Mon, 10 Aug 2020 20:27:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 48A7261D8ABC;
 Mon, 10 Aug 2020 20:27:33 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Nb3mRZ3V-BmY; Mon, 10 Aug 2020 20:27:33 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id F347161D8ABB;
 Mon, 10 Aug 2020 20:27:32 +0200 (CEST)
Date: Mon, 10 Aug 2020 20:27:32 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Message-ID: <1956790813.229084.1597084052878.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] JFFS2, UBI and UBIFS changes for 5.9-rc1
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Index: mNdKbqCSj6uMvkVJNBiccwZGdeEXuw==
Thread-Topic: JFFS2, UBI and UBIFS changes for 5.9-rc1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_142743_645838_07C50494 
X-CRM114-Status: UNSURE (   9.59  )
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

The following changes since commit 92ed301919932f777713b9172e525674157e983d:

  Linux 5.8-rc7 (2020-07-26 14:14:06 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-5.9-rc1

for you to fetch changes up to 798b7347e4f29553db4b996393caf12f5b233daf:

  jffs2: fix UAF problem (2020-08-02 23:56:13 +0200)

----------------------------------------------------------------
This pull request contains changes for JFFS2, UBI and UBIFS

JFFS2:
        - Fix for a corner case while mounting
        - Fix for an use-after-free issue

UBI:
        - Fix for a memory load while attaching
        - Don't produce an anchor PEB with fastmap being disabled

UBIFS:
        - Fix for orphan inode logic
        - Spelling fixes
        - New mount option to specify filesystem version

----------------------------------------------------------------
Martin Kaistra (1):
      ubifs: add option to specify version for new file systems

Randy Dunlap (1):
      ubifs: misc.h: delete a duplicated word

Zhe Li (2):
      jffs2: fix jffs2 mounting failure
      jffs2: fix UAF problem

Zhihao Cheng (3):
      ubi: fastmap: Don't produce the initial next anchor PEB when fastmap is disabled
      ubi: fastmap: Free fastmap next anchor peb during detach
      ubifs: Fix wrong orphan node deletion in ubifs_jnl_update|rename

 drivers/mtd/ubi/fastmap-wl.c |  5 +++++
 drivers/mtd/ubi/wl.c         |  3 ++-
 fs/jffs2/dir.c               |  6 +++++-
 fs/jffs2/scan.c              |  3 ++-
 fs/ubifs/journal.c           | 10 ++++++----
 fs/ubifs/misc.h              |  2 +-
 fs/ubifs/sb.c                |  5 +++--
 fs/ubifs/super.c             | 18 ++++++++++++++++++
 fs/ubifs/ubifs.h             |  1 +
 9 files changed, 43 insertions(+), 10 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
