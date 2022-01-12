Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30B3C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jan 2022 00:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w6ihW2lbk7wvalWCpL1RvDE1iGx0PBQKgpiyvrJcG9w=; b=CQHqFCH7El+/RN
	la+Ooisnq+EhCr80cNVqDxOkzuoY5WM6VXeZLsE2i2WVKPsZL6lWt5qBFDFtizbF9RlmVGI3H2Xvs
	1XZejuQeoEEhNPpvS5B7nc9V3POD3mYpIkLbOyyuwi7cSIh2EzM0Wh3iEJ6hG208Fw29NbnR96Fib
	7gZfTTbg6D+u4Lb6i7+5UZmlbP7vCY7OX5XmnIL8SowUz6Tsq+yI3/UedpRwo2qevERxG7GVlrFeX
	oQBTj28xEEltCp0dJEKDys4d9FalL3Z6AMc3BTs+l6ttsmERKIttaDnHd3xbC8HWjDVw9pjWjtO0m
	u0WrbnfGuwAqwBR/bymQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7RGw-000VSS-QU; Wed, 12 Jan 2022 00:13:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7RGt-000VS9-FS
 for linux-mtd@lists.infradead.org; Wed, 12 Jan 2022 00:13:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F3B656162F;
 Wed, 12 Jan 2022 00:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62949C36AF4;
 Wed, 12 Jan 2022 00:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641946426;
 bh=sEEdKDeTTVxD8cq/ftv62nl44tIULOj/wc8guDBv3ts=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=J3+r6bIqbtDHVqZShZ/DPyElAgWckpnnvCVmISqRObjlZE/sYuzUpA2tc3TtolDhZ
 9BsVDxwtBDj3lWhPHXwyv5RcbYjDgWTQTeq+XU/Hoss6PuEVoPmIZ+8Q5Jx7fdbIUH
 5HkgJrJ4S0XLubxk8QGfz9/4gtNg980vBS06lTTh9d8hsuIuSOwgDXZAKJl9+DA7OD
 /MnMVPj6MgD2jzGWNHo2hE/SU3xpDzeLDNlcp+2eD7JFgpNRI447yFqaPDJKBIvcB+
 nLfpWpwSzg4X67dfelQXZRfDkeqM3ALpqbXg2C+bqsaBPTc9jWtyeER0G+beCzUMdL
 ljCZFXdlBs0tw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 52506F60795; Wed, 12 Jan 2022 00:13:46 +0000 (UTC)
Subject: Re: [GIT PULL] JFFS2, UBI and UBIFS changes for 5.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <1617448966.248428.1641888175120.JavaMail.zimbra@nod.at>
References: <1617448966.248428.1641888175120.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <1617448966.248428.1641888175120.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git
 tags/for-linus-5.17-rc1
X-PR-Tracked-Commit-Id: aa39cc675799bc92da153af9a13d6f969c348e82
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5672cdfba4fefd6178b6c4078cb1bb7bf6ce0573
Message-Id: <164194642633.21161.15740390466183249136.pr-tracker-bot@kernel.org>
Date: Wed, 12 Jan 2022 00:13:46 +0000
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_161347_579252_60F0718E 
X-CRM114-Status: UNSURE (   5.03  )
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

The pull request you sent on Tue, 11 Jan 2022 09:02:55 +0100 (CET):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-5.17-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5672cdfba4fefd6178b6c4078cb1bb7bf6ce0573

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
