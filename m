Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E91C47DA2
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Jan 2024 20:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aebtxlmT0tGzO0+QJjjEZoRRnEpZMnaEiYo90lyK8ig=; b=VbbkLWcZPNLZsw
	roGX4bX+c9gQq5P017gRAXF9SmK9hEtKtsWgSPILSyDRY6WLNAIGriUS6n3e+ZQH/GLatt1jVd9iA
	9cuGT0jN0z3S4kgSxHBUpc7biYcYgR6BLjUmFvlg/oOcrybLsMpy1WzfBiUMskb5wxql47OcFn0DL
	WySKgoD2Lv41ejDcZeFWug6VuAtjBgditJuphaJUZx+5GDMen9t2Ov4ptB5iTcWBwWfXbDJNNlph0
	rKem6nuNBedg2ybi3i1fkhSvWZirOR7VIKoBmoDlFISk5ibeOBf3wueT0lk4WHjCuCuVn6v5qaHVU
	4z9rV1xDNETX3ETR+rSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQC8n-000agS-19;
	Wed, 17 Jan 2024 20:04:01 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQC8k-000abj-0l
	for linux-mtd@lists.infradead.org;
	Wed, 17 Jan 2024 20:03:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 501E9CE1B7C;
	Wed, 17 Jan 2024 20:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F95BC433F1;
	Wed, 17 Jan 2024 20:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705521832;
	bh=xitC+Ek/KRT05A5Cyy0Bf+rJEufXj43pjVj98b0DuDA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=vBMb4GgNRXzPQWr7UAyk5yTRiNxWH+Sjzx1ysrgYIMC12rudiqJwqyHeh/gKCHS9H
	 MC62GYCoYG1HLTXlZbddVMU1nRYPdfovUrRE5K90SxI7NfU23XqoS4CdOViQ3tQUU8
	 vp7fE0V2d1bp0PH+nQ04qAGDbkLRud+isZNDiK31v6yFOUFwfh6LxC8PnPJ57RzXyM
	 pBe1Ho8KDIji41fwE4zmAn1Vfat4n0KIYsXF06c5jwb8IKBqFtFPIPLarbNMRKMT7k
	 y92kdeWtnIjftiOIg0OTSr3d+7FZJJMZGxRYkvqr1+lnMviz45UqApHeUEML0etwEZ
	 6LlUhlwFMwoRQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7C21FD8C96C;
	Wed, 17 Jan 2024 20:03:52 +0000 (UTC)
Subject: Re: [GIT PULL] UBI and UBIFS updates for v6.8-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <1338470076.231558.1705178301103.JavaMail.zimbra@nod.at>
References: <1338470076.231558.1705178301103.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <1338470076.231558.1705178301103.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.8-rc1
X-PR-Tracked-Commit-Id: adbf4c4954e33e623897058a617c583d65a177f6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0c6bc37255927cf2e2cfdd9dc9bd1eced9c166de
Message-Id: <170552183250.2985.633302158236120005.pr-tracker-bot@kernel.org>
Date: Wed, 17 Jan 2024 20:03:52 +0000
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_120358_546860_BD69A070 
X-CRM114-Status: UNSURE (   4.15  )
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

The pull request you sent on Sat, 13 Jan 2024 21:38:21 +0100 (CET):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.8-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0c6bc37255927cf2e2cfdd9dc9bd1eced9c166de

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
