Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0D8C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 19:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bY3gItcV08YdE7EdtYbP6/WaMjvVxEw91K/Htit55Do=; b=sIPUq5GMWDNPZr
	CxOCKxXjA8/ZxYqGWDAbEWbC/ltlQanATqkIVOilQwZMtVptPHUg8Cqs2NROI8gqkajg6QP0OvZJJ
	NgeBeNxSDVh0pWeE1KyuAJzjB3uwRH7xgumz1dxKLlcl/IlwXHgcYajCR/UjLbyGQxlhUFFt3f+Vy
	jF6XNVhxZolusU47UD5UY8AgPrMpuC0G6B0YULLPVdkNc+h8bvB6UJxEyVGyQpA5EFHBuWMtMsMBK
	0nvBjUnQAWe2yNhdPBJdBqYP+T+hPXItcNM1A0V1UAC6EuDB5RgM9jmUFs3PKWq/3fG/lnkaknt9g
	eYmLQ6za+aMmohHe/eRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvPCn-00HMgo-KL; Thu, 09 Dec 2021 19:35:49 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvPCk-00HMfx-I2
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 19:35:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C2A2CB82453;
 Thu,  9 Dec 2021 19:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9989DC004DD;
 Thu,  9 Dec 2021 19:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639078543;
 bh=UHAQ3KkVNyQ7zaXP9uTLH+2qSQDot4VYNHx/rSmDt1s=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=tBZOoj3Hn49RZuZ0WfOtiZZQsFqa6D6gVLe1tNJ9dH5yToYj8Mxv0G392PokIARIp
 KjoDwNooVnnpdjlZ2MZbAAGk/Uqf4e7YCad1IUUg5dv3IgPln4DdAm8700cmmboS6x
 94Mg5k0DQqYPtoRLRnXNQdQK55Hf6hVkDql2S4vIYgrkeA92LfMBRHFMJDA/nt4cXX
 dWb9mvbuEFen2R8qiUPOeGddkeIlcEcjgGvcCQlh6kX3LTA5eBHCELNRAJ81x0SlCW
 S1uFGrQaF+W0leDWAZHqeU5f9IuvhklyHRTUdDyzsUAXurQcjzh49M68tvJoSZqJqa
 4yWXBLmsk8HaQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7521660A37;
 Thu,  9 Dec 2021 19:35:43 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Fixes for 5.16-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20211209180424.689b70db@xps13>
References: <20211209180424.689b70db@xps13>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list
 <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <20211209180424.689b70db@xps13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
 tags/mtd/fixes-for-5.16-rc5
X-PR-Tracked-Commit-Id: 27a030e8729255b2068f35c1cd609b532b263311
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 27698cd2a3c07d124fad6bfc8dd93fd1c5d46879
Message-Id: <163907854342.11961.13203077453860158990.pr-tracker-bot@kernel.org>
Date: Thu, 09 Dec 2021 19:35:43 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_113546_778363_CC10F0B2 
X-CRM114-Status: UNSURE (   6.30  )
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

The pull request you sent on Thu, 9 Dec 2021 18:04:24 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-5.16-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/27698cd2a3c07d124fad6bfc8dd93fd1c5d46879

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
