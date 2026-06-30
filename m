Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A376AC43458
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2026 21:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5GBJyD/W9EYbTzq4Z+B+4Ju+T1TDHssdiSY/i6XWOfQ=; b=rVeG/hyG2KQSdB
	tuN9AEfgMeyDwJxl/f2La3Q8WXNFd/uR//4oWZwNAGHa7R/Zer5TL/sqLT+XFftshGgzEgR3F+vSE
	sLuyL7S4WvBzAadniyw3kHhyPzw05WWTSKMKSbX3hbNXJG6W8ecwb3L7TP5wV6uaZ3Y86o1pt6T9y
	gzbF3SgpkI1NbMfadER+GMPuEM27IgAHwl+h1CwMpbAVkl0dZRjAlzwu7NA0cjzOBsj9of5RHjOYl
	+zOFXAK0DGlnwo+9R2VMS4jD+kU1M8R/J1uctwn8s6YG9lGQjSvAXFGVbkh5fjfK0nGBzrqXZXuEc
	GCWmQpQlpebA84yCrCdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefep-00000000Df3-3Skp;
	Tue, 30 Jun 2026 21:06:15 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefem-00000000Ddz-1HdI
	for linux-mtd@lists.infradead.org;
	Tue, 30 Jun 2026 21:06:14 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 1A3392C028E;
	Wed,  1 Jul 2026 09:05:54 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1782853554;
	bh=+w+atqLDd2XGA2kMrAFgsOOGy9YXFU8CLwGFHaSLfhg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=bmhN9aW2jELx46MO+Z+UXCK9vrpmTgeRY+1LDtl154F1aPlIpqPgGpGMGEYTQQGDu
	 Un5ppays1FaAx+JrhtDVnn5GH7y0xCdu3jPolDjGiuwSe+923Gdk/e8asSmLmH68NJ
	 S9/kLoGXG5Sd2B42AnylT6V/xrb8K/LP1Xyw7RMLwM2i4XYSE7eWJm5lUxR5SbVSW8
	 1OeAW5FDLTIN2L70WlUZhKeazPLeAJ6Ok+pUcsSPBlVllPtPB5JScrE3Uk3aM45xCS
	 0xuirkQDKyKi06CltxM49sHKM94EFnPREAZcKOFzH3meE3A7YddoUgJ156wun0m2vq
	 wZ0266XOuPOQw==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6a442fb20000>; Wed, 01 Jul 2026 09:05:54 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.39; Wed, 1 Jul 2026 09:05:53 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1748.039; Wed, 1 Jul 2026 09:05:53 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "Takahiro.Kuwano@infineon.com" <Takahiro.Kuwano@infineon.com>, "Ronan
 Dalton" <Ronan.Dalton@alliedtelesis.co.nz>, "pratyush@kernel.org"
	<pratyush@kernel.org>, "mwalle@kernel.org" <mwalle@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
	<richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>, Aryan Srivastava
	<Aryan.Srivastava@alliedtelesis.co.nz>
Subject: Re: [PATCH v2 1/3] Revert "mtd: spi-nor: remove Fujitsu MB85RS1MT
 support"
Thread-Topic: [PATCH v2 1/3] Revert "mtd: spi-nor: remove Fujitsu MB85RS1MT
 support"
Thread-Index: AQHdBRJ8+HvBPYSwmEi4Lf0sk+8LHLZV9jcAgADe8oA=
Date: Tue, 30 Jun 2026 21:05:53 +0000
Message-ID: <4efb1cf9-dfd7-432f-b95e-3075507a8eb0@alliedtelesis.co.nz>
References: <20260626022108.1963271-2-ronan.dalton@alliedtelesis.co.nz>
 <858120735ba04d77a422adbc37135ecd@infineon.com>
In-Reply-To: <858120735ba04d77a422adbc37135ecd@infineon.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.12]
Content-ID: <FDB09F0212057E44A45E98856054C638@alliedtelesis.co.nz>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=TI3mSEla c=1 sm=1 tr=0 ts=6a442fb2 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=drD7vYo3kbIA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=bUQKSiCPAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=P-IC7800AAAA:8 a=sozttTNsAAAA:8 a=F4-4EvBBO8da-XUOJC0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=-fHZXUhsFbuwFN3fwQAr:22 a=1CNFftbPRP8L7MoqJWF3:22 a=d3PnA9EDa4IxuAV0gXij:22
X-SEG-SpamProfiler-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_140612_849708_753DFA90 
X-CRM114-Status: GOOD (  22.23  )
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

