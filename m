Return-Path: <SRS0=BfTn=HX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F2FC433DB
	for <linux-mtd@archiver.kernel.org>; Sun, 21 Feb 2021 22:03:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B0B565043
	for <linux-mtd@archiver.kernel.org>; Sun, 21 Feb 2021 22:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B0B565043
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPfgC1R7dD0z0VWd5YtxZW1z+F/B17urHBHR0Xblhoc=; b=vGpo50hKeULToLsEvKIDDYybIi
	lqId7nCey9mXIceRhhyVrcuaTatS573x08CuDrSwjiCoWTwBBCgUb1aM6rfnoQOQTz0c+CwNfx6rd
	wwoe1XcvZfYQIiS+Jd1r7kGAxd+KshVJguLV6qOkgKtYkxP/Rkpyken5N91PJFQdN7ZVrE9gS/HD7
	NrTSDbIqkkGs8FeHriFx4sadfx7a7LTp/ooDQQnujI2DoMN3k9ebchUrbPKbwGTfChn3wKp9gkdHZ
	hRqb58Vuwz5Yi74oKa+rBjy4l14aX6DuO+11/cKWPplNQ6ymnYrSBUOf3xqD454UE/JxoOLs8Os8f
	WVptPVeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lDwnk-0003w2-K6; Sun, 21 Feb 2021 22:02:04 +0000
Received: from [198.145.29.99] (helo=mail.kernel.org)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lDwng-0003u1-9L
 for linux-mtd@lists.infradead.org; Sun, 21 Feb 2021 22:02:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 014DB64EC8;
 Sun, 21 Feb 2021 22:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613944911;
 bh=dwRDg5jNz8Zp8rEPN2dZ9dovdk1dBdGQUuB9UGzIf9o=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=E4Uu+/hXx40xMpgaKkm2oNdDqgzJtvPCfZYHmqRznEnC8keGxe0xRp9fur702/rPz
 W2M/C4GTmroZHhTf1qjVmI8c3csUP0NUv+N4iyKaIkgq+WLXnfieEgz+h4xxuLagkl
 sJdn9dSZDkfmDa9qa6DXZYm1zpILSNdafHFZJRJ0ED6uRviO1SyBx1b37X64yCmETC
 M/+ekH+3Z6gIqj9SIrAFiHM2mwwzft/lXQMMLHIRHGfwQJCehXKwxWMjqx+Br4l/vd
 3ODARGASXiJ386185loQ6d46WLJifjEuAA1sycZhciTNMrMvXARuJhbE+MXDBAyJ/q
 RkhCFLklIZUGg==
Subject: Re: [GIT PULL] MTD changes for 5.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <1860844222.14898.1613937724518.JavaMail.zimbra@nod.at>
References: <1860844222.14898.1613937724518.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list
 <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <1860844222.14898.1613937724518.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-5.12
X-PR-Tracked-Commit-Id: 6e9dff6fe3fbc452f16566e4a7e293b0decefdba
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 69e9b12a27a1b2d099e528928162428df4d6e93f
Message-Id: <161394491098.8676.12625244745780820419.pr-tracker-bot@kernel.org>
Date: Sun, 21 Feb 2021 22:01:50 +0000
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210221_170200_426552_B6A7D046 
X-CRM114-Status: UNSURE (   4.84  )
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
 Miquel Raynal <miquel.raynal@bootlin.com>,
 torvalds <torvalds@linux-foundation.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Sun, 21 Feb 2021 21:02:04 +0100 (CET):

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/69e9b12a27a1b2d099e528928162428df4d6e93f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
