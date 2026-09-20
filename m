Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8007C982DA
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2026 16:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eKFwbfLxeIPa+1HCHrpvwvbpfbQ3jh5/QXojEMwHijc=; b=K5o5xOJteeflHK
	jSC2UO8co8GVM5fk9iVI8VOHG2rnZ5dUAnZuO1IaEUCKVuRtZMxO+YTlSg19a6BVvTQEkOYbOavFJ
	YM+XJ1mGB3M0ZpZxEvlgQ5pppIs4T6x7yfqFHTwPlNNgZkyNPxlYMHhO3FFRs+UVtJC3cubIH/SAi
	e4hB4li6IB6N8C1PBOWpmBbygwjIA5oJhL9bqB16fAPDQhLMXuckArBWZ4mQichw2mJaD6sBdzC+2
	JfKPBQ/za/chhjrKXB+y9geYLWUQwdsIXMAAtnsxeOWi3cCyHGJxnBYs927F65XlOuUM13w+RIO3i
	7mtG0UXySoEDyh4wFFpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8KH5-000000006vl-19U6;
	Sun, 20 Sep 2026 16:20:19 +0000
Received: from mx01.bremer-it.com ([2a01:239:410:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8KH2-000000006uf-073f
	for linux-mtd@lists.infradead.org;
	Sun, 20 Sep 2026 16:20:17 +0000
Received: from cashel.logfs.org (c-98-33-96-243.hsd1.ca.comcast.net [98.33.96.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by mx01.bremer-it.com (Postfix) with ESMTPSA id AF3AE20C28;
	Sun, 20 Sep 2026 18:19:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=barelysecure.org;
	s=dkim68; t=1789921202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=leCY6IsGKPR9u06vq7iyJf19QaSegMxEOFrGed/5/2I=;
	b=3YalKCb5xHQYiS4vB3j6hbAivOC3XOtW04FXWFKeBLJnECBZc2BzVkgJfjyCQF0dAfEdEu
	NfsvPiAas9aeBdI119wstcK5kEvK3ohHaMONdlFXBTbTNMss+hFFYeazcpkmPP1pLdeluy
	hXb2NPRVvNg1aI7fn/6O7hlVZ97ypts9+t+eUYbGPytRiAaPBvf4pJac6jEqVUmoSIzAOP
	515KrHmjJ5ot44Q8UPtlfbvZQ3TfMFTMwFE5zIYgiIb8326MA5x83773cx7CFS2XQf1eYE
	9cmgC6dzIprn8jVvn7Y6NcHYfZ9SuSQ+We55gWTXSR5rYoKKHrWDS2/R4OX0Yw==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=joern@lazybastard.org smtp.mailfrom=joern@barelysecure.org
Date: Sun, 20 Sep 2026 09:19:55 -0700
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@barelysecure.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Chris Roy <iam@thechris.in>, Richard Weinberger <richard@nod.at>,
	Greg KH <gregkh@linuxfoundation.org>,
	syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>,
	dakr@kernel.org, driver-core@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	rafael@kernel.org, syzkaller-bugs@googlegroups.com,
	linux-mtd@lists.infradead.org, vigneshr@ti.com,
	Adarsh Das <adarshdas950@gmail.com>
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
Message-ID: <arAHq0imD-Gm_bOc@cashel.logfs.org>
References: <CAE2Bdm2wzxj-J0TM8F+3SVnu0W3HeiROW97U4qvBeyHKdHJFmg@mail.gmail.com>
 <2026091753-broadness-bootie-b683@gregkh>
 <CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
 <aqwuWWMwdIcx3704@cashel.logfs.org>
 <mu82xsi6.76ee613a-07fb-48b1-9336-99e8780e8b6e@nod.at>
 <CAE2Bdm3FqBPAMxqKoz_h1cw+OXpm=LJHdJjsME_Jy966tqhq_A@mail.gmail.com>
 <aq6gJTYTpTr8sYPj@cashel.logfs.org>
 <CAE2Bdm3K+ZnrfB7xzkg=2fzMs7AmJzdF3aYCpN00h90TR6FMog@mail.gmail.com>
 <aq6sd2Z3nZuAYbMG@cashel.logfs.org>
 <87cxu8axvh.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87cxu8axvh.fsf@bootlin.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.17 / 14.00];
	SUSPICIOUS_RECIPS(1.50)[];
	BAYES_SPAM(0.77)[78.91%];
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
	FREEMAIL_CC(0.00)[thechris.in,nod.at,linuxfoundation.org,syzkaller.appspotmail.com,kernel.org,lists.linux.dev,vger.kernel.org,googlegroups.com,lists.infradead.org,ti.com,gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[barelysecure.org:from_smtp,barelysecure.org:from_mime];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: server01
X-Rspamd-Queue-Id: AF3AE20C28
X-Spamd-Bar: ++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_092016_515940_B907F8B5 
X-CRM114-Status: GOOD (  14.93  )
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

Hello Miqu=E8l

On Sun, Sep 20, 2026 at 02:52:18PM +0200, Miquel Raynal wrote:
> =

> Not saying this would be a bad move, it would be highly inconsistent
> with the current code base. Every single allocation in the kernel is
> checked. Such a change, without a documented and agreed upon method,
> would lead to dozens fuzzing AIs sending patches to add the "missing"
> check.

If your argument is that such a change would be inappropriate for the
patch in question, I totally agree with you.

I would disagree with an argument of "we should do the wrong thing for
the sake of consistency".  If indeed it is the wrong thing, we should
stop doing it.  Then we can regain consistency by not doing the wrong
thing anywhere.  In other words, consistency is irrelevant.  The only
question should be whether such a change is right or wrong.

There is also the practical consideration that changing the kmalloc
interface will lead to thousands of changes throughout the kernel and
requires a large time commitment from someone.  If nobody volunteers to
be that someone, it might still be better to stick with the status quo
for now.


So making an entirely theoretical "if I were king for a day" kind of
argument, I don't think GFP_KERNEL allocations should have to check for
failure.  Neither should userspace callers to malloc.  An interface that
frequently returns errors is pretty safe, as callers with broken error
handling are quickly detected and fixes.  An interface that almost never
returns errors is dangerous, as broken error handling in callers becomes
common and will eventually lead to bizarre hard-to-reproduce failures.

One of my roles in my last job was to fix userspace malloc and one of my
fixes was to ensure it would never return an allocation failure.  If it
returned, the caller received what it requested.  If that wasn't
possible, the process would crash.  A crashing process isn't exactly
desired, but it beats unpredictable behavior triggered by broken error
handlers.  And dealing with a single error path costs significantly less
cognitive effort than dealing with thousands of error handlers
everywhere in the code base.

Anyway, since I am not volunteering to spend a significant chunk of my
time, this is just the opinion of someone that doesn't matter.  Feel
free to reject it.

J=F6rn

--
Why do musicians compose symphonies and poets write poems?
They do it because life wouldn't have any meaning for them if they didn't.
That's why I draw cartoons.  It's my life.
-- Charles Shultz

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
