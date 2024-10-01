Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2ADCE7D05
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Oct 2024 10:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=udZkukceMZqN6/hyoBH8ompWXZYFdAGXT2MG41yM0UM=; b=EcziE7p9L0YAfZ
	s5+kFl71W/DDKCAeHi+0g0YFmU/mYvt4kI4oECgkCZ17pyxn1R0Kt9T8uwFfVfup9Kxave9jNfPSF
	tT1w9/mXde82pGEGu8QZJk8x+hnHbZa+G0ybJ32H0yuUwmCQOX/Lgk82k2/WF3PbUfR2tkpseABj4
	tfjDr8DDT9PdDpCS0fUbsdXGLMFnOjJxjSPTLYhxCEqpLzAIsdPYOJJWnTcXPKZOSxseFcQMt+rhg
	v0M/bTSMq8gKsqSp+QoPuQ22o7P+OLc5cpE1Jnoil9FkT3PLYTufT/Hpv9xPS5l8P6s4OrUiPvqhS
	DnuBdkJZ/zyH7tMFBDmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svZwh-00000002KGl-1y5b;
	Tue, 01 Oct 2024 10:17:31 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svZwe-00000002KGF-0YHv
	for linux-mtd@lists.infradead.org;
	Tue, 01 Oct 2024 10:17:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB755C0005;
	Tue,  1 Oct 2024 10:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727777845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nzlKtMlNbWoB+9nbUO2l1PKIgrmDbUGSSNNWpNY2W8k=;
	b=fi+shI2hhDTsgzZeDttStg0qgsb/l+MA8w3CYU5gBmiYGdstiOKv7a4wIoLqomFeuudCd5
	D0eL73e4legzoXxdIs6EzvFzgoqrKj2/iVAQo3v76LlTeYdTJ+13eEjVJBDUrbe53T85k1
	1otd+yD98h4bhMlALyD5p4Rd6eD4385z82nPgdErv24JxR67dEgvSLdAv6fJRbyIUAmtwD
	/BB35l1Zoeq65XSt1oRVXMC5Dpb3XL6qz/Tq5JtXK0rIEseEBE7Ow7GMYg769NFZUQYWsl
	/Fb9dtwR+71/6mxU2Hdy0cr1UdG+M8IjIH/kzsUjOj+zvINYk2UAT6c5Bx0faw==
Date: Tue, 1 Oct 2024 12:17:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw,
 leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH 2/2] mtd: spi-nand: Add read retry support
Message-ID: <20241001121724.5edbb64b@xps-13>
In-Reply-To: <20240905055333.2363358-3-linchengming884@gmail.com>
References: <20240905055333.2363358-1-linchengming884@gmail.com>
	<20240905055333.2363358-3-linchengming884@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_031728_653454_E3006F42 
X-CRM114-Status: GOOD (  23.58  )
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

