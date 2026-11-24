Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E345606A327
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2026 14:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F8ENC9XB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=apShX2Xm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=t29Id4t7IqCFKqL7Zs0kPsQBUA/K3bnnCpR62AYSovk=; b=F8ENC9XB0d2bed6JZt/JjDAHR2
	GZLvpASphHj+rDNZIZQDkEkqtbC5ZuxLjD2DgjWlZLWNnrwLs5574VJo1epy2HG6Sf++lcavWbbwh
	GYIYTRcAGc0CW2Xo0uSOSmCYxhxgLopY63IEyqzc01OlrMg5KmYQK2fxZIAWUrUCLkU5+V93eQbJ5
	RBNzB7b9mB/xRAwIjgFbNdVGcrLM1PPOrCE2MCXgXQLA+CZEdzPdhXkBdidIO5B2/A7p8vG9qN2Sm
	T0m7GBEYAPJx6aJHiuvCgzkCtgnhaBA/83UESLcbR48gfcCt5YdLNviTyIJDgR9TmnCJOmJRIlwLc
	jdH2kE0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrvU-00000006pIE-1RCD;
	Tue, 24 Nov 2026 14:55:20 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrvQ-00000006pHs-2h78
	for linux-mtd@lists.infradead.org;
	Tue, 24 Nov 2026 14:55:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B90304E41762;
	Tue, 24 Nov 2026 14:55:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 829BC601E1;
	Tue, 24 Nov 2026 14:55:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5324011E682C5;
	Tue, 24 Nov 2026 15:55:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795532113; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=D+hSgyqO/o/m5Gc+8nN83BXmFEuYW3cQNIGgjao79ow=;
	b=apShX2XmOcZ8Y9rsgu2DhgLWhow7BGxZ29+aVKYkUNeIHDKVD3XOlDxcg1Ith9pI39a2YS
	ZluQ9EZWe/AYKBOZXTH46yvBn6BTO4WLbUHY4t2xntNdo0bN+V49DQdBZ5AOGi0hvUedXp
	GW/jYLMdoUrpseuB1nh5lRlkzZNlhhqALhCLXMTxBWvTMIsFmrWPKDUyJY+zU9siZCNKuR
	cwrCbSZTgUtScu+8x/nQIpFqb70a5GSK5RhCkJrsL6WaLOStVZlhq3w3Lk1XMewW9QE3Ol
	nj9vYqgUR1oUvqzADk1CkRKtjhAZpAf+XdLzByQ7yADRokS+3cWRLVM4hL+56g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Arseniy Krasnov <AVKrasnov@sberdevices.ru>,  Boris
 Brezillon <bbrezillon@kernel.org>,  Kyle Roeschley
 <kyle.roeschley@ni.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mtd: rawnand: macronix: serialize OTP access
 with NAND operations
