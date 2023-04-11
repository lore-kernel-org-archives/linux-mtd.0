Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E1EC76196
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Apr 2023 18:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5KnVA/uulweT1ec64xt1dbJalQoYMD9eOlwJiRO+SwE=; b=HkQLoW/cBOSQS2
	SN33T7vRdDn3T7wfXQ9+4vD0hrQHwCoz3NOTVvwWoQZWr9v3V/ciqNyF1ZhhKh703fxZuao6HHeha
	BKoh47j4rdkuuCzkXN3CYw1YdBQ+50JqI/pDYL5NSVo6eCQdcGRafsyLU/EXyp48Dl8dDTaIqc1Qd
	ey+j54JRQ0VKjJQuveuIp0Cc1C9VmTBudUEI/T37O7IvV0xGX/a7xIygBQu/1HIh/IRHRlHuBIXor
	ZFy5pgeOs7cXeS21esDYXePbVIlGXnyJ4E/qYEcIp28xcigOytRmv4Pk8T51b+hzT9/qHLz05tzp+
	N+Blezt7Q8R/Enq6xy0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmJ6U-000t0w-1k;
	Tue, 11 Apr 2023 18:52:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmJ6S-000szY-0h
	for linux-mtd@lists.infradead.org;
	Tue, 11 Apr 2023 18:52:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5171460AFA;
	Tue, 11 Apr 2023 18:52:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7F51C433D2;
	Tue, 11 Apr 2023 18:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681239146;
	bh=1qRqsxxXCARfjg3zHR7UivBKrEJYxIuIqt9skWMfARc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=JCCT4N50HMjpOF+qTFyv9E5RF2LaaDlzPp99XAVbT+yQovnVlMUMf+p2ksWNgIB7P
	 JzlysGRy2T/FvYKTvnuiKnq2h58ZqAUp4pEgUgUYvcZ9Dtx8Yd7F0QvpKZ8atqUyzT
	 lrvQCvOQgABuoQKLE5it0mr1PmQDkuR6OLr2BAWICpv6jOujjAoKHmKctcnY3phRy/
	 N9//O+niB3MtetZIN1n7AMKVPXmd6RfdOzJprUo9DwyxwQqsjdKAPxHIWu1Ydab7Pk
	 jZHuLZibPSLlVdHNkAlBSjeZZ78EF9ZIK0BWinDI8F5PT6+n41gs77mY5tEL8VnFE/
	 P2931ccxxWnYQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 94BD0E52441;
	Tue, 11 Apr 2023 18:52:26 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Fixes for 6.3-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230411161153.60998465@xps-13>
References: <20230411161153.60998465@xps-13>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <20230411161153.60998465@xps-13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.3-rc7
X-PR-Tracked-Commit-Id: 93942b70461574ca7fc3d91494ca89b16a4c64c7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 793cfd598370cf9440d7877ddddda1251307f729
Message-Id: <168123914659.3950.5554766066652449958.pr-tracker-bot@kernel.org>
Date: Tue, 11 Apr 2023 18:52:26 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_115228_315157_9E2AE021 
X-CRM114-Status: UNSURE (   6.14  )
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

The pull request you sent on Tue, 11 Apr 2023 16:11:53 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.3-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/793cfd598370cf9440d7877ddddda1251307f729

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
