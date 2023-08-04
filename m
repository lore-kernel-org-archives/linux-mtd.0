Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F928C001DF
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Aug 2023 19:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ofiFEJTtRReuNe8bAfhOIBO7JdfMfYX3enWK1Hrm/E=; b=xZaxXr7ti6+0lM
	/7RkLSINAGq8/YTs3Yj/5JTJGM6lIiNUwZjDdvoPznnh73mXtgq77qNmh41OJlwXyjp4bclvqtQy3
	16weNqgNPqrqh+EGLutndirMrqrPZGeSM5+Uc8bPNZi2/pnZI03N8dIPrk1St7PXFnBY7fK3b97OQ
	Ob82yXHAqbuD1dG4CMfcFvg3eJcHeUBv60eYm8v2faf4LHTxhTeOCi2g5bOd//fjS+t3tib0qR5Wb
	CS0kCBMKLoKJTY6VOGvz5Lz8IIfqeJvTW1ees2FgHHWovaP3TpvBGqxv4trfTBATFjxWB5Uj6y0+L
	iUHOSH+Rrm5aY2961B0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qS08e-00D4xo-1T;
	Fri, 04 Aug 2023 19:07:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qS08b-00D4vE-21
	for linux-mtd@lists.infradead.org;
	Fri, 04 Aug 2023 19:07:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 85709620BC;
	Fri,  4 Aug 2023 19:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1127C433C8;
	Fri,  4 Aug 2023 19:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691176019;
	bh=9SxRxvvQH7hH+iDAi4wCpaOFbBMxgX+3IZnoRmnh+8k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=hRZOKhodsChzkmcEx+DjZbGy37PekDtitt4faZ2dGc84xbyLbAjBxN81DZB/sNinJ
	 0T9GL246RpKd95xBrlpoSJgLgf0DJYnuqqvozbgkOvSz+WbHrbO5mXfcR6GeSoz5Y0
	 HgWjp0ZgD81oid2lZnsve0MT8kXAVqAdTzIOUC9ga7lbGdXoje4hsPrEgD/FWOR9zM
	 oVrZ0+w6Z3zCQXu2puLp1orB4XubSevutgUwYPCg8Mm6p2dYePv/YV62/LJ5rl5ydu
	 TeQsxZBB5M8QLMsX1+bmHP2BMBnwSzGu+LAUkx5z3wsdtEB7G0YAKR0uERH5JFnz/q
	 d1ySC1Ndj8KTQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BC638C41620;
	Fri,  4 Aug 2023 19:06:59 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Fixes for v6.5-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230804092401.18b19001@xps-13>
References: <20230804092401.18b19001@xps-13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230804092401.18b19001@xps-13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.5-rc5
X-PR-Tracked-Commit-Id: c6abce60338aa2080973cd95be0aedad528bb41f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c8273a25864e74ab66601459686d6f78b0eb666b
Message-Id: <169117601976.19359.4920113291718690296.pr-tracker-bot@kernel.org>
Date: Fri, 04 Aug 2023 19:06:59 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_120701_709445_9FFDAF3C 
X-CRM114-Status: UNSURE (   4.83  )
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

The pull request you sent on Fri, 4 Aug 2023 09:24:01 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-6.5-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c8273a25864e74ab66601459686d6f78b0eb666b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
