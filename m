Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A4FC001B0
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 10:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bNZV3WnIrljpemyte8ALvW37wV6xtsxNdzcaQe9+Ngk=; b=LQ+aDJlAHFh8y3
	EM4gzQFMjDDA8AqBUJ92BlwJAphFQ5d38c889h1Xc8zHd2svC58/Z+n2w/ALfOMU54SAtuJ2OMvty
	2r9ETe69VaaWdomXVFCizqjnpt6oHC7H8OOAcyL/07nDAEMETOQFFLkyFbJ2FJFj4CUR3Q0uv5wuu
	mE6lfIxWUCFRyPRio7l7FwBqQ2O9n3tmtOBeGcFhx694/d2KrVk7ik3hcBTAq7bz/GYgBhSvWdPX4
	q69Ywluw8Wbtn8ch8RBEyCcJUkEB5IvuVnUif398mHpDOFImOhw+9W87geIZEhTfFBBbbxUgBkf8w
	FW96VYs/NcT+Bzrvy73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGdEx-00CsFN-0T;
	Tue, 04 Jul 2023 10:26:35 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGdEt-00CsCJ-05;
	Tue, 04 Jul 2023 10:26:33 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 97D8C100061;
	Tue,  4 Jul 2023 13:26:27 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 97D8C100061
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688466387;
	bh=tCA/VjPpfkK2yojMVa3HrJf75D4zZdCMfmdCF4LawF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=Qci3fecCVE7EdZqWTrNIb/U4XV93APT3cNz9rT7NLJeryBUsMLgLGYBFWs6jeIrXI
	 Qj4Whu+1hNU/bn54YmHUQTdy5+yZqMg1qrmdPBgWmdx9M9Y8Ly94P4ahpiZ2He+V7i
	 khRho2v/XWVpIbYjUCxb74kf6slFRjLoQ9rJo/j5Yj1L2hVhbyADF5bF/oZQOWaJNl
	 9lNbHTMegbYVuh/MNQtvpVlujTM1KkJHhL5hCTMunBAXBCpjrqBmVk/Q4D4LwskAmo
	 TD7g8s5i9h5vMIPVacq+mSQd6tq72j9mOx8j2mXD+7s9RcZGBqQ1qeyhWpt8bWm3QT
	 Q/BiSN2qaOabw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  4 Jul 2023 13:26:27 +0300 (MSK)
