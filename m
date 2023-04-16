Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2CAC77B70
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Apr 2023 03:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ED7/0+0LlafcAz0BuPyP3ewiOusUVbOfem9GLrtYg5k=; b=k64LYZLLzSUgFL
	LKAyLHaRYFhGQ+4jmpKa2Zd+5+fNExlhIhmbw4Ro9vyAy714K33tfzmqFYn8mQT5mMGhrp30+46ms
	Qfd/F56xDUQj8tcQKV2E+Sziu2NhDDlyNfM9UsR8kZPSCBr86yVJ80Pk5KP1ZMx5R04tMO6Se/hve
	In2v1kP2/Vo8bheYOcaDBSnOyOKudYdRn6UeykTLlQwO9ol1Ikq56DTErDwbjWHH/59wq3nipgEOD
	CT7OE3sUqB4v5iZHUctGPL77RTaINDH0DP0WW8xevRwkNVSsEWf/kwadKzdj5buTy8a7vQy1WKO7s
	xJIvi/nK3EbcVd9NblRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnsey-00D0Xs-0u;
	Sun, 16 Apr 2023 03:02:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnsev-00D0X5-0Y
	for linux-mtd@lists.infradead.org;
	Sun, 16 Apr 2023 03:02:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B4DFF61503;
	Sun, 16 Apr 2023 03:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27FD1C433D2;
	Sun, 16 Apr 2023 03:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681614149;
	bh=Q9pF7NBGgp5Q6k/Q2BTtzCR+2NNuZhVAGS+Wjr99bQY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kVkTVVJJ5QUIMxec4T/EorzVklkVhQ7csSoS+db25yNacqhnC4UeHVHfUtduD+NNP
	 DsSUXq2Nxc8Bu+3Lj/XCAVCl4CcIWyvPJSoz+ZKeTAqKHqGGXGAh9I9EuXkY32Q81S
	 aWNWwQZzqr/rQS6GlsVJW6rGBji0kr92VYdzV4EroSAyU+TnEsHfKRAYjxDq2rb+EV
	 ILIrOqo+PCbptsFXO9/kKadovj34fBFv+VNK0PXuVyru1dMSmFyJO5UgjPHmETybwR
	 eAyoXBu0ziVunzgd8k5xn8WBBADds0n7ibC4xPYa9DJpIlazThMusSPP5xlKkZBs9l
	 I4QBaO3LFZv7A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 13D47E5244C;
	Sun, 16 Apr 2023 03:02:29 +0000 (UTC)
Subject: Re: [GIT PULL] UBI fixes for 6.3-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <1571141363.69401.1681583046301.JavaMail.zimbra@nod.at>
References: <1571141363.69401.1681583046301.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <1571141363.69401.1681583046301.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.3-rc7
X-PR-Tracked-Commit-Id: 1e020e1b96afdecd20680b5b5be2a6ffc3d27628
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bc88aa51a61819956bb23dc26fa72b5bc9a81af3
Message-Id: <168161414907.1043.18375446280594861946.pr-tracker-bot@kernel.org>
Date: Sun, 16 Apr 2023 03:02:29 +0000
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230415_200233_274062_B0328C4D 
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

The pull request you sent on Sat, 15 Apr 2023 20:24:06 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.3-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bc88aa51a61819956bb23dc26fa72b5bc9a81af3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
