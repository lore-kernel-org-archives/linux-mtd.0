Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49924C61CE7
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Jun 2025 14:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPgMflXsKhpBg0r+Yt+Qomg/XWKRlhaqUeLnwN9L++Q=; b=DtWbhnHA3Y32zF
	xLR1vjesKR1NRA4MB9faaxLNxhhaaRyPT6GPvh5ICJ6R0GQKWfyNRNx2fbjDyln1gMhJKuzDr19lP
	+pVEc6o43PKGjiuyxsWazWyXAzR8A6ALhsARnyoLECEhB61WthD3JEqFLU4qOm2Fj0I7+xjtVUtRC
	F5gN3ZcZFfubIIdZvpNNehc0rBCzb0J/D30O2xAUbkbARkduDZvFtGQUrv1DPEIQQMYiy3Y/OexRL
	ZAe+DsrJBJy3SvAsX7wzZQgmtuTpbY8pgo+3nO6B1ajZaDP1vteKoDCelnhNXqm6MFKPSEa97HSYZ
	Z42j0Sxx7KjLlONG0pQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNuit-00000001m5J-3EDx;
	Sat, 07 Jun 2025 14:40:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNuir-00000001m3c-2sqn
	for linux-mtd@lists.infradead.org;
	Sat, 07 Jun 2025 14:40:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E7B475C06A4;
	Sat,  7 Jun 2025 14:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7C7C4CEE4;
	Sat,  7 Jun 2025 14:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749307235;
	bh=yXUT3i0z6a8WQl96H5LHFhs7mbe0fZvd8f3Eywv3fcM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=n0s5U68LRd5heC+3GkXG4iqV/Uahx4l4Pan+aqGayY7SKbSbisvIHtD0DRasEtzf1
	 jyLF/wQeVj8ZSy8xmmScMNrg2BpywZh3h6sW3kCZGw5Pu9KBpsAwX9Hgj2FLjJNnuC
	 Owmvjj+hy9/7b8+vcGzhxc6UUH9YtNP1hVq8N7sGjbf6WCRkB41rpApry1CiMebtQg
	 +avHq1lYX2bmXvRq5mjH7EfUf9eN0TKl6k/vJCZSSTXa+MhymKBMDZGKpr6IkgEYbt
	 N6M87KYHuNG8vmg006y+EckBxrS8f6TLEhxb6azVP58gAZDYIv1lD1cZxkpDm46jKq
	 1Leh5G4aP4frA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0BD3806649;
	Sat,  7 Jun 2025 14:41:07 +0000 (UTC)
Subject: Re: [GIT PULL] JFFS2 and UBIFS fixes for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <1612150437.134340417.1749275991560.JavaMail.zimbra@nod.at>
References: <1612150437.134340417.1749275991560.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <1612150437.134340417.1749275991560.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.16-rc1
X-PR-Tracked-Commit-Id: 2b6d96503255a3ed676cd70f8368870c6d6a25c6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5b032cac622533631b8f9b7826498b7ce75001c6
Message-Id: <174930726655.61778.51942806686421281.pr-tracker-bot@kernel.org>
Date: Sat, 07 Jun 2025 14:41:06 +0000
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_074037_764221_4573C84B 
X-CRM114-Status: UNSURE (   4.54  )
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

The pull request you sent on Sat, 7 Jun 2025 07:59:51 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5b032cac622533631b8f9b7826498b7ce75001c6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
