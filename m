Return-Path: <SRS0=LjUq=RI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A84C43381
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Mar 2019 03:40:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77A0420842
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Mar 2019 03:40:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aF7ImN3d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="gjf3g8/H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77A0420842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ekn5mAiuGyJLqKx7MkC2OHtAV68oB8RyPVzJXidZduU=; b=aF7ImN3dx6FwA4
	u3pmAYzB89hO8CC0G7dXQAYYfCyc5nV4PBq7YlObons25x4Re1ZwB+saK0NxGlbmyQiy4iRCzaPnU
	ZC7gkxJGy98xs1HNgpwMaX5o2fivrKwl62IOGaecAM/n+MJPMujbCSRbrzqTPhjEVFgDppf9LggDp
	8flwcKtFNg61zuizuEOW0tfyUQOkG2ZxQMk+8Y1oZmqfmDhr+GlHn1GQLkg+5DCbSjB6+rC9hy954
	mcSinu3Ik4qMFqqYr/C3BZGrjO/fkrdaJ2yGJit3on7bPrMBzhO/YV/LkpApO6Ie+jrHBsw3iWGKD
	j2pPrznDASCAQnSBpYIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h10w8-0004Ja-6v; Tue, 05 Mar 2019 03:40:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h10w0-0003nW-V3
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2019 03:40:06 +0000
Subject: Re: [GIT PULL] mtd: Changes for 5.1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1551757203;
 bh=kgKUs6CB2OVqa+OQ+Mkv6MbdlbqdAMWR44sDfGqmF2A=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=gjf3g8/H9+JvKK6eWTu1LinNPCEviGPA6jznOdDxsuuBMENe8z/pYEKpWH27EL+Zm
 fOZCsX24YM8FKqUgO0yicxY36roO/pmPA5eWKdMoczuIkrszuhwGQYhltDT7FFS44A
 oLeq/O3jzWdcQMCPG8xptoxhVvgw9PeUaDz/Vh3M=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190225094526.580e0dbb@collabora.com>
References: <20190225094526.580e0dbb@collabora.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190225094526.580e0dbb@collabora.com>
X-PR-Tracked-Remote: git://git.infradead.org/linux-mtd.git tags/mtd/for-5.1
X-PR-Tracked-Commit-Id: 9220d7befc9c28bf714701e6e26163644750d871
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 811c16a2a2de6fcdeea188a770600210943f8947
Message-Id: <155175720373.14960.4410023755111714346.pr-tracker-bot@kernel.org>
Date: Tue, 05 Mar 2019 03:40:03 +0000
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_194005_038444_7758F81F 
X-CRM114-Status: UNSURE (   2.58  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Marek Vasut <marex@denx.de>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Mon, 25 Feb 2019 09:45:26 +0100:

> git://git.infradead.org/linux-mtd.git tags/mtd/for-5.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/811c16a2a2de6fcdeea188a770600210943f8947

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
