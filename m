Return-Path: <SRS0=8wrd=WZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D31C3A59F
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Aug 2019 16:15:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D028121874
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Aug 2019 16:15:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PDBdcxVg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGn8Kcdc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D028121874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=daoq4zvAJQbTctSC5W3hUTmmWzR2r3KxyUb1TTsnmi4=; b=PDBdcxVgxb+QSR
	pryr1HqJ9YMslcMu/DGwVP8eHQjE1lbU59XtAEjjT+4kQeGOj6dQQguRG9gELgtCpgAQvLhYC3m3x
	eUTd9rxBwT03FY7XxQDc3BFjnA380p45kKpvLVIPHdkcNj/DHkGSoJZbj8MVsh9jB7EVg8yWilfZX
	cG8MZisaRbyp/EMvtAaMmLEn239uaACbMweaUmwCT1Tb2HVsZsM4cuXpkwVe+fAqPp+7Dll3Liibq
	2B+6ngWieiSoI57L2eG2pOhxzrVoP8Q5nuioOXdy7bdCK8j810I7K54AbIesuRVjkG6FZrT1mTHQs
	1PD678lviyD/lKxHd69w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3N4r-0006JJ-QT; Thu, 29 Aug 2019 16:15:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3N4n-0005o6-7t
 for linux-mtd@lists.infradead.org; Thu, 29 Aug 2019 16:15:10 +0000
Subject: Re: [GIT PULL] mtd: Fixes for -rc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567095307;
 bh=WTpIdLvaLoglhAbyijHyx/3yZK7koc4yT9tfo593Q34=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=bGn8KcdcLHdGEsPai3B34D/fYykSI13X9qOOxFmskGYOBmWX54VKJlgd3RNruHHeq
 o8Grjvv79Fw70FHSbQpwL/Eug5c+AIHoHpgDNb5NUTJzQ/1vZUnFal6j0N6WJRptsC
 d5mN8glHj3CC/JBv4qyGQGq/lDplnP60dbDlvuB8=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190829144428.3cb4d481@xps13>
References: <20190829144428.3cb4d481@xps13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190829144428.3cb4d481@xps13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
 tags/mtd/fixes-for-5.3-rc7
X-PR-Tracked-Commit-Id: dc9cfd2692225a2164f4f20b7deaf38ca8645de3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4e73079d39f62a5a46fbc30260acb0bd890c28df
Message-Id: <156709530703.2214.13976882612421454190.pr-tracker-bot@kernel.org>
Date: Thu, 29 Aug 2019 16:15:07 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_091509_321855_18218730 
X-CRM114-Status: UNSURE (   2.10  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-mtd@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Thu, 29 Aug 2019 14:44:28 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-5.3-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4e73079d39f62a5a46fbc30260acb0bd890c28df

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
