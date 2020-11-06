Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1251CC2D0A3
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:14:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D7D5208C7
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:14:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="imzftO0k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aNOQok4y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D7D5208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E4R7psMbHkMHiPI5a0RA3fgb9njRcgkUUDJtkuuJCi4=; b=imzftO0kA7i1uy7nlYvGsuoI97
	fI7sercH8ny1g7rH97BvUIYlhMqwAnwGE+v0EGLaNeZjx+KclVY8ec5qfCm1x64z4ZOaFsLySfym0
	mhZ1QJWc3hfBN9CLPgWnJsNmEZsmF8P+G9Xnb/QXZAmCkNm01jJm5DOwSkFky7xx8HaRCBjK3+7r7
	msnYqOY7GHiCma2H3EwYYOkKcigJ21Hvvh/4Qd6BIU2pi7Qs+FF6rmqbvDfC0wvnJGHxxipXJwRhO
	lAqKZrN2/IU4ArVm8hmh91zAz8Sns4vdZg0dlOmGkriVxTapeGOnPjxRNNJxNAG1MQi7Tr8IM6mY3
	rjcnqi+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb934-0001Bm-Lu; Fri, 06 Nov 2020 21:13:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb930-0001A3-CH
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 21:13:27 +0000
Subject: Re: [GIT PULL] mtd: Fixes for v5.10-rc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604697205;
 bh=6rTfXAWYJ/Hs2fMZx90YmU6JMdq+gtUrfFaoXv5b3t0=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=aNOQok4y+MCTcnAVGkaRYaOPWo2V0qispJoiG7bLIH8HPLdrU72bHvnPeIVIsnlT2
 cndmmY5yiIyfA8xbR5bhIX7uffj3RaZ0rdJpt/J5/v/VSF0u06xRobXBnQDsPEgQ2F
 p84c3G2tsj5fNz6pLTC2WnJWWZk83EIQx0Ja3Qfw=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201106204311.795d6016@xps13>
References: <20201106204311.795d6016@xps13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201106204311.795d6016@xps13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes
X-PR-Tracked-Commit-Id: 9efac6ce7f621c405d49a091e3e367be4250a27a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bf3e76289cd28b87f679cd53e26d67fd708d718a
Message-Id: <160469720569.14190.4096312430575254303.pr-tracker-bot@kernel.org>
Date: Fri, 06 Nov 2020 21:13:25 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_161326_514358_846E8FA8 
X-CRM114-Status: UNSURE (   4.02  )
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

The pull request you sent on Fri, 6 Nov 2020 20:43:11 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bf3e76289cd28b87f679cd53e26d67fd708d718a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
