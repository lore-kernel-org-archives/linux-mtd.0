Return-Path: <SRS0=H2jB=G2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03E3C433DB
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jan 2021 20:07:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 456DC22D50
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jan 2021 20:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 456DC22D50
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DUfgfEUUYl+v3Q62tkBZTnzZQEmQ7W0hTKbc2E48924=; b=OeaHJ0jFLdLc9JH/fE9I+UL23h
	ZImnAxkKLyeff+NgRWt9oaJfU2HuRiHzwzNzYueh3k4E6kJkfzdXH5BNqu1IDKzNqnqDJ/RgtRr2c
	92XG5+9Lq6zWHB+hoB8Q763O9h2CDp4T2vPbo8P68nTGUcoJ12hmaBfeStc6Rm7v0Cgqxlvmw1Zfp
	FXarLCh6cCICqjVli1wGD1LSbg2U/NeRNSyQ4Br9PYhRa5Zh1oPe4Z1CLD8oYHvqELk5/4shqi5AX
	TYdw7EAG208HyeYHvnpuzKHD9jgdb5jz43V5fl+fqFczpvMqOg72fBXo946KeWtz8I5soeS7q4CNO
	6cUsVwOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3PAJ-0000O2-Ab; Sat, 23 Jan 2021 20:05:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3PAF-0000Na-Dx
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2021 20:05:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id AC737230FC;
 Sat, 23 Jan 2021 20:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611432341;
 bh=QR8j3/Pz9sPmSr2bB5ttxkkk2G/AllB+gOLTaVma/CQ=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Gl+p+ufpIFZwqrA8wvc7AJpEdXA2ZA243m4tbBy/ezno5YA+py2aEYC11t21O+K9v
 Qro6VrzdH1/sf26BOOvZU2UIkHC1AUxb9tGvgHHYRVZrmMl/H/XNOTELXX/lUU/pBv
 jNEYi+E6VPPISgFesdACspazUujs/9JDQZmG/FdOhPSBCmB0tQk4AR9pHqVK2P5kyG
 +o9+nWY80jUGMZW/2MigV/LR3sbjtRhdfBX4uNi9M7pPRDff2k/KTT1J5GU3RogIuH
 eXiTQpmgiGPNyyicIlhmIGieDwhQIvpy4sA3EG3UkrgmYCrQJKLALQLZrDDalY7Cnq
 niK1S3tRma8lg==
Subject: Re: [GIT PULL] mtd: Fixes for v5.11-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210123195940.2c76e738@xps13>
References: <20210123195940.2c76e738@xps13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210123195940.2c76e738@xps13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes
X-PR-Tracked-Commit-Id: b135b3358d73aa2a8b2be35d08e422421d1c609e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e1ae4b0be15891faf46d390e9f3dc9bd71a8cae1
Message-Id: <161143234168.8668.12529729154136210909.pr-tracker-bot@kernel.org>
Date: Sat, 23 Jan 2021 20:05:41 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210123_150543_584204_255014B6 
X-CRM114-Status: UNSURE (   3.59  )
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

The pull request you sent on Sat, 23 Jan 2021 19:59:40 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e1ae4b0be15891faf46d390e9f3dc9bd71a8cae1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
