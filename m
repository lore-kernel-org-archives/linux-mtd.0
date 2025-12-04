Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CC5D2A520
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Dec 2025 19:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vu77WmXi8nI3VEVHscFIoM4LA3nCtDobC2FP08FEyio=; b=DOIVNYHQxxk7W+
	hpMSBsHEQoke7y9DFlMhLCHwjk6ZiRbAoopaVqGfsqn+bNjsQQCTSZosj9QamD5B1tYJ2nrbJ1R1t
	esmI70nGRJJ/ONjCkZf3GFgPgFU5dzLOgMcqRSN2b+mtaMDLQJCDlEZDKPNpWEWGuOtbJsQROsjnj
	cfaPCY8zcQbmzthNvRMJRi4DGGfmZlUmnUzy1sQcd32uZuVBd08wqGJx+XFYgtnKyGkq2p1kq7S8t
	9t/OuVlbQl042c1tTkCfOgaTF7ZcW4d2Fh+8L3uhi/NdyLMEPN+xxz5ZgIy/1mf4mcAheTJGzPn9k
	EFsuO/XjfMRrVqfGd77A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRF3a-00000008VOF-3d2d;
	Thu, 04 Dec 2025 19:32:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRF3Y-00000008VNE-02ef
	for linux-mtd@lists.infradead.org;
	Thu, 04 Dec 2025 19:32:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 42F1F40602;
	Thu,  4 Dec 2025 19:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E09DC4CEFB;
	Thu,  4 Dec 2025 19:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764876718;
	bh=FENzccX1NzQvTN2Z5Jz3dTEmVclJGd6Z58ryHbxESC0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ceekUe5vzb1IRPjUmycrk0R+eVhUMnyeQc5DLVpYZYxOQb1j8Bun16C115/+ED1f4
	 rFTpQQMs7e9MJ6/OLvj9E3emKWP9WEJVw3i2OwCQqQ+jNTKhpYhWHvBlMKj6u/+2Kj
	 YPUCAdrWO94+gQRX2Cx/P9K24v4Q5TmRtA34GtX1PA0qEDSKwQD4CnGlkqqPEwz9FC
	 5AzEpqwhqHUAjsnXfgjY65f4O1nbqC508fpiqeUcM+ydV4dayYHZwSJSedBesxI5fb
	 fCt218TAshxlcKCaQiGhU+bXM++az0EZhbBWXzLX8peOkoky0PUUlkIlgRk3kLk0VT
	 LMDZWu/ya0aag==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 78AB7380048B;
	Thu,  4 Dec 2025 19:28:57 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for 6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <87bjkicxcs.fsf@bootlin.com>
References: <87bjkicxcs.fsf@bootlin.com>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <87bjkicxcs.fsf@bootlin.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.19
X-PR-Tracked-Commit-Id: 801b0840b09d93c51d23df9f92c063979058c153
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: edd2b9832d604a234b60a4910c7496f351cd1e12
Message-Id: <176487653615.944914.9906527983129723859.pr-tracker-bot@kernel.org>
Date: Thu, 04 Dec 2025 19:28:56 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_113200_089249_EE57081F 
X-CRM114-Status: UNSURE (   4.77  )
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

The pull request you sent on Mon, 01 Dec 2025 11:25:39 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/edd2b9832d604a234b60a4910c7496f351cd1e12

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
