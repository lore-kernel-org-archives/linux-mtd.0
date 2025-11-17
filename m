Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7DDCEACEF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Nov 2025 17:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=45dAdx6N6ftFsIXcrgrLraJQmq6uUsELeTVZ8Rh7ITA=; b=zoP06z++756fcs
	dAK99hY1wLVjeEtDcH85ukwXZXJfSm3OX0Fg4Prx0nUMAGdHFLc/9SVz09VTPn9Y0LuBpY3Ee0xih
	MW9cZe+3ZlO0gHNXUsnBeGu5FryHE1LXEe3D7pkuQCqQovcvY7cmFaJreqBt2SZIQX2jbtCqv5EpK
	iNMDMd1D9XedOEJ+NCtXuPyJjs52rdjA5ZTZEU/553YofqeZtP5nokuHjKFxfN8+oELBq5JhOowq6
	yR+8rsamWfhovuqMj32BSymfCw9Kr/3tsiyBcohlT2r8jfjPSgOSnflZb3SP6C8yEJBtjPHvlLoho
	OlQDvJiu2ZLpmit02XxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3Ox-0000000GZUA-2S3e;
	Mon, 17 Nov 2025 17:52:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3Ov-0000000GZTQ-3Toq
	for linux-mtd@lists.infradead.org;
	Mon, 17 Nov 2025 17:52:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0E34409BA;
	Mon, 17 Nov 2025 17:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D1DC2BCB8;
	Mon, 17 Nov 2025 17:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763401945;
	bh=PUR4rl0JhO6BDv24fsT4sVkWm1jthV2sqlJus0oPnEA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=C4hX4i8dZdsa2pPeNeZx7ZAGeIrLQee3kUx59m2S2qnTHHNkUrJlTiFTUjD2nyTRq
	 b39e1pE6bdEShSHvaDnGiEUFYkFjWeEZVdBYOybRFgCdHQSE07qjFR6RRosb662Mll
	 ySUGl3dG1lHjW3Ne9y0DdZ2JKWgJ3oY4/VMkCrdEoDd0WIf7zU5WyeKjmeOjrsJzKB
	 K+4BCzZOvlHiO3dDom/MTC3yrVEODsC46zOVIDr/9qgZlcCGZHfA72Kg32v8A+XKKI
	 zGqZ6NBJBqYGFr1V6GjlJY9no/uQ7fLc9dnd9bC/PRglKU8nQ0Vj0JcwOK6jF/UP9G
	 Ar8DHn6OanCug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB2A73809A06;
	Mon, 17 Nov 2025 17:51:52 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Fixes for 6.18-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <87fracewox.fsf@bootlin.com>
References: <87fracewox.fsf@bootlin.com>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <87fracewox.fsf@bootlin.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.18-rc7
X-PR-Tracked-Commit-Id: 97315e7c901a1de60e8ca9b11e0e96d0f9253e18
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e97c61885bfe3919ed1f7d56bf05d3ffef392ccb
Message-Id: <176340191137.3421417.11019234938391002936.pr-tracker-bot@kernel.org>
Date: Mon, 17 Nov 2025 17:51:51 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_095229_908381_B475A6DA 
X-CRM114-Status: UNSURE (   4.94  )
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

The pull request you sent on Mon, 17 Nov 2025 12:16:14 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.18-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e97c61885bfe3919ed1f7d56bf05d3ffef392ccb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
