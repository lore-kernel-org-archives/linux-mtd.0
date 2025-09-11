Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DBECAC587
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Sep 2025 23:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EBYXO0D4tfjzT0KiPfdT4RVadmaE78MS8F+cWnXST2c=; b=DCEcvV0CpIUuu/
	b0CJe+xms+ofOgIlGWDdUTkjvhUI5xYmH5D8DsKzo06QR1F4SRJZwyQ4xAeBWsYEH9ah0NRebl+tc
	MAuGiFsu342TsxYjB0SRqNu4UnIJIWftke7Do5d8lAmAV0/gQ09LGYwC9mTztcA+c8pXxXQKn8S7a
	G+miRC89aQ65iBtYBAZtcD2Xe0h/MjPcY5qCdY3pCAOMQySqaiPuNwA7962VrMXorZ1In/lHk7TWN
	KdgUZqeAbpW21jbmBEZGHChFrvu2CtC3jw5QruFBQIr8Kiuyd7+dvkzc0ZA9f+EXXzXH1ThPfPM3N
	jZImpONoGmDrCQ3tLnrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwr3U-00000005x7h-0pNj;
	Thu, 11 Sep 2025 23:50:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwr3R-00000005x7b-0tJE
	for linux-mtd@lists.infradead.org;
	Thu, 11 Sep 2025 23:50:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 39897601E4;
	Thu, 11 Sep 2025 23:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC6BAC4CEF0;
	Thu, 11 Sep 2025 23:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757634615;
	bh=FlmvLpSjYcWiAnT9+PiFdcZJRO+otL3K3h4kt9vBq58=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=DnTZosdPIC97TMwNFmZY4Qzf6amUM7TJnweGSHOjHf4MYL9bd336C5KIbvFrhGyiy
	 NzSU7oodW19AP8XNs5LPGyr1GxcQ/5pydBaVM0DNCdmBwsdbtTf+AowW5HSTTrPVHU
	 6/csEQFqV0TdNkKuuIKLrK3M5nt+OBysL4g/tfix86QXxFGdf86MFjqY6FUlzGuqTj
	 39mNbbQY4vhl3zCZQqjIWGhkxh+OMPOYPE/gdH0cM1kkfGtDjtY52Lp7ccgsb9blUP
	 SMWSSD4DRoFwXreLIzkmQZ7gJlYHB/lebxcQrrRNlq2ed3ohBOfwB/EZbAoMUEZiOW
	 Qc8RBjLB4+jaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCD5383BF69;
	Thu, 11 Sep 2025 23:50:19 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Fixes for 6.17-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <87ms71800k.fsf@bootlin.com>
References: <87ms71800k.fsf@bootlin.com>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <87ms71800k.fsf@bootlin.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.17-rc6
X-PR-Tracked-Commit-Id: 4550d33e18112a11a740424c4eec063cd58e918c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 320475fbd590dc94a0a3d9173f81e0797ee1a232
Message-Id: <175763461840.2348395.5882959600004882395.pr-tracker-bot@kernel.org>
Date: Thu, 11 Sep 2025 23:50:18 +0000
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

The pull request you sent on Thu, 11 Sep 2025 17:46:51 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.17-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/320475fbd590dc94a0a3d9173f81e0797ee1a232

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
