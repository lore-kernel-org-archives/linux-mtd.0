Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D0BEB64D7
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Jun 2023 21:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S2dc8Uor9ONlKvA0rEzB+frgOPqLXEedCs9+SZmYG6s=; b=gDTU8QKi0EnWr9
	6ISw6Khz980O5NEYfo5LVHP6H4zOUdeusc+T6/BgkK1fvIJqmYGqUPf9tabxc6fv38TAOMCKx7aEB
	wQyD+R2nOxDrxJVopPXGQNJb90yC183HR8au0QK3RrBepVTw0CnCeEYEEbVtKHU5Ap6RcLN2oS/d1
	DDewKGhutpvG0M0VrMUZ7fEFwjlJlxWyemqVDJldf2OeLeIjdruBns0fihafuBI+gIeYY0kVZj3Ls
	wjkVQptaQtEwZPbsmFtOG+J8IyUylM/mM1cIR5FSHE89aSgpsMK4YGxpmGTT2FzoQDR87egvnWbiO
	ISPlpBmgt+d8bzZ+D2sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEcPq-00GjY4-30;
	Wed, 28 Jun 2023 21:09:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEcPn-00GjXW-07
	for linux-mtd@lists.infradead.org;
	Wed, 28 Jun 2023 21:09:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8F7F561472;
	Wed, 28 Jun 2023 21:09:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3DC8C433C8;
	Wed, 28 Jun 2023 21:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687986566;
	bh=iklCgUzKFKvnAQb/SJu90FChLiPIXnlwTqKHNSVyY5A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=FfRbKI9EFigVyi9JGtNWIc9NHObCpzD/nxGe1hTFDl0/Cn+yNeulWENncitoGtrcy
	 gKj6ZbCWtFFW4uLHy76Mxzn1tqBw/U4UIACCL4ePJSHq8dM6W0GAdFgubaaCUBybAO
	 Zl2xypfbKPML7qn1nMNbgHgz9siGPfvuZ86VeLbzzK07XPZ6CQ4XseRc2CTs+hBohm
	 QWiDXsoCKLVfNAeCzSysefTzPw9PbwdBYE9Ts3Sisq9XuzPGfh2qsfVplVxtPgSqvB
	 Kfhw00HNq5DtpKJhExhkRUukBJIWamo36zKZUY4nx4d1A0zFA6C/sitZcRFzi6n6EU
	 NSIkKVb0GbiEA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D0710E5380A;
	Wed, 28 Jun 2023 21:09:25 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for 6.5-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230626130252.7bc89a45@xps-13>
References: <20230626130252.7bc89a45@xps-13>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <20230626130252.7bc89a45@xps-13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.5
X-PR-Tracked-Commit-Id: cf431a5998326a0468532a188a188ac2c8e9c55d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1364b4068a421d99fb4da8b570e54525096b1cef
Message-Id: <168798656583.29247.7718407316804429405.pr-tracker-bot@kernel.org>
Date: Wed, 28 Jun 2023 21:09:25 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_140927_116124_E798D4DE 
X-CRM114-Status: UNSURE (   5.37  )
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

The pull request you sent on Mon, 26 Jun 2023 13:02:52 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1364b4068a421d99fb4da8b570e54525096b1cef

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
