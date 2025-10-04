Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D13CAC5BB
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Oct 2025 23:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NV0bTjYcwQEPqvMQmZqgFGaZXUYwLxX9D66vLAejhic=; b=sQgtsfhl19b/Zp
	cOGqQ2ZhJ6Q4pZ/5S+Q9KAdBlJBsV+IV8Wa+w9yy7tjNHzwEj8QAOS/gtF5lZVRwHC3tLJLd/luXt
	WEa9RFxAd29Q++egDMs2hHxJV+PPXjYcOoQwsABdy3jOvEPuiptv1dEUjiavRJf4bNvW1mj43ajw7
	JydklEnIomhUmAzq0sn/QMq0ANT6Q5clmGfRiif0q6Vr9RcHxDI58gK+HQbkW1MKmAR4xS1jFZXS9
	hbIx+Q3myBuJs5Ovp7rUW/WRGvRbkimisToZI4mk2cHZnbpp4Iyiebi9imR8ZJbeQvNetPBxPXkoe
	HuYOHYvShsfv5V9pgXpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5Bty-0000000E78Z-09bm;
	Sat, 04 Oct 2025 23:42:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5Btv-0000000E77m-16V9
	for linux-mtd@lists.infradead.org;
	Sat, 04 Oct 2025 23:42:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D617860217;
	Sat,  4 Oct 2025 23:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8251AC4CEF9;
	Sat,  4 Oct 2025 23:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759621372;
	bh=dehsO6WzR2R+ArTNmeBpoTYi6SRxGZDsQcSu+hw5ThA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ZSVQR1w49oou7dTAFUPevhzRWdxIuqMxhivXX5GdcEac/To8lapJ7BxcifNtHqaUD
	 dQRz4F6iOCgwXwsTAO2F9ZZ3I97jRpxo1b/A4dG7qZpKfOwmxEe6aZabuUEFA3BKt5
	 jixzPaTF6WJ086wMM+vBycDFJWjJFSpHH25yuBcyBO1nVqYl4ykaTDVUQQdWpyE5mW
	 TYCj3tkyBVpLQW37HanCH1YjJPmgM5MybNzelrVHqAgRgPXJmPlTEVePbtEaVDdJfe
	 UxvL5gaeHM7O13q7sutw+HNBIPOlPgKD5DdayMZkzFU7LgvV40Rud3OwSufPo2jmlP
	 Am3E1hWJK5IGQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F7239D0C1A;
	Sat,  4 Oct 2025 23:42:44 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for 6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <87plb4f1e6.fsf@bootlin.com>
References: <87plb4f1e6.fsf@bootlin.com>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <87plb4f1e6.fsf@bootlin.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.18
X-PR-Tracked-Commit-Id: efebdf4b722143dc5073cee21276baf1673d451e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cc07b0a3afc8c15c1308497033453b44f7ccfc49
Message-Id: <175962136337.472872.6527027616576948399.pr-tracker-bot@kernel.org>
Date: Sat, 04 Oct 2025 23:42:43 +0000
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

The pull request you sent on Fri, 03 Oct 2025 17:30:57 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cc07b0a3afc8c15c1308497033453b44f7ccfc49

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
