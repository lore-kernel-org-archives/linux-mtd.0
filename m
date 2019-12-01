Return-Path: <SRS0=K/pU=ZX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E590AC432C3
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Dec 2019 20:19:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B623B20833
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Dec 2019 20:19:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kW7mj/Ez"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B623B20833
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YtMJA6ZtaAQ793MkjNn+hyCBWaz2nBwl7KuUHkw+Ce8=; b=kW7mj/EzacjVCZ
	coyqlZ4um+TSODBJ4q+MKhgF6Z2dCLgLSzKKHBkmkCx9/RtpeOGz/Cw9Y3FmBGwwsavoBxOb4NCVH
	/lfAL+Ml3DCrShSwzKR8hwHSBPzJVRCg4omOJM+WuEZvKWttaqT7L5JBD4AsMm9OJROsF76ias6EO
	KBwwa4CkXiNI/sugXKmwLCfp0wd/vRn2Uc81pHAG35ywhQyzHUQyZ0oEDnqBXWYYkaCs3Ej8iiL/V
	nK4UFA5UXpMkcwdVEKWC9f3L+wf5TdMFRkvrby544WZo0SX9I52Y3JWxj42UsaPfYwvCfJbDXXSWl
	yktKHS0erxouUOCK8Zjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibVgI-0007Pn-Vh; Sun, 01 Dec 2019 20:18:58 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibVgD-0007Ok-2Q
 for linux-mtd@lists.infradead.org; Sun, 01 Dec 2019 20:18:54 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2D70C6075EB6;
 Sun,  1 Dec 2019 21:18:48 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 1qL7f3SkNBTT; Sun,  1 Dec 2019 21:18:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A40D56126B4E;
 Sun,  1 Dec 2019 21:18:47 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id CChYr051KwzE; Sun,  1 Dec 2019 21:18:47 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 7CBB56075EB6;
 Sun,  1 Dec 2019 21:18:47 +0100 (CET)
Date: Sun, 1 Dec 2019 21:18:47 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Message-ID: <1044415561.103245.1575231527451.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] UBI/UBIFS/JFFS2 changes for v5.5-rc1
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Index: p5Yb5RXGCOXDDkhbu+z8eXKDdqTkQw==
Thread-Topic: UBI/UBIFS/JFFS2 changes for v5.5-rc1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191201_121853_406083_15251C32 
X-CRM114-Status: UNSURE (   7.89  )
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

The following changes since commit ec5385196779fb927e7d8d5bf31bef14d7ce98ed:

  Merge tag 'iommu-fixes-v5.4-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu (2019-11-17 11:27:44 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/upstream-5.5-rc1

for you to fetch changes up to 6e78c01fde9023e0701f3af880c1fd9de6e4e8e3:

  Revert "jffs2: Fix possible null-pointer dereferences in jffs2_add_frag_to_fragtree()" (2019-11-29 11:29:58 +0100)

----------------------------------------------------------------
This pull request contains mostly fixes for UBI, UBIFS and JFFS2:

UBI:
- Fix a regression around producing a anchor PEB for fastmap.
  Due to a change in our locking fastmap was unable to produce
  fresh anchors an re-used the existing one a way to often.

UBIFS:
- Fixes for endianness. A few places blindly assumed little endian.
- Fix for a memory leak in the orphan code.
- Fix for a possible crash during a commit.
- Revert a wrong bugfix.

JFFS2:
- Revert a bad bugfix in (false positive from a code checking
  tool).

----------------------------------------------------------------
Ben Dooks (Codethink) (3):
      ubifs: Force prandom result to __le32
      ubifs: Fixed missed le64_to_cpu() in journal
      ubifs: Fix type of sup->hash_algo

Joel Stanley (1):
      Revert "jffs2: Fix possible null-pointer dereferences in jffs2_add_frag_to_fragtree()"

Richard Weinberger (2):
      ubifs: Remove obsolete TODO from dfs_file_write()
      Revert "ubifs: Fix memory leak bug in alloc_ubifs_info() error path"

Rishi Gupta (1):
      ubi: Fix warning static is not at beginning of declaration

Sascha Hauer (1):
      ubi: Fix producing anchor PEBs

Stefan Roese (1):
      ubi: Print skip_check in ubi_dump_vol_info()

Zhihao Cheng (2):
      ubifs: do_kill_orphans: Fix a memory leak bug
      ubifs: ubifs_tnc_start_commit: Fix OOB in layout_in_gaps

 drivers/mtd/ubi/debug.c      |  1 +
 drivers/mtd/ubi/fastmap-wl.c | 31 ++++++++++++++++++-------------
 drivers/mtd/ubi/fastmap.c    | 14 +++++---------
 drivers/mtd/ubi/ubi.h        |  8 +++++---
 drivers/mtd/ubi/wl.c         | 32 ++++++++++++++------------------
 drivers/mtd/ubi/wl.h         |  1 -
 fs/jffs2/nodelist.c          |  2 +-
 fs/ubifs/debug.c             | 12 ------------
 fs/ubifs/journal.c           |  4 ++--
 fs/ubifs/orphan.c            | 17 ++++++++++-------
 fs/ubifs/sb.c                |  2 +-
 fs/ubifs/super.c             |  4 +---
 fs/ubifs/tnc_commit.c        | 34 +++++++++++++++++++++++++++-------
 13 files changed, 85 insertions(+), 77 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
