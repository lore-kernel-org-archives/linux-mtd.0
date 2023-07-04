Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174A8EB64DD
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 08:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FGU1qkeTufuITYNSqFhHl4FkVQjBHBDE/aZW+c+VTPw=; b=n+SGWBnuBGy0NJ
	3gshDRp6Rp8RuEXr/9CHGlb1DN/kzHxy6X2dvcQkIzFfpzBV4Z9jbIBuQ17ADaINmrQ6t6RMbxlog
	1Hi5vwwoE/mqlGAg3EVY9oCbChXNO3memCqwFaTq2Y+qTL9DZvrjoUdr+YvaZDk2heyiLJYqk0Ubo
	3cSlCLGAz19ofZjwunommmd2Kfqwb+7euTnVYFwuiGJtwGki2mbExzjlmU7glVZVtJrC47IhRJY/M
	GgJre8s7pTiJ80rkZApmOynjd0wblx8g9r3B0qf4hfZNTQfCgyFc1InhsHgmuwFKr0e75W1u3HEgh
	PsJbWj8bBOjuO3/5+rSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGbWO-00CaWU-0z;
	Tue, 04 Jul 2023 08:36:28 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGbWK-00CaUU-2S;
	Tue, 04 Jul 2023 08:36:26 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688459780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zeaw/mEHipmGdPt6yz1DrOUPKlcqLWAbkNQPWyuHIOg=;
	b=lTJwhZHjYgSCiEdAOpVIQXoP+mdtHnW8eXahIbKbFodDULRUSrqNoKFvbJvZSu5b+dSsmz
	oOK0YDOl+hmesqjpFxHQRiGMWf4aDBrlENbAcZh2QmPhbuDICsCUFYle2GSFD2bQAClkHV
	JBcTWRPUNCb+9/m/24xVbYFeSURdwQhd9zhcKLe00OOMjdnhWHP6hbvaYIFhX0Q4N0T+4X
	n+9ITuzvkkDQxYQlM03MfEOD4VHPjYEd7RtNjNXKXXnChzaFa5ZOpXXCvtSaVlErDr/SYj
	Cl6rc9NkOS4Gts4/3TwWzyQYoOjJXW/Clk430udZ1yZqEXIPfYC+FyE63mAhQg==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id D6E9D6000D;
	Tue,  4 Jul 2023 08:36:18 +0000 (UTC)
Date: Tue, 4 Jul 2023 10:36:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
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
Message-ID: <20230704103617.4affae8a@xps-13>
In-Reply-To: <20230628092937.538683-3-AVKrasnov@sberdevices.ru>
References: <20230628092937.538683-1-AVKrasnov@sberdevices.ru>
	<20230628092937.538683-3-AVKrasnov@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_013625_059152_605907E1 
X-CRM114-Status: GOOD (  18.17  )
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

