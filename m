Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5205EB64D9
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 09:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I3JH/DjCpm4qcQVEGJIKyw1w0fiEpJnRLFxQHa1gEWY=; b=YUhkqYmXpoWVGj
	3TkDHchgMPHUKLj2BwYuYCwF6W8g+qItxfJ2VFFQoYXTI4PPq+RIwZlgbjfkFNRcFMGYmWUR/uEhd
	weEgG66Cr4Ty1HvVvu5pcPkp1tZdrbnMJpZFn2GUiKO9mRwzkTXa4bHAPYlulQQxFI4NM42WjfOnc
	nqoPF+4Ez4BLmuEwNGc5b07Em+U4iSY9dzjp9NLkFNrzMGo1Jo/ICxLX1wPNH/e1W3ZwEDZGUVJc3
	lbI2b3YOujkyIH0+5Vp0jr30QKx16nElluSwVfmNiFbnHtdSrz4P/yFB34IogtK5eQLj98CZgwY8l
	rRit8jUk1iI+Wg4qKbpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGclz-00CoTA-1Q;
	Tue, 04 Jul 2023 09:56:39 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGclv-00CoQy-0p;
	Tue, 04 Jul 2023 09:56:37 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688464592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mMapt+1v6arSkASxO8Vo/k1eb4URuf8TQG4qlhn8MnA=;
	b=MqsYEmANYbQeHQzDbkLhMUahxnUMbuzqWizhWc2AjfbV/tbNF8tsEpgVAK0lHnZt7SADVD
	pj9s56P5VDsQkjoDpoN4gz4JDh35m0ZolCz6wDDkrfZ6jqETug28jcpXZf9j6iAtbe1zxO
	UveLyrixfCgqolvN/xfNUfyIA/4tJsx3Rnm1Xu/gtIgrXW9vPY3t1vZP0cIgnXSWJfd/v4
	DlPL6/xCmg++MDDhsv0w1zlQCG4DKii69CLqch37HeqTjxwLgOboN9ph6LGjG4DTxVoVcm
	Zag5KVmebxeQKwJ8ap/rMOiC40SKCt98ZFZBN1AlRFKQBk/FwPwVAtCWINO2Aw==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4F882000C;
	Tue,  4 Jul 2023 09:56:29 +0000 (UTC)
Date: Tue, 4 Jul 2023 11:56:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
 <kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v1 2/2] mtd: rawnand: meson: support for 512B ECC
 step size
Message-ID: <20230704115628.55320428@xps-13>
In-Reply-To: <aede4639-0e99-565a-c997-c414342c66af@sberdevices.ru>
References: <20230628092937.538683-1-AVKrasnov@sberdevices.ru>
	<20230628092937.538683-3-AVKrasnov@sberdevices.ru>
	<20230704103617.4affae8a@xps-13>
	<9e6eaa87-887c-f955-113a-43860c8ea00c@sberdevices.ru>
	<20230704114110.25ca9de4@xps-13>
	<aede4639-0e99-565a-c997-c414342c66af@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_025635_590806_ACE23026 
