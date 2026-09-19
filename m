Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D282C982D8
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2026 14:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1ttWm2D60PjNxMKotLQF0RMTT38lzkzDzsBL9cSe7g=; b=4bn28eEuDlT4K6
	Zg/fbjVQp4ezFaC0qZwjA1YUtmJl4H9mv3Gq1uugZPhPY72WAVnIYQpwSBqKyYvG9yzeqxZpfAE0g
	xpFZ6yDC/F8noEPSz9A8o+VCLitnEs1s0qDxoPRhwekNNj7+xkBNhS5i994sjiVsTf+24nw+c4xgG
	m1qEA4+d7pySDUEPg+My4L831LjKJzmhBPff08RziMmkKnVj1SZIxFhtNWQ+I7KkGftrhbnBMBepg
	fZkCCa/lx43S+0jqKz8gqbhphYeHehtK+6hQgp+iytK4GKraH2qwka0WdzUcd1b60kkycXovbN4h0
	Motr4057vJJE2tqcjHkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7vxE-0000000GMls-2F6A;
	Sat, 19 Sep 2026 14:22:12 +0000
Received: from mx01.bremer-it.com ([2a01:239:410:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7vxB-0000000GMj4-3FZ0
	for linux-mtd@lists.infradead.org;
	Sat, 19 Sep 2026 14:22:11 +0000
Received: from cashel.logfs.org (c-98-33-96-243.hsd1.ca.comcast.net [98.33.96.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by mx01.bremer-it.com (Postfix) with ESMTPSA id 0C32020BD1;
	Sat, 19 Sep 2026 16:21:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=barelysecure.org;
	s=dkim68; t=1789827716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dF0vvhSQmDb1GBoZeo34gbG9l05gqX6VJ3NyhVM0R2A=;
	b=W6h9jXQcxIeA/cFgWioUmhHjg4orfTMF/v1oPeAHiBz/3WHjJWeRCYD4Sn1OgRfBVHb67D
	2I+3lwcnWxV5UtLkWfuFF3FoYkdNJUgCR4qK9vt3IwZuK2O1/F2x4ngyIbTs7nr1jbyWbo
	KU7Ynp2ZN3qQ9Uw01+NrtRkbdrxi9ILCEi0ZUv0EzO0+Iz87iigWYBESqjxuE5AvTAYl1M
	nb9BeYxk6tNxmMafU3FwUUVYvllh7Dq80MjJjtvgozNGcjonE0YDKc6bjBwQ7D5sNamTyn
	zX34VZzpRJkhTi9iqo8hGQTwAsdumqtUTtr8Ir55/1kjAsAazVpoKtqYQwhqOQ==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=joern@lazybastard.org smtp.mailfrom=joern@barelysecure.org
Date: Sat, 19 Sep 2026 07:21:50 -0700
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@barelysecure.org>
To: Richard Weinberger <richard@nod.at>
Cc: Chris Roy <iam@thechris.in>, Greg KH <gregkh@linuxfoundation.org>,
	syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>,
	dakr@kernel.org, driver-core@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	rafael@kernel.org, syzkaller-bugs@googlegroups.com,
	linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
	vigneshr@ti.com, Adarsh Das <adarshdas950@gmail.com>
Subject: Re: AW: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
Message-ID: <aq6afmdN5DYpuUa2@cashel.logfs.org>
References: <CAE2Bdm3NuEHshrG6K2boKAnCQUvT5SX79cP9nPgS2s1afzY1hg@mail.gmail.com>
 <6aab0f82.e91c2013.3bdb06.0009.GAE@google.com>
 <CAE2Bdm2wzxj-J0TM8F+3SVnu0W3HeiROW97U4qvBeyHKdHJFmg@mail.gmail.com>
 <2026091753-broadness-bootie-b683@gregkh>
 <CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
 <aqwuWWMwdIcx3704@cashel.logfs.org>
 <mu82xsi6.76ee613a-07fb-48b1-9336-99e8780e8b6e@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mu82xsi6.76ee613a-07fb-48b1-9336-99e8780e8b6e@nod.at>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.40 / 14.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.00)[17.57%];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[7cab6a19619f1b8efc00];
	ASN(0.00)[asn:7922, ipnet:98.32.0.0/11, country:US];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[barelysecure.org:s=dkim68];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	FREEMAIL_CC(0.00)[thechris.in,linuxfoundation.org,syzkaller.appspotmail.com,kernel.org,lists.linux.dev,vger.kernel.org,googlegroups.com,lists.infradead.org,bootlin.com,ti.com,gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[barelysecure.org:from_smtp,barelysecure.org:from_mime,c-98-33-96-243.hsd1.ca.comcast.net:rdns];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: server01
X-Rspamd-Queue-Id: 0C32020BD1
X-Spamd-Bar: +
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_072210_253268_693629BE 
X-CRM114-Status: GOOD (  10.69  )
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

I added Adarsh Das, who also attempted to fix this bug.

On Sat, Sep 19, 2026 at 07:42:25AM +0000, Richard Weinberger wrote:
> =

> While we're here, maybe it's time to add a decent configfs interface to
> this driver instead of configuring through module parameters.
> That way also multiple instances are possible.

I honestly wonder whether this driver has any production users.  It is
somewhat useful for developers that want to simulate hardware they don't
have.  But beyond that?

Anyway, I have two deeper review questions as well.

One, afaics block2mtd predates overlayfs.  If the bug requires the
interaction of both, it is overlayfs that introduced the bug.  So why do
we fix it by modifying block2mtd?  Is that really the appropriate way to
fix it?

Two, we fix the deadlock by adding a second thread (via workqueue).  But
to keep synchronous behavior we end up blocking until the second thread
has finished.  Does the blocking behavior recreate a circular dependency
and therefore a deadlock?  If not, why not?

J=F6rn

--
Prosperity makes friends, adversity tries them.
-- Publilius Syrus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
