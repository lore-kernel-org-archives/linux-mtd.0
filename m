Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D018CEB64DD
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 09:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KafvZkk8PjSY9TzDMluUIi4rhW8srWb/eO89bF5l0Xk=; b=ZzzJTx67SgaGP0
	zLZYeqVj27LkXzAuW2u0pk7rrtQ9YDZQwW5cNgSM9Ylk9pa49xdC4DhWXMFPlnL4EFGwzZu1K6i/g
	8JfOpH1MYrizlY/hz12h6mWpwXaxUqFKkwxbwrLgVua8QW66EhmR+5ctgO/2PcjP/eQ9mQMiW5nj3
	Q0+7XSbz1gelL13H3NzbleOzhA57oBlQqjo5ZTvQv80hnsGp3+HewTplyWgbLDqGv2WIeKwe4EvJL
	iD+UWFwzZVus4J00tYF5MeRBafX5E5t8Gt4m+3Hvg/2AnS0lex78XntOL2vnIGRO3wGhbWE57c8dT
	5HkcO4L32NJ+E2Swqh8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGcKh-00CiLo-1z;
	Tue, 04 Jul 2023 09:28:27 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGcKc-00CiJe-1q;
	Tue, 04 Jul 2023 09:28:25 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id ED8FB10004A;
	Tue,  4 Jul 2023 12:28:12 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru ED8FB10004A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688462892;
	bh=ox4jwTjCn2n4xdDzV3Fc7HB9y5dVEtQjvUV2g7b3hb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=cq+V+h3YhhOQSdqNLXjAQ5hilJo3Nd2KU1I/S4MwMooJv1MbNx+fyN4vkkpUhdccH
	 nV0ULlDUJPVEurW3M108SUThwdIDGXABogUpOLnhTwr+VWQkoBAIbA+I6XzW609gl3
	 fZRvgYleAE+H4dEcFfpeyG+ff84IdGnHLBAvAwBzFLzNyccVMwB/MPUL+oVeuHPuAf
	 rB9OhD0BxcXAqM2fWPSeiW1VloQ9h0OhZ/uKeQfOnuuVv1LurH3+8qo03xxxXCfgcI
	 LI1Xfs5S8f7pg58xS1hQWSs7+wZ9cjfBjtvqot0sh65t/XSzgRNcNTLdyD0azJCAot
	 dln7oTw/ci4IQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  4 Jul 2023 12:28:12 +0300 (MSK)
Received: from [192.168.0.12] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 4 Jul 2023 12:28:03 +0300
Message-ID: <9e6eaa87-887c-f955-113a-43860c8ea00c@sberdevices.ru>
Date: Tue, 4 Jul 2023 12:23:03 +0300
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
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230704103617.4affae8a@xps-13>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178413 [Jul 04 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVKrasnov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_from_domain_doesnt_match_to}, p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/04 05:54:00 #21559896
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_022823_317180_E0C7577F 
X-CRM114-Status: GOOD (  22.65  )
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

