Return-Path: <SRS0=PqFb=NH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A68DC4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 16:41:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E302660EFE
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 16:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E302660EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e90LTc3/9EbG2XcBdKWDkk2QR5xvcj6KBFFdWRmTWXg=; b=rZYDWAbxVWkWUR
	wdao9SFOAOz9Ti10FGhf2077AbD8GRgQfeGLvGUEuc5Qc6qbmUEowW8MQ5AQztHTykzmwA1iYYiRJ
	+cAHZnrYUajjQnsvTEVUlx1dimsNv6n0vHXngxAH2I6pITAdNgQjxXMYIi1QGZHxmhCaut2zl3ako
	yXCtC8b6CI1FUidcLzAQvDEvn81zEzoC+Kz+b9EEZKYs01Lj1Vfgn0DRX7OHIEw/kuKGAiJK+A7Ov
	lzCMVH47Gozw1uuEzYAWMV1pZNbF1Dh0APvor9HLSanAmrs0MWTqxb3eG62cYB995Y4pJolV9pUSR
	CDoyDkcPnfNboqImwauQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFffC-00HRG8-Ho; Mon, 16 Aug 2021 16:40:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFff9-00HRFX-Ou
 for linux-mtd@lists.infradead.org; Mon, 16 Aug 2021 16:40:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id EA31261029;
 Mon, 16 Aug 2021 16:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629132035;
 bh=WEyHCN3pbkK3mpnpo//myd2NHCLXBBQX2jeA9+kHG98=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=sH308Vnc4J/j+2qXjabnSzX/y11s8MwwPUp9/INyN7SvYB5uHv9/SaYy5ei1KPB+a
 YWhJY2M8lYscYeTLDWiCvcLxHDdjvsyRgqEx39GiiO+33PzE7UWABWjFD/+pY+j6c0
 uCnGdma4EMxwnN+fxkGC/lpgByK5sbWYBKM/6Fl0FDg6MNbzJA/8ytscBLK0+hbOeu
 KH8YUh6K3VBarWoK/H3MfPSMV9eiwuGM9s6HdvRh5WAteF2e6bl3zbyXO9oqGLbK1W
 pFrRlaAmoyzSh2CXhxphFK/MbIMjMkKQdHqdv7flpAhIsESd2AI6S9s2EvviBQtXGd
 WllhiSl+s/GPQ==
Subject: Re: [GIT PULL] mtd: Changes for 5.14-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210816172040.7a67f8da@xps13>
References: <20210816172040.7a67f8da@xps13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210816172040.7a67f8da@xps13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
 tags/mtd/fixes-for-5.14-rc7
X-PR-Tracked-Commit-Id: b48027083a78b13356695555a05b0e085e378687
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a2824f19e6065a0d3735acd9fe7155b104e7edf5
Message-Id: <162913203492.19716.4161960278018208717.pr-tracker-bot@kernel.org>
Date: Mon, 16 Aug 2021 16:40:34 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_094036_252551_5DD7DBFA 
X-CRM114-Status: UNSURE (   3.15  )
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

The pull request you sent on Mon, 16 Aug 2021 17:20:40 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-5.14-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a2824f19e6065a0d3735acd9fe7155b104e7edf5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
