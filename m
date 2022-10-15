Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96915C4332F
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Oct 2022 01:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BK56z3umpiyQQaQdmNUBGDsV8mdExyigzK0Cv3HSxAU=; b=Ux7KaKoP1irrfy
	CWiHdLPhKAxuV3Ya3vK+fOkpOMFs+69/pOu8r3tL+iItSpYc/Z+xfGgxydaBc1ON0s81IZp+wmh5g
	Z8iT+3hgtEL5Lyi09BCaNe3PBg25RWQigh4SzAH4/w+bhUohPyS2AZrZs51je6aHMDYo0e4RDV+vN
	aJNQScRpY5i6eWIOQf8jXz6ulFTh1JNKjj5rljcYDDDe0JK5b5OmJ2qZNi9U1+4G/mNKQiM4pUSDj
	S4YU7XlFGFTCSKRgn9ralxIccukhos0kYhdY3BZ+a9zQOwfNiVIbSipCwybjQ8UnlbO2pcW+hn2xK
	qh8kDe7xnwjLjGOb0LXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojVx1-00GGVh-W9; Sat, 15 Oct 2022 01:26:56 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojVwz-00GGTr-0O
	for linux-mtd@lists.infradead.org; Sat, 15 Oct 2022 01:26:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 7D04ACE26A5;
	Sat, 15 Oct 2022 01:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7CF2C433C1;
	Sat, 15 Oct 2022 01:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665797202;
	bh=GVMP4r2Hfa9BV2HDkorX+mxl6yljcepM4oHHjUdD28c=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=DucsxmIhZg9fiS7EdA7CqieRsUfncznrtMaNJmYCGLun58+0O5vqTu3A3hut7d6j+
	 OaAqrX+lq5PjGyNlIiq+2Aty3PzENdKFTGDu59uZtS6mYAQ6agj8QiQadiGtpf2R0B
	 Ud+nkP0125uyZyVPjM8fwIsEhzW29yqZ/FM7Vl87MVS/kr/GLF5tE+UsO95M9Wi65t
	 bck4gvH9vWAJ/DP/b4akYMfmiV3IA4Zznz18WRBGib+nsHqZgrTdFgutqyaDHONnKL
	 IAf4H6BbkqSCdj5AOwRQDj3s/5mkFKKncGSyFf3QDxvvSydBHu/S5+BqsUxxii0NNU
	 UeATtdOJ7YApw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D477EE4D00A;
	Sat, 15 Oct 2022 01:26:42 +0000 (UTC)
Subject: Re: [GIT PULL] UBI and UBIFS updates for 6.1-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <1135185122.30714.1665782233107.JavaMail.zimbra@nod.at>
References: <1135185122.30714.1665782233107.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <1135185122.30714.1665782233107.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-6.1-rc1
X-PR-Tracked-Commit-Id: 669d204469c46e91d99da24914130f78277a71d3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b7cef0d21c379669c9f620c9692b5c7c885a6311
Message-Id: <166579720286.30479.2326196270255262901.pr-tracker-bot@kernel.org>
Date: Sat, 15 Oct 2022 01:26:42 +0000
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_182653_242697_98ED16CA 
X-CRM114-Status: UNSURE (   4.89  )
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

The pull request you sent on Fri, 14 Oct 2022 23:17:13 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-6.1-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b7cef0d21c379669c9f620c9692b5c7c885a6311

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
