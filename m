Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F8A1099B26
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2026 17:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iX7htI7nQm7eOtTv6KB+u/Ei4V9l2SGZ8rZv+MF9ii0=; b=EPpdTrPU3HMjL5
	3+DL4BGOlDEWmJ+hTQ6F7bfvreuPo2ahYKZCgFUWTu4UDxBMYmtAXY4/ZlQKhcBnQP09eNRMu8+M7
	CtK+rXVN2xXp5BUBK6yFj2TB417+47aS9PKsxz7S+V8GM8bC5frhbqMzhmcAf06SG1wLRHy0X+k2M
	F+ihucaRn2HbO3sewrHnrnGfus7E3fMQqXhd21K82RsGZqavtFdrKsVzgdgdAcAPRhfx9CTWXbec1
	+lTpCN7JPG2RCXx87N5U4VC8uci1zMnfkxqCvwYORMwoKcMeRJ4z6Ffhd4MlXyV6NW6hJs3uDAwfC
	dEYvKWh5iW6sR/XsGpzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dQH-0000000DDon-42Nk;
	Fri, 20 Mar 2026 17:14:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dQF-0000000DDnq-2s2s
	for linux-mtd@lists.infradead.org;
	Fri, 20 Mar 2026 17:14:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D7C2B40AB3;
	Fri, 20 Mar 2026 17:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5407C2BCAF;
	Fri, 20 Mar 2026 17:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774026846;
	bh=yXkPaRIsBvrmLYapU/BwvJJeNMR6ukvEBm2hyI/iA4U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=WUOHtwplzExENJdtMqDV631Kvl6vcW31J7x/IDZB74+Kvhz4xec8/Iytt9Y2Qba6U
	 g2wvn3vYzRI8jdtZePGp0UDnC3QkDonpRsgDksRCWkAUKRLewCaNUw8vtLBnaiUIrF
	 VxL4VbrbJz3KImhRsxxMFfMdHKrMxGGwe+mg2bQYNc9NP7qNPJxkSZNIJPMUbAsDfr
	 4W4toUMC/7pGI6ay4NPkwVWL0wPXnxmwJWgq5Qh261oejKtC9b8CVVgGkb9JwnNdNA
	 ygmFtosUQrKU2uwB8TpsGq3A4XUB97pAs24ZUahgzwm/Y9RytquaGvn0+1lqqtkBWu
	 47HJYpuHlslCA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE24380820D;
	Fri, 20 Mar 2026 17:13:58 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Fixes for 7.0-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <87v7eqc3sm.fsf@bootlin.com>
References: <87v7eqc3sm.fsf@bootlin.com>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <87v7eqc3sm.fsf@bootlin.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-7.0-rc5
X-PR-Tracked-Commit-Id: b9465b04de4b90228de03db9a1e0d56b00814366
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6ac513185c410f9404ff66b920bec137cbc6e543
Message-Id: <177402683689.2580860.10108985239604258798.pr-tracker-bot@kernel.org>
Date: Fri, 20 Mar 2026 17:13:56 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_101407_758387_49036A7D 
X-CRM114-Status: UNSURE (   4.43  )
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

The pull request you sent on Fri, 20 Mar 2026 09:18:17 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-7.0-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6ac513185c410f9404ff66b920bec137cbc6e543

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