CgpPbiAwNC4wNy4yMDIzIDExOjM2LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gQVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFdlZCwgMjggSnVuIDIwMjMg
MTI6Mjk6MzYgKzAzMDA6Cj4gCj4+IE1lc29uIE5BTkQgc3VwcG9ydHMgYm90aCA1MTJCIGFuZCAx
MDI0QiBFQ0Mgc3RlcCBzaXplLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBcnNlbml5IEtyYXNub3Yg
PEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydT4KPj4gLS0tCj4+ICBkcml2ZXJzL210ZC9uYW5kL3Jh
dy9tZXNvbl9uYW5kLmMgfCA0NyArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4+ICAx
IGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4+Cj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4gaW5kZXggMzQ1MjEyZThjNjkxLi42Y2M0ZjYzYjg2
YzggMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+PiAr
KysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4gQEAgLTEzNSw2ICsxMzUs
NyBAQCBzdHJ1Y3QgbWVzb25fbmZjX25hbmRfY2hpcCB7Cj4+ICBzdHJ1Y3QgbWVzb25fbmFuZF9l
Y2Mgewo+PiAgCXUzMiBiY2g7Cj4+ICAJdTMyIHN0cmVuZ3RoOwo+PiArCXUzMiBzaXplOwo+PiAg
fTsKPj4gIAo+PiAgc3RydWN0IG1lc29uX25mY19kYXRhIHsKPj4gQEAgLTE5MCw3ICsxOTEsOCBA
QCBzdHJ1Y3QgbWVzb25fbmZjIHsKPj4gIH07Cj4+ICAKPj4gIGVudW0gewo+PiAtCU5GQ19FQ0Nf
QkNIOF8xSwkJPSAyLAo+PiArCU5GQ19FQ0NfQkNIOF81MTIJPSAxLAo+PiArCU5GQ19FQ0NfQkNI
OF8xSywKPj4gIAlORkNfRUNDX0JDSDI0XzFLLAo+PiAgCU5GQ19FQ0NfQkNIMzBfMUssCj4+ICAJ
TkZDX0VDQ19CQ0g0MF8xSywKPj4gQEAgLTE5OCwxNSArMjAwLDE2IEBAIGVudW0gewo+PiAgCU5G
Q19FQ0NfQkNINjBfMUssCj4+ICB9Owo+PiAgCj4+IC0jZGVmaW5lIE1FU09OX0VDQ19EQVRBKGIs
IHMpCXsgLmJjaCA9IChiKSwJLnN0cmVuZ3RoID0gKHMpfQo+PiArI2RlZmluZSBNRVNPTl9FQ0Nf
REFUQShiLCBzLCBzeikJeyAuYmNoID0gKGIpLCAuc3RyZW5ndGggPSAocyksIC5zaXplID0gKHN6
KSB9Cj4+ICAKPj4gIHN0YXRpYyBzdHJ1Y3QgbWVzb25fbmFuZF9lY2MgbWVzb25fZWNjW10gPSB7
Cj4+IC0JTUVTT05fRUNDX0RBVEEoTkZDX0VDQ19CQ0g4XzFLLCA4KSwKPj4gLQlNRVNPTl9FQ0Nf
REFUQShORkNfRUNDX0JDSDI0XzFLLCAyNCksCj4+IC0JTUVTT05fRUNDX0RBVEEoTkZDX0VDQ19C
Q0gzMF8xSywgMzApLAo+PiAtCU1FU09OX0VDQ19EQVRBKE5GQ19FQ0NfQkNINDBfMUssIDQwKSwK
Pj4gLQlNRVNPTl9FQ0NfREFUQShORkNfRUNDX0JDSDUwXzFLLCA1MCksCj4+IC0JTUVTT05fRUND
X0RBVEEoTkZDX0VDQ19CQ0g2MF8xSywgNjApLAo+PiArCU1FU09OX0VDQ19EQVRBKE5GQ19FQ0Nf
QkNIOF81MTIsIDgsICA1MTIpLAo+PiArCU1FU09OX0VDQ19EQVRBKE5GQ19FQ0NfQkNIOF8xSywg
IDgsICAxMDI0KSwKPj4gKwlNRVNPTl9FQ0NfREFUQShORkNfRUNDX0JDSDI0XzFLLCAyNCwgMTAy
NCksCj4+ICsJTUVTT05fRUNDX0RBVEEoTkZDX0VDQ19CQ0gzMF8xSywgMzAsIDEwMjQpLAo+PiAr
CU1FU09OX0VDQ19EQVRBKE5GQ19FQ0NfQkNINDBfMUssIDQwLCAxMDI0KSwKPj4gKwlNRVNPTl9F
Q0NfREFUQShORkNfRUNDX0JDSDUwXzFLLCA1MCwgMTAyNCksCj4+ICsJTUVTT05fRUNDX0RBVEEo
TkZDX0VDQ19CQ0g2MF8xSywgNjAsIDEwMjQpLAo+PiAgfTsKPj4gIAo+PiAgc3RhdGljIGludCBt
ZXNvbl9uYW5kX2NhbGNfZWNjX2J5dGVzKGludCBzdGVwX3NpemUsIGludCBzdHJlbmd0aCkKPj4g
QEAgLTIyNCw4ICsyMjcsMjcgQEAgc3RhdGljIGludCBtZXNvbl9uYW5kX2NhbGNfZWNjX2J5dGVz
KGludCBzdGVwX3NpemUsIGludCBzdHJlbmd0aCkKPj4gIAo+PiAgTkFORF9FQ0NfQ0FQU19TSU5H
TEUobWVzb25fZ3hsX2VjY19jYXBzLAo+PiAgCQkgICAgIG1lc29uX25hbmRfY2FsY19lY2NfYnl0
ZXMsIDEwMjQsIDgsIDI0LCAzMCwgNDAsIDUwLCA2MCk7Cj4+IC1OQU5EX0VDQ19DQVBTX1NJTkdM
RShtZXNvbl9heGdfZWNjX2NhcHMsCj4+IC0JCSAgICAgbWVzb25fbmFuZF9jYWxjX2VjY19ieXRl
cywgMTAyNCwgOCk7Cj4+ICsKPj4gK3N0YXRpYyBjb25zdCBpbnQgYXhnX3N0ZXBpbmZvX3N0cmVu
Z3Roc1tdID0geyA4IH07Cj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG5hbmRfZWNjX3N0ZXBfaW5m
byBheGdfc3RlcGluZm9fMTAyNCA9IHsKPj4gKwkuc3RlcHNpemUgPSAxMDI0LAo+PiArCS5zdHJl
bmd0aHMgPSBheGdfc3RlcGluZm9fc3RyZW5ndGhzLAo+PiArCS5uc3RyZW5ndGhzID0gQVJSQVlf
U0laRShheGdfc3RlcGluZm9fc3RyZW5ndGhzKQo+PiArfTsKPj4gKwo+PiArc3RhdGljIGNvbnN0
IHN0cnVjdCBuYW5kX2VjY19zdGVwX2luZm8gYXhnX3N0ZXBpbmZvXzUxMiA9IHsKPj4gKwkuc3Rl
cHNpemUgPSA1MTIsCj4+ICsJLnN0cmVuZ3RocyA9IGF4Z19zdGVwaW5mb19zdHJlbmd0aHMsCj4+
ICsJLm5zdHJlbmd0aHMgPSBBUlJBWV9TSVpFKGF4Z19zdGVwaW5mb19zdHJlbmd0aHMpCj4+ICt9
Owo+PiArCj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG5hbmRfZWNjX3N0ZXBfaW5mbyBheGdfc3Rl
cGluZm9bXSA9IHsgYXhnX3N0ZXBpbmZvXzEwMjQsIGF4Z19zdGVwaW5mb181MTIgfTsKPj4gKwo+
PiArc3RhdGljIGNvbnN0IHN0cnVjdCBuYW5kX2VjY19jYXBzIG1lc29uX2F4Z19lY2NfY2FwcyA9
IHsKPj4gKwkuc3RlcGluZm9zID0gYXhnX3N0ZXBpbmZvLAo+PiArCS5uc3RlcGluZm9zID0gQVJS
QVlfU0laRShheGdfc3RlcGluZm8pLAo+PiArCS5jYWxjX2VjY19ieXRlcyA9IG1lc29uX25hbmRf
Y2FsY19lY2NfYnl0ZXMsCj4+ICt9Owo+PiAgCj4+ICBzdGF0aWMgc3RydWN0IG1lc29uX25mY19u
YW5kX2NoaXAgKnRvX21lc29uX25hbmQoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCkKPj4gIHsKPj4g
QEAgLTEyNTksNyArMTI4MSw4IEBAIHN0YXRpYyBpbnQgbWVzb25fbmFuZF9iY2hfbW9kZShzdHJ1
Y3QgbmFuZF9jaGlwICpuYW5kKQo+PiAgCQlyZXR1cm4gLUVJTlZBTDsKPj4gIAo+PiAgCWZvciAo
aSA9IDA7IGkgPCBBUlJBWV9TSVpFKG1lc29uX2VjYyk7IGkrKykgewo+PiAtCQlpZiAobWVzb25f
ZWNjW2ldLnN0cmVuZ3RoID09IG5hbmQtPmVjYy5zdHJlbmd0aCkgewo+PiArCQlpZiAobWVzb25f
ZWNjW2ldLnN0cmVuZ3RoID09IG5hbmQtPmVjYy5zdHJlbmd0aCAmJgo+PiArCQkgICAgbWVzb25f
ZWNjW2ldLnNpemUgPT0gbmFuZC0+ZWNjLnNpemUpIHsKPj4gIAkJCW1lc29uX2NoaXAtPmJjaF9t
b2RlID0gbWVzb25fZWNjW2ldLmJjaDsKPj4gIAkJCXJldHVybiAwOwo+PiAgCQl9Cj4+IEBAIC0x
Mjc4LDcgKzEzMDEsNyBAQCBzdGF0aWMgaW50IG1lc29uX25hbmRfYXR0YWNoX2NoaXAoc3RydWN0
IG5hbmRfY2hpcCAqbmFuZCkKPj4gIAlzdHJ1Y3QgbWVzb25fbmZjICpuZmMgPSBuYW5kX2dldF9j
b250cm9sbGVyX2RhdGEobmFuZCk7Cj4+ICAJc3RydWN0IG1lc29uX25mY19uYW5kX2NoaXAgKm1l
c29uX2NoaXAgPSB0b19tZXNvbl9uYW5kKG5hbmQpOwo+PiAgCXN0cnVjdCBtdGRfaW5mbyAqbXRk
ID0gbmFuZF90b19tdGQobmFuZCk7Cj4+IC0JaW50IG5zZWN0b3JzID0gbXRkLT53cml0ZXNpemUg
LyAxMDI0Owo+PiArCWludCBuc2VjdG9ycyA9IG10ZC0+d3JpdGVzaXplIC8gNTEyOwo+IAo+IFRo
aXMgY2Fubm90IGJlIHVuY29uZGl0aW9uYWwsIHJpZ2h0PwoKSGVsbG8gTWlxdWVsIQoKWWVzLCB0
aGlzIGNvZGUgbG9va3Mgc3RyYW5nZS4gJ25zZWN0b3JzJyBpcyB1c2VkIHRvIGNhbGN1bGF0ZSBz
cGFjZSBpbiBPT0IKdGhhdCBjb3VsZCBiZSB1c2VkIGJ5IEVDQyBlbmdpbmUgKHRoaXMgdmFsdWUg
d2lsbCBiZSBwYXNzZWQgYXMgJ29vYmF2YWlsJwp0byAnbmFuZF9lY2NfY2hvb3NlX2NvbmYoKScp
LiBJZGVhIG9mIDUxMiBpcyB0byBjb25zaWRlciAid29yc3QiIGNhc2UKZm9yIEVDQywgZS5nLiBt
aW5pbWFsIG51bWJlciBvZiBieXRlcyBmb3IgRUNDIGVuZ2luZSAoYW5kIGF0IHRoZSBzYW1lIHRp
bWUKbWF4aW11bSBudW1iZXIgb2YgZnJlZSBieXRlcykuIEZvciBNZXNvbiwgaWYgRUNDIHN0ZXAg
c2l6ZSBpcyA1MTIsIHRoZW4gd2UKaGF2ZSA0IHggMiBmcmVlIGJ5dGVzIGluIE9PQiAoaWYgc3Rl
cCBzaXplIGlmIDEwMjQgdGhlbiB3ZSBoYXZlIDIgeCAyIGZyZWUKYnl0ZXMgaW4gT09CKS4KCkkg
dGhpbmsgdGhpcyBjb2RlIGNvdWxkIGJlIHJld29ya2VkIGluIHRoZSBmb2xsb3dpbmcgd2F5OgoK
aWYgRUNDIHN0ZXAgc2l6ZSBpcyBhbHJlYWR5IGtub3duIGhlcmUgKGZyb20gRFRTKSwgY2FsY3Vs
YXRlICduc2VjdG9ycycgdXNpbmcKZ2l2ZW4gdmFsdWUgKGRpdiBieSA1MTIgZm9yIGV4YW1wbGUp
LiBPdGhlcndpc2UgY2FsY3VsYXRlICduc2VjdG9ycycgaW4gdGhlCmN1cnJlbnQgbWFubmVyOgoK
aW50IG5zZWN0b3JzID0gbXRkLT53cml0ZXNpemUgLyAxMDI0OwoKTW9yZW92ZXIgMTAyNCBpcyBk
ZWZhdWx0IEVDQyBzdGVwIHNpemUgZm9yIHRoaXMgZHJpdmVyLCBzbyBkZWZhdWx0IGJlaGF2aW91
cgp3aWxsIGJlIHByZXNlcnZlZC4KClRoYW5rcywgQXJzZW5peQoKPiAKPj4gIAlpbnQgcmF3X3dy
aXRlc2l6ZTsKPj4gIAlpbnQgcmV0Owo+PiAgCj4gCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
