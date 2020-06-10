Return-Path: <SRS0=TxBo=7X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B45C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jun 2020 20:30:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 037EC20760
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jun 2020 20:30:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gZLpfOnc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1aTGMGai"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 037EC20760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=drMvqMYMzYyF5uqxY3sLAbxld6wayXARCBdWYhvKII0=; b=gZLpfOncVUAd08
	4iw7jK9D/4QAh1rzjngTWwa9eD94X2WHo1ODI/nsT/3IQrL2nK25/ieYAEIxRc08+J6Mtpy+l4NoC
	Ki0bi6gjUsHpgKwOfs0s+5s9c+o9Z6SS5QfKeJ/mv2M6dzBC/slkiy6WMke9tGoACDe9fxI80yFBZ
	XXs0KmlQybFwDH8O9aA0yFDB4ixalCTaTleR0ZK0O953XGGRRoJxK3WKnd4/XbDQhBq+ZLejM9j/X
	cQPtzmtiGgDnBAHXey0Ie7GyLYXQrdpq1JI0AgPqI7It+boKiAfWJUDyQ9fCeB8TWNp063xkkMfn2
	VIJiQEPKYpxmCK70klCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jj7Mh-0007vg-Dr; Wed, 10 Jun 2020 20:30:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jj7Md-0007uo-Qt
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2020 20:30:25 +0000
Subject: Re: [GIT PULL] mtd: Changes for 5.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591821023;
 bh=zpv4C/TpH7T1zfhbSQa25RzU+28XvamfS6e8LuPaM30=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=1aTGMGaiRHeT8pi6irliYHGYlsNyU2LhhL3Yh2Vqt2Gpz+b3Be3+9HAwtwWMuRZtv
 42vx9cwsHPpnt5Ys/rQztAbpDxKC819VWvXJuS7R+c5KpXKGc1d7RqgNIKUgG5hdOy
 d59KXvvWEH6BbDXRWqVVZIRKZLpy2OnHq4Ol/6lA=
From: pr-tracker-bot@kernel.org
In-Reply-To: <996261112.163.1591735115611.JavaMail.zimbra@nod.at>
References: <996261112.163.1591735115611.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <996261112.163.1591735115611.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-5.8
X-PR-Tracked-Commit-Id: 5788ccf3c84f5587418a80128a3653aa35abf00b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6f51ab9440d131ae424cce27e3170746219f5142
Message-Id: <159182102312.16227.8292226544758577327.pr-tracker-bot@kernel.org>
Date: Wed, 10 Jun 2020 20:30:23 +0000
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200610_133023_890523_115E87CE 
X-CRM114-Status: UNSURE (   1.38  )
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
Cc: vigneshr@ti.com, Tudor.Ambarus@microchip.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, miquel.raynal@bootlin.com,
 torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Tue, 9 Jun 2020 22:38:35 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-5.8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6f51ab9440d131ae424cce27e3170746219f5142

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
