Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AB6C76196
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tyc0TqHf6ciWdvrk7NuabAxEsvciGVUnnIId9pTZFFE=; b=OMhSTYHB+IznVM
	hk94dmN1Yb2+p3KCEBWuyH698O034mWNueWxGgVQZe032tgaQygE7HgnIlLxqxNYUuXm0kINYG9Wr
	Qj7SfITRYUNX/ydI3ePMt94QKXpbBhx5P3dHryZwtirtTBKL7HXt5RZlYLCVcd676WAnDgo1d9ZWk
	EChAHHjPuoue336KfhWUhoGAsOKs6dVsXo1S7creVeMRBSDejkOnfq1fK1GJYwSseKQfVkCTguiXu
	b6431yPIEVTe968rTXSIgH11ofYDh7AN3Vde5rnB3muvl5AmYKWONpmrfSBAokbnZZXeDKt07/Xya
	+1wXGaxgbHmZU/htAwIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pieJt-00Ayz2-0Z;
	Sat, 01 Apr 2023 16:43:13 +0000
Received: from aposti.net ([89.234.176.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pieJp-00AywM-2X
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:43:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1680367380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DpC9ja8ZjcM0PGp3q1FiYBDPbTV8D7zSOCUb5nWLYpQ=;
	b=KmMFq6MU062Tgk9+AezWZ27EdZcHaz6UIVoi/GMwcsbqJe/j2qnGrNvIhJqJPlA+PtGOcW
	5lbvncVyCM7FRCLtSkpNfq8UmZOt/SoZdNZQwyLrLfjL5yt9ohYdVxq9A9OKayfqGyUgX4
	iY3kcKXkXa5unPeF0mP4+g8MIiJJ8Hg=
Message-ID: <2d7eb6bfd53a9cbf587a2cec53490b70a6ffeee4.camel@crapouillou.net>
Subject: Re: [PATCH 20/49] mtd: rawnand: ingenic: Convert to platform remove
 callback returning void
From: Paul Cercueil <paul@crapouillou.net>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, 
	linux-mips@vger.kernel.org, kernel@pengutronix.de
Date: Sat, 01 Apr 2023 18:42:59 +0200
In-Reply-To: <20230401161938.2503204-21-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
	 <20230401161938.2503204-21-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_094309_997404_CE9354F3 
X-CRM114-Status: GOOD (  17.80  )
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

TGUgc2FtZWRpIDAxIGF2cmlsIDIwMjMgw6AgMTg6MTkgKzAyMDAsIFV3ZSBLbGVpbmUtS8O2bmln
IGEgw6ljcml0wqA6Cj4gVGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2
ZXIgcmV0dXJucyBhbiBpbnQgd2hpY2gKPiBtYWtlcwo+IG1hbnkgZHJpdmVyIGF1dGhvcnMgd3Jv
bmdseSBhc3N1bWUgaXQncyBwb3NzaWJsZSB0byBkbyBlcnJvciBoYW5kbGluZwo+IGJ5Cj4gcmV0
dXJuaW5nIGFuIGVycm9yIGNvZGUuIEhvd2V2ZXIgdGhlIHZhbHVlIHJldHVybmVkIGlzIChtb3N0
bHkpCj4gaWdub3JlZAo+IGFuZCB0aGlzIHR5cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxl
YWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUKPiBpcyBhCj4gcXVlc3QgdG8gbWFrZSB0aGUgcmVt
b3ZlIGNhbGxiYWNrIHJldHVybiB2b2lkLiBJbiB0aGUgZmlyc3Qgc3RlcCBvZgo+IHRoaXMKPiBx
dWVzdCBhbGwgZHJpdmVycyBhcmUgY29udmVydGVkIHRvIC5yZW1vdmVfbmV3KCkgd2hpY2ggYWxy
ZWFkeQo+IHJldHVybnMKPiB2b2lkLgo+IAo+IFRyaXZpYWxseSBjb252ZXJ0IHRoaXMgZHJpdmVy
IGZyb20gYWx3YXlzIHJldHVybmluZyB6ZXJvIGluIHRoZQo+IHJlbW92ZQo+IGNhbGxiYWNrIHRv
IHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVp
bmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+CgpSZXZpZXdlZC1ieTog
UGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+CgpDaGVlcnMsCi1QYXVsCgo+IC0t
LQo+IMKgZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9pbmdlbmljX25hbmRfZHJ2LmMgfCA2
ICsrLS0tLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9pbmdlbmlj
X25hbmRfZHJ2LmMKPiBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2luZ2VuaWMvaW5nZW5pY19uYW5k
X2Rydi5jCj4gaW5kZXggZmYyNmMxMGYyOTVkLi5iOWYxMzUyOTdhYTAgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9pbmdlbmljX25hbmRfZHJ2LmMKPiArKysgYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfbmFuZF9kcnYuYwo+IEBAIC01MjIs
NyArNTIyLDcgQEAgc3RhdGljIGludCBpbmdlbmljX25hbmRfcHJvYmUoc3RydWN0Cj4gcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiDCoH0KPiDCoAo+
IC1zdGF0aWMgaW50IGluZ2VuaWNfbmFuZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPiArc3RhdGljIHZvaWQgaW5nZW5pY19uYW5kX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQo+IMKgewo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgaW5nZW5pY19uZmMg
Km5mYyA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwo+IMKgCj4gQEAgLTUzMCw4ICs1MzAs
NiBAQCBzdGF0aWMgaW50IGluZ2VuaWNfbmFuZF9yZW1vdmUoc3RydWN0Cj4gcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW5nZW5pY19lY2Nf
cmVsZWFzZShuZmMtPmVjYyk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgaW5nZW5pY19uYW5kX2Ns
ZWFudXBfY2hpcHMobmZjKTsKPiAtCj4gLcKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gwqB9Cj4g
wqAKPiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3Qganpfc29jX2luZm8gano0NzQwX3NvY19pbmZvID0g
ewo+IEBAIC01NjQsNyArNTYyLDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgaW5nZW5pY19u
YW5kX2R0X21hdGNoKTsKPiDCoAo+IMKgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgaW5n
ZW5pY19uYW5kX2RyaXZlciA9IHsKPiDCoMKgwqDCoMKgwqDCoMKgLnByb2JlwqDCoMKgwqDCoMKg
wqDCoMKgwqA9IGluZ2VuaWNfbmFuZF9wcm9iZSwKPiAtwqDCoMKgwqDCoMKgwqAucmVtb3ZlwqDC
oMKgwqDCoMKgwqDCoMKgPSBpbmdlbmljX25hbmRfcmVtb3ZlLAo+ICvCoMKgwqDCoMKgwqDCoC5y
ZW1vdmVfbmV3wqDCoMKgwqDCoD0gaW5nZW5pY19uYW5kX3JlbW92ZSwKPiDCoMKgwqDCoMKgwqDC
oMKgLmRyaXZlcsKgPSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAubmFtZcKg
wqDCoD0gRFJWX05BTUUsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAub2ZfbWF0
Y2hfdGFibGUgPSBpbmdlbmljX25hbmRfZHRfbWF0Y2gsCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
