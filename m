Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCEDC4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Dec 2022 18:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rCiY1F0uYUtf82+p4RRvzN9V7miAOd6Ve98ouYqPRPQ=; b=TPdUaVTcG/4Jzg
	XgmfHeaIarvA+tylmBweg+6kSB7xFqNqUcmyGFve8WKfyNvtXwhGh3Jn1h9C7RyLs8Kb+AAFlwe0W
	oEb5nPd5PDmxhZPS2P+UO9+0rwyDotD/JonNNzfz3WymmNHHWWALP2ZX83e9KqCubRF+eBXZUJLNC
	x5+9WCz8N2/d5QeuU4JMM8wsHPvMU6P/DF4jlOze4L3Mj3mKLHagaePIHVBO7PhBh21CzOCsDWhSR
	d7zzDAHAkBj27xkyE+utClSEvhQHhykbG07gi7m1luCye4Kdxc3Bjwr2EHH/hf2EoNF1K/C/wHpG4
	cwkUuA9VK8cWzgaH/NcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3iHi-00AOci-H5; Fri, 09 Dec 2022 18:39:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3iHX-00AOYQ-Bt; Fri, 09 Dec 2022 18:39:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8A46EB828D4;
	Fri,  9 Dec 2022 18:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1FA7CC433D2;
	Fri,  9 Dec 2022 18:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670611172;
	bh=E7IOLYjrgmS5ti4UsFyJE6Bc01pDqkWg5I8W/og5omE=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=AplqI83rA5qU1Fg/kCM/pvQbpZA+JY9e5eFY48hJVPLWiT4PHSflfYQ/lt3kIpL91
	 22qrbnghPT+NdciNVKkdEiIWDGLvJdg2La+rf0KQSpPKupqR4sot8RB4QBw4fGYcmD
	 RvkOmpKQD6D7zkvOzjOJqCbMpjxLnVyxLHmMDPH4Hyy0QeUeYLiQkbEj6wH09rShoK
	 Xz45tjztDS0JzzQ2wzaOe7++l9/iMSEMKRxj7IE60tGHQgxFQSCZdJtlEcFGq62DZZ
	 1eccHrIyK/Yn3Zku9ZJRxEmLmRm+65mo7ZTrOV4Ent7yRtC7GS1M2geGoHe4F/mXNl
	 Ax8DqpwAHzriQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0AF44C41612;
	Fri,  9 Dec 2022 18:39:32 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.1, part 6
From: pr-tracker-bot@kernel.org
In-Reply-To: <c2178eba-0c25-4310-8b87-1dc7708d2a34@app.fastmail.com>
References: <c2178eba-0c25-4310-8b87-1dc7708d2a34@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <c2178eba-0c25-4310-8b87-1dc7708d2a34@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.1-6
X-PR-Tracked-Commit-Id: ef19964da8a668c683f1d38274f6fb756e047945
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9857feb3f62a04aba3909b6ac43dc062bf84c874
Message-Id: <167061117203.24040.11894918308899224286.pr-tracker-bot@kernel.org>
Date: Fri, 09 Dec 2022 18:39:32 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Francesco Dolcini <francesco.dolcini@toradex.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Marek Vasut <marex@denx.de>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, stable@vger.kernel.org, Thorsten Leemhuis <regressions@leemhuis.info>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_103935_574499_5C103D3B 
X-CRM114-Status: UNSURE (   4.75  )
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

The pull request you sent on Fri, 09 Dec 2022 16:25:17 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.1-6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9857feb3f62a04aba3909b6ac43dc062bf84c874

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
