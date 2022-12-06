Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D84C352A1
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Dec 2022 12:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y6Cb+tzmlBkPdHqTTe+LCT1IEwBUakWDomA3jOnPwbY=; b=h6yW+0iYJMEYqS
	h2OTgN/wPuRM9bDWxR0LsZGhrIOYcTMjD9AeN7N0nV1bwvVsHBQi1ABzJoUOD9ihpzVODoRiyMbR5
	zc1flEfFW+HmfjnQejq0RKXNOfMT939or+6SoyrK0R68Ua9svcP0/8WJnUUKDG/tVQ6XSvkuheaKP
	KNt7SnOIb34DeQD1ZmUa770iQbtkNfwJdv10PlvG/XQbyOTnOSuXjVTggu+Nqoec51HC7b2ohdgzy
	f2QR8EUajsJYrIgdIa1LWxppfs70CCcIZG68gMQqdGYMeNFnOmEOaKxU0+ZAZmmXR0DLm9D63gcvI
	EiEV5li09uP9Z+Vl0VXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Wy7-0093Bu-Qg; Tue, 06 Dec 2022 12:22:39 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Wxf-0092u2-U3; Tue, 06 Dec 2022 12:22:17 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AE439660035D;
	Tue,  6 Dec 2022 12:22:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670329327;
	bh=HFhsBPJUZ/W3qeEbtqj0mNmnYKJB/11JNCtWMdGTv88=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JMsgBLF19vGkI7bjFVq2yyNHu0QRemrayTu3nigu593WI7AyVTqCauD9mDxXD/hsT
	 mbaMKCn1Fk40bs0z68zMZPCQimF5KjiR6da/ZD8qHC2BvOnS75PQwmj5pv+uQOKX+p
	 IZbZtZkBzkqGU5pU1Qb17m0uH9snhHja5hA3vx2qKxXl98YmycaA8W/do9/AHOn17p
	 /cCy46ruAiCy/THacT1AIQOuE9+JulTQF5rWLLxSCFmgBjViBTU4bASICxzpV8xtYE
	 ko0tQ8tX/suIToA2tf1/OcuYZ3UCihVhGwVu6BCG9kAqLd+K+Ll+iN86jTsBIJ4+1j
	 fpRs2UUzSJhXg==
Message-ID: <b55ee8fa-7ad6-3bf9-4983-41a90bd75ce4@collabora.com>
Date: Tue, 6 Dec 2022 13:22:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 4/9] mtd: nand: ecc-mtk: Add ECC support fot MT7986 IC
Content-Language: en-US
To: =?UTF-8?B?WGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCk=?=
 <Xiangsheng.Hou@mediatek.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "gch981213@gmail.com" <gch981213@gmail.com>,
 "vigneshr@ti.com" <vigneshr@ti.com>, "richard@nod.at" <richard@nod.at>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?QmVubGlhbmcgWmhhbyAo6LW15pys5LquKQ==?=
 <Benliang.Zhao@mediatek.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?QmluIFpoYW5nICjnq6Dmlowp?= <bin.zhang@mediatek.com>
References: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
 <20221205065756.26875-5-xiangsheng.hou@mediatek.com>
 <50ede482-7f03-ff55-5ad0-aa6249027cbe@collabora.com>
 <149100d0dc205a317ed352cdfb391f2147a2afab.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <149100d0dc205a317ed352cdfb391f2147a2afab.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_042213_414923_F966BEA3 
X-CRM114-Status: GOOD (  13.18  )
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

