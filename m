Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF91C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Dec 2022 21:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mpeafkR7d3kUwPt8sbukkg25krYf9rpHbSOvlQl3TLs=; b=aZhGoemhCBFQwg
	OBLaGG4SW96pMH7l+lHj8lYBC+d9+rDAz9Lk9u4DZ/W9JXDrCYXjHUvcSQtvsh2tR/lAcJ2Zy6dCk
	Gu0okQMWqzckoQp+nm5w4dkrYrMMzqaRl1AtInyuzNywaJ6YOZnnnybNdkBpk51UhHp21hNlFPlDJ
	ogJP/K+gSWjJieUDySNGkyO3De9Rm7ZWX+nD4YHCih9nhuPj+V7DuO0IYKbqS9uMnkkyuGJN0ueIf
	Hc8YILf1ZMUqX8Bgr4aLeIrFxMGE38qLRrI1dNTBWv4wcFwpAkMJoh2NiXRLTHlKjoGct2qz2F5om
	w7SesAWLE3FDntORQgNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5DDw-006vXz-DP; Tue, 13 Dec 2022 21:54:04 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5DDu-006vU4-0d
	for linux-mtd@lists.infradead.org; Tue, 13 Dec 2022 21:54:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BBA63B815A5;
	Tue, 13 Dec 2022 21:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85695C433EF;
	Tue, 13 Dec 2022 21:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670968434;
	bh=cLlddvHWU23X13aAts2QggPdk3zUAczOx8CbDXULHHE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=QNAZGfxiJo2+7D5/Y7nmU3TXv8CbE5+mKtZqnE5bGzp35vbXMZ/we0+XIn0XmY7pH
	 QXJ+9JmiHOz04WCWrxe4TrdD6zZuv9c5JGS+xxKtMjKlwCpiTGVzMve/rvrheo0aB+
	 Eoj4ltUs6NZVKV4D2CPRxz5UmiJLjzOOZFFxsip8TWa/v/WHiQOy9d0KkPPZVrVQyD
	 pLsYK3uJzHqU0i8giD+i97XLqjo164t2iK92voUvhsV90W9xWJ95JuXL2bHOk8pQco
	 CLbhuifSM34aiyoG/zHFD0NXeEoMdVF5+U3R+0forLDsF2Up64PViaKo4o5+QdZqND
	 e6GbrRMo9odqQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 76A35C00445;
	Tue, 13 Dec 2022 21:53:54 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for 6.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20221212103221.19de8d3d@xps-13>
References: <20221212103221.19de8d3d@xps-13>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <20221212103221.19de8d3d@xps-13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.2
X-PR-Tracked-Commit-Id: a34506e08db7ccce160a259e4b00b1e307486c59
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1e4fa020d574768445fca2d9bbfe473ec8bbd224
Message-Id: <167096843448.13204.8890042185437082505.pr-tracker-bot@kernel.org>
Date: Tue, 13 Dec 2022 21:53:54 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_135402_229063_42CAABA4 
X-CRM114-Status: UNSURE (   5.92  )
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

The pull request you sent on Mon, 12 Dec 2022 10:32:21 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1e4fa020d574768445fca2d9bbfe473ec8bbd224

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
