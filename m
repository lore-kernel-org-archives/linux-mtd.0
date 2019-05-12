Return-Path: <SRS0=9VLx=TM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B36C04A6B
	for <linux-mtd@archiver.kernel.org>; Sun, 12 May 2019 22:25:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73E7821019
	for <linux-mtd@archiver.kernel.org>; Sun, 12 May 2019 22:25:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FYS68Iu2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jUxWlwMT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73E7821019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l010dm53uk3T++crSdQtz331h32Bcb2c1GokVG3RxlU=; b=FYS68Iu2y3eTkC
	e9/k9Z+y2LPhmIwhIBQfPIKV6uQg9rbZ7ix3dsWAnMicUkJiekPZCc25XjjoRb4FF9cPwW84WYHm8
	alOkkc5nK1MX4sDAgdjS8BvPIjOLjdXb/ywrkrKkzhM9DfsC9BrBmx4qB40w81Y9zduHt4Q7uVdlM
	ioP5Lva3Z/FlxzZE0MpMdhHsm2IHJjuSr5n0SuR2ec6WsWRvPQ8qZBw/4cRlUfo1YjQhYecUwVw+t
	jictjvWGx/BP4xNkIl9yjXJURsIffpgVSwndNDEMqKpxsBZ+p2ZI7/AxtEhG/rm45VmJhmL/kej2k
	G1OiYhcyvpU53EIcZxTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPwuE-0001Vc-2J; Sun, 12 May 2019 22:25:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPwuA-0001Uh-T9
 for linux-mtd@lists.infradead.org; Sun, 12 May 2019 22:25:16 +0000
Subject: Re: [GIT PULL] MTD changes for v5.2-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557699914;
 bh=p4U116jkf3QKKLRcOcQHnj+XhJa1Q6UE86Y+4vfZHMc=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=jUxWlwMTAxLp923P7Znv7P1v0WPiDixQbtaB6m59DB6jsF89GMT3l7xCDgR9LWGC+
 YcaNJgY53BBw/iyfs6sYnjpBoIrZ6bzhdoznWOiSit58L8KQT84PeqOffUx56eAU2d
 EgDnM61lifqke9dVqXA495T291NqGYmHEekExjbw=
From: pr-tracker-bot@kernel.org
In-Reply-To: <789478679.56056.1557697327425.JavaMail.zimbra@nod.at>
References: <789478679.56056.1557697327425.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <789478679.56056.1557697327425.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-5.2
X-PR-Tracked-Commit-Id: 3008ba87093852f3756c5d33f584602e5e2a4aa4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4dbf09fea60d158e60a30c419e0cfa1ea138dd57
Message-Id: <155769991458.32032.14628300238313883821.pr-tracker-bot@kernel.org>
Date: Sun, 12 May 2019 22:25:14 +0000
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190512_152514_953775_42579F62 
X-CRM114-Status: UNSURE (   1.28  )
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
Cc: vigneshr@ti.com, linux-kernel <linux-kernel@vger.kernel.org>,
 marek.vasut@gmail.com, linux-mtd <linux-mtd@lists.infradead.org>,
 miquel.raynal@bootlin.com, torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Sun, 12 May 2019 23:42:07 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-5.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4dbf09fea60d158e60a30c419e0cfa1ea138dd57

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
