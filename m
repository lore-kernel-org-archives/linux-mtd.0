Return-Path: <SRS0=rTSM=7C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C429C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 20:30:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23E71207E8
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 20:30:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nOc8ubi2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="D7zjVYxx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23E71207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jfi73SQIwGUvF7Zzo09Xetjd1JtwzKgn1172oUipQ/s=; b=nOc8ubi20C/VzJ
	gGzi0F5pZYIJnJjamvVLORNcD/0lhMkVNJB9Ef8VOT+DnstGUWaX/B4VdwKLI3RX1KSxnatTjxWtR
	G8H2APKEJL648znVwzac/aFQgrNwXQ2afeHSV1lQqT+PadeC7dgT6/cKd5WXGtnuvWoFKEHpJZ+Og
	fN3CatZuNhQbXwTYa8dvph7fPiIp2LA/yTnvUNuVEtq0WGElGno9gqrT48sLbdPDzvrYQcO5m/RDd
	vkEXG3kwK2tra48avVl98UqVXH83yMasf0R3UoxUovFDh+ge58we/27QQ4ZDyxPTc1BNa4z04Whs1
	0xbkOt9h06csnc8AJUFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbVM4-0005A5-Vv; Wed, 20 May 2020 20:30:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbVLo-0003Pm-6R
 for linux-mtd@lists.infradead.org; Wed, 20 May 2020 20:30:06 +0000
Subject: Re: [GIT PULL] UBI/UBIFS fixes for 5.7 final
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590006603;
 bh=WDeYoHot53ESIixuTZ65c/GG9a6J/45XWKc8BZEBD1Q=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=D7zjVYxx7gu1Tg20tNJ4G2Tqx3tHKcaevDFh0D/ZXSXW1mKvZrfhILlJ/99TzfJ4c
 Nq4em4EstKjKGmhftyPT2tuQa4paBJx9espfeSO2Gamxy4SUy8JE1ATDTLEyf3Rl2L
 8Za6OuKL89RpAQR9APlNIQVX0GyggDXayn8SqMjc=
From: pr-tracker-bot@kernel.org
In-Reply-To: <294087931.249343.1590004178869.JavaMail.zimbra@nod.at>
References: <294087931.249343.1590004178869.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <294087931.249343.1590004178869.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git
 tags/for-linus-5.7-rc6
X-PR-Tracked-Commit-Id: 0e7572cffe442290c347e779bf8bd4306bb0aa7c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fea371e259ebcc85d2d51a036743189bee487289
Message-Id: <159000660389.10849.13761453252049235258.pr-tracker-bot@kernel.org>
Date: Wed, 20 May 2020 20:30:03 +0000
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_133004_257785_69EC578A 
X-CRM114-Status: UNSURE (   1.88  )
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

The pull request you sent on Wed, 20 May 2020 21:49:38 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-5.7-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fea371e259ebcc85d2d51a036743189bee487289

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
