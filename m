Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FDB606A325
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 14:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LiiwdJvU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=NSa6wdND
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HbTbKXZRf2BuDKplxc+VuLvWTFHNgarf08pt4e5Cwy8=; b=LiiwdJvUgxT+97LDUHoVNAbNRn
	+pE9io+CJC4xZYPmIoNIF/PnDizUxDIAN6bzVMJg4PzSe6hIkaldxfOEJ+AMbJnp3v6+am7NJSJ80
	Lz0ZC4uJnuJ957GQEEAj0bmB1OMd5AbfJ2D7XPJw7RfXzQast1JiGKKkzfSa5MF439PL0WqDdFaSB
	xUxvI53H6aAopjNLyVqUK5qP58Qz0kdeqA2h14VfIrzWeez9RATiLl28UqmXOgFg3Y4sEF95XUUoj
	CnNgbfDCCrnCWki2JrLsRqwkEphrP2oPQq0RaxrZi/L310kOv95N6mxreTdXm66Kh7C/hDCoXKUBj
	JqkMIiKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQ0r-0000000FJp7-1Sp9;
	Fri, 20 Nov 2026 14:54:53 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQ0o-0000000FJnD-2Fbk
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 14:54:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BB1461A1735;
	Fri, 20 Nov 2026 14:54:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8E4CD601B9;
	Fri, 20 Nov 2026 14:54:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0474711BC027B;
	Fri, 20 Nov 2026 15:54:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795186483; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rJXABJb2IswXHFHVUy9sFDPYDOPoMVxLMdVHHDodayk=;
	b=NSa6wdNDUXV1iBAQdr4Cq18Kf6waPEJ/Y7qwyECkK+15x2bH6Lvf2TuEaGypA2lB9oNG+r
	8uyiYz5UeB3lYM2E7hKXmfLogoUSdROg9Y02h/NEyX3z6FsL6JaVr2iC04Q1JeauoOD/GK
	rECxllg6qjXP6AsdaOjDkfN2MgTUtIfnjo7jLc6eUZ2Xa42bbGDwaBmSDWSqSu5ujQGX5d
	LwGpqyCx5S1dHlZSQFCQnAQ+3winGcc18c6AafMqbQ282ZqoHJMTTMHu+zk/4iXVwiONQm
	UorAtnyUnP/lFu6xcEOkjC1SNkTFiS2JwcYq+V8rulyoJPSUdVm096DL33+arQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH] mtd: take a reference when opening an unpartitioned master
