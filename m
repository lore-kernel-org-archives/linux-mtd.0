Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFACC3DA64
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Jul 2024 21:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZMet5tK8uJp+JG8OqtHVUDywzhN6Uh93oe2VU0J6qIM=; b=4Zc81VtDfIa1Dx
	ivRqEGGfjQ86Zy5rgRPG3hWhD8jV9XiTTvoRpI94vIE1IJ2cT1t1ij3s3j9gufrAVbhPn31PBUGab
	kfhU3nxLirqdQZ2AIBSmcxx/qahdoq8RofcMgBYNA2xMppR/EumAcz274SQbeoA4yLboP8LhDOq3U
	wQM3lgYVtxn0H+ooY5cnmi01bvaldXLmr2OykSmD42lyuBhv5SD51xVGe4LTZp1oQQ9I2HoGWlFQW
	DZcMqd+R1/kKdnVGbV9mUOe4d3tQng6WOjvklm3Fr5kneYOUMzPhs96jJy5ANv3XVvapLES6emqls
	rMXzmAi/GfOE2ycol4tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYB26-00000009D8G-1ht2;
	Sun, 28 Jul 2024 21:02:22 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYB23-00000009D7K-01HB
	for linux-mtd@lists.infradead.org;
	Sun, 28 Jul 2024 21:02:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DA516CE03F8;
	Sun, 28 Jul 2024 21:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A3BEC4AF09;
	Sun, 28 Jul 2024 21:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722200536;
	bh=oj4MkOG/whLmSwmUrInW8/6lkUfxTEUE5reoXr1APFY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=f2rwlrG1CbAAl65MJN/KNNQfZjooN7eB48avCrHbc9xqhe4NgjmB1o3O/oHjRgIPm
	 JOgGYcztF1gy6iT2fiJdv1+aX4cNa8BnXXgTTaeYr7Q3vvQOZYybi/xxoV2xsgRG0O
	 NvBFOe8i5lLUBTjUGcCfK/TvNAz414/zISlXq4mGReKUyzFdQ/CZx1rO18NbJQb9PN
	 Dv5zus+UrdgEkGkQwCDrq9UF13XoenmZJX7lnlK6uqPGMnAwYKBmCQq/Eha2ReZdwN
	 NSwzNNqXBmiyHyJGSw3p0CrnFp1lK70aZcL6c2vxtTgxVodcRCG6+UW0169OcncSJW
	 8wDWTPwTS7TPA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 21BECC4332C;
	Sun, 28 Jul 2024 21:02:16 +0000 (UTC)
Subject: Re: [GIT PULL] UBI and UBIFS updates for v6.11-rc1, take 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <589372570.132198.1722191188516.JavaMail.zimbra@nod.at>
References: <589372570.132198.1722191188516.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <589372570.132198.1722191188516.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.11-rc1-take2
X-PR-Tracked-Commit-Id: 92a286e90203ce3e6c3a6d945fa36da419c3671f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7e2d0ba732ad649c557b49b0a3ef69d54df256d0
Message-Id: <172220053612.30183.15430153093934775027.pr-tracker-bot@kernel.org>
Date: Sun, 28 Jul 2024 21:02:16 +0000
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240728_140219_236789_496C9B9B 
X-CRM114-Status: UNSURE (   3.51  )
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

The pull request you sent on Sun, 28 Jul 2024 20:26:28 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.11-rc1-take2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7e2d0ba732ad649c557b49b0a3ef69d54df256d0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
