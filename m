Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759BDC4706C
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jan 2024 23:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rwuvkZupU9ecdT7cxlSJHje6uTJox7rSr+lKV7+sRaM=; b=SkLwku3CGFl95v
	JfJd4/ddFpK7nAFKTUIhz0Rm/nkkc/t0HWgROs0XQelPJtz043z7uBM5OiUodnwzAnLN+8GOvU0Tw
	AWDxxGfPGQkObBuFIEDwpKIo7FnmxpMAXqgNmMuJapStUFX4mcAjz8LWXFBA/r85nKCrlyQVA2RRM
	rL7kb3vMqCFNW5kh+4yzQQc3ppn5TDOmMivOFHedUQDStdoXJA9Ro/MIQsbq1YZXOmu3/aIfNyokg
	SS+gILxwnc1lbdPtYC151mpgPYlRqF2tdrFMFX29+ocC4tIjrxqYf35VDobWhPSfOMmYERhJX96GI
	PMzk+Hep9yF3d3wwI19A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNLmr-009sha-0M;
	Tue, 09 Jan 2024 23:45:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNLmn-009ses-1L
	for linux-mtd@lists.infradead.org;
	Tue, 09 Jan 2024 23:45:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id DF468B81C1F;
	Tue,  9 Jan 2024 23:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 371D5C433F1;
	Tue,  9 Jan 2024 23:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704843931;
	bh=T2s2mQEWs6QBULlqS5J8229yFLqn92vMst+hJ7mSbxY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=j3In2sGE9gAGi60HRU+8Vhk0S5dSuyE0Kts1EThkA7wmNCsw2jQXumi82UAxgQJ5H
	 5Lp0aQh8KrBZ9jvZscXZJAC4e1CM+7OZe5OP9t5jFbbpceXnaaNUWFR3fTPMmuRZxm
	 eoehWgrb0grPPmJ0zWrg74XdvBJbOGCs0ub5SIFhlL0xVPh7rFT0Y2xgSBJbUGRAtj
	 M7qICInYcl3hCH/Pg/UluoGlz4vvy92Jcn+xr70bWnlnzXlgfRnABd9YkDOsjaECe9
	 oL4JZkpOVE459wM+GxkZnvnI/gCJTgbAwox+mDwXzyxa7IePpzoFmX9Y8bg2m1pGmh
	 15nyEVbf6GbYQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 249E0C4167D;
	Tue,  9 Jan 2024 23:45:31 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for v6.8
From: pr-tracker-bot@kernel.org
In-Reply-To: <20231227174023.346ec9fb@xps-13>
References: <20231227174023.346ec9fb@xps-13>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <20231227174023.346ec9fb@xps-13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.8
X-PR-Tracked-Commit-Id: 98d4fda8f2d4bc3fb97958d2ef4c90e161a628f2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 35f11a3710cdcbbc5090d14017a6295454e0cc73
Message-Id: <170484393114.13323.6194868442201458335.pr-tracker-bot@kernel.org>
Date: Tue, 09 Jan 2024 23:45:31 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_154533_588160_1EC146D6 
X-CRM114-Status: UNSURE (   4.71  )
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

The pull request you sent on Wed, 27 Dec 2023 17:40:23 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/35f11a3710cdcbbc5090d14017a6295454e0cc73

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
