Return-Path: <SRS0=n6ut=BV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9174DC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2020 01:38:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B5AF206DA
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2020 01:38:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gwitiwQG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nkeZ+7iV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B5AF206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXSIpTE4CZtXwOE5GHZj742t/U7gsQ+7kFkIe4Ur7Po=; b=gwitiwQGy3a1Yt/+y1T38vJOl4
	KptzQDQk3Y4TZiM8jzMaUQAzxR1fUKQiVlUHP9W4Xr+RgZudlyo3nTh98mVv9mLuZ0Ij35MvCG/z6
	uGii8WWKkNhszCUGRX1qhE2tl90mUnjhXGvZc0a3pec42dXiKvfHIXLUHuLPfcjkVJkmM93auKeDj
	JJJ40Pgtn6Yx22w2kyiN8J6IJ1WlV4O47/TVB1o3z4FJcIH25Tvn4gwbzIqwe8t++GRHtY8srK0oK
	YeclQnsYIqe484l7PUrzd4o7cqw4UPapTYRaADOm1GYX5WL9Ne7gKNxAuk2WHXT0+/C3g+4qhiYx6
	0nLm3Ghw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5JEB-0004C8-IG; Tue, 11 Aug 2020 01:37:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5JE5-0004BN-IM
 for linux-mtd@lists.infradead.org; Tue, 11 Aug 2020 01:37:18 +0000
Subject: Re: [GIT PULL] JFFS2, UBI and UBIFS changes for 5.9-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597109836;
 bh=enLc1wTRtRZNdcVLmThs4vQUkO9KUfGLLJQLQBG6qsQ=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=nkeZ+7iVQGuzZUWvTQPwNPp4Lj5bORb0BUKPsr8el/8q609NY4ZhFLMvYRVkvidBv
 v/dsLRPBiSt83K1dXkc2oDys+CJS8hORGLgnymXsjW0gEfnHD0kFLp8jUyoHr6X/j0
 8BFHvwggSM6icmW0VGZ077mV/oqaQlotaBUKDU8w=
From: pr-tracker-bot@kernel.org
In-Reply-To: <1956790813.229084.1597084052878.JavaMail.zimbra@nod.at>
References: <1956790813.229084.1597084052878.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list
 <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <1956790813.229084.1597084052878.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git
 tags/for-linus-5.9-rc1
X-PR-Tracked-Commit-Id: 798b7347e4f29553db4b996393caf12f5b233daf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 163c3e3dc0ddcea3edac51612fced13c597f37dc
Message-Id: <159710983614.12600.18082596157940908446.pr-tracker-bot@kernel.org>
Date: Tue, 11 Aug 2020 01:37:16 +0000
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_213717_780574_21E354B6 
X-CRM114-Status: UNSURE (   4.76  )
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
 torvalds <torvalds@linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Mon, 10 Aug 2020 20:27:32 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-5.9-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/163c3e3dc0ddcea3edac51612fced13c597f37dc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
