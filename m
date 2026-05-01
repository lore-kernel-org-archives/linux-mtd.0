Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED087FF886F
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2026 00:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wzi9nXPLJccQJByqi13Y3SwFOqq0RTTOC18F98MIeCQ=; b=zRfLP+tDG6l5oB
	J5CkqzKKV8aYsfkS57D0Mfml4BedAbmzWYEUjRUYnEco6YdxrPCgyTjHt4oxPIAE4AJchVz2gJK5K
	hdy1zfNpZ3kfgbiMP8oy4DSzJat801m0pKq9r3vBFbnr+fnqrX1f4Af/JAQkXAIvGu7o++4lG1+GK
	NwEdFw4S6qIKK/JPrhn9uyVRo/Ux1D9pqXubCxAuFyVPXA9oBZwvq2VBDPmSsyfewgJvyp8ON+PHD
	B8U1aXdB76ZsT546oHhuJOhKbVgfIB+0msydMq2AMes4t5Zd2xIK7gEYzd9e0i/hfAVtOi6H+owzp
	aERFBbXV1AEcnDL+yVtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIc1i-00000006BmP-1Ef4;
	Fri, 01 May 2026 00:46:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIc1c-00000006Bke-1XyI
	for linux-mtd@lists.infradead.org;
	Fri, 01 May 2026 00:46:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A19344480;
	Fri,  1 May 2026 00:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F16C2BCB3;
	Fri,  1 May 2026 00:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777596379;
	bh=SkEss+lRGsQhdQjDUGPx13BycAHh+K3mZq2Itv8xRxw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=S2SfttiA04ELyaC0DqgcMgOvOD/DTsDX6A9awqdDK4mRNzbBKrGpXaTbGs5yozAOk
	 bD+8ilGKLjmfxPYAP3OXZD37aPdaAIUiamyy5kRe0B2VypEtvS+LqcoX6AFh22A41N
	 MOnXYiGdAGZs+7aMsnl6zwFsCdP0kFHnZgk9q6GovOptF/5ZSjrO2qOOUl0UN5CDlK
	 ubHlg1ifXV5vhP6oKm+kazP+158hbnGN+n1noUbAoq03DeTt+HcHRUiTCMBOj32NeH
	 0zzxTf4QCYF8C7Zt9vRNpX52kXdGIklwZ9dw/ZU9T5yWGyOOeaAlu42GIp917YBpcE
	 Rb7zioWkF0l+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA06C380CEC4;
	Fri,  1 May 2026 00:45:34 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Fixes for 7.1-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <87jytob3ge.fsf@bootlin.com>
References: <87jytob3ge.fsf@bootlin.com>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <87jytob3ge.fsf@bootlin.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-7.1-rc2
X-PR-Tracked-Commit-Id: 135ac3b84bcedae1860e7a9512d63166f42b736e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 26fd6bff2c050196005312d1d306889220952a99
Message-Id: <177759633344.3267405.8446350886225335272.pr-tracker-bot@kernel.org>
Date: Fri, 01 May 2026 00:45:33 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_174637_721606_39E41545 
X-CRM114-Status: UNSURE (   4.92  )
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

The pull request you sent on Thu, 30 Apr 2026 22:25:37 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-7.1-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/26fd6bff2c050196005312d1d306889220952a99

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
