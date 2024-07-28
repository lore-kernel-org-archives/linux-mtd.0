Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8F7C3DA49
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Jul 2024 21:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0WX0KzvyOtwPKuL43HJSRnHxWZM42Qyop7hPiPXkZHU=; b=HCl1O46+AsolsM
	i6YqT5IXN+i0OmlxdTel4dn+WyL+YOPah0oIvraKhfin08ycvIaBdYxdSdFefyfWsOYQ/KH1Oo3LF
	QLrSRT8ts/d2zNnBb+M3PLm804yTUOPRN7T5LKN40Xhm3CjFuk4mYFIC9kmGxQFKtfeoU7b7jBW0R
	BIy5+wI6N1DjDqKXe9nmwv3Glv0/IEahXbvYutiGNDvnZ8q6UFJXh3pRLZjvhO1K6gtsftAw2v7GN
	p7jplV5plSHyZNuA9I2xTRdRFtefzCsIVtY2O52vqu3oAh86FaGtncSCfXfL9hPg87MgPR0mcQhjD
	5ZTPUwsOh9hREy3zzxhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYB24-00000009D7y-2kAb;
	Sun, 28 Jul 2024 21:02:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYB21-00000009D7G-3r6g
	for linux-mtd@lists.infradead.org;
	Sun, 28 Jul 2024 21:02:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B8AC6125A;
	Sun, 28 Jul 2024 21:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF7F0C116B1;
	Sun, 28 Jul 2024 21:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722200536;
	bh=RNpn3G8zVlMkxWCpXLTYBpMBKGrgyR2rlTLGWZYMHK4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kEp0DWyPMRTn7gyhfQFO+sfoMbcLYOuflHDassJs86od5M1Xi6m/HKiL/1TWkV9qi
	 +Qj+47T+FlnTO9xoo4TGo9DvL426y/WLxAABZ1dWZ2QiSF74bFNO7QgRq/j2DqGKRt
	 +F9y9tnv4X4yRqIpYj8PUp7bUW0UIj4FP9DGQW5mhjfPqynFHVhKRKXP9CcFAOZ9Wn
	 QP2dPwojt9529ikKBO99OlomMmbyOO9+v+tzHoqo/iRVxNgMD2vqGpT5I/Sjb/EZpD
	 MAvGZO5Bcv54/ljDUI8DduwZFtQsMkPRS804gOqqlL7QXTx1bBB5e6uMQY0KKOiPtX
	 Omg3tEo/lGdpw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E71A0C4332C;
	Sun, 28 Jul 2024 21:02:15 +0000 (UTC)
Subject: Re: [GIT PULL] UBI and UBIFS updates for v6.11-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <896050924.123729.1722027514568.JavaMail.zimbra@nod.at>
References: <896050924.123729.1722027514568.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <896050924.123729.1722027514568.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.11-rc1
X-PR-Tracked-Commit-Id: 054fd15984454f031611d6c63675fc578aad0cb1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 92a286e90203ce3e6c3a6d945fa36da419c3671f
Message-Id: <172220053593.30183.4770887148877294609.pr-tracker-bot@kernel.org>
Date: Sun, 28 Jul 2024 21:02:15 +0000
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240728_140218_043643_34B82460 
X-CRM114-Status: UNSURE (   3.35  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Fri, 26 Jul 2024 22:58:34 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.11-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/92a286e90203ce3e6c3a6d945fa36da419c3671f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
