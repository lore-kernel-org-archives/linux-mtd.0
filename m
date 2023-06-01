Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B75C7EE23
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jun 2023 07:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P7S9JzGW+y80it5xaNI6zcFMPrznkUBNvooYQVr5rrs=; b=GFoxHbu9eSv4L1
	iZJUArTH8UzPWtkr5atUPF7ahk4YKSn9b1BxXyImPQcpUcqzGmXUZJ339QvdUA64EPCs8/hI/egCM
	gX28Y+MJjuwGsZIrDHYXTvBQtDSargQYE4IVZf2nL+5Bf52ZXetWDEWlDBMwVGEI0KlkH1tvEx5N6
	wM0CzseVGCSBvajpXpLDHnSJKQfOcfBTDOkzJccCHIA/2hjzMyPUHSLVfYxZGulN8rWVclABKHCX5
	+R/7GUspwhTYQfX6TmoW3ipIvzR1FMNz0BVCkJX603DDbD0HIpZeoWScZAzGRxkDkR7aW6b1iwJYR
	vJPp4ZJoOxIVLg5LiGLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4cv1-002OWZ-2C;
	Thu, 01 Jun 2023 07:40:23 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4cux-002OUv-2S;
	Thu, 01 Jun 2023 07:40:21 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685605214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mCdgs2ZY0Qmc8wOXyCbJFq17brRZ1eICKOVPf7KfY74=;
	b=GhliR3CFcGqyKvO9Be0KLUU18LziFPSA3gWRYzfkfkxTtoRGNRQQ9KiITjQUd9LNCvf/bN
	dLWtSU271I3ei3B9VjvDY4DngI2pg+yMFY7sBSksuAP5kr/HRolrc8Cp1j47Qv+JgKqEg0
	M57yjvo2UM4Mu6prfeHwEoAmy9+Geg9mfpXrlmf2CRxqS88Ejxe7szZFnJzYWGhwKdyyWn
	dQBAVgHBaosZQrQenv/x+9h58ExbFku8HfMjN3l7cX4sdwAOeQc19VLjXlWeYaej0O01pj
	NrbkRjziy6ZjKCPkwFgtiY5aWt/j9GjtXWU0kQoolKCVQp/HPw8UfTKVLh8J3g==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 61260C0004;
	Thu,  1 Jun 2023 07:40:10 +0000 (UTC)
Date: Thu, 1 Jun 2023 09:40:09 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
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
 <enachman@marvell.com>, Vadym Kochan <vadym.kochan@plvision.eu>
Subject: Re: [PATCH v7 3/4] dt-bindings: mtd: marvell-nand: Convert to YAML
 DT scheme
Message-ID: <20230601094009.1eca5dbb@xps-13>
In-Reply-To: <40bb4ad8-2bec-4eae-d0c8-c9aa31e03f32@alliedtelesis.co.nz>
References: <20230530235456.1009082-1-chris.packham@alliedtelesis.co.nz>
	<20230530235456.1009082-4-chris.packham@alliedtelesis.co.nz>
	<40bb4ad8-2bec-4eae-d0c8-c9aa31e03f32@alliedtelesis.co.nz>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_004020_091487_B28B4E93 
X-CRM114-Status: GOOD (  19.29  )
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

