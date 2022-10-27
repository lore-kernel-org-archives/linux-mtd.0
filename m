Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66940FA3740
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Oct 2022 13:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DdBBqzZBuSMtAnOQ7CF9QNcqXlelzdX5hHj/9cpXH38=; b=u9Sx9QeazQ/jhK
	CLBRBEHdysih8rwz7mtxwxmKdQ1Wkqt+aGUFyHfHlA2rR561Mb3x6cE4ReWf128oszqMU7EOwaZeo
	W8HCHbNkDWcNkN9gF+gmIjhOzadF4ol7zLB5Mj87Gluxiaa2JpSXym/cFFeKPYxEjBH6vBOjcnAVO
	qpqcSxypF3V/8DYWgt3B0zvWy5Ky5qmHNs6aXtL/DBJHbaaA8unm5bW31ekPDoo7Tcebeci0lbc3S
	/E5hQObm88coUZV2DO4SCA6fNrhaWGz5LYVTKcNNmgepbD/M48g88XYMUwmRTq75AGAWh7EUQVtT0
	+VZTVKHDUy+Ls0yNnkaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo31V-00DYi9-Gv; Thu, 27 Oct 2022 13:34:17 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2mK-00DQG8-KJ; Thu, 27 Oct 2022 13:18:38 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5619FC000C;
	Thu, 27 Oct 2022 13:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666876710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uqF5CDn38yx/3Kjsiob6zhNia5VejsygoU+CPgjinFI=;
	b=cJB3cGS02+Hu+GcXYQ4LKwvNNiuEon/LwyvVz7WhKFkBGOV2vkQIRi5IEw9Yjl2HlhvI0Z
	dyXW3IkwQezIw9bkXBbrS8dPwC/9zW8G7dNAeFHf8a0PG4dhvqXw9yB1ihVQ3/szoKtwxG
	48tWs+QUk0I2FeySavoqxJC0PX8oGc/PgjADbgbXijYVoB4cA3yEmGWyMvmOsXFSn8MA5n
	Mg5IZvqIp5ab4RapF0UsQ4VImW/Hm6ppjLqtFKKBtrcUYlrM+ochPl9cAXyHiWdaNsxKiA
	SazdG7BORiSbCUavr5D/i+dKHCKLtnR8JJj/e3Hir2ZEZ+bmXNFkfm2KtYn8fQ==
Date: Thu, 27 Oct 2022 15:18:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vadym Kochan <vadym.kochan@plvision.eu>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Gregory
 Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Elad Nachman <enachman@marvell.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v5 1/2] dt-bindings: mtd: marvell-nand: Convert to YAML
 DT scheme
Message-ID: <20221027151825.166a9255@xps-13>
In-Reply-To: <10581088-e4ff-76db-3c9b-42a7a9c118ee@linaro.org>
References: <20221026134545.7146-1-vadym.kochan@plvision.eu>
	<20221026134545.7146-2-vadym.kochan@plvision.eu>
	<33f04b06-dc00-b7ce-6a24-2282608b40dc@linaro.org>
	<VI1P190MB0317C739E2D39427CD2A771D95309@VI1P190MB0317.EURP190.PROD.OUTLOOK.COM>
	<10581088-e4ff-76db-3c9b-42a7a9c118ee@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_061836_975106_35B203F7 
X-CRM114-Status: GOOD (  21.28  )
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

