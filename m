Return-Path: <SRS0=KvES=SJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73BFFC282E0
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Apr 2019 16:15:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41E5220880
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Apr 2019 16:15:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cN4Dfztt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TuM2vav8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41E5220880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ZzpxXFWqbCtIWBbrrg7rTmsjb1HGynoQNkAvXAB5lM=; b=cN4DfzttrVpSBE
	N/16JIq/lVhvCVQY0rqDKdWg1gEWAE1Qk5niB7dA8zfc/PQkH7yVDRcXxwd7YomLexaEn5gDSsQph
	YJPwpSPwMmXFcSHmNdUMZHSbK5OmeeY1lAh9RSqKKPtHx0Tz6kIr3r05jFiGA6ijOT0OK1lZsRwKM
	UfWqf8qTCshlmuGpF4qwjlqBEofkuKg5ljpdiBVD+7shyvZjipJrvL3iUHoZ9wKYsO+3MQQaVlF8z
	EE0DC4BnPB8lxHRay82Sr3Z9Y3BIk2yKuGPg1m5zEL94DCEYINLqv+Cefn2pCCROzDywB2YjBiFoA
	ASsgh+6UN4K5HIHii/6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDARs-0002p8-FP; Sun, 07 Apr 2019 16:15:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDARp-0002hN-6p
 for linux-mtd@lists.infradead.org; Sun, 07 Apr 2019 16:15:10 +0000
Subject: Re: [GIT PULL] MTD fixes for 5.1-rc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554653707;
 bh=S1kY1Dm+Rq/FpUxJt89LMRm4ps718Dkd5ZsWKiDj9vc=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=TuM2vav86IbYQO0lGM0IMGvQvVbKH3CPWlOscIoEee7Mgbfa/eprd3aKfe7+MWQlK
 wGxCHlueqRyBv+NXjJnBBaGaqOITGthbsw+6ECExhGtslP8SOBrkTSs5+/rHhLgabg
 j9vcEbLd61BBCD1uKpsZV1iapJ865lr40zqd4yyw=
From: pr-tracker-bot@kernel.org
In-Reply-To: <8693488.C880lHxeKj@blindfold>
References: <8693488.C880lHxeKj@blindfold>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <8693488.C880lHxeKj@blindfold>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
 tags/mtd/fixes-for-5.1-rc4
X-PR-Tracked-Commit-Id: d9b8a67b3b95a5c5aae6422b8113adc1c2485f2b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 82331a70cc3c2901c4ae36ff88d5a28f6d14df32
Message-Id: <155465370750.27442.14839112383403541193.pr-tracker-bot@kernel.org>
Date: Sun, 07 Apr 2019 16:15:07 +0000
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190407_091509_268956_3EB2EFB0 
X-CRM114-Status: UNSURE (   1.42  )
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
Cc: linux-mtd@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Sun, 07 Apr 2019 16:38:29 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-5.1-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/82331a70cc3c2901c4ae36ff88d5a28f6d14df32

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
