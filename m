Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D0BC0218A
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jan 2025 02:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qknAp7oQ3TuRNOUSeDpiW34q45NxnyEvN1OZmzxxmgE=; b=mbfS3pasxCQSFO
	jl8t3OfpGHKB6amF7ta8tDNO5Te5Nge+jXZWbw2ghV5nhs/gLtJPQ+Hps44uQrD/h3rCNvk6yc45g
	pCRTqZCrHlq4StZnAcsELEvhlbaY1n/kQSTAuMiPKCtgGXDr5Gf+89DLiMk7yZIXA5IGGvt8Hnm3i
	suVghG5CgG0rIbhLEgjek2GxtOzDRPXzqJQkobbAs5vq0xhQbpjs3Kw46XMUFXuP/eZ7POTJyeBvf
	AblstF2O/Jjm/MRe4KWYuLhd8AtUupUShF0uMis2nbxDuYZBjqcXoCyEr1OCvIsSG0hRvWqwssDvW
	QAYXhxA+paYRFmENGZnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdgpf-00000009wS7-3nyt;
	Fri, 31 Jan 2025 02:32:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdgpc-00000009wRk-1fmQ
	for linux-mtd@lists.infradead.org;
	Fri, 31 Jan 2025 02:32:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1206BA4100D;
	Fri, 31 Jan 2025 02:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B4BAC4CED2;
	Fri, 31 Jan 2025 02:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738290751;
	bh=wABDeHVWymComfutt2oFV3JySJRzgDzssEeOPfSSw+Q=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ol/q+MflHGFyU0rLfjCqCneQPina4/2Zb9oyPShy2FORSqBZvEFMTDoaezGMsyTfZ
	 0p8BsIBeP74IXEBALNL3siSWvRSeB8pcpzbKC7qt/Dr1Tw/1YsZE85CFIoqej142FM
	 EIX7NXM5e92FMXayLPWmXy2+LO/yrJasY5GtKS/360g/ePjuSGr6gyEJNlEu8Bqn6t
	 lfu37I60Cj+6nTJgRASwQYdvPvlAS30S2S0gpcCEfeghq7UbufldTrBLQws+4Bxw5k
	 mu0M534b1XLazM55WxLJGqXQnNjBKVqsdoWW868tM98rcxT1uCf5n/kdD5D79j7dqS
	 kB1KlreFBtXUQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE43380AA66;
	Fri, 31 Jan 2025 02:32:58 +0000 (UTC)
Subject: Re: [GIT PULL] UBI and UBIFS changes for v6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <98948953.304331862.1738275096021.JavaMail.zimbra@nod.at>
References: <98948953.304331862.1738275096021.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <98948953.304331862.1738275096021.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.14-rc1
X-PR-Tracked-Commit-Id: 69146a8c893f734cefaac0af6f917f894f29077e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 350130afc22bd083ea18e17452dd3979c88b08ff
Message-Id: <173829077764.1153141.17167800027303105924.pr-tracker-bot@kernel.org>
Date: Fri, 31 Jan 2025 02:32:57 +0000
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_183232_499162_4A6757C4 
X-CRM114-Status: UNSURE (   3.70  )
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

The pull request you sent on Thu, 30 Jan 2025 23:11:36 +0100 (CET):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.14-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/350130afc22bd083ea18e17452dd3979c88b08ff

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
