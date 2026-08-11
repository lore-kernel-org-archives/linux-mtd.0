Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6042C5B572
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 18:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wn+F3X2c28jOUg5ap7DDbWbg0dmqyuOT0v3v8fh0mmU=; b=YLG0QssgBttNY5
	tp/NNJoRrmzajf9O8Ho2fMlsaaEK+v1pqWfSpuxXVwsoSP2i8PWRcdGtKPRAdpbzOhPo4mebV7Eky
	HXSdCaDNnU6DBR+dwNZ2vonAXp/gtyJ9MjkGUFgKSbXNyp37sHFR28xYGfLRMM8FuYMRAec2iN2k3
	NAC87QNel2vJZZG7FJA8HOjuOvUZWZE7FQ05E6ER8eWsoWnSF9FeMIvF2QCdABApOW5J4UMyriKZt
	E/qYXpR1RyVbZ5s6dGrF7xzVEi9WgoBtqVuf06NvD9D57zlnE4FGf+3f9uCA9OVnK85UwVEhcvWBT
	eOpTzJNHUlnEeHKo5rnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtr5H-0000000Ek9g-12vS;
	Tue, 11 Aug 2026 18:20:19 +0000
Received: from mx01.bremer-it.com ([85.215.132.167])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtr5E-0000000Ek7I-1jXW
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 18:20:18 +0000
Received: from cashel.logfs.org (c-98-33-96-243.hsd1.ca.comcast.net [98.33.96.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by mx01.bremer-it.com (Postfix) with ESMTPSA id 1B67A2CC76;
	Tue, 11 Aug 2026 20:19:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=barelysecure.org;
	s=dkim68; t=1786472402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/9pS6KtHLQ6uFM7vzTJ4cHqsIGhzdLQpbeisSsi6mKg=;
	b=r4l0P+uydX5qL+wKXianH+Y/pV+EJK32jDjwvm4k74mV09S6DXowJ72tytdNkZTPJaH72L
	K8uaCuOhX4j1cyc58mFyzQRDQENOUnq8LgTsmhXOUOSUiCBO0QglYb56FM5UZFNuFrY3Mp
	jsgGHHwAQrw9aGwjYVrfP8tvn+yXpbXaKlEuEpeGvydQ7UmOOawcIK4oezO3aEu1ANPTWL
	omOV2fmeZfaTPelDdmeoDNuSfpgRGqnuhk6lmdOVZyIioOAAnkJa8W0mMsVjiY9jQ+Ohex
	Pxg1otBcbgN/8RpvFz2GpN4gPxLPPNQ/CFA7XKtzBqUA86suiYwQVNoD1CUpww==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=joern@lazybastard.org smtp.mailfrom=joern@barelysecure.org
Date: Tue, 11 Aug 2026 11:19:54 -0700
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@barelysecure.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	syzbot <syzbot+b320a4d5f65a61dbbf89@syzkaller.appspotmail.com>,
	joern@lazybastard.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, richard@nod.at,
	syzkaller-bugs@googlegroups.com, vigneshr@ti.com
Subject: Re: [syzbot] [mtd?] divide error in block2mtd_setup2
Message-ID: <antnynHuZ2W8JmCc@cashel.logfs.org>
References: <6a791c94.01d0871a.3a0d52.009b.GAE@google.com>
 <ankxaiwtTltL0xMj@cashel.logfs.org>
 <29397db9-7db4-4969-bb0e-5bb71f0c0303@kylinos.cn>
 <87se4mqhc3.fsf@bootlin.com>
 <bbbff0ba-09c4-49dc-9aac-371c0c7d6902@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bbbff0ba-09c4-49dc-9aac-371c0c7d6902@kylinos.cn>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.31 / 14.00];
	BAYES_SPAM(1.91)[88.46%];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[b320a4d5f65a61dbbf89];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7922, ipnet:98.32.0.0/11, country:US];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[barelysecure.org:s=dkim68];
	FROM_EQ_ENVFROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	URIBL_BLOCKED(0.00)[barelysecure.org:from_mime,barelysecure.org:from_smtp,c-98-33-96-243.hsd1.ca.comcast.net:rdns,cashel.logfs.org:mid,cashel.logfs.org:helo];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: server01
X-Rspamd-Queue-Id: 1B67A2CC76
X-Spamd-Bar: +++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_112016_900330_45684F38 
X-CRM114-Status: GOOD (  10.98  )
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

On Tue, Aug 11, 2026 at 11:02:53AM +0800, Pei Xiao wrote:
> > =

> Thank you for your reply. I am waiting for a reply on whether the cast
> on 'long' needs to be removed. Once that is confirmed, I would be happy
> to do it. Thank you.

It doesn't need to be removed, but it should be removed.  Any
unnecessary code should be removed in general and unnecessary casts in
particular should.

One of better parts of the C language is that casts are hardly ever
necessary.  Which means that any remaining necessary casts should
immediately draw attention of the reader - something tricky and
potentially dangerous is going on here.

But you stop paying attention when things become too common.  Which
means that unnecessary casts are not just noise, they actively do harm.


In this particular case, we can simply test whether the cast makes any
difference:

#include <assert.h>
#include <stdio.h>

int main(void)
{
	for (int i=3D0; i<=3D1<<16; i++) {
		for (int k=3D1; k<=3D1<<16; k++) {
			long long size =3D (long long)i << 32;
			int erase_size =3D k;

			long long a =3D size % erase_size;
			long long b =3D (long)size % erase_size;
			assert(a=3D=3Db);
		}
	}
}

Compile with optimizations and the compiler decides to remove the loop.
Unless you suspect a compiler bug, I guess that settles the question. ;)

J=F6rn

--
Semper ubi sub ubi ubique.
-- latin pun

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
