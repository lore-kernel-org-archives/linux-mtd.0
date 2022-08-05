Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3E7C19F2D
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Aug 2022 21:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lsGUf1i+UjsCtStEjUEbGfYNOhx4oY96BnDmkJZUXl4=; b=kv+dH1O0Ngr/Li
	qPwEqvvIageW8TkkmjiHYpciQzRRonDtDCJX5HlOyqZDW7mFSLG+agFqosSfyhx8B8d/+f/I1ewg/
	BC1TN7n6wia0ukpvHyJSsiHLm0V6//nmRurNjxhvEL/V3wiXMDGltFXYGRJtbYMAMmlqSg3xx5Xtq
	MQXPECR0I7/URL2aOd2+umgGJP0p9OjU9maZc8k5KkibuqMOqLWAheONlJ9yOm3YRqSPOY+uc7pgt
	zzIK2P2wBFn1G/W5rjcjovbhNhsrrnbMb5+X3YwBlTCczB1yVZgAocn60GRJQG1dIlX9uypWzTCXe
	V1bR+pt4JV7JDNIOQ+iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK4p6-000oBX-Gc; Fri, 05 Aug 2022 21:25:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK4p2-000o9H-Rw
	for linux-mtd@lists.infradead.org; Fri, 05 Aug 2022 21:25:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3ADE96177B;
	Fri,  5 Aug 2022 21:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B254C43141;
	Fri,  5 Aug 2022 21:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659734731;
	bh=8daNeUFJUbtUNVfJoQFeGANuiGWkDw9DmZzEoODYOoo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=fJn+idQ1wSbM9AKQVY44vRWmePauqou/AmkONBWDnF1XRpr/uW8Toi+0U3S+b0AB7
	 yHa+kmK4Mo4e/oIUzoHObiIJUKvwkdCznkfj1MJHY4W7+q+FjLKVIF/OlZ3BvImM7C
	 xYy/QB5xwn/1ZXXAHXi1TitNv41e2y/nc6c3ddJ+by28K3LCkIFdj6e0MEmlqEOeMK
	 AH71aoL0f0SQqaTpJlWH5f6pFpyzd/N0wulN4GfJ6IbzRt+ONeg1inwf5aGZuxPAAO
	 8tIJVQtod4iv8obrSfUgKZL0DEPotqZhFNeDipV8VCTsygZGdiZW1i19Qc/Z90LyKa
	 JOgyxbMW0klRA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 89D1EC43140;
	Fri,  5 Aug 2022 21:25:31 +0000 (UTC)
Subject: Re: [GIT PULL] MTD changes for v5.20-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <1047109049.69854.1659733300067.JavaMail.zimbra@nod.at>
References: <1047109049.69854.1659733300067.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <1047109049.69854.1659733300067.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-5.20
X-PR-Tracked-Commit-Id: 7ec4cdb321738d44ae5d405e7b6ac73dfbf99caa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 74cae210a335d159f2eb822e261adee905b6951a
Message-Id: <165973473156.8747.6504412873304188452.pr-tracker-bot@kernel.org>
Date: Fri, 05 Aug 2022 21:25:31 +0000
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, miquel.raynal@bootlin.com, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_142532_990401_47C2E662 
X-CRM114-Status: UNSURE (   5.35  )
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

The pull request you sent on Fri, 5 Aug 2022 23:01:40 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-5.20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/74cae210a335d159f2eb822e261adee905b6951a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
