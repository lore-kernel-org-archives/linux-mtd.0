Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3CAC36008
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Mar 2025 17:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b6g3msWXJp0cUGxUVyJkGVsw1R2rBsEfQ8CVDRImR8U=; b=4Bql93eYQWDdjQ
	Bh/08Gt61x88eyh2Zw07Iwt5qIml7IsF6kKSaAv15dNFP0GE+MDIoVoXXk1xBfKL+rhxd9QE1eR/9
	NIPF/iRQz7vITNvypz+oX2PZIBTMKlhq5+qviKceL2hCJL60NAZwO9nRxxDKj5zSzMzx1C1PzCZhH
	yDtmbFLBUWcrpHPwloMByxoluAfn2d2/0Ws8M9/qT9CEW5I5ZIWh9vE51YF3b3/h349MhGIpofI/4
	8/cG6LwP0Thu/FBQa/xZQhJZn8yRVywdIglYssykHVON8vrCQiSENqsILK+woAUH5QPab4y7+KPjI
	m452JN+drJxazZ/TGeyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txV1V-00000009Hu5-1R2H;
	Wed, 26 Mar 2025 17:58:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUtL-00000009GW2-1SPw
	for linux-mtd@lists.infradead.org;
	Wed, 26 Mar 2025 17:50:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B40D61145;
	Wed, 26 Mar 2025 17:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76587C4CEE8;
	Wed, 26 Mar 2025 17:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743011414;
	bh=2T0Cx7okF1AHqBo8IfZ8l5x/tKVZapqVLTVY6K/4lYQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=dBr0aL2aFxovsrdfqYwH0qHjhwXhorkLGcGs/1JLODacnzrV3sRW8SQCjeZncou44
	 rdh11Vjgt5T+yvXdlpc9+WqWVuGZSkcy8yB8dbuyOZGY4l6toJFawB2q2MwJNmKapo
	 MltG4wClHIrZytmUGgY0kXaU7LF3B9vWhJl133L4hdBxKKab3yiFuNo1jo/oMy4sZ9
	 4RAAxOWa9fTjJGVwVqSYt3uE37VX/P7nuyALOYNZIuZcTYPYK5LI0WMDNIHpFnPdr/
	 juWDKxgO3qDvcF96tjxbezxmtimDyqHXkHIM4Stq8yCzbD5OKcmIb/j5So8e/bKgV7
	 5F/TPqYrcbKGg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB4163810902;
	Wed, 26 Mar 2025 17:50:51 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <87h63fn2sf.fsf@bootlin.com>
References: <87h63fn2sf.fsf@bootlin.com>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <87h63fn2sf.fsf@bootlin.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.15
X-PR-Tracked-Commit-Id: 2dd33fc2a81d7a1268e1bcaa286412f9c44994ae
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f6e0150b2003fb2b9265028a618aa1732b3edc8f
Message-Id: <174301145050.1411112.810722842943243350.pr-tracker-bot@kernel.org>
Date: Wed, 26 Mar 2025 17:50:50 +0000
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

The pull request you sent on Wed, 26 Mar 2025 18:02:24 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f6e0150b2003fb2b9265028a618aa1732b3edc8f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