SGkgVGFrYWhpcm8sDQoNCk9uIDMwLzA2LzIwMjYgMTk6NDcsIFRha2FoaXJvLkt1d2Fub0BpbmZp
bmVvbi5jb20gd3JvdGU6DQo+IEhpLA0KPg0KPj4gVGhpcyByZXZlcnRzIGNvbW1pdCBkOWNkNWM5
YTZmZTI2ZDU0NDU1MWNmYWE5NGZiMGFiYzUwYzBiODk1Lg0KPj4NCj4+IFRoZSBjb21taXQgdGhh
dCByZW1vdmVkIHN1cHBvcnQgZm9yIHRoaXMgY2hpcCBjbGFpbWVkIHRoYXQgdGhlIGF0MjUNCj4+
IGRyaXZlciB3YXMgdGhlIGNvcnJlY3QgZHJpdmVyIHRvIHVzZSBmb3IgdGhpcyBjaGlwLiBIb3dl
dmVyLCB0aGUgYXQyNQ0KPj4gZHJpdmVyIGV4cG9zZXMgdGhlIGNoaXAgYXMgYW4gTlZNRU0gZGV2
aWNlLCBub3QgYSBNVEQgZGV2aWNlLCBzbyBpdCdzDQo+PiBub3QgYSBzdWl0YWJsZSByZXBsYWNl
bWVudCBmb3IgdXNlcnMgdGhhdCB3YW50IHRvIG1vdW50IGEgZmlsZSBzeXN0ZW0NCj4+IG92ZXIg
dGhlIGNoaXAuDQo+Pg0KPiBXaGF0IGZpbGUgc3lzdGVtIGRvIHlvdSB1c2U/DQo+IFRoZSBzaXpl
IG9mIEZSQU0gY2hpcHMgKGh1bmRyZWRzIG9mIEtCKSBzb3VuZHMgdG9vIHNtYWxsIGZvciBmaWxl
DQo+IHN5c3RlbXMuDQoNCldlJ3JlIHVzaW5nIGV4dDIuIFRlY2huaWNhbGx5IHdlIHdhbnQgdGhp
cyBmb3IgdGhlIE1CODVSUzRNVCB3aGljaCBpcyANCmFkZGVkIGluIHBhdGNoIDMgb2YgdGhpcyBz
ZXJpZXMuDQoNClRoZSB1c2UgaXMgZm9yIGEgc21hbGwgYW1vdW50IG9mIGFkZGl0aW9uYWwgc3Rv
cmFnZSBzZXBhcmF0ZSB0byB0aGUgbWFpbiANCnN5c3RlbSBOQU5EIGZsYXNoIGZvciBzb21lIHNt
YWxsICJjcml0aWNhbCIgZmlsZXMgdGhhdCB3ZSBkb24ndCB3YW50IHRvIA0KbG9zZS7CoFdlJ3Zl
IGJlZW4gdXNpbmcgZGV2aWNlcyBsaWtlIHRoZSBtY2hwMjNsY3YxMDI0IGFuZCBtcjI1aDQwIG9u
IA0Kb3RoZXIgcHJvZHVjdHMgZm9yIHNvbWUgdGltZS4NCg0KPj4gUmV2ZXJ0IHRoZSBjaGFuZ2Ug
dGhhdCByZW1vdmVkIHN1cHBvcnQgZm9yIHRoZSBNQjg1UlMxTVQgRlJBTSBjaGlwLg0KPj4NCj4+
IFNpZ25lZC1vZmYtYnk6IFJvbmFuIERhbHRvbiA8cm9uYW4uZGFsdG9uQGFsbGllZHRlbGVzaXMu
Y28ubno+DQo+PiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPj4gQ2M6IGxpbnV4
LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+PiBDYzogUHJhdHl1c2ggWWFkYXYgPHByYXR5dXNo
QGtlcm5lbC5vcmc+DQo+PiBDYzogTWljaGFlbCBXYWxsZSA8bXdhbGxlQGtlcm5lbC5vcmc+DQo+
PiBDYzogVGFrYWhpcm8gS3V3YW5vIDx0YWthaGlyby5rdXdhbm9AaW5maW5lb24uY29tPg0KPj4g
Q2M6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+DQo+PiBDYzogUmlj
aGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4NCj4+IENjOiBWaWduZXNoIFJhZ2hhdmVu
ZHJhIDx2aWduZXNockB0aS5jb20+DQo+PiBDYzogQ2hyaXMgUGFja2hhbSA8Y2hyaXMucGFja2hh
bUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0KPj4gQ2M6IEFyeWFuIFNyaXZhc3RhdmEgPGFyeWFuLnNy
aXZhc3RhdmFAYWxsaWVkdGVsZXNpcy5jby5uej4NCj4+IC0tLQ0KPj4gQ2hhbmdlcyBpbiB2MjoN
Cj4+IC0gTm8gY2hhbmdlcw0KPj4NCj4+ICAgZHJpdmVycy9tdGQvc3BpLW5vci9NYWtlZmlsZSAg
fCAgMSArDQo+PiAgIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jICAgIHwgIDEgKw0KPj4gICBk
cml2ZXJzL210ZC9zcGktbm9yL2NvcmUuaCAgICB8ICAxICsNCj4+ICAgZHJpdmVycy9tdGQvc3Bp
LW5vci9mdWppdHN1LmMgfCAyMSArKysrKysrKysrKysrKysrKysrKysNCj4+ICAgNCBmaWxlcyBj
aGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspDQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L210ZC9zcGktbm9yL2Z1aml0c3UuYw0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9z
cGktbm9yL01ha2VmaWxlIGIvZHJpdmVycy9tdGQvc3BpLW5vci9NYWtlZmlsZQ0KPj4gaW5kZXgg
NWRkOWMzNWY2YjZmLi45MjE2YTVhMjlhMmIgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL210ZC9z
cGktbm9yL01ha2VmaWxlDQo+PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL01ha2VmaWxlDQo+
PiBAQCAtNSw2ICs1LDcgQEAgc3BpLW5vci1vYmpzICAgICAgICAgICAgICAgICAgICArPSBhdG1l
bC5vDQo+PiAgIHNwaS1ub3Itb2JqcyAgICAgICAgICAgICAgICAgICArPSBlb24ubw0KPj4gICBz
cGktbm9yLW9ianMgICAgICAgICAgICAgICAgICAgKz0gZXNtdC5vDQo+PiAgIHNwaS1ub3Itb2Jq
cyAgICAgICAgICAgICAgICAgICArPSBldmVyc3Bpbi5vDQo+PiArc3BpLW5vci1vYmpzICAgICAg
ICAgICAgICAgICAgICs9IGZ1aml0c3Uubw0KPj4gICBzcGktbm9yLW9ianMgICAgICAgICAgICAg
ICAgICAgKz0gZ2lnYWRldmljZS5vDQo+PiAgIHNwaS1ub3Itb2JqcyAgICAgICAgICAgICAgICAg
ICArPSBpbnRlbC5vDQo+PiAgIHNwaS1ub3Itb2JqcyAgICAgICAgICAgICAgICAgICArPSBpc3Np
Lm8NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyBiL2RyaXZlcnMv
bXRkL3NwaS1ub3IvY29yZS5jDQo+PiBpbmRleCBjY2Y0Mzk2Y2RjZDAuLmQ1ZWJiZmQzZmE3ZiAx
MDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jDQo+PiArKysgYi9kcml2
ZXJzL210ZC9zcGktbm9yL2NvcmUuYw0KPj4gQEAgLTIwMDksNiArMjAwOSw3IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgc3BpX25vcl9tYW51ZmFjdHVyZXIgKm1hbnVmYWN0dXJlcnNbXSA9IHsNCj4+
ICAgICAgICAgICZzcGlfbm9yX2VvbiwNCj4+ICAgICAgICAgICZzcGlfbm9yX2VzbXQsDQo+PiAg
ICAgICAgICAmc3BpX25vcl9ldmVyc3BpbiwNCj4+ICsgICAgICAgJnNwaV9ub3JfZnVqaXRzdSwN
Cj4+ICAgICAgICAgICZzcGlfbm9yX2dpZ2FkZXZpY2UsDQo+PiAgICAgICAgICAmc3BpX25vcl9p
bnRlbCwNCj4+ICAgICAgICAgICZzcGlfbm9yX2lzc2ksDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvc3BpLW5vci9jb3JlLmggYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuaA0KPj4gaW5k
ZXggYmEyZDFhODYyYzlkLi5hNGQ5MDZlNmQwN2QgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL210
ZC9zcGktbm9yL2NvcmUuaA0KPj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmgNCj4+
IEBAIC02MDYsNiArNjA2LDcgQEAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBzcGlfbm9yX21hbnVmYWN0
dXJlciBzcGlfbm9yX2F0bWVsOw0KPj4gICBleHRlcm4gY29uc3Qgc3RydWN0IHNwaV9ub3JfbWFu
dWZhY3R1cmVyIHNwaV9ub3JfZW9uOw0KPj4gICBleHRlcm4gY29uc3Qgc3RydWN0IHNwaV9ub3Jf
bWFudWZhY3R1cmVyIHNwaV9ub3JfZXNtdDsNCj4+ICAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBzcGlf
bm9yX21hbnVmYWN0dXJlciBzcGlfbm9yX2V2ZXJzcGluOw0KPj4gK2V4dGVybiBjb25zdCBzdHJ1
Y3Qgc3BpX25vcl9tYW51ZmFjdHVyZXIgc3BpX25vcl9mdWppdHN1Ow0KPj4gICBleHRlcm4gY29u
c3Qgc3RydWN0IHNwaV9ub3JfbWFudWZhY3R1cmVyIHNwaV9ub3JfZ2lnYWRldmljZTsNCj4+ICAg
ZXh0ZXJuIGNvbnN0IHN0cnVjdCBzcGlfbm9yX21hbnVmYWN0dXJlciBzcGlfbm9yX2ludGVsOw0K
Pj4gICBleHRlcm4gY29uc3Qgc3RydWN0IHNwaV9ub3JfbWFudWZhY3R1cmVyIHNwaV9ub3JfaXNz
aTsNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2Z1aml0c3UuYyBiL2RyaXZl
cnMvbXRkL3NwaS1ub3IvZnVqaXRzdS5jDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5k
ZXggMDAwMDAwMDAwMDAwLi42OWNmZmM1YzczZWYNCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBi
L2RyaXZlcnMvbXRkL3NwaS1ub3IvZnVqaXRzdS5jDQo+PiBAQCAtMCwwICsxLDIxIEBADQo+PiAr
Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4+ICsvKg0KPj4gKyAqIENvcHly
aWdodCAoQykgMjAwNSwgSW50ZWMgQXV0b21hdGlvbiBJbmMuDQo+PiArICogQ29weXJpZ2h0IChD
KSAyMDE0LCBGcmVlc2NhbGUgU2VtaWNvbmR1Y3RvciwgSW5jLg0KPj4gKyAqLw0KPj4gKw0KPj4g
KyNpbmNsdWRlIDxsaW51eC9tdGQvc3BpLW5vci5oPg0KPj4gKw0KPj4gKyNpbmNsdWRlICJjb3Jl
LmgiDQo+PiArDQo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIGZ1aml0c3Vfbm9y
X3BhcnRzW10gPSB7DQo+PiArICAgICAgIC8qIEZ1aml0c3UgKi8NCj4+ICsgICAgICAgeyAibWI4
NXJzMW10IiwgSU5GTygweDA0N2YyNywgMCwgMTI4ICogMTAyNCwgMSkNCj4+ICsgICAgICAgICAg
ICAgICBGTEFHUyhTUElfTk9SX05PX0VSQVNFKSB9LA0KPj4gK307DQo+PiArDQo+PiArY29uc3Qg
c3RydWN0IHNwaV9ub3JfbWFudWZhY3R1cmVyIHNwaV9ub3JfZnVqaXRzdSA9IHsNCj4+ICsgICAg
ICAgLm5hbWUgPSAiZnVqaXRzdSIsDQo+PiArICAgICAgIC5wYXJ0cyA9IGZ1aml0c3Vfbm9yX3Bh
cnRzLA0KPj4gKyAgICAgICAubnBhcnRzID0gQVJSQVlfU0laRShmdWppdHN1X25vcl9wYXJ0cyks
DQo+PiArfTsNCj4+IC0tDQo+PiAyLjU0LjANCj4gVGhhbmtzLA0KPiBUYWthaGlybw0KPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
