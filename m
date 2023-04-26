Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F96C77B7F
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Apr 2023 00:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SsXTkPImeGSXrigiSEHQ0/SZcfLOZAKu/cZi67M8AVo=; b=dtOJvfX6h9iJUP
	l+2+fvKRt7UiagL4Ig2CjBT0Io0VWxnyGe76e3QmwObg9mXbXxmFE9994sXfpAD7ZbnQ5LrJsFOKL
	iRxXuN32vXaTmotoXgbhfQeHnI1K8Tu1Izu26ysHT5t8uaDIUzRLd/lxL36Wv61LYR5x5eCE0scxA
	PgH/vWlDxgCxFZflpqRcX/quyBK1AkG9zkQFyy2aP2G9zInRptxs1aOARSVTy/eTJRAV7VaCp71bA
	A4GiQJQeHn7cSePA2rPKDjWyMdwOvHUtL0p4Na1Jb/MgXggD2U/6Qs1WUqBOfGSaI8kyfMfknwty3
	EQ+UHM8zfD4P5WKd3TdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prTLr-002VsF-0K;
	Wed, 26 Apr 2023 00:49:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prTLo-002Vrm-1R
	for linux-mtd@lists.infradead.org;
	Wed, 26 Apr 2023 00:49:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 08DAB631FD;
	Wed, 26 Apr 2023 00:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 669A0C433EF;
	Wed, 26 Apr 2023 00:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682470179;
	bh=eCbfVqwNE0EJt2oBf6tZ+otxgY0IszuAIAtzqQEmGaY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tAgV3w5haxOc6S/kNbvUfHMMU1E1v50e22Ovfvi9h1tDHaHVfd+knXKcpqsjFFbvY
	 MycjfwDQf4g85JUpQAqgveboMWe1XnkWyZYFKmvH+8DhFMNJiUIoRHix8xlSBL/bEb
	 af7C/ueUuUQ/TxvFZ2dH3JyjQa3LQIbkorTX55M0E92Qdh4XdM7O+7azcgBj3D+02w
	 EHuQHCsFAR9d/gyTLV6/bNf+q12NJnCLUF0ToDvf6R4AJsyVBZb4sXGpKXgJkfq6I6
	 6Q3QHkgu9fId35Dt0b3t6RxMmZuJUzr/j7imb0vrvtb1gxqqWeQ4NeVelh45D9DdN2
	 Kj2XDRI2PS3nA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 565DEE5FFC6;
	Wed, 26 Apr 2023 00:49:39 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for 6.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230420182923.0dabff59@xps-13>
References: <20230420182923.0dabff59@xps-13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230420182923.0dabff59@xps-13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.4
X-PR-Tracked-Commit-Id: 7227aacb62aeb59b007a6d3489b11f78fa332696
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: eb8322d714ea98fdc620d682fb517b50ea282aa5
Message-Id: <168247017934.10866.2461783282598090002.pr-tracker-bot@kernel.org>
Date: Wed, 26 Apr 2023 00:49:39 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_174940_526070_8AE3F561 
X-CRM114-Status: UNSURE (   5.95  )
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

The pull request you sent on Thu, 20 Apr 2023 18:29:23 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/eb8322d714ea98fdc620d682fb517b50ea282aa5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
