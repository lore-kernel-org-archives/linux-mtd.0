Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33DFC7EE23
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 22:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=11b1TFKd1xQX3wKJ7LCRWPJI2iXjlK3+b+axDVGGFeA=; b=z8zuN6y4cyjNCy
	TXAlp3ewIlDvU23FVWbde32OzmcHKyM2wptua70FR44NpXr2sHfPLwjzmUQIM+i5Th62XWggvg5xD
	uUDnFg3N6944BSkkXP/7DOZK4+Ro2MnoxrVjxkkhJDttFaD7qUdQ7vSlTgTy8zcCnGDnTKFmLTVgg
	qnLrmhsx0o5kxY6jdW6gsPDezAdtCQmkSdcsIITepDoAxb92CKOZ+/mmw6kKwF4bY3fLqsPdQ5MMQ
	zPqYxa0BTc4DFbMSplTEszxKQIK0o1wUyeU/7/I2g55XZ0+GBMbRJahju5XE+68fnbasszC/M865A
	osAeDdsqBEB7pvj3dEOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4UQp-001KdU-3B;
	Wed, 31 May 2023 22:36:39 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4UQn-001Kbh-0q
	for linux-mtd@lists.infradead.org;
	Wed, 31 May 2023 22:36:38 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id ED1EA2C00B8;
	Thu,  1 Jun 2023 10:36:27 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1685572587;
	bh=K6Qn8QeOKSoZHZZ0pj4vqr+48A5yvnzbjMWWua+foqI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=JNSd5zz7GjQWD6N8teZuZB0wWvPzDRoabXUWRQe7nUTyXgUR/nwSTl7dpBY+hdsRi
	 IWrzERyZ5M/OAhTD/Fav1RvCIbH3Df6smoQGexvYDVzxnM0vJoaG4z0hHmnKy6TYcn
	 O2tXpTO0HxbDEGmF9FA6PxdDuKAn34gd9SlyAxc9Vph78sGKJFCyRAniOrmH6OfcPt
	 S/vmmXUjeS0A+VlXg91YeNzLfHQ6rKFilXiVxyT1izglrw2eq+QoTkzFMBdj2xroIi
	 IGgnwW3rq5sjf4S+F25loBb3CS7ogMylCjnLgXLTFvnsWRmz/VLD5NwaVj7UZ3EQsf
	 2TOenYHyhMb0g==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6477cbeb0000>; Thu, 01 Jun 2023 10:36:27 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 1 Jun 2023 10:36:27 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.026; Thu, 1 Jun 2023 10:36:27 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "andrew@lunn.ch"
	<andrew@lunn.ch>, "gregory.clement@bootlin.com"
	<gregory.clement@bootlin.com>, "sebastian.hesselbarth@gmail.com"
	<sebastian.hesselbarth@gmail.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "enachman@marvell.com"
	<enachman@marvell.com>
Subject: Re: [PATCH v7 4/4] dt-bindings: mtd: marvell-nand: Remove deprecated
 compatibles
Thread-Topic: [PATCH v7 4/4] dt-bindings: mtd: marvell-nand: Remove deprecated
 compatibles
Thread-Index: AQHZk1Io0TYCpzAakEW/VeOAcipdYq9zNJAAgAD8TYA=
Date: Wed, 31 May 2023 22:36:27 +0000
Message-ID: <a84403a0-334e-c0e8-4a1b-bedac69e816d@alliedtelesis.co.nz>
References: <20230530235456.1009082-1-chris.packham@alliedtelesis.co.nz>
 <20230530235456.1009082-5-chris.packham@alliedtelesis.co.nz>
 <20230531093326.26b6ced7@xps-13>
In-Reply-To: <20230531093326.26b6ced7@xps-13>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-ID: <0E40439F4111574EB437CE288F8410B1@atlnz.lc>
MIME-Version: 1.0
X-SEG-SpamProfiler-Score: -1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_153637_461623_E69CC4BC 
X-CRM114-Status: GOOD (  17.18  )
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

