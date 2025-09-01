Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454B7CA1009
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 15:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g1Hran3kNb5314qbMz8XKahVSuFdl8btJClbT8ZRqFc=; b=ZpIHqU5wdya5Ov
	pQQ6iLHqt1i+kLOiocIg26gy+oY1KArJVcR+DD3USylZgsJlzJc13QhCmMvHgzUMv4ep/Vgy8kiG7
	XhvTAOyntMnqh7BUIVbY+hRv0NDfy1VtIWWJnlKXR2MqOR2VGVSZ1xGF3xIaN4J/JCKXNV5LezZ97
	nU0MU3ZQ/XFb43hK4V1/MCpqaNIkQUGylqNnONkeRf8CUA1s5q3eWKGLwZ3GHq43611X6K8gjq9Au
	ilwqSaABaOapkd2KdBIjmnJa237b8NOzA0efcW1tsKvzkelL4qA9rDi/b4fvbrw2DPHGd6h8l8fBE
	uJFKQb1VWuXSzddUggUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6AY-0000000CzIA-0m23;
	Mon, 01 Sep 2025 15:10:06 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3dz-0000000CS2J-0cPk
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 12:28:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CF8B6C8F1CA
	for <linux-mtd@lists.infradead.org>; Mon,  1 Sep 2025 12:28:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A97AA60699;
	Mon,  1 Sep 2025 12:28:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 14C491C22D736;
	Mon,  1 Sep 2025 14:28:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756729697; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=I/laeijb58zrGdzeNLjskuGQXHq+or0fFdQCv8Qbv+o=;
	b=SXVpa7ZA7/pUYzfX/ReMvByFr23qz2R1aRaPOkr+aUwYWow4dICYyAe5B+KUBg9n0md1J8
	/z3Nw18xgUSqxtmwvDvhEycGd7zzOdMfICtewmRQw9Vb/hGj9Xh9XJFE+Jms6B4l1AQjUA
	UxFWwg33It1VY6RRIpdwTzyz3kUTVEvky2bgHFjYJkU4ZU3rnpIQw8hfMYkf1YZmRtn9g3
	Eqf2WvABoUs0ujO3gAuWLhCGSCr0/QU8ohAmfbF5zdjLphWp7Cw3MOHeIdILmHfLhkuyiv
	BaOv+KKLdC0QBeE+wySGltbQksizRQGRQhiALwzeInKDzu2EP2bxagdJQ90HMQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, Teng Wu <gigadevice2025@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 teng.wu@gigadevice.com
In-Reply-To: <20250818135227.2114-1-gigadevice2025@gmail.com>
References: <20250818135227.2114-1-gigadevice2025@gmail.com>
Subject: Re: [PATCH] mtd: spinand: gigadevice: Add continuous read support
Message-Id: <175672969089.48694.8035765334378979816.b4-ty@bootlin.com>
Date: Mon, 01 Sep 2025 14:28:10 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_052819_381323_B2A65A7A 
X-CRM114-Status: UNSURE (   6.93  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAxOCBBdWcgMjAyNSAyMTo1MjoyNyArMDgwMCwgVGVuZyBXdSB3cm90ZToKPiBHRDVG
MUdNOSBzdXBwb3J0cyBhIGhpZ2gtc3BlZWQgQ29udGludW91cyBSZWFkIChDUikgbW9kZSB3aGlj
aCBhbGxvd3MKPiB0aGUgZW50aXJlIG1lbW9yeSBhcnJheSB0byBiZSByZWFkIG91dCBieSBhIHNp
bmdsZSByZWFkIGNvbW1hbmQKPiB3aXRob3V0IHJlLWlzc3VpbmcgdGhlIDEzaCDigJxQYWdlIFJl
YWQgdG8gQ2FjaGXigJ0gY29tbWFuZCBmb3IgZXZlcnkgcGFnZS4KPiAKPiBEYXRhc2hlZXQgc3Vt
bWFyeQo+IEZlYXR1cmUgcmVnaXN0ZXIgQjBbM10gKE5SIGJpdCkKPiAxID0gTm9ybWFsIFJlYWQg
KGRlZmF1bHQpCj4gMCA9IENvbnRpbnVvdXMgUmVhZCAoQ1IpCj4gCj4gWy4uLl0KCkFwcGxpZWQg
dG8gbmFuZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IHNwaW5hbmQ6IGdpZ2FkZXZpY2U6IEFk
ZCBjb250aW51b3VzIHJlYWQgc3VwcG9ydAogICAgICBjb21taXQ6IDQ5YjkyNTQyMTcwNDgwNjhh
ZTEwMTE2MTlkYjYwYTZkZTVlZGY3ZTIKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9u
IG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQg
dGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
