Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FAA606A334
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 14:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W0kt4d44;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ny2sWYgn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=awM6oGkyB5rhEqbdNnJMtqHNQz7QTT57s4K93psa+vQ=; b=W0kt4d44qRu07iVXMk3kVujJ/k
	HKj+GIaw8QifbGIkmDfjCAEQ6DK5AiFS5YJPtk3aHWpfC0P0GxaW3UWzDiI4thfRHEGmIkgHqGYph
	4o25+3E4y7hfGBumlG1Na42t1/aHL7Fv0pWUrHccSdHVtCLxnKNtACijz4RyZLmSwWgG8pfnLC53t
	w6gsWgZFqlLmDbDrNHtLibwpnk35F/TT2/Vu3xg3eczExztpNgzkacT6INTB79UywiW7OV0aSB+0K
	1QW9PYQdf6qd16ESIELAtnzqWbiAOCY7vByh6X63x8jtidpISg9Yr33fPN5EAkVN1G+iUcTre5xsV
	34jbQlLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPoz-0000000FI3R-0H27;
	Fri, 20 Nov 2026 14:42:37 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPor-0000000FHvm-134w;
	Fri, 20 Nov 2026 14:42:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 150D91A1735;
	Fri, 20 Nov 2026 14:42:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DDB99601B9;
	Fri, 20 Nov 2026 14:42:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F0D8C11BC0232;
	Fri, 20 Nov 2026 15:42:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795185740; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qbd+z81NWcBJ3UbzNi7GzHSjiR7on5yG5EEeouAnung=;
	b=ny2sWYgnB0zcWHeFXhqxhDIAWQ/uV1VQzEEqCRq0frSEgIqGk0A/Gnr16gKIM/7MkE8G3Y
	Dj81WUujkTgIygPti1bkzTol8TEO6lCcIikzANbIIz9JsdQguQvKy+ZskThQzoVvwiFImN
	ANv6xsoO9kd+7yRJvQmXW5XinY6o210rhfzz1pDFd1wbNowGtBfLLgcifRK1mXcQ57HSSE
	W+CrBat6FC4flKNMgU5QC43LywpdbagUOGBJVu+eQhirnHhKXtfyTU6I4iJWgHXVY94oMC
	E6BVwAjHuXZOYLo00D9sQDoL4Queg25DHL5gvFaP98HIwXURNSC9YxMG30bvxA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Boris Brezillon <bbrezillon@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: atmel: release the NFC IRQ before
 controller cleanup
