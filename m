Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CC8E77188
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 17:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jp+pT4Up1txGfVXX7YRnP2XoXXnVTJ9sxoLBNVUyydo=; b=lig3x4RGM36xpu
	ggE6m5ksETZY+Y7OFpe55VNL4929GRSU5DfChmbpE+REq9GERAYAIom5V+wIqUBTK/ybKFh86lP0f
	W55CyzDW7LC5rLeWCw+0wRvgNiS5JF89QT+n9VyC7qFON1JNRYoS91i9WFykgI/49Lowo3iJ0FnNT
	X9k1WjU5OtOIN2nPsMiK7uGAOk9HtgMv8OOLs8mffkIrKIUX7E1fn5OHl46IvLwCV0F5hxSuywdHJ
	dP3EG7SrU5y3x7yDZ7yffNNQCmhF0E+FjKK5XOuW6llYH6CILKtM1WUH0iu7PBefDwP7BlgulaLpG
	uR3aDQSMKqVlkc1c3DTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ8u9-0000000CXdM-1Ms7;
	Tue, 24 Dec 2024 17:41:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ8jD-0000000CUeg-2Lvr
	for linux-mtd@lists.infradead.org;
	Tue, 24 Dec 2024 17:29:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B001CA41614;
	Tue, 24 Dec 2024 17:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90391C4CED7;
	Tue, 24 Dec 2024 17:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735061394;
	bh=/Tior07fXQ5fd2vJyfw2nq5Clq7pweddD1hjMdvknKI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=GjNGWB4V5vOWLY42s7HwwVYezzZ5nBVeu0dPHEX33EKrx0Tbh3L17ZMglfrOv4chv
	 MHX5m7aIYwD6Vyg83Q4YWpWbdyxUcM4DCCmGsvyXMikYMmZN502DbDN2VRNt/2o6MC
	 0k38W07uyHCARVbi8R9MTm4yQSsm5YxI8asP9DR9dwJbSwqrksHXpERNVJle6zHbzb
	 8mYnDOpZqLA53JLccJghhQIe+Aov2jHOQyjTqL9pVnNAamoI5Xddn0HWn0xxy9d/5T
	 YXi+QJg9G7bBcleIezbE87BXyOCbM6iyzMnz/ePZ55hB+7NlzBuoSe4E4tEZWIF0Kl
	 FZL2g7FwPjdOA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7337E380A955;
	Tue, 24 Dec 2024 17:30:14 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Fixes for 6.13-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <87zfkl9i1s.fsf@bootlin.com>
References: <87zfkl9i1s.fsf@bootlin.com>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <87zfkl9i1s.fsf@bootlin.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.13-rc5
X-PR-Tracked-Commit-Id: 140054a25f85036ec847e722c76cc1bfaf3f0d96
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9b2ffa6148b1e4468d08f7e0e7e371c43cac9ffe
Message-Id: <173506141309.4160784.13418537624664597323.pr-tracker-bot@kernel.org>
Date: Tue, 24 Dec 2024 17:30:13 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_092955_682596_08A5948A 
X-CRM114-Status: UNSURE (   4.26  )
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

The pull request you sent on Tue, 24 Dec 2024 17:12:15 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.13-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9b2ffa6148b1e4468d08f7e0e7e371c43cac9ffe

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
