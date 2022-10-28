Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E987ECAAA1
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Oct 2022 21:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wEd0BjpWGuo3CMnQkmvfXteUHA1edyRDx4/uq+JFqCg=; b=rc763/WjEIbsC6
	5x2hg9IozUIsqQUIxWjI3X3jhyv77exr8JBfWtKX/oflkZSNiuJUlmLhfo5HIIoCGt7+2egeFxrG7
	ERlBuks+GdPEBOa11Pf9PUczHloQgKZx9I8oYy3j+kUVqjTUn3w/UUDatWBbDe+tsd/eTPw48w7w8
	lDQ4Sbv0I2eXny0T4SASjB9dj2BWg2pxzLyeQQ5azbf6gUxdPMqshy6a33Ga/rZF62zjPPtZrIDrS
	xuqK98KbK0FMNRqX65HK+2xW7JRa+WEv1OcyTg4XF3l8IJmHR1ITEVlQVBsHwHRRDaOVVN7OyUj2D
	7bgCopQcJ39INmBG4p0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooWcx-002KwV-2H; Fri, 28 Oct 2022 21:10:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooWcu-002Kvg-BO
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2022 21:10:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F0E8562A82;
	Fri, 28 Oct 2022 21:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5BBCDC433D7;
	Fri, 28 Oct 2022 21:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666991449;
	bh=pw60f0IAv98N0+nNtxaxF5MxJoI2yGT2FSyL8PfwSXY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=PL3v11kvkPYrZHmoqSL7wcfLpvNkufXlfgQ36oqC6wTQ58qDveTHBC2KG5BjWmRFR
	 UtFHU1ialEQRRpBELv58Cd0SlZup7lfIFXgOxfORqNQ/TfD4p9bX6GUkiSVY45Ha1b
	 sqcjyy6DKoeUj/JSPY+Eo9MG/Db81YqfkyPRmQraAxIHbkv0RL11eMcOWqN3G9tMdc
	 tTr9SSAsH64neh+bsggOfHAfyPu3OdcEK97S/AROiiatpgRKiOBwG8/+wgP40W88um
	 7Xct+JBfkC7VT+k5prhC5sRHSGRjg19ivRM3MtrhvDTWnzQ5/Wlnc4z6lTBJ+nM2kU
	 tg+7KRK04Ecig==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4695EC41676;
	Fri, 28 Oct 2022 21:10:49 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Fixes for v6.1-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20221028113111.20508656@xps-13>
References: <20221028113111.20508656@xps-13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20221028113111.20508656@xps-13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.1-rc3
X-PR-Tracked-Commit-Id: 05e258c6ec669d6d18c494ea03d35962d6f5b545
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2eb824f68d8c33e05f2003773f44ae2eae5892d0
Message-Id: <166699144928.13387.8911392429273513864.pr-tracker-bot@kernel.org>
Date: Fri, 28 Oct 2022 21:10:49 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_141052_466147_CEAD28F0 
X-CRM114-Status: UNSURE (   4.90  )
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

The pull request you sent on Fri, 28 Oct 2022 11:31:11 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.1-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2eb824f68d8c33e05f2003773f44ae2eae5892d0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
