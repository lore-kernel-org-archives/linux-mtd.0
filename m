Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D727C982D7
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2026 15:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e6Be8Kbcin98tyOfVCbhHPV+nv6fXLBcEq6jtdAJnU0=; b=hi1+zbzsuW7pJt
	YYzchn8ELsnutmThS5BTZjcsSi64I47rZi+nPae8N3w5536yLKCOdMfGSXqmbolqQJxnRxlax8No7
	C3g6KhnAfdHqsUMBlGYdBf3GxjkI0FZ1l+fHk3egNrgja11kr4XU/0hR7+vhiTjTyhF2eS0Gjh6qC
	RdcDYD+eh0o+DTfqttOuQZ727ndhWMQjEyGymGoLPybNyCUXvyQOuPp7MZFxWAaEpZjJO+QtMXaiQ
	PUA0TyL3jbWI4OB/GBs3N9s+w39K9pqM8A+Zx9U52ctPT/4I5reGx3pckZJ1IOcAy27bRsKH6++5T
	RxIQgfQdIuPWSdGIU3dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7x9N-0000000GSMF-078R;
	Sat, 19 Sep 2026 15:38:49 +0000
Received: from mx01.bremer-it.com ([85.215.132.167])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7x9K-0000000GSLK-0zU2
	for linux-mtd@lists.infradead.org;
	Sat, 19 Sep 2026 15:38:47 +0000
Received: from cashel.logfs.org (c-98-33-96-243.hsd1.ca.comcast.net [98.33.96.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by mx01.bremer-it.com (Postfix) with ESMTPSA id E311520C1B;
	Sat, 19 Sep 2026 17:38:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=barelysecure.org;
	s=dkim68; t=1789832318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6aw+V5r2LHIE5oFHzmqB4KZ1PpJUZDTMqnLQbkowUUc=;
	b=XlHzrTiwzZ9IFzbTcCAHxMd+6nyZjyXkIaxyhFGWvrAyqyugbWnoKMPmkET5mGk7/2xdp/
	0lS3aNJGcNLFaqUbveZ7dS8gwb70QxD/U1cFStoIg/LYfpNa9ItVJfHCLoszX3k9VzZGpi
	cgPbQvJ3DcSYjlgxGxTiS+WRZ+NtuP7MUXHQPPnuHrUZW+wlfhMg/5br3SJP7lPgNwcCS2
	TJ7u81vimKlc2o14zthGmnlQQqHQKNp5WsKf4tfYkTqx5wcDu63bmn1VuzjcPJRBFCEW0b
	PkGWZ875smpAbx3Jyxlwy4KER2Fn1fnIVOos5ElVbspvGaUoN5Qu62EKvULWog==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=joern@lazybastard.org smtp.mailfrom=joern@barelysecure.org
Date: Sat, 19 Sep 2026 08:38:31 -0700
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@barelysecure.org>
To: Chris Roy <iam@thechris.in>
Cc: Richard Weinberger <richard@nod.at>,
	Greg KH <gregkh@linuxfoundation.org>,
	syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>,
	dakr@kernel.org, driver-core@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	rafael@kernel.org, syzkaller-bugs@googlegroups.com,
	linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
	vigneshr@ti.com, Adarsh Das <adarshdas950@gmail.com>
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
Message-ID: <aq6sd2Z3nZuAYbMG@cashel.logfs.org>
References: <CAE2Bdm3NuEHshrG6K2boKAnCQUvT5SX79cP9nPgS2s1afzY1hg@mail.gmail.com>
 <6aab0f82.e91c2013.3bdb06.0009.GAE@google.com>
 <CAE2Bdm2wzxj-J0TM8F+3SVnu0W3HeiROW97U4qvBeyHKdHJFmg@mail.gmail.com>
 <2026091753-broadness-bootie-b683@gregkh>
 <CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
 <aqwuWWMwdIcx3704@cashel.logfs.org>
 <mu82xsi6.76ee613a-07fb-48b1-9336-99e8780e8b6e@nod.at>
 <CAE2Bdm3FqBPAMxqKoz_h1cw+OXpm=LJHdJjsME_Jy966tqhq_A@mail.gmail.com>
 <aq6gJTYTpTr8sYPj@cashel.logfs.org>
 <CAE2Bdm3K+ZnrfB7xzkg=2fzMs7AmJzdF3aYCpN00h90TR6FMog@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAE2Bdm3K+ZnrfB7xzkg=2fzMs7AmJzdF3aYCpN00h90TR6FMog@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.27 / 14.00];
	SUSPICIOUS_RECIPS(1.50)[];
	BAYES_SPAM(0.87)[80.13%];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[7cab6a19619f1b8efc00];
	RCPT_COUNT_TWELVE(0.00)[14];
	ASN(0.00)[asn:7922, ipnet:98.32.0.0/11, country:US];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ZERO(0.00)[0];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[barelysecure.org:s=dkim68];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	FREEMAIL_CC(0.00)[nod.at,linuxfoundation.org,syzkaller.appspotmail.com,kernel.org,lists.linux.dev,vger.kernel.org,googlegroups.com,lists.infradead.org,bootlin.com,ti.com,gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[c-98-33-96-243.hsd1.ca.comcast.net:rdns,barelysecure.org:from_smtp,barelysecure.org:from_mime];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: server01
X-Rspamd-Queue-Id: E311520C1B
X-Spamd-Bar: ++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_083846_416274_A6D033E3 
X-CRM114-Status: GOOD (  14.05  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Sep 19, 2026 at 08:58:51PM +0530, Chris Roy wrote:
> =

> I'd rather not bolt a redesign onto this fix.

Good decision!

> > Is this check necessary? [...] Looks like the kernel is still
> > undecided whether checks are necessary or not.
> =

> I will keep it. kzalloc()/kstrdup() under plain GFP_KERNEL can still
> return NULL under real memory pressure (no __GFP_NOFAIL here), and
> dropping it would be inconsistent with the kstrdup() check two lines
> below.

My foggy mind is slowly waking up.  GFP_ATOMIC can return NULL.  If
you're trying to allocate memory from an interrupt handler or similar,
you cannot afford to wait for memory reclaim to happen.  Those calls
definitely need a check and a reasonable plan what to do in case of
failure.

GFP_KERNEL should be able to block and wait, so there really is no
excuse for kmalloc to return NULL or for the callers to need a check.

But your decision of not pulling too many decisions into a single patch
is still a good decision.  Even if my logic is sound, removing checks
from kmalloc callers should be a separate effort.

J=F6rn

--
I don't understand it. Nobody does.
-- Richard P. Feynman

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
