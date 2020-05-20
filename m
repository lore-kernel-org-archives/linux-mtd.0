Return-Path: <SRS0=rTSM=7C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E4AC433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 20:30:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB740207E8
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 20:30:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H8YcYRwo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FPnQN4xn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB740207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=udh9fKkgmaoNf4g8a82jHoKSc3CKQ+Q5DiO4DZCDHvY=; b=H8YcYRwoPciQVC
	GDSneUEN/VWoPvhL26HPzbUfiQ5vChZSXGw8YS+pK4sDJDCIkaBtCPhOnFjzz4AirteX6FxxtN9VV
	3Y5LFg/FbZ/pFSnQ5oYXVgMBWSpjXE5Wuewdr4HowxPc6xQIW3wSDmN+CjjdQ0vmvanfp+tIRRhIY
	36OISN8GX9Y4CWct4Qh95FAbmv5rtorthHberfuQs7p2u13MeHxo+t/67jHZ/K8LEM0rlt6YqWCNc
	61edBEDZbqrBKFe6nTTbWmMcrTfvCPVA6rjnhQJCD+byu51TSPeE+eX377MKpMfdxWhrSIm9fLe4n
	s6Jh8dpdcaGGr0d/Uv9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbVLq-00044h-MD; Wed, 20 May 2020 20:30:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbVLn-0003FI-Tb
 for linux-mtd@lists.infradead.org; Wed, 20 May 2020 20:30:05 +0000
Subject: Re: [GIT PULL] MTD fixes for 5.7 final
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590006603;
 bh=7dgSowVWKb+a5DwviAHKDWmLUjcttsA4HWVfUlSUFIQ=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=FPnQN4xn6UxZuLpjcB64H2HDXYLcJQevTS0MSy5NRNgagDoNC7sYEEsluYpeJTf6n
 w0GboC1Zclijk+h/r66FgwZ0A24LNCdATpzB0yY+hyQrAHTAnQxvZXfOn8Uj2Nin8a
 9/zmgvaheUt8exyfEUEYTPiVG+WXO7lQyidKXGio=
From: pr-tracker-bot@kernel.org
In-Reply-To: <1270319593.249344.1590004179760.JavaMail.zimbra@nod.at>
References: <1270319593.249344.1590004179760.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <1270319593.249344.1590004179760.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
 tags/fixes-for-5.7-rc6
X-PR-Tracked-Commit-Id: f3a6a6c5e0f5a303fd8ec84ea33c0da5869d715f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b85051e755b0e9d6dd8f17ef1da083851b83287d
Message-Id: <159000660335.10849.12687061016548851219.pr-tracker-bot@kernel.org>
Date: Wed, 20 May 2020 20:30:03 +0000
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_133003_992211_4E5CEDC0 
X-CRM114-Status: UNSURE (   1.70  )
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 torvalds <torvalds@linux-foundation.org>, vigneshr@ti.com,
 linux-mtd <linux-mtd@lists.infradead.org>, miquel.raynal@bootlin.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Wed, 20 May 2020 21:49:39 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/fixes-for-5.7-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b85051e755b0e9d6dd8f17ef1da083851b83287d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
