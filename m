Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,T_DKIMWL_WL_HIGH
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03943C43219
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 16:15:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9BE22075E
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 16:15:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lIicv0QU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="RPWNbSbD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9BE22075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xRSB4blDzGxW2x5u4aIgHPcQS17pxOdCnQsMW9V8Gnk=; b=lIicv0QUThxYel
	YUvfzsxX9U+8xyONG9JA3cBhlXIt5jVNtwrfQBEQvGlr8DdPUbR4Yprmmv15qwwhSepsMNSMgUoyi
	rPE4fLW2fPEO4ADWajtEM+Lr0ewWx+0wpYiiA2Jf2uAlHH2K/5noBrhtIlhHnazfnSh/Lk2baxQ2n
	IP/Tn3OEFXyMGAhooy3jQIbyJA+F1/xlJEpdviwPTLGCqiZgNBwUwxurGuCBebHl+qgyc6JePKlfp
	YDAHE+zxl6fyIThLf2esKr+BWqDW8M8hoJSu3t44TW0IBzobjkRlXaylS9ohOwt0lOr2H+gHGZS1P
	CzntVUJE5o6Aj+CWBhGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMEMV-00065p-81; Thu, 02 May 2019 16:15:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMEMR-0005W4-T9
 for linux-mtd@lists.infradead.org; Thu, 02 May 2019 16:15:05 +0000
Subject: Re: [GIT PULL] MTD fixes for 5.1 final
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556813703;
 bh=48dOdRmMVPXBsowhpGEfeSxCWlng0Hchxv8f1hORoPI=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=RPWNbSbD56omBBiQaXhuzBNOZAriW3Ly/T7knVtPG4xedUyC88Eg2S9RQRZHCIvnI
 kOaS5uj/1RIw4CSLzyFHgXKtFuyaEpW1NqboAESo+ZG+VHdtNLG8bzKRgrgXG53rje
 Uw99MA7DDkKFzMsg1cEcv40WX3uA/ylfWAQ38qGs=
From: pr-tracker-bot@kernel.org
In-Reply-To: <1906022472.41848.1556787246765.JavaMail.zimbra@nod.at>
References: <1906022472.41848.1556787246765.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <1906022472.41848.1556787246765.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
 tags/mtd/fixes-for-5.1-rc6
X-PR-Tracked-Commit-Id: 9a8f612ca0d6a436e6471c9bed516d34a2cc626f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e2a4b102d48be7f6055e0e70696ab243ee791e51
Message-Id: <155681370345.16515.15182479020110698359.pr-tracker-bot@kernel.org>
Date: Thu, 02 May 2019 16:15:03 +0000
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190502_091503_964856_6E2F0BA3 
X-CRM114-Status: UNSURE (   1.34  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Thu, 2 May 2019 10:54:06 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-5.1-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e2a4b102d48be7f6055e0e70696ab243ee791e51

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
