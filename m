Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80824FA3740
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Oct 2022 13:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WpYU9/nV5jq+FjB0PskpDBu8s4jieimKZ2B16lJirq8=; b=PrFFCmaGTnyy/x
	RT164MCeCMrPTlpN5zglHyNPTAwDJMx7qtCmv1xJxjsXjy8BwdTxklSLFf2ZJULplemOLMLfoTkBn
	Ks7Lhf057NRGKL8C8De1ej37XGuMZMW2ESh3D4opjj/n6OxLWCn4GOuSkfKsZJSXkm4BcZc+qJhWw
	I97L+FEHviXlqoWGcId486CWTq9k7UIbsrA8tW551LOctuH+BJC48DjrvRlaPQy8eRf2sYiqudref
	YY/UroWesgCU6bVWmhGq0LT3tVAVxGHk2y2SZq0q5nIatCgkK4TpPi+qe46m+61K8noheqLolBCZ7
	MfPikBdb2hp78rktpFfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo3Hs-00DhFq-8K; Thu, 27 Oct 2022 13:51:12 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo3HF-00Dh0L-0r; Thu, 27 Oct 2022 13:50:35 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9DB8920009;
	Thu, 27 Oct 2022 13:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666878629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2UG3WwlOVChAnpFDe0xeg3U7NggvKxaTr383RmAux4Y=;
	b=U84VQ7GLpcOkquHAJlNEadSl8VjGxoB0v5YyKNQUvWLwbwTOB/5Su2wXJDhXL654Zc4QH4
	afJzb2R8U5dPRLH235p9dMt00CR0RovkE42TemSA8FoDPn4psoYSGAVmZgk5uNrWYrCTJO
	Rm9q5Dvk70SE3aInhLeI7VV5IjWPRzqkqRVbet88bsz2mIAuIKY42JvmXQtWrzB1wQp2Uj
	rOcnbFVUzgPoLg/4sChvPLTKgd+JBhunoGl8/Jro8NldDUyIdQ2GqzfwTYX63jsywnmOt6
	5Z6vVIUkRpP891tqAZPQqakC9IxkayES/nt4zYpdFtqomYB8O0mgL6E9/S1nmA==
Date: Thu, 27 Oct 2022 15:50:25 +0200
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
Message-ID: <20221027155025.7c04774a@xps-13>
In-Reply-To: <e937b059-4168-3bd4-b294-cbfff0519d1f@linaro.org>
References: <20221026134545.7146-1-vadym.kochan@plvision.eu>
	<20221026134545.7146-2-vadym.kochan@plvision.eu>
	<33f04b06-dc00-b7ce-6a24-2282608b40dc@linaro.org>
	<VI1P190MB0317C739E2D39427CD2A771D95309@VI1P190MB0317.EURP190.PROD.OUTLOOK.COM>
	<10581088-e4ff-76db-3c9b-42a7a9c118ee@linaro.org>
	<20221027151825.166a9255@xps-13>
	<e937b059-4168-3bd4-b294-cbfff0519d1f@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_065033_381321_F7C3EFC2 
X-CRM114-Status: GOOD (  29.76  )
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

