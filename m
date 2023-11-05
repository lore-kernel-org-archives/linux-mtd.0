Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC729C4167D
	for <linux-mtd@archiver.kernel.org>; Sun,  5 Nov 2023 03:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ZbhFGbmk2qW25HQ1ae9O93x4vb9KQY/AbcjRFni2rA=; b=vUZGwY1smtN6bq
	wq7Y5N6TBu8+VPfhEuiLtDm/qgIroKMnVElmmYqtG4ZzgJ0eQFLguH0H6420WxMOH2j0SIvI15pFD
	+L5fVkhCXAHZfp9BJJAgBAOWaK4gX4tP8ODosAYBD+lNLUNOay0uiFclNhUkRYp9UwCiNkWykRxC1
	0viqKaR4BCM8an8Dqh5cokiDoCQ7YNgH1/8sEHMm8S3Ru3bcTwkgIh6wiJGJJVW4ZIoLQCtTNv225
	53h3fP46f4toqXfBqrDA5RDM4oJad8UG9G8rE8JB+pElgk+atwV9PyPHGc0vfeV4Mk9gfCTPzTwuK
	sEUG8oxqxguMkHaObO7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzTOp-00EIsL-0Z;
	Sun, 05 Nov 2023 03:02:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzTOm-00EIrW-0K
	for linux-mtd@lists.infradead.org;
	Sun, 05 Nov 2023 03:02:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C835760BEB;
	Sun,  5 Nov 2023 03:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 336FDC433C7;
	Sun,  5 Nov 2023 03:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699153322;
	bh=R0ufgtveFKAiLDHjsManiSwk89jg61U2l+W1ZS5uOME=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Sm62zHKz6v4V4VsngVRbufGdFyC3/BjnyFj7Ic8nk4oHxq0E9my2HNDBV8cp+Fcgj
	 C0tMpMkG3f6fuBJ/VXdwLbanGrmRUEdfabSJHHCqy6HeF2qinQ12qscn+NEuenpt8K
	 IKYG97it73KbR3XXAoP7ZM7OotIzgmiso0dkygq/VuZwcSteiffI6v/etxetIxfiv2
	 KpaHPqZaWWadb0rdvtBGQ5kcUaUzhxDjas1YxqYh6RUFhR0iv43XJA6+Z0As6MtxOt
	 cqqZbPKez6R9+Lx/Lj7oO0hiEdnaAutQGEGrATZ2RRqcq9LrbKvunNtJ7cO04sIjCy
	 aofNcO3JQGOSQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 23433EAB08A;
	Sun,  5 Nov 2023 03:02:02 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for v6.7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20231104120719.185834dc@xps-13>
References: <20231104120719.185834dc@xps-13>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <20231104120719.185834dc@xps-13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.7
X-PR-Tracked-Commit-Id: 6d55d31e927eec68ba6db344688044ed253223e9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b1dfbda8636b54cde21f9f5d352fd25c4deff584
Message-Id: <169915332213.2133.4033974515584445366.pr-tracker-bot@kernel.org>
Date: Sun, 05 Nov 2023 03:02:02 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231104_200204_208563_DD42B71A 
X-CRM114-Status: UNSURE (   4.85  )
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

The pull request you sent on Sat, 4 Nov 2023 12:07:18 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b1dfbda8636b54cde21f9f5d352fd25c4deff584

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
