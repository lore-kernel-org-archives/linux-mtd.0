Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AD2C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Mar 2022 19:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZH+PU4Zl/q2gMrMatLx2ILSfqoHPQIZ23xgPEjc07xk=; b=M3zkay+KBCU6LP
	gZElt6DAuk7BOcnL1aqZ+lXFgEJlcrRJ47y8pMDAx6QUtS6w+sOwdyHT2GACIF+Rbp2htw69SbRAr
	y2esdi7hy6DRsLjsJ5c6dSM/kWpHtpGaSgjhWxDH6sbe6BnCXXXTlGexhD5StCDFKt6jzPLUp3hKB
	gQv7OKnGyfcgI0w4uh4mD9b1Z4lRwNBm6174pAB/dIcW9FEJQ3OcJdc3eUi8mf1a4GXU4S87ggIm6
	grtm1KrPZZQJtXBdL3XczUwM9sUuBA1ro442GUmXuRVxEEjka7+uSPd4f++6dur17GMQj9gVaGjVk
	r5YV1QMpzRk46ZKI5qew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRJK1-001OWC-5w; Mon, 07 Mar 2022 19:47:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRJJy-001OVt-NQ
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2022 19:47:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BFFA7611AF;
 Mon,  7 Mar 2022 19:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 300F5C340F4;
 Mon,  7 Mar 2022 19:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646682425;
 bh=nAzHLP3Kt9+PtVqYMw+7sHlfuSUTAzvrpaLaZjtK6UU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Xb+Dp+pvqWMKM/Mwl79NCBifSgSdlJmm25HSNTSEjdbD3ot0Zr8morP+3jrrkwcuh
 lA5AiYqTSJnlZefT88b7kCiUR1gL4YG6s2nnOQjD2pGizWDFY2mNbQNw8YOR5wcEH5
 SH3mj2eccqueW7I9tJHUFskdwSTnhYyQz0OFU+RTPrMW9IFxzlNgqreJxgUu/lf+PJ
 mzyjJKH1QEuhU/eCX5685/oliE3PewRzcU5gTZMVjoRe07Rg0I57d0xlzrKCgeWxCp
 EZCqD1FnLgOtRxbfGc1LLHm+oMF43Mmv804QFTICfK46c9JwCbYBSXr/+F/LMjpTc/
 0rM/vq9h4cCbQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 16AA3EAC081; Mon,  7 Mar 2022 19:47:05 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Fixes for the next -rc/v5.17 final
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220307181734.750b4661@xps13>
References: <20220307181734.750b4661@xps13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220307181734.750b4661@xps13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
 tags/mtd/fixes-for-5.17-rc8
X-PR-Tracked-Commit-Id: 42da5a4ba17070e9d99abf375a5bd70e85d2a6b8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ea4424be16887a37735d6550cfd0611528dbe5d9
Message-Id: <164668242508.29310.5914882137409603918.pr-tracker-bot@kernel.org>
Date: Mon, 07 Mar 2022 19:47:05 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_114706_822474_2729E92F 
X-CRM114-Status: UNSURE (   5.55  )
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

The pull request you sent on Mon, 7 Mar 2022 18:17:34 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-5.17-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ea4424be16887a37735d6550cfd0611528dbe5d9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
