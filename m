Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66845C87FCC
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jul 2025 20:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9hXPIBn3ZQfd01ZYXra9I+amtkLqfJVLyfx7+UQfZmA=; b=lwLqS2lSEjfuhJ
	kyVLluiiNy3zluaAd+vlfPZhlRBLeNxFUVazCeszkCc3uXwtRm87wyZEjvGyAASbM1OFurt4eRJj7
	Xi9Bn4iTnOCxxNfJ1YcHuyOuGM47TxxzDxkqEGCKtbSpIjXoSUyUC74nfLfJtwIWLAuS7TwrfUusg
	DxHjFDv/yZv0uEB8PfOfuOBQlyYQ0U0+ECCHQniocdxNLjFVb4P7hMmxi/S1nmMdxa7KrCNoX9FCl
	WvKcQDKFOhmbU5OVCRHyjJHETSCGQPDBESMLNDteJaZnNQkR7JZp5TWlnLTNtO8tSgMDhU843Yc6W
	WDjRcN/JKUqlVvAltETw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhaFc-00000004Oeo-3IqL;
	Thu, 31 Jul 2025 20:51:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhaFa-00000004OdW-00it
	for linux-mtd@lists.infradead.org;
	Thu, 31 Jul 2025 20:51:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B855D464B4;
	Thu, 31 Jul 2025 20:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F737C4CEF9;
	Thu, 31 Jul 2025 20:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753995101;
	bh=TPZEz7nM9xzP7BL2sz2ZZHnwmGpgrRRx6CMQV1JP7fA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=EZ00U3IzWkK06YmrQ83bS1MkQO57zoxvP/8z9AW30pfAQHmIDfEYaPZSEq54AEuED
	 9zfsVRn6gIfGiwBZB8GOQavBj2r+Y9PbxDXI1kj+d2/GzJkCsNphzvLPiSayA9sQ3G
	 eidf4oFaAtwg+sMVgCGwexOQppQ6Yp/k546glWq6uTrtP7R9GPV6KqaZMexQ/aP/lC
	 7BINMnpNV9ZTkyXNbXpu0M0iLUKntyU0fJtY56DqNflSW83i5lREmS8JyPVm1kkH9g
	 DJJEn3dRLUxGvMuXTFrZ6qrDFhtWJtTsr7hhbGtFfTPv9D+POTY+o1uqNXK1icukr8
	 VECqHaSMOuxrw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 42533383BF52;
	Thu, 31 Jul 2025 20:51:58 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for 6.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <87o6t08fen.fsf@bootlin.com>
References: <87o6t08fen.fsf@bootlin.com>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <87o6t08fen.fsf@bootlin.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.17
X-PR-Tracked-Commit-Id: 9cf9db888f387844e063efc6296e9fa5c042995e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cbbf0a759ff96c80dfc32192a2cc427b79447f74
Message-Id: <175399511702.3294421.16583501358437645429.pr-tracker-bot@kernel.org>
Date: Thu, 31 Jul 2025 20:51:57 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_135142_061735_FA3C13A7 
X-CRM114-Status: UNSURE (   4.89  )
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

The pull request you sent on Thu, 31 Jul 2025 18:59:44 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cbbf0a759ff96c80dfc32192a2cc427b79447f74

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
