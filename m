Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64486C77B7A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 10:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wribSaYr4wRzmKaCvueB3t38h1ST6+ZVZ7Wf0hAesPA=; b=aem0DFrkNfkPjI
	OcC8V/KfRxOw25pv2p9f/DR4rzinNa0fqeJZN1Lya6nAnLoiUeJv6IkBVLFrbQ07JQht5kW/K2BCo
	Ssfefj0iEjSRqhsRnW8Glgip+NkqbgOuLZLDCnFQYN6K+S1o9RAfYYuNZvKa94szl7GxR/POCg24p
	/ezJ7ixhq8u4JFR9YJBEqewPAWEmkGL8wv6dFL0w+1Df+TBzzzgAEEW4K52LqHcyEPFbnRVgm0dLJ
	JVNZcPzq/l8WHH5cNpO8fFnkLQwVUkxswL5aIqVHr8O0n0EHVLkFUZ6xDYOFcQxdX120MOh3FTB9v
	ZHXJx0MG0MX04z6FNd3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6UNb-001Mjr-2s;
	Tue, 06 Jun 2023 10:57:35 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6UNY-001Mgl-1K;
	Tue, 06 Jun 2023 10:57:34 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686049048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tfYad/wji//tYFc+FXXJE1P1tmD//W2bYCqpfeZDygE=;
	b=X7WXZXEQBCZGYvxjdHPMR9HN9QqYFVvQtEjHy0TdLfMksq1SNUk9s6e+KfJxCmgb9J3qhR
	TOYWZcNGSAmHujc5JYGu2iqBFI90bbY5b2IEpWAL6GHidXy2JebcWHhiA0VI+J6DMlXZUQ
	qIkSALqaXMf4pu/OWKXlUd/ASsoBHklmKW/1u5mgk9w5IKOLNQV7WFzf1zw1jNRxsr6W+3
	mlydoejHVlgrhXa7kvRi5/JC8LmmMH9hK6zm/S3c7L5lmu7tpcYE+VlUYL4xFIrysQTw3E
	QUttM/21epnVjb5apHZ6VtXVVvhH2hEqtP0RKbXASKHhu07AuuPeecWMT8gGfQ==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57CC61C0005;
	Tue,  6 Jun 2023 10:57:25 +0000 (UTC)
Date: Tue, 6 Jun 2023 12:57:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>, "richard@nod.at"
 <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "andrew@lunn.ch" <andrew@lunn.ch>,
 "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
 "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
 "conor@kernel.org" <conor@kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "enachman@marvell.com"
 <enachman@marvell.com>, Vadym Kochan <vadym.kochan@plvision.eu>
Subject: Re: [PATCH v8 3/3] dt-bindings: mtd: marvell-nand: Convert to YAML
 DT scheme
Message-ID: <20230606125724.126a4685@xps-13>
In-Reply-To: <d0b2cdc5-12fd-9a19-b38c-0653b4147c2b@linaro.org>
References: <20230531234923.2307013-1-chris.packham@alliedtelesis.co.nz>
	<20230531234923.2307013-4-chris.packham@alliedtelesis.co.nz>
	<a23dd485-a3d9-e31f-be3e-0ab293fcfc4a@linaro.org>
	<785368df-1881-e62e-6172-d902cee814a8@alliedtelesis.co.nz>
	<eaf9d7cf-c9f5-a5d5-67af-c43761c3c6cf@linaro.org>
	<4ea0b16e-0cec-00db-c598-e0364a7edef8@alliedtelesis.co.nz>
	<9fc57052-5049-ed50-ca95-cfd1d0420dd9@alliedtelesis.co.nz>
	<20230606094855.1ab005eb@xps-13>
	<845924ba-d9bf-d0ec-e1f2-f721366f43c0@linaro.org>
	<20230606122812.411b223a@xps-13>
	<e0d14527-8147-5e8b-6a43-ee043e0d0f8b@linaro.org>
	<d0b2cdc5-12fd-9a19-b38c-0653b4147c2b@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_035732_746363_A15A361F 
