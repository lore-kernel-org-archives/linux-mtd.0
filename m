Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45493C2BD09
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 16:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+T/H9972tIsBPArwi26Bf6Q+opmc9PTLrTVwBaR0XjQ=; b=V7J9gFahVXqOjz
	emx7Zxdem2yXA3U4jV/mLnzDFGq1tWLLLdIHvgwpS7nwJh7v/wCOUuEj2gCoWFAUmGW4K3nzzgeZM
	7/tHnCz9Ac3ul3NLNDq0ukWuMzUL/jFQf/cRktNhlAOY2UmHlnnBgkZjxY8vHjEg6KuOUzlFYvcbM
	RmubStzDqSEwe39pGT5gCPrLem2gqwozQ2GlxDqnPfCzw80uKSPA5gPTKRG2B3PnCD3T+lgV9isb6
	+iQotAH8RYE5sQxcJUfDozvSYkQie5zKbvOD3hku7dYucRGcKEk8FlHy2LD57iUx3Th7epo3tgBno
	7CCJhNnnbLWlWwzdXJew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOKDy-00000004AdB-2Mbg;
	Mon, 01 Jul 2024 16:49:54 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOKDv-00000004Abx-2OQK
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jul 2024 16:49:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0F25FCE18FD;
	Mon,  1 Jul 2024 16:49:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E38DC32781;
	Mon,  1 Jul 2024 16:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719852586;
	bh=O/Fx59KKWQq4w70OHI+2UVJgAFT9uV3AZwTLWCcQIDk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=b5xo4s4ubpV8v5JKDsZ7nSweOBtKpnSck5C8SUbX1Zgdeth1arvHl7b2ePdkvi4Pj
	 XEqmq5beM4l/GJa2BepyB/b+Z+yozogQndcmYx4O5kCSlAVOfmPDqNu0Zpwh6Pd2vB
	 FuMJmWU1a7XMi7+mDvrNe1XXod2y2QyS4MEcdYFKI/DMDM7hyE4rdg28YAHoZ4Bkhr
	 bz0Lts7Pnb1kqmyADjPsToZL/1tMZq+Mdk9PaVxuutRHOB8gl0cOiI4vhBMabSggiZ
	 /W8V0Gx/m029MrICrPWBi2nK8y4Z0vgumHadbx3rIisW7MtxY3RLvVEN58tz5UODr/
	 Oomtx6J2R81/w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8CDC8C43446;
	Mon,  1 Jul 2024 16:49:46 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Fixes for 6.10-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240701140851.307df5e3@xps-13>
References: <20240701140851.307df5e3@xps-13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240701140851.307df5e3@xps-13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.10-rc7
X-PR-Tracked-Commit-Id: b27d8946b5edd9827ee3c2f9ea1dd30022fb1ebe
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 90f4ad03439f061fa6930b8b16ba67f7ce63e708
Message-Id: <171985258657.24381.14936268763509158549.pr-tracker-bot@kernel.org>
Date: Mon, 01 Jul 2024 16:49:46 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_094951_804938_A6B1C752 
X-CRM114-Status: UNSURE (   4.07  )
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

The pull request you sent on Mon, 1 Jul 2024 14:08:51 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.10-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/90f4ad03439f061fa6930b8b16ba67f7ce63e708

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
