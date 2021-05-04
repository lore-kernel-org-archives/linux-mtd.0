Return-Path: <SRS0=rMW0=J7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC680C433ED
	for <linux-mtd@archiver.kernel.org>; Tue,  4 May 2021 20:17:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7063361003
	for <linux-mtd@archiver.kernel.org>; Tue,  4 May 2021 20:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7063361003
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1cVR0IHJ+RHQs0Ci7cR3flEuaqst6do98p+HoiKpIMY=; b=X3fw0HFfFn5X3WsKW4eJB2W+NI
	lxbPVGsKikgodBg2rNEGWdpTKTQ5lfUv7yHh2RSNI3IVPX7kbWNEMCAdiBJpK20y/MFJLj2qOlu1q
	DC+GuHnW49nui+HWh3occ2BB3/lqoBW4YcP4N9p6CVc9n1CGd7wNVv+753C2CJqMqim+TH5VDaeXW
	QB25sMowMxjxFvH2rdbNQHELrJ+XG4CwLcuJDx6hPfB7Aje6b2a3Bo0+vb2cWKc6+ZuD3P5awVRFn
	28fTcgcj/HiUa1TVb+RXScRh4CAlWv1988SwBw8F+yxhi0V1ogUEIce4iSoeyFcwJgoIJvKOhWROo
	7HI5CF7Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1le1Su-00H09u-Og; Tue, 04 May 2021 20:16:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le1Sr-00H09j-DV
 for linux-mtd@desiato.infradead.org; Tue, 04 May 2021 20:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Message-ID:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=jHBfGTqd+3CfDEvqADdJnId8bOnLKjsIwDCNhXWK48Y=; b=zchGsJzsoMYmM4976EQ0dgoLq2
 eMdFFCgigwc0QYKG0NsvmkTSAUqto/myyA7vg184RdG/LHhKTSDKCH+K9beWSPm/eS+rupGx4m7Vz
 Bv8Tnzs5sLbiHNwtl7vzYDsav3EMobPQYA9ULbGaxj5WhBAHqTVko4qA1eUFxRoHefJOs/0i9P6Ew
 qJ7iZIR2As4BEesaCvfTdAjzKlsdwGwLrQ4sRGhtetBR5YRLVd0JGyyawuovDj4A81RDMRuuFaX0i
 Wg8bbcAWZxggmovupeoMDKfyul7SVpFFloi5bFFp1i1z4herRWt3FcoaHND9XfFlKp4hAn5ORR+Ej
 JaGZDGOg==;
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le1So-004FIy-E9
 for linux-mtd@lists.infradead.org; Tue, 04 May 2021 20:16:16 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id E636E616B584;
 Tue,  4 May 2021 22:16:02 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id nF_cEsHtKrhB; Tue,  4 May 2021 22:16:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 7E19F616B581;
 Tue,  4 May 2021 22:16:02 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id h1XM32xtwEee; Tue,  4 May 2021 22:16:02 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 486B7608A38A;
 Tue,  4 May 2021 22:16:02 +0200 (CEST)
Date: Tue, 4 May 2021 22:16:02 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1258125270.55580.1620159361990.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] JFFS2, UBI and UBIFS changes for 5.13
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Index: e8eii+QRwXewm5Jz3riefse6I71Cfg==
Thread-Topic: JFFS2, UBI and UBIFS changes for 5.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_131614_663312_43952ACE 
X-CRM114-Status: UNSURE (   6.92  )
X-CRM114-Notice: Please train this message.
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

Linus,

The following changes since commit d434405aaab7d0ebc516b68a8fc4100922d7f5ef:

  Linux 5.12-rc7 (2021-04-11 15:16:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-5.13-rc1

for you to fetch changes up to 9a29f7f020e06f14eb126bcb84a7f0d166415824:

  ubi: Remove unnecessary struct declaration (2021-04-15 22:01:25 +0200)

----------------------------------------------------------------
This pull request contains changes for JFFS2, UBI and UBIFS

JFFS2:
- Use splice_write()
- Fix for a slab-out-of-bounds bug

UBI:
- Fix for clang related warnings
- Code cleanup

UBIFS:
- Fix for inode rebirth at replay
- Set s_uuid
- Use zstd for default filesystem

----------------------------------------------------------------
Arnd Bergmann (1):
      jffs2: avoid Wempty-body warnings

Guochun Mao (1):
      ubifs: Only check replay with inode type to judge if inode linked

Gustavo A. R. Silva (1):
      ubi: Fix fall-through warnings for Clang

Joel Stanley (1):
      jffs2: Hook up splice_write callback

Martin Devera (1):
      ubifs: Report max LEB count at mount time

Rui Salvaterra (1):
      ubifs: Default to zstd compression

Steffen Trumtrar (1):
      ubifs: Set s_uuid in super block to support ima/evm uuid options

Wan Jiabing (1):
      ubi: Remove unnecessary struct declaration

lizhe (1):
      jffs2: Fix kasan slab-out-of-bounds problem

 drivers/mtd/ubi/build.c |  1 +
 drivers/mtd/ubi/ubi.h   |  2 --
 fs/jffs2/file.c         |  1 +
 fs/jffs2/scan.c         |  2 +-
 fs/jffs2/summary.h      | 16 ++++++++--------
 fs/ubifs/replay.c       |  3 ++-
 fs/ubifs/sb.c           |  3 +++
 fs/ubifs/super.c        |  6 ++++--
 8 files changed, 20 insertions(+), 14 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
