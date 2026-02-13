Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A10EF99E2
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Feb 2026 23:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JSjaLKoZl6hmdsBjj/cH+HWoo8JuVGGy9m+A8DI6yQQ=; b=EuvnQrWEvr3+hK
	j8gK3/dZ5q3LjTOuII/XKyV4s0dsIB2dfzP/QOInelPJoaJYwiptqrd7pXp5q9P7iqb+reQ/KSm5p
	I/WbqGJFBY5m26pr+WVppPmZleIfR7MkBm3KhpqXVNf+Skds7lassUF/ksI3+Opg6nWDuN/QzUl9q
	cd9+Yt4dSaYrlgPZdDabCSjx8bDglExNW63esB5Ju75NLJ7ige/LTdo1I1cljqHWLmRYFGQCeLElV
	RTXmMVPfqX+0g1QhUNPv3A8+d5uEW6rUVhdjCXx8PSRALH7mw3U9h64IeXySYQyA21mI+PWUbwq/u
	nsQgjncgdEA6dvtVgQhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr2yP-000000043M1-2MiU;
	Fri, 13 Feb 2026 23:53:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr2yN-000000043Lt-2QOz
	for linux-mtd@lists.infradead.org;
	Fri, 13 Feb 2026 23:53:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6561E60054;
	Fri, 13 Feb 2026 23:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A20C116C6;
	Fri, 13 Feb 2026 23:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771026798;
	bh=oOz96VrAgRWZfJLtqGH2ioR76tG8GuF3J/tNn3Q58W0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kEdHQ6CDSPgbnmapVUqhfLjt+/mkIwql/A8ScTi0L4TcJc8gbiaZ/haZug5thDxqc
	 PRfE0Xm2KBzvpJR6h5o+0HULv4YpNDjlSvIswVAu/yIGQv8dwjhVqDbvahAo6E4ybo
	 QVLa8m+1u7oT0kVDJRBxvKeLGsXdo0qfpjhT95th+pKsUC49zMwwnRv4/JRp9RgpX4
	 gAc9WGorYU35DK4C3i55keXJMc2KL2WaBiCccyc/BzFAY3vnQSECkSCNmL5dehuzec
	 l/d5iXOxrFaPS+2Lj5lpL4Ssx/zCimDJitwyjAv5mLJjIewWliIaQio3/zcZtP7s3G
	 UiNHAVALBJbFw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0B4CC3811A44;
	Fri, 13 Feb 2026 23:53:13 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for 7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <875x80wny7.fsf@bootlin.com>
References: <875x80wny7.fsf@bootlin.com>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <875x80wny7.fsf@bootlin.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-7.0
X-PR-Tracked-Commit-Id: 7e96d76c74175ef9747f6fc14ee567f89d72153c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1b49e363252632d0493546511a41a65ed1a6fbbb
Message-Id: <177102679173.2616894.7160542630620683595.pr-tracker-bot@kernel.org>
Date: Fri, 13 Feb 2026 23:53:11 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
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

The pull request you sent on Fri, 13 Feb 2026 18:30:40 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-7.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1b49e363252632d0493546511a41a65ed1a6fbbb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
