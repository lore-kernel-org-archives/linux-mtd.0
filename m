Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C44C54E67
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2024 20:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ga+fmyCq7HuivyO8e4cZ7uKqb0LKkiG44sNewVp3QEk=; b=PD+2xAf6nub0kq
	4A/U8fsc531XhHk4yzsuw4gsVHk/0prCKcuZc0H6Wa2gSGUBKV+5cPMj+T+j/KwAaTNmylGN5ctFY
	XNw7lohuEvGXxGRkqXHvKu5LVvDUwlE/OmDFKimurw7TbHYxxzlqzBaFLmTmxgQN2Y4s94Se/zUDf
	cXjpqbT6H76uqvtKWzZb3nstxWalsBUTwGmB/Kl03eI3u082bc8mLSqHDMWfJUBHpYAEpO/uurkl4
	IzEHHUF+5+nmzYld5iY4NF7LmczKBQYHcV1lDVqQ3E00Lz9qDjsdpt4EeaanT3Cf4a0O8UDQSh2qv
	956/+ckiX4/GgbEHh1mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlEJC-00000001VDd-12Zr;
	Fri, 15 Mar 2024 20:37:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlEJ9-00000001VB8-2Pbx
	for linux-mtd@lists.infradead.org;
	Fri, 15 Mar 2024 20:37:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E1C4E617E6;
	Fri, 15 Mar 2024 20:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5A92C43399;
	Fri, 15 Mar 2024 20:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710535056;
	bh=9oYJh8a/kmvmImXjX9c3NKiWZzK9nX2jU763jQM5mkA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ikjBjLa5LPJ+yZ5vH2bAFMBu1xE76K6bjX6CdhNnW+2zqd/b9AygyGy43NLR+B/vM
	 CJ0/GsEjl0QpnKjDQzbCYSnU3bLAHtKaWdgnNq6fZCK0cyJ2Cf5l+DlL/idLlnCwn7
	 rkIMqmsDrwWtms/4TNKROAQb/prPW4q7vE5IaXmer+1Eq1zxvwsset4dw1G+jtX/h9
	 sVaIZdgyz+BLmaD2NJYoRQRIJbXo+r5aHACw1nZkCnfWHHazcqLOebhoifONHBdqa7
	 iN5ytBiPJEWbWakmTu6gxhA+ncfDCwRW0iwGRabtS7eqopfdsKkCfB5fKuKvlpm2UE
	 9xp9w2RCp68JA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9D93CD95060;
	Fri, 15 Mar 2024 20:37:36 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for 6.9-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240315122128.42375f32@xps-13>
References: <20240315122128.42375f32@xps-13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240315122128.42375f32@xps-13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.9
X-PR-Tracked-Commit-Id: 09888e973cc9d3615dbab5d178eecb58d8a0b7ab
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3c5d127fb5aa96e89875fcc92182bc1eacfef3af
Message-Id: <171053505664.29375.10501046435385123737.pr-tracker-bot@kernel.org>
Date: Fri, 15 Mar 2024 20:37:36 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_133739_717997_78731634 
X-CRM114-Status: UNSURE (   3.49  )
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

The pull request you sent on Fri, 15 Mar 2024 12:21:28 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-6.9

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3c5d127fb5aa96e89875fcc92182bc1eacfef3af

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
