Return-Path: <SRS0=xdWh=YG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9AFBC4CECE
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Oct 2019 16:15:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 843B32082F
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Oct 2019 16:15:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ISu4T3py";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxpLRAMR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 843B32082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=msrlkJG7gMOH4aiIYklk+mvVVs71jJXVU3kV5IX7Tlw=; b=ISu4T3py35Xypo
	A/9Bkug3JKPYxO0Mll58cnZBkTH3Goqnds0Tld4kDoh+taKZZjBvbQDAajiz25HZRXp1cFATrVK/L
	M8G3s/YQ6AkBaheC+4BrfJEQKoNzlqQeHqMXx53POj5AoWUe8AeUW3LKqYPAWbvlxvBQWgB3nasEC
	1NtU4yQqvYWxMVqH4vlz573UHUVKrwE8N08pw7lCE9XVPMXbkvi9m5IIZj+THwPDEt/yRP+a85tIC
	nFu9CxwfT93y4mk/c/qDaL1sI4TMey3HNFhn6WeVMQRcjFYKJJeYm149aap6WDu+ctDtlwBWBmMvj
	bWvKZ1PMYIQaaGkr3Rmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJgWX-0000mo-3R; Sun, 13 Oct 2019 16:15:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJgWS-000061-2A
 for linux-mtd@lists.infradead.org; Sun, 13 Oct 2019 16:15:09 +0000
Subject: Re: [GIT PULL] mtd: Fixes for v5.4-rc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570983305;
 bh=l3PUiyUzcVRzu9ZjGfW0o+6z6+yhGNHQ5vU+b73MK9I=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=NxpLRAMRt5/vZ0IFd4MiE3R5jGRHjoQPnytwfCie1n7paj61EVBmB4QKcVBUYYS+T
 aqiUNURruczlQIjZpUWMGqmgZHOUCxZ87fxJQiNKF9zBrBxGd2DT+hoV5KjKSWwnl/
 TWF2t8iAZG4Ru/E13JQdVky1OMoKfGKSzqWXwpnM=
From: pr-tracker-bot@kernel.org
In-Reply-To: <1615396520.21318.1570912156820.JavaMail.zimbra@nod.at>
References: <1615396520.21318.1570912156820.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <1615396520.21318.1570912156820.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
 tags/fixes-for-5.4-rc3
X-PR-Tracked-Commit-Id: df8fed831cbcdce7b283b2d9c1aadadcf8940d05
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 71b1b5532b9c58f260911ee59c7b3007d6d673a5
Message-Id: <157098330559.26372.16017055334585777960.pr-tracker-bot@kernel.org>
Date: Sun, 13 Oct 2019 16:15:05 +0000
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191013_091508_197737_6DD580E7 
X-CRM114-Status: UNSURE (   1.10  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, miquel.raynal@bootlin.com,
 torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Sat, 12 Oct 2019 22:29:16 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/fixes-for-5.4-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/71b1b5532b9c58f260911ee59c7b3007d6d673a5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
