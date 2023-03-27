Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22838C76195
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Mar 2023 16:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hqSHBSK2H2R65KkirCSjnMKzXclI9zAGTfKhqb/Dt10=; b=X5eAOe2uThnAvC
	QOzPkzBFX7Tv1ScMzpetf71tvcQYxLt175FKDhpWFTf+WqG2qQTJ2cMCQARBzRTGVBq+Pzp9dYyXp
	nBqmIioKaJ+Q7edgbPYDbnSw85gc7p6c3KUlBc+FQxuXaw877cgMYTDKhx0XUBR9JpYAy9XXDv7cj
	cYPiaE21AojzGPrfrkk2ZX1JN+NHYldrWBIOCPIRj0fLMbvyp8Mq/O1gXTVlRSWOHpQa0OHfDjka6
	qH+QRKFFDXe1/M2oPFHxcZ/bmkLemiMP0CJlI1bNX6PCUP9o513K8Emxw0HL5tlJ+DzhAVcPDZFN4
	HUlCVJbsuOHebG/z1+WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq23-00Bkal-1C;
	Mon, 27 Mar 2023 16:49:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq20-00BkXS-2e
	for linux-mtd@lists.infradead.org;
	Mon, 27 Mar 2023 16:49:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A87A461300;
	Mon, 27 Mar 2023 16:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 166ADC4339B;
	Mon, 27 Mar 2023 16:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679935753;
	bh=rNL1rLg8B2aGmbPYXXGpJmZP8QCaLpvsaHJwl1UIo5I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=pRjGnv1m7ql1SO0zy+RhufcHQ06MPmq1ZmxcTZRUA799Tcz/qMcNerUqwlpwE0B5K
	 jHLyC82T50aY0/warWB5jD1ZCSYWzF8a6kCLrI/9S6uAJ3Z/Rgr/Eb8AGYZ5G6Y5wE
	 zkDV5m9HT81NrN4DV9tPD/S+H6vsWdKV8gm8JXmrvNUOWujL8OEkwNRHSIivML9OS1
	 xpD61Sn4S+cfaKKsp3dD+2SdE+KCFx/LrWpwX743m9SyVqM2lSRhVd7uc/flMQFa3t
	 syBrlGlN0LQDl1sjA63jLSfYEOWPVcookFFY8HKyyDHupXbKLKeUWSBq7Xx4AXmvmP
	 Nf397iAsh5KWQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 01FC1C41612;
	Mon, 27 Mar 2023 16:49:13 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Fixes for 6.3-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230327101605.5cfd4f66@xps-13>
References: <20230327101605.5cfd4f66@xps-13>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <20230327101605.5cfd4f66@xps-13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.3-rc5
X-PR-Tracked-Commit-Id: e732e39ed9929c05fd219035bc9653ba4100d4fa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fc5d1a9233eef4a3656712994e5bfa0c0470ebfc
Message-Id: <167993575299.25802.11476218664320326531.pr-tracker-bot@kernel.org>
Date: Mon, 27 Mar 2023 16:49:12 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_094916_899421_8DBB8C2C 
X-CRM114-Status: UNSURE (   6.28  )
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

The pull request you sent on Mon, 27 Mar 2023 10:16:05 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.3-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fc5d1a9233eef4a3656712994e5bfa0c0470ebfc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