SGkgQXJzZW5peSwKCkFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBXZWQsIDI4IEp1
biAyMDIzIDEyOjI5OjM2ICswMzAwOgoKPiBNZXNvbiBOQU5EIHN1cHBvcnRzIGJvdGggNTEyQiBh
bmQgMTAyNEIgRUNDIHN0ZXAgc2l6ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBcnNlbml5IEtyYXNu
b3YgPEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9y
YXcvbWVzb25fbmFuZC5jIHwgNDcgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L21lc29uX25hbmQuYwo+IGluZGV4IDM0NTIxMmU4YzY5MS4uNmNjNGY2M2I4NmM4
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+ICsrKyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+IEBAIC0xMzUsNiArMTM1LDcgQEAg
c3RydWN0IG1lc29uX25mY19uYW5kX2NoaXAgewo+ICBzdHJ1Y3QgbWVzb25fbmFuZF9lY2Mgewo+
ICAJdTMyIGJjaDsKPiAgCXUzMiBzdHJlbmd0aDsKPiArCXUzMiBzaXplOwo+ICB9Owo+ICAKPiAg
c3RydWN0IG1lc29uX25mY19kYXRhIHsKPiBAQCAtMTkwLDcgKzE5MSw4IEBAIHN0cnVjdCBtZXNv
bl9uZmMgewo+ICB9Owo+ICAKPiAgZW51bSB7Cj4gLQlORkNfRUNDX0JDSDhfMUsJCT0gMiwKPiAr
CU5GQ19FQ0NfQkNIOF81MTIJPSAxLAo+ICsJTkZDX0VDQ19CQ0g4XzFLLAo+ICAJTkZDX0VDQ19C
Q0gyNF8xSywKPiAgCU5GQ19FQ0NfQkNIMzBfMUssCj4gIAlORkNfRUNDX0JDSDQwXzFLLAo+IEBA
IC0xOTgsMTUgKzIwMCwxNiBAQCBlbnVtIHsKPiAgCU5GQ19FQ0NfQkNINjBfMUssCj4gIH07Cj4g
IAo+IC0jZGVmaW5lIE1FU09OX0VDQ19EQVRBKGIsIHMpCXsgLmJjaCA9IChiKSwJLnN0cmVuZ3Ro
ID0gKHMpfQo+ICsjZGVmaW5lIE1FU09OX0VDQ19EQVRBKGIsIHMsIHN6KQl7IC5iY2ggPSAoYiks
IC5zdHJlbmd0aCA9IChzKSwgLnNpemUgPSAoc3opIH0KPiAgCj4gIHN0YXRpYyBzdHJ1Y3QgbWVz
b25fbmFuZF9lY2MgbWVzb25fZWNjW10gPSB7Cj4gLQlNRVNPTl9FQ0NfREFUQShORkNfRUNDX0JD
SDhfMUssIDgpLAo+IC0JTUVTT05fRUNDX0RBVEEoTkZDX0VDQ19CQ0gyNF8xSywgMjQpLAo+IC0J
TUVTT05fRUNDX0RBVEEoTkZDX0VDQ19CQ0gzMF8xSywgMzApLAo+IC0JTUVTT05fRUNDX0RBVEEo
TkZDX0VDQ19CQ0g0MF8xSywgNDApLAo+IC0JTUVTT05fRUNDX0RBVEEoTkZDX0VDQ19CQ0g1MF8x
SywgNTApLAo+IC0JTUVTT05fRUNDX0RBVEEoTkZDX0VDQ19CQ0g2MF8xSywgNjApLAo+ICsJTUVT
T05fRUNDX0RBVEEoTkZDX0VDQ19CQ0g4XzUxMiwgOCwgIDUxMiksCj4gKwlNRVNPTl9FQ0NfREFU
QShORkNfRUNDX0JDSDhfMUssICA4LCAgMTAyNCksCj4gKwlNRVNPTl9FQ0NfREFUQShORkNfRUND
X0JDSDI0XzFLLCAyNCwgMTAyNCksCj4gKwlNRVNPTl9FQ0NfREFUQShORkNfRUNDX0JDSDMwXzFL
LCAzMCwgMTAyNCksCj4gKwlNRVNPTl9FQ0NfREFUQShORkNfRUNDX0JDSDQwXzFLLCA0MCwgMTAy
NCksCj4gKwlNRVNPTl9FQ0NfREFUQShORkNfRUNDX0JDSDUwXzFLLCA1MCwgMTAyNCksCj4gKwlN
RVNPTl9FQ0NfREFUQShORkNfRUNDX0JDSDYwXzFLLCA2MCwgMTAyNCksCj4gIH07Cj4gIAo+ICBz
dGF0aWMgaW50IG1lc29uX25hbmRfY2FsY19lY2NfYnl0ZXMoaW50IHN0ZXBfc2l6ZSwgaW50IHN0
cmVuZ3RoKQo+IEBAIC0yMjQsOCArMjI3LDI3IEBAIHN0YXRpYyBpbnQgbWVzb25fbmFuZF9jYWxj
X2VjY19ieXRlcyhpbnQgc3RlcF9zaXplLCBpbnQgc3RyZW5ndGgpCj4gIAo+ICBOQU5EX0VDQ19D
QVBTX1NJTkdMRShtZXNvbl9neGxfZWNjX2NhcHMsCj4gIAkJICAgICBtZXNvbl9uYW5kX2NhbGNf
ZWNjX2J5dGVzLCAxMDI0LCA4LCAyNCwgMzAsIDQwLCA1MCwgNjApOwo+IC1OQU5EX0VDQ19DQVBT
X1NJTkdMRShtZXNvbl9heGdfZWNjX2NhcHMsCj4gLQkJICAgICBtZXNvbl9uYW5kX2NhbGNfZWNj
X2J5dGVzLCAxMDI0LCA4KTsKPiArCj4gK3N0YXRpYyBjb25zdCBpbnQgYXhnX3N0ZXBpbmZvX3N0
cmVuZ3Roc1tdID0geyA4IH07Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbmFuZF9lY2Nfc3RlcF9p
bmZvIGF4Z19zdGVwaW5mb18xMDI0ID0gewo+ICsJLnN0ZXBzaXplID0gMTAyNCwKPiArCS5zdHJl
bmd0aHMgPSBheGdfc3RlcGluZm9fc3RyZW5ndGhzLAo+ICsJLm5zdHJlbmd0aHMgPSBBUlJBWV9T
SVpFKGF4Z19zdGVwaW5mb19zdHJlbmd0aHMpCj4gK307Cj4gKwo+ICtzdGF0aWMgY29uc3Qgc3Ry
dWN0IG5hbmRfZWNjX3N0ZXBfaW5mbyBheGdfc3RlcGluZm9fNTEyID0gewo+ICsJLnN0ZXBzaXpl
ID0gNTEyLAo+ICsJLnN0cmVuZ3RocyA9IGF4Z19zdGVwaW5mb19zdHJlbmd0aHMsCj4gKwkubnN0
cmVuZ3RocyA9IEFSUkFZX1NJWkUoYXhnX3N0ZXBpbmZvX3N0cmVuZ3RocykKPiArfTsKPiArCj4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgbmFuZF9lY2Nfc3RlcF9pbmZvIGF4Z19zdGVwaW5mb1tdID0g
eyBheGdfc3RlcGluZm9fMTAyNCwgYXhnX3N0ZXBpbmZvXzUxMiB9Owo+ICsKPiArc3RhdGljIGNv
bnN0IHN0cnVjdCBuYW5kX2VjY19jYXBzIG1lc29uX2F4Z19lY2NfY2FwcyA9IHsKPiArCS5zdGVw
aW5mb3MgPSBheGdfc3RlcGluZm8sCj4gKwkubnN0ZXBpbmZvcyA9IEFSUkFZX1NJWkUoYXhnX3N0
ZXBpbmZvKSwKPiArCS5jYWxjX2VjY19ieXRlcyA9IG1lc29uX25hbmRfY2FsY19lY2NfYnl0ZXMs
Cj4gK307Cj4gIAo+ICBzdGF0aWMgc3RydWN0IG1lc29uX25mY19uYW5kX2NoaXAgKnRvX21lc29u
X25hbmQoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCkKPiAgewo+IEBAIC0xMjU5LDcgKzEyODEsOCBA
QCBzdGF0aWMgaW50IG1lc29uX25hbmRfYmNoX21vZGUoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCkK
PiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgCj4gIAlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRSht
ZXNvbl9lY2MpOyBpKyspIHsKPiAtCQlpZiAobWVzb25fZWNjW2ldLnN0cmVuZ3RoID09IG5hbmQt
PmVjYy5zdHJlbmd0aCkgewo+ICsJCWlmIChtZXNvbl9lY2NbaV0uc3RyZW5ndGggPT0gbmFuZC0+
ZWNjLnN0cmVuZ3RoICYmCj4gKwkJICAgIG1lc29uX2VjY1tpXS5zaXplID09IG5hbmQtPmVjYy5z
aXplKSB7Cj4gIAkJCW1lc29uX2NoaXAtPmJjaF9tb2RlID0gbWVzb25fZWNjW2ldLmJjaDsKPiAg
CQkJcmV0dXJuIDA7Cj4gIAkJfQo+IEBAIC0xMjc4LDcgKzEzMDEsNyBAQCBzdGF0aWMgaW50IG1l
c29uX25hbmRfYXR0YWNoX2NoaXAoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCkKPiAgCXN0cnVjdCBt
ZXNvbl9uZmMgKm5mYyA9IG5hbmRfZ2V0X2NvbnRyb2xsZXJfZGF0YShuYW5kKTsKPiAgCXN0cnVj
dCBtZXNvbl9uZmNfbmFuZF9jaGlwICptZXNvbl9jaGlwID0gdG9fbWVzb25fbmFuZChuYW5kKTsK
PiAgCXN0cnVjdCBtdGRfaW5mbyAqbXRkID0gbmFuZF90b19tdGQobmFuZCk7Cj4gLQlpbnQgbnNl
Y3RvcnMgPSBtdGQtPndyaXRlc2l6ZSAvIDEwMjQ7Cj4gKwlpbnQgbnNlY3RvcnMgPSBtdGQtPndy
aXRlc2l6ZSAvIDUxMjsKClRoaXMgY2Fubm90IGJlIHVuY29uZGl0aW9uYWwsIHJpZ2h0PwoKPiAg
CWludCByYXdfd3JpdGVzaXplOwo+ICAJaW50IHJldDsKPiAgCgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
