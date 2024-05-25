Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D5BC25B78
	for <linux-mtd@archiver.kernel.org>; Sat, 25 May 2024 21:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ulEgp1cduOmZkkK1TBxQk/QZfBOAwXVANdbWlvUu6uo=; b=ddjL7sXyS4aGJp
	8cY8Ppk0rOGZZmUWqSPeb5bDhX1dn0ka/rbJzqardYUjOb/9yOt8CpEnSSf8PpqSHTEwOaqDAexbh
	pnMgMgtCZpeEwUSp1P9VDwFAP3O59Hcy0CBYRDLD299B4aHUwmFEBAHF2etbvq8cE25aVkLU53uPw
	1VHOcZsARR66+dgrSTDeXd+c2zG+AT2CZSUWrSOTTxUiLBQI1baWO3g0PgRvid9PvC7fu/7TByQ1U
	rT4gTyKTyVMCEFbBjAJtSwnQS3215ecPtYx6yH0xFXhgCpjCQntYuMOKEaVufYHtg+gVMXhVQ6HSP
	Z3wYyux4RAngvNpEKIWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAycx-0000000Bh9m-1HFI;
	Sat, 25 May 2024 21:08:31 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAycu-0000000Bh88-1wJf
	for linux-mtd@lists.infradead.org;
	Sat, 25 May 2024 21:08:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 71046CE0AB7;
	Sat, 25 May 2024 21:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3E1BC2BD11;
	Sat, 25 May 2024 21:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716671300;
	bh=nEqzW9oyU97phZK7uKMU6F+19PuFaeFngjJCCflqxZQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=a4jfikW636doLx2EGDH1HbLcxJr7Z6z/6pjy7lAkZkppcwxHwdN33XKfwH/6Xnxtb
	 WSe4kmvEomGswDc1YgcCtAgEGy06mNzMbC/jZC3ervetVlQfEkkkwig2r9t7TzLZt3
	 env1annT0VxaT15IFemG9lwekH1XBTldoByFGvvaAdSYVfX5ihDTAgnI2bpeq63vxh
	 Xc8cXiZrhCZI0OEqRBWHh89tjerg9aH1py0winOBxgR+qNVBMDDLL4OZFIfV0JL42K
	 RmGxKvRYiGIF/EodAp7bS/14JGTR2NVEEL0Wxf/7dT0Drbd1rCm0/D/md0JYe3gn49
	 xq/NheNJDHrVw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ACF8AC43333;
	Sat, 25 May 2024 21:08:20 +0000 (UTC)
Subject: Re: [GIT PULL] JFFS2 changes for v6.10-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <1964508139.144819.1716585977753.JavaMail.zimbra@nod.at>
References: <1964508139.144819.1716585977753.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <1964508139.144819.1716585977753.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/jffs2-for-linus-6.10-rc1
X-PR-Tracked-Commit-Id: af9a8730ddb6a4b2edd779ccc0aceb994d616830
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6951abe8f37b1f4f9a0e7c036873f0ab4f56abf1
Message-Id: <171667130070.10959.173856068914692305.pr-tracker-bot@kernel.org>
Date: Sat, 25 May 2024 21:08:20 +0000
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240525_140828_704078_3EDE3049 
X-CRM114-Status: UNSURE (   3.71  )
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

The pull request you sent on Fri, 24 May 2024 23:26:17 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/jffs2-for-linus-6.10-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6951abe8f37b1f4f9a0e7c036873f0ab4f56abf1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
