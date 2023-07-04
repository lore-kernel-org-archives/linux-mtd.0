Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92AAEB64DA
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 09:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hf5Ge8R8OTpjdPRczx1JhAW1/ivVLPhT6gQGdU5IMec=; b=TM88bpICMTS0u2
	FtU24psmX2p9Gu6bKadgUVI1MjHzN0P3Ls4XgKRo3T7qUvFTJfjX+6L1b8cOgiplBt9c5AcDWmCii
	+Fnixxn5lGCvyPKiMpeSYhXgIumdskZJUuWdgEfy4O5lc99pyLeYhxuGrY3VpVDTTtihTlqZSi+Ig
	HlvwooXs5zKU34y1ctbRn5Oz4F0fY2fSKeu5/CxZYyFXKLbs6JVDIg94hxbNO+M2rHpl7GoG8G/kQ
	hiv3Y4nn64IYSNl+JB2X9Ip9FXdd9sgLn7xHDRARD5+q2i5k00fX1w6g7I4X/b7X8IvpaC+ga7om2
	+CBQermX5WZz/I/LL7dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGchb-00CnCt-2h;
	Tue, 04 Jul 2023 09:52:07 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGchX-00CnB2-1n;
	Tue, 04 Jul 2023 09:52:05 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 5CC0110005F;
	Tue,  4 Jul 2023 12:52:00 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 5CC0110005F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688464320;
	bh=6aHU9qCXGm3WV8is8vuW6UfIzP5GrTzeuf097Em3H+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=KWCIRLzfLA2l5MdNTi1c4llIzIntPopKcbY91bhWKOmVKbqyehCbyGdgv386KIh9L
	 W2g/UE/4N62TbJLXtGhjy/l5MsSvsLMZg3VD2GHyXPojyxAgY5prl1BWAbMuvfKjhc
	 VbFLWjB/SB5uZG/gb/Y2F5eCKz6rqnpBvV83R4te6VwcZ88WK/8QMPsQhASQLok+mS
	 0mlv84KCQg2RSVhvrgLdmrzRsnSEcF2sIk9dcAU7zb+uZHaDIi1TtlT3+56XsmLs6i
	 myrewkKbIByjCXvq85ICmBksJjZvLTbI1kAbNL+G/UVsdnssr9NoyinhpRv9ZjJlC3
	 JWre5jzGWSy6Q==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  4 Jul 2023 12:52:00 +0300 (MSK)
Received: from [192.168.0.12] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 4 Jul 2023 12:51:50 +0300
Message-ID: <aede4639-0e99-565a-c997-c414342c66af@sberdevices.ru>
Date: Tue, 4 Jul 2023 12:46:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v1 2/2] mtd: rawnand: meson: support for 512B ECC step
 size
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
	<kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230628092937.538683-1-AVKrasnov@sberdevices.ru>
 <20230628092937.538683-3-AVKrasnov@sberdevices.ru>
 <20230704103617.4affae8a@xps-13>
 <9e6eaa87-887c-f955-113a-43860c8ea00c@sberdevices.ru>
 <20230704114110.25ca9de4@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230704114110.25ca9de4@xps-13>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178414 [Jul 04 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVKrasnov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_from_domain_doesnt_match_to}, p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/04 05:54:00 #21559896
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_025203_970555_29AC20F2 
X-CRM114-Status: GOOD (  25.28  )
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

