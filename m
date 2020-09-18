Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 941C5C43463
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 19:05:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4704621707
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 19:05:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="begVYIBi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="gA9DmMlG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4704621707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDv02w5ehYu3X5a8j3tRf9Q98GRFbBB/9WVkayY8KUI=; b=begVYIBihs20GP3oxEuLWlS+bo
	s9VZRZo2IeFloMY/0I65Q2tfJdZB4QlbelehAUbZMWt22UkNSjbw5Rf5vnSJZvUaofAyzfxe36ls6
	9hGpfUGg2uHR2LWB+/u4KB7Ewj834eEiuj0L6HMhp0/UiSYzM/gNywGv/keGqTL+kdGEM91L4M6y4
	LLTBMvKNLvjzl6zytolyAfRmFmaL2pS2yreH4Zf83ng1BhPj1HiPp9ROPcVOD8/fT9UdqUVfpcgaN
	/hWgBWlnm6uEzvMwXR83p9jaBGqIgUGktbqwC3XOhXuacTpW8AktQU4CbOvZcjdTnu4f3asti4Wk8
	k65aDkJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJLgH-0000aT-Li; Fri, 18 Sep 2020 19:04:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJLgE-0000ZE-MY
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2020 19:04:23 +0000
Subject: Re: [GIT PULL] mtd: Fixes for v5.9-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600455860;
 bh=jQHn+v9RQ9uR56zwm2djy/2/gqWqBoZMQEO+bcakXHI=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=gA9DmMlGKJmnfwlV0im1v3Tmt/yLawB3lmoBYDnQyBNlwiZgU0vRRzOp4JaFgYv6+
 2tU/TllRJ6TrHkyq0nZRwpYk2uDQQrlwZ5leKaWG9cwIxikFnhUF1ElydMktX54iG8
 sTal++jcjLV+XArvsePixO9q+RxZHZociCBTgYG4=
From: pr-tracker-bot@kernel.org
In-Reply-To: <c6965ad6-7d32-7dd9-21f8-346cfa634147@ti.com>
References: <c6965ad6-7d32-7dd9-21f8-346cfa634147@ti.com>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list
 <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <c6965ad6-7d32-7dd9-21f8-346cfa634147@ti.com>
X-PR-Tracked-Remote: git@gitolite.kernel.org:pub/scm/linux/kernel/git/mtd/linux.git
 tags/mtd/fixes-for-5.9-rc6
X-PR-Tracked-Commit-Id: 1afc0c89f6a155c54c76d65ffcf72cd1232daf3a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 92373933f7dc0b311804d7d45bdae2aced81da23
Message-Id: <160045586090.18461.9178547259626166748.pr-tracker-bot@kernel.org>
Date: Fri, 18 Sep 2020 19:04:20 +0000
To: Vignesh Raghavendra <vigneshr@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_150422_856445_001E8E7E 
X-CRM114-Status: UNSURE (   4.26  )
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
 Richard Weinberger <richard@nod.at>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Fri, 18 Sep 2020 16:13:47 +0530:

> git@gitolite.kernel.org:pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-5.9-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/92373933f7dc0b311804d7d45bdae2aced81da23

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