SGkgVmFkeW0sCgo+ID4+PiArcGF0dGVyblByb3BlcnRpZXM6Cj4gPj4+ICsgICJebmFuZEBbMC0z
XSQiOgo+ID4+PiArICAgIHR5cGU6IG9iamVjdAo+ID4+PiArICAgIHByb3BlcnRpZXM6Cj4gPj4+
ICsgICAgICByZWc6Cj4gPj4+ICsgICAgICAgIG1pbmltdW06IDAKPiA+Pj4gKyAgICAgICAgbWF4
aW11bTogMwo+ID4+PiArCj4gPj4+ICsgICAgICBuYW5kLXJiOgo+ID4+PiArICAgICAgICBtaW5p
bXVtOiAwCj4gPj4+ICsgICAgICAgIG1heGltdW06IDEKPiA+Pj4gKwo+ID4+PiArICAgICAgbmFu
ZC1lY2Mtc3RyZW5ndGg6Cj4gPj4+ICsgICAgICAgIGVudW06IFsxLCA0LCA4XQo+ID4+PiArCj4g
Pj4+ICsgICAgICBuYW5kLW9uLWZsYXNoLWJidDogdHJ1ZQo+ID4+PiArCj4gPj4+ICsgICAgICBu
YW5kLWVjYy1tb2RlOiB0cnVlCj4gPj4+ICsKPiA+Pj4gKyAgICAgIG5hbmQtZWNjLWFsZ286Cj4g
Pj4+ICsgICAgICAgIGRlc2NyaXB0aW9uOiB8Cj4gPj4+ICsgICAgICAgICAgVGhpcyBwcm9wZXJ0
eSBpcyBlc3NlbnRpYWxseSB1c2VmdWwgd2hlbiBub3QgdXNpbmcgaGFyZHdhcmUgRUNDLgo+ID4+
PiArICAgICAgICAgIEhvd2VydmVyLCBpdCBtYXkgYmUgYWRkZWQgd2hlbiB1c2luZyBoYXJkd2Fy
ZSBFQ0MgZm9yIGNsYXJpZmljYXRpb24KPiA+Pj4gKyAgICAgICAgICBidXQgd2lsbCBiZSBpZ25v
cmVkIGJ5IHRoZSBkcml2ZXIgYmVjYXVzZSBFQ0MgbW9kZSBpcyBjaG9zZW4gZGVwZW5kaW5nCj4g
Pj4+ICsgICAgICAgICAgb24gdGhlIHBhZ2Ugc2l6ZSBhbmQgdGhlIHN0cmVuZ3RoIHJlcXVpcmVk
IGJ5IHRoZSBOQU5EIGNoaXAuCj4gPj4+ICsgICAgICAgICAgVGhpcyB2YWx1ZSBtYXkgYmUgb3Zl
cndyaXR0ZW4gd2l0aCBuYW5kLWVjYy1zdHJlbmd0aCBwcm9wZXJ0eS4KPiA+Pj4gKwo+ID4+PiAr
ICAgICAgbmFuZC1lY2Mtc3RlcC1zaXplOgo+ID4+PiArICAgICAgICBkZXNjcmlwdGlvbjogfAo+
ID4+PiArICAgICAgICAgIE1hcnZlbGwncyBOQU5EIGZsYXNoIGNvbnRyb2xsZXIgZG9lcyB1c2Ug
Zml4ZWQgc3RyZW5ndGgKPiA+Pj4gKyAgICAgICAgICAoMS1iaXQgZm9yIEhhbW1pbmcsIDE2LWJp
dCBmb3IgQkNIKSwgc28gdGhlIGFjdHVhbCBzdGVwIHNpemUKPiA+Pj4gKyAgICAgICAgICB3aWxs
IHNocmluayBvciBncm93IGluIG9yZGVyIHRvIGZpdCB0aGUgcmVxdWlyZWQgc3RyZW5ndGguCj4g
Pj4+ICsgICAgICAgICAgU3RlcCBzaXplcyBhcmUgbm90IGNvbXBsZXRlbHkgcmFuZG9tIGZvciBh
bGwgYW5kIGZvbGxvdyBjZXJ0YWluCj4gPj4+ICsgICAgICAgICAgcGF0dGVybnMgZGVzY3JpYmVk
IGluIEFOLTM3OSwgIk1hcnZlbGwgU29DIE5GQyBFQ0MiLgo+ID4+PiArCj4gPj4+ICsgICAgICBs
YWJlbDoKPiA+Pj4gKyAgICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlv
bnMvc3RyaW5nCj4gPj4+ICsKPiA+Pj4gKyAgICAgIHBhcnRpdGlvbnM6Cj4gPj4+ICsgICAgICAg
IHR5cGU6IG9iamVjdCAgCj4gPj4KPiA+PiBUaGF0J3Mgbm90IHdoYXQgSSBhc2tlZCBmb3IuIExp
a2UgZm91ciB0aW1lcyBJIGFza2VkIHlvdSB0byBhZGQgaGVyZQo+ID4+IHVuZXZhbHVhdGVkUHJv
cGVydGllczogZmFsc2UgYW5kIEkgbmV2ZXIgc2FpZCB0aGF0IHJlZiB0byBwYXJ0aXRpb24ueWFt
bAo+ID4+IHNob3VsZCBiZSByZW1vdmVkIGFuZCB5b3UuLi4gaW5zdGVhZCByZW1vdmUgdGhhdCBy
ZWYuCj4gPj4KPiA+PiBZb3UgbmVlZCB0byBkZWZpbmUgaGVyZSBjaGlsZHJlbiBhbmQgc3BlY2lm
eSB0aGVpciByZWYuCj4gPj4KPiA+PiBZb3UgbXVzdCB1c2UgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVz
OiBmYWxzZSBoZXJlLiBTbyB0aGlzIGlzIGZpZnRoIHRpbWUgSQo+ID4+IGFtIHdyaXRpbmcgdGhp
cyBmZWVkYmFjay4KPiA+Pgo+ID4+ICAKPiA+IAo+ID4gSXQgaXMgYSBiaXQgY29uZnVzaW5nIHRo
YXQgaXQgaXMgbmVlZGVkIHRvIGRlZmluZSAicGFydGl0aW9ucyIgYW5kICJsYWJlbCIgcnVsZXMg
cGFydGljdWxhcnkKPiA+IGluIHRoaXMgbmFuZCBjb250cm9sbGVyIGluc3RlYWQgb2Ygc29tZSBj
b21tb24gcGxhY2UgbGlrZSBuYW5kLWNoaXAueWFtbCwgdGhlc2UgcHJvcGVydGllcwo+ID4gYXJl
IGNvbW1vbiBhbHNvIGZvciB0aGUgb3RoZXIgbmFuZCBjb250cm9sbGVycy4gIAo+IAo+IE5vIG9u
ZSBzcGVha3MgYWJvdXQgbGFiZWwsIEkgbmV2ZXIgY29tbWVudGVkIGFib3V0IGxhYmVsLCBJIHRo
aW5rLi4uCj4gCj4gSWYgeW91IHRoaW5rIHRoZSBwcm9wZXJ0eSBpcyByZWFsbHkgZ2VuZXJpYyBh
bmQgZXZlcnkgTkFORCBjb250cm9sbGVyCj4gYmluZGluZ3MgaW1wbGVtZW50IGl0LCB0aGVuIGZl
ZWwgZnJlZSB0byBpbmNsdWRlIHRoZW0gdGhlcmUsIGluIGEKPiBzZXBhcmF0ZSBwYXRjaC4gSXQg
c291bmRzIHNlbnNpYmxlLCBidXQgSSBkaWQgbm90IGNoZWNrIG90aGVyIGJpbmRpbmdzLgoKRllJ
LCBsYWJlbCBpcyBhbHJlYWR5IGRlZmluZWQgaW4gbXRkL210ZC55YW1sLgoKUGFydGl0aW9ucyBk
byBub3QgbmVlZCB0byBiZSBkZWZpbmVkIGluIHlvdXIgYmluZGluZywganVzdCBkb24ndCBwdXQK
YW55IGluIHlvdXIgZXhhbXBsZSBhbmQgeW91J2xsIGJlIGZpbmUuIFRoZXNlIHBhcnRpdGlvbnMg
YXJlIGVpdGhlcgpzdGF0aWMgYW5kIG1heSBiZSBkZXNjcmliZWQgaW4gdGhlIERUIChzZWUKbXRk
L3BhcnRpdGlvbi9wYXJ0aXRpb24ueWFtbCkgb3IgdGhlcmUgaXMgc29tZSBkeW5hbWljIGRpc2Nv
dmVyeQppbnZvbHZlZCBhbmQgYSBwcm9wZXIgcGFyc2VyIHNoYWxsIGJlIHJlZmVyZW5jZWQgKHBh
cnNlcnMgaGF2ZSB0aGVpcgpvd24gYmluZGluZykuCgpDaGVlcnMsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
