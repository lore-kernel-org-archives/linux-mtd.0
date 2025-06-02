Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EB5C5B555
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jun 2025 19:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2XurDwWi5iS0EBPrW20n1SX2bsEacfXwCF5dmQ04skk=; b=fm81st7GbflqBX
	XwKXJojI28rrRrpGuPjN5XXrULFvUwJkOomlgNwqdnbLYDcnNrjgcH8t0NrlYnBLyFIVXNfrJKL9z
	RnZb+v07g/+l/i5aq8nf5wcHu85q6NcvEvwvHStKN0SrdVAUwT/R9AgmyBLoBV9wdsoZtGG+GSDdl
	RUwmpexiAjzkWkJZgLXXIvDc4AxN3B+MFA7Sjc248Bmw2lM9xYtxiQI6PAq6W60sNV629q1xKEkf5
	yOEeD/KZKCmEhqwyUuWDVEDjT3dt/xQubxnA+tDC6CvXtG1YNG3oy4pg+MPTvvM4Q7rQ1UyG/RLYp
	DRu47JYj/tUXBrPbWcCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMAh3-00000008ReY-3zcl;
	Mon, 02 Jun 2025 19:19:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMAfq-00000008RHh-1zEE
	for linux-mtd@lists.infradead.org;
	Mon, 02 Jun 2025 19:18:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BB1A54AA04;
	Mon,  2 Jun 2025 19:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 935B6C4CEED;
	Mon,  2 Jun 2025 19:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748891897;
	bh=dFsEi1bPzmeUssOpvGcKK2t3Raz6bD0UBt4x/cH330I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=lgYp364gD1UAEhzMSrCAtASEvwC5SQ6BGxqFIdFi9/8rAWhNSlEVrDRYMV7YlJrfr
	 l+yc3sS+n/TEZ/y6KtVQKdYjja5Xemg97HlPSqqojjytQWpC7hOXITlvkH4dkeQM76
	 yVBGELDTqUuyVTBhXrgmh1BbJL+cqJfDI0ApqzWVGt+PA3J5TI09HN4qXfaQvsTcvJ
	 9Mx0E1Lkq7PrMb4B+6bU/V1v7lN8phJskK2He0PboX/j6vhP6KXx3eXUwdWMtaY6eU
	 fI3KX415nYxMWsRZ2S8yiz7DDAfMTHFIIF9R3FOPdK2eqQeIUea2AZeH0qBOv/0Y8Y
	 X3Ce37WWpas4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7119B380AAD0;
	Mon,  2 Jun 2025 19:18:51 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <874iwykrtj.fsf@bootlin.com>
References: <874iwykrtj.fsf@bootlin.com>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <874iwykrtj.fsf@bootlin.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.16
X-PR-Tracked-Commit-Id: aa702923258f2ce5e259b9cb8e746090bb6bf126
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4c3b7df78443403bff2532299f21eb4cbdf059e2
Message-Id: <174889193008.877155.13387020444268439232.pr-tracker-bot@kernel.org>
Date: Mon, 02 Jun 2025 19:18:50 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_121818_532028_245DCF36 
X-CRM114-Status: UNSURE (   4.86  )
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

The pull request you sent on Mon, 02 Jun 2025 18:54:00 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4c3b7df78443403bff2532299f21eb4cbdf059e2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
