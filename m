Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836A6E6ADD7
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Nov 2024 01:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GL9gLh14iJDd8RDPzAIjefI8looUaubJ7agzfjrJVjs=; b=G7A5XpX5fzAz9w
	KqJEV3UQPWc+HwlHqDbBGXuDjqzpObF36bD7KsjJVCPmrelwtOa5CQK2C2uL2oPMCOH9Yw9xEISIs
	NaU53G1jy8J/XlYCpQdXMUjSipCYfqI/DFgie8i8I9YjeMtanCfcKLg6oM6ccyJprztlN07yLfIJ6
	XrlOzsXl/XMFzQCU+J49l0OpHb+V/oTODowMMqf9wwjjBQGtsAxB1o6ekrPUrrcQ7hkQYzFFUv31F
	ChJzZYIf5HdwkcayZoQ06QHi44fhre9HVhaTvQNtV8jHjWrOq+Q8iMwb5uBLYAdURHF40Yiu+BANe
	VfFYEGLJ4u7xOvNwptWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEezl-00000003c9G-1gLV;
	Sat, 23 Nov 2024 01:31:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEezi-00000003c7z-2Q3V
	for linux-mtd@lists.infradead.org;
	Sat, 23 Nov 2024 01:31:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 64AD0A4172B;
	Sat, 23 Nov 2024 01:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49C40C4CECE;
	Sat, 23 Nov 2024 01:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732325489;
	bh=P2xRV/mrYqeAq073l/P1gEXSxR8K8QpPNg9Y99vgmo8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=k38AaJ29OTtqvvXQYqKMo+dKaSgxDD+UKfXwoDCB9KyS28N1t/hwsKeKmJP8AxLoU
	 DyX5wZdCQAGI0jKMSajsCW++XW4V7vzJma5ZThPh9lds2Vnj2ZWftEAPNOn6Xs7zmE
	 Pfnav3j2gek1VmZxXltKtyhCk3qy7Ods85djx3WSvMTf81SIl02NVUYvUcKEJ1O0zi
	 rvFNzWB+hEZmMuQL2RxiuKad4uQCeC7jELttdXE2J6bl9ZBs0V0gJbWW5+jskge9iQ
	 NFVnEoz2Ul92fe8xZ+/0xBXkeP0KGwZp5sNuXR6iBdf9E6Kc8TK19p48IJL3NbsqtD
	 8wocwRpsgWPnA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE25E3809A00;
	Sat, 23 Nov 2024 01:31:42 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for 6.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <87serkr1n6.fsf@bootlin.com>
References: <87serkr1n6.fsf@bootlin.com>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <87serkr1n6.fsf@bootlin.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.13
X-PR-Tracked-Commit-Id: 944477516bda30bc11e2c30e355da8dd6df48aaf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d0c9a21c8e0b2d7c55a2174f47bd0ea1d7302de6
Message-Id: <173232550136.2863978.8248541798179276949.pr-tracker-bot@kernel.org>
Date: Sat, 23 Nov 2024 01:31:41 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_173130_679909_822C3C91 
X-CRM114-Status: UNSURE (   4.72  )
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

The pull request you sent on Thu, 21 Nov 2024 17:29:33 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d0c9a21c8e0b2d7c55a2174f47bd0ea1d7302de6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
