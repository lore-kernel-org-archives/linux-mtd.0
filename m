Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C6FCD98F0
	for <linux-mtd@archiver.kernel.org>; Sun, 21 Jun 2026 21:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HV31RbNNJXncpYO/mtdPJcjU8qYLkZC2YWRfHgyH46E=; b=C3ueSPzMDJkUpg
	lKtWmbCXo5ZardznE4LXJOkCylQcH6lMU2lNx2NC1krhDT+Krj9SHvwh2alSU0AS7ivjN3wH8W+n/
	cVxNCCRZbO1rrCgT46JSSSp0eFHPy37+GtzH521QgLl6woWudo8aAhKqCr2Mjq1i2KDJ/jnMbdg0r
	2qx7OK0rfdGV4egpaTHZ06ROt7YFfJTD/G9eEsJno3bPm4L7w2UGy/ey5Owz8II/gD+qcNyQwtX58
	Byv2hl6KzhBFR84s1303/KOVL8xeq1EpV92fglM/6aHkYRgYCSX6FYLRdrbC+JSxkxKX6+0VRC+OA
	vuZMOzW8HYYGHG9UUc+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbPQa-00000004AEt-3dWP;
	Sun, 21 Jun 2026 21:10:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbPQZ-00000004AEf-1dim
	for linux-mtd@lists.infradead.org;
	Sun, 21 Jun 2026 21:10:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 59DFD6001A;
	Sun, 21 Jun 2026 21:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D27C1F000E9;
	Sun, 21 Jun 2026 21:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782076201;
	bh=P0QQ/j4JQx1PaNSyj9/Ly2ENBLpUBmHqnm3duOnb84o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=fTdX6QsGSJCCNPnqUwHpvwv+lKjFjbodrGoOvlseJeOikIr8G7vij9uKbdsXek1H1
	 57ccszGdjh4HRJuMg330eU/0KwP800hhpxLhy8kbm2ynt/qtIcDtkxCMDmCVuenD5l
	 ZDvoM5+sxSWehg9xGyzMHfpL5cxVKBYu7CGvMOdz9oygKJanwvKdVfYru2bL+yUF2p
	 MZptxAS/hZZ0R7c+pQMSHhy/kqfvOQjPL76joxPNwpG41Piwx0JbuPsESE19yWacmU
	 sDG5PfKmA7k74dCjVfi2DUtS30BFdL/yNs9KdXKP8GwNce/ChiBcMeoPbVKFLsJA2f
	 QmV15x1DX8geQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A1B3AAA6E4;
	Sun, 21 Jun 2026 21:09:53 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for 7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <87a4sn53fo.fsf@bootlin.com>
References: <87a4sn53fo.fsf@bootlin.com>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <87a4sn53fo.fsf@bootlin.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-7.2
X-PR-Tracked-Commit-Id: 49420dfdedd676befaa999b165a76d8d7eec4fab
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 09e3b4a76bb6047ec0b99dc668b313469d8a73d0
Message-Id: <178207619222.500153.15942629865419057843.pr-tracker-bot@kernel.org>
Date: Sun, 21 Jun 2026 21:09:52 +0000
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

The pull request you sent on Sun, 21 Jun 2026 17:16:43 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/09e3b4a76bb6047ec0b99dc668b313469d8a73d0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
