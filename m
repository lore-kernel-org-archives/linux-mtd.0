Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B104C7EE24
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 11:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5TqwYyaZaDEg1ucw9C4wZ047tB5sGVOOyRpp8X9i22w=; b=cxzL/13KaRaY4i
	Ff3FdtJXaQt6enE6AHJfQpaZY9PTSNmuGWJQLe56Ay+KkQJQc5u0V4ip7Uh3e6M57VMCdarYuq5KZ
	RaEV9qO/ptuW9tJ2lgbEfFxlGR9fiR2FnSV1ia1c+sjF0ARF4r892Pe8EMyKBaF4pXznEEWqjBJyO
	fgICK/HzvSSIih8OJeEVRMaogCkr+dZSnOYP2ajVlYTD9NEgg4nU3K3qqlXAA9/Ew8qQ7C8cjZGD6
	HXetewnC5vRJRaz6inaZVbfbgVxKyccyqyVaEa1/QrtlC11Tijs+L5bNMLdE0rphNRxD4KWi47RyQ
	OsK8F+zYWSTQJgaOPo8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6UXF-001OL3-1v;
	Tue, 06 Jun 2023 11:07:33 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6UXB-001OJw-39;
	Tue, 06 Jun 2023 11:07:32 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686049644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=09M+g6gmWXcLOlBrqcMFpDqHK+MqU1CBFEr/Ok+0g8I=;
	b=AQpOpxdw1CqkMeYpVcOKhMeqrhBhfnWmdaUaItWRJoZMp3S1lZMh4M+NvPjloiNQJfZdnh
	/TN6xPwnB+jTieCuPmAea+CetcLysfPg3yDjjgu6bjEJ/hhr/t/EXo2vEDRAdi4qVbKeOg
	ix8QSQHY401UTJve/0F8BV6M+HhWVmIpw689AERXV2DPNkBsjd207iNS1Xw2YYMWlqabif
	JEpP/7fnNE1ogD79oqySl2XUCUPJKqudU1wa+3x1LP52wU2zfZS0dBDudr2vD2kzNHDY9a
	+z91WzYciBYLXk3w7Nc9cvG8KT2AELvKyNHqW1UV6fj4RuXY63e+ylv3iqVeuw==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id ADE5CE000D;
	Tue,  6 Jun 2023 11:07:20 +0000 (UTC)
Date: Tue, 6 Jun 2023 13:07:19 +0200
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
Message-ID: <20230606130719.5350174c@xps-13>
In-Reply-To: <20230606125724.126a4685@xps-13>
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
	<20230606125724.126a4685@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_040730_569291_73C0D25A 
X-CRM114-Status: GOOD (  44.36  )
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

