Return-Path: <SRS0=3VFJ=LW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F083C11F64
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jun 2021 23:37:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC96661D2C
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jun 2021 23:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC96661D2C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4MDRMDLaShcNjIL66VBU99qjMKtvn5A1TFmdzfZ5JdI=; b=2EwldIeGbDGp+3
	9OFUCYduoqe5TSD+pInU4ksY3DWp8NKMziNDwwLseYoliLgTvy9tuE0PZy0Q9kyhGFZVGgRn90apy
	9ZvX4FckcTw9wQytaZ91SXoF+gtFvklgSqb81viNtWdL2ZrkmZOgUGrVKo2yMo6EBx/OkswJ8FfJh
	b0LdyjdBMsBuiumLCfXJZpDAF35cdr2v2BSA2lQVlAHNw3M8w9RRJCpIktfOWWUQKTzg0Uo/NT+hI
	UlMHjA3iRy9H/SrW7ShASEXsnr27W4pF8VhRJrPfNJnlicz4g/FKWKhUdIucmVKYtlEeSm34oGUn2
	bxJFEpAB6afT3NrQMi8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ly0nr-009NBl-Om; Mon, 28 Jun 2021 23:36:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ly0no-009NAV-LB
 for linux-mtd@lists.infradead.org; Mon, 28 Jun 2021 23:36:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id F262861CF4;
 Mon, 28 Jun 2021 23:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624923392;
 bh=olgmlCCEXgbIRO4D3Jq6NI3qVCMsbVCY+zrABexZDW0=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=DSx6uHbVVu0v8Mm36qD/eblip+oQCi5TStiOlwzscjITCTLxQBsXvqFaDHoc7xp63
 gdoD2ZTxjZ+Tp1M0Qe9PV54QiG5RwI06q+Ss2lbTbqml3G3nsiz4eLGsZsr/YTiZ6+
 /b3ktFaVxv3z8FB47+4lG628xYjyO8KRNUWPvg+5OkEDopeDpQ7OZSIRQnB80mwePh
 wTsOa97jcrAN9CoJFOk0YymeAmqUv2ehZa0Z/ReFK2Di8F8hU5/ew5HZerRkBnJc/D
 vlcDIBXjmOzv7NfBBYldnBf6fofDIgPNSSla/+TUnFGvp/MS+QQFNpUX0KwZwCk5Fb
 2FZss+xtrJTjg==
Subject: Re: [GIT PULL] fscrypt updates for 5.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <YNn/TL5lW44yAx3o@sol.localdomain>
References: <YNn/TL5lW44yAx3o@sol.localdomain>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YNn/TL5lW44yAx3o@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 tags/fscrypt-for-linus
X-PR-Tracked-Commit-Id: 2fc2b430f559fdf32d5d1dd5ceaa40e12fb77bdf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a58e203530ebdf6e5413bebc7f976d756188a4b5
Message-Id: <162492339195.13806.1637347361707615822.pr-tracker-bot@kernel.org>
Date: Mon, 28 Jun 2021 23:36:31 +0000
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_163632_752581_B31F5781 
X-CRM114-Status: UNSURE (   3.36  )
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

The pull request you sent on Mon, 28 Jun 2021 09:56:44 -0700:

> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a58e203530ebdf6e5413bebc7f976d756188a4b5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
