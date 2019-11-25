Return-Path: <SRS0=NFBb=ZR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F291C432C0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Nov 2019 22:46:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E1EA207FD
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Nov 2019 22:45:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pz/u3T8E";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GTZu79n0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E1EA207FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AKNpR0/A/aj9FDSkZcJ4EFFxHRVGCIfXzG2uWf9m2y8=; b=pz/u3T8EG7seDu
	DS5ld9gqWZCBkMVnU/xzI8MqkpL/Mwv3Jvwty0jSxrMuK2GOfHPqHmMY5JIl3iRVAiSxEfaReyhvR
	tqhdtP6OdjTPhX7P3Dwxwsj6QLfiKkMZnbv85X9EbIWCmzzQkhXY8m4FNzemjItvCzuw9+PTApNhS
	eq55Vr7dAODBgozIqtPgxqiXsV6OIDs8ZD+TGWP1OU27sKEddNmd3QHzIcBUdYGVN3SRoBhLWnVqy
	ZdW1myFJkD9h0RexOrS/h13vExzv/+LO0miHKqv4rAXvQQ9NwqWg03AejOc4XYeHFOL5diSAXoZ2F
	ZcOLqIjW56tMPuBwvYcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZN6z-0006d5-3R; Mon, 25 Nov 2019 22:45:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZN6R-0005Za-E1
 for linux-mtd@lists.infradead.org; Mon, 25 Nov 2019 22:45:08 +0000
Subject: Re: [GIT PULL] mtd: Changes for 5.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574721906;
 bh=5AoFm34wipj/pyRMsUWZ1JJWSjOpgukiY6w9igyapVw=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=GTZu79n0eT2Lnz91avU6nWaer8RJv4Xzojv9RKNip6uT2ipu6YB4wASK8N0l53Jwc
 40pvepUhVAEBa50wnPcpiyb0tOTmCeo7x3tOexHQgrAL7I8gmXlrN6ppUlnfrw2pdD
 g2+/qlCJt/vkN2OY2INi+8xHTZuhaBK2X8Jf8iKc=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20191122210520.3f714435@xps13>
References: <20191122210520.3f714435@xps13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191122210520.3f714435@xps13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-5.5
X-PR-Tracked-Commit-Id: 589e1b6c47ce72fcae103c2e45d899610c92c11e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1b88176b9c72fb4edd5920969aef94c5cd358337
Message-Id: <157472190634.22729.5736916559423617241.pr-tracker-bot@kernel.org>
Date: Mon, 25 Nov 2019 22:45:06 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_144507_538085_2E1E72B0 
X-CRM114-Status: UNSURE (   2.16  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-mtd@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Fri, 22 Nov 2019 21:05:20 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-5.5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1b88176b9c72fb4edd5920969aef94c5cd358337

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
