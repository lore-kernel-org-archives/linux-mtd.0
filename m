Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9642C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jun 2022 21:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wnCIuywtQfyhkimKujUafdWDYAQgFyEKBN2ri5JWCac=; b=1k7P2P9TrEzNol
	PRFJt6+GDAtexuu64qJgVVB2fOpAu/TQVjMKx3dUkZkirrEjjrafBcYF+dxTg1CX1FukwiTv0nhJT
	cQuMO6UGLq51E2nEEvdqCF9ZX2jOCa1IGQLrB+OWI7ni/iQWPCPazz5R5v85JWjNN9pRz39q0CgV2
	3GkHwwxzvSepyj+C7AMgaA4xqSDN0mEuO4U7r6/0sR9MCc1Igt/GEEoqg1Gs4ymZWPOXGn+omaOGD
	TtfZDywHlAN900KHEl8h8JlBX/AcJv7dg7+tJXx7HcAMKY1Quz45X32QwmnPNdHxa1yoMQxKgP8Ih
	Eg7/bv1fJgBKA+RJcezA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4qXE-003pE3-V0; Fri, 24 Jun 2022 21:08:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4qXC-003pDB-0f
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2022 21:08:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 78806B82C3E;
	Fri, 24 Jun 2022 21:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E19AFC341CD;
	Fri, 24 Jun 2022 21:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656104886;
	bh=llZ2VCW+2sruD/6aU0+/X1fWcg8ZIspAnBLoOm1uqoA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=MF4x+1ajzfr9AZ9rlxFwZlRe27tJ3VQUe+jkEqMWfjJuV/KzpifAd+FyxeOXZW38l
	 RUKfMxZJKVSG/bFpQbTkeHXZr/+VbjXECgh2glNC3sM5AOeh5U78Wbr8U/ExGCSMPJ
	 Y4XL7O32t/0ULPLe9q6blCVwZcuGxP33gx9aVYegyPbRayYt9p5A4OVls4suKPqcX8
	 RZFrh+J1IbXIeyiUMLLDMi7B7mHBlU+fNggkI7vSfoH0yWBm2XhRYIm25TOJSJuWUO
	 JyfTzs69CRiCEdUsP6pTiuXgWYkvO1PR/DIouYmtZjYCz3Yk5tWW0DQxacnfc8Pr00
	 e1bYjfVJY3chA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CEA15E737F0;
	Fri, 24 Jun 2022 21:08:06 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Fixes for v5.19-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220624205656.63c4e2b1@xps-13>
References: <20220624205656.63c4e2b1@xps-13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220624205656.63c4e2b1@xps-13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-5.19-rc4
X-PR-Tracked-Commit-Id: 06781a5026350cde699d2d10c9914a25c1524f45
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6a0a17e6c6d1091ada18d43afd87fb26a82a9823
Message-Id: <165610488684.13803.12278023381332866576.pr-tracker-bot@kernel.org>
Date: Fri, 24 Jun 2022 21:08:06 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_140810_237840_A2B80456 
X-CRM114-Status: UNSURE (   4.69  )
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

The pull request you sent on Fri, 24 Jun 2022 20:56:56 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-5.19-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6a0a17e6c6d1091ada18d43afd87fb26a82a9823

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
