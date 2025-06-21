Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D984C71157
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Jun 2025 05:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pOhX+vuovSkoRybMVKO9xZLCMLyZ7rYN0YjId9farQ0=; b=wEOfpzo6Q5t3FW
	RdvfEmpohaYSvawCmvG5iN5VvuhIg64EbHXMBzFk2BK92IhsGK2aN4I44dpZa7TT67EeL1IkuCDu5
	BN9dYQYhRcnDvL8C1UwPwFloEEDeWnvB/I4U+O41UQVK4XWt7XF7UWVAzkNMc5cQSGT1P1QFgc6Qh
	KZ98q+arAe3DxaG2MzOVjJ/VyWjyekzTIrhljdJKXwuHp+2abWjt5K6Pw1KRVMtfyF7KYosai7VlG
	WzZbqs+Y0V7mtzkzwGNqFH/B+dbmMZ+t8LvVTWXr5D9OVAeOWI/eQhGEBYZaJFBaFf/FfumBRuoKb
	rJQWWpMMWm2sXZw6gbqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSr0w-0000000H8uc-2SzC;
	Sat, 21 Jun 2025 05:43:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSr0s-0000000H8uF-3PIm
	for linux-mtd@lists.infradead.org;
	Sat, 21 Jun 2025 05:43:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 347CB49C07;
	Sat, 21 Jun 2025 05:43:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07147C4CEE7;
	Sat, 21 Jun 2025 05:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750484618;
	bh=1+AMxndN1v5n6VEqXstfHhlcImKy42n11drpsCrbzpQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=PDdROUraARbJjTurFKR+xSTFCMjcgRkRwEFJj8Bk8qEJBklp/PhaNR4K+5DtX2YVC
	 qVdYpcZB2t8IYGaP+RbAAcz2QEpnyMw6JFPY9TDXu1VAghjmmm6lWgk8v0hnwkAVpy
	 n5vM0H0T+1FZGTk46BdQkMSgzlT5q9VukIXWj5yJHHji9EZyOlLuV7nQ1MYR1bTeiQ
	 c0hVJ24zos826DyWk5Ovf9ks7aUiaETn300GIANTFSCsx7X5NeFcTcBsrP4Is2HGdU
	 I1Ecykd33VcmZHEUMYdFhGaJVAFUWzGAgRkK7HJg+zGlLkLo8gRn7uD0DpH2lZrYJH
	 xSwUbWThNEtaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACF938111DD;
	Sat, 21 Jun 2025 05:44:06 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Fixes for 6.16-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <871prezb01.fsf@bootlin.com>
References: <871prezb01.fsf@bootlin.com>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <871prezb01.fsf@bootlin.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.16-rc3
X-PR-Tracked-Commit-Id: 6463cbe08b0cbf9bba8763306764f5fd643023e1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3f75bfff44be0646580fe4efda45d646f9c1693b
Message-Id: <175048464563.1793935.844884916987414926.pr-tracker-bot@kernel.org>
Date: Sat, 21 Jun 2025 05:44:05 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_224338_870857_CBEEF1A2 
X-CRM114-Status: UNSURE (   4.28  )
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

The pull request you sent on Fri, 20 Jun 2025 17:30:22 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.16-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3f75bfff44be0646580fe4efda45d646f9c1693b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
