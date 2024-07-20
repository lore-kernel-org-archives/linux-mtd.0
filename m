Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C72C3DA59
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Jul 2024 19:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YeXyswSL3kZrTITp7uryevDA2Tmfr8+egUBrF+N/+60=; b=TSiB2kWOZmpVyo
	i89jq+3RQnLj/xNbeP4qpJUqMISy3HiE6gwAEuru//OxfrJIBrzXnRtqe2/xuXdn94eW3oAyzx0Pc
	ChtZdWO1JuJwmkkYZPk5EIpPtLRKwRwG8CqOvtE6MpdlRGRu68aaCLlVU/f2Lo6zp/VxFJISruG8E
	ZAhXquIy9CfAC3PzgPWjn61cPK4XL/2+zCsz7kGLSKMpIriyoGNMNRi/5XkCQ2sInrXaVqRoUkyXp
	Ga3kNsympe/IeB5gjmexHhPhl9tiykdd1KLAzM9OugykZmw19g/gprfjIkdNVwUAqx4f0HljbWvu1
	ddx0RBrOIdyV+FkQRNzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVFrg-00000005ZDc-0h4f;
	Sat, 20 Jul 2024 19:35:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVFrc-00000005ZDB-10kW
	for linux-mtd@lists.infradead.org;
	Sat, 20 Jul 2024 19:35:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 342396115A;
	Sat, 20 Jul 2024 19:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3DA2C2BD10;
	Sat, 20 Jul 2024 19:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721504126;
	bh=1EwOUjEtCNUQhL/HcjAOPAG22BX43JFXbF8ZQfjGbpo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=qIhpMpTLOrkb7AD9az/C0e0ULqqzHnPBPR5u5uY3xqLSbz0rVHaef41VnmS3zcAhu
	 sJhFxwVzkUtnkG/GaXY/CVQG0ucyl+w83QKpdDQZXnDMwuZ1REvllCGucWR1js8bmJ
	 Ez5KoqB7vBg7n2145FiVDZRwJKR/7nzA9jNypFYsMwRLo9paqA0Ek/Onlxi+k7hQlj
	 suZ9hr1yp+1j6f49wKp0M49s0T7A1rkUXERCC0yZ25LraECvruek3TbgY30BQWrqm8
	 3UC+GJtjEuZJiomdgigohRpuWqHDA7jmxvXTgl6b3ovTbWW3KesrI1jVll3Grp2OCo
	 egSqgWwyyRt0Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 98AA6C4332D;
	Sat, 20 Jul 2024 19:35:26 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for 6.11
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240720143826.00dec422@xps-13>
References: <20240720143826.00dec422@xps-13>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <20240720143826.00dec422@xps-13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.11
X-PR-Tracked-Commit-Id: 78a0b13f5744bd270d0c2391973605d9960a402a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c43a20e4a520b37c2ef6d4f422de989992c9129f
Message-Id: <172150412661.5535.15231472848376953595.pr-tracker-bot@kernel.org>
Date: Sat, 20 Jul 2024 19:35:26 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_123528_549021_45EC5193 
X-CRM114-Status: UNSURE (   4.33  )
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

The pull request you sent on Sat, 20 Jul 2024 14:38:26 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c43a20e4a520b37c2ef6d4f422de989992c9129f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