X-CRM114-Status: GOOD (  35.91  )
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

SGkgS3J6eXN6dG9mLAoKa3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnIHdyb3RlIG9uIFR1
ZSwgNiBKdW4gMjAyMyAxMjo0MDo0NSArMDIwMDoKCj4gT24gMDYvMDYvMjAyMyAxMjozNywgS3J6
eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiA+IE9uIDA2LzA2LzIwMjMgMTI6MjgsIE1pcXVlbCBS
YXluYWwgd3JvdGU6ICAKPiA+PiBIaSBLcnp5c3p0b2YsCj4gPj4KPiA+PiBrcnp5c3p0b2Yua296
bG93c2tpQGxpbmFyby5vcmcgd3JvdGUgb24gVHVlLCA2IEp1biAyMDIzIDEwOjQ0OjM0ICswMjAw
Ogo+ID4+ICAKPiA+Pj4gT24gMDYvMDYvMjAyMyAwOTo0OCwgTWlxdWVsIFJheW5hbCB3cm90ZTog
IAo+ID4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBpdCAob3RoZXJ3aXNlIGl0IGlzIGhh
cm1sZXNzKS4KPiA+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAkcmVmOiAvc2NoZW1hcy90eXBl
cy55YW1sIy9kZWZpbml0aW9ucy9mbGFnCj4gPj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZGVw
cmVjYXRlZDogdHJ1ZQo+ID4+Pj4+Pj4+Pj4gKwo+ID4+Pj4+Pj4+Pj4gK8KgwqDCoCBhZGRpdGlv
bmFsUHJvcGVydGllczogZmFsc2UgICAgICAKPiA+Pj4+Pj4+Pj4gdW5ldmFsdWF0ZWRQcm9wZXJ0
aWVzOiBmYWxzZSAgICAgIAo+ID4+Pj4+Pj4+IEl0IHdhcyBoaWRpbmcgYnkgJyJebmFuZEBbMC0z
XSQiOicuIFNob3VsZCBJIG1vdmUgaXQgaGVyZT8gICAgICAKPiA+Pj4+Pj4+IFlvdSBjYW5ub3Qg
aGF2ZSBib3RoIGFkZGl0aW9uYWxQcm9wcyBhbmQgdW5ldmFsdWF0ZWRQcm9wcyBhdCB0aGUgc2Ft
ZQo+ID4+Pj4+Pj4gdGltZSwgc28gd2UgZG8gbm90IHRhbGsgYWJvdXQgc2FtZSB0aGluZyBvciB0
aGlzIHdhcyBuZXZlciB3b3JraW5nPyAgICAgIAo+ID4+Pj4+Pgo+ID4+Pj4+PiBIbW0sIEknbSBh
IGxpdHRsZSBjb25mdXNlZCB0aGVuLiBBdCB2YXJpb3VzIHRpbWVzIEkndmUgYmVlbiB0b2xkIHRv
IAo+ID4+Pj4+PiBwdXQgJ2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZScgb3IgJ3VuZXZhbHVh
dGVkUHJvcGVydGllczogZmFsc2UnIAo+ID4+Pj4+PiAoYWx0aG91Z2ggbmV2ZXIgYXQgdGhlIHNh
bWUgdGltZSkuIEknbSBub3Qgc3VyZSB3aGVuIHRvIHVzZSBvbmUgb3IgdGhlIAo+ID4+Pj4+PiBv
dGhlci4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gRnJvbSB3aGF0IEkndmUgYmVlbiBhYmxlIHRvIGdsZWFu
ICdhZGRpdGlvbmFsUHJvcGVydGllczogdHJ1ZScgCj4gPj4+Pj4+IGluZGljYXRlcyB0aGF0IHRo
ZSBub2RlIGlzIGV4cGVjdGVkIHRvIGhhdmUgY2hpbGQgbm9kZXMgZGVmaW5lZCBpbiBhIAo+ID4+
Pj4+PiBkaWZmZXJlbnQgc2NoZW1hIHNvIEkgd291bGQgaGF2ZSB0aG91Z2h0ICdhZGRpdGlvbmFs
UHJvcGVydGllczogZmFsc2UnIAo+ID4+Pj4+PiB3b3VsZCBiZSBhcHByb3ByaWF0ZSBmb3IgYSBz
Y2hlbWEgY292ZXJpbmcgYSBsZWFmIG5vZGUuIAo+ID4+Pj4+PiAndW5ldmFsdWF0ZWRQcm9wZXJ0
aWVzOiBmYWxzZScgc2VlbXMgdG8gZW5hYmxlIHN0cmljdGVyIGNoZWNraW5nIHdoaWNoIAo+ID4+
Pj4+PiBtYWtlcyBzZW5zZSB3aGVuIGFsbCB0aGUgcHJvcGVydGllcyBhcmUgZGVzY3JpYmVkIGlu
IHRoZSBzY2hlbWEuICAgICAgCj4gPj4+Pj4KPiA+Pj4+PiBTbyBJIHRoaW5rIHRoaXMgbWlnaHQg
YmUgdGhlIHByb2JsZW0uIElmIEkgbG9vayBhdCBxY29tLG5hbmRjLnlhbWwgb3IgCj4gPj4+Pj4g
aW5nZW5pYyxuYW5kLnlhbWwgd2hpY2ggYm90aCBoYXZlIGEgcGFydGl0aW9ucyBwcm9wZXJ0eSBp
biB0aGVpciAKPiA+Pj4+PiBleGFtcGxlLiBOZWl0aGVyIGhhdmUgJ3VuZXZhbHVhdGVkUHJvcGVy
dGllczogZmFsc2UnIG9uIHRoZSBuYW5kQC4uLiAKPiA+Pj4+PiBzdWJub2RlLiBJZiBJIGFkZCBp
dCBzdXJlIGVub3VnaCBJIHN0YXJ0IGdldHRpbmcgY29tcGxhaW50cyBhYm91dCB0aGUgCj4gPj4+
Pj4gJ3BhcnRpdGlvbnMnIG5vZGUgYmVpbmcgdW5leHBlY3RlZC4gICAgCj4gPj4+Pgo+ID4+Pj4g
U29ycnkgaWYgdGhhdCB3YXMgdW5jbGVhciwgSSB0aGluayB0aGUgd2hvbGUgbG9naWMgYXJvdW5k
IHRoZSB5YW1sCj4gPj4+PiBmaWxlcyBpcyB0byBwcm9ncmVzc2l2ZWx5IGNvbnN0cmFpbiB0aGUg
ZGVzY3JpcHRpb25zLCBzY2hlbWEgYWZ0ZXIKPiA+Pj4+IHNjaGVtYS4gSU9XLCBpbiB0aGUgbWFy
dmVsbCBiaW5kaW5nIHlvdSBzaG91bGQgc2V0Cj4gPj4+PiB1bmV2YWx1YXRlZFByb3BlcnRpZXM6
IGZhbHNlIGZvciB0aGUgTkFORCBjb250cm9sbGVyLiBXaGF0IGlzIGluc2lkZQo+ID4+Pj4gKE5B
TkQgY2hpcHMsIHBhcnRpdGlvbiBjb250YWluZXIsIHBhcnRpdGlvbiBwYXJzZXJzLCAibXRkIiBw
cm9wZXJ0aWVzLAo+ID4+Pj4gZXRjKSB3aWxsIGJlIGhhbmRsZWQgYnkgb3RoZXIgZmlsZXMuIE9m
IGNvdXJzZSB5b3UgY2FuIGNvbnN0cmFpbiBhIGJpdAo+ID4+Pj4gd2hhdCBjYW4vY2Fubm90IGJl
IHVzZWQgaW5zaWRlIHRoZXNlIHN1Ym5vZGVzLCBidXQgSSB0aGluayB5b3UgZG9uJ3QKPiA+Pj4+
IG5lZWQgdG8gc2V0IHVuZXZhbHVhdGVkUHJvcGVydGllcyBpbiB0aGVzZSBzdWJub2RlcyAodGhl
IE5BTkQgY2hpcCBpbgo+ID4+Pj4gdGhpcyBjYXNlLCBvciBldmVuIHRoZSBwYXJ0aXRpb25zKSBi
ZWNhdXNlIHlvdSBhbHJlYWR5IHJlZmVyZW5jZQo+ID4+Pj4gbmFuZC1jb250cm9sbGVyLnlhbWwg
d2hpY2ggcmVmZXJlbmNlcyBuYW5kLWNoaXAueWFtbCwgbXRkLnlhbWwsCj4gPj4+PiBwYXJ0aXRp
b25zLnlhbWwsIGV0Yy4gKnRoZXkqIHdpbGwgbWFrZSB0aGUgZ2VuZXJpYyBjaGVja3MgYW5kIGhv
cGVmdWxseQo+ID4+Pj4gYXBwbHkgc3RyaWN0ZXIgY2hlY2tzLCB3aGVuIGRlZW1lZCByZWxldmFu
dC4gICAgCj4gPj4+Cj4gPj4+IE5vLCBuZWl0aGVyIG5hbmQtY29udHJvbGxlci55YW1sIG5vciBu
YW5kLWNoaXAueWFtbCBsaW1pdCB0aGUgcHJvcGVydGllcwo+ID4+PiBpbiB0aGlzIGNvbnRleHQs
IHNvIGVhY2ggZGV2aWNlIHNjaGVtYSBtdXN0IGhhdmUgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOgo+
ID4+PiBmYWxzZSwgZm9yIHdoaWNoIEkgYXNrZWQgZmV3IGVtYWlscyBhZ28uICAKPiA+Pgo+ID4+
IFRoZSBjb250cm9sbGVyIGRlc2NyaXB0aW9uIHNoYWxsIGJlIGd1YXJkZWQgYnkgdW5ldmFsdWF0
ZWRQcm9wZXJ0aWVzOgo+ID4+IGZhbHNlLCB3ZSBhZ3JlZS4gRG8geW91IG1lYW4gdGhlIG5hbmQg
Y2hpcCBkZXNjcmlwdGlvbiBpbiBlYWNoIG5hbmQKPiA+PiBjb250cm9sbGVyIGJpbmRpbmcgc2hv
dWxkIGFsc28gaW5jbHVkZSBpdCBhdCBpdHMgb3duIGxldmVsPyBCZWNhdXNlCj4gPj4gdGhhdCBp
cyBub3Qgd2hhdCB3ZSBlbmZvcmNlZCBzbyBmYXIgSUlSQy4gSSBhbSB0b3RhbGx5IGZpbmUgZG9p
bmcgc28KPiA+PiBzdGFydGluZyBmcm9tIG5vdyBvbiBpZiB0aGlzIGlzIGEgbmV3IHJlcXVpcmVt
ZW50ICh3aGljaCBtYWtlcyBzZW5zZSkuCj4gPj4KPiA+PiBJZiB5ZXMsIHRoZW4gaXQgbWVhbnMg
d2Ugd291bGQgbmVlZCB0byBsaXN0ICphbGwqIHRoZSBuYW5kCj4gPj4gY2hpcCBwcm9wZXJ0aWVz
IGluIGVhY2ggc2NoZW1hLCB3aGljaCBjbGVhcmx5IGludm9sdmVzIGEgbG90IG9mCj4gPj4gZHVw
bGljYXRpb24gYXMgeW91IHdvdWxkIG5lZWQgdG8gZGVmaW5lIGFsbCB0eXBlcyBvZiBwYXJ0aXRp
b25zLAo+ID4+IHBhcnRpdGlvbiBwYXJzZXJzLCBnZW5lcmljIHByb3BlcnRpZXMsIGV0YyBpbiBv
cmRlciBmb3IgdGhlIGV4YW1wbGVzIHRvCj4gPj4gcGFzcyBhbGwgdGhlIGNoZWNrcy4gT25seSB0
aGUgcHJvcGVydGllcyBsaWtlIHBpbmN0cmwtKiB3b3VsZCBub3QgbmVlZAo+ID4+IHRvIGJlIGxp
c3RlZCBJIGd1ZXNzLiAgCj4gPiAKPiA+IFllcywgdGhpcyBpcyB3aGF0IHNob3VsZCBiZSBkb25l
LiBFYWNoIG5vZGUgc2hvdWxkIGhhdmUgZWl0aGVyICAKPiAKPiBFaCwgbm8sIEkgcmVzcG9uZGVk
IGluIHdyb25nIHBhcnQgb2YgbWVzc2FnZS4gTXkgeWVzIHdhcyBmb3I6Cj4gCj4gIiBEbyB5b3Ug
bWVhbiB0aGUgbmFuZCBjaGlwIGRlc2NyaXB0aW9uIGluIGVhY2ggbmFuZAo+IGNvbnRyb2xsZXIg
YmluZGluZyBzaG91bGQgYWxzbyBpbmNsdWRlIGl0IGF0IGl0cyBvd24gbGV2ZWw/IgoKQ2xlYXIu
Cgo+IAo+IE5vdyBmb3IgYWN0dWFsIHBhcmFncmFwaDoKPiAKPiAiSWYgeWVzLCB0aGVuIGl0IG1l
YW5zIHdlIHdvdWxkIG5lZWQgdG8gbGlzdCAqYWxsKiB0aGUgbmFuZCBjaGlwCj4gcHJvcGVydGll
cyBpbiBlYWNoIHNjaGVtYSwiCj4gCj4gTm8sIHdoeT8gSSBkb24ndCB1bmRlcnN0YW5kLiBVc2Ug
dGhlIHNhbWUgcGF0dGVybiBhcyBhbGwgb3RoZXIgYmluZGluZ3MsCj4gdGhpcyBpcyBub3Qgc3Bl
Y2lhbC4gQWJzb2x1dGVseSBhbGwgaGF2ZSB0aGUgc2FtZSBiZWhhdmlvciwgZS5nLgo+IG1lbnRp
b25lZCBsZWRzLiBZb3UgZmluaXNoIHdpdGggdW5ldmFsdWF0ZWRQcm9wcyBhbmQgeW91J3JlIGRv
bmUsIHdoaWNoCj4gaXMgd2hhdCBJIHdyb3RlIGhlcmUgbG9uZywgbG9uZyB0aW1lIGFnby4KCk1h
eWJlIGJlY2F1c2Ugc28gZmFyIHdlIGRpZCBub3QgYm90aGVyIHJlZmVyZW5jaW5nIGFub3RoZXIg
c2NoZW1hIGluCnRoZSBOQU5EIGNoaXAgbm9kZXM/IEZvciB5b3VyIGhpbnQgdG8gd29yayBJIGd1
ZXNzIHdlIHNob3VsZCBoYXZlLCBpbgplYWNoIGNvbnRyb2xsZXIgYmluZGluZywgc29tZXRoaW5n
IGFsb25nOgoKIHBhdHRlcm5Qcm9wZXJ0aWVzOgogICAiXm5hbmRAW2EtZjAtOV0kIjoKICAgICB0
eXBlOiBvYmplY3QKKyAgICAkcmVmOiBuYW5kLWNoaXAueWFtbCMKICAgICBwcm9wZXJ0aWVzOgoK
SWYgeWVzLCBwbGVhc2UgaWdub3JlIHRoZSBzZXJpZXMgc2VudCBhc2lkZSwgSSB3aWxsIHdvcmsg
b24gaXQgYWdhaW4KYW5kIHNlbmQgYSB2Mi4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
