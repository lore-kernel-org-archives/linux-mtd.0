Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2569C61DB9
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2026 19:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zo+3oIcv+67IjtwSRMlqvao/wtSascTMbt2moJp5Mmg=; b=Ddnk4YZgNe8egh
	FO6jLF62ph5YBDlvNhGpnwHhSAVbSblV8FvSwOvlP4FSpPCMUTuubgbvzUKCmlhWbrkkFOJEBeZad
	aYkOl3A/hXkY/0Q2IYBpCdXQHr6Rzht767ZZfhpI3ZF2UqYx7i4zMvLt3ivUhCcVYso0dfrcYZjWt
	o3VEGxfOpJLpJNBMS/YMyPjTIF9XRuEsNeRRfWP7qPizybq8ShzKz0ntXiPRuFDXdhp7RHYtGZd7G
	MLpMFqbOq/hls2uSU2qar3P4wKga9tdX8NvFuQCPp8S3T9/qdEdsGwWd06Ga8TINWix0ASeiCXq71
	x4qdvVwjzjfxXR9+YHYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x02bM-00000006NUI-3x0e;
	Fri, 28 Aug 2026 19:51:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x02bK-00000006NU6-2pWU
	for linux-mtd@lists.infradead.org;
	Fri, 28 Aug 2026 19:50:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E786C43E43;
	Fri, 28 Aug 2026 19:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD7D1F000E9;
	Fri, 28 Aug 2026 19:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787946657;
	bh=G7D90wuYUMGOL8VRkWzB6ufGelXYfw+2tsOaPS3rspg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=V1d1cw4XnsumXLuz9FSKfgnL2euAo/Pc6HbU7fFQEzSmrHcJo3hKHXOplJnVrVSHF
	 qXofLqsl8CYXye126rvfxZN7ikGc5U8HxMVczmkFAFgQdan52RQi/H37e/FI+Fu/aI
	 UmOl3AfxUMKIYdrKoenE0AwCVQ4lLEp+mBQejbIFrvg100nhXcZ9iNxfotZutaurBn
	 mInoTYn6WzFIeH5xiSe65Kko7tL7XvhphupxIVy4nkd9uH2IFEWq6YV2jjNdxoDKhc
	 AYWCxyEVco9EW+E4fLkLYfZjwEBnJkNfo9ruu7sZCjRkP/c2PZdapEUsMXJesgJK9e
	 Z37xKtKtIm4eA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A8B380AA69;
	Fri, 28 Aug 2026 19:50:03 +0000 (UTC)
Subject: Re: [GIT PULL] UBI and UBIFS updates for 7.3-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <7545938.rdbgypaU67@nailgun>
References: <7545938.rdbgypaU67@nailgun>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <7545938.rdbgypaU67@nailgun>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-7.3-rc1
X-PR-Tracked-Commit-Id: a5e0055eac837a1168c781653943d4a0d9920af3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ce727a090be04dc7c51edd5c0da2a41d2fb6e106
Message-Id: <178794660253.2763027.897003071588049712.pr-tracker-bot@kernel.org>
Date: Fri, 28 Aug 2026 19:50:02 +0000
To: Richard Weinberger <richard@sigma-star.at>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel@vger.kernel.org
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

The pull request you sent on Fri, 28 Aug 2026 17:00:27 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-7.3-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ce727a090be04dc7c51edd5c0da2a41d2fb6e106

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
