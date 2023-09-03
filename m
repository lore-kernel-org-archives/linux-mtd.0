Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06150C83F2C
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Sep 2023 19:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iCBsJGdyJzT2ncpqUCgim2wchhkYdHDle2cyULw7fBc=; b=W9ctfT+1J/jH1X
	n+CxsMbz2GRQDW2mEvA0X3Rj89S/tdXFeV+1bDyEtnA5z6T19tZCgfVByhRTxHtq3utjTrgw34YbA
	xB7lPILps3ty0HxqgmXnzjjtrVsiqsBeFvOsdrP0dVlWsql1G7VUkw56m6MohLBUXg8MraQDk+dgY
	HpT1P20624g2ECsTQIc/nhn+h4DdeoAcToGc+43rX5LB5aZYq9XXTeaJTiEZzEjrxufdXRAjG9IBH
	3wuCUZYoJKJJ3HhCSSTlN2j0ce0YRJxl7I1k5ZDA405ahb7Q59dnODvrm5i87u0aAX3ul6Ud0KFdL
	zsgidnHC4GUAPpad8ZBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcsOT-002pIy-17;
	Sun, 03 Sep 2023 19:04:21 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qcsOO-002pH2-2p
	for linux-mtd@lists.infradead.org;
	Sun, 03 Sep 2023 19:04:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id C2F70CE0AB8;
	Sun,  3 Sep 2023 19:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01BECC433CA;
	Sun,  3 Sep 2023 19:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693767852;
	bh=maJIoGmUlQJhF2PfsiFznwh7tLaY97PMxoTc9VEJ2GY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bSnGREjLy9rNZWujoXRNz10y8bzVo3k8nzU5/HYtYe6vf+4oGTSaJB7ZWutrUwCzK
	 sFZ7jyfBQr7rO68DSJDYl0e6PKY+xegFYAyp7AoJsVlyAbmHJmOADwUJYKDQu/AeFs
	 e87MxTOppxoBFOs4lT6dKNV1BgQswFZ4itVCagAINshXfjLC+1sTpu6Q+b37hwHyE3
	 y25CBh2AltppPSE1BMwTu7zQxXzJjO8zEbj+pu0MYuccW4OeRtS/1N7dI1f4Ln/yIz
	 lWazAdGLfdfzSD1G6hV+TQOV/xWS5i6wecWOdjTgk7TJCFXhb3byxdxz0lK3rAktNJ
	 8UaC8tgUXyu5Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C2C0DC64458;
	Sun,  3 Sep 2023 19:04:11 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for v6.6-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230901184136.73b2833e@xps-13>
References: <20230901184136.73b2833e@xps-13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230901184136.73b2833e@xps-13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.6
X-PR-Tracked-Commit-Id: 54a3f6e89fbbf12e1e3539a4f977a7536029d780
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bac8a20fa39796f5ae5cf73de146c2ba22ad2674
Message-Id: <169376785141.14440.121635739353129402.pr-tracker-bot@kernel.org>
Date: Sun, 03 Sep 2023 19:04:11 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230903_120417_141519_EECA5E40 
X-CRM114-Status: UNSURE (   5.00  )
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

The pull request you sent on Fri, 1 Sep 2023 18:42:11 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bac8a20fa39796f5ae5cf73de146c2ba22ad2674

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
