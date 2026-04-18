Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D39F99C6E
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Apr 2026 01:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9x4eEaXNm4aWltLxXpyv1C6yu67dPYQAHgCKQpoWiaE=; b=LWty75U9oMOjJO
	RuSOYksPluXW33EVx3+CamFU4p4uyYrwQq4X7Vq1ZOcc+4OO4Sws5IcU3Q/nOO5V9bzyjKwMNvH8/
	Gamn18DOKMZIP5xy9XUsGEqhvVbgdY7U+nkx8Tmgl3gB4CLYy34U/uaKzqmKeF+M1RDLPMdx1nLKW
	7fkuTVk2xKb/IABWtQygPWrhbIzK4O2MMXYYAGUx9Pd43LDDQR12YuhlVuN2IoJs7t6iCNpiBBE2t
	6C45KsnsuC6GpboGAWiHqZIa6OiPH9m9Zfb+Bdft1JBvBMtlBhMolZMokSZ+kVjzcSPk/z67lb1AT
	z6JD5poAbEZZpKd6uklw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDuA0-00000004drX-2D1R;
	Sat, 18 Apr 2026 01:07:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDu9z-00000004drR-1rpW
	for linux-mtd@lists.infradead.org;
	Sat, 18 Apr 2026 01:07:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3082660052;
	Sat, 18 Apr 2026 01:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5543C19425;
	Sat, 18 Apr 2026 01:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776474465;
	bh=A0kEzHqsM/pYBXAbhX66d8s8wjOxO0gtamGi2Lf35NU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=OoAwwplRNOOBXYEaLOppVekN3LiPe8QN5gm4uyZav1eafrj9EgKzMjw5dhJZKEWMR
	 sSyBhEQdw0D1pP4LDmwp9CW5bGPFE0fHYHFPs9gjXEfGg7McGYkbLDD+CzziXzL7pZ
	 Vft7sZ5dq+fe6K6b3j2RVxynsuk5tTK/Gn4WxT/MImeqkKKgbB1Jze7ORFAbb59KQ7
	 Ki/Yc2/HCiidY9UXYsb7DcbEFQskT3P38MD6OkWiT/pzJkZRWNhgkjs/S/ge9sh4Yr
	 cCGyKlfBGe2wv/m1dFNmU1nQvoCZW9ilhzJTZCsFlRljR5MpWJ1EYW0PTuCc00U9Qb
	 Ex66V5JGR6wag==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE9D380CEEE;
	Sat, 18 Apr 2026 01:07:14 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for 7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <87h5p98ibk.fsf@bootlin.com>
References: <87h5p98ibk.fsf@bootlin.com>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <87h5p98ibk.fsf@bootlin.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-7.1
X-PR-Tracked-Commit-Id: b2a4fe0960aee9a2c8045cfd26fbeacf30b26efe
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8541d8f725c673db3bd741947f27974358b2e163
Message-Id: <177647443271.239841.12872470224322596846.pr-tracker-bot@kernel.org>
Date: Sat, 18 Apr 2026 01:07:12 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, Takahiro Kuwano <takahiro.kuwano@infineon.com>
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

The pull request you sent on Fri, 17 Apr 2026 22:04:15 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8541d8f725c673db3bd741947f27974358b2e163

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