SGkgS3J6eXN6dG9mLAoKbWlxdWVsLnJheW5hbEBib290bGluLmNvbSB3cm90ZSBvbiBUdWUsIDYg
SnVuIDIwMjMgMTI6NTc6MjQgKzAyMDA6Cgo+IEhpIEtyenlzenRvZiwKPiAKPiBrcnp5c3p0b2Yu
a296bG93c2tpQGxpbmFyby5vcmcgd3JvdGUgb24gVHVlLCA2IEp1biAyMDIzIDEyOjQwOjQ1ICsw
MjAwOgo+IAo+ID4gT24gMDYvMDYvMjAyMyAxMjozNywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90
ZToKPiA+ID4gT24gMDYvMDYvMjAyMyAxMjoyOCwgTWlxdWVsIFJheW5hbCB3cm90ZTogIAo+ID4g
Pj4gSGkgS3J6eXN6dG9mLAo+ID4gPj4KPiA+ID4+IGtyenlzenRvZi5rb3psb3dza2lAbGluYXJv
Lm9yZyB3cm90ZSBvbiBUdWUsIDYgSnVuIDIwMjMgMTA6NDQ6MzQgKzAyMDA6Cj4gPiA+PiAgCj4g
PiA+Pj4gT24gMDYvMDYvMjAyMyAwOTo0OCwgTWlxdWVsIFJheW5hbCB3cm90ZTogIAo+ID4gPj4+
Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgIGl0IChvdGhlcndpc2UgaXQgaXMgaGFybWxlc3Mp
Lgo+ID4gPj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFt
bCMvZGVmaW5pdGlvbnMvZmxhZwo+ID4gPj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZGVwcmVj
YXRlZDogdHJ1ZQo+ID4gPj4+Pj4+Pj4+PiArCj4gPiA+Pj4+Pj4+Pj4+ICvCoMKgwqAgYWRkaXRp
b25hbFByb3BlcnRpZXM6IGZhbHNlICAgICAgCj4gPiA+Pj4+Pj4+Pj4gdW5ldmFsdWF0ZWRQcm9w
ZXJ0aWVzOiBmYWxzZSAgICAgIAo+ID4gPj4+Pj4+Pj4gSXQgd2FzIGhpZGluZyBieSAnIl5uYW5k
QFswLTNdJCI6Jy4gU2hvdWxkIEkgbW92ZSBpdCBoZXJlPyAgICAgIAo+ID4gPj4+Pj4+PiBZb3Ug
Y2Fubm90IGhhdmUgYm90aCBhZGRpdGlvbmFsUHJvcHMgYW5kIHVuZXZhbHVhdGVkUHJvcHMgYXQg
dGhlIHNhbWUKPiA+ID4+Pj4+Pj4gdGltZSwgc28gd2UgZG8gbm90IHRhbGsgYWJvdXQgc2FtZSB0
aGluZyBvciB0aGlzIHdhcyBuZXZlciB3b3JraW5nPyAgICAgIAo+ID4gPj4+Pj4+Cj4gPiA+Pj4+
Pj4gSG1tLCBJJ20gYSBsaXR0bGUgY29uZnVzZWQgdGhlbi4gQXQgdmFyaW91cyB0aW1lcyBJJ3Zl
IGJlZW4gdG9sZCB0byAKPiA+ID4+Pj4+PiBwdXQgJ2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxz
ZScgb3IgJ3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UnIAo+ID4gPj4+Pj4+IChhbHRob3Vn
aCBuZXZlciBhdCB0aGUgc2FtZSB0aW1lKS4gSSdtIG5vdCBzdXJlIHdoZW4gdG8gdXNlIG9uZSBv
ciB0aGUgCj4gPiA+Pj4+Pj4gb3RoZXIuCj4gPiA+Pj4+Pj4KPiA+ID4+Pj4+PiBGcm9tIHdoYXQg
SSd2ZSBiZWVuIGFibGUgdG8gZ2xlYW4gJ2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlJyAKPiA+
ID4+Pj4+PiBpbmRpY2F0ZXMgdGhhdCB0aGUgbm9kZSBpcyBleHBlY3RlZCB0byBoYXZlIGNoaWxk
IG5vZGVzIGRlZmluZWQgaW4gYSAKPiA+ID4+Pj4+PiBkaWZmZXJlbnQgc2NoZW1hIHNvIEkgd291
bGQgaGF2ZSB0aG91Z2h0ICdhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UnIAo+ID4gPj4+Pj4+
IHdvdWxkIGJlIGFwcHJvcHJpYXRlIGZvciBhIHNjaGVtYSBjb3ZlcmluZyBhIGxlYWYgbm9kZS4g
Cj4gPiA+Pj4+Pj4gJ3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UnIHNlZW1zIHRvIGVuYWJs
ZSBzdHJpY3RlciBjaGVja2luZyB3aGljaCAKPiA+ID4+Pj4+PiBtYWtlcyBzZW5zZSB3aGVuIGFs
bCB0aGUgcHJvcGVydGllcyBhcmUgZGVzY3JpYmVkIGluIHRoZSBzY2hlbWEuICAgICAgCj4gPiA+
Pj4+Pgo+ID4gPj4+Pj4gU28gSSB0aGluayB0aGlzIG1pZ2h0IGJlIHRoZSBwcm9ibGVtLiBJZiBJ
IGxvb2sgYXQgcWNvbSxuYW5kYy55YW1sIG9yIAo+ID4gPj4+Pj4gaW5nZW5pYyxuYW5kLnlhbWwg
d2hpY2ggYm90aCBoYXZlIGEgcGFydGl0aW9ucyBwcm9wZXJ0eSBpbiB0aGVpciAKPiA+ID4+Pj4+
IGV4YW1wbGUuIE5laXRoZXIgaGF2ZSAndW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZScgb24g
dGhlIG5hbmRALi4uIAo+ID4gPj4+Pj4gc3Vibm9kZS4gSWYgSSBhZGQgaXQgc3VyZSBlbm91Z2gg
SSBzdGFydCBnZXR0aW5nIGNvbXBsYWludHMgYWJvdXQgdGhlIAo+ID4gPj4+Pj4gJ3BhcnRpdGlv
bnMnIG5vZGUgYmVpbmcgdW5leHBlY3RlZC4gICAgCj4gPiA+Pj4+Cj4gPiA+Pj4+IFNvcnJ5IGlm
IHRoYXQgd2FzIHVuY2xlYXIsIEkgdGhpbmsgdGhlIHdob2xlIGxvZ2ljIGFyb3VuZCB0aGUgeWFt
bAo+ID4gPj4+PiBmaWxlcyBpcyB0byBwcm9ncmVzc2l2ZWx5IGNvbnN0cmFpbiB0aGUgZGVzY3Jp
cHRpb25zLCBzY2hlbWEgYWZ0ZXIKPiA+ID4+Pj4gc2NoZW1hLiBJT1csIGluIHRoZSBtYXJ2ZWxs
IGJpbmRpbmcgeW91IHNob3VsZCBzZXQKPiA+ID4+Pj4gdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBm
YWxzZSBmb3IgdGhlIE5BTkQgY29udHJvbGxlci4gV2hhdCBpcyBpbnNpZGUKPiA+ID4+Pj4gKE5B
TkQgY2hpcHMsIHBhcnRpdGlvbiBjb250YWluZXIsIHBhcnRpdGlvbiBwYXJzZXJzLCAibXRkIiBw
cm9wZXJ0aWVzLAo+ID4gPj4+PiBldGMpIHdpbGwgYmUgaGFuZGxlZCBieSBvdGhlciBmaWxlcy4g
T2YgY291cnNlIHlvdSBjYW4gY29uc3RyYWluIGEgYml0Cj4gPiA+Pj4+IHdoYXQgY2FuL2Nhbm5v
dCBiZSB1c2VkIGluc2lkZSB0aGVzZSBzdWJub2RlcywgYnV0IEkgdGhpbmsgeW91IGRvbid0Cj4g
PiA+Pj4+IG5lZWQgdG8gc2V0IHVuZXZhbHVhdGVkUHJvcGVydGllcyBpbiB0aGVzZSBzdWJub2Rl
cyAodGhlIE5BTkQgY2hpcCBpbgo+ID4gPj4+PiB0aGlzIGNhc2UsIG9yIGV2ZW4gdGhlIHBhcnRp
dGlvbnMpIGJlY2F1c2UgeW91IGFscmVhZHkgcmVmZXJlbmNlCj4gPiA+Pj4+IG5hbmQtY29udHJv
bGxlci55YW1sIHdoaWNoIHJlZmVyZW5jZXMgbmFuZC1jaGlwLnlhbWwsIG10ZC55YW1sLAo+ID4g
Pj4+PiBwYXJ0aXRpb25zLnlhbWwsIGV0Yy4gKnRoZXkqIHdpbGwgbWFrZSB0aGUgZ2VuZXJpYyBj
aGVja3MgYW5kIGhvcGVmdWxseQo+ID4gPj4+PiBhcHBseSBzdHJpY3RlciBjaGVja3MsIHdoZW4g
ZGVlbWVkIHJlbGV2YW50LiAgICAKPiA+ID4+Pgo+ID4gPj4+IE5vLCBuZWl0aGVyIG5hbmQtY29u
dHJvbGxlci55YW1sIG5vciBuYW5kLWNoaXAueWFtbCBsaW1pdCB0aGUgcHJvcGVydGllcwo+ID4g
Pj4+IGluIHRoaXMgY29udGV4dCwgc28gZWFjaCBkZXZpY2Ugc2NoZW1hIG11c3QgaGF2ZSB1bmV2
YWx1YXRlZFByb3BlcnRpZXM6Cj4gPiA+Pj4gZmFsc2UsIGZvciB3aGljaCBJIGFza2VkIGZldyBl
bWFpbHMgYWdvLiAgCj4gPiA+Pgo+ID4gPj4gVGhlIGNvbnRyb2xsZXIgZGVzY3JpcHRpb24gc2hh
bGwgYmUgZ3VhcmRlZCBieSB1bmV2YWx1YXRlZFByb3BlcnRpZXM6Cj4gPiA+PiBmYWxzZSwgd2Ug
YWdyZWUuIERvIHlvdSBtZWFuIHRoZSBuYW5kIGNoaXAgZGVzY3JpcHRpb24gaW4gZWFjaCBuYW5k
Cj4gPiA+PiBjb250cm9sbGVyIGJpbmRpbmcgc2hvdWxkIGFsc28gaW5jbHVkZSBpdCBhdCBpdHMg
b3duIGxldmVsPyBCZWNhdXNlCj4gPiA+PiB0aGF0IGlzIG5vdCB3aGF0IHdlIGVuZm9yY2VkIHNv
IGZhciBJSVJDLiBJIGFtIHRvdGFsbHkgZmluZSBkb2luZyBzbwo+ID4gPj4gc3RhcnRpbmcgZnJv
bSBub3cgb24gaWYgdGhpcyBpcyBhIG5ldyByZXF1aXJlbWVudCAod2hpY2ggbWFrZXMgc2Vuc2Up
Lgo+ID4gPj4KPiA+ID4+IElmIHllcywgdGhlbiBpdCBtZWFucyB3ZSB3b3VsZCBuZWVkIHRvIGxp
c3QgKmFsbCogdGhlIG5hbmQKPiA+ID4+IGNoaXAgcHJvcGVydGllcyBpbiBlYWNoIHNjaGVtYSwg
d2hpY2ggY2xlYXJseSBpbnZvbHZlcyBhIGxvdCBvZgo+ID4gPj4gZHVwbGljYXRpb24gYXMgeW91
IHdvdWxkIG5lZWQgdG8gZGVmaW5lIGFsbCB0eXBlcyBvZiBwYXJ0aXRpb25zLAo+ID4gPj4gcGFy
dGl0aW9uIHBhcnNlcnMsIGdlbmVyaWMgcHJvcGVydGllcywgZXRjIGluIG9yZGVyIGZvciB0aGUg
ZXhhbXBsZXMgdG8KPiA+ID4+IHBhc3MgYWxsIHRoZSBjaGVja3MuIE9ubHkgdGhlIHByb3BlcnRp
ZXMgbGlrZSBwaW5jdHJsLSogd291bGQgbm90IG5lZWQKPiA+ID4+IHRvIGJlIGxpc3RlZCBJIGd1
ZXNzLiAgCj4gPiA+IAo+ID4gPiBZZXMsIHRoaXMgaXMgd2hhdCBzaG91bGQgYmUgZG9uZS4gRWFj
aCBub2RlIHNob3VsZCBoYXZlIGVpdGhlciAgCj4gPiAKPiA+IEVoLCBubywgSSByZXNwb25kZWQg
aW4gd3JvbmcgcGFydCBvZiBtZXNzYWdlLiBNeSB5ZXMgd2FzIGZvcjoKPiA+IAo+ID4gIiBEbyB5
b3UgbWVhbiB0aGUgbmFuZCBjaGlwIGRlc2NyaXB0aW9uIGluIGVhY2ggbmFuZAo+ID4gY29udHJv
bGxlciBiaW5kaW5nIHNob3VsZCBhbHNvIGluY2x1ZGUgaXQgYXQgaXRzIG93biBsZXZlbD8iCj4g
Cj4gQ2xlYXIuCj4gCj4gPiAKPiA+IE5vdyBmb3IgYWN0dWFsIHBhcmFncmFwaDoKPiA+IAo+ID4g
IklmIHllcywgdGhlbiBpdCBtZWFucyB3ZSB3b3VsZCBuZWVkIHRvIGxpc3QgKmFsbCogdGhlIG5h
bmQgY2hpcAo+ID4gcHJvcGVydGllcyBpbiBlYWNoIHNjaGVtYSwiCj4gPiAKPiA+IE5vLCB3aHk/
IEkgZG9uJ3QgdW5kZXJzdGFuZC4gVXNlIHRoZSBzYW1lIHBhdHRlcm4gYXMgYWxsIG90aGVyIGJp
bmRpbmdzLAo+ID4gdGhpcyBpcyBub3Qgc3BlY2lhbC4gQWJzb2x1dGVseSBhbGwgaGF2ZSB0aGUg
c2FtZSBiZWhhdmlvciwgZS5nLgo+ID4gbWVudGlvbmVkIGxlZHMuIFlvdSBmaW5pc2ggd2l0aCB1
bmV2YWx1YXRlZFByb3BzIGFuZCB5b3UncmUgZG9uZSwgd2hpY2gKPiA+IGlzIHdoYXQgSSB3cm90
ZSBoZXJlIGxvbmcsIGxvbmcgdGltZSBhZ28uCj4gCj4gTWF5YmUgYmVjYXVzZSBzbyBmYXIgd2Ug
ZGlkIG5vdCBib3RoZXIgcmVmZXJlbmNpbmcgYW5vdGhlciBzY2hlbWEgaW4KPiB0aGUgTkFORCBj
aGlwIG5vZGVzPyBGb3IgeW91ciBoaW50IHRvIHdvcmsgSSBndWVzcyB3ZSBzaG91bGQgaGF2ZSwg
aW4KPiBlYWNoIGNvbnRyb2xsZXIgYmluZGluZywgc29tZXRoaW5nIGFsb25nOgo+IAo+ICBwYXR0
ZXJuUHJvcGVydGllczoKPiAgICAiXm5hbmRAW2EtZjAtOV0kIjoKPiAgICAgIHR5cGU6IG9iamVj
dAo+ICsgICAgJHJlZjogbmFuZC1jaGlwLnlhbWwjCj4gICAgICBwcm9wZXJ0aWVzOgo+IAo+IElm
IHllcywgcGxlYXNlIGlnbm9yZSB0aGUgc2VyaWVzIHNlbnQgYXNpZGUsIEkgd2lsbCB3b3JrIG9u
IGl0IGFnYWluCj4gYW5kIHNlbmQgYSB2Mi4KCkFjdHVhbGx5IEkgYWxyZWFkeSBzZWUgYSBwcm9i
bGVtLCBsZXQncyB0aGUgaW5nZW5pYyxuYW5kLnlhbWwgZXhhbXBsZS4KVGhlIGdvYWwsIElJVUMs
IGlzIHRvIGRvOgoKIHBhdHRlcm5Qcm9wZXJ0aWVzOgogICAiXm5hbmRAW2EtZjAtOV0kIjoKICAg
ICB0eXBlOiBvYmplY3QKKyAgICAkcmVmOiBuYW5kLWNoaXAueWFtbAogICAgIHByb3BlcnRpZXM6
CgogICAgICAgLi4uCgorICAgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKClRoZSBleGFt
cGxlIGluIHRoaXMgZmlsZSB1c2VzIGEgcHJvcGVydHksIG5hbmQtb24tZmxhc2gtYmJ0LCB3aGlj
aCBpcwpkZXNjcmliZWQgaW5zaWRlIG5hbmQtY29udHJvbGxlci55YW1sIGluc3RlYWQgb2YgbmFu
ZC1jaGlwLnlhbWwuCkluZGVlZCwgdGhlIGZvcm1lciBhY3R1YWxseSBkZXNjcmliZXMgbWFueSBw
cm9wZXJ0aWVzIHdoaWNoIGFyZSBhIGJpdAptb3JlIGNvbnRyb2xsZXIgcmVsYXRlZCB0aGFuIGNo
aXAgcmVsYXRlZC4gV2l0aCB0aGUgYWJvdmUgZGVzY3JpcHRpb24sCnRoZSBleGFtcGxlIGZhaWxz
IGJlY2F1c2UgbmFuZC1vbi1mbGFzaC1iYnQgaXMgbm90IGFsbG93ZWQgKGl0IGlzIG5vdApsaXN0
ZWQgaW4gbmFuZC1jaGlwLnlhbWwpLgoKSG93IHdvdWxkIHlvdSBwcm9jZWVkIGluIHRoaXMgY2Fz
ZT8KCk1heWJlIEkgY291bGQgbW92ZSBhbGwgdGhlIE5BTkQgY2hpcCBwcm9wZXJ0aWVzIHdoaWNo
IGFyZSBzb21laG93CnJlbGF0ZWQgdG8gTkFORCBjb250cm9sbGVycyAoYW5kIGRlZmluZWQgaW4g
bmFuZC1jb250cm9sbGVyLnlhbWwpIGluIGEKZGVkaWNhdGVkIGZpbGUgYW5kIHJlZmVyZW5jZSBp
dCBmcm9tIG5hbmQtY2hpcC55YW1sPyBBbnkgb3RoZXIgaWRlYSBpcwp3ZWxjb21lLgoKVGhhbmtz
LCBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
