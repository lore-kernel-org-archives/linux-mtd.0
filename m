Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A5CC87FCA
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jul 2025 17:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QDyqrdpz6SFiYCl6WK+iFpwgV36DwjEmSrxNj/csNXg=; b=XL+/sPnJL4OtqT
	hVbXGN255Vi/kUApuTwovJrtp2ZNUbAV1IV6mIALNk0Uxo+Eb/9kLNBQvDerCOs+6aoDEpJPxVvjx
	ja2grv2UyyL1FO3sE0MBM+9QRPPa0s2Y937H0YWWV6tIs7iF8z5KMBqU9IP/2DO3Dh1xJ3ALf2BZc
	lFWlEQw5HdyOMy/4RyiWrB/bWUdpUZDCMU+Ww1V+WY9p6cT5INwgz0I5O9sb4f8rtEqdEi9zGe8Xh
	vcKP+vvx5+dTB8Lkmz5gqE1q7sDNBeuCSSXgihgQQduIKyiBGugkIknk9VDsMGisaT4xuW4c5UaY/
	A6bJtqDJSvsz7gJKYquQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhXTu-00000004CcY-3X3z;
	Thu, 31 Jul 2025 17:54:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhXTu-00000004CcO-1TS3
	for linux-mtd@lists.infradead.org;
	Thu, 31 Jul 2025 17:54:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A14D6020E;
	Thu, 31 Jul 2025 17:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD8FC4CEEF;
	Thu, 31 Jul 2025 17:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753984455;
	bh=LUXFIDwCk4Q5JcQ2wMwBg2ZA5aGbL01KnpHmo6j+ps8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=pyn2h2kJ6sY0urM3kyazLKJ1nVW9Ak/z8rVxqmDgBB0BtYw1QfHuxPwashMr2KZiK
	 A+ZTgQtVqEpGc7LPoEscnL4UHkJyGOyQQZpjoc6/AUYUiksbKO5u71gRNA1Xl331WB
	 mrKLdrMzlUjcfJ/GmMYN18IAQXb9+YY31UvYzy4DFOcfrxG48m8ll5s5as9twacQif
	 bh+oycXwfUrcxAbftCz8bfKKUEC/kbo1oiC/Rb7UkwxpD4eF5qaP891VC0WQ4TQXx5
	 /s+DK1Yt7QbzNmgubyoVfPdthFHQe2NoAVZnv9ncPq44cnpuJTq8WLoqhoQLQB49wo
	 9gXN1JOjMdo0g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCCF383BF51;
	Thu, 31 Jul 2025 17:54:32 +0000 (UTC)
Subject: Re: [GIT PULL] UBI and UBIFS changes for v6.17-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <7787490.DFzTOozpa1@nailgun>
References: <7787490.DFzTOozpa1@nailgun>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <7787490.DFzTOozpa1@nailgun>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.17-rc1
X-PR-Tracked-Commit-Id: 99dbb2a1bd661418be33b1ff1462c09b7d2221cf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4522ae2def5a8ed155642f947131726e427d2f05
Message-Id: <175398447128.3232013.6131617014280004374.pr-tracker-bot@kernel.org>
Date: Thu, 31 Jul 2025 17:54:31 +0000
To: Richard Weinberger <richard@sigma-star.at>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel@vger.kernel.org
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

The pull request you sent on Tue, 29 Jul 2025 22:10:26 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.17-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4522ae2def5a8ed155642f947131726e427d2f05

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
