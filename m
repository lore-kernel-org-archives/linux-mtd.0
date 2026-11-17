Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D255606A32A
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 16:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SNzmqzEx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zb8DXiWG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AKllLm08Jf5UiDx0eUhjI8BmakaEIsMKsyVl/JKtIcU=; b=SNzmqzEx+dnvosJzehuY/fPFA+
	BhAXHsUGiKlySjdV4R9tvJL6HFkB79s3o4iNaFYUkcmmXmqKBKjvb2Xrt8L2d+UvfHkJ7IThoyEIF
	pCLHb+bL4Uyx60FT9noS+JdUilTPHY0UOypCl84hxJEJDoCqVcOxH3MiSPQLbezzL/10JFj0QqbOB
	JYYNmsKIW4WsrClboIGdAX5UO8RXQjGBqMWspv/wu+mKdhucFFSYDVVQUsEcmrcJ0uB3SMUfPPQHs
	k2GUB8y2Bq4mcoZmgzveNjkCFwUT2uI9rvW3p4ErUkog2dihlAetHHTt9Lq0ORo1+v+te7VGjnxNX
	qEMU6U4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTM1a-00000006Q5x-2hVC;
	Tue, 17 Nov 2026 16:27:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTM1Z-00000006Q5r-2AmC
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 16:27:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1601B4173E;
	Tue, 17 Nov 2026 16:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B141F000C4;
	Tue, 17 Nov 2026 16:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794932832;
	bh=2E0XXPz4uMVoRJ2DIVcD1FueRe1ZIgjFKH/bKoEZQtY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zb8DXiWGjtgPUlhc50K5zliX93lmR3VHc4Cn04+HcDbogpLRBf3pbzJ241Bjbpdeg
	 dX5w1ZXW7T0fGyrYqfSeBLLU/wqc9HZoyhidhuZD8DRvazQPJsetcGvHvYgIR70hoy
	 S+r4FumfkZws+/bRg/8VipSHBU3/5NQ/aQlyos5vMO/VyFw28j+F6NzSkWoWG1vEpA
	 FspzKg34JnyNCNcKN85V1RpaMgt26o9DlhoWr3tBawo6GkoRo8Ctk4s1s+bj0i8NIz
	 3KEwwtWNHvlCsESvb90Dn89IOsDa8iVjGdXY+NRap/fMAzz1OLjOaHUYrOrZDH+uQB
	 Pv+KVRecyct4A==
Message-ID: <sashiko-outbox-219169@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: spinand: set request type explicitly in
 spinand_{is,mark}bad() functions
To: "Gabor Juhos" <j4g8y7@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Boris
 Brezillon" <boris.brezillon@collabora.com>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20261117-spinand-set-req-type-in-bbm-functions-v1-1-f46d5b3b8cf3@gmail.com>
