Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38135C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 24 May 2022 19:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uIB2Z4n6xWDPXYdwTQOEpfoVfUXArGrjD5MRydB7T3w=; b=tbjJ8USDpzizM3
	uLwtwADuogzJKx1P6PF89itASwUPZWupEfj6AUSOCZ3rnqJbA9eD16D3suFAy5RVRt6OdlRiPz41N
	8wGK0xZqNccvu9224zAb3xiWxcIitW0lYEa/EOLgi1KeTVsFnXzdSe7RX6bLvKuk9JMr8kuihgBQv
	EU/eyiC/T8rw/c0FUUIYp6c71E3i+EisXQ5xVKUo0l6PoYDHnbdFcseA+4DbnWa1S9fI4Ownvn+ZG
	do8lJ0gvQMJBfb1ub8Fqkfb6m+VH0dPB1jAb6EG1xBk9tAqvdMowz/9xhRe/Y8JP5EOWRI8DqwbI4
	tqaN238lKhdBXWUOSJsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntaam-00944c-St; Tue, 24 May 2022 19:53:20 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntaaj-00942z-Oa
 for linux-mtd@lists.infradead.org; Tue, 24 May 2022 19:53:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8277FB81BA1;
 Tue, 24 May 2022 19:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28CFAC36AE5;
 Tue, 24 May 2022 19:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653421994;
 bh=7vCQf4vTrafHpbFlTVFe9qAPgMyoesliZ7cB5zsfznE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=l7nVX+XLhiNFzMN0IvOoXAjS2btaJ/At8c3DNT5Wwu8r/LU3IYAD4o7dGumNySCAX
 25C5LLzWDn+zC7WRnNcfg1JxD/U/kWv9gxLRNAS3Q428K/p3t0Z30qAbz6/mskVsYF
 lp1lG0lMJh0rq8q7gtbwk93/ODvOPbSduCrWisWx3+/bcoDvyKy/zrsKNZYXZMM96p
 +vigOT/A2S7qrxwYfK04YcIKzNT2wdTOiIDve+6/ZpVRoKdOSC0QuddJHnPDcGA5Sm
 0OKOU+a78vQlmQ/YIn1Ckf274wuu2y3k8XACcgCzj2cBfE9GPDy2BnKSmuHIuOaz4d
 tGu4sK+qXKW+g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0CD80F03943; Tue, 24 May 2022 19:53:14 +0000 (UTC)
Subject: Re: [GIT PULL] fscrypt updates for 5.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <Yosyx2FYZOIOWs9g@sol.localdomain>
References: <Yosyx2FYZOIOWs9g@sol.localdomain>
X-PR-Tracked-List-Id: <linux-ext4.vger.kernel.org>
X-PR-Tracked-Message-Id: <Yosyx2FYZOIOWs9g@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 tags/fscrypt-for-linus
X-PR-Tracked-Commit-Id: 218d921b581eadf312c8ef0e09113b111f104eeb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c1f4cfdbef409971fd9d6b1faae4d7cc72af3e20
Message-Id: <165342199404.18932.5994094539908457947.pr-tracker-bot@kernel.org>
Date: Tue, 24 May 2022 19:53:14 +0000
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_125317_986926_0997C43F 
X-CRM114-Status: UNSURE (   5.67  )
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

The pull request you sent on Mon, 23 May 2022 00:07:51 -0700:

> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c1f4cfdbef409971fd9d6b1faae4d7cc72af3e20

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
