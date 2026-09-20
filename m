Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2552C982DA
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2026 21:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=J2Y4mr6KzXSsDfPYpsDDDRgCNZd6fQahQf4S5DL/WkA=; b=fiLIDZ5uL5E5iUClpFzRSFPymo
	e6dcmvvW3hqsEnih7M6nufdWCPVm7yZaBqNFJyni2+MZizl/J8FnxWIySRVZuMM/+NY8mGwJ+VS1N
	xTsNC0gkL04/4VdF0BFBkZlA9Q+L0hZYG0jlEbWuYr9u5uiwyPnbe/DbvLNYhcusdJk1s/Ec1hxz6
	otrHapyrjOtrtNxM2jMbhJMPWvnUu0w74rA3PACPxqTFCeu+8bZGHA2vXW07fH0XiZOh4+qtxkJE1
	//WlYNqyDS/dtUQFfHZpE+5A8fcqoRrDBri7oryyQJ+Y4pcau/twcoAA6uleS/ehBbinhSsleJOJ9
	4gIL5YHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8OnF-00000000Qrq-2ACM;
	Sun, 20 Sep 2026 21:09:49 +0000
Received: from calculus.sigma-star.at ([188.245.196.96])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8OnC-00000000QrP-0S64
	for linux-mtd@lists.infradead.org;
	Sun, 20 Sep 2026 21:09:47 +0000
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1789938548; bh=7Owhjo1ECLMiH1zOqdk1V3g
	VQhCw/Iw6xOoJ8dUCtB0=; b=duy9tcqOaX5fg9dXjBaxzEgXY9e/YX5aRrv8VcuqMoMWpGlpal
	f1Unx4Hqfq1bAar0kCrWGKauu3r1ZciWlLDw==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1789938548; bh=7Owhjo1ECLMiH1zOqdk1V3g
	VQhCw/Iw6xOoJ8dUCtB0=; b=Mee3cxQNVitki65Um3KOTaTmK4S/YY+UZfcX5CUrV68zVzJ2dK
	slcCnRCQBFsA083s+qiBJGHixtUprH9Y9OW8RuPQteSYSK9xFEpp1T59+OAIyangp/jnKK82TDs
	yqD19SFCqvWuNnZFImUf05E006yKcYVQQq9MlFfipBZ/+yT+inmlvci42BMeJ+wdOPNFcz8bQ7O
	c1nwPusxdJzGa/Od3sWoar/zDzoGY9t0uSQPE680OR/eDFYKJku6OjBfYU5kHKawYo9gnne6Ysq
	DFJyFsl4nNKGBdr2PDMzcBoZxqUZzHk1jcnKCGyouajZmlSpTaO5+tNtQA7e95q5Y9g==;
From: "Richard Weinberger" <richard@nod.at>
To: "Chris Roy" <iam@thechris.in>
Cc: =?utf-8?Q?J=C3=B6rn_Engel?= <joern@barelysecure.org>, "Greg KH"
 <gregkh@linuxfoundation.org>, "syzbot"
 <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>, <dakr@kernel.org>,
 <driver-core@lists.linux.dev>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rafael@kernel.org>,
 <syzkaller-bugs@googlegroups.com>, <linux-mtd@lists.infradead.org>,
 <miquel.raynal@bootlin.com>, <vigneshr@ti.com>, "Adarsh Das"
 <adarshdas950@gmail.com>
Subject: AW: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
Message-ID: <muab72x3.7c175620-35e4-4686-b377-487e6c270ea9@nod.at>
In-Reply-To: <CAE2Bdm2UA2UTkYY-w2qxLaXWjnujTkOoC2mS+WXu7McZV2MyeA@mail.gmail.com>
References: <CAE2Bdm3NuEHshrG6K2boKAnCQUvT5SX79cP9nPgS2s1afzY1hg@mail.gmail.com>
 <6aab0f82.e91c2013.3bdb06.0009.GAE@google.com>
 <CAE2Bdm2wzxj-J0TM8F+3SVnu0W3HeiROW97U4qvBeyHKdHJFmg@mail.gmail.com>
 <2026091753-broadness-bootie-b683@gregkh>
 <CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
 <aqwuWWMwdIcx3704@cashel.logfs.org>
 <mu82xsi6.76ee613a-07fb-48b1-9336-99e8780e8b6e@nod.at>
 <aq6afmdN5DYpuUa2@cashel.logfs.org>
 <mu8hfoxj.7ce5e90c-076c-4b73-813b-f9c60310ddab@nod.at>
 <CAE2Bdm2UA2UTkYY-w2qxLaXWjnujTkOoC2mS+WXu7McZV2MyeA@mail.gmail.com>
Date: Sun, 20 Sep 2026 21:09:08 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_140946_320538_F476902E 
X-CRM114-Status: GOOD (  13.34  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Sat, Sep 19, 2026, 16:44 schrieb Chris Roy <iam@thechris.in>:

> On Sat, Sep 19, 2026, Richard Weinberger wrote:
> > While we're here, maybe it's time to add a decent configfs interface to
> > this driver instead of configuring through module parameters.
> > That way also multiple instances are possible.
> >
> > IMHO testing is the only use case. I use it regularly.
> 
> I would love to look at this if you think it's worth the added
> complexity. A couple of design questions before I start
> on anything:
> 
> - Does configfs coexist with the existing block2mtd= module param
>   (for early-boot/cmdline compatibility), or replace it outright?

Keeping the module parameters is not a hard requirement but would be nice.
Ideally, the module parameters prove an initial configfs setting. 

> - For multiple instances, would a configfs group per device (backing
>   path, erase size, label) match what you had in mind?
>

Yes. See how nvmet uses configfs. A similar, but simpler, approach
will do it for block2mtd too.

> Can sketch an RFC-style doc once I have a sense of the above.

Sounds good.

Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
