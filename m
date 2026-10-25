Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8DD606A322
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Oct 2026 06:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pAk13Yy5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YlIVB9eL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PcJZ4WJkp+xQD+/QzFHru42jUEzE+vQA31wGF4HjOl4=; b=pAk13Yy5EnIZWhr6lZGt4rejZz
	93uBfmiO4Tgev6pjtTopQx3mYZvX4ARpoNBEMwonoqAUSXGHgHP3OrVArNARJd2m7XxZ1TkzYaOLz
	3ZZLATsbswgCSJLiWAi62dRAtgtd8/LVkLqrT4nMgLgPDp8QQe6Q5z7LdkXcsWwRcT9ZDSU3iQgla
	MqWzhGn0WACldzCmTK7lJ0Y3PlRMZP4ipob8SkvLFo7avUHOpfXMkQOkRwXXoByTe/F8aInXNGSQL
	8BrqvXzARVZw5+bOiG+QNHqZTdqOeRvBrrqm60bUi6CxBAo6C64mGbD1mPZcQ2wU+JL5lpUXFFaUW
	F0wUoVaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKrZG-00000000n1i-0bj2;
	Sun, 25 Oct 2026 06:18:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKrZE-00000000n1Y-2PEI
	for linux-mtd@lists.infradead.org;
	Sun, 25 Oct 2026 06:18:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A0BC600D4;
	Sun, 25 Oct 2026 06:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F75E1F01825;
	Sun, 25 Oct 2026 06:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792909131;
	bh=W1GXxDcSK71CyyAlZhZ4RUujcvAeck1ouL0OlpM3abk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=YlIVB9eLXWGG9kXDrTxce/X1W46vBjv3G/lXo7p1J9FRq3IKoGSviAxqM5Wu1ad/E
	 ZzugwweJvzti1x/dcWwpf3Lz6sFLB9fpHYNwJ9u8Xgp4CAYL49iUH3rNGRkWMZI68o
	 UZaN7FV08fi1xl3XuxCxkgY8fEla51+6zspS4eMBhVtxXW6NYu40uXbrkIUASJjXY6
	 OcTyyvSN5d+8qNjxY+0VlLf4I19DsRM3upMpiAOZWXyL1jMk8RG1x9j3Ifk8tlbJgi
	 zdV3lnCV2d3c0Iti3VfkNUDv+iCCOplKosVVO2OIzCl0X98GqChoTmM11f5brUuVqE
	 B6BMVn5ekxtdg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 075FF392ED67;
	Sun, 25 Oct 2026 06:18:51 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <87ik2smjuf.fsf@bootlin.com>
References: <87ik2smjuf.fsf@bootlin.com>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <87ik2smjuf.fsf@bootlin.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-7.4
X-PR-Tracked-Commit-Id: 0ef71adafaa9b36a06dd5b823aebcd2fa9b9b9c2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 44388c8f3e22b578c9089df53301ef7e53e7fb01
Message-Id: <179290912963.2017309.13368478325694786316.pr-tracker-bot@kernel.org>
Date: Sun, 25 Oct 2026 06:18:49 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, Takahiro Kuwano <takahiro.kuwano@infineon.com>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The pull request you sent on Fri, 23 Oct 2026 19:02:00 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/44388c8f3e22b578c9089df53301ef7e53e7fb01

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