In-Reply-To: <20261108-submit-atmel-nand-irq-teardown-v1-v1-1-341643c83ee3@gmail.com>
	(James Hilliard's message of "Sun, 08 Nov 2026 14:07:31 -0700")
References: <20261108-submit-atmel-nand-irq-teardown-v1-v1-1-341643c83ee3@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 20 Nov 2026 15:42:16 +0100
Message-ID: <87tslba7jr.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_064229_467063_AF20AD6E 
X-CRM114-Status: GOOD (  16.31  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMDgvMTEvMjAyNiBhdCAxNDowNzozMSAtMDcsIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxs
aWFyZDFAZ21haWwuY29tPiB3cm90ZToKCj4gVGhlIE5GQyBpbnRlcnJ1cHQgaXMgc2hhcmVkIGFu
ZCBkZXZtLW1hbmFnZWQuIENvbnRyb2xsZXIgcmVtb3ZhbCBkaXNhYmxlcwo+IHRoZSBjbG9jayB1
c2VkIGJ5IHRoZSBsZWdhY3kgYmluZGluZyBiZWZvcmUgZGV2cmVzIHJlbGVhc2VzIHRoZSBoYW5k
bGVyLgo+IEFuIGludGVycnVwdCBmcm9tIGFub3RoZXIgZGV2aWNlIG9uIHRoZSBzaGFyZWQgbGlu
ZSBjYW4gdGhlcmVmb3JlIG1ha2UKPiBhdG1lbF9uZmNfaW50ZXJydXB0KCkgcmVhZCB0aGUgTkZD
IHN0YXR1cyB3aXRoIGl0cyBjbG9jayBkaXNhYmxlZC4KPgo+IFJlbGVhc2UgYW5kIGRyYWluIHRo
ZSBoYW5kbGVyIGJlZm9yZSBmcmVlaW5nIHRoZSBjb250cm9sbGVyIHJlc291cmNlcy4KPiBUcmFj
ayBzdWNjZXNzZnVsIElSUSByZWdpc3RyYXRpb24gYmVjYXVzZSBwcm9iZSBhbHNvIHVzZXMgdGhp
cyBjbGVhbnVwCj4gcGF0aCB3aGVuIHJlcXVlc3RpbmcgdGhlIElSUSBpdHNlbGYgZmFpbHMuCj4K
PiBGaXhlczogZjg4ZmMxMjJjYzM0ICgibXRkOiBuYW5kOiBDbGVhbnVwL3Jld29yayB0aGUgYXRt
ZWxfbmFuZCBkcml2ZXIiKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9m
Zi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvbXRkL25hbmQvcmF3L2F0bWVsL25hbmQtY29udHJvbGxlci5jIHwgNiArKysrKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL25hbmQvcmF3L2F0bWVsL25hbmQtY29udHJvbGxlci5jIGIvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvYXRtZWwvbmFuZC1jb250cm9sbGVyLmMKPiBpbmRleCAwYmRiY2JiNTBkOTQuLjlhNzI0
ZGU2NzYyNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNv
bnRyb2xsZXIuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2F0bWVsL25hbmQtY29udHJv
bGxlci5jCj4gQEAgLTI2Myw2ICsyNjMsNyBAQCBzdHJ1Y3QgYXRtZWxfaHNtY19uYW5kX2NvbnRy
b2xsZXIgewo+ICAJc3RydWN0IGNvbXBsZXRpb24gY29tcGxldGU7Cj4gIAl1MzIgY2ZnOwo+ICAJ
aW50IGlycTsKPiArCWJvb2wgaXJxX3JlcXVlc3RlZDsKPiAgCj4gIAkvKiBPbmx5IHVzZWQgd2hl
biBpbnN0YW50aWF0aW5nIGZyb20gbGVnYWN5IERUIGJpbmRpbmdzLiAqLwo+ICAJc3RydWN0IGNs
ayAqY2xrOwo+IEBAIC0yMzM0LDYgKzIzMzUsOSBAQCBhdG1lbF9oc21jX25hbmRfY29udHJvbGxl
cl9yZW1vdmUoc3RydWN0IGF0bWVsX25hbmRfY29udHJvbGxlciAqbmMpCj4gIAlyZWdtYXBfd3Jp
dGUoaHNtY19uYy0+YmFzZS5zbWMsIEFUTUVMX0hTTUNfTkZDX0NUUkwsCj4gIAkJICAgICBBVE1F
TF9IU01DX05GQ19DVFJMX0RJUyk7Cj4gIAo+ICsJaWYgKGhzbWNfbmMtPmlycV9yZXF1ZXN0ZWQp
Cj4gKwkJZGV2bV9mcmVlX2lycShuYy0+ZGV2LCBoc21jX25jLT5pcnEsIGhzbWNfbmMpOwo+ICsK
ClRoYXQncyBhIHRlcnJpYmxlIGFwcHJvYWNoLCBjb21wbGV0ZWx5IGRlZmVhdGluZyB0aGUgbWFp
biBwdXJwb3NlIG9mCmRldnJlcy4KCllvdXIgcHJvYmxlbSBpcyBhIGRldnJlcyBvcmRlcmluZy4g
VGhlIGZpeCBzaG91bGQgYmUgYnkgdGVhY2hpbmcgZGV2cmVzCnRoZSByaWdodCBvcmRlciBpbnN0
ZWFkIG9mIG9wZW4gY29kaW5nIHRoZSBmaXguIFNvIHlvdSBuZWVkIGEKKioqX2Nsa19jbGVhbnVw
KCkgaGVscGVyIHdoaWNoIGRvZXM6CgoJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKG5jLT5jbGspOwoJ
Y2xrX3B1dChuYy0+Y2xrKTsKCmFuZCB5b3Ugd2FudCB0byByZWdpc3RlciBpdCBiZWZvcmUgdGhl
IElSUSByZXF1ZXN0IHNvIGl0IGlzIHRyaWdnZXJlZAphZnRlcjoKCiAgICAgICAgZGV2bV9hZGRf
YWN0aW9uX29yX3Jlc2V0KGRldiwgKioqX2Nsa19jbGVhbnVwLCAuLi4pOwoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
