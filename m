Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69C0C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 24 May 2022 22:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4GACxGHUQQI9Csz5umq0RSDl1IVlSjUcce9oPas2bE=; b=JL6seqbHrWqTzk
	eieMJ/QtfCXtSWDA/QjTw3OqlfkLkqliFIcAkODNw6NAYyN63yeeMj5pmZwr5t9fCbgvSuabRT7O7
	osHBfyC7Wlr+EgUAIzqKrX7W7x20J2ub5NHIrrnudCG2ZKfOOerkpQiOFAIDHmCDBHtU/4dy0Uw6W
	vNKlx70hzhJjeHGJZACMYqU6MffyztCgUvNnp30gFe2CNBiHaOZV0M2kNRzscUtfNRSlHowh6SDW2
	VgCQpb5aTqsiXYfvoDQfWCMmkIaO+RwHZIbm/gi71U+Lj7aCIOvmEdA3dRBU4OSQ+btEWyCM7uW3b
	hst7lCZRJTDzvyjdgaaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntd0C-009KC4-98; Tue, 24 May 2022 22:27:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntd08-009KB8-Fc
 for linux-mtd@lists.infradead.org; Tue, 24 May 2022 22:27:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D87E761796;
 Tue, 24 May 2022 22:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C610C36AE3;
 Tue, 24 May 2022 22:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653431257;
 bh=0/gdY3/qf3nt8CaGhYiLvknHYmLj9oilZf94ifwRrcw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=npxK6HKQH3T7GmYI1wyOHNYj01zx3NQ5oB4vUe9gJXqxq3ga/CKlsjJ90cgJkFDaq
 dXoH+Ew3pi3drWepkvXs+2MU4tqGe5V9wOd3yCvhMg48iQXerKt8ejzIhBAWefsczI
 yX6ae5R/j0Zs/FFEIeOWXOkwkiWstz8xw2td4hgdskEVZx1EmvS4AV8EZ64wmMM9JD
 +wFBLDsWO6NTjkloEnW31nidQNJOOb3rniiznI8aoNqb3XQ4QaW/czN2RQpY6i9JPW
 GyVwfh3EcNRK5zo0sBDqXYiWYIgiupn8GVdQGbO0obYU7XBYfrpzXg34F4gMD5i5e9
 58mfcW06hpj4A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 3B19CE8DD61; Tue, 24 May 2022 22:27:37 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Changes for 5.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220523112459.29000c2d@xps-13>
References: <20220523112459.29000c2d@xps-13>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list
 <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <20220523112459.29000c2d@xps-13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-5.19
X-PR-Tracked-Commit-Id: 2c51d0d88020b4d3c9bbe7d9df2796b2c2ce05b8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d335371940179318df97d66baef13987ee6e796b
Message-Id: <165343125723.3997.9953251172151290451.pr-tracker-bot@kernel.org>
Date: Tue, 24 May 2022 22:27:37 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_152740_594143_BC6C550E 
X-CRM114-Status: UNSURE (   6.41  )
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

The pull request you sent on Mon, 23 May 2022 11:24:59 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-5.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d335371940179318df97d66baef13987ee6e796b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
