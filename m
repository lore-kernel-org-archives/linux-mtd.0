Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC7DCA5FAC
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2026 20:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KE8pkmHdsOYDWo5z+JbcysnCoLFoclMaLG44ytP7h58=; b=v84sKH3BW0BptC
	iwrP0RrhKwEduLBSuAL0RK4ntgIbAs7RaYkpHJqEMFY9/dREgU+k2bnrHNodkXgRfOJBo9vUHOzt/
	wXm7b0/ms1KAzGjCImrcWvamN2y6EUF5XVgk1XiPKGj97jBZUPL4Wzlzzu6V2/Axh+AYP6c5fgUdE
	7L/YW4ShUMCF9oOYKQXzQZq5woYv8TUH/UIvPMADS/431Zk4kyqIAtG0/FUsDCNRQWX1LRQgfpQNY
	yJya7Xwoxqd7gc8kLWj2nqUIBZZt8JXSbMMy+3ZkvFFZZ73q0Qyc05576y+Lno6fFJ4qILl+9dl2n
	HkL6FAEybn7fUboWPLMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBelY-00000004WsA-2iu8;
	Tue, 29 Sep 2026 20:49:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBelX-00000004Wrx-13sT
	for linux-mtd@lists.infradead.org;
	Tue, 29 Sep 2026 20:49:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 583386022C;
	Tue, 29 Sep 2026 20:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CAF01F00893;
	Tue, 29 Sep 2026 20:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790714970;
	bh=IRGREwl0ihjxz+NQ+tzpHQd6ZUXC1qe8S7Ahr8kz+SI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=N6b2TLpglbAfl9V8HlCAwkcDQbmXIDIKwVlLs+nr4PbtQQxpDCdNvgn05s0fyajYR
	 dOscHBPt6uJGUi1njs8gOlTRdW1m5XCLXZ4P8xlvyVRPTrv7su8Eh7kR/agblW/5w3
	 MZBcF+vYh+fN9RuphzYTwLN9r9N3bWP3eH7b9W8iUeKBNx01novmX1xcSrq5KcQmsr
	 mSGJ1unuiroa6IsSmB53ZfIuCB56HZOMRpTasr75RR1XXXYSDOLKVuqm0tib+mPHMg
	 3FYcKUnoja1vKlkLmUX9mLnVz4wQ4QfEKE0thEi7va9azamCDlGy/p78XgNktnHALh
	 kioLj3V/MK/Fg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F185C39D237E;
	Tue, 29 Sep 2026 20:49:29 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Fixes for 7.3-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <87v77n4wkq.fsf@bootlin.com>
References: <87v77n4wkq.fsf@bootlin.com>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <87v77n4wkq.fsf@bootlin.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-7.3-rc6
X-PR-Tracked-Commit-Id: 1c1a342aceec79528b3ba51f376eca2be5928fe7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a243ede718463c7b481878656f1ff32a0ce0fd54
Message-Id: <179071496868.1114410.10693735883670823829.pr-tracker-bot@kernel.org>
Date: Tue, 29 Sep 2026 20:49:28 +0000
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

The pull request you sent on Tue, 29 Sep 2026 22:44:05 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-7.3-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a243ede718463c7b481878656f1ff32a0ce0fd54

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
