Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62793C4345F
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Apr 2024 20:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QQunKnwOVO/fTq5AHLiuQ617Jf1f5WSJwZuqPGY7ucg=; b=LRFeFrYu/OsaU2
	uF5VJ9rYdAOal4zynyXVs9FoLKlMC2BkBuiN/V1Ue3XZTwkrsG9LP6LTtstxhb5xOcWL5402UBshI
	Cud4Nl2We/thr4ScSQruKF6tmp7Nd254HBbiMfgUz9ownmubKn1zaEeBK9heTU+MFXx7j5X+IXTn3
	E5N/kLJPGFXPoaFq7sLcIWtMkaC8obEmXgFy3HMlfOZw3Q0LopzTm/o+XLa9ICbiWL8xZ4zf0LWBm
	ogpFs8LbDYnzgraaBeqVpyXWWQ4r1wy7zoU5tLEk2wMPMe2w9GkRywZdqkvA9kqTh/gc0PtfBjbii
	sekVNVLGgsrudb4mfGIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0S88-0000000DwVY-0nCr;
	Fri, 26 Apr 2024 20:25:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0S83-0000000DwTD-3CYC
	for linux-mtd@lists.infradead.org;
	Fri, 26 Apr 2024 20:25:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D88B66214F;
	Fri, 26 Apr 2024 20:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 972A3C2BD11;
	Fri, 26 Apr 2024 20:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714163106;
	bh=MEVyrFlUd7u5DWvBZ8n6AEZ6PIKzQfICKwqbVv0er9s=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=J7/GzQjNvrEOoDBQ/mjbDxkU+/xiYNeNxUQZ6mfvHLM8UjIWT4sj81OyFAo5/39ZX
	 ZlgiHFI6IOjbMsE4//yFZELLatweLBqosOqbJ7n0gKLfuQAdbfYL06cppIfPzy9bZO
	 3hu3kqBBsIiXtk4VzvaalW1WaoigTLNINM35LTUdmXeCRbc3aRW0PALwWxIWKLnm60
	 byLkDACbsLRK1/BeULudhho0VHomCuNFfcRVdRyuhP9SWFQzgKHOC70V9BdSgwLXIB
	 f4eWhW67bdonLRshD2347Hni9FplySkxMaOJDRojchZW6k175LxqoIJeq7h4jGPhAG
	 v8lkR+jTyrN9w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 72ECDD2D0F9;
	Fri, 26 Apr 2024 20:25:06 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Fixes for v6.9-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240426205120.36804cea@xps-13>
References: <20240426205120.36804cea@xps-13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240426205120.36804cea@xps-13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.9-rc6
X-PR-Tracked-Commit-Id: d2d73a6dd17365c43e109263841f7c26da55cfb0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bbacf717de8aac61e45764951646b54471b22bf3
Message-Id: <171416310646.19521.2945584292568770834.pr-tracker-bot@kernel.org>
Date: Fri, 26 Apr 2024 20:25:06 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_132507_872977_DEB76342 
X-CRM114-Status: UNSURE (   3.49  )
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

The pull request you sent on Fri, 26 Apr 2024 20:51:20 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.9-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bbacf717de8aac61e45764951646b54471b22bf3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