SWwgMDYvMTIvMjIgMTA6MDQsIFhpYW5nc2hlbmcgSG91ICjkvq/npaXog5wpIGhhIHNjcml0dG86
Cj4gSGkgQW5nZWxvLAo+IAo+IE9uIE1vbiwgMjAyMi0xMi0wNSBhdCAxNToyMSArMDEwMCwgQW5n
ZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gd3JvdGU6Cj4+IElsIDA1LzEyLzIyIDA3OjU3LCBYaWFu
Z3NoZW5nIEhvdSBoYSBzY3JpdHRvOgo+Pj4gQWRkIEVDQyBzdXBwb3J0IGZvdCBNVDc5ODYgSUMu
Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogWGlhbmdzaGVuZyBIb3UgPHhpYW5nc2hlbmcuaG91QG1l
ZGlhdGVrLmNvbT4KPj4+IC0tLQo+Pj4gICAgZHJpdmVycy9tdGQvbmFuZC9lY2MtbXRrLmMgfCAx
OCArKysrKysrKysrKysrKysrKysKPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25z
KCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvZWNjLW10ay5jIGIvZHJp
dmVycy9tdGQvbmFuZC9lY2MtCj4+PiBtdGsuYwo+Pj4gaW5kZXggOWY5YjIwMWZlNzA2Li5jMmY2
Y2ZhNzZhMDQgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL2VjYy1tdGsuYwo+Pj4g
KysrIGIvZHJpdmVycy9tdGQvbmFuZC9lY2MtbXRrLmMKPj4+IEBAIC03OSw2ICs3OSwxMCBAQCBz
dGF0aWMgY29uc3QgdTggZWNjX3N0cmVuZ3RoX210NzYyMltdID0gewo+Pj4gICAgCTQsIDYsIDgs
IDEwLCAxMgo+Pj4gICAgfTsKPj4+ICAgIAo+Pj4gK3N0YXRpYyBjb25zdCB1OCBlY2Nfc3RyZW5n
dGhfbXQ3OTg2W10gPSB7Cj4+PiArCTQsIDYsIDgsIDEwLCAxMiwgMTQsIDE2LCAxOCwgMjAsIDIy
LCAyNAo+Pj4gK307Cj4+PiArCj4+PiAgICBlbnVtIG10a19lY2NfcmVncyB7Cj4+PiAgICAJRUND
X0VOQ1BBUjAwLAo+Pj4gICAgCUVDQ19FTkNJUlFfRU4sCj4+PiBAQCAtNDgzLDYgKzQ4NywxNyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19lY2NfY2Fwcwo+Pj4gbXRrX2VjY19jYXBzX210NzYy
MiA9IHsKPj4+ICAgIAkucGdfaXJxX3NlbCA9IDAsCj4+PiAgICB9Owo+Pj4gICAgCj4+PiArc3Rh
dGljIGNvbnN0IHN0cnVjdCBtdGtfZWNjX2NhcHMgbXRrX2VjY19jYXBzX210Nzk4NiA9IHsKPj4+
ICsJLmVycl9tYXNrID0gMHgxZiwKPj4KPj4gQ2FuJ3Qgd2UgdXNlIEdFTk1BU0soKSB0byBkZWZp
bmUgZXJyX21hc2sgaW5zdGVhZD8KPj4KPj4gI2RlZmluZSBNVDc5ODZfRVJSTlVNCUdFTk1BU0so
NCwgMCkKPj4KPj4gUC5TLjogRGlkIEkgZ2V0IHRoYXQgcmlnaHQ/IElzIHRoYXQgcmVmZXJyZWQg
dG8gdGhlIEVSUk5VTSh4KSBiaXRzCj4gCj4gWWVzLCB5b3UgYXJlIHJpZ2h0Lgo+IEkgd2lsbCBj
aGFuZ2UgbGlrZQo+ICNkZWZpbmUgRUNDX0VSUk1BU0soeCkgR0VOTUFTSyh4LCAwKSwKPiBzaW5j
ZSBvdGhlciBJQyBkcml2ZXIgZGF0YSB3aWxsIHVzZSAweDNmIGFuZCAweDdmIGVycl9tYXNrLgo+
IAoKSSB3b3VsZCBwcmVmZXIsIGluc3RlYWQsIHNvbWV0aGluZyBsaWtlCgojZGVmaW5lIE1UNzk4
Nl9FUlJOVU0JR0VOTUFTSyguLi4uKQojZGVmaW5lIE1UNzYyMl9FUlJOVU0JR0VOTUFTSyguLi4u
KQojZGVmaW5lIE1ULi4uLiAoZXRjKQoKaW5zdGVhZCBvZiBhIG1hY3JvIGNhbGxpbmcgYW5vdGhl
ciBtYWNyby4KClJlZ2FyZHMsCkFuZ2VsbwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