X-CRM114-Status: GOOD (  30.76  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBUdWUsIDQgSnVs
IDIwMjMgMTI6NDY6NTEgKzAzMDA6Cgo+IE9uIDA0LjA3LjIwMjMgMTI6NDEsIE1pcXVlbCBSYXlu
YWwgd3JvdGU6Cj4gPiBIaSBBcnNlbml5LAo+ID4gCj4gPiBhdmtyYXNub3ZAc2JlcmRldmljZXMu
cnUgd3JvdGUgb24gVHVlLCA0IEp1bCAyMDIzIDEyOjIzOjAzICswMzAwOgo+ID4gICAKPiA+PiBP
biAwNC4wNy4yMDIzIDExOjM2LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4gPj4+IEhpIEFyc2Vu
aXksCj4gPj4+Cj4gPj4+IEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBXZWQsIDI4
IEp1biAyMDIzIDEyOjI5OjM2ICswMzAwOgo+ID4+PiAgICAgCj4gPj4+PiBNZXNvbiBOQU5EIHN1
cHBvcnRzIGJvdGggNTEyQiBhbmQgMTAyNEIgRUNDIHN0ZXAgc2l6ZS4KPiA+Pj4+Cj4gPj4+PiBT
aWduZWQtb2ZmLWJ5OiBBcnNlbml5IEtyYXNub3YgPEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydT4K
PiA+Pj4+IC0tLQo+ID4+Pj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYyB8IDQ3
ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KPiA+Pj4+ICAxIGZpbGUgY2hhbmdlZCwg
MzUgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4gPj4+Pgo+ID4+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L21lc29uX25hbmQuYwo+ID4+Pj4gaW5kZXggMzQ1MjEyZThjNjkxLi42Y2M0ZjYzYjg2Yzgg
MTAwNjQ0Cj4gPj4+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPiA+
Pj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+ID4+Pj4gQEAgLTEz
NSw2ICsxMzUsNyBAQCBzdHJ1Y3QgbWVzb25fbmZjX25hbmRfY2hpcCB7Cj4gPj4+PiAgc3RydWN0
IG1lc29uX25hbmRfZWNjIHsKPiA+Pj4+ICAJdTMyIGJjaDsKPiA+Pj4+ICAJdTMyIHN0cmVuZ3Ro
Owo+ID4+Pj4gKwl1MzIgc2l6ZTsKPiA+Pj4+ICB9Owo+ID4+Pj4gIAo+ID4+Pj4gIHN0cnVjdCBt
ZXNvbl9uZmNfZGF0YSB7Cj4gPj4+PiBAQCAtMTkwLDcgKzE5MSw4IEBAIHN0cnVjdCBtZXNvbl9u
ZmMgewo+ID4+Pj4gIH07Cj4gPj4+PiAgCj4gPj4+PiAgZW51bSB7Cj4gPj4+PiAtCU5GQ19FQ0Nf
QkNIOF8xSwkJPSAyLAo+ID4+Pj4gKwlORkNfRUNDX0JDSDhfNTEyCT0gMSwKPiA+Pj4+ICsJTkZD
X0VDQ19CQ0g4XzFLLAo+ID4+Pj4gIAlORkNfRUNDX0JDSDI0XzFLLAo+ID4+Pj4gIAlORkNfRUND
X0JDSDMwXzFLLAo+ID4+Pj4gIAlORkNfRUNDX0JDSDQwXzFLLAo+ID4+Pj4gQEAgLTE5OCwxNSAr
MjAwLDE2IEBAIGVudW0gewo+ID4+Pj4gIAlORkNfRUNDX0JDSDYwXzFLLAo+ID4+Pj4gIH07Cj4g
Pj4+PiAgCj4gPj4+PiAtI2RlZmluZSBNRVNPTl9FQ0NfREFUQShiLCBzKQl7IC5iY2ggPSAoYiks
CS5zdHJlbmd0aCA9IChzKX0KPiA+Pj4+ICsjZGVmaW5lIE1FU09OX0VDQ19EQVRBKGIsIHMsIHN6
KQl7IC5iY2ggPSAoYiksIC5zdHJlbmd0aCA9IChzKSwgLnNpemUgPSAoc3opIH0KPiA+Pj4+ICAK
PiA+Pj4+ICBzdGF0aWMgc3RydWN0IG1lc29uX25hbmRfZWNjIG1lc29uX2VjY1tdID0gewo+ID4+
Pj4gLQlNRVNPTl9FQ0NfREFUQShORkNfRUNDX0JDSDhfMUssIDgpLAo+ID4+Pj4gLQlNRVNPTl9F
Q0NfREFUQShORkNfRUNDX0JDSDI0XzFLLCAyNCksCj4gPj4+PiAtCU1FU09OX0VDQ19EQVRBKE5G
Q19FQ0NfQkNIMzBfMUssIDMwKSwKPiA+Pj4+IC0JTUVTT05fRUNDX0RBVEEoTkZDX0VDQ19CQ0g0
MF8xSywgNDApLAo+ID4+Pj4gLQlNRVNPTl9FQ0NfREFUQShORkNfRUNDX0JDSDUwXzFLLCA1MCks
Cj4gPj4+PiAtCU1FU09OX0VDQ19EQVRBKE5GQ19FQ0NfQkNINjBfMUssIDYwKSwKPiA+Pj4+ICsJ
TUVTT05fRUNDX0RBVEEoTkZDX0VDQ19CQ0g4XzUxMiwgOCwgIDUxMiksCj4gPj4+PiArCU1FU09O
X0VDQ19EQVRBKE5GQ19FQ0NfQkNIOF8xSywgIDgsICAxMDI0KSwKPiA+Pj4+ICsJTUVTT05fRUND
X0RBVEEoTkZDX0VDQ19CQ0gyNF8xSywgMjQsIDEwMjQpLAo+ID4+Pj4gKwlNRVNPTl9FQ0NfREFU
QShORkNfRUNDX0JDSDMwXzFLLCAzMCwgMTAyNCksCj4gPj4+PiArCU1FU09OX0VDQ19EQVRBKE5G
Q19FQ0NfQkNINDBfMUssIDQwLCAxMDI0KSwKPiA+Pj4+ICsJTUVTT05fRUNDX0RBVEEoTkZDX0VD
Q19CQ0g1MF8xSywgNTAsIDEwMjQpLAo+ID4+Pj4gKwlNRVNPTl9FQ0NfREFUQShORkNfRUNDX0JD
SDYwXzFLLCA2MCwgMTAyNCksCj4gPj4+PiAgfTsKPiA+Pj4+ICAKPiA+Pj4+ICBzdGF0aWMgaW50
IG1lc29uX25hbmRfY2FsY19lY2NfYnl0ZXMoaW50IHN0ZXBfc2l6ZSwgaW50IHN0cmVuZ3RoKQo+
ID4+Pj4gQEAgLTIyNCw4ICsyMjcsMjcgQEAgc3RhdGljIGludCBtZXNvbl9uYW5kX2NhbGNfZWNj
X2J5dGVzKGludCBzdGVwX3NpemUsIGludCBzdHJlbmd0aCkKPiA+Pj4+ICAKPiA+Pj4+ICBOQU5E
X0VDQ19DQVBTX1NJTkdMRShtZXNvbl9neGxfZWNjX2NhcHMsCj4gPj4+PiAgCQkgICAgIG1lc29u
X25hbmRfY2FsY19lY2NfYnl0ZXMsIDEwMjQsIDgsIDI0LCAzMCwgNDAsIDUwLCA2MCk7Cj4gPj4+
PiAtTkFORF9FQ0NfQ0FQU19TSU5HTEUobWVzb25fYXhnX2VjY19jYXBzLAo+ID4+Pj4gLQkJICAg
ICBtZXNvbl9uYW5kX2NhbGNfZWNjX2J5dGVzLCAxMDI0LCA4KTsKPiA+Pj4+ICsKPiA+Pj4+ICtz
dGF0aWMgY29uc3QgaW50IGF4Z19zdGVwaW5mb19zdHJlbmd0aHNbXSA9IHsgOCB9Owo+ID4+Pj4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgbmFuZF9lY2Nfc3RlcF9pbmZvIGF4Z19zdGVwaW5mb18xMDI0
ID0gewo+ID4+Pj4gKwkuc3RlcHNpemUgPSAxMDI0LAo+ID4+Pj4gKwkuc3RyZW5ndGhzID0gYXhn
X3N0ZXBpbmZvX3N0cmVuZ3RocywKPiA+Pj4+ICsJLm5zdHJlbmd0aHMgPSBBUlJBWV9TSVpFKGF4
Z19zdGVwaW5mb19zdHJlbmd0aHMpCj4gPj4+PiArfTsKPiA+Pj4+ICsKPiA+Pj4+ICtzdGF0aWMg
Y29uc3Qgc3RydWN0IG5hbmRfZWNjX3N0ZXBfaW5mbyBheGdfc3RlcGluZm9fNTEyID0gewo+ID4+
Pj4gKwkuc3RlcHNpemUgPSA1MTIsCj4gPj4+PiArCS5zdHJlbmd0aHMgPSBheGdfc3RlcGluZm9f
c3RyZW5ndGhzLAo+ID4+Pj4gKwkubnN0cmVuZ3RocyA9IEFSUkFZX1NJWkUoYXhnX3N0ZXBpbmZv
X3N0cmVuZ3RocykKPiA+Pj4+ICt9Owo+ID4+Pj4gKwo+ID4+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgbmFuZF9lY2Nfc3RlcF9pbmZvIGF4Z19zdGVwaW5mb1tdID0geyBheGdfc3RlcGluZm9fMTAy
NCwgYXhnX3N0ZXBpbmZvXzUxMiB9Owo+ID4+Pj4gKwo+ID4+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgbmFuZF9lY2NfY2FwcyBtZXNvbl9heGdfZWNjX2NhcHMgPSB7Cj4gPj4+PiArCS5zdGVwaW5m
b3MgPSBheGdfc3RlcGluZm8sCj4gPj4+PiArCS5uc3RlcGluZm9zID0gQVJSQVlfU0laRShheGdf
c3RlcGluZm8pLAo+ID4+Pj4gKwkuY2FsY19lY2NfYnl0ZXMgPSBtZXNvbl9uYW5kX2NhbGNfZWNj
X2J5dGVzLAo+ID4+Pj4gK307Cj4gPj4+PiAgCj4gPj4+PiAgc3RhdGljIHN0cnVjdCBtZXNvbl9u
ZmNfbmFuZF9jaGlwICp0b19tZXNvbl9uYW5kKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQpCj4gPj4+
PiAgewo+ID4+Pj4gQEAgLTEyNTksNyArMTI4MSw4IEBAIHN0YXRpYyBpbnQgbWVzb25fbmFuZF9i
Y2hfbW9kZShzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kKQo+ID4+Pj4gIAkJcmV0dXJuIC1FSU5WQUw7
Cj4gPj4+PiAgCj4gPj4+PiAgCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKG1lc29uX2VjYyk7
IGkrKykgewo+ID4+Pj4gLQkJaWYgKG1lc29uX2VjY1tpXS5zdHJlbmd0aCA9PSBuYW5kLT5lY2Mu
c3RyZW5ndGgpIHsKPiA+Pj4+ICsJCWlmIChtZXNvbl9lY2NbaV0uc3RyZW5ndGggPT0gbmFuZC0+
ZWNjLnN0cmVuZ3RoICYmCj4gPj4+PiArCQkgICAgbWVzb25fZWNjW2ldLnNpemUgPT0gbmFuZC0+
ZWNjLnNpemUpIHsKPiA+Pj4+ICAJCQltZXNvbl9jaGlwLT5iY2hfbW9kZSA9IG1lc29uX2VjY1tp
XS5iY2g7Cj4gPj4+PiAgCQkJcmV0dXJuIDA7Cj4gPj4+PiAgCQl9Cj4gPj4+PiBAQCAtMTI3OCw3
ICsxMzAxLDcgQEAgc3RhdGljIGludCBtZXNvbl9uYW5kX2F0dGFjaF9jaGlwKHN0cnVjdCBuYW5k
X2NoaXAgKm5hbmQpCj4gPj4+PiAgCXN0cnVjdCBtZXNvbl9uZmMgKm5mYyA9IG5hbmRfZ2V0X2Nv
bnRyb2xsZXJfZGF0YShuYW5kKTsKPiA+Pj4+ICAJc3RydWN0IG1lc29uX25mY19uYW5kX2NoaXAg
Km1lc29uX2NoaXAgPSB0b19tZXNvbl9uYW5kKG5hbmQpOwo+ID4+Pj4gIAlzdHJ1Y3QgbXRkX2lu
Zm8gKm10ZCA9IG5hbmRfdG9fbXRkKG5hbmQpOwo+ID4+Pj4gLQlpbnQgbnNlY3RvcnMgPSBtdGQt
PndyaXRlc2l6ZSAvIDEwMjQ7Cj4gPj4+PiArCWludCBuc2VjdG9ycyA9IG10ZC0+d3JpdGVzaXpl
IC8gNTEyOyAgICAKPiA+Pj4KPiA+Pj4gVGhpcyBjYW5ub3QgYmUgdW5jb25kaXRpb25hbCwgcmln
aHQ/ICAgIAo+ID4+Cj4gPj4gSGVsbG8gTWlxdWVsIQo+ID4+Cj4gPj4gWWVzLCB0aGlzIGNvZGUg
bG9va3Mgc3RyYW5nZS4gJ25zZWN0b3JzJyBpcyB1c2VkIHRvIGNhbGN1bGF0ZSBzcGFjZSBpbiBP
T0IKPiA+PiB0aGF0IGNvdWxkIGJlIHVzZWQgYnkgRUNDIGVuZ2luZSAodGhpcyB2YWx1ZSB3aWxs
IGJlIHBhc3NlZCBhcyAnb29iYXZhaWwnCj4gPj4gdG8gJ25hbmRfZWNjX2Nob29zZV9jb25mKCkn
KS4gSWRlYSBvZiA1MTIgaXMgdG8gY29uc2lkZXIgIndvcnN0IiBjYXNlCj4gPj4gZm9yIEVDQywg
ZS5nLiBtaW5pbWFsIG51bWJlciBvZiBieXRlcyBmb3IgRUNDIGVuZ2luZSAoYW5kIGF0IHRoZSBz
YW1lIHRpbWUKPiA+PiBtYXhpbXVtIG51bWJlciBvZiBmcmVlIGJ5dGVzKS4gRm9yIE1lc29uLCBp
ZiBFQ0Mgc3RlcCBzaXplIGlzIDUxMiwgdGhlbiB3ZQo+ID4+IGhhdmUgNCB4IDIgZnJlZSBieXRl
cyBpbiBPT0IgKGlmIHN0ZXAgc2l6ZSBpZiAxMDI0IHRoZW4gd2UgaGF2ZSAyIHggMiBmcmVlCj4g
Pj4gYnl0ZXMgaW4gT09CKS4KPiA+Pgo+ID4+IEkgdGhpbmsgdGhpcyBjb2RlIGNvdWxkIGJlIHJl
d29ya2VkIGluIHRoZSBmb2xsb3dpbmcgd2F5Ogo+ID4+Cj4gPj4gaWYgRUNDIHN0ZXAgc2l6ZSBp
cyBhbHJlYWR5IGtub3duIGhlcmUgKGZyb20gRFRTKSwgY2FsY3VsYXRlICduc2VjdG9ycycgdXNp
bmcKPiA+PiBnaXZlbiB2YWx1ZSAoZGl2IGJ5IDUxMiBmb3IgZXhhbXBsZSkuIE90aGVyd2lzZSBj
YWxjdWxhdGUgJ25zZWN0b3JzJyBpbiB0aGUKPiA+PiBjdXJyZW50IG1hbm5lcjogIAo+ID4gCj4g
PiBJdCB3aWxsIGFsd2F5cyBiZSBrbm93biB3aGVuIHRoZXNlIGZ1bmN0aW9uIGFyZSBydW4uIFRo
ZXJlIGlzIG5vCj4gPiBndWVzc2luZyBoZXJlLiAgCj4gCj4gSG0gSSBjaGVja2VkLCB0aGF0IGJ1
dCBpZiBzdGVwIHNpemUgaXMgbm90IHNldCBpbiBEVFMsIGhlcmUgaXQgd2lsbCBiZSAwLCAKPiB0
aGVuIGl0IHdpbGwgYmUgc2VsZWN0ZWQgaW4gJ25hbmRfZWNjX2Nob29zZV9jb25mKCknIGFjY29y
ZGluZyBwcm92aWRlZCAnZWNjX2NhcHMnCj4gYW5kICdvb2JhdmFpbCcuLi4KPiAKPiBBbnl3YXks
IEknbGwgZG8gdGhlIGZvbGxvd2luZyB0aGluZzoKPiAKPiBpbnQgbnNlY3RvcnM7Cj4gCj4gaWYg
KG5hbmQtPmVjYy5zaXplKQo+ICAgICBuc2VjdG9ycyA9IG10ZC0+d3JpdGVzaXplIC8gbmFuZC0+
ZWNjLnNpemU7IDwtLS0gdGhpcyBpcyBmb3IgNTEyIEVDQwoKWW91IHNob3VsZCBzZXQgbmFuZC0+
ZWNjLnNpemUgaW4gLT5hdHRhY2hfY2hpcCgpIGluc3RlYWQuCgo+IGVsc2UKPiAgICAgbnNlY3Rv
cnMgPSBtdGQtPndyaXRlc2l6ZSAvIDEwMjQ7IDwtLS0gdGhpcyBpcyBmb3IgZGVmYXVsdCAxMDI0
IEVDQwo+IAo+IFRoYW5rcywgQXJzZW5peQo+IAo+ID4gICAKPiA+Pgo+ID4+IGludCBuc2VjdG9y
cyA9IG10ZC0+d3JpdGVzaXplIC8gMTAyNDsKPiA+Pgo+ID4+IE1vcmVvdmVyIDEwMjQgaXMgZGVm
YXVsdCBFQ0Mgc3RlcCBzaXplIGZvciB0aGlzIGRyaXZlciwgc28gZGVmYXVsdCBiZWhhdmlvdXIK
PiA+PiB3aWxsIGJlIHByZXNlcnZlZC4gIAo+ID4gCj4gPiBZZXMsIG90aGVyd2lzZSB5b3Ugd291
bGQgYnJlYWsgZXhpc3RpbmcgdXNlcnMuCj4gPiAgIAo+ID4+Cj4gPj4gVGhhbmtzLCBBcnNlbml5
Cj4gPj4gIAo+ID4+PiAgICAgCj4gPj4+PiAgCWludCByYXdfd3JpdGVzaXplOwo+ID4+Pj4gIAlp
bnQgcmV0Owo+ID4+Pj4gICAgICAKPiA+Pj4KPiA+Pj4KPiA+Pj4gVGhhbmtzLAo+ID4+PiBNaXF1
w6hsICAgIAo+ID4gCj4gPiAKPiA+IFRoYW5rcywKPiA+IE1pcXXDqGwgIAoKClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
