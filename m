Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5B7C4451B
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2026 16:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00NKX3FP2Vdro/7LPq+hxeqoxN+3FvRFxTUOFs/Jc/Q=; b=M83sL7ul2ihn4F
	Qkky7njYgSrVPR6vtMQpr4h2WtEVRL8bLGhtCaQWrpqJxMy7P74+Omo9OO/fgKRJw2YGMjaLcn2aZ
	WWnuSfJH/W8nPAD5wNXzIKTDaM4K0ASL+GHqDavKdXggIRnhhnkr6x0NW63nXV2ZMM3F/F/yDuGhR
	aWgPsZaEq2HA650LF3Y76MA0gvhbGInscasOD+ovrV6cjpXASAiAQjmm/oJmUHOR1i4GKOG2+D1eO
	jvwkqOJix0f5avGdOJjQgPjQyMf7h9nsyTAu35TiDskfhRxCHHyTjrGXDbAPFynTnJ/EnOA7Ynxfo
	C8j8IeNx7xiSOUNPXmSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wklVG-00000002kVs-0X2V;
	Fri, 17 Jul 2026 16:33:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wklVF-00000002kVV-0HMl
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jul 2026 16:33:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4BFB260A6D;
	Fri, 17 Jul 2026 16:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F42231F000E9;
	Fri, 17 Jul 2026 16:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784306012;
	bh=t6D6pv0UI8N+2V8KilrgULukCyUPxBq2BmZuVxVuVQQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=XxJ2vbQdXBG0XP6Qm1vxUE21lvQdUaFgv0XuYo7SnHGoIO3srVjoO4PxvOpcFE8Ct
	 PRCaEbzMDtyqhNN2hJEnDYEKtrdC+HfRNu1NYZU335OKyW/p4xzDDzi8DfJ3GM2U+J
	 9EVBOJgXFBBbOj5Fpe4YbouNyUiHAnYRyVOJXqsMG00Z0mTTOY6IlejcijRIL+XbVQ
	 hsJeyNli+zkCK8sP88CdioNmeVU6Ps1DxvIv4uVlGKS0ZvYDo6mucsZ/wH+dq0Yj8B
	 Z4fS+K85UgRIKRVR9nqiQGQhF/YrLt7JgaW/G0Gd498P+rgOw2B7Hh0wXvEFLbmldU
	 zoVqDwIBBIOVg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93D04380CEFB;
	Fri, 17 Jul 2026 16:33:05 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Fixes for 7.2-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <87wluthb62.fsf@bootlin.com>
References: <87wluthb62.fsf@bootlin.com>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <87wluthb62.fsf@bootlin.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-7.2-rc4
X-PR-Tracked-Commit-Id: 2b533e775aec580cf60074417f4ca00ac9cf3580
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: af5e34a41cd607c00ef752e00331736570992354
Message-Id: <178430598414.1791299.4963637765578338680.pr-tracker-bot@kernel.org>
Date: Fri, 17 Jul 2026 16:33:04 +0000
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

The pull request you sent on Fri, 17 Jul 2026 17:45:57 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-7.2-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/af5e34a41cd607c00ef752e00331736570992354

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
