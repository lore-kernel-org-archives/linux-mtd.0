Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31674C88CB2
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Sep 2023 19:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iCBsJGdyJzT2ncpqUCgim2wchhkYdHDle2cyULw7fBc=; b=ScVMDPZD6SAFsq
	lXBxdE3khltehjXGAOphjwL2hn7pMVYyuR8nY4IKIbwbM9mXGA8lB/1i+eHnLh6Vg8x+l/p1KpD9E
	I0ckTdtvy3BHx8p8U37Jf+KQ93L8GeOEC2CbeU3eJI30t6QlCcIDhUc+bjxUqRU3AxupsglWiupNZ
	47VHWwbYm6lpHEw6IXNFW58ibrQe8+A9MxTC66/Thfl9YVJOopRBy3vAKYjXKC+484cIUSIL1l6rO
	bEU4SMAjgt0lvYMhHyLh5mFPwxua0xuMMrw4LPV2rp5hl5Eu6EIk7fqMyLVDwr5bPFMikKBq8CPVn
	pNhvuAbvl83hrHwpu/Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcsOR-002pIV-0F;
	Sun, 03 Sep 2023 19:04:19 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qcsOO-002pH1-2p
	for linux-mtd@lists.infradead.org;
	Sun, 03 Sep 2023 19:04:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id AD7B6CE0AD3;
	Sun,  3 Sep 2023 19:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F300AC433C9;
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
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C6E57E29F3D;
	Sun,  3 Sep 2023 19:04:11 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for v6.6-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230901184136.73b2833e@xps-13>
References: <20230901184136.73b2833e@xps-13>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <20230901184136.73b2833e@xps-13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.6
X-PR-Tracked-Commit-Id: 54a3f6e89fbbf12e1e3539a4f977a7536029d780
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bac8a20fa39796f5ae5cf73de146c2ba22ad2674
Message-Id: <169376785141.5372.63612441165193755.pr-tracker-bot@kernel.org>
Date: Sun, 03 Sep 2023 19:04:11 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230903_120417_141202_D0945BB0 
X-CRM114-Status: UNSURE (   5.67  )
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
