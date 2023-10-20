Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815E6C004C0
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Oct 2023 20:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tKOfoGFTTwkRf5mQOP6ufGPryDAfqw59G5ebu4t5SKQ=; b=u0GojupOrSoQ0p
	KEyYb6dTk1mBRbsJmkd+Phel5XClKEXFlVRr3Ji3jQVO96HPGWRf15zK5e7iCiJrB8xwX4VmXKpE/
	jxJFJ/Gslpw+mAzM8LBRI7I8uRtdbKGMuwMzDmiImLGGPBCSNyj/cmZfRUWL4AzQRDlm5pL6fuiUq
	fAuCWXRT+aYa2HsaumMcNAOsVEqITZNaDJhqWnLBe189ykqCQEvLdcmP3Ug5t+AlI9dLN4cAWiZei
	2CwF9xlhu9Kgi8uF53UxGRQLcH9TKSPWvSjFP2J+7pCbxbKtbE+73i58MZBv2c7tX75vKrMi/ez6G
	/iRJj5uKQnR1DaJsbb3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtw5R-002ybs-12;
	Fri, 20 Oct 2023 20:27:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtw5O-002yav-2M
	for linux-mtd@lists.infradead.org;
	Fri, 20 Oct 2023 20:27:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AF39462379;
	Fri, 20 Oct 2023 20:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D11AC433C8;
	Fri, 20 Oct 2023 20:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697833629;
	bh=FPdh8hIK26IDcC01lJq3rd+ljmTHrQuDis2XL9mvZYE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bfg42l1ymQfJkru4cyMZelb9sSqH4nxiajDyuOURNQ50nv6+SKoGniA562vfOIwq2
	 UU9D5+QcZ/rsFCQxYSK9X0fFWGCU+gqj+huxOjq7HuRlZcrClm2IvZnTmXQL2PDWF8
	 CG0GZ7+ePvD9C3SioMSilyBOItTvvXlm9lqeIgGYdH3M22LzklEH0124O0ZVcWRYxZ
	 pTmapi4rrUC/X/o3/qunS/D/+VG8TJu4ph/6ZUOV0FVgTdfUmekJVMcjxguy6BVVYO
	 RnvBLV0xHJ21A4Rk0d86IiM5mu/AqcD3oONRtBEvCR4blMeG26uJtSb1BhMNUdu+eQ
	 qNwX+zZ4ofxew==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4C590C595CB;
	Fri, 20 Oct 2023 20:27:09 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Fixes for 6.6-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20231020200039.09ff7f18@xps-13>
References: <20231020200039.09ff7f18@xps-13>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <20231020200039.09ff7f18@xps-13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.6-rc7
X-PR-Tracked-Commit-Id: f6ca3fb6978f94d95ee79f95085fc22e71ca17cc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f6176471542d991137543af2ef1c18dae3286079
Message-Id: <169783362930.7501.3159683129456792015.pr-tracker-bot@kernel.org>
Date: Fri, 20 Oct 2023 20:27:09 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_132710_833187_08A99711 
X-CRM114-Status: UNSURE (   4.30  )
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

The pull request you sent on Fri, 20 Oct 2023 20:00:39 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.6-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f6176471542d991137543af2ef1c18dae3286079

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
