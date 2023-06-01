Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5056C7EE23
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jun 2023 21:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GedC5VGKSQtO03JI8o4aF/WEU4hvR784w9ZbOnnXKe8=; b=TLGMGyqvN2kmyG
	P5llb86TUDFC4EfNdGtf+8zM8pKqRtm1GRIEDt6PFzCnVTnqDFEfmMNR4uRwjiLRpON7nu28V9llR
	urvOFMceVxUsxDlK5ee1lTcq2pE7FsJUmtathhv4lY4oAawrNe6NNDohcxCr/m5Oem6dGmUGDNeru
	UxuorrqjG81qqXr3do5CokGLYXCvKaM7Z8IuH667hyIpA0OoOoa08/rHFGoNU8ozo4gHTrKJ4f1gM
	Fu2CoBG4g9MNrKrwO8qHNtxM8VVz/MaGLDhzFEChqYgMbdLynlT2h2dHqsPKgWsHzE0YQH7erb2cb
	Ik4bMyyreOlIexgnsMfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4q2F-0051fw-1l;
	Thu, 01 Jun 2023 21:40:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4q2D-0051fW-11
	for linux-mtd@lists.infradead.org;
	Thu, 01 Jun 2023 21:40:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D560264A73;
	Thu,  1 Jun 2023 21:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A9F9C433EF;
	Thu,  1 Jun 2023 21:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685655640;
	bh=RA/GXG6/916awg+awBQL70oZiccXy7Hn7TFIiriVzGY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=e8jUZTCUYZjGK2B3ruVp5VSonkzaAbWsyxIxe35OwOVj+dCg4B+MH9WsLw0Xn48+V
	 W78UG8O7gCg2v7nMUsHHID4R+3J89TMZF1tnx9SkVLtTf0ZtWHTjOBMfbewnYfujPS
	 aW3sm1IncFkg0lWPWQVNVK3WG83364o87iW6R32jjdGBCDRPDwufeXU0B/6G+962+r
	 8AyiNSRylRLG9VVuTfWN4HloSjSF878logoPkyL0MlunnBORaoDNIwYIlvMYHb8zPr
	 yhIdw0xyRCdvmztuZw3iDECdg9SETHVBgup9FUhGlu6RTb8jClzT0DhuwbGGAZEE2W
	 W7VBQhzuxbQ1g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2A59AC43162;
	Thu,  1 Jun 2023 21:40:40 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Fixes for 6.4-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230601181916.515b516a@xps-13>
References: <20230601181916.515b516a@xps-13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230601181916.515b516a@xps-13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.4-rc5
X-PR-Tracked-Commit-Id: c4d28e30a8d0b979e4029465ab8f312ab6ce2644
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b0e78154c0876a46ec874615262bd3ea58b80788
Message-Id: <168565564016.17545.7344128695610453416.pr-tracker-bot@kernel.org>
Date: Thu, 01 Jun 2023 21:40:40 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_144041_417041_8A7EEE5B 
X-CRM114-Status: UNSURE (   6.13  )
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

The pull request you sent on Thu, 1 Jun 2023 18:19:16 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.4-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b0e78154c0876a46ec874615262bd3ea58b80788

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
