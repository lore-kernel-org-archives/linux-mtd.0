Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EE7C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jan 2022 20:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vbySaq9Nx14C4T9gkIHr+YEgNH3RdL8illMNZckmh04=; b=jh4G7Oc8XJWT6p
	iJf7LwlMr41Zy44KIGOG0zJK2l+zvk6hmXCOV9jXAT07pY3akI/J7OtRgGyy0/Svv31Xv5fg5Focb
	QOlBg5Z+ZueJzoma6FyMeaMgC4T+vQC9K3MHSyR2JmqO3XnsJMZXE7wT2M91Ss3LZy9Mm44GLx+D+
	tVV44Ahzjw5Jq+UCqAkik2+rdNkapf9UO7GvrMTapoLuLEAitugVD7q/psBlWQDRokJWeVIxIMNou
	XkBOTMC81ZAOP90JXlwsY+KOehPAJxqfxlgOFYQYa33WEJtdcezZP59MzyxOs2zpdVAxsrjAtGUY6
	2+UQc4uhx6RwSx8fb/JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7O8b-0009OQ-MF; Tue, 11 Jan 2022 20:53:01 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7O8Y-0009N8-O2
 for linux-mtd@lists.infradead.org; Tue, 11 Jan 2022 20:53:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DDC8EB81D52;
 Tue, 11 Jan 2022 20:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E4FDC36AE3;
 Tue, 11 Jan 2022 20:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641934375;
 bh=cqmzXGmY26fCpJfBCR+5KtLFaAz7mhvvVOAShvyie6k=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=pOqKeuc020waXr7mjS+l+HcyLEVMNmTFzjOktA9kEZLR+E5nD8+w6Tm8pYJ11PoMO
 6xobLCfjmScMNF62PvfhvCpaCMsQPjzCloGidID5KbDuyFQkziMEy3y6iDolAzWqsU
 Vzn/12MWevbhYYCg6SZeg8+WN+8cawrOS09k70GQaMXBzxmMdJD0XONfKDGP1IBw1n
 Zgyd70kZcgf9TuFiPcyYp++slVYgj3SKKoeoyv/sxHiI9od2XHX3ziux6Oo48wFQIv
 Mkk3rE5UbSe8csNCuDOc1fxWuxzSXhzPkJ8aaRklA4JI+Pz9AL4ceTwLFgHABpLs5J
 QjrvVuYTEQO5A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 8CC58F6078C; Tue, 11 Jan 2022 20:52:55 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for 5.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220110114003.7f297088@xps13>
References: <20220110114003.7f297088@xps13>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list
 <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <20220110114003.7f297088@xps13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-5.17
X-PR-Tracked-Commit-Id: 9ce47e43a0f088653aa25ca465836a84114e0940
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c01d85c2190bf694ccd041e7d19c36eacf005840
Message-Id: <164193437556.11435.13753019786939678299.pr-tracker-bot@kernel.org>
Date: Tue, 11 Jan 2022 20:52:55 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_125258_999380_C4D8393F 
X-CRM114-Status: UNSURE (   6.38  )
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

The pull request you sent on Mon, 10 Jan 2022 11:40:03 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-5.17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c01d85c2190bf694ccd041e7d19c36eacf005840

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
