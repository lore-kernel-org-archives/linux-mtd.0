Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97455C0218D
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jan 2025 01:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ofNo/e9R+kMWLZNvlji0we1W714cpg8AoKjlePoqlww=; b=IWM/bYojQnCReF
	Zbi9LGZu3LkE59v/iNHFU8EAEyLTJIuy/iEYdTMLP0HTI/3Zf92f5rNwLJBlvBVLL31myHOzAmNla
	qZ5BVg/LGMvlFfDsI1WoVC9UIwlMD24PISovsI2U7CLhdwNaynV1WQrUgN8LW3zvTz6SaQXDITYO2
	FiSsXqs0I2A9kMkGMz9D5OLYEOpFdNR2VGbndE/Nc+jxqJ0UTKrQAoVFkJoYYuAmLDtuSUPt1X9BH
	M9NcEqm/BblPQz8DcgFKMZUD8fxdcn2hOHq7kYMbXJttVbQ/XEDf903AqVb8yRSFEqyXEZ1Y3w/G9
	rc4lXH69J8SjZtVK9iUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbr3v-0000000H1Gq-3L63;
	Sun, 26 Jan 2025 01:03:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbr3r-0000000H1Fd-3KDw
	for linux-mtd@lists.infradead.org;
	Sun, 26 Jan 2025 01:03:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C4E8DA40C98;
	Sun, 26 Jan 2025 01:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E9B8C4CEDF;
	Sun, 26 Jan 2025 01:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737853418;
	bh=yaUHGGjR8+V7C29NyVc27nHYlGPAYe/TM2aVwlcpo1M=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=JAYBvtdUf9f96g4lgoLUoqKUhwDL/ny+5V0aDfNDzHn8eVi524cF3DqVYJiHRTfCK
	 fojqqq5LjK1duZpsTI1XJ9Z0WitkdbD29EdGcQV5giK8uGFAHgZ5+5qoVAONovzr/+
	 CiUfao6fzMbMJexjWjaz0cdGUmRx8B7INhZlo/RS+Q6lEJcZmjxsBuHbaEHlz04d5s
	 D4Nykxh+o/gb8odf891j/bN3hi1DSGE1ZrT8JnHaBEWWut1ZRBKUJ5cvEnKQ9rZ8MV
	 7ctJEA4nXmLE+q/af2gsUHTjz2aSltwu16xZC3YIP/m+j8FTkEE4cqKgVsg/LsioU7
	 2ZmbE0VWfStwA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFFA380AA79;
	Sun, 26 Jan 2025 01:04:04 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for 6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <871pwsijlc.fsf@bootlin.com>
References: <871pwsijlc.fsf@bootlin.com>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <871pwsijlc.fsf@bootlin.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.14
X-PR-Tracked-Commit-Id: 0ddeb4fe9d3b501c2c6a3522325d88ee166e02ea
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 08de7f9d4d39fd9aa5e747a13acc891214fa2d5f
Message-Id: <173785344366.2645989.11007332616392436107.pr-tracker-bot@kernel.org>
Date: Sun, 26 Jan 2025 01:04:03 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_170339_902773_40FAB457 
X-CRM114-Status: UNSURE (   4.50  )
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

The pull request you sent on Fri, 24 Jan 2025 11:37:03 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/08de7f9d4d39fd9aa5e747a13acc891214fa2d5f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