DQpPbiAzMS8wNS8yMyAxOTozMywgTWlxdWVsIFJheW5hbCB3cm90ZToNCj4gSGkgQ2hyaXMsDQo+
DQo+IGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5ueiB3cm90ZSBvbiBXZWQsIDMxIE1h
eSAyMDIzIDExOjU0OjU2DQo+ICsxMjAwOg0KPg0KPj4gUmVtb3ZlIGNvbXBhdGlibGUgdmFsdWVz
IHRoYXQgd2VyZSBtYXJrZWQgYXMgZGVwcmVjYXRlZCBpbiB0aGUgb2xkIHRleHQNCj4+IGJpbmRp
bmcuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgUGFja2hhbSA8Y2hyaXMucGFja2hhbUBh
bGxpZWR0ZWxlc2lzLmNvLm56Pg0KPj4gLS0tDQo+PiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9tYXJ2ZWxsLG5hbmQtY29udHJvbGxlci55YW1sICAgICAgIHwgMyAtLS0NCj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbWFydmVsbCxuYW5kLWNvbnRyb2xsZXIueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbWFydmVsbCxuYW5kLWNv
bnRyb2xsZXIueWFtbA0KPj4gaW5kZXggN2NkNGEyZTk5MzQzLi44MGNlODU0MjkxY2IgMTAwNjQ0
DQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL21hcnZlbGws
bmFuZC1jb250cm9sbGVyLnlhbWwNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvbWFydmVsbCxuYW5kLWNvbnRyb2xsZXIueWFtbA0KPj4gQEAgLTE4LDkgKzE4
LDYgQEAgcHJvcGVydGllczoNCj4+ICAgICAgICAgLSBlbnVtOg0KPj4gICAgICAgICAgICAgLSBt
YXJ2ZWxsLGFybWFkYTM3MC1uYW5kLWNvbnRyb2xsZXINCj4+ICAgICAgICAgICAgIC0gbWFydmVs
bCxweGEzeHgtbmFuZC1jb250cm9sbGVyDQo+PiAtICAgICAgICAgIC0gbWFydmVsbCxhcm1hZGEt
OGstbmFuZA0KPj4gLSAgICAgICAgICAtIG1hcnZlbGwsYXJtYWRhMzcwLW5hbmQNCj4+IC0gICAg
ICAgICAgLSBtYXJ2ZWxsLHB4YTN4eC1uYW5kDQo+IE5vdCBzdXJlIHdoYXQgeW91J3JlIGRvaW5n
IGhlcmU/DQpUaGF0J3MgbWUgYmVpbmcgaW4gYW4gYXdrd2FyZCB0aW1lem9uZSBhbmQgZ3Vlc3Np
bmcgKGJhZGx5KS4gSSB0aGluayANCkkndmUgZ290IHRoZSBkZXByZWNhdGVkIGNvbXBhdGlibGVz
IHNvcnRlZCBub3cgc28gSSdsbCBkcm9wIHRoaXMgZnJvbSB2OC4NCj4gICBJIHdvdWxkIGFjdHVh
bGx5IGV4cGVjdCB0aGVzZSB0aHJlZQ0KPiBsaW5lcyB0byBoYXZlIHNvbWV0aGluZyBhbG9uZzoN
Cj4NCj4gICAgICAgICAgICAgICAgICAgZGVwcmVjYXRlZDogdHJ1ZQ0KPg0KPiBhbmQgdGhpcyBz
aG91bGQgYmUgcGFydCBvZiB0aGUgY29udmVyc2lvbiB0byB5YW1sLiBPciBwZXJoYXBzIEkgYW0N
Cj4gbWlzc2luZyBzb21ldGhpbmc/DQo+DQo+IFRoZSByZXN0IG9mIHRoZSBzZXJpZXMgbG9va3Mg
Z29vZCB0byBtZS4NCj4NCj4+ICAgDQo+PiAgICAgcmVnOg0KPj4gICAgICAgbWF4SXRlbXM6IDEN
Cj4NCj4gVGhhbmtzLA0KPiBNaXF1w6hsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
