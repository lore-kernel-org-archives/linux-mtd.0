Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8E1C7EE25
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 20:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HjReNZK+rj2F1RdZYjFUCaEjI4+cNLgeQykb66iAbtc=; b=HPPbgb3Q0foTfj
	wPTpFmWD4vdbaxuEjyhpWuRa6iIKHFmOyDPYmseylNnoQ0X6oMsKTQaHAGvj9BsUn5KSesWdwZDHH
	47zGybtbc3Wt0jhMaEASxreXmaBhXIVfVCoUkQnqMWL00Q+enztgL9OU2P8t7EDErb5pLUXOTtSet
	+zxBXHwg94WrbI5DuvqSjxqyElWq0sJJqfaGSGwRR6hyVsFNFeOzl4L1RE6fz1POp1h7xlF1rhKrz
	W6V76qtEyla/WfvByEE9tJga5KOLfcf/Eyy7gY8KqUoR/lbJmx+GixtKGgbOIhsz8Rrw0faNb9nUm
	rL8vSi/YIpu5AKtYyD/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q704J-007BMj-2E;
	Wed, 07 Jun 2023 20:47:47 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q704G-007BLQ-0k
	for linux-mtd@lists.infradead.org;
	Wed, 07 Jun 2023 20:47:46 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5A3652C04C8;
	Thu,  8 Jun 2023 08:47:36 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1686170856;
	bh=/cQkkegflgFQqm5C+G5vQB+gTiP1JumRvCSkO2eCGRM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=tqZAxdZBa/qzNcvYcxD2xYqYNhfe1WM1eoglk69yE/FLSrRR0uTR5UdzGMkngS0NU
	 pq72/ZNh8Kn4K4mjoj0vNwG3xI4IQoviH0FX0PB4pRonGFUDPn2IagVOzGpPTNIQRO
	 QQhYURH37vE9x3QjDf6ykdEYS62VhTv4X+cz/q1hPdUnnY0MoEZVjQ1C5Mnw+Bp69s
	 9VUPQr1bVPBE7xzynmtIl8ULHz7RgR+vfg72MFLO9yPDNpHsjE9dhOydvlzbPCS6cb
	 nlogIkx2lgpG2luIpMS4CHWySH/JPcywwnRwOnf/wqAw2+4PuDfovoKuoaT72kWkif
	 nhzeafxGG16CA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6480ece80000>; Thu, 08 Jun 2023 08:47:36 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.26; Thu, 8 Jun 2023 08:47:36 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with Microsoft
 SMTP Server (TLS) id 15.0.1497.48; Thu, 8 Jun 2023 08:47:35 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.026; Thu, 8 Jun 2023 08:47:35 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
	<pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>, Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v2 06/17] dt-bindings: mtd: qcom: Prevent NAND chip
 unevaluated properties
Thread-Topic: [PATCH v2 06/17] dt-bindings: mtd: qcom: Prevent NAND chip
 unevaluated properties
Thread-Index: AQHZmJ/A/7DdJqfjnkKBhDDDwtPlhq99kbaAgACeJoCAANhNgA==
Date: Wed, 7 Jun 2023 20:47:35 +0000
Message-ID: <7421ed33-25bf-7af1-fa95-5e12d91e23b1@alliedtelesis.co.nz>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
 <20230606175246.190465-7-miquel.raynal@bootlin.com>
 <6bfc7652-ab2b-3a22-8ef7-7ba421eb4d93@alliedtelesis.co.nz>
 <20230607095325.36cacdc1@xps-13>
In-Reply-To: <20230607095325.36cacdc1@xps-13>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-ID: <036C59F09C59A1478C2CFA497517EF30@atlnz.lc>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=CMhUoijD c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=of4jigFt-DYA:10 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=9vaUkKApdVHAHW6FauQA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=d3PnA9EDa4IxuAV0gXij:22
X-SEG-SpamProfiler-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_134744_753525_CE5E54F7 
X-CRM114-Status: GOOD (  19.74  )
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

