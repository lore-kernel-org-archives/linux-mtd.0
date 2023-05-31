Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E210DC77B7A
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 22:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6m53amOxMeQ7KvXwT9xYRzl+hVLwtphrohOeSID2tVs=; b=rZDfWmLqzgkKeL
	GylpE/zZEBLWnwwTckWqNIR6awTF13KhKHpOMKUGYTMePj0yCRZrpQlq6HJnrRLeQ3SF7Legkc7J7
	IwJX725WDe75uC6Gl2xKBkQk0Wxtq8+7LvFK7xYO5m9AQZcOOmHJNxTl64Tf+cjMKMLtaADr6NfYj
	yCJmQ9eEUD39oSC35r2g9Qwb3knLRssgkWuJG7htgxg0PXTlHH24q4vBTt5FeZHBzdVEPhLAYKv1k
	dp+8MHWtZTpF0fzBK09Y6TWSd+u6qnjOUwkWotRtEVkpF6QazjPIaziyClN6ya/LoMxRMSNOcB3NL
	Nw9QP8p1fPq7MBBmc9Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4UWK-001LoP-15;
	Wed, 31 May 2023 22:42:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4UWJ-001LnN-01
	for linux-mtd@bombadil.infradead.org;
	Wed, 31 May 2023 22:42:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To
	:From:Sender:Reply-To:Content-Description;
	bh=oraCNG+HbpGX4rGgpE5t7oyiAJbQt1EuAc8ntg9Bjq4=; b=EGwTu3n8Z6t/yrmoukj1r1oXNC
	W8QS4KdqkdsTCz41b2FP13gAmyoAV8h0pU/R0fYr2pApTp2Lebqliur3WaqGMR+c9OLaUOyJ+HxO6
	+4bqRtMpD/vxeC3H8MZv9qbX3XeuhwaA0GF0eBriFE40/Y64mNuwp11yd978OfyAz486/kGHnwtws
	hdH3qIcVV+0pS4bHR8uOp6OJPt9lh7PeOTApT549eDlj/2FPwgklevVZ/Iw9Xjyo6h03OIXaFb8B6
	bBg45pHnapcNhlcnSmELb+74IzEHt7OUZwvYj9NeRusW5jnAE9S3FaqaFqEHCfRKJnhzjRzWUM2VN
	u3H1/3ww==;
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4TPu-00FdKO-13
	for linux-mtd@lists.infradead.org;
	Wed, 31 May 2023 21:31:55 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C4E112C00B8;
	Thu,  1 Jun 2023 09:31:19 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1685568679;
	bh=oraCNG+HbpGX4rGgpE5t7oyiAJbQt1EuAc8ntg9Bjq4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ih3dKuF1t3LDzTB1k+Q6tSJ91zUZIJXQPH9aoZakSzT2D+3HXNiGjVSIYSiZkqo/i
	 U/5U54a9tNat+k2AsApQYZ24h1yBx8Lq5kVAhDRlDCq2qk0MqB0l9uuLy8QEokGMvL
	 FR44CnI2mC+BfObhfM7sPEa9/buJg/dNhh17Q/B7dZWSeZ5cOuiO6jyHx12FtShFYP
	 /HuwOKzZ0dDSbXridJhuMt9NhGmWo5f9rfr9ysk3dkSANvj511DoGvnGgAJiQXrdLH
	 iAmJfuTDl/Di59YFl2Sy04Ay+7keNYRM+x6RtSoYc1zOAYZVbFpacn4flgbvIwHD43
	 eGFt9GkYJZIrg==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6477bca70000>; Thu, 01 Jun 2023 09:31:19 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 1 Jun 2023 09:31:19 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.026; Thu, 1 Jun 2023 09:31:19 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>,
	"christophe.kerello@foss.st.com" <christophe.kerello@foss.st.com>,
	"liang.yang@amlogic.com" <liang.yang@amlogic.com>, "jdelvare@suse.de"
	<jdelvare@suse.de>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] mtd: rawnand: marvell: add support for AC5 SoC
