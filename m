Return-Path: <SRS0=nWl7=5Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF7AC2D0EE
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Mar 2020 21:50:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DD2220842
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Mar 2020 21:50:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fJRobhp8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBosVPQu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DD2220842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2h7Z4ESru+btnjh3+MdkTyMxr2JAfEaDhf3VKYzpwPA=; b=fJRobhp80k1yRU
	hKae7C/Zj/xLB6wy3Xl2tAoN1i0ZRpMcwKWrULgLPWZLdWK25DO5PmwPNauMai6HlJgP5ZcA/RO8z
	+rQ9mk0pFiDxyiP4p2j6yrWIRGNss3qaIRm8cNRchcX9+IQwTLOYQPtlLMnBPKpdz/VUJ8fYvq+t5
	3VJ+cz9AaNhf91EKokFHmKR8J3P0u3D+mVp/7haG9fZ9HzxIpa2DtzXkxwQEjc7clNE9g7AtMo9tX
	pH3lzp/Vqk/W3noW/g02/Khzn2fEzcKlbt42/AsFnC45moo88T5nyoukXOlZwLvxLgTCXUkULvA3g
	p5uvNSaKjfG56PPaXARA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJOlq-000407-PG; Tue, 31 Mar 2020 21:50:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJOlm-00033X-Kf
 for linux-mtd@lists.infradead.org; Tue, 31 Mar 2020 21:50:04 +0000
Subject: Re: [GIT PULL] fscrypt updates for 5.7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585691402;
 bh=LcVm+V24+2+NTOJ9JrmVVXkl728hyFi9uw2iR9GZGHU=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=QBosVPQuppbe6iZRabDz1qeEjuf4lM4SbPhgQX19V+1KKwMbxjrmHXREfGjQgEAUF
 1k3zIgblJ+TDv4YnoOKB9A98doinoZvVZuc8iMFiMPG+UFI7hDw4U4aD3I5STWWgcy
 isOSyBj3OEr06AjfDkcZv2vMHRFMaEr6lNNQwIms=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200330165359.GA1895@sol.localdomain>
References: <20200330165359.GA1895@sol.localdomain>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200330165359.GA1895@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 tags/fscrypt-for-linus
X-PR-Tracked-Commit-Id: 861261f2a9cc488c845fc214d9035f7a11094591
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1455c69900c8c6442b182a74087931f4ffb1cac4
Message-Id: <158569140192.7220.17954616110607840136.pr-tracker-bot@kernel.org>
Date: Tue, 31 Mar 2020 21:50:01 +0000
To: Eric Biggers <ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_145002_744458_28FB26B3 
X-CRM114-Status: UNSURE (   1.20  )
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Mon, 30 Mar 2020 09:53:59 -0700:

> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1455c69900c8c6442b182a74087931f4ffb1cac4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