Received: from [192.168.0.12] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 4 Jul 2023 13:26:17 +0300
Message-ID: <ee2eb73a-fb25-58ae-cf7e-83d971b7b8b2@sberdevices.ru>
Date: Tue, 4 Jul 2023 13:21:17 +0300
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
 <aede4639-0e99-565a-c997-c414342c66af@sberdevices.ru>
 <20230704115628.55320428@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230704115628.55320428@xps-13>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178415 [Jul 04 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVKrasnov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/04 05:54:00 #21559896
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_032631_416077_BB4B1A00 
X-CRM114-Status: GOOD (  24.59  )
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

CgpPbiAwNC4wNy4yMDIzIDEyOjU2LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFR1ZSwgNCBKdWwgMjAyMyAx
Mjo0Njo1MSArMDMwMDoKPiAKPj4gT24gMDQuMDcuMjAyMyAxMjo0MSwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPj4+IEhpIEFyc2VuaXksCj4+Pgo+Pj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdy
b3RlIG9uIFR1ZSwgNCBKdWwgMjAyMyAxMjoyMzowMyArMDMwMDoKPj4+ICAgCj4+Pj4gT24gMDQu
MDcuMjAyMyAxMTozNiwgTWlxdWVsIFJheW5hbCB3cm90ZTogIAo+Pj4+PiBIaSBBcnNlbml5LAo+
Pj4+Pgo+Pj4+PiBBVktyYXNub3ZAc2JlcmRldmljZXMucnUgd3JvdGUgb24gV2VkLCAyOCBKdW4g
MjAyMyAxMjoyOTozNiArMDMwMDoKPj4+Pj4gICAgIAo+Pj4+Pj4gTWVzb24gTkFORCBzdXBwb3J0
cyBib3RoIDUxMkIgYW5kIDEwMjRCIEVDQyBzdGVwIHNpemUuCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVk
LW9mZi1ieTogQXJzZW5peSBLcmFzbm92IDxBVktyYXNub3ZAc2JlcmRldmljZXMucnU+Cj4+Pj4+
PiAtLS0KPj4+Pj4+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgfCA0NyArKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4+Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDM1IGlu
c2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9t
ZXNvbl9uYW5kLmMKPj4+Pj4+IGluZGV4IDM0NTIxMmU4YzY5MS4uNmNjNGY2M2I4NmM4IDEwMDY0
NAo+Pj4+Pj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4+Pj4+PiAr
KysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4+Pj4+IEBAIC0xMzUsNiAr
MTM1LDcgQEAgc3RydWN0IG1lc29uX25mY19uYW5kX2NoaXAgewo+Pj4+Pj4gIHN0cnVjdCBtZXNv
bl9uYW5kX2VjYyB7Cj4+Pj4+PiAgCXUzMiBiY2g7Cj4+Pj4+PiAgCXUzMiBzdHJlbmd0aDsKPj4+
Pj4+ICsJdTMyIHNpemU7Cj4+Pj4+PiAgfTsKPj4+Pj4+ICAKPj4+Pj4+ICBzdHJ1Y3QgbWVzb25f
bmZjX2RhdGEgewo+Pj4+Pj4gQEAgLTE5MCw3ICsxOTEsOCBAQCBzdHJ1Y3QgbWVzb25fbmZjIHsK
Pj4+Pj4+ICB9Owo+Pj4+Pj4gIAo+Pj4+Pj4gIGVudW0gewo+Pj4+Pj4gLQlORkNfRUNDX0JDSDhf
MUsJCT0gMiwKPj4+Pj4+ICsJTkZDX0VDQ19CQ0g4XzUxMgk9IDEsCj4+Pj4+PiArCU5GQ19FQ0Nf
QkNIOF8xSywKPj4+Pj4+ICAJTkZDX0VDQ19CQ0gyNF8xSywKPj4+Pj4+ICAJTkZDX0VDQ19CQ0gz
MF8xSywKPj4+Pj4+ICAJTkZDX0VDQ19CQ0g0MF8xSywKPj4+Pj4+IEBAIC0xOTgsMTUgKzIwMCwx
NiBAQCBlbnVtIHsKPj4+Pj4+ICAJTkZDX0VDQ19CQ0g2MF8xSywKPj4+Pj4+ICB9Owo+Pj4+Pj4g
IAo+Pj4+Pj4gLSNkZWZpbmUgTUVTT05fRUNDX0RBVEEoYiwgcykJeyAuYmNoID0gKGIpLAkuc3Ry
ZW5ndGggPSAocyl9Cj4+Pj4+PiArI2RlZmluZSBNRVNPTl9FQ0NfREFUQShiLCBzLCBzeikJeyAu
YmNoID0gKGIpLCAuc3RyZW5ndGggPSAocyksIC5zaXplID0gKHN6KSB9Cj4+Pj4+PiAgCj4+Pj4+
PiAgc3RhdGljIHN0cnVjdCBtZXNvbl9uYW5kX2VjYyBtZXNvbl9lY2NbXSA9IHsKPj4+Pj4+IC0J
TUVTT05fRUNDX0RBVEEoTkZDX0VDQ19CQ0g4XzFLLCA4KSwKPj4+Pj4+IC0JTUVTT05fRUNDX0RB
VEEoTkZDX0VDQ19CQ0gyNF8xSywgMjQpLAo+Pj4+Pj4gLQlNRVNPTl9FQ0NfREFUQShORkNfRUND
X0JDSDMwXzFLLCAzMCksCj4+Pj4+PiAtCU1FU09OX0VDQ19EQVRBKE5GQ19FQ0NfQkNINDBfMUss
IDQwKSwKPj4+Pj4+IC0JTUVTT05fRUNDX0RBVEEoTkZDX0VDQ19CQ0g1MF8xSywgNTApLAo+Pj4+
Pj4gLQlNRVNPTl9FQ0NfREFUQShORkNfRUNDX0JDSDYwXzFLLCA2MCksCj4+Pj4+PiArCU1FU09O
X0VDQ19EQVRBKE5GQ19FQ0NfQkNIOF81MTIsIDgsICA1MTIpLAo+Pj4+Pj4gKwlNRVNPTl9FQ0Nf
REFUQShORkNfRUNDX0JDSDhfMUssICA4LCAgMTAyNCksCj4+Pj4+PiArCU1FU09OX0VDQ19EQVRB
KE5GQ19FQ0NfQkNIMjRfMUssIDI0LCAxMDI0KSwKPj4+Pj4+ICsJTUVTT05fRUNDX0RBVEEoTkZD
X0VDQ19CQ0gzMF8xSywgMzAsIDEwMjQpLAo+Pj4+Pj4gKwlNRVNPTl9FQ0NfREFUQShORkNfRUND
X0JDSDQwXzFLLCA0MCwgMTAyNCksCj4+Pj4+PiArCU1FU09OX0VDQ19EQVRBKE5GQ19FQ0NfQkNI
NTBfMUssIDUwLCAxMDI0KSwKPj4+Pj4+ICsJTUVTT05fRUNDX0RBVEEoTkZDX0VDQ19CQ0g2MF8x
SywgNjAsIDEwMjQpLAo+Pj4+Pj4gIH07Cj4+Pj4+PiAgCj4+Pj4+PiAgc3RhdGljIGludCBtZXNv
bl9uYW5kX2NhbGNfZWNjX2J5dGVzKGludCBzdGVwX3NpemUsIGludCBzdHJlbmd0aCkKPj4+Pj4+
IEBAIC0yMjQsOCArMjI3LDI3IEBAIHN0YXRpYyBpbnQgbWVzb25fbmFuZF9jYWxjX2VjY19ieXRl
cyhpbnQgc3RlcF9zaXplLCBpbnQgc3RyZW5ndGgpCj4+Pj4+PiAgCj4+Pj4+PiAgTkFORF9FQ0Nf
Q0FQU19TSU5HTEUobWVzb25fZ3hsX2VjY19jYXBzLAo+Pj4+Pj4gIAkJICAgICBtZXNvbl9uYW5k
X2NhbGNfZWNjX2J5dGVzLCAxMDI0LCA4LCAyNCwgMzAsIDQwLCA1MCwgNjApOwo+Pj4+Pj4gLU5B
TkRfRUNDX0NBUFNfU0lOR0xFKG1lc29uX2F4Z19lY2NfY2FwcywKPj4+Pj4+IC0JCSAgICAgbWVz
b25fbmFuZF9jYWxjX2VjY19ieXRlcywgMTAyNCwgOCk7Cj4+Pj4+PiArCj4+Pj4+PiArc3RhdGlj
IGNvbnN0IGludCBheGdfc3RlcGluZm9fc3RyZW5ndGhzW10gPSB7IDggfTsKPj4+Pj4+ICtzdGF0
aWMgY29uc3Qgc3RydWN0IG5hbmRfZWNjX3N0ZXBfaW5mbyBheGdfc3RlcGluZm9fMTAyNCA9IHsK
Pj4+Pj4+ICsJLnN0ZXBzaXplID0gMTAyNCwKPj4+Pj4+ICsJLnN0cmVuZ3RocyA9IGF4Z19zdGVw
aW5mb19zdHJlbmd0aHMsCj4+Pj4+PiArCS5uc3RyZW5ndGhzID0gQVJSQVlfU0laRShheGdfc3Rl
cGluZm9fc3RyZW5ndGhzKQo+Pj4+Pj4gK307Cj4+Pj4+PiArCj4+Pj4+PiArc3RhdGljIGNvbnN0
IHN0cnVjdCBuYW5kX2VjY19zdGVwX2luZm8gYXhnX3N0ZXBpbmZvXzUxMiA9IHsKPj4+Pj4+ICsJ
LnN0ZXBzaXplID0gNTEyLAo+Pj4+Pj4gKwkuc3RyZW5ndGhzID0gYXhnX3N0ZXBpbmZvX3N0cmVu
Z3RocywKPj4+Pj4+ICsJLm5zdHJlbmd0aHMgPSBBUlJBWV9TSVpFKGF4Z19zdGVwaW5mb19zdHJl
bmd0aHMpCj4+Pj4+PiArfTsKPj4+Pj4+ICsKPj4+Pj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG5h
bmRfZWNjX3N0ZXBfaW5mbyBheGdfc3RlcGluZm9bXSA9IHsgYXhnX3N0ZXBpbmZvXzEwMjQsIGF4
Z19zdGVwaW5mb181MTIgfTsKPj4+Pj4+ICsKPj4+Pj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG5h
bmRfZWNjX2NhcHMgbWVzb25fYXhnX2VjY19jYXBzID0gewo+Pj4+Pj4gKwkuc3RlcGluZm9zID0g
YXhnX3N0ZXBpbmZvLAo+Pj4+Pj4gKwkubnN0ZXBpbmZvcyA9IEFSUkFZX1NJWkUoYXhnX3N0ZXBp
bmZvKSwKPj4+Pj4+ICsJLmNhbGNfZWNjX2J5dGVzID0gbWVzb25fbmFuZF9jYWxjX2VjY19ieXRl
cywKPj4+Pj4+ICt9Owo+Pj4+Pj4gIAo+Pj4+Pj4gIHN0YXRpYyBzdHJ1Y3QgbWVzb25fbmZjX25h
bmRfY2hpcCAqdG9fbWVzb25fbmFuZChzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kKQo+Pj4+Pj4gIHsK
Pj4+Pj4+IEBAIC0xMjU5LDcgKzEyODEsOCBAQCBzdGF0aWMgaW50IG1lc29uX25hbmRfYmNoX21v
ZGUoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCkKPj4+Pj4+ICAJCXJldHVybiAtRUlOVkFMOwo+Pj4+
Pj4gIAo+Pj4+Pj4gIAlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShtZXNvbl9lY2MpOyBpKysp
IHsKPj4+Pj4+IC0JCWlmIChtZXNvbl9lY2NbaV0uc3RyZW5ndGggPT0gbmFuZC0+ZWNjLnN0cmVu
Z3RoKSB7Cj4+Pj4+PiArCQlpZiAobWVzb25fZWNjW2ldLnN0cmVuZ3RoID09IG5hbmQtPmVjYy5z
dHJlbmd0aCAmJgo+Pj4+Pj4gKwkJICAgIG1lc29uX2VjY1tpXS5zaXplID09IG5hbmQtPmVjYy5z
aXplKSB7Cj4+Pj4+PiAgCQkJbWVzb25fY2hpcC0+YmNoX21vZGUgPSBtZXNvbl9lY2NbaV0uYmNo
Owo+Pj4+Pj4gIAkJCXJldHVybiAwOwo+Pj4+Pj4gIAkJfQo+Pj4+Pj4gQEAgLTEyNzgsNyArMTMw
MSw3IEBAIHN0YXRpYyBpbnQgbWVzb25fbmFuZF9hdHRhY2hfY2hpcChzdHJ1Y3QgbmFuZF9jaGlw
ICpuYW5kKQo+Pj4+Pj4gIAlzdHJ1Y3QgbWVzb25fbmZjICpuZmMgPSBuYW5kX2dldF9jb250cm9s
bGVyX2RhdGEobmFuZCk7Cj4+Pj4+PiAgCXN0cnVjdCBtZXNvbl9uZmNfbmFuZF9jaGlwICptZXNv
bl9jaGlwID0gdG9fbWVzb25fbmFuZChuYW5kKTsKPj4+Pj4+ICAJc3RydWN0IG10ZF9pbmZvICpt
dGQgPSBuYW5kX3RvX210ZChuYW5kKTsKPj4+Pj4+IC0JaW50IG5zZWN0b3JzID0gbXRkLT53cml0
ZXNpemUgLyAxMDI0Owo+Pj4+Pj4gKwlpbnQgbnNlY3RvcnMgPSBtdGQtPndyaXRlc2l6ZSAvIDUx
MjsgICAgCj4+Pj4+Cj4+Pj4+IFRoaXMgY2Fubm90IGJlIHVuY29uZGl0aW9uYWwsIHJpZ2h0PyAg
ICAKPj4+Pgo+Pj4+IEhlbGxvIE1pcXVlbCEKPj4+Pgo+Pj4+IFllcywgdGhpcyBjb2RlIGxvb2tz
IHN0cmFuZ2UuICduc2VjdG9ycycgaXMgdXNlZCB0byBjYWxjdWxhdGUgc3BhY2UgaW4gT09CCj4+
Pj4gdGhhdCBjb3VsZCBiZSB1c2VkIGJ5IEVDQyBlbmdpbmUgKHRoaXMgdmFsdWUgd2lsbCBiZSBw
YXNzZWQgYXMgJ29vYmF2YWlsJwo+Pj4+IHRvICduYW5kX2VjY19jaG9vc2VfY29uZigpJykuIElk
ZWEgb2YgNTEyIGlzIHRvIGNvbnNpZGVyICJ3b3JzdCIgY2FzZQo+Pj4+IGZvciBFQ0MsIGUuZy4g
bWluaW1hbCBudW1iZXIgb2YgYnl0ZXMgZm9yIEVDQyBlbmdpbmUgKGFuZCBhdCB0aGUgc2FtZSB0
aW1lCj4+Pj4gbWF4aW11bSBudW1iZXIgb2YgZnJlZSBieXRlcykuIEZvciBNZXNvbiwgaWYgRUND
IHN0ZXAgc2l6ZSBpcyA1MTIsIHRoZW4gd2UKPj4+PiBoYXZlIDQgeCAyIGZyZWUgYnl0ZXMgaW4g
T09CIChpZiBzdGVwIHNpemUgaWYgMTAyNCB0aGVuIHdlIGhhdmUgMiB4IDIgZnJlZQo+Pj4+IGJ5
dGVzIGluIE9PQikuCj4+Pj4KPj4+PiBJIHRoaW5rIHRoaXMgY29kZSBjb3VsZCBiZSByZXdvcmtl
ZCBpbiB0aGUgZm9sbG93aW5nIHdheToKPj4+Pgo+Pj4+IGlmIEVDQyBzdGVwIHNpemUgaXMgYWxy
ZWFkeSBrbm93biBoZXJlIChmcm9tIERUUyksIGNhbGN1bGF0ZSAnbnNlY3RvcnMnIHVzaW5nCj4+
Pj4gZ2l2ZW4gdmFsdWUgKGRpdiBieSA1MTIgZm9yIGV4YW1wbGUpLiBPdGhlcndpc2UgY2FsY3Vs
YXRlICduc2VjdG9ycycgaW4gdGhlCj4+Pj4gY3VycmVudCBtYW5uZXI6ICAKPj4+Cj4+PiBJdCB3
aWxsIGFsd2F5cyBiZSBrbm93biB3aGVuIHRoZXNlIGZ1bmN0aW9uIGFyZSBydW4uIFRoZXJlIGlz
IG5vCj4+PiBndWVzc2luZyBoZXJlLiAgCj4+Cj4+IEhtIEkgY2hlY2tlZCwgdGhhdCBidXQgaWYg
c3RlcCBzaXplIGlzIG5vdCBzZXQgaW4gRFRTLCBoZXJlIGl0IHdpbGwgYmUgMCwgCj4+IHRoZW4g
aXQgd2lsbCBiZSBzZWxlY3RlZCBpbiAnbmFuZF9lY2NfY2hvb3NlX2NvbmYoKScgYWNjb3JkaW5n
IHByb3ZpZGVkICdlY2NfY2FwcycKPj4gYW5kICdvb2JhdmFpbCcuLi4KPj4KPj4gQW55d2F5LCBJ
J2xsIGRvIHRoZSBmb2xsb3dpbmcgdGhpbmc6Cj4+Cj4+IGludCBuc2VjdG9yczsKPj4KPj4gaWYg
KG5hbmQtPmVjYy5zaXplKQo+PiAgICAgbnNlY3RvcnMgPSBtdGQtPndyaXRlc2l6ZSAvIG5hbmQt
PmVjYy5zaXplOyA8LS0tIHRoaXMgaXMgZm9yIDUxMiBFQ0MKPiAKPiBZb3Ugc2hvdWxkIHNldCBu
YW5kLT5lY2Muc2l6ZSBpbiAtPmF0dGFjaF9jaGlwKCkgaW5zdGVhZC4KClNvcnJ5LCBkaWRuJ3Qg
Z2V0IGl0Li4uIGlmIEVDQyBzdGVwIHNpemUgaXMgc2V0IGluIERUUywgdGhlbiBoZXJlLCBpbiBj
aGlwIGF0dGFjaApjYWxsYmFjayBpdCB3aWxsIGJlIGFscmVhZHkga25vd24gKERUIHBhcnQgd2Fz
IHByb2Nlc3NlZCBpbiAncmF3bmFuZF9kdF9pbml0KCknKS4KSWYgRUNDIHN0ZXAgc2l6ZSBpcyB1
bmtub3duIChlLmcuIDAgaGVyZSksICduYW5kX2VjY19jaG9vc2VfY29uZigpJyB3aWxsIHNldCBp
dAphY2NvcmRpbmcgcHJvdmlkZWQgZWNjIGNhcHMuIFdoYXQgZG8gWW91IG1lYW4gZm9yICJZb3Ug
c2hvdWxkIHNldCAuLi4iID8KClRoYW5rcywgQXJzZW5peQoKCj4gCj4+IGVsc2UKPj4gICAgIG5z
ZWN0b3JzID0gbXRkLT53cml0ZXNpemUgLyAxMDI0OyA8LS0tIHRoaXMgaXMgZm9yIGRlZmF1bHQg
MTAyNCBFQ0MKPj4KPj4gVGhhbmtzLCBBcnNlbml5Cj4+Cj4+PiAgIAo+Pj4+Cj4+Pj4gaW50IG5z
ZWN0b3JzID0gbXRkLT53cml0ZXNpemUgLyAxMDI0Owo+Pj4+Cj4+Pj4gTW9yZW92ZXIgMTAyNCBp
cyBkZWZhdWx0IEVDQyBzdGVwIHNpemUgZm9yIHRoaXMgZHJpdmVyLCBzbyBkZWZhdWx0IGJlaGF2
aW91cgo+Pj4+IHdpbGwgYmUgcHJlc2VydmVkLiAgCj4+Pgo+Pj4gWWVzLCBvdGhlcndpc2UgeW91
IHdvdWxkIGJyZWFrIGV4aXN0aW5nIHVzZXJzLgo+Pj4gICAKPj4+Pgo+Pj4+IFRoYW5rcywgQXJz
ZW5peQo+Pj4+ICAKPj4+Pj4gICAgIAo+Pj4+Pj4gIAlpbnQgcmF3X3dyaXRlc2l6ZTsKPj4+Pj4+
ICAJaW50IHJldDsKPj4+Pj4+ICAgICAgCj4+Pj4+Cj4+Pj4+Cj4+Pj4+IFRoYW5rcywKPj4+Pj4g
TWlxdcOobCAgICAKPj4+Cj4+Pgo+Pj4gVGhhbmtzLAo+Pj4gTWlxdcOobCAgCj4gCj4gCj4gVGhh
bmtzLAo+IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
