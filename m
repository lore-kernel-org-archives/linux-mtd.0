Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF8BC982DA
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2026 14:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dBTO0mYO+OGUA7c5XHSeDtt1ciMFHaYBYbqx+ukjv1I=; b=G3vA06tiMosbKa
	5YOWu/SwRLZKxYpgqw2MQ07JNt8jAXH8mATB2wXGdk5BudvTOB80P3ubpeP7oaC/yEQWzxxkkOKWB
	53xfGyFtrJCcwC6vP8ObuDWLx7iY0U2TOmKtidfmprzehe1aGXze3cd0o6ws2+b+cLtksPRVHuNl6
	6olj6jibJiHyxZ9HUQTMh+6eZq4z0E6kwLAD8ElwRsYuAbF7DQzz9+edxePmA7G/tOjtEzfatmuw9
	xDMxRHQ4+ZFz8aUMrtWN46dl33Wo1EDitD7j7IoHc1TlPR//Fy8l4TlLI38Ihcwk1HV8mjTPX1SoX
	k/Eazc/YEDgTiJdAVw4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7wKQ-0000000GOeI-02EY;
	Sat, 19 Sep 2026 14:46:10 +0000
Received: from mx01.bremer-it.com ([2a01:239:410:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7wKN-0000000GOdA-3Zmh
	for linux-mtd@lists.infradead.org;
	Sat, 19 Sep 2026 14:46:09 +0000
Received: from cashel.logfs.org (c-98-33-96-243.hsd1.ca.comcast.net [98.33.96.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by mx01.bremer-it.com (Postfix) with ESMTPSA id BFC9220B84;
	Sat, 19 Sep 2026 16:46:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=barelysecure.org;
	s=dkim68; t=1789829164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PetF/HLtIXChJE/5lpvDpFt7S49VsIiNWMkHshV1HaY=;
	b=oSsDvW5TF97ZZ9SnJGDIBbSGmG9SYHbOrFq+VSbGmrePOTEHKHsqqcWT/fhckAQ1hl/0/D
	2gfMAXc7nSL/8MClT3/UnrcqluXvDV43r6SAzwdilS54yLVmImhYtVU6yIEbAbIlyWa6mR
	vhN66J01SeQbEYnRIps5+agFORN8FNAppZNLYe9mk4su5s0PNJ9Q827xMV24sXWA2bL5qj
	I7dKwSE4f4oSGNftf0LyIiYFjbKZWvpG3s+U+F25ijGHrGlxc0BUkLAv3DsqmFhG/pkRKc
	2gDNXt/7p6xwyi0YG+RiuT7dJcEbe/4gl5cUY3i8WhNrFQ+Pgf5JCdA/Y382iQ==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=joern@lazybastard.org smtp.mailfrom=joern@barelysecure.org
Date: Sat, 19 Sep 2026 07:45:57 -0700
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
Message-ID: <aq6gJTYTpTr8sYPj@cashel.logfs.org>
References: <CAE2Bdm3NuEHshrG6K2boKAnCQUvT5SX79cP9nPgS2s1afzY1hg@mail.gmail.com>
 <6aab0f82.e91c2013.3bdb06.0009.GAE@google.com>
 <CAE2Bdm2wzxj-J0TM8F+3SVnu0W3HeiROW97U4qvBeyHKdHJFmg@mail.gmail.com>
 <2026091753-broadness-bootie-b683@gregkh>
 <CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
 <aqwuWWMwdIcx3704@cashel.logfs.org>
 <mu82xsi6.76ee613a-07fb-48b1-9336-99e8780e8b6e@nod.at>
 <CAE2Bdm3FqBPAMxqKoz_h1cw+OXpm=LJHdJjsME_Jy966tqhq_A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAE2Bdm3FqBPAMxqKoz_h1cw+OXpm=LJHdJjsME_Jy966tqhq_A@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.40 / 14.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_SPAM(0.00)[40.45%];
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
	URIBL_BLOCKED(0.00)[barelysecure.org:from_smtp,barelysecure.org:from_mime];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: server01
X-Rspamd-Queue-Id: BFC9220B84
X-Spamd-Bar: +
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_074608_043993_960B8C55 
X-CRM114-Status: GOOD (  19.17  )
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

On Sat, Sep 19, 2026 at 02:22:15PM +0530, Chris Roy wrote:
> =

> +struct block2mtd_setup_work {
> +	struct work_struct work;
> +	struct completion done;
> +	char *val;
> +	int ret;
> +};

Finding good names is probably a fetish of mine, so "val" is mildly
disturbing to me.  It's not an objectively bad name, just something
where I'd spend another five minutes trying to come up with something
better.

> +/* Runs block2mtd_setup2() on setup_wq, blocking until it completes */
> +static int block2mtd_setup_defer(const char *val)
> +{
> +	struct block2mtd_setup_work *w;
> +	int ret;
> +
> +	w =3D kzalloc(sizeof(*w), GFP_KERNEL);
> +	if (!w)
> +		return -ENOMEM;

Is this check necessary?  I'm in the camp of "malloc should never return
NULL".  That condition is so rare that it is effectively impossible to
trust callers with error handling.  So the right approach is to crash
(or kernel panic here) instead of returning an error.

Looking into sources I see this:
static inline void *kzalloc(size_t s, gfp_t gfp)
> {
> 	void *p =3D kmalloc(s, gfp);
> =

> 	memset(p, 0, s);
> 	return p;
> }

We have at least one example of explicitly not checking the return
value.  But we have other prominent examples of checking as well.  Looks
like the kernel is still undecided whether checks are necessary or not.

> -	return block2mtd_setup2(val);
...
> -		return block2mtd_setup2(val);
...
> +		ret =3D block2mtd_setup2(val);
...
>  		ret =3D block2mtd_setup2(block2mtd_paramline);

That's quite a few calls to the same function.  If setup gets that
complicated, that's a strong indication that we're doing things wrong.
Typically we get into such a mess one well-intentioned change at a time.
Find a bug, fix it by adding another caller, repeat.

It isn't obvious how we could improve things.  Sometimes it's lack of
infrastructure and the entire complicated setup-dance should be moved to
common code.  Driver can then call a single function to deal with
everything.

But if there's only a single driver using such infrastructure, maybe the
driver is doing things wrong and should copy whatever other drivers are
doing.  The problem shouldn't be unique to a single driver, so we should
find the best solution and then use it everywhere.

I don't know the correct answer here.  If you feel motivated to dig
deeper, please do!  If not, I'd rather leave the mess in place than come
up with a half-hearted attempt of a solution.

J=F6rn

--
You cannot suppose that Moliere ever troubled himself to be original in the
matter of ideas. You cannot suppose that the stories he tells in his plays
have never been told before. They were culled, as you very well know.
-- Andre-Louis Moreau in Scarabouche

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
