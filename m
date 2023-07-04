Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A51EB64D9
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 09:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XjGR3uoTyBB2SAuBy8k3lBIZE5b5kmB92rgLL98sbfM=; b=tHTKyupEd2QAQV
	yRrVHjLf2rkcbBHVO0z8KK3VFI7uVrPM43b4oflLjyJ4F/9kDUltH+/SUzH/EbQtbtLdh+0+nWGuq
	++xUlBszngPMvXYrjCBIeaVF+wN8qzT7Qjjg86nATTjsakKJAvZULAPPvpNZN/t/wOYx+8e0MGzDx
	/kaVybvkQl7lzuIhTuD3BhLbbH13GPQnRxGPCaKMP4Ognh7a3RBtRujdwAGJ//kIKlGz+GcRUdM/K
	tTS6J2yPz2PlDBaGll1uM+chk8yoaK58xoJMLjxG13wxo0quBWJExm3Zaplb4QAGNqlR/vK3mzutp
	UICOFAnNc2M3b8dF8/EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGcXH-00Clp8-0P;
	Tue, 04 Jul 2023 09:41:27 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGcXC-00Clnt-1W;
	Tue, 04 Jul 2023 09:41:24 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688463674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/m9hnbmXRoLzd2pZwx0iA9IbGKVFRLbsVCiOPjgHHdU=;
	b=J0td3VK4VJoUifzJSNtk/5oRsJ+64l85Ui3WFQR8kG51DjpUQ4TL4MH4OJPmUHP0llm78G
	3wRh1W5vdxHL+ZWfT/KR5N9uhCqBP09Mhr7BgybzKGe/cq67y+4SS1Ih3YkRn5E3hnTmMK
	by2/WQYP9M+0bsid40lBnWd5RNef75a21cMSevmoN8Rmt9VLd4gYnBurlswXNlOMRx57i6
	dnAF7w83FWFPKVjEsDoX/6HxNPguFPwXCXGwN/tStcmiWtiDSD904JgnoiWxi5wEbeaTvF
	yM5mUwjTu4jm/de95ZxHTK9FKUlLpB9TiPhNmAq0j6Y3pzb3n8cdGsw7WMVjJA==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD2142001D;
	Tue,  4 Jul 2023 09:41:11 +0000 (UTC)
Date: Tue, 4 Jul 2023 11:41:10 +0200
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
Message-ID: <20230704114110.25ca9de4@xps-13>
In-Reply-To: <9e6eaa87-887c-f955-113a-43860c8ea00c@sberdevices.ru>
References: <20230628092937.538683-1-AVKrasnov@sberdevices.ru>
	<20230628092937.538683-3-AVKrasnov@sberdevices.ru>
	<20230704103617.4affae8a@xps-13>
	<9e6eaa87-887c-f955-113a-43860c8ea00c@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_024123_237085_422209A9 
