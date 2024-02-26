Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A897C48BF6
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 19:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZxIrplIIBvuMk6bzgPCZLFIwdplb/CskLjd/2pO7Mls=; b=gwKPhTA7yzUGD5
	qxoL06ffPYJ1EnOVy8vk9QKwPTa09Aa9it+rrTiejdh77rfsC1Ii+PimcUyVBK3AqwzZ4KenBTESC
	OkBitavYu7RoE7arBJwUbc0peQ6jJn9aqE0tHb4ludOHbq37z3PjClUFuxfCSdwQjBuZl3dpiqJrP
	mmug6cVx1IaYIWeU7onL5F/UfcZR6pqERnDQWxmW4cMjd+yFjXZtScut2LKcz+aSrcxJb/IulgDBj
	nS1g+IN4EiNYo0yTolzMb0mCJrveyPQEsGNx5bXa3phFjNDlC14/S8vwgyw7kIOd/6vGcqz8xP1tv
	fbSPIMPN67J5Af1B9M5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1regfK-00000002OEk-0n7W;
	Mon, 26 Feb 2024 19:29:30 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1regfH-00000002OD7-3cxN
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 19:29:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6DE33CE1A50;
	Mon, 26 Feb 2024 19:29:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A78E4C43601;
	Mon, 26 Feb 2024 19:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708975764;
	bh=niKZ/lRI4h/kD03F2e2I7XMUiGgLBQH11Hc98Y9cYKs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ovAXJWFg70SIUyaGDcOX9l/7yFQqqto5hruPy0HxFrnehkH9mRcZYUh/AHrclxgI4
	 GsxsBHlZSOP+5tOe+Sz/K/ZCLChbFcgP8g0mIpOHXi6QimIqyyGhHA507XVpeTgPpu
	 h/xIBc0R2PrDnjVCIriylhop3Cr7k+tg4SyFLdi7dqDG7h8lxVRgtpNKvWWwDWKNar
	 P7RydMyvH6DVOtUYNGLoX0i04ngV97O++VXiovnuPW7znANnHQBaiExuchLx5YAbmL
	 tk1NLDcMh8fsDPcCNDCN1arrIQGEOzXRF0glf1NQEriH6qcqbVi7yZx3V8yT6gvD4O
	 GPvajoozGobFQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 93D68C39562;
	Mon, 26 Feb 2024 19:29:24 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Fixes for 6.8-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240226121124.0cad7cdf@xps-13>
References: <20240226121124.0cad7cdf@xps-13>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <20240226121124.0cad7cdf@xps-13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.8-rc7
X-PR-Tracked-Commit-Id: e6a30d0c48a1e8a68f1cc413bee65302ab03ddfb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 45ec2f5f6ed3ec3a79ba1329ad585497cdcbe663
Message-Id: <170897576459.25041.18386446325033743059.pr-tracker-bot@kernel.org>
Date: Mon, 26 Feb 2024 19:29:24 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_112928_117377_9469BD60 
X-CRM114-Status: UNSURE (   4.52  )
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

The pull request you sent on Mon, 26 Feb 2024 12:11:24 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.8-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/45ec2f5f6ed3ec3a79ba1329ad585497cdcbe663

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
