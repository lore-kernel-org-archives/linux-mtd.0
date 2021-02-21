Return-Path: <SRS0=BfTn=HX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89498C433E0
	for <linux-mtd@archiver.kernel.org>; Sun, 21 Feb 2021 22:03:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B69C65045
	for <linux-mtd@archiver.kernel.org>; Sun, 21 Feb 2021 22:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B69C65045
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ltm7bt7gU2kHhptZSinSEbvuColNYovzgLTIeAkcbMg=; b=iOxgxpSTiaYyLOGrjuTkftBcZk
	o0wZesMmodkF2gVBGwbEriUoIVRYTtv1+oaqgGlanKGKIMoPl1kTjRmfoViOfC0jYXNxdafRWrxjt
	ja7kfewH2cYn59c7O7sp6sqGeme7L+Lrr2mUO/amIg9Ym5Fb1QqYYYNY5pmTH/ELF7MsiLkTYv6OI
	z6hp9fCqJboIzaFstKBUyItm8NjY5Z7woOqJ2oLQS80ZoDBgvF+8AzLKk4GDXz1q1hyyszG0AIbMZ
	bsBJHTamLRFVlSs/I1Z/ICD3GXgFLxzbu9pzx7AqibQ2T8h1m+klwkcfcBwgvPzkkoY39VAMOxlLm
	bIJ/szPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lDwni-0003vN-PS; Sun, 21 Feb 2021 22:02:02 +0000
Received: from [198.145.29.99] (helo=mail.kernel.org)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lDwng-0003u2-9M
 for linux-mtd@lists.infradead.org; Sun, 21 Feb 2021 22:02:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 1F3F364EE0;
 Sun, 21 Feb 2021 22:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613944911;
 bh=ead7r2hcu1SPttI/kAhAKS9H4EVXgGhmWeMXsX6WnjY=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=kDCX7cUCQChVjw3Ai6WDG6cZgDVcfhovlYZKrrIC8EnMvHFReLoqKuAb9gOCLQaba
 1s0uiCRFzSuu08IVxTVxZv1bsw5cd7bfxF+ptbTAJjTMkO3eKNOVR/6d8SzVpYPLCU
 Qgy3O9+6A+80gE4UFue5Ne22BfltfXSlT5zrS3cbzLUOl/vshvu9pgUOwkjfYARVar
 ljdp9wNeWjVIni3w5scUsrJBYpN8FB0SmP6i8NSBtJBiG/l5Xj7ag0UZlGnw5JMiam
 rpRiQyGI+ADr0Gx3Ilf6oY4RMLZzjvIZ/w25nPietqXs8vD3T8arT2LZi7qmLHx4U1
 ycj4lPrARWJ5g==
Subject: Re: [GIT PULL] JFFS2/UBIFS and UBI changes for 5.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <2079847149.14899.1613937734472.JavaMail.zimbra@nod.at>
References: <2079847149.14899.1613937734472.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list
 <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <2079847149.14899.1613937734472.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git
 tags/for-linus-5.12-rc1
X-PR-Tracked-Commit-Id: 42119dbe571eb419dae99b81dd20fa42f47464e1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 66f73fb3facd42d0a7c899d7f4c712332b28499a
Message-Id: <161394491110.8676.13685988086312540707.pr-tracker-bot@kernel.org>
Date: Sun, 21 Feb 2021 22:01:51 +0000
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210221_170200_466495_6E9D4B33 
X-CRM114-Status: UNSURE (   4.62  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 torvalds <torvalds@linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Sun, 21 Feb 2021 21:02:14 +0100 (CET):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-5.12-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/66f73fb3facd42d0a7c899d7f4c712332b28499a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