X-CRM114-Status: GOOD (  28.39  )
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
IDIwMjMgMTI6MjM6MDMgKzAzMDA6Cgo+IE9uIDA0LjA3LjIwMjMgMTE6MzYsIE1pcXVlbCBSYXlu
YWwgd3JvdGU6Cj4gPiBIaSBBcnNlbml5LAo+ID4gCj4gPiBBVktyYXNub3ZAc2JlcmRldmljZXMu
cnUgd3JvdGUgb24gV2VkLCAyOCBKdW4gMjAyMyAxMjoyOTozNiArMDMwMDoKPiA+ICAgCj4gPj4g
TWVzb24gTkFORCBzdXBwb3J0cyBib3RoIDUxMkIgYW5kIDEwMjRCIEVDQyBzdGVwIHNpemUuCj4g
Pj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBBcnNlbml5IEtyYXNub3YgPEFWS3Jhc25vdkBzYmVyZGV2
aWNlcy5ydT4KPiA+PiAtLS0KPiA+PiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5j
IHwgNDcgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQo+ID4+ICAxIGZpbGUgY2hhbmdl
ZCwgMzUgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9y
YXcvbWVzb25fbmFuZC5jCj4gPj4gaW5kZXggMzQ1MjEyZThjNjkxLi42Y2M0ZjYzYjg2YzggMTAw
NjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4gPj4gKysr
IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4gPj4gQEAgLTEzNSw2ICsxMzUs
NyBAQCBzdHJ1Y3QgbWVzb25fbmZjX25hbmRfY2hpcCB7Cj4gPj4gIHN0cnVjdCBtZXNvbl9uYW5k
X2VjYyB7Cj4gPj4gIAl1MzIgYmNoOwo+ID4+ICAJdTMyIHN0cmVuZ3RoOwo+ID4+ICsJdTMyIHNp
emU7Cj4gPj4gIH07Cj4gPj4gIAo+ID4+ICBzdHJ1Y3QgbWVzb25fbmZjX2RhdGEgewo+ID4+IEBA
IC0xOTAsNyArMTkxLDggQEAgc3RydWN0IG1lc29uX25mYyB7Cj4gPj4gIH07Cj4gPj4gIAo+ID4+
ICBlbnVtIHsKPiA+PiAtCU5GQ19FQ0NfQkNIOF8xSwkJPSAyLAo+ID4+ICsJTkZDX0VDQ19CQ0g4
XzUxMgk9IDEsCj4gPj4gKwlORkNfRUNDX0JDSDhfMUssCj4gPj4gIAlORkNfRUNDX0JDSDI0XzFL
LAo+ID4+ICAJTkZDX0VDQ19CQ0gzMF8xSywKPiA+PiAgCU5GQ19FQ0NfQkNINDBfMUssCj4gPj4g
QEAgLTE5OCwxNSArMjAwLDE2IEBAIGVudW0gewo+ID4+ICAJTkZDX0VDQ19CQ0g2MF8xSywKPiA+
PiAgfTsKPiA+PiAgCj4gPj4gLSNkZWZpbmUgTUVTT05fRUNDX0RBVEEoYiwgcykJeyAuYmNoID0g
KGIpLAkuc3RyZW5ndGggPSAocyl9Cj4gPj4gKyNkZWZpbmUgTUVTT05fRUNDX0RBVEEoYiwgcywg
c3opCXsgLmJjaCA9IChiKSwgLnN0cmVuZ3RoID0gKHMpLCAuc2l6ZSA9IChzeikgfQo+ID4+ICAK
PiA+PiAgc3RhdGljIHN0cnVjdCBtZXNvbl9uYW5kX2VjYyBtZXNvbl9lY2NbXSA9IHsKPiA+PiAt
CU1FU09OX0VDQ19EQVRBKE5GQ19FQ0NfQkNIOF8xSywgOCksCj4gPj4gLQlNRVNPTl9FQ0NfREFU
QShORkNfRUNDX0JDSDI0XzFLLCAyNCksCj4gPj4gLQlNRVNPTl9FQ0NfREFUQShORkNfRUNDX0JD
SDMwXzFLLCAzMCksCj4gPj4gLQlNRVNPTl9FQ0NfREFUQShORkNfRUNDX0JDSDQwXzFLLCA0MCks
Cj4gPj4gLQlNRVNPTl9FQ0NfREFUQShORkNfRUNDX0JDSDUwXzFLLCA1MCksCj4gPj4gLQlNRVNP
Tl9FQ0NfREFUQShORkNfRUNDX0JDSDYwXzFLLCA2MCksCj4gPj4gKwlNRVNPTl9FQ0NfREFUQShO
RkNfRUNDX0JDSDhfNTEyLCA4LCAgNTEyKSwKPiA+PiArCU1FU09OX0VDQ19EQVRBKE5GQ19FQ0Nf
QkNIOF8xSywgIDgsICAxMDI0KSwKPiA+PiArCU1FU09OX0VDQ19EQVRBKE5GQ19FQ0NfQkNIMjRf
MUssIDI0LCAxMDI0KSwKPiA+PiArCU1FU09OX0VDQ19EQVRBKE5GQ19FQ0NfQkNIMzBfMUssIDMw
LCAxMDI0KSwKPiA+PiArCU1FU09OX0VDQ19EQVRBKE5GQ19FQ0NfQkNINDBfMUssIDQwLCAxMDI0
KSwKPiA+PiArCU1FU09OX0VDQ19EQVRBKE5GQ19FQ0NfQkNINTBfMUssIDUwLCAxMDI0KSwKPiA+
PiArCU1FU09OX0VDQ19EQVRBKE5GQ19FQ0NfQkNINjBfMUssIDYwLCAxMDI0KSwKPiA+PiAgfTsK
PiA+PiAgCj4gPj4gIHN0YXRpYyBpbnQgbWVzb25fbmFuZF9jYWxjX2VjY19ieXRlcyhpbnQgc3Rl
cF9zaXplLCBpbnQgc3RyZW5ndGgpCj4gPj4gQEAgLTIyNCw4ICsyMjcsMjcgQEAgc3RhdGljIGlu
dCBtZXNvbl9uYW5kX2NhbGNfZWNjX2J5dGVzKGludCBzdGVwX3NpemUsIGludCBzdHJlbmd0aCkK
PiA+PiAgCj4gPj4gIE5BTkRfRUNDX0NBUFNfU0lOR0xFKG1lc29uX2d4bF9lY2NfY2FwcywKPiA+
PiAgCQkgICAgIG1lc29uX25hbmRfY2FsY19lY2NfYnl0ZXMsIDEwMjQsIDgsIDI0LCAzMCwgNDAs
IDUwLCA2MCk7Cj4gPj4gLU5BTkRfRUNDX0NBUFNfU0lOR0xFKG1lc29uX2F4Z19lY2NfY2FwcywK
PiA+PiAtCQkgICAgIG1lc29uX25hbmRfY2FsY19lY2NfYnl0ZXMsIDEwMjQsIDgpOwo+ID4+ICsK
PiA+PiArc3RhdGljIGNvbnN0IGludCBheGdfc3RlcGluZm9fc3RyZW5ndGhzW10gPSB7IDggfTsK
PiA+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBuYW5kX2VjY19zdGVwX2luZm8gYXhnX3N0ZXBpbmZv
XzEwMjQgPSB7Cj4gPj4gKwkuc3RlcHNpemUgPSAxMDI0LAo+ID4+ICsJLnN0cmVuZ3RocyA9IGF4
Z19zdGVwaW5mb19zdHJlbmd0aHMsCj4gPj4gKwkubnN0cmVuZ3RocyA9IEFSUkFZX1NJWkUoYXhn
X3N0ZXBpbmZvX3N0cmVuZ3RocykKPiA+PiArfTsKPiA+PiArCj4gPj4gK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgbmFuZF9lY2Nfc3RlcF9pbmZvIGF4Z19zdGVwaW5mb181MTIgPSB7Cj4gPj4gKwkuc3Rl
cHNpemUgPSA1MTIsCj4gPj4gKwkuc3RyZW5ndGhzID0gYXhnX3N0ZXBpbmZvX3N0cmVuZ3RocywK
PiA+PiArCS5uc3RyZW5ndGhzID0gQVJSQVlfU0laRShheGdfc3RlcGluZm9fc3RyZW5ndGhzKQo+
ID4+ICt9Owo+ID4+ICsKPiA+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBuYW5kX2VjY19zdGVwX2lu
Zm8gYXhnX3N0ZXBpbmZvW10gPSB7IGF4Z19zdGVwaW5mb18xMDI0LCBheGdfc3RlcGluZm9fNTEy
IH07Cj4gPj4gKwo+ID4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG5hbmRfZWNjX2NhcHMgbWVzb25f
YXhnX2VjY19jYXBzID0gewo+ID4+ICsJLnN0ZXBpbmZvcyA9IGF4Z19zdGVwaW5mbywKPiA+PiAr
CS5uc3RlcGluZm9zID0gQVJSQVlfU0laRShheGdfc3RlcGluZm8pLAo+ID4+ICsJLmNhbGNfZWNj
X2J5dGVzID0gbWVzb25fbmFuZF9jYWxjX2VjY19ieXRlcywKPiA+PiArfTsKPiA+PiAgCj4gPj4g
IHN0YXRpYyBzdHJ1Y3QgbWVzb25fbmZjX25hbmRfY2hpcCAqdG9fbWVzb25fbmFuZChzdHJ1Y3Qg
bmFuZF9jaGlwICpuYW5kKQo+ID4+ICB7Cj4gPj4gQEAgLTEyNTksNyArMTI4MSw4IEBAIHN0YXRp
YyBpbnQgbWVzb25fbmFuZF9iY2hfbW9kZShzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kKQo+ID4+ICAJ
CXJldHVybiAtRUlOVkFMOwo+ID4+ICAKPiA+PiAgCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpF
KG1lc29uX2VjYyk7IGkrKykgewo+ID4+IC0JCWlmIChtZXNvbl9lY2NbaV0uc3RyZW5ndGggPT0g
bmFuZC0+ZWNjLnN0cmVuZ3RoKSB7Cj4gPj4gKwkJaWYgKG1lc29uX2VjY1tpXS5zdHJlbmd0aCA9
PSBuYW5kLT5lY2Muc3RyZW5ndGggJiYKPiA+PiArCQkgICAgbWVzb25fZWNjW2ldLnNpemUgPT0g
bmFuZC0+ZWNjLnNpemUpIHsKPiA+PiAgCQkJbWVzb25fY2hpcC0+YmNoX21vZGUgPSBtZXNvbl9l
Y2NbaV0uYmNoOwo+ID4+ICAJCQlyZXR1cm4gMDsKPiA+PiAgCQl9Cj4gPj4gQEAgLTEyNzgsNyAr
MTMwMSw3IEBAIHN0YXRpYyBpbnQgbWVzb25fbmFuZF9hdHRhY2hfY2hpcChzdHJ1Y3QgbmFuZF9j
aGlwICpuYW5kKQo+ID4+ICAJc3RydWN0IG1lc29uX25mYyAqbmZjID0gbmFuZF9nZXRfY29udHJv
bGxlcl9kYXRhKG5hbmQpOwo+ID4+ICAJc3RydWN0IG1lc29uX25mY19uYW5kX2NoaXAgKm1lc29u
X2NoaXAgPSB0b19tZXNvbl9uYW5kKG5hbmQpOwo+ID4+ICAJc3RydWN0IG10ZF9pbmZvICptdGQg
PSBuYW5kX3RvX210ZChuYW5kKTsKPiA+PiAtCWludCBuc2VjdG9ycyA9IG10ZC0+d3JpdGVzaXpl
IC8gMTAyNDsKPiA+PiArCWludCBuc2VjdG9ycyA9IG10ZC0+d3JpdGVzaXplIC8gNTEyOyAgCj4g
PiAKPiA+IFRoaXMgY2Fubm90IGJlIHVuY29uZGl0aW9uYWwsIHJpZ2h0PyAgCj4gCj4gSGVsbG8g
TWlxdWVsIQo+IAo+IFllcywgdGhpcyBjb2RlIGxvb2tzIHN0cmFuZ2UuICduc2VjdG9ycycgaXMg
dXNlZCB0byBjYWxjdWxhdGUgc3BhY2UgaW4gT09CCj4gdGhhdCBjb3VsZCBiZSB1c2VkIGJ5IEVD
QyBlbmdpbmUgKHRoaXMgdmFsdWUgd2lsbCBiZSBwYXNzZWQgYXMgJ29vYmF2YWlsJwo+IHRvICdu
YW5kX2VjY19jaG9vc2VfY29uZigpJykuIElkZWEgb2YgNTEyIGlzIHRvIGNvbnNpZGVyICJ3b3Jz
dCIgY2FzZQo+IGZvciBFQ0MsIGUuZy4gbWluaW1hbCBudW1iZXIgb2YgYnl0ZXMgZm9yIEVDQyBl
bmdpbmUgKGFuZCBhdCB0aGUgc2FtZSB0aW1lCj4gbWF4aW11bSBudW1iZXIgb2YgZnJlZSBieXRl
cykuIEZvciBNZXNvbiwgaWYgRUNDIHN0ZXAgc2l6ZSBpcyA1MTIsIHRoZW4gd2UKPiBoYXZlIDQg
eCAyIGZyZWUgYnl0ZXMgaW4gT09CIChpZiBzdGVwIHNpemUgaWYgMTAyNCB0aGVuIHdlIGhhdmUg
MiB4IDIgZnJlZQo+IGJ5dGVzIGluIE9PQikuCj4gCj4gSSB0aGluayB0aGlzIGNvZGUgY291bGQg
YmUgcmV3b3JrZWQgaW4gdGhlIGZvbGxvd2luZyB3YXk6Cj4gCj4gaWYgRUNDIHN0ZXAgc2l6ZSBp
cyBhbHJlYWR5IGtub3duIGhlcmUgKGZyb20gRFRTKSwgY2FsY3VsYXRlICduc2VjdG9ycycgdXNp
bmcKPiBnaXZlbiB2YWx1ZSAoZGl2IGJ5IDUxMiBmb3IgZXhhbXBsZSkuIE90aGVyd2lzZSBjYWxj
dWxhdGUgJ25zZWN0b3JzJyBpbiB0aGUKPiBjdXJyZW50IG1hbm5lcjoKCkl0IHdpbGwgYWx3YXlz
IGJlIGtub3duIHdoZW4gdGhlc2UgZnVuY3Rpb24gYXJlIHJ1bi4gVGhlcmUgaXMgbm8KZ3Vlc3Np
bmcgaGVyZS4KCj4gCj4gaW50IG5zZWN0b3JzID0gbXRkLT53cml0ZXNpemUgLyAxMDI0Owo+IAo+
IE1vcmVvdmVyIDEwMjQgaXMgZGVmYXVsdCBFQ0Mgc3RlcCBzaXplIGZvciB0aGlzIGRyaXZlciwg
c28gZGVmYXVsdCBiZWhhdmlvdXIKPiB3aWxsIGJlIHByZXNlcnZlZC4KClllcywgb3RoZXJ3aXNl
IHlvdSB3b3VsZCBicmVhayBleGlzdGluZyB1c2Vycy4KCj4gCj4gVGhhbmtzLCBBcnNlbml5Cj4g
Cj4gPiAgIAo+ID4+ICAJaW50IHJhd193cml0ZXNpemU7Cj4gPj4gIAlpbnQgcmV0Owo+ID4+ICAg
IAo+ID4gCj4gPiAKPiA+IFRoYW5rcywKPiA+IE1pcXXDqGwgIAoKClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
