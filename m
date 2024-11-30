Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF8FD735F2
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Nov 2024 18:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fjzdo/NehPg91sTVjbsU4OoQcznBhoBjC4gmfmcK9u8=; b=mIghmDRbbwEKUl
	rc5r6mEzuI+dQ37kRwqa2AONflylkIzHCs5i0Ys49r64LSX/Bk3XPrdsQirYmoZnseVzM/Nm/YsMF
	mP61/9hVluYV9ziqhip9RcP1U/4IahDgNU635kdv0U5DxY8RCrypE/pQJYkc2qKKUbor0s4jJ2a7V
	NhPpL+uDVyUPVwJapo/3Nrtb1UFvXpeb47T01Kn8CHnCNAiQoxIZdmg+lkI2STylnyLH45nUJne+v
	KkCJxf2K+TNCfflbAWX9dBMrU6+Dz5y8oDlDLCeOMrAdF1MZ4agYonoAgF9vC1ULEZxSn8SESDCyj
	FFqCn75i4H4LPk5gJK6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHSNY-00000002QVf-1xsw;
	Sat, 30 Nov 2024 18:39:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHSNU-00000002QVE-1Hv1
	for linux-mtd@lists.infradead.org;
	Sat, 30 Nov 2024 18:39:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AAA325C546B;
	Sat, 30 Nov 2024 18:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 814D4C4CED4;
	Sat, 30 Nov 2024 18:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732991975;
	bh=o8Pa1/XofAVAz7CWLTnk9GgmrFWNeKId2prKd793WKo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=FTNmtL87VZaxv11Fi0zCeDAzd3umfcCv3cmNX7fQHScB22ijg/q7Hldidzj+9mh7p
	 XfYPuJhPyDPYIzBWx7hyyXHVEXT8vNSRCSNtqELgnN2F4mPw0qIXI5WBIiE8qXr6uq
	 t6ADWlOeMCB2ok8VZw16hloCvTfopOJadQ2i00B4zK37B4FZi3bXn2xtYP2nFN3kjz
	 21+rrqVfctvdyl6sBstMwWur1fY+Exin/MizP3u5lGsEim26oOQKldo5vfZTit7yOG
	 Pop/LEdzz8iH/a5rcXu6b7uHxmBUDFXAixvRbw4DKb+MKkrvLNQxErAPFAtefg9HwP
	 kOuy1FKYiOf3g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D67380A944;
	Sat, 30 Nov 2024 18:39:50 +0000 (UTC)
Subject: Re: [GIT PULL] JFFS, UBI and UBIFS changes for v6.13-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <1445196426.11806664.1732921599708.JavaMail.zimbra@nod.at>
References: <1445196426.11806664.1732921599708.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <1445196426.11806664.1732921599708.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.13-rc1
X-PR-Tracked-Commit-Id: bcdcb115eaed5e988cf37cc9a1dd5f5dd200e927
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 04b43ea325d21c4c98e831383a1b7d540721898a
Message-Id: <173299198902.2451487.14358841456698433239.pr-tracker-bot@kernel.org>
Date: Sat, 30 Nov 2024 18:39:49 +0000
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_103936_394766_C9349C34 
X-CRM114-Status: UNSURE (   4.08  )
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

The pull request you sent on Sat, 30 Nov 2024 00:06:39 +0100 (CET):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.13-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/04b43ea325d21c4c98e831383a1b7d540721898a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
