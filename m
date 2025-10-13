Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B743FCCD18C
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Oct 2025 12:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WRc10JNkQyEPslXRqcD07M0zRJPRM8+ojILMEgsoQnQ=; b=kxPvh34nGXqhDz
	PNiMuTXvpu7EZebsClnFALtDJkF59xLTJGQZAEPyVZQA3UMFDohacM7Cd9Deg3mdsrzrzqAxEy58V
	Fjgn/WhRQ23IyZoOR97LgN1QH5tvcSsPX+e7Xgj5mloKt25FjH+NPGGumdvz97UmFgm1ACN3h3fcl
	GFqVEwoUSENGV9LYk6QN8wsU5WVjIR9SUyu4c8oq5uAx4wntegeL8RezwwZoRl58y1sD6dc23n/mE
	Uq294ussWWtwuNd06+ziw/MpkQ7BnBBE6ik2gk0E2yAfZmoBajGhGevzIcKFsJDSSmeScCpP31yab
	zAD/a9ZIGXTPLe3rMtdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8HE3-0000000D4GV-3r4v;
	Mon, 13 Oct 2025 12:00:27 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8HE0-0000000D4Du-3Pib
	for linux-mtd@lists.infradead.org;
	Mon, 13 Oct 2025 12:00:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 64F211A133A;
	Mon, 13 Oct 2025 12:00:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3AAB3606C6;
	Mon, 13 Oct 2025 12:00:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 820F8102F2263;
	Mon, 13 Oct 2025 14:00:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760356822; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=KEly2LZ/ci8gWOTL9VFmSwxUpRyknITeUsfSdfjGXWc=;
	b=PON+IrG2YZZ0AQmxmKPBPmPxWfanJoZDq1KF1fXAZ8TfV8PpVQIGisX1y8TfAvY9gmI00e
	1hsO9q5JUnDEZCuZiuOCJp28t26rxy196nvxKtuakWafldeVBVvQQ3oFlQCX9qIAUqANJC
	Juiq/PGau5tF2xD6qVCMuSG3FwE12oRqWxGIVu+44H8BSvMP6zyZf/LLk4T4Ka3iGLn6tK
	VBfZW5GkpbLCGzuqn8+YDdKV+WRYnnY45i8BJE20v+q7Bji934nQRuhni+s/qpslGpt6aV
	bpfT95+bUr9rBci+SfTQn52zqQegF+LBMCb8z83UstmxzOACvRNPwn4u4Mp6kQ==
Message-ID: <7add8d87-0909-45f2-973c-299d86e26d58@bootlin.com>
Date: Mon, 13 Oct 2025 14:00:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] mtd: nand: sunxi: move ecc strenghts in
 sunxi_nfc_caps
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
 <20251010084042.341224-5-richard.genoud@bootlin.com>
 <13861163.uLZWGnKmhe@jernej-laptop>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <13861163.uLZWGnKmhe@jernej-laptop>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_050025_035352_898176F0 
