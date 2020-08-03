Return-Path: <SRS0=IhQK=BN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8E5C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 20:36:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 037AB22CAD
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 20:36:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ulUl2otj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYh861z2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 037AB22CAD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ERkbE9lKV8IHVcoySyOsK/quyWjqlTlVdfJ9jy/NG0=; b=ulUl2otjSEYWARNgusRdc6QdQG
	Bb0t5/isiyufpztg23fsx4Ir9Znvi+aUtphslHWrmWt38ksKnQIm3/+yODVDGEXE/3HMQJvF6Kzff
	7AYtJdy4n8sB7alh+A7zHWvetQgwswVXsRMup6bFfprDsUgqrX14HWkEWdNZCZHX1a/qN85CmHN3F
	+B/Db5AyCpSM8pwlggCKvQcJwJFgddi5fok7jEN9mXpgvb+2LTKJtfQMR3Cv+IMHldhlvalCjOaxr
	xuwJnRCDSw0Jm8rpT1HQEZXPXnz5+GO9qdzX8z+h87VOSU4Pb1nA3qISU5PNJP2VAOU5IQ/zd9KG7
	rrVABiwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2hAp-00066I-M5; Mon, 03 Aug 2020 20:35:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2hAm-00065e-Ue
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2020 20:35:05 +0000
Subject: Re: [GIT PULL] MTD fixes for 5.8 final
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596486904;
 bh=Qfk5WnYdFPtcHhc/68zv02GhRg6dbbSq2Q8+0Xv1INo=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=cYh861z2037shc6VRzyXDYXPRhNZDMS7rb6wLisvt0pMSZxDiTjVUfzjgGUR89p4c
 IoLMjPDtb68mzyXZ1nJSXLLyDL76KBgv5dSHNB8JFLaS9eqWVcFAHeBzrqRSNRT9ir
 CX03fq0S5wMLO6O849Dh2Q+uYLyFQBk9FyGtcEa0=
From: pr-tracker-bot@kernel.org
In-Reply-To: <1401520472.201470.1596395841386.JavaMail.zimbra@nod.at>
References: <1401520472.201470.1596395841386.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <1401520472.201470.1596395841386.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes
X-PR-Tracked-Commit-Id: f7e6b19bc76471ba03725fe58e0c218a3d6266c3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 99f6cf61f175c1239ed8e86d4a1757c380da52d1
Message-Id: <159648690406.10543.6134196581055250233.pr-tracker-bot@kernel.org>
Date: Mon, 03 Aug 2020 20:35:04 +0000
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_163505_057519_7A04CD57 
X-CRM114-Status: UNSURE (   3.99  )
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
Cc: vigneshr@ti.com, linux-mtd <linux-mtd@lists.infradead.org>,
 torvalds <torvalds@linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, miquel.raynal@bootlin.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Sun, 2 Aug 2020 21:17:21 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/99f6cf61f175c1239ed8e86d4a1757c380da52d1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
