Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C809C54EBD
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Jan 2023 12:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IhwRMi0viHxfDEj8GJH9IfgO/GrqcywR/V6UAhJZvB4=; b=kKzu63TWpjB8yO
	Jd98kOqg/+Eo7gU4Y+rDasj2bn3HAb4jBQ+EYV9ul8FMgCBIoHr+H6TLU+oyS7f14xtkOkGSlaxys
	lNz+HWFOmcSKCni2qLYs3WeoZhYXWrodqCBFoUggHCRaXPzcjs13E9kDDQm8wyzavsjAuX3DfdTld
	3xf24aMyv7xOiokQULm1VpZgQeJSzTYvlkeiKAyixF5HLMzgzVnY1gBuk23gmmtacmXHJilrf97X6
	Ee8rDk8vRoT6yBfpUh3NR39fbeMCXtaHHHAWce7Ou9yzHEmm82PcIAXQjta6Hyc/jDxg7Auqq/wY6
	YkNRo37pJ3onA3ema2QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFwVD-00ExqC-3K; Thu, 12 Jan 2023 12:16:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFwV7-00Exom-0l
	for linux-mtd@lists.infradead.org; Thu, 12 Jan 2023 12:16:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 03D1762028;
	Thu, 12 Jan 2023 12:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62D74C433EF;
	Thu, 12 Jan 2023 12:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673525767;
	bh=RiDhcePfRCPtASv2qquTP93C+kQKj3eqBVi2tsk3YG8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kFAXK5ccJQHF0FXQaJUJoNE1lBikScW4cu/zcztAgF/2HFc6z6GYDEyguI1ZLsslk
	 nRS09mrJ1qy4vHznp1GvvSNCniEmUCNoTRIVb9xDeOI0Q6lH9tA2AWG/qtf7VXJxBs
	 vHfe8jVz2hbeCm8OxhpJml8Zx298ncS6ApjugozMv86dfkdyjK/SFegmDbMC9Dctwv
	 yOwaNKnDMfZ0iBgnt8gosX0mfDRAms6BJ+L8c+ImXkg1P5/kx2kcKcDwh+uwAKlXZL
	 9FuRX21KKlqIG8onVoiyyxnI1ui470zoYBvR1CS8/x59ityg3LmzOLp3NpfLyKkMQO
	 7WI3qKXNzTi2w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4CE7FC395D4;
	Thu, 12 Jan 2023 12:16:07 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Fixes for v6.2-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230112104941.27840eb4@xps-13>
References: <20230112104941.27840eb4@xps-13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230112104941.27840eb4@xps-13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.2-rc4
X-PR-Tracked-Commit-Id: c0f7ae27539fbac267384a7bfc58296ea7550d52
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e58f087e9c579a909e62600c3812801227cd564c
Message-Id: <167352576731.4374.9346849073067184118.pr-tracker-bot@kernel.org>
Date: Thu, 12 Jan 2023 12:16:07 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_041612_101458_06AF147D 
X-CRM114-Status: UNSURE (   5.64  )
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

The pull request you sent on Thu, 12 Jan 2023 10:49:41 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.2-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e58f087e9c579a909e62600c3812801227cd564c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
