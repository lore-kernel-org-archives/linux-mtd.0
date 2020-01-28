Return-Path: <SRS0=h4jW=3R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 156E8C2D0DB
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 23:40:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBE8A2173E
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 23:40:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j9/Wj+Wq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRScizGt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBE8A2173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MZ3PVV7e3L6RRHkP09rLWIwELKalCoVX07moyIDTqvo=; b=j9/Wj+Wqq38wv6
	4KH8BxVBWaomZVY7hVHMrW0Ej3iMv7ry8s6k/l/Y8b5YAA9OmWl0E3hYVma4PS9C117PCBCjLu7s2
	9G2AgArFaKlDugRHZeUcQy4RXIMBY8lh9qcznzwUe1ENOwpu3vAB1spbNP6txrMHK9eYBielVB3On
	q8kMgy1L0+X1Qjd30EA+YfcpRYsS5H7FZJjBBLYpuM/4ZDuwMTYfGhhkyD44z8qgOAikSsYrcl31N
	xV8Xo0rLmYqnnczOLSPWvBWxpBj2cApNNSS7/VbQgegcH0ugTHGduMgR5hB4YbUtlytW0VnT6HSCV
	4KiQlZ7/75iFmR4P0JOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwaSn-0001VM-AF; Tue, 28 Jan 2020 23:40:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwaSk-0000Pg-BM
 for linux-mtd@lists.infradead.org; Tue, 28 Jan 2020 23:40:07 +0000
Subject: Re: [GIT PULL] fscrypt updates for 5.6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580254801;
 bh=FTTLR9MIHR1/Gdr9WwAJ4oAT91xeiib4YGas1QXvfTI=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=nRScizGtR1OS6FiMFccAEgDKKl9hkf3hBIEfV5G3fVot+rYpGszsKD39er9Ei1F62
 oCnFjli/S49RKmryJe8Po/gzCi0RPkU/zl92yUelxjPpUZozEOJIvEBTRHVkcJy5rM
 d8BaZB0Ctx8uvnhBQO9PQTt/htJzAOtc01y6gj6s=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200128014653.GA960@sol.localdomain>
References: <20200128014653.GA960@sol.localdomain>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200128014653.GA960@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 tags/fscrypt-for-linus
X-PR-Tracked-Commit-Id: edc440e3d27fb31e6f9663cf413fad97d714c060
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f0d874414329a86b67198cb0299d0dc9310592f1
Message-Id: <158025480189.16364.5716437858039757596.pr-tracker-bot@kernel.org>
Date: Tue, 28 Jan 2020 23:40:01 +0000
To: Eric Biggers <ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200128_154006_427889_D4E187E0 
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
Cc: Theodore Ts'o <tytso@mit.edu>, Daniel Rosenberg <drosen@google.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Mon, 27 Jan 2020 17:46:53 -0800:

> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f0d874414329a86b67198cb0299d0dc9310592f1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