SGkgS3J6eXN6dG9mLAoKa3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnIHdyb3RlIG9uIFRo
dSwgMjcgT2N0IDIwMjIgMDk6MjQ6MjQgLTA0MDA6Cgo+IE9uIDI3LzEwLzIwMjIgMDk6MTgsIE1p
cXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBWYWR5bSwKPiA+ICAgCj4gPj4+Pj4gK3BhdHRlcm5Q
cm9wZXJ0aWVzOgo+ID4+Pj4+ICsgICJebmFuZEBbMC0zXSQiOgo+ID4+Pj4+ICsgICAgdHlwZTog
b2JqZWN0Cj4gPj4+Pj4gKyAgICBwcm9wZXJ0aWVzOgo+ID4+Pj4+ICsgICAgICByZWc6Cj4gPj4+
Pj4gKyAgICAgICAgbWluaW11bTogMAo+ID4+Pj4+ICsgICAgICAgIG1heGltdW06IDMKPiA+Pj4+
PiArCj4gPj4+Pj4gKyAgICAgIG5hbmQtcmI6Cj4gPj4+Pj4gKyAgICAgICAgbWluaW11bTogMAo+
ID4+Pj4+ICsgICAgICAgIG1heGltdW06IDEKPiA+Pj4+PiArCj4gPj4+Pj4gKyAgICAgIG5hbmQt
ZWNjLXN0cmVuZ3RoOgo+ID4+Pj4+ICsgICAgICAgIGVudW06IFsxLCA0LCA4XQo+ID4+Pj4+ICsK
PiA+Pj4+PiArICAgICAgbmFuZC1vbi1mbGFzaC1iYnQ6IHRydWUKPiA+Pj4+PiArCj4gPj4+Pj4g
KyAgICAgIG5hbmQtZWNjLW1vZGU6IHRydWUKPiA+Pj4+PiArCj4gPj4+Pj4gKyAgICAgIG5hbmQt
ZWNjLWFsZ286Cj4gPj4+Pj4gKyAgICAgICAgZGVzY3JpcHRpb246IHwKPiA+Pj4+PiArICAgICAg
ICAgIFRoaXMgcHJvcGVydHkgaXMgZXNzZW50aWFsbHkgdXNlZnVsIHdoZW4gbm90IHVzaW5nIGhh
cmR3YXJlIEVDQy4KPiA+Pj4+PiArICAgICAgICAgIEhvd2VydmVyLCBpdCBtYXkgYmUgYWRkZWQg
d2hlbiB1c2luZyBoYXJkd2FyZSBFQ0MgZm9yIGNsYXJpZmljYXRpb24KPiA+Pj4+PiArICAgICAg
ICAgIGJ1dCB3aWxsIGJlIGlnbm9yZWQgYnkgdGhlIGRyaXZlciBiZWNhdXNlIEVDQyBtb2RlIGlz
IGNob3NlbiBkZXBlbmRpbmcKPiA+Pj4+PiArICAgICAgICAgIG9uIHRoZSBwYWdlIHNpemUgYW5k
IHRoZSBzdHJlbmd0aCByZXF1aXJlZCBieSB0aGUgTkFORCBjaGlwLgo+ID4+Pj4+ICsgICAgICAg
ICAgVGhpcyB2YWx1ZSBtYXkgYmUgb3ZlcndyaXR0ZW4gd2l0aCBuYW5kLWVjYy1zdHJlbmd0aCBw
cm9wZXJ0eS4KPiA+Pj4+PiArCj4gPj4+Pj4gKyAgICAgIG5hbmQtZWNjLXN0ZXAtc2l6ZToKPiA+
Pj4+PiArICAgICAgICBkZXNjcmlwdGlvbjogfAo+ID4+Pj4+ICsgICAgICAgICAgTWFydmVsbCdz
IE5BTkQgZmxhc2ggY29udHJvbGxlciBkb2VzIHVzZSBmaXhlZCBzdHJlbmd0aAo+ID4+Pj4+ICsg
ICAgICAgICAgKDEtYml0IGZvciBIYW1taW5nLCAxNi1iaXQgZm9yIEJDSCksIHNvIHRoZSBhY3R1
YWwgc3RlcCBzaXplCj4gPj4+Pj4gKyAgICAgICAgICB3aWxsIHNocmluayBvciBncm93IGluIG9y
ZGVyIHRvIGZpdCB0aGUgcmVxdWlyZWQgc3RyZW5ndGguCj4gPj4+Pj4gKyAgICAgICAgICBTdGVw
IHNpemVzIGFyZSBub3QgY29tcGxldGVseSByYW5kb20gZm9yIGFsbCBhbmQgZm9sbG93IGNlcnRh
aW4KPiA+Pj4+PiArICAgICAgICAgIHBhdHRlcm5zIGRlc2NyaWJlZCBpbiBBTi0zNzksICJNYXJ2
ZWxsIFNvQyBORkMgRUNDIi4KPiA+Pj4+PiArCj4gPj4+Pj4gKyAgICAgIGxhYmVsOgo+ID4+Pj4+
ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3N0cmluZwo+
ID4+Pj4+ICsKPiA+Pj4+PiArICAgICAgcGFydGl0aW9uczoKPiA+Pj4+PiArICAgICAgICB0eXBl
OiBvYmplY3QgICAgCj4gPj4+Pgo+ID4+Pj4gVGhhdCdzIG5vdCB3aGF0IEkgYXNrZWQgZm9yLiBM
aWtlIGZvdXIgdGltZXMgSSBhc2tlZCB5b3UgdG8gYWRkIGhlcmUKPiA+Pj4+IHVuZXZhbHVhdGVk
UHJvcGVydGllczogZmFsc2UgYW5kIEkgbmV2ZXIgc2FpZCB0aGF0IHJlZiB0byBwYXJ0aXRpb24u
eWFtbAo+ID4+Pj4gc2hvdWxkIGJlIHJlbW92ZWQgYW5kIHlvdS4uLiBpbnN0ZWFkIHJlbW92ZSB0
aGF0IHJlZi4KPiA+Pj4+Cj4gPj4+PiBZb3UgbmVlZCB0byBkZWZpbmUgaGVyZSBjaGlsZHJlbiBh
bmQgc3BlY2lmeSB0aGVpciByZWYuCj4gPj4+Pgo+ID4+Pj4gWW91IG11c3QgdXNlIHVuZXZhbHVh
dGVkUHJvcGVydGllczogZmFsc2UgaGVyZS4gU28gdGhpcyBpcyBmaWZ0aCB0aW1lIEkKPiA+Pj4+
IGFtIHdyaXRpbmcgdGhpcyBmZWVkYmFjay4KPiA+Pj4+Cj4gPj4+PiAgICAKPiA+Pj4KPiA+Pj4g
SXQgaXMgYSBiaXQgY29uZnVzaW5nIHRoYXQgaXQgaXMgbmVlZGVkIHRvIGRlZmluZSAicGFydGl0
aW9ucyIgYW5kICJsYWJlbCIgcnVsZXMgcGFydGljdWxhcnkKPiA+Pj4gaW4gdGhpcyBuYW5kIGNv
bnRyb2xsZXIgaW5zdGVhZCBvZiBzb21lIGNvbW1vbiBwbGFjZSBsaWtlIG5hbmQtY2hpcC55YW1s
LCB0aGVzZSBwcm9wZXJ0aWVzCj4gPj4+IGFyZSBjb21tb24gYWxzbyBmb3IgdGhlIG90aGVyIG5h
bmQgY29udHJvbGxlcnMuICAgIAo+ID4+Cj4gPj4gTm8gb25lIHNwZWFrcyBhYm91dCBsYWJlbCwg
SSBuZXZlciBjb21tZW50ZWQgYWJvdXQgbGFiZWwsIEkgdGhpbmsuLi4KPiA+Pgo+ID4+IElmIHlv
dSB0aGluayB0aGUgcHJvcGVydHkgaXMgcmVhbGx5IGdlbmVyaWMgYW5kIGV2ZXJ5IE5BTkQgY29u
dHJvbGxlcgo+ID4+IGJpbmRpbmdzIGltcGxlbWVudCBpdCwgdGhlbiBmZWVsIGZyZWUgdG8gaW5j
bHVkZSB0aGVtIHRoZXJlLCBpbiBhCj4gPj4gc2VwYXJhdGUgcGF0Y2guIEl0IHNvdW5kcyBzZW5z
aWJsZSwgYnV0IEkgZGlkIG5vdCBjaGVjayBvdGhlciBiaW5kaW5ncy4gIAo+ID4gCj4gPiBGWUks
IGxhYmVsIGlzIGFscmVhZHkgZGVmaW5lZCBpbiBtdGQvbXRkLnlhbWwuICAKPiAKPiBXaGljaCBp
cyBub3QgaW5jbHVkZWQgaGVyZSBhbmQgaW4gbmFuZC1jb250cm9sbGVyLnlhbWwKCk1heWJlIG5h
bmQtY2hpcC55YW1sIHNob3VsZD8KCj4gPiBQYXJ0aXRpb25zIGRvIG5vdCBuZWVkIHRvIGJlIGRl
ZmluZWQgaW4geW91ciBiaW5kaW5nLCBqdXN0IGRvbid0IHB1dAo+ID4gYW55IGluIHlvdXIgZXhh
bXBsZSBhbmQgeW91J2xsIGJlIGZpbmUuIFRoZXNlIHBhcnRpdGlvbnMgYXJlIGVpdGhlcgo+ID4g
c3RhdGljIGFuZCBtYXkgYmUgZGVzY3JpYmVkIGluIHRoZSBEVCAoc2VlCj4gPiBtdGQvcGFydGl0
aW9uL3BhcnRpdGlvbi55YW1sKSBvciB0aGVyZSBpcyBzb21lIGR5bmFtaWMgZGlzY292ZXJ5Cj4g
PiBpbnZvbHZlZCBhbmQgYSBwcm9wZXIgcGFyc2VyIHNoYWxsIGJlIHJlZmVyZW5jZWQgKHBhcnNl
cnMgaGF2ZSB0aGVpcgo+ID4gb3duIGJpbmRpbmcpLiAgCj4gCj4gSSBkb24ndCB0aGluayB0aGlz
IGlzIGNvcnJlY3QuIEJhc2ljYWxseSB5b3UgYWxsb3cgYW55IG5vZGUgdG8gYmUgdW5kZXIKPiBw
YXJ0aXRpb25zIGFzIHRoZXJlIGlzIG5vIHNjaGVtYSB2YWxpZGF0aW5nIHRoZW0gKHdpdGhvdXQg
Y29tcGF0aWJsZXMpLgoKU29ycnkgaWYgdGhhdCB3YXMgdW5jbGVhciwgd2hhdCBJIG1lYW50IGlz
OiBwYXJ0aXRpb25zIHNob3VsZCBub3QgYmUKZGVmaW5lZCBpbiB0aGUgYmluZGluZ3MgZm9yIE1h
cnZlbGwgTkFORCBjb250cm9sbGVyIGJlY2F1c2UgdGhleSBzaG91bGQKYmUgZGVmaW5lZCBzb21l
d2hlcmUgZWxzZSBhbHJlYWR5LgoKTkFORCBjb250cm9sbGVyIHN1Ym5vZGVzIHNob3VsZCBkZWZp
bmUgdGhlIHN0b3JhZ2UgZGV2aWNlcyAodGhlCmZsYXNoZXMgdGhlbXNlbHZlcykgY29ubmVjdGVk
IHRvIHRoZSBjb250cm9sbGVyLiAibmFuZC1jaGlwLnlhbWwiCmRlc2NyaWJlcyBnZW5lcmljIHBy
b3BlcnRpZXMgZm9yIHRoZXNlLiBBZGRpdGlvbmFsIHN1Ym5vZGVzIGFyZSBhbGxvd2VkCmFuZCBl
eHBlY3RlZCB0byBiZSBwYXJ0aXRpb25zICh0aGlzIGlzIG5vdCBlbmZvcmNlZCBhbnl3aGVyZSBJ
IHRoaW5rKSwKdGhleSBzaG91bGQgdXNlIG9uZSBvZiB0aGUgZXhpc3RpbmcgY29tcGF0aWJsZXMg
dG8gZGVmaW5lIHRoZSBwYXJzZXIuClRoZSBtb3N0IGNvbW1vbiBwYXJzZXIgaXMgbmFtZWQgZml4
ZWQtcGFydGl0aW9ucyBhbmQgaGFzIGl0cyBvd24KY29tcGF0aWJsZS4gRXZlcnkgcGFyc2VyIHJl
ZmVyZW5jZXMgcGFydGl0aW9ucy55YW1sLgoKVGhlcmUgYXJlIGEgZmV3IGNvbnRyb2xsZXIgYmlu
ZGluZ3MgaG93ZXZlciB3aGljaCByZWZlcmVuY2UKcGFydGl0aW9uLnlhbWwgYW55d2F5LCBwcm9i
YWJseSB0byBtYWtlIHRoZSBleGFtcGxlcyB2YWxpZGF0aW9uIHdvcmssCkknbSBub3Qgc3VyZSBp
dCBzaG91bGQgYmUgZG9uZSBsaWtlIHRoYXQgdGhvdWdoOgpodHRwczovL2VsaXhpci5ib290bGlu
LmNvbS9saW51eC92Ni4wL3NvdXJjZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL3RpLGdwbWMtbmFuZC55YW1sCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2
LjAvc291cmNlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvdGksZ3BtYy1v
bmVuYW5kLnlhbWwKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
