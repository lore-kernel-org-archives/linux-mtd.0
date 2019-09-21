Return-Path: <SRS0=szY+=XQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D45C4740A
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Sep 2019 18:15:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 328C421971
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Sep 2019 18:15:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dTybtr49";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fR7TgMaJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 328C421971
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yv0iuDn++wtQ6sC1tWV/05K4wYwz0VwXp6TIIXKglM0=; b=dTybtr49N+EY5U
	rpqjUaGNHUgea2IMiyVWDzT5K9Qj9FayVzEyIdyApNWhvdWN0N2XHTHF13NEFQSVWtnsG0EQ+GEbK
	IRerF9UN59GlVv2VJQwZwNl/b3ZVnux1f14YaVaC3eddfvtffe4yDoMdtaHuewW9uDgEocLh84mNU
	A9uHSnKgb8jI8z36f2UNgA9yH4qaaAyqtiKRQQJ/WQvIBKLcfoYV5NN184tReY6yv4S5wEJkAKaF3
	FMbKH8Sdd/VlX7zQB6LeYEHUXWfNQcgt4H43t1r0daJEz8ahIk01yZcHaVRqAUcIlPhnOydObslQY
	plXacRK6ZnkobPKhAmsw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBjuq-000241-If; Sat, 21 Sep 2019 18:15:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBjum-00022K-Se
 for linux-mtd@lists.infradead.org; Sat, 21 Sep 2019 18:15:26 +0000
Subject: Re: [GIT PULL] MTD updates for 5.4-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569089724;
 bh=bBHYtE7nzeS8vbO+KYHOuR4V++/A2K2IKrb0HKTD+SQ=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=fR7TgMaJoZFtmX5b3+WjpVtYjRLLiII17jM1AmB6zc0SGbPavifvifdQHo8zg17Jx
 io4ggEExuuabRD1UQroqbar72ZbWNb0CgWET9GWdEPntwtvGOsKeZOEnGDkEjM1idk
 zUj/z9ca7JU2zAi/+zGz1qAiBM515iIrsSo6gJ5k=
From: pr-tracker-bot@kernel.org
In-Reply-To: <1742349117.3527.1569051395780.JavaMail.zimbra@nod.at>
References: <1742349117.3527.1569051395780.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <1742349117.3527.1569051395780.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-5.4
X-PR-Tracked-Commit-Id: 2cfcfadb8e1380938d6631cffa4fa567b13f52b2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4553d469d6f88028f185de57e771dd29aba10d90
Message-Id: <156908972436.32474.2390391454365007694.pr-tracker-bot@kernel.org>
Date: Sat, 21 Sep 2019 18:15:24 +0000
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190921_111524_947469_94032618 
X-CRM114-Status: UNSURE (   1.21  )
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
Cc: vigneshr@ti.com, linux-mtd <linux-mtd@lists.infradead.org>,
 torvalds <torvalds@linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, miquel.raynal@bootlin.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Sat, 21 Sep 2019 09:36:35 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-5.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4553d469d6f88028f185de57e771dd29aba10d90

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
