Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E8AC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Nov 2022 20:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DSiKItAiPSEAYOOA5VVTufvbR/2xc0lZFLCIjY22YJg=; b=d82sE6Wbtf0IRq
	flm4Zax/XXJHGJQFlrHaewQOzDS0a9lHo0jLycQ1zH2ge/YGAS+/E2KVxKT8aHTDZuI0ksuaWmT7C
	3sPmj20TnUrydt+7CUvjo+ZSRq88xUgI/UqbYAdmaYqEuZhzQXC6RT/pThav++twmYMVocfTKnQYG
	HC2xJPAMCA75LuaUFZEeIxXcox1GPQvK0dDzgOAXJh1S/hbohvRJOzeZYeA5mD7l9NXfp5i2cSLDo
	jUCGKe9HXoS3oLCk8p9API1WBKB8eGHBCN4IU8Y9jVfRaDKdlI5vvD6KHap+AnsTeuAZhQ/qxzygB
	E8Zm8UcpnAXUsZErNJyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ougM3-004u7N-Bn; Mon, 14 Nov 2022 20:46:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ougM0-004tsT-QK
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2022 20:46:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5C74161461;
	Mon, 14 Nov 2022 20:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4D7BC433D6;
	Mon, 14 Nov 2022 20:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668458810;
	bh=pfkQzpXnox+/vFrlO3KBNC9jm1ZIhKQub9+94Y9WFcA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=JO0FkJWsJT5s6PpKG4n5RDYweK2mremdHMoNAIks8P/kdDU+HqFwaMttAPzfSm3ci
	 v7ce7YYsfBQvW8nq9GzE4YL+xI14dQ2pjrgOpqBdoCpui6BaVQcxBkMAjuy0+ORQ9n
	 9Shf2GSHuKwPpUJcwjRq1WwSSvzmKIhDPH4aTYcOuUAhhtmefEXockAtp7nLCo4PY+
	 3OSK6Y1gOqiMJ1cKA+dDHmAIyWzAPEwPRKzhZYJ+69L7WNsqhA9KKDqzbyCpx0PNzk
	 WlNSH7+GQ1F149x2TMOJtNE8RZ73Ph7kikut93jbLNmAeCWL8czcrUKFZiO8IUYfak
	 06tty4q+fYe4Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A2BDCE270C2;
	Mon, 14 Nov 2022 20:46:50 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Fixes for v6.1-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20221114101140.339e0d2e@xps-13>
References: <20221114101140.339e0d2e@xps-13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20221114101140.339e0d2e@xps-13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.1-rc6
X-PR-Tracked-Commit-Id: c717b9b7d6de9e024e47f7cd5bbff49f581d3db9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9584987fe71ea9d6a5813f61be6aec4616978af9
Message-Id: <166845881065.1688.10656738432182515658.pr-tracker-bot@kernel.org>
Date: Mon, 14 Nov 2022 20:46:50 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_124652_924419_1BCD2F95 
X-CRM114-Status: UNSURE (   5.18  )
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

The pull request you sent on Mon, 14 Nov 2022 10:11:40 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.1-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9584987fe71ea9d6a5813f61be6aec4616978af9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