X-CRM114-Status: GOOD (  18.28  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TGUgMTEvMTAvMjAyNSDDoCAxMjo0MSwgSmVybmVqIMWga3JhYmVjIGEgw6ljcml0wqA6Cj4gSGkh
Cj4gCj4gRG5lIHBldGVrLCAxMC4gb2t0b2JlciAyMDI1IG9iIDEwOjQwOjMxIFNyZWRuamVldnJv
cHNraSBwb2xldG5pIMSNYXMgamUgUmljaGFyZCBHZW5vdWQgbmFwaXNhbChhKToKPj4gSDYvSDYx
NiBoYXMgbW9yZSBlY2Mgc3RyZW5naHRzLgo+PiBUaGlzIGNvbW1pdCBwcmVwYXJlcyB0aGUgY2hh
bmdlLgo+PiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPiAKPiBGb3JtYXQgbG9va3Mgd2VpcmQuIFJl
d29yZCBtZXNzYWdlIHRvIHNvbWV0aGluZyBsaWtlIG1vdmluZyBlY2MgdG8gY2FwcyB3aGljaAo+
IHdpbGwgYWxsb3cgZXhwYW5kIHN1cHBvcnQgZm9yIG5ld2VyIGNvcmVzLgo+IAo+IEFsc28sIHRo
ZXJlIHNob3VsZCBiZSBlbXB0eSBsaW5lIGJlZm9yZSAiTm8gZnVuY3Rpb25hbCBjaGFuZ2UuIgoK
SSdsbCByZXdvcmQgdGhhdAoKVGhhbmtzIQoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gSmVybmVqCj4g
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgR2Vub3VkIDxyaWNoYXJkLmdlbm91ZEBib290
bGluLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jIHwg
MjAgKysrKysrKysrKysrKysrKy0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L3N1bnhpX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYwo+PiBp
bmRleCAxMGE0OGUwZDM2MWYuLjE5OGRkNDBmOTIyMCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N1
bnhpX25hbmQuYwo+PiBAQCAtMjEzLDExICsyMTMsMTUgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3Qg
c3VueGlfbmFuZF9jaGlwICp0b19zdW54aV9uYW5kKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQpCj4+
ICAgICoJCQl0aHJvdWdoIE1CVVMgb24gQTIzL0EzMyBuZWVkcyBleHRyYSBjb25maWd1cmF0aW9u
Lgo+PiAgICAqIEByZWdfaW9fZGF0YToJSS9PIGRhdGEgcmVnaXN0ZXIKPj4gICAgKiBAZG1hX21h
eGJ1cnN0OglETUEgbWF4YnVyc3QKPj4gKyAqIEBlY2Nfc3RyZW5ndGhzOglBdmFpbGFibGUgRUND
IHN0cmVuZ3RocyBhcnJheQo+PiArICogQG5zdHJlbmd0aHM6CQlTaXplIG9mIEBlY2Nfc3RyZW5n
dGhzCj4+ICAgICovCj4+ICAgc3RydWN0IHN1bnhpX25mY19jYXBzIHsKPj4gICAJYm9vbCBoYXNf
bWRtYTsKPj4gICAJdW5zaWduZWQgaW50IHJlZ19pb19kYXRhOwo+PiAgIAl1bnNpZ25lZCBpbnQg
ZG1hX21heGJ1cnN0Owo+PiArCWNvbnN0IHU4ICplY2Nfc3RyZW5ndGhzOwo+PiArCXVuc2lnbmVk
IGludCBuc3RyZW5ndGhzOwo+PiAgIH07Cj4+ICAgCj4+ICAgLyoqCj4+IEBAIC0xNjE5LDkgKzE2
MjMsOSBAQCBzdGF0aWMgaW50IHN1bnhpX25hbmRfaHdfZWNjX2N0cmxfaW5pdChzdHJ1Y3QgbmFu
ZF9jaGlwICpuYW5kLAo+PiAgIAkJCQkgICAgICAgc3RydWN0IG5hbmRfZWNjX2N0cmwgKmVjYywK
Pj4gICAJCQkJICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCj4+ICAgewo+PiAtCXN0YXRp
YyBjb25zdCB1OCBzdHJlbmd0aHNbXSA9IHsgMTYsIDI0LCAyOCwgMzIsIDQwLCA0OCwgNTYsIDYw
LCA2NCB9Owo+PiAgIAlzdHJ1Y3Qgc3VueGlfbmFuZF9jaGlwICpzdW54aV9uYW5kID0gdG9fc3Vu
eGlfbmFuZChuYW5kKTsKPj4gICAJc3RydWN0IHN1bnhpX25mYyAqbmZjID0gdG9fc3VueGlfbmZj
KG5hbmQtPmNvbnRyb2xsZXIpOwo+PiArCWNvbnN0IHU4ICpzdHJlbmd0aHMgPSBuZmMtPmNhcHMt
PmVjY19zdHJlbmd0aHM7Cj4+ICAgCXN0cnVjdCBtdGRfaW5mbyAqbXRkID0gbmFuZF90b19tdGQo
bmFuZCk7Cj4+ICAgCXN0cnVjdCBuYW5kX2RldmljZSAqbmFuZGRldiA9IG10ZF90b19uYW5kZGV2
KG10ZCk7Cj4+ICAgCWludCBuc2VjdG9yczsKPj4gQEAgLTE2NDUsNyArMTY0OSw3IEBAIHN0YXRp
YyBpbnQgc3VueGlfbmFuZF9od19lY2NfY3RybF9pbml0KHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQs
Cj4+ICAgCj4+ICAgCQllY2MtPnN0cmVuZ3RoID0gYnl0ZXMgKiA4IC8gZmxzKDggKiBlY2MtPnNp
emUpOwo+PiAgIAo+PiAtCQlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShzdHJlbmd0aHMpOyBp
KyspIHsKPj4gKwkJZm9yIChpID0gMDsgaSA8IG5mYy0+Y2Fwcy0+bnN0cmVuZ3RoczsgaSsrKSB7
Cj4+ICAgCQkJaWYgKHN0cmVuZ3Roc1tpXSA+IGVjYy0+c3RyZW5ndGgpCj4+ICAgCQkJCWJyZWFr
Owo+PiAgIAkJfQo+PiBAQCAtMTY2Niw3ICsxNjcwLDcgQEAgc3RhdGljIGludCBzdW54aV9uYW5k
X2h3X2VjY19jdHJsX2luaXQoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwKPj4gICAJfQo+PiAgIAo+
PiAgIAkvKiBBZGQgRUNDIGluZm8gcmV0cmlldmFsIGZyb20gRFQgKi8KPj4gLQlmb3IgKGkgPSAw
OyBpIDwgQVJSQVlfU0laRShzdHJlbmd0aHMpOyBpKyspIHsKPj4gKwlmb3IgKGkgPSAwOyBpIDwg
bmZjLT5jYXBzLT5uc3RyZW5ndGhzOyBpKyspIHsKPj4gICAJCWlmIChlY2MtPnN0cmVuZ3RoIDw9
IHN0cmVuZ3Roc1tpXSkgewo+PiAgIAkJCS8qCj4+ICAgCQkJICogVXBkYXRlIGVjYy0+c3RyZW5n
dGggdmFsdWUgd2l0aCB0aGUgYWN0dWFsIHN0cmVuZ3RoCj4+IEBAIC0xNjc3LDcgKzE2ODEsNyBA
QCBzdGF0aWMgaW50IHN1bnhpX25hbmRfaHdfZWNjX2N0cmxfaW5pdChzdHJ1Y3QgbmFuZF9jaGlw
ICpuYW5kLAo+PiAgIAkJfQo+PiAgIAl9Cj4+ICAgCj4+IC0JaWYgKGkgPj0gQVJSQVlfU0laRShz
dHJlbmd0aHMpKSB7Cj4+ICsJaWYgKGkgPj0gbmZjLT5jYXBzLT5uc3RyZW5ndGhzKSB7Cj4+ICAg
CQlkZXZfZXJyKG5mYy0+ZGV2LCAidW5zdXBwb3J0ZWQgc3RyZW5ndGhcbiIpOwo+PiAgIAkJcmV0
dXJuIC1FTk9UU1VQUDsKPj4gICAJfQo+PiBAQCAtMjE2NywxNSArMjE3MSwyMyBAQCBzdGF0aWMg
dm9pZCBzdW54aV9uZmNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ICAg
CQlkbWFfcmVsZWFzZV9jaGFubmVsKG5mYy0+ZG1hYyk7Cj4+ICAgfQo+PiAgIAo+PiArc3RhdGlj
IGNvbnN0IHU4IHN1bnhpX2VjY19zdHJlbmd0aHNfYTEwW10gPSB7Cj4+ICsJMTYsIDI0LCAyOCwg
MzIsIDQwLCA0OCwgNTYsIDYwLCA2NAo+PiArfTsKPj4gKwo+PiAgIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgc3VueGlfbmZjX2NhcHMgc3VueGlfbmZjX2ExMF9jYXBzID0gewo+PiAgIAkucmVnX2lvX2Rh
dGEgPSBORkNfUkVHX0ExMF9JT19EQVRBLAo+PiAgIAkuZG1hX21heGJ1cnN0ID0gNCwKPj4gKwku
ZWNjX3N0cmVuZ3RocyA9IHN1bnhpX2VjY19zdHJlbmd0aHNfYTEwLAo+PiArCS5uc3RyZW5ndGhz
ID0gQVJSQVlfU0laRShzdW54aV9lY2Nfc3RyZW5ndGhzX2ExMCksCj4+ICAgfTsKPj4gICAKPj4g
ICBzdGF0aWMgY29uc3Qgc3RydWN0IHN1bnhpX25mY19jYXBzIHN1bnhpX25mY19hMjNfY2FwcyA9
IHsKPj4gICAJLmhhc19tZG1hID0gdHJ1ZSwKPj4gICAJLnJlZ19pb19kYXRhID0gTkZDX1JFR19B
MjNfSU9fREFUQSwKPj4gICAJLmRtYV9tYXhidXJzdCA9IDgsCj4+ICsJLmVjY19zdHJlbmd0aHMg
PSBzdW54aV9lY2Nfc3RyZW5ndGhzX2ExMCwKPj4gKwkubnN0cmVuZ3RocyA9IEFSUkFZX1NJWkUo
c3VueGlfZWNjX3N0cmVuZ3Roc19hMTApLAo+PiAgIH07Cj4+ICAgCj4+ICAgc3RhdGljIGNvbnN0
IHN0cnVjdCBvZl9kZXZpY2VfaWQgc3VueGlfbmZjX2lkc1tdID0gewo+Pgo+IAo+IAo+IAo+IAoK
Ci0tIApSaWNoYXJkIEdlbm91ZCwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