In-Reply-To: <20261122-submit-rawnand-operation-locking-v1-v2-1-030bc867f0c7@gmail.com>
	(James Hilliard's message of "Sun, 22 Nov 2026 02:25:20 -0700")
References: <20261122-submit-rawnand-operation-locking-v1-v2-0-030bc867f0c7@gmail.com>
	<20261122-submit-rawnand-operation-locking-v1-v2-1-030bc867f0c7@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 24 Nov 2026 15:55:09 +0100
Message-ID: <87a4mys2ia.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_065517_406969_46E0E561 
X-CRM114-Status: GOOD (  15.08  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Cj4gT1RQIEkvTyBjYW4gYWxzbyBydW4gd2hpbGUgdGhlIGNoaXAgaXMgc3VzcGVuZGVkLgoKUmVh
bGx5PyBXaGVyZSBkb2VzIHRoYXQgY29tZSBmcm9tPwoKWy4uLl0KCj4gLS0tIGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5k
X2Jhc2UuYwo+IEBAIC0yMDcsNyArMjA3LDcgQEAgRVhQT1JUX1NZTUJPTF9HUEwobmFuZF9kZXNl
bGVjdF90YXJnZXQpOwo+ICAgKgo+ICAgKiBSZWxlYXNlIGNoaXAgbG9jayBhbmQgd2FrZSB1cCBh
bnlvbmUgd2FpdGluZyBvbiB0aGUgZGV2aWNlLgo+ICAgKi8KPiAtc3RhdGljIHZvaWQgbmFuZF9y
ZWxlYXNlX2RldmljZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+ICt2b2lkIG5hbmRfcmVsZWFz
ZV9kZXZpY2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKCllvdSBleHBvcnQgYSBjb3JlIGhlbHBl
ci4uLgoKPiAgewo+ICAJLyogUmVsZWFzZSB0aGUgY29udHJvbGxlciBhbmQgdGhlIGNoaXAgKi8K
PiAgCW11dGV4X3VubG9jaygmY2hpcC0+Y29udHJvbGxlci0+bG9jayk7Cj4gQEAgLTMzNiw3ICsz
MzYsNyBAQCBzdGF0aWMgaW50IG5hbmRfaXNiYWRfYmJtKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAs
IGxvZmZfdCBvZnMpCj4gICAqCj4gICAqIExvY2sgdGhlIGRldmljZSBhbmQgaXRzIGNvbnRyb2xs
ZXIgZm9yIGV4Y2x1c2l2ZSBhY2Nlc3MKPiAgICovCj4gLXN0YXRpYyB2b2lkIG5hbmRfZ2V0X2Rl
dmljZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+ICt2b2lkIG5hbmRfZ2V0X2RldmljZShzdHJ1
Y3QgbmFuZF9jaGlwICpjaGlwKQo+ICB7Cj4gIAkvKiBXYWl0IHVudGlsIHRoZSBkZXZpY2UgaXMg
cmVzdW1lZC4gKi8KPiAgCXdoaWxlICgxKSB7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25h
bmQvcmF3L25hbmRfbWFjcm9uaXguYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWFjcm9u
aXguYwo+IGluZGV4IDE2ODQ3ZjI4YjE5ZC4uZDdmNWE5ZTdjMjQwIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWFjcm9uaXguYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L25hbmRfbWFjcm9uaXguYwo+IEBAIC0zODAsNiArMzgwLDcgQEAgc3RhdGljIGludCBf
X21hY3Jvbml4XzMwbGZ4ZzE4YWNfcndfb3RwKHN0cnVjdCBtdGRfaW5mbyAqbXRkLAo+ICAJaW50
IHJldCwgY2xlYW51cF9yZXQ7Cj4gIAo+ICAJbmFuZCA9IG10ZF90b19uYW5kKG10ZCk7Cj4gKwlu
YW5kX2dldF9kZXZpY2UobmFuZCk7CgouLi5hbmQgeW91IHVzZSBpdCBhY3Jvc3MgdGhlIGVudGly
ZSBPVFAgb3BlcmF0aW9uLi4uCgo+ICAJbmFuZF9zZWxlY3RfdGFyZ2V0KG5hbmQsIDApOwo+ICAK
PiAgCXJldCA9IG1hY3Jvbml4XzMwbGZ4ZzE4YWNfb3RwX2VuYWJsZShuYW5kKTsKPiBAQCAtNDI2
LDYgKzQyNyw3IEBAIHN0YXRpYyBpbnQgX19tYWNyb25peF8zMGxmeGcxOGFjX3J3X290cChzdHJ1
Y3QgbXRkX2luZm8gKm10ZCwKPiAgCQkJd3JpdGUgPyAid3JpdGUiIDogInJlYWQiKTsKPiAgCj4g
IAluYW5kX2Rlc2VsZWN0X3RhcmdldChuYW5kKTsKPiArCW5hbmRfcmVsZWFzZV9kZXZpY2UobmFu
ZCk7Cj4gIAo+ICAJcmV0dXJuIHJldCA/IHJldCA6IGNsZWFudXBfcmV0Owo+ICB9CgouLi5hbmQg
aW4gdGhlIGNvbW1pdCBsb2cgeW91IG1lbnRpb246Cgo+IE1ha2UgdGhlIGV4aXN0aW5nIE5BTkQg
c2VyaWFsaXphdGlvbiBoZWxwZXJzIGF2YWlsYWJsZSB3aXRoaW4gdGhlIHJhdwo+IE5BTkQgY29y
ZSBhbmQgaG9sZCB0aGVtIGFjcm9zcyB0aGUgZW50aXJlIE9UUCB0cmFuc2FjdGlvbgoKV2h5IGFy
ZSB5b3UgZG9pbmcgdGhlIHNlcmlhbGl6YXRpb24gaW4gb25lIHZlbmRvciBkcml2ZXIgdGhlbj8g
QXJlbid0CmFsbCB0aGUgdmVuZG9ycyBhZmZlY3RlZCBieSB0aGUgZXhhY3Qgc2FtZSBpc3N1ZT8g
V2h5IGlzbid0IHRha2luZyB0aGUKbG9jayBvbmNlIGZvciBhbGwgaW4gdGhlIGNvcmUgYSBiZXR0
ZXIgaWRlYT8KCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