In-Reply-To: <20261108-submit-mtd-master-open-reference-v1-v1-1-871aac8c6e05@gmail.com>
	(James Hilliard's message of "Sun, 08 Nov 2026 14:12:39 -0700")
References: <20261108-submit-mtd-master-open-reference-v1-v1-1-871aac8c6e05@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 20 Nov 2026 15:54:41 +0100
Message-ID: <87pkvza6z2.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_065450_752574_06B566B0 
X-CRM114-Status: GOOD (  10.83  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMDgvMTEvMjAyNiBhdCAxNDoxMjozOSAtMDcsIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxs
aWFyZDFAZ21haWwuY29tPiB3cm90ZToKCj4gQ09ORklHX01URF9QQVJUSVRJT05FRF9NQVNURVIg
Y29udHJvbHMgd2hldGhlciBhIG1hc3RlciBpcyByZWdpc3RlcmVkCj4gYWxvbmdzaWRlIGl0cyBw
YXJ0aXRpb25zLiBXaXRob3V0IHRoYXQgb3B0aW9uLCBhbiB1bnBhcnRpdGlvbmVkIGRldmljZQo+
IGlzIHN0aWxsIHJlZ2lzdGVyZWQgYXMgYSBtYXN0ZXIgYW5kIGNhbiBiZSBvcGVuZWQgZGlyZWN0
bHkuCgoiY2FuIGJlIG9wZW5lZCBkaXJlY3RseSIKCj4gX19nZXRfbXRkX2RldmljZSgpIHNraXBz
IHRoZSBtYXN0ZXIgd2hpbGUgd2Fsa2luZyB0aGUgcGFyZW50IGNoYWluIGFuZAo+IG9ubHkgdGFr
ZXMgaXRzIHJlZmVyZW5jZSB3aGVuIENPTkZJR19NVERfUEFSVElUSU9ORURfTUFTVEVSIGlzIGVu
YWJsZWQuCj4gQSBkaXJlY3Qgb3BlbiB0aGVyZWZvcmUgbGVhdmVzIHRoZSByZWdpc3RyYXRpb24g
cmVmZXJlbmNlIGFzIHRoZSBzb2xlCj4gcmVmZXJlbmNlLiBVbnJlZ2lzdGVyaW5nIHRoZSBkZXZp
Y2UgcmVsZWFzZXMgaXRzIGRldmljZS1tb2RlbCBhbmQKPiBOVk1FTQoKInJlbGVhc2VzIGl0cyBk
ZXZpY2UtbW9kZWwiCgo+IHN0YXRlIHdoaWxlIHRoZSBoYW5kbGUgcmVtYWlucyBvcGVuLgo+Cj4g
VGFrZSBhbmQgcmVsZWFzZSB0aGUgbWFzdGVyIHJlZmVyZW5jZSBmb3IgZGlyZWN0IG9wZW5zIGFz
IHdlbGwuIFJldGFpbgogPiB0aGUgZXhpc3RpbmcgYmVoYXZpb3IgZm9yIHBhcnRpdGlvbiBoYW5k
bGVzIHdob3NlIG1hc3RlciBpcyBub3QKPiByZWdpc3RlcmVkLgoKSXMgdGhpcyByZWFsbHkgd2hh
dCB5b3UgZG8/IFRoZSBjb2RlIGRvZXMgbm90IHRlc3Qgd2hldGhlciB0aGUKbWFzdGVyIGlzIHJl
Z2lzdGVyZWQuIFRoZSBjb25kaXRpb24gaXM6CgoJbXRkID09IG1hc3RlciB8fCBJU19FTkFCTEVE
KENPTkZJR19NVERfUEFSVElUSU9ORURfTUFTVEVSKQoKQXMgYSByZXN1bHQ6CgotIEEgaGFuZGxl
IG9uIHRoZSBtYXN0ZXIgdGFrZXMgYSBtYXN0ZXIgcmVmZXJlbmNlLgotIEEgaGFuZGxlIG9uIGEg
cGFydGl0aW9uIHRha2VzIGEgbWFzdGVyIHJlZmVyZW5jZSBvbmx5IHdoZW4KICBDT05GSUdfTVRE
X1BBUlRJVElPTkVEX01BU1RFUiBpcyBlbmFibGVkLgoKTm8/IEkgYmVsaWV2ZSB0aGUgY29kZSBp
cyBjb3JyZWN0LCBidXQgdGhhdCdzIGFnYWluIG9uZSBvZiB0aG9zZSB2ZXJ5CmltcHJlY2lzZSBj
b21taXQgbG9ncyB3aGVyZSB3b3JkcyB0YWtlbiBpbmRlcGVuZGVudGx5IGFyZSBmaW5lIGJ1dCBw
dXQKYWxsdG9nZXRoZXIgZG9uJ3QgYnVpbGQgYW55IG1lYW5pbmdmdWwgbWVzc2FnZSBpbiBteSBi
cmFpbi4gTWF5YmU6CgogIEEgaGFuZGxlIG9uIHRoZSBtYXN0ZXIgbm93IHRha2VzIGEgbWFzdGVy
IHJlZmVyZW5jZS4gQSBoYW5kbGUgb24gYQogIHBhcnRpdGlvbiB0YWtlcyBhIG1hc3RlciByZWZl
cmVuY2Ugb25seSB3aGVuIENPTkZJR19NVERfUEFSVElUSU9ORURfTUFTVEVSCiAgaXMgZW5hYmxl
ZC4KCkluIGdlbmVyYWwgSSB0aGluayB0aGlzIGNvbW1pdCBsb2cgbXVzdCBiZSByZXdvcmRlZC4K
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
