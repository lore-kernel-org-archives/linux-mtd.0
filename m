Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F583C4708A
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 17:37:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53FAE613CA
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 17:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53FAE613CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8rsHDOA4n8WdxRhr1PiwwRZtS44G4p2qqi4vEHHnaNo=; b=vJ7Gcavfn8PleC
	b+OeKVt2zneOjz/ZdXmKoAxD7u9dECtVotRXHJlUcp1gt+mc8iZ9XBuYWG1p33YclKcFUWWSXdHr8
	E1tk/B0TLJa+85KWgWFx+aKslo/iY7EF2gIEU2+0m8DBsgGnPEAy50u4Rt3B0DNRYt5XdlOcLnxrZ
	Jm2PIB7o8/xKdtvgBodVLO/I4go0JfYRBwxLYu2YwcYRq+l8q196jUiV31mhTf86r7JFjymmZBN+K
	SiNKMMoF70lK80SW7BMTALZd21NxZGx148V5z/7OgJEBQNWP+WLE44s7V8exO57vfVzGqZhjTByJ9
	qq9MstO8+mtOR4sJAXcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llxRq-00GAKb-UC; Wed, 26 May 2021 17:36:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llwLp-00FiV6-TJ
 for linux-mtd@lists.infradead.org; Wed, 26 May 2021 16:25:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 65343613CA;
 Wed, 26 May 2021 16:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622046345;
 bh=Rff+s8/qGL0bds1Gbre6PZ59RBghMMXlEuvk+nlSSdI=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ZqjkQgwQOWyvZhOQEHhxS46apV0YVyRhNEzXFD3M6HZUZe2iixUdK1XIVj4T3UMi5
 oOrG5S6UIWH2Et4K2xv5/6eZc6ALcIJlnnQCHJhkNixpm25/epZneNoazLEa4HQfZN
 6G4QgvBQh6CfKqEVjXo7lVlivIpK/pgljYkzW6VDexvEWQU6XdxHBRQAMWjNVMRZm1
 ApGR8f9EBcHS+JSNvK+RZQGFWSjPAWQPF8jq/oXF//hoPrUl7V/YYVVMEabwFGLg6t
 GheI6x+WghY+KHu+qNWtlxWmq0o8v81ajbUYkXM80CXc2XPi1MfRDvKwIhUFzms5Dz
 AmR0Bh++kuNkw==
Subject: Re: [GIT PULL] mtd: Changes for v5.13-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210526175924.4f9ab124@xps13>
References: <20210526175924.4f9ab124@xps13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210526175924.4f9ab124@xps13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
 tags/mtd/fixes-for-5.13-rc4
X-PR-Tracked-Commit-Id: 562b4e91d3b221f737f84ff78ee7d348c8a6891f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7ac3a1c1ae5152e1d18cf6df5b6c3c9847535e78
Message-Id: <162204634524.25444.1664185134093644010.pr-tracker-bot@kernel.org>
Date: Wed, 26 May 2021 16:25:45 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_092546_003314_12854D7D 
X-CRM114-Status: UNSURE (   3.74  )
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

The pull request you sent on Wed, 26 May 2021 17:59:24 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-5.13-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7ac3a1c1ae5152e1d18cf6df5b6c3c9847535e78

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
