Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1E5C5AC7A
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 14:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qXdUJm1RJq9oFF6PGiGyLElKWUKlZEW1DfNem21Mqj4=; b=nMT4XGyyYy4J3v
	dwagA5w+AN+DlwwuaZepcZ0KWJ6fG/7DBbgBpbGQCWSZ8AyVMLSBZUXI5kBBFdWTpkIagXZXxo0kF
	nneH3O+cQyBXlONeBsFMLXspubEd3rmyyzf9CNzOuN5eQRFfrZUlx7AT3mpzFhdtWVQUxT3a8yMd5
	MMhvtjGL8YtVVvRo7XaHjMF/qj78vIWac9bmV4cDO3BHoqG2B/npVFMoA5C6HiJfH1JBX9tG4dYpw
	l8IvQ7EYZlIf4y4pY1rxeEOo0XdhRE2qGVq0kOUkVkC4dHWg5Tj7Nzrh2HXepGcmSC7TLBCsAG9UL
	07hubpqjwniMnIh8smSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL7I-00000008DHV-2FZf;
	Fri, 07 Aug 2026 14:00:08 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL7G-00000008DGP-0ZkA
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 14:00:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7C8BD4E4113A;
	Fri,  7 Aug 2026 14:00:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 47C08603F0;
	Fri,  7 Aug 2026 14:00:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 177EB11C37966;
	Fri,  7 Aug 2026 15:59:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786111199; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4gM9Hs5ShzCeXGCv14su7opd+QccVz8d8pho9Y+66Fw=;
	b=PQrsfncOOgntaYQKdJswy8Y1a1dS8HNjsnUOv4ZA+MUHmp5XdWv2IyX/I+b5r4JRQy7Tq0
	km+3F+qNPuVyrVF5dGu2nUBpAECjdatVPh6iFzno81YmJlhg/PNBV47cFjjSex9CZfOuQH
	8RP5PfeDZ9h0w0Obo+18kPiY8sUgboqVpdGhr06Y1DVusb4BYXyHaZTjVjqdSzHYmM6OX2
	F5bHuAiUrAQ/a0+BhtITn4+4e+1/CAMSNHcbvoqIt8F5a2WEMQopNDPaloUKdwM2xnDr1l
	jTGrWl6yWL1GD+v32UgDrNiuSR++7yoRQJOoREToa0pK3EpjFTm+jSryzrwPxg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Aleksandr Mineev <sanderrrs@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260717155051.50-1-sanderrrs@gmail.com>
References: <20260717155051.50-1-sanderrrs@gmail.com>
Subject: Re: [PATCH v2] mtd: spinand: fmsh: fix FM25G01B/FM25G02B Quad I/O
 read dummy cycles
Message-Id: <178611119790.758547.8725356694959417850.b4-ty@bootlin.com>
Date: Fri, 07 Aug 2026 15:59:57 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_070006_321653_FC6F339F 
X-CRM114-Status: UNSURE (   6.04  )
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

T24gRnJpLCAxNyBKdWwgMjAyNiAxODo1MDo1MCArMDMwMCwgQWxla3NhbmRyIE1pbmVldiB3cm90
ZToKPiBUaGUgRk0yNUcwMUIvRk0yNUcwMkIgZGF0YXNoZWV0cyBzcGVjaWZ5IGEgc2luZ2xlIGR1
bW15IGJ5dGUgZm9yIHRoZQo+IDB4RUIgUXVhZCBJL08gcmVhZC1mcm9tLWNhY2hlIG9wZXJhdGlv
biwgYnV0IHRoZSBnZW5lcmljCj4gcmVhZF9jYWNoZV92YXJpYW50cyBzZXQgdXNlcyB0d28gZHVt
bXkgYnl0ZXMgZm9yIHRoZSAxUy00Uy00UyB2YXJpYW50Lgo+IFRoZSBleHRyYSBkdW1teSBieXRl
IHNoaWZ0cyB0aGUgZGF0YSBwaGFzZSBhbmQgcmV0dXJucyBjb3JydXB0ZWQgZGF0YQo+IHdpdGgg
bm8gRUNDIGVycm9yLCBicmVha2luZyBib290IG9uIGJvYXJkcyB1c2luZyB0aGVzZSBjaGlwcy4K
PiAKPiBVc2UgYSBkZWRpY2F0ZWQgcmVhZC1mcm9tLWNhY2hlIHZhcmlhbnQgc2V0IHdpdGggbmR1
bW15PTEgZm9yIHRoZQo+IDFTLTRTLTRTICgweEVCKSBvcGVyYXRpb24uCj4gCj4gWy4uLl0KCkFw
cGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IHNwaW5hbmQ6IGZtc2g6IGZp
eCBGTTI1RzAxQi9GTTI1RzAyQiBRdWFkIEkvTyByZWFkIGR1bW15IGN5Y2xlcwogICAgICBjb21t
aXQ6IDgyMTFmMmQ3NGIzNTZhMDJmZTM4YWVlYTViNzQwMzBhYzE1NjQ2MWYKClBhdGNoZShzKSBz
aG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0
aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpL
aW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
