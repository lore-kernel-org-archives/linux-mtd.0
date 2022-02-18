Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8A0C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Feb 2022 17:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YLoBtkPlWu5C9sGY5nJUbRF/q3xD/F22E1wRm2jqEg8=; b=H+C7m3XB+G21j3
	ZdiU6QrCb02fMvBDTTlRHWlx3o4wapdJzrxfzBxKusilLBvxpti8ywOfW4leU+pa7X13gfyBzD1vO
	VGaFosAhb8JWsKkmUknxE1Fy2LjCISMShR+yFSKTQrR7diLtjXBu4hO+o2Mktsq990mlG72g6r1Xu
	fPEEKy8Cs+GPkiE5AxwWpjcFCUkjd3fyMOA/7RlbRgHK46+a4odyW9tRvtIfUAc2+cP6yGtOF5IbV
	7HlgM9OOTuFjSrgncmNyMeSSrq4s62FBNlw7/5pm2Q6MKgEdaYbPWC06GVlod0tVO9JH9VYPjwMKH
	sKPm0ysSIM/0OjyKWh8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL7Er-00FPar-Eo; Fri, 18 Feb 2022 17:40:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL7Ef-00FPXG-Sx
 for linux-mtd@lists.infradead.org; Fri, 18 Feb 2022 17:40:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0299B61FF9;
 Fri, 18 Feb 2022 17:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C774C36AE5;
 Fri, 18 Feb 2022 17:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645206000;
 bh=vLSGghE8lyFXLQvY6tEKN0r5r0LYeDJ6Hm+MSi/+wJ8=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=T04Hn8oUC/ILR2OdWybEkv7fn5g0YuYiWSxNCw47hgNZZZpSVfVivJyp4OxNw2+9R
 CQuwIaIhS3v+8KNGQRJJL3CzhGKWJjSSTPk15Klb8UwnsqDu/aJS4XcJ3PORLlvXF6
 VKHTIc/A0AIH7gleQFnsvdChzxYPNz9Xm5bXrg9k19dgDl2LTpKkGRi1cXuypeMoYO
 sFAtzUVHXkOnCOeAOC54cgmH5z+ETgPx7Qb8qsCwr+LuhmG7fQJKQCiMOUwvWfu+tf
 XEG36VrFwhjCOSj3BFMQa+NfhWTs9JKS48/YMlQvr7xHwmwXYDB+y6NEIgwiajkfp9
 I8ciWGJ7Buqsw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1B0D2E6BBD2; Fri, 18 Feb 2022 17:40:00 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Fixes for v5.17-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220218153617.016a905a@xps13>
References: <20220218153617.016a905a@xps13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220218153617.016a905a@xps13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
 tags/mtd/fixes-for-5.17-rc5
X-PR-Tracked-Commit-Id: 36415a7964711822e63695ea67fede63979054d9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7993e65fdd0fe07beb9f36f998f9bbef2c0ee391
Message-Id: <164520600010.19024.296245073245345030.pr-tracker-bot@kernel.org>
Date: Fri, 18 Feb 2022 17:40:00 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_094002_031728_EAFFF745 
X-CRM114-Status: UNSURE (   5.00  )
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

The pull request you sent on Fri, 18 Feb 2022 15:36:17 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-5.17-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7993e65fdd0fe07beb9f36f998f9bbef2c0ee391

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