CgpPbiAwNC4wNy4yMDIzIDEyOjQxLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFR1ZSwgNCBKdWwgMjAyMyAx
MjoyMzowMyArMDMwMDoKPiAKPj4gT24gMDQuMDcuMjAyMyAxMTozNiwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPj4+IEhpIEFyc2VuaXksCj4+Pgo+Pj4gQVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdy
b3RlIG9uIFdlZCwgMjggSnVuIDIwMjMgMTI6Mjk6MzYgKzAzMDA6Cj4+PiAgIAo+Pj4+IE1lc29u
IE5BTkQgc3VwcG9ydHMgYm90aCA1MTJCIGFuZCAxMDI0QiBFQ0Mgc3RlcCBzaXplLgo+Pj4+Cj4+
Pj4gU2lnbmVkLW9mZi1ieTogQXJzZW5peSBLcmFzbm92IDxBVktyYXNub3ZAc2JlcmRldmljZXMu
cnU+Cj4+Pj4gLS0tCj4+Pj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYyB8IDQ3
ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDM1
IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21l
c29uX25hbmQuYwo+Pj4+IGluZGV4IDM0NTIxMmU4YzY5MS4uNmNjNGY2M2I4NmM4IDEwMDY0NAo+
Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+Pj4+ICsrKyBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+Pj4+IEBAIC0xMzUsNiArMTM1LDcgQEAg
c3RydWN0IG1lc29uX25mY19uYW5kX2NoaXAgewo+Pj4+ICBzdHJ1Y3QgbWVzb25fbmFuZF9lY2Mg
ewo+Pj4+ICAJdTMyIGJjaDsKPj4+PiAgCXUzMiBzdHJlbmd0aDsKPj4+PiArCXUzMiBzaXplOwo+
Pj4+ICB9Owo+Pj4+ICAKPj4+PiAgc3RydWN0IG1lc29uX25mY19kYXRhIHsKPj4+PiBAQCAtMTkw
LDcgKzE5MSw4IEBAIHN0cnVjdCBtZXNvbl9uZmMgewo+Pj4+ICB9Owo+Pj4+ICAKPj4+PiAgZW51
bSB7Cj4+Pj4gLQlORkNfRUNDX0JDSDhfMUsJCT0gMiwKPj4+PiArCU5GQ19FQ0NfQkNIOF81MTIJ
PSAxLAo+Pj4+ICsJTkZDX0VDQ19CQ0g4XzFLLAo+Pj4+ICAJTkZDX0VDQ19CQ0gyNF8xSywKPj4+
PiAgCU5GQ19FQ0NfQkNIMzBfMUssCj4+Pj4gIAlORkNfRUNDX0JDSDQwXzFLLAo+Pj4+IEBAIC0x
OTgsMTUgKzIwMCwxNiBAQCBlbnVtIHsKPj4+PiAgCU5GQ19FQ0NfQkNINjBfMUssCj4+Pj4gIH07
Cj4+Pj4gIAo+Pj4+IC0jZGVmaW5lIE1FU09OX0VDQ19EQVRBKGIsIHMpCXsgLmJjaCA9IChiKSwJ
LnN0cmVuZ3RoID0gKHMpfQo+Pj4+ICsjZGVmaW5lIE1FU09OX0VDQ19EQVRBKGIsIHMsIHN6KQl7
IC5iY2ggPSAoYiksIC5zdHJlbmd0aCA9IChzKSwgLnNpemUgPSAoc3opIH0KPj4+PiAgCj4+Pj4g
IHN0YXRpYyBzdHJ1Y3QgbWVzb25fbmFuZF9lY2MgbWVzb25fZWNjW10gPSB7Cj4+Pj4gLQlNRVNP
Tl9FQ0NfREFUQShORkNfRUNDX0JDSDhfMUssIDgpLAo+Pj4+IC0JTUVTT05fRUNDX0RBVEEoTkZD
X0VDQ19CQ0gyNF8xSywgMjQpLAo+Pj4+IC0JTUVTT05fRUNDX0RBVEEoTkZDX0VDQ19CQ0gzMF8x
SywgMzApLAo+Pj4+IC0JTUVTT05fRUNDX0RBVEEoTkZDX0VDQ19CQ0g0MF8xSywgNDApLAo+Pj4+
IC0JTUVTT05fRUNDX0RBVEEoTkZDX0VDQ19CQ0g1MF8xSywgNTApLAo+Pj4+IC0JTUVTT05fRUND
X0RBVEEoTkZDX0VDQ19CQ0g2MF8xSywgNjApLAo+Pj4+ICsJTUVTT05fRUNDX0RBVEEoTkZDX0VD
Q19CQ0g4XzUxMiwgOCwgIDUxMiksCj4+Pj4gKwlNRVNPTl9FQ0NfREFUQShORkNfRUNDX0JDSDhf
MUssICA4LCAgMTAyNCksCj4+Pj4gKwlNRVNPTl9FQ0NfREFUQShORkNfRUNDX0JDSDI0XzFLLCAy
NCwgMTAyNCksCj4+Pj4gKwlNRVNPTl9FQ0NfREFUQShORkNfRUNDX0JDSDMwXzFLLCAzMCwgMTAy
NCksCj4+Pj4gKwlNRVNPTl9FQ0NfREFUQShORkNfRUNDX0JDSDQwXzFLLCA0MCwgMTAyNCksCj4+
Pj4gKwlNRVNPTl9FQ0NfREFUQShORkNfRUNDX0JDSDUwXzFLLCA1MCwgMTAyNCksCj4+Pj4gKwlN
RVNPTl9FQ0NfREFUQShORkNfRUNDX0JDSDYwXzFLLCA2MCwgMTAyNCksCj4+Pj4gIH07Cj4+Pj4g
IAo+Pj4+ICBzdGF0aWMgaW50IG1lc29uX25hbmRfY2FsY19lY2NfYnl0ZXMoaW50IHN0ZXBfc2l6
ZSwgaW50IHN0cmVuZ3RoKQo+Pj4+IEBAIC0yMjQsOCArMjI3LDI3IEBAIHN0YXRpYyBpbnQgbWVz
b25fbmFuZF9jYWxjX2VjY19ieXRlcyhpbnQgc3RlcF9zaXplLCBpbnQgc3RyZW5ndGgpCj4+Pj4g
IAo+Pj4+ICBOQU5EX0VDQ19DQVBTX1NJTkdMRShtZXNvbl9neGxfZWNjX2NhcHMsCj4+Pj4gIAkJ
ICAgICBtZXNvbl9uYW5kX2NhbGNfZWNjX2J5dGVzLCAxMDI0LCA4LCAyNCwgMzAsIDQwLCA1MCwg
NjApOwo+Pj4+IC1OQU5EX0VDQ19DQVBTX1NJTkdMRShtZXNvbl9heGdfZWNjX2NhcHMsCj4+Pj4g
LQkJICAgICBtZXNvbl9uYW5kX2NhbGNfZWNjX2J5dGVzLCAxMDI0LCA4KTsKPj4+PiArCj4+Pj4g
K3N0YXRpYyBjb25zdCBpbnQgYXhnX3N0ZXBpbmZvX3N0cmVuZ3Roc1tdID0geyA4IH07Cj4+Pj4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgbmFuZF9lY2Nfc3RlcF9pbmZvIGF4Z19zdGVwaW5mb18xMDI0
ID0gewo+Pj4+ICsJLnN0ZXBzaXplID0gMTAyNCwKPj4+PiArCS5zdHJlbmd0aHMgPSBheGdfc3Rl
cGluZm9fc3RyZW5ndGhzLAo+Pj4+ICsJLm5zdHJlbmd0aHMgPSBBUlJBWV9TSVpFKGF4Z19zdGVw
aW5mb19zdHJlbmd0aHMpCj4+Pj4gK307Cj4+Pj4gKwo+Pj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IG5hbmRfZWNjX3N0ZXBfaW5mbyBheGdfc3RlcGluZm9fNTEyID0gewo+Pj4+ICsJLnN0ZXBzaXpl
ID0gNTEyLAo+Pj4+ICsJLnN0cmVuZ3RocyA9IGF4Z19zdGVwaW5mb19zdHJlbmd0aHMsCj4+Pj4g
KwkubnN0cmVuZ3RocyA9IEFSUkFZX1NJWkUoYXhnX3N0ZXBpbmZvX3N0cmVuZ3RocykKPj4+PiAr
fTsKPj4+PiArCj4+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbmFuZF9lY2Nfc3RlcF9pbmZvIGF4
Z19zdGVwaW5mb1tdID0geyBheGdfc3RlcGluZm9fMTAyNCwgYXhnX3N0ZXBpbmZvXzUxMiB9Owo+
Pj4+ICsKPj4+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBuYW5kX2VjY19jYXBzIG1lc29uX2F4Z19l
Y2NfY2FwcyA9IHsKPj4+PiArCS5zdGVwaW5mb3MgPSBheGdfc3RlcGluZm8sCj4+Pj4gKwkubnN0
ZXBpbmZvcyA9IEFSUkFZX1NJWkUoYXhnX3N0ZXBpbmZvKSwKPj4+PiArCS5jYWxjX2VjY19ieXRl
cyA9IG1lc29uX25hbmRfY2FsY19lY2NfYnl0ZXMsCj4+Pj4gK307Cj4+Pj4gIAo+Pj4+ICBzdGF0
aWMgc3RydWN0IG1lc29uX25mY19uYW5kX2NoaXAgKnRvX21lc29uX25hbmQoc3RydWN0IG5hbmRf
Y2hpcCAqbmFuZCkKPj4+PiAgewo+Pj4+IEBAIC0xMjU5LDcgKzEyODEsOCBAQCBzdGF0aWMgaW50
IG1lc29uX25hbmRfYmNoX21vZGUoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCkKPj4+PiAgCQlyZXR1
cm4gLUVJTlZBTDsKPj4+PiAgCj4+Pj4gIAlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShtZXNv
bl9lY2MpOyBpKyspIHsKPj4+PiAtCQlpZiAobWVzb25fZWNjW2ldLnN0cmVuZ3RoID09IG5hbmQt
PmVjYy5zdHJlbmd0aCkgewo+Pj4+ICsJCWlmIChtZXNvbl9lY2NbaV0uc3RyZW5ndGggPT0gbmFu
ZC0+ZWNjLnN0cmVuZ3RoICYmCj4+Pj4gKwkJICAgIG1lc29uX2VjY1tpXS5zaXplID09IG5hbmQt
PmVjYy5zaXplKSB7Cj4+Pj4gIAkJCW1lc29uX2NoaXAtPmJjaF9tb2RlID0gbWVzb25fZWNjW2ld
LmJjaDsKPj4+PiAgCQkJcmV0dXJuIDA7Cj4+Pj4gIAkJfQo+Pj4+IEBAIC0xMjc4LDcgKzEzMDEs
NyBAQCBzdGF0aWMgaW50IG1lc29uX25hbmRfYXR0YWNoX2NoaXAoc3RydWN0IG5hbmRfY2hpcCAq
bmFuZCkKPj4+PiAgCXN0cnVjdCBtZXNvbl9uZmMgKm5mYyA9IG5hbmRfZ2V0X2NvbnRyb2xsZXJf
ZGF0YShuYW5kKTsKPj4+PiAgCXN0cnVjdCBtZXNvbl9uZmNfbmFuZF9jaGlwICptZXNvbl9jaGlw
ID0gdG9fbWVzb25fbmFuZChuYW5kKTsKPj4+PiAgCXN0cnVjdCBtdGRfaW5mbyAqbXRkID0gbmFu
ZF90b19tdGQobmFuZCk7Cj4+Pj4gLQlpbnQgbnNlY3RvcnMgPSBtdGQtPndyaXRlc2l6ZSAvIDEw
MjQ7Cj4+Pj4gKwlpbnQgbnNlY3RvcnMgPSBtdGQtPndyaXRlc2l6ZSAvIDUxMjsgIAo+Pj4KPj4+
IFRoaXMgY2Fubm90IGJlIHVuY29uZGl0aW9uYWwsIHJpZ2h0PyAgCj4+Cj4+IEhlbGxvIE1pcXVl
bCEKPj4KPj4gWWVzLCB0aGlzIGNvZGUgbG9va3Mgc3RyYW5nZS4gJ25zZWN0b3JzJyBpcyB1c2Vk
IHRvIGNhbGN1bGF0ZSBzcGFjZSBpbiBPT0IKPj4gdGhhdCBjb3VsZCBiZSB1c2VkIGJ5IEVDQyBl
bmdpbmUgKHRoaXMgdmFsdWUgd2lsbCBiZSBwYXNzZWQgYXMgJ29vYmF2YWlsJwo+PiB0byAnbmFu
ZF9lY2NfY2hvb3NlX2NvbmYoKScpLiBJZGVhIG9mIDUxMiBpcyB0byBjb25zaWRlciAid29yc3Qi
IGNhc2UKPj4gZm9yIEVDQywgZS5nLiBtaW5pbWFsIG51bWJlciBvZiBieXRlcyBmb3IgRUNDIGVu
Z2luZSAoYW5kIGF0IHRoZSBzYW1lIHRpbWUKPj4gbWF4aW11bSBudW1iZXIgb2YgZnJlZSBieXRl
cykuIEZvciBNZXNvbiwgaWYgRUNDIHN0ZXAgc2l6ZSBpcyA1MTIsIHRoZW4gd2UKPj4gaGF2ZSA0
IHggMiBmcmVlIGJ5dGVzIGluIE9PQiAoaWYgc3RlcCBzaXplIGlmIDEwMjQgdGhlbiB3ZSBoYXZl
IDIgeCAyIGZyZWUKPj4gYnl0ZXMgaW4gT09CKS4KPj4KPj4gSSB0aGluayB0aGlzIGNvZGUgY291
bGQgYmUgcmV3b3JrZWQgaW4gdGhlIGZvbGxvd2luZyB3YXk6Cj4+Cj4+IGlmIEVDQyBzdGVwIHNp
emUgaXMgYWxyZWFkeSBrbm93biBoZXJlIChmcm9tIERUUyksIGNhbGN1bGF0ZSAnbnNlY3RvcnMn
IHVzaW5nCj4+IGdpdmVuIHZhbHVlIChkaXYgYnkgNTEyIGZvciBleGFtcGxlKS4gT3RoZXJ3aXNl
IGNhbGN1bGF0ZSAnbnNlY3RvcnMnIGluIHRoZQo+PiBjdXJyZW50IG1hbm5lcjoKPiAKPiBJdCB3
aWxsIGFsd2F5cyBiZSBrbm93biB3aGVuIHRoZXNlIGZ1bmN0aW9uIGFyZSBydW4uIFRoZXJlIGlz
IG5vCj4gZ3Vlc3NpbmcgaGVyZS4KCkhtIEkgY2hlY2tlZCwgdGhhdCBidXQgaWYgc3RlcCBzaXpl
IGlzIG5vdCBzZXQgaW4gRFRTLCBoZXJlIGl0IHdpbGwgYmUgMCwgCnRoZW4gaXQgd2lsbCBiZSBz
ZWxlY3RlZCBpbiAnbmFuZF9lY2NfY2hvb3NlX2NvbmYoKScgYWNjb3JkaW5nIHByb3ZpZGVkICdl
Y2NfY2FwcycKYW5kICdvb2JhdmFpbCcuLi4KCkFueXdheSwgSSdsbCBkbyB0aGUgZm9sbG93aW5n
IHRoaW5nOgoKaW50IG5zZWN0b3JzOwoKaWYgKG5hbmQtPmVjYy5zaXplKQogICAgbnNlY3RvcnMg
PSBtdGQtPndyaXRlc2l6ZSAvIG5hbmQtPmVjYy5zaXplOyA8LS0tIHRoaXMgaXMgZm9yIDUxMiBF
Q0MKZWxzZQogICAgbnNlY3RvcnMgPSBtdGQtPndyaXRlc2l6ZSAvIDEwMjQ7IDwtLS0gdGhpcyBp
cyBmb3IgZGVmYXVsdCAxMDI0IEVDQwoKVGhhbmtzLCBBcnNlbml5Cgo+IAo+Pgo+PiBpbnQgbnNl
Y3RvcnMgPSBtdGQtPndyaXRlc2l6ZSAvIDEwMjQ7Cj4+Cj4+IE1vcmVvdmVyIDEwMjQgaXMgZGVm
YXVsdCBFQ0Mgc3RlcCBzaXplIGZvciB0aGlzIGRyaXZlciwgc28gZGVmYXVsdCBiZWhhdmlvdXIK
Pj4gd2lsbCBiZSBwcmVzZXJ2ZWQuCj4gCj4gWWVzLCBvdGhlcndpc2UgeW91IHdvdWxkIGJyZWFr
IGV4aXN0aW5nIHVzZXJzLgo+IAo+Pgo+PiBUaGFua3MsIEFyc2VuaXkKPj4KPj4+ICAgCj4+Pj4g
IAlpbnQgcmF3X3dyaXRlc2l6ZTsKPj4+PiAgCWludCByZXQ7Cj4+Pj4gICAgCj4+Pgo+Pj4KPj4+
IFRoYW5rcywKPj4+IE1pcXXDqGwgIAo+IAo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