Thread-Topic: [PATCH 2/2] mtd: rawnand: marvell: add support for AC5 SoC
Thread-Index: AQHZk2vZXv1VMOMkhU2XYJiD08p/pa9zNZoAgADo3YA=
Date: Wed, 31 May 2023 21:31:19 +0000
Message-ID: <5fa40f69-2c35-05b0-32f5-63cc249547c3@alliedtelesis.co.nz>
References: <20230531025847.1284862-1-chris.packham@alliedtelesis.co.nz>
 <20230531025847.1284862-3-chris.packham@alliedtelesis.co.nz>
 <20230531093752.17fbeb1b@xps-13>
In-Reply-To: <20230531093752.17fbeb1b@xps-13>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-ID: <F9046C41FE25B141A2254724269CF7F3@atlnz.lc>
MIME-Version: 1.0
X-SEG-SpamProfiler-Score: -1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_223142_190224_41E393A5 
X-CRM114-Status: GOOD (  24.71  )
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

DQpPbiAzMS8wNS8yMyAxOTozNywgTWlxdWVsIFJheW5hbCB3cm90ZToNCj4gSGkgQ2hyaXMsDQo+
DQo+IGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5ueiB3cm90ZSBvbiBXZWQsIDMxIE1h
eSAyMDIzIDE0OjU4OjQ3DQo+ICsxMjAwOg0KPg0KPj4gQWRkIHN1cHBvcnQgZm9yIHRoZSBBQzUv
QUM1WCBTb0MgZnJvbSBNYXJ2ZWxsLiBUaGUgTkZDIG9uIHRoaXMgU29DIG9ubHkNCj4+IHN1cHBv
cnRzIFNEUiBtb2RlcyB1cCB0byAzLg0KPiBTdHJhbmdlIQ0KDQpZZWFoIEknbSBhIGJpdCBzdXJw
cmlzZWQgdG9vLiBUaGV5IG9ubHkgcmVjZW50bHkgdXBkYXRlZCB0aGUgZGF0YXNoZWV0IA0KdG8g
c2F5IGl0IHN1cHBvcnRlZCBtb2RlIDMgc28gSSB0aGluayBtYXliZSB0aGV5J3JlIHF1YWxpZnlp
bmcgdGhpbmdzIGFzIA0KdGhleSBnby4NCg0KPiBCdXQgYWxyaWdodCwgSSdtIG9rYXkgd2l0aCB0
aGUgc2VyaWVzLg0KPg0KPiBJJ2xsIHB1dCBpdCBhc2lkZSB3YWl0aW5nIGZvciBhbGwgYmluZGlu
ZyBjaGFuZ2VzIHRvIGJlIGFja2VkICh5YW1sDQo+IGNvbnZlcnNpb24gc2VyaWVzICsgdGhpcyBv
bmUpIGFuZCB0aGVuIEknbGwgYXBwbHkgZXZlcnl0aGluZy4NCj4NCj4+IE1hcnZlbGwncyBTREsg
aW5jbHVkZXMgc29tZSBwcmVkZWZpbmVkIHZhbHVlcyBmb3IgdGhlIG5kdHIgcmVnaXN0ZXJzLg0K
Pj4gVGhlc2UgaGF2ZW4ndCBiZWVuIGluY29ycG9yYXRlZCBhcyB0aGUgZXhpc3RpbmcgY29kZSBz
ZWVtcyB0byBnZXQgZ29vZA0KPj4gdmFsdWVzIGJhc2VkIG9uIG1lYXN1cmVtZW50cyB0YWtlbiB3
aXRoIGFuIG9zY2lsbG9zY29wZS4NCj4gR29vZCA6KQ0KPg0KPiBCeSB0aGUgd2F5IGRpZCB5b3Ug
c29ydCB0aGUgdGltaW5ncyBxdWVzdGlvbiBvbiA4az8NClllcyB3aXRoIHRob3NlIHR3byBwYXRj
aGVzIHlvdSd2ZSBhbHJlYWR5IGFwcGxpZWQgdGhlIDhrIHNlZW1zIGdvb2QgYXMgDQpmYXIgYXMg
SSdtIGNvbmNlcm5lZC4NCj4+IFNpZ25lZC1vZmYtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBh
Y2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9LY29uZmlnICAgICAgICB8ICAyICstDQo+PiAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L21h
cnZlbGxfbmFuZC5jIHwgMTYgKysrKysrKysrKysrKysrKw0KPj4gICAyIGZpbGVzIGNoYW5nZWQs
IDE3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L0tjb25maWcN
Cj4+IGluZGV4IGI1MjMzNTRkZmIwMC4uMGY0Y2JiNDk3MDEwIDEwMDY0NA0KPj4gLS0tIGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZw0KPj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
S2NvbmZpZw0KPj4gQEAgLTE2MCw3ICsxNjAsNyBAQCBjb25maWcgTVREX05BTkRfTUFSVkVMTA0K
Pj4gICAJICBpbmNsdWRpbmc6DQo+PiAgIAkgIC0gUFhBM3h4IHByb2Nlc3NvcnMgKE5GQ3YxKQ0K
Pj4gICAJICAtIDMyLWJpdCBBcm1hZGEgcGxhdGZvcm1zIChYUCwgMzd4LCAzOHgsIDM5eCkgKE5G
Q3YyKQ0KPj4gLQkgIC0gNjQtYml0IEFyYW1kYSBwbGF0Zm9ybXMgKDdrLCA4aykgKE5GQ3YyKQ0K
Pj4gKwkgIC0gNjQtYml0IEFyYW1kYSBwbGF0Zm9ybXMgKDdrLCA4aywgYWM1KSAoTkZDdjIpDQo+
PiAgIA0KPj4gICBjb25maWcgTVREX05BTkRfU0xDX0xQQzMyWFgNCj4+ICAgCXRyaXN0YXRlICJO
WFAgTFBDMzJ4eCBTTEMgTkFORCBjb250cm9sbGVyIg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVs
bF9uYW5kLmMNCj4+IGluZGV4IDMwYzE1ZTRlMWNjMC4uYjlhOGRkMzI0MjExIDEwMDY0NA0KPj4g
LS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMNCj4+ICsrKyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jDQo+PiBAQCAtMzc1LDYgKzM3NSw3IEBAIHN0
YXRpYyBpbmxpbmUgc3RydWN0IG1hcnZlbGxfbmFuZF9jaGlwX3NlbCAqdG9fbmFuZF9zZWwoc3Ry
dWN0IG1hcnZlbGxfbmFuZF9jaGlwDQo+PiAgICAqCQkJQkNIIGVycm9yIGRldGVjdGlvbiBhbmQg
Y29ycmVjdGlvbiBhbGdvcml0aG0sDQo+PiAgICAqCQkJTkRDQjMgcmVnaXN0ZXIgaGFzIGJlZW4g
YWRkZWQNCj4+ICAgICogQHVzZV9kbWE6CQlVc2UgZG1hIGZvciBkYXRhIHRyYW5zZmVycw0KPj4g
KyAqIEBtYXhfbW9kZV9udW1iZXI6CU1heGltdW0gdGltaW5nIG1vZGUgc3VwcG9ydGVkIGJ5IHRo
ZSBjb250cm9sbGVyDQo+PiAgICAqLw0KPj4gICBzdHJ1Y3QgbWFydmVsbF9uZmNfY2FwcyB7DQo+
PiAgIAl1bnNpZ25lZCBpbnQgbWF4X2NzX25iOw0KPj4gQEAgLTM4Myw2ICszODQsNyBAQCBzdHJ1
Y3QgbWFydmVsbF9uZmNfY2FwcyB7DQo+PiAgIAlib29sIGxlZ2FjeV9vZl9iaW5kaW5nczsNCj4+
ICAgCWJvb2wgaXNfbmZjdjI7DQo+PiAgIAlib29sIHVzZV9kbWE7DQo+PiArCXVuc2lnbmVkIGlu
dCBtYXhfbW9kZV9udW1iZXI7DQo+PiAgIH07DQo+PiAgIA0KPj4gICAvKioNCj4+IEBAIC0yMzc2
LDYgKzIzNzgsOSBAQCBzdGF0aWMgaW50IG1hcnZlbGxfbmZjX3NldHVwX2ludGVyZmFjZShzdHJ1
Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgY2hpcG5yLA0KPj4gICAJaWYgKElTX0VSUihzZHIpKQ0K
Pj4gICAJCXJldHVybiBQVFJfRVJSKHNkcik7DQo+PiAgIA0KPj4gKwlpZiAobmZjLT5jYXBzLT5t
YXhfbW9kZV9udW1iZXIgJiYgbmZjLT5jYXBzLT5tYXhfbW9kZV9udW1iZXIgPCBjb25mLT50aW1p
bmdzLm1vZGUpDQo+PiArCQlyZXR1cm4gLUVPUE5PVFNVUFA7DQo+PiArDQo+PiAgIAkvKg0KPj4g
ICAJICogU0RSIHRpbWluZ3MgYXJlIGdpdmVuIGluIHBpY28tc2Vjb25kcyB3aGlsZSBORkMgdGlt
aW5ncyBtdXN0IGJlDQo+PiAgIAkgKiBleHByZXNzZWQgaW4gTkFORCBjb250cm9sbGVyIGNsb2Nr
IGN5Y2xlcywgd2hpY2ggaXMgaGFsZiBvZiB0aGUNCj4+IEBAIC0zMDczLDYgKzMwNzgsMTMgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBtYXJ2ZWxsX25mY19jYXBzIG1hcnZlbGxfYXJtYWRhXzhrX25m
Y19jYXBzID0gew0KPj4gICAJLmlzX25mY3YyID0gdHJ1ZSwNCj4+ICAgfTsNCj4+ICAgDQo+PiAr
c3RhdGljIGNvbnN0IHN0cnVjdCBtYXJ2ZWxsX25mY19jYXBzIG1hcnZlbGxfYWM1X2NhcHMgPSB7
DQo+PiArCS5tYXhfY3NfbmIgPSAyLA0KPj4gKwkubWF4X3JiX25iID0gMSwNCj4+ICsJLmlzX25m
Y3YyID0gdHJ1ZSwNCj4+ICsJLm1heF9tb2RlX251bWJlciA9IDMsDQo+PiArfTsNCj4+ICsNCj4+
ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBtYXJ2ZWxsX25mY19jYXBzIG1hcnZlbGxfYXJtYWRhMzcw
X25mY19jYXBzID0gew0KPj4gICAJLm1heF9jc19uYiA9IDQsDQo+PiAgIAkubWF4X3JiX25iID0g
MiwNCj4+IEBAIC0zMTIxLDYgKzMxMzMsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZp
Y2VfaWQgbWFydmVsbF9uZmNfb2ZfaWRzW10gPSB7DQo+PiAgIAkJLmNvbXBhdGlibGUgPSAibWFy
dmVsbCxhcm1hZGEtOGstbmFuZC1jb250cm9sbGVyIiwNCj4+ICAgCQkuZGF0YSA9ICZtYXJ2ZWxs
X2FybWFkYV84a19uZmNfY2FwcywNCj4+ICAgCX0sDQo+PiArCXsNCj4+ICsJCS5jb21wYXRpYmxl
ID0gIm1hcnZlbGwsYWM1LW5hbmQtY29udHJvbGxlciIsDQo+PiArCQkuZGF0YSA9ICZtYXJ2ZWxs
X2FjNV9jYXBzLA0KPj4gKwl9LA0KPj4gICAJew0KPj4gICAJCS5jb21wYXRpYmxlID0gIm1hcnZl
bGwsYXJtYWRhMzcwLW5hbmQtY29udHJvbGxlciIsDQo+PiAgIAkJLmRhdGEgPSAmbWFydmVsbF9h
cm1hZGEzNzBfbmZjX2NhcHMsDQo+DQo+IFRoYW5rcywNCj4gTWlxdcOobApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