DQpPbiA3LzA2LzIzIDE5OjUzLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOg0KPiBIaSBDaHJpcywNCj4N
Cj4gQ2hyaXMuUGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56IHdyb3RlIG9uIFR1ZSwgNiBKdW4g
MjAyMyAyMjoyNzoyMw0KPiArMDAwMDoNCj4NCj4+IE9uIDcvMDYvMjMgMDU6NTIsIE1pcXVlbCBS
YXluYWwgd3JvdGU6DQo+Pj4gTGlzdCBhbGwgdGhlIHBvc3NpYmxlIHByb3BlcnRpZXMgaW4gdGhl
IE5BTkQgY2hpcCBhcyBwZXIgdGhlIGV4YW1wbGUgYW5kDQo+Pj4gc2V0IHVuZXZhbHVhdGVkUHJv
cGVydGllcyB0byBmYWxzZSBpbiB0aGUgTkFORCBjaGlwIHNlY3Rpb24uDQo+Pj4NCj4+PiBDYzog
TWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pQGtlcm5lbC5vcmc+DQo+Pj4gU2lnbmVkLW9mZi1i
eTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4NCj4+PiAtLS0NCj4+
PiAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Fjb20sbmFuZGMueWFt
bCB8IDQgKysrKw0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4+Pg0K
Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Fj
b20sbmFuZGMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcWNv
bSxuYW5kYy55YW1sDQo+Pj4gaW5kZXggNzIxN2Q4YTY0ZDE0Li41ODE5NzNmNDUyZmYgMTAwNjQ0
DQo+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9xY29tLG5h
bmRjLnlhbWwNCj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L3Fjb20sbmFuZGMueWFtbA0KPj4+IEBAIC0zNCw3ICszNCw5IEBAIHByb3BlcnRpZXM6DQo+Pj4g
ICAgcGF0dGVyblByb3BlcnRpZXM6DQo+Pj4gICAgICAiXm5hbmRAW2EtZjAtOV0kIjoNCj4+PiAg
ICAgICAgdHlwZTogb2JqZWN0DQo+Pj4gKyAgICAkcmVmOiByYXctbmFuZC1jaGlwLnlhbWwNCj4+
PiAgICAgICAgcHJvcGVydGllczoNCj4+PiArDQo+Pj4gICAgICAgICAgbmFuZC1idXMtd2lkdGg6
DQo+Pj4gICAgICAgICAgICBjb25zdDogOA0KPj4+ICAgIA0KPj4+IEBAIC02MSw2ICs2Myw4IEBA
IHBhdHRlcm5Qcm9wZXJ0aWVzOg0KPj4+ICAgIA0KPj4+ICAgICAgICAgICAgICBSZWZlciB0byB0
aGUgaXBxODA2NCBleGFtcGxlIG9uIGhvdyB0byB1c2UgdGhpcyBzcGVjaWFsIGJpbmRpbmcuDQo+
Pj4gICAgDQo+Pj4gKyAgICB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+Pj4gKw0KPj4+
ICAgIGFsbE9mOg0KPj4+ICAgICAgLSAkcmVmOiAibmFuZC1jb250cm9sbGVyLnlhbWwjIg0KPj4+
ICAgICAgDQo+PiBUaGlzIGRvZXNuJ3QgYXBwZWFyIHRvIGJlIHdvcmtpbmcgYXMgaW50ZW5kZWQu
IElmIEkgYWRkIHRoZSBmb2xsb3dpbmcNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9xY29tLG5hbmRjLnlhbWwNCj4+IGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9xY29tLG5hbmRjLnlhbWwNCj4+IGluZGV4IDU4
MTk3M2Y0NTJmZi4uN2E5MTBhNjJjN2I4IDEwMDY0NA0KPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9xY29tLG5hbmRjLnlhbWwNCj4+ICsrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcWNvbSxuYW5kYy55YW1sDQo+PiBAQCAtMjIw
LDYgKzIyMCw3IEBAIGV4YW1wbGVzOg0KPj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBwYXJ0aXRpb25AMCB7DQo+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgbGFiZWwgPSAiYm9vdC1uYW5kIjsNCj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MCAweDU4YTAwMDA+Ow0KPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5vbnNlbnNlOw0KPj4gICDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB9Ow0KPj4NCj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcGFydGl0aW9uQDU4YTAwMDAgew0KPj4NCj4+DQo+PiBUaGVuIEknZCBleHBlY3Qg
dG8gZ2V0IGEgY29tcGxhaW50IGZyb20gYG1ha2UgbXJwcm9wZXI7IG1ha2UNCj4+IERUX0NIRUNL
RVJfRkxBR1M9LW0gZHRfYmluZGluZ19jaGVjayBEVF9TQ0hFTUFfRklMRVM9cWNvbSxuYW5kYy55
YW1sYA0KPj4gYnV0IGl0IHNlZW1zIHRvIGxldCB0aGlzIHRocm91Z2guDQo+IEkgYW0ganVzdCBm
aXhpbmcgdGhlIE5BTkQgY2hpcCBub2RlIHdoaWxlIHRoaXMgaXMgYSBwYXJ0aXRpb24gbm9kZS4g
V2UNCj4gbmVlZCB0byBjb25zdHJhaW4gbW9yZSBhbGwgdGhlIHNjaGVtYXMsIGxldCdzIHN0YXJ0
IHdpdGggdGhlIGJlZ2lubmluZw0KPiA6KQ0KDQpBaCBPSy4gSSBqdXN0IHdhc24ndCBzdXJlIHdo
ZXRoZXIgdG8gd2FpdCBmb3IgdGhpcyB0byBsYW5kIG9yIHBpbGUgbXkgDQpjb252ZXJzaW9uIG9u
IHRvcC4NCg0KV2hhdCBJIHJlYWxseSB3YW50IHRvIGdldCB0byBpcyB0aGUgZHJpdmVyIGNoYW5n
ZXMgZm9yIHRoZSBBQzUgU29DLiANCkNvbnZlcnRpbmcgdGhlIHNjaGVtYSBzdGFydGVkIGFzICJJ
IHNob3VsZCBiZSBhYmxlIHRvIGtub2NrIHRoYXQgb3V0IGluIA0KMzAgbWlucyBvbiBhIEZyaWRh
eSBhZnRlcm5vb24iIGJ1dCBoYXMgc25vd2JhbGxlZCBzaWduaWZpY2FudGx5Lg0KDQo+DQo+IFRo
YW5rcywNCj4gTWlxdcOobApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