SGkgQ2hyaXMsCgpDaHJpcy5QYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubnogd3JvdGUgb24gV2Vk
LCAzMSBNYXkgMjAyMyAyMjo0Mzo0NgorMDAwMDoKCj4gSGkgTWlxdWVsLAo+IAo+IE9uIDMxLzA1
LzIzIDExOjU0LCBDaHJpcyBQYWNraGFtIHdyb3RlOgo+ID4gRnJvbTogVmFkeW0gS29jaGFuIDx2
YWR5bS5rb2NoYW5AcGx2aXNpb24uZXU+Cj4gPgo+ID4gU3dpdGNoIHRoZSBEVCBiaW5kaW5nIHRv
IGEgWUFNTCBzY2hlbWEgdG8gZW5hYmxlIHRoZSBEVCB2YWxpZGF0aW9uLgo+ID4KPiA+IERyb3Bw
ZWQgZGVwcmVjYXRlZCBjb21wYXRpYmxlcyBhbmQgcHJvcGVydGllcyBkZXNjcmliZWQgaW4gdHh0
IGZpbGUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogVmFkeW0gS29jaGFuIDx2YWR5bS5rb2NoYW5A
cGx2aXNpb24uZXU+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNr
aGFtQGFsbGllZHRlbGVzaXMuY28ubno+Cj4gPiAtLS0gIAo+IDxzbmlwPgo+ID4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbWFydmVsbCxuYW5kLWNv
bnRyb2xsZXIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbWFy
dmVsbCxuYW5kLWNvbnRyb2xsZXIueWFtbAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGlu
ZGV4IDAwMDAwMDAwMDAwMC4uN2NkNGEyZTk5MzQzCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL21hcnZlbGwsbmFuZC1jb250
cm9sbGVyLnlhbWwKPiA+IEBAIC0wLDAgKzEsMjIxIEBACj4gPiArIyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4gPiArJVlBTUwgMS4yCj4g
PiArLS0tCj4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tdGQvbWFydmVs
bCxuYW5kLWNvbnRyb2xsZXIueWFtbCMKPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+ICsKPiA+ICt0aXRsZTogTWFydmVsbCBOQU5E
IEZsYXNoIENvbnRyb2xsZXIgKE5GQykKPiA+ICsKPiA+ICttYWludGFpbmVyczoKPiA+ICsgIC0g
TWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiA+ICsKPiA+ICtwcm9w
ZXJ0aWVzOgo+ID4gKyAgY29tcGF0aWJsZToKPiA+ICsgICAgb25lT2Y6Cj4gPiArICAgICAgLSBp
dGVtczoKPiA+ICsgICAgICAgICAgLSBjb25zdDogbWFydmVsbCxhcm1hZGEtOGstbmFuZC1jb250
cm9sbGVyCj4gPiArICAgICAgICAgIC0gY29uc3Q6IG1hcnZlbGwsYXJtYWRhMzcwLW5hbmQtY29u
dHJvbGxlciAgCj4gCj4gT24gdGhpcyBzcGVjaWZpYyBwb2ludC4gV2FzIHlvdXIgaW50ZW50aW9u
IHRvIGFsbG93IGp1c3QgdGhlIAo+ICJtYXJ2ZWxsLGFybWFkYS04ay1uYW5kLWNvbnRyb2xsZXIi
IGNvbXBhdGlibGU/Cj4gCj4gSSBtYWRlIGl0IGEgbGlzdCBhcyB0aGUgZXhpc3RpbmcgdXNhZ2Ug
aXMgYGNvbXBhdGlibGUgPSAKPiAibWFydmVsbCxhcm1hZGEtOGstbmFuZC1jb250cm9sbGVyIiwg
Cj4gIm1hcnZlbGwsYXJtYWRhMzcwLW5hbmQtY29udHJvbGxlciI7YCBidXQgYW4gZWFybGllciBj
b21tZW50IHlvdSBtYWRlIAo+IHN1Z2dlc3RlZCB0aGF0IHlvdXIgaW50ZW50aW9uIHdhcyB0byBh
bGxvdyBqdXN0IHRoZSA4ayBjb21wYXRpYmxlIG9uIAo+IGl0J3Mgb3duLgoKVG8gYmUgaG9uZXN0
IEkgZG9uJ3QgcmVjYWxsLiBTb21ldGltZXMgaXQncyBiZXN0IHRvIGNvbnNpZGVyIGEgdmVyc2lv
bgpvZiBhIGNvbnRyb2xsZXIgdG8gYmUgYSBzdXBlcnNldCBvZiBhbm90aGVyLCBpbiB0aGlzIGNh
c2UgYm90aApjb21wYXRpYmxlcyBhcmUgd2VsY29tZS4gSSBzdWdnZXN0IHlvdSBrZWVwIHRoZSBk
ZXNjcmlwdGlvbiBhcyBpdCBpcy4KCj4gTG9va2luZyBhdCB0aGUgZHJpdmVyIGl0IGRvZXNuJ3Qg
ZG8gYW55IGlzX2NvbXBhdGlibGUoKSBjaGVja3MgCj4gc28gSSBkb24ndCB0aGluayBpdCBjYXJl
cyAoY3VycmVudGx5KS4KPiAKPiA+ICsgICAgICAtIGVudW06Cj4gPiArICAgICAgICAgIC0gbWFy
dmVsbCxhcm1hZGEzNzAtbmFuZC1jb250cm9sbGVyCj4gPiArICAgICAgICAgIC0gbWFydmVsbCxw
eGEzeHgtbmFuZC1jb250cm9sbGVyCj4gPiArICAgICAgICAgIC0gbWFydmVsbCxhcm1hZGEtOGst
bmFuZAo+ID4gKyAgICAgICAgICAtIG1hcnZlbGwsYXJtYWRhMzcwLW5hbmQKPiA+ICsgICAgICAg
ICAgLSBtYXJ2ZWxsLHB4YTN4eC1uYW5kCj4gPiAgIAoKClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