SGkgQ2hlbmcgTWluZywKCmxpbmNoZW5nbWluZzg4NEBnbWFpbC5jb20gd3JvdGUgb24gVGh1LCAg
NSBTZXAgMjAyNCAxMzo1MzozMyArMDgwMDoKCj4gRnJvbTogQ2hlbmcgTWluZyBMaW4gPGNoZW5n
bWluZ2xpbkBteGljLmNvbS50dz4KPiAKPiBXaGVuIHRoZSBob3N0IEVDQyBmYWlscyB0byBjb3Jy
ZWN0IHRoZSBkYXRhIGVycm9yIG9mIE5BTkQgZGV2aWNlLAo+IHRoZXJlJ3MgYSBzcGVjaWFsIHJl
YWQgZm9yIGRhdGEgcmVjb3ZlcnkgbWV0aG9kIHdoaWNoIGhvc3Qgc2V0dXBzCj4gZm9yIHRoZSBu
ZXh0IHJlYWQgcmV0cnkgbW9kZSBhbmQgbWF5IHJlY292ZXIgdGhlIGxvc3QgZGF0YSBieSBob3N0
Cj4gRUNDIGFnYWluLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENoZW5nIE1pbmcgTGluIDxjaGVuZ21p
bmdsaW5AbXhpYy5jb20udHc+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyB8
IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MzEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvbmFuZC9zcGkvY29yZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4gaW5k
ZXggZTBiNjcxNWU1ZGZlLi4yZjIxZWE5MjYxMzIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQv
bmFuZC9zcGkvY29yZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4gQEAg
LTY0MCw2ICs2NDAsNyBAQCBzdGF0aWMgaW50IHNwaW5hbmRfbXRkX3JlYWQoc3RydWN0IG10ZF9p
bmZvICptdGQsIGxvZmZfdCBmcm9tLAo+ICAJc3RydWN0IG5hbmRfaW9faXRlciBpdGVyOwo+ICAJ
Ym9vbCBkaXNhYmxlX2VjYyA9IGZhbHNlOwo+ICAJYm9vbCBlY2NfZmFpbGVkID0gZmFsc2U7Cj4g
Kwl1OCByZXRyeV9tb2RlID0gMDsKPiAgCWludCByZXQgPSAwOwo+ICAKPiAgCWlmIChvcHMtPm1v
ZGUgPT0gTVREX09QU19SQVcgfHwgIXNwaW5hbmQtPmVjY2luZm8ub29ibGF5b3V0KQo+IEBAIC02
NTcsMjAgKzY1OCw0NSBAQCBzdGF0aWMgaW50IHNwaW5hbmRfbXRkX3JlYWQoc3RydWN0IG10ZF9p
bmZvICptdGQsIGxvZmZfdCBmcm9tLAoKVGhpcyB3aWxsIG5vIGxvbmdlciBhcHBseSB3aXRoIGNv
bnRpbnVvdXMgc3VwcG9ydCBhZGRlZCBpbi4gSG93ZXZlcgpwbGVhc2UgbWFrZSB0aGlzIG9ubHkg
aW4gdGhlIG5vbiBjb250aW51b3VzIHBhdGguIEkgZG9uJ3QgdGhpbmsgaXQgY2FuCmZseSBpbiB0
aGUgb3RoZXIuCgo+ICAJCWlmIChyZXQpCj4gIAkJCWJyZWFrOwo+ICAKPiArcmVhZF9yZXRyeToK
PiAgCQlyZXQgPSBzcGluYW5kX3JlYWRfcGFnZShzcGluYW5kLCAmaXRlci5yZXEpOwo+ICAJCWlm
IChyZXQgPCAwICYmIHJldCAhPSAtRUJBRE1TRykKPiAgCQkJYnJlYWs7Cj4gIAo+IC0JCWlmIChy
ZXQgPT0gLUVCQURNU0cpCj4gKwkJaWYgKHJldCA9PSAtRUJBRE1TRyAmJiBzcGluYW5kLT5pbmZv
LT5maXh1cHMpIHsKPiArCQkJaWYgKHNwaW5hbmQtPnJlYWRfcmV0cmllcyAmJiAoKHJldHJ5X21v
ZGUgKyAxKSA8IHNwaW5hbmQtPnJlYWRfcmV0cmllcykpIHsKCgkJCQkJCQkrK3JldHJ5X21vZGU/
Cj4gKwkJCQlyZXRyeV9tb2RlKys7CgpTbyB0aGlzIGNhbiBiZSBkcm9wcGVkLgoKPiArCQkJCXJl
dCA9IHNwaW5hbmQtPmluZm8tPmZpeHVwcy0+c2V0dXBfcmVhZF9yZXRyeShzcGluYW5kLCByZXRy
eV9tb2RlKTsKPiArCQkJCWlmIChyZXQgPCAwKQo+ICsJCQkJCWJyZWFrOwoKTm8sIHlvdSBuZWVk
IHRvIHNldCBlY2NfZmFpbGVkIGhlcmUuCgo+ICsKPiArCQkJCS8qIFJlc2V0IGVjY19zdGF0czsg
cmV0cnkgKi8KPiArCQkJCW10ZC0+ZWNjX3N0YXRzID0gb2xkX3N0YXRzOwo+ICsJCQkJZ290byBy
ZWFkX3JldHJ5Owo+ICsJCQl9IGVsc2Ugewo+ICsJCQkJLyogTm8gbW9yZSByZXRyeSBtb2Rlczsg
cmVhbCBmYWlsdXJlICovCj4gKwkJCQllY2NfZmFpbGVkID0gdHJ1ZTsKPiArCQkJfQo+ICsJCX0g
ZWxzZSBpZiAocmV0ID09IC1FQkFETVNHKSB7Cj4gIAkJCWVjY19mYWlsZWQgPSB0cnVlOwo+IC0J
CWVsc2UKPiArCQl9IGVsc2Ugewo+ICAJCQltYXhfYml0ZmxpcHMgPSBtYXhfdCh1bnNpZ25lZCBp
bnQsIG1heF9iaXRmbGlwcywgcmV0KTsKPiArCQl9Cj4gIAo+ICAJCXJldCA9IDA7Cj4gIAkJb3Bz
LT5yZXRsZW4gKz0gaXRlci5yZXEuZGF0YWxlbjsKPiAgCQlvcHMtPm9vYnJldGxlbiArPSBpdGVy
LnJlcS5vb2JsZW47Cj4gKwo+ICsJCS8qIFJlc2V0IHRvIHJldHJ5IG1vZGUgMCovCj4gKwkJaWYg
KHJldHJ5X21vZGUpIHsKCgkJCXJldHJ5X21vZGUgPSAwOwoKPiArCQkJcmV0ID0gc3BpbmFuZC0+
aW5mby0+Zml4dXBzLT5zZXR1cF9yZWFkX3JldHJ5KHNwaW5hbmQsIDApOwoKCQkJCQkJCQkJcmV0
cnlfbW9kZSk7Cgo+ICsJCQlpZiAocmV0IDwgMCkKPiArCQkJCWJyZWFrOwoKdGhpcyBpZiBjbGF1
c2UgaXMgdXNlbGVzcy4KCj4gKwkJCXJldHJ5X21vZGUgPSAwOwoKQW5kIHRoZW4gdGhpcyBjYW4g
YmUgZHJvcHBlZCBmcm9tIGhlcmUuCgo+ICsJCX0KPiAgCX0KPiAgCj4gKwoKU3B1cmlvdXMgbGlu
ZQoKPiAgCWlmIChvcHMtPnN0YXRzKSB7Cj4gIAkJb3BzLT5zdGF0cy0+dW5jb3JyZWN0YWJsZV9l
cnJvcnMgKz0KPiAgCQkJbXRkLT5lY2Nfc3RhdHMuZmFpbGVkIC0gb2xkX3N0YXRzLmZhaWxlZDsK
PiBAQCAtMTA5NSw2ICsxMTIxLDkgQEAgaW50IHNwaW5hbmRfbWF0Y2hfYW5kX2luaXQoc3RydWN0
IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLAo+ICAJCXNwaW5hbmQtPmZsYWdzID0gdGFibGVbaV0u
ZmxhZ3M7Cj4gIAkJc3BpbmFuZC0+aWQubGVuID0gMSArIHRhYmxlW2ldLmRldmlkLmxlbjsKPiAg
CQlzcGluYW5kLT5zZWxlY3RfdGFyZ2V0ID0gdGFibGVbaV0uc2VsZWN0X3RhcmdldDsKPiArCQlz
cGluYW5kLT5pbmZvID0gaW5mbzsKPiArCQlpZiAoc3BpbmFuZC0+aW5mby0+Zml4dXBzICYmIHNw
aW5hbmQtPmluZm8tPmZpeHVwcy0+aW5pdF9yZWFkX3JldHJ5KQo+ICsJCQlzcGluYW5kLT5yZWFk
X3JldHJpZXMgPSBzcGluYW5kLT5pbmZvLT5maXh1cHMtPmluaXRfcmVhZF9yZXRyeShzcGluYW5k
KTsKCk5vdyBJIGdldCB5b3UgaW5pdC4gT2ssIGZpbmUuCgo+ICAKPiAgCQlvcCA9IHNwaW5hbmRf
c2VsZWN0X29wX3ZhcmlhbnQoc3BpbmFuZCwKPiAgCQkJCQkgICAgICAgaW5mby0+b3BfdmFyaWFu
dHMucmVhZF9jYWNoZSk7CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
