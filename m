Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57314C5DF8C
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Aug 2026 16:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mGqgabNOZg1t0hwOyoSwos7bF6mQznmEKLMYV5o8nVk=; b=CnsvE2e8yVrjQY
	nPFKchGGfr4IXJSt4L0iHy5uwomBNC1dstZpFAoGlAEZhyg/UH5G8KkyqAyt3MMT/nEUDz68z9J6e
	iTZOP449GJyWHURIN1zOyybK5q/TBXr5HvhVHur7ts3BRxKTH0QVNZHuT8480VDz7IkaYMmao2t3U
	Etw68X5LD28qH1pSAWpR5iwtrahGmgd2l4WoiQYxfz+brMb5NSIaVBo7ADXcuVfxDWJCcVmgsam9G
	N7V6IIaMv09E4YRYugUeo6SjlGxxBX5ctDEASVFSvezlzHV5SRRkjlwntCrtYYYZxM7/sT43k66FL
	xHwHGYZt9YFTH/QUOCqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyB6a-0000000FU6Z-44Vy;
	Sun, 23 Aug 2026 16:31:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyB6Z-0000000FU6T-273J
	for linux-mtd@lists.infradead.org;
	Sun, 23 Aug 2026 16:31:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4103C403D6;
	Sun, 23 Aug 2026 16:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241421F000E9;
	Sun, 23 Aug 2026 16:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787502691;
	bh=8iZctiYI9V28xjiF6E0MDG4QH2BS/SGfYQ0g/EJP9ow=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=CMyGhAiCm/Gz7H3GhnaWD1esWG55OJKgp6FzaSV24rtL4jVhxzEauUi+VX28K7ldL
	 Z2ZkgTGtLaC9oKhPBjokkJXP3SsWLoVkz6ApKwOEIdsqe5swppN8m5voCFcPYQ0wTO
	 JuBqzEnB8Mq0xWNaTKBJyHLh1wzMh5b7hlhwJJbuKAYFLWlV3Dlx5BUSAcx9rzhEDv
	 ujLTCNMQoQn1kbwEvOmMHolsNtdRGut1GMZnbCgXu7KEi5btozZmaBXm7NjlFaydf2
	 xaqB2O89LLJt5m4pGc89aE/bHlgfUTQyiIYK+jXyC/ZSrEHbOotKI+Ou9MSAPDh3Sh
	 yAY4Mfrh5i3pw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93BBC380AA77;
	Sun, 23 Aug 2026 16:30:40 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <87wlthj9qh.fsf@bootlin.com>
References: <87wlthj9qh.fsf@bootlin.com>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <87wlthj9qh.fsf@bootlin.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-7.3
X-PR-Tracked-Commit-Id: 9b7e2fe0fe37f79e35467929d578c8c9f0f9cfdd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: df51bdc5e80dae43cab81f6cc641e98638303c88
Message-Id: <178750263930.2080322.9713899252511457038.pr-tracker-bot@kernel.org>
Date: Sun, 23 Aug 2026 16:30:39 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, Takahiro Kuwano <takahiro.kuwano@infineon.com>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
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

The pull request you sent on Sun, 23 Aug 2026 14:35:02 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/df51bdc5e80dae43cab81f6cc641e98638303c88

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