References: <20261117-spinand-set-req-type-in-bbm-functions-v1-1-f46d5b3b8cf3@gmail.com>
Date: Tue, 17 Nov 2026 16:27:11 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
bm8gbmV3IGlzc3VlcwppbiB0aGlzIHBhdGNoLCBidXQgbm90aWNlZCAxIHJlbGF0ZWQgcHJlLWV4
aXN0aW5nIGlzc3VlIGl0IGRvZXMgbm90CmludHJvZHVjZToKLSBbQ3JpdGljYWxdIG10ZDogc3Bp
bmFuZDogMS1ieXRlIGJhZCBibG9jayBtYXJrZXIgb3ZlcmxhcCBpbgogIG9vYmxheW91dF9mcmVl
KCkgWzFdCi0tCgpjb21taXQgY2QzMTM2YTI4Y2FhNGM2NWQzNjBmNjY0MDg1Y2JiMWU2MzBhY2Iw
ZgpBdXRob3I6IEdhYm9yIEp1aG9zIDxqNGc4eTdAZ21haWwuY29tPgoKbXRkOiBzcGluYW5kOiBz
ZXQgcmVxdWVzdCB0eXBlIGV4cGxpY2l0bHkgaW4gc3BpbmFuZF97aXMsbWFya31iYWQoKSBmdW5j
dGlvbnMKClRoaXMgY29tbWl0IGV4cGxpY2l0bHkgc2V0cyByZXEudHlwZSB0byBOQU5EX1BBR0Vf
UkVBRCBpbiBzcGluYW5kX2lzYmFkKCkKYW5kIE5BTkRfUEFHRV9XUklURSBpbiBzcGluYW5kX21h
cmtiYWQoKS4KCkxpbms6IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9sb2cvMTkyMzgzCgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Nw
aS9jb3JlLmMKPiBpbmRleCAxOGJiYTAyZmJkMzFmLi4zNWJjYjRhODg2MWI0IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQv
c3BpL2NvcmUuYwo+IEBAIC0xMTA1LDYgKzExMDUsNyBAQCBzdGF0aWMgYm9vbCBzcGluYW5kX2lz
YmFkKHN0cnVjdCBuYW5kX2RldmljZSAqbmFuZCwgY29uc3Qgc3RydWN0IG5hbmRfcG9zICpwb3Mp
Cj4gIAlzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQgPSBuYW5kX3RvX3NwaW5hbmQobmFu
ZCk7Cj4gIAl1OCBtYXJrZXJbMl0gPSB7IH07Cj4gIAlzdHJ1Y3QgbmFuZF9wYWdlX2lvX3JlcSBy
ZXEgPSB7Cj4gKwkJLnR5cGUgPSBOQU5EX1BBR0VfUkVBRCwKPiAgCQkucG9zID0gKnBvcywKPiAg
CQkub29ibGVuID0gc2l6ZW9mKG1hcmtlciksCj4gIAkJLm9vYm9mZnMgPSAwLAoKW1NldmVyaXR5
OiBDcml0aWNhbF0KVGhpcyBwcm9ibGVtIHdhc24ndCBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gs
IGJ1dCBjYW4gdGhlIDItYnl0ZSBtYXJrZXJbXQpyZWFkIGluIHNwaW5hbmRfaXNiYWQoKSBbMV0g
Y29sbGlkZSB3aXRoIGZyZWUgT09CIHNwYWNlIG9uIGNoaXBzIHRoYXQKcmVzZXJ2ZSBvbmx5IDEg
Ynl0ZSBmb3IgdGhlIGJhZCBibG9jayBtYXJrZXI/CgpzcGluYW5kX2lzYmFkKCkgdHJlYXRzIGEg
YmxvY2sgYXMgYmFkIHdoZW5ldmVyIG1hcmtlclswXSAhPSAweGZmIHx8Cm1hcmtlclsxXSAhPSAw
eGZmLCByZWFkaW5nIE9PQiBvZmZzZXRzIDAgYW5kIDEuICBIb3dldmVyLCBzZXZlcmFsIHZlbmRv
cgpvb2JsYXlvdXRfZnJlZSgpIGNhbGxiYWNrcyBleHBvc2UgT09CIG9mZnNldCAxIGFzIGZyZWUg
c3BhY2U6Cgpkcml2ZXJzL210ZC9uYW5kL3NwaS9naWdhZGV2aWNlLmM6Z2Q1ZnhncTR4YV9vb2Js
YXlvdXRfZnJlZSgpIHsKCS4uLgoJfSBlbHNlIHsKCQkvKiBzZWN0aW9uIDAgaGFzIG9uZSBieXRl
IHJlc2VydmVkIGZvciBiYWQgYmxvY2sgbWFyayAqLwoJCXJlZ2lvbi0+b2Zmc2V0ID0gMTsKCQly
ZWdpb24tPmxlbmd0aCA9IDc7Cgl9Cn0KCldoZW4gYW4gdXBwZXIgbGF5ZXIgd3JpdGVzIE9PQiBk
YXRhIGludG8gdGhhdCBmcmVlIHJlZ2lvbiwgaXQgb3ZlcndyaXRlcwpPT0Igb2Zmc2V0IDEsIGNh
dXNpbmcgbGF0ZXIgc3BpbmFuZF9pc2JhZCgpIGNoZWNrcyB0byBmYWxzZWx5IHJlcG9ydCBnb29k
CmJsb2NrcyBhcyBiYWQuCgpbMV0gaHR0cHM6Ly9zYXNoaWtvLmRldi8jL2J1Zy9saW51eC02Zjg1
NTUxYS1kYTE0LTQzZDktOTFlYi04MDBkNjhiM2I5YzQKCi0tIApTYXNoaWtvIEFJIHJldmlldyDC
tyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMTctc3BpbmFuZC1zZXQtcmVx
LXR5cGUtaW4tYmJtLWZ1bmN0aW9ucy12MS0xLWY0NmQ1YjNiOGNmM0BnbWFpbC5jb20/cGFydD0x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
