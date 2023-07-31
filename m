Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FD4C04A94
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jul 2023 08:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eB3LxN6C+WOB1ngYmbuLWoOJMuUVT6sRvyKAumJZXE8=; b=E98X5ZDBCMz7hE
	1RYP+59ivC2Ss2e7c+S5DE7qYRogjAFAZCJcaAdQN9w3q5VKd0su4z0kNcTZIRRa0xupaNkbyysjq
	OAXnSrmH0+eWwWcaNCPPOTcEynqSksyF2I555m7jWqmWETmXadM0UnHTM5o5BrA5HxHbSAj3c1suv
	wAaNJh6vmOXLvt3kfXzOopcGpiavKxFiVZzbG3K1SuFnnTBXfPsaVn8gccqkOtRLaZlJBE/bhXffr
	sKsPmnLb+ecVu2wZtWDKspXFOZMaJ0zk8Y8UR9qpZNQ8kxl4ERQ4g8m4vehN1sKMNn/lMg+W240Dm
	blIrDALz7Vr41MxcsT9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOgE-00EbZU-2y;
	Mon, 31 Jul 2023 08:55:06 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOgB-00EbUm-1f
	for linux-mtd@lists.infradead.org;
	Mon, 31 Jul 2023 08:55:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11E9F20003;
	Mon, 31 Jul 2023 08:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690793697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CUZuAnhwyifP9OIKhxJHokYdEfjBVnqpW4EGj6nTjI0=;
	b=KeU+02mFDmOu69zAs8VM7rWJJvy3ttENMCtfkrGBlRXyh1h9Z83GMXWbWOb/SENvtxoWDp
	E+SzdvGyX8BtYxMQ7h40IbgL6rUrMcCo4kFNxPgKA0NXAiFkPt87gDFlgRdmK7gqGNw4fu
	2Km6lkw2KDax9dom70V2UeLk8aA0H+17C4dBHZhF6oCPTYaHmt3lQtxf0sZP7zJ15EXFuY
	MRNsEM0QhtKEvgFBZ9qgIieXC+Z14wzx3A7VPED5+D6rXtXp+74WEOhPDMNIvQhkjhLdS2
	1RZrkZxjpLl5XWfJzktvR97jBZifHw4wxOcwY2nADPbpSNUMfwhKB640zIAWRw==
Date: Mon, 31 Jul 2023 10:54:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, "Michael Walle" <michael@walle.cc>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Winkler,
 Tomas" <tomas.winkler@intel.com>, Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
Subject: Re: [PATCH] mtd: Fix refcounting with MTD_PARTITIONED_MASTER
Message-ID: <20230731105450.61aef898@xps-13>
In-Reply-To: <CY5PR11MB6366441D6777C577032AE77FED05A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20230731082029.762385-1-miquel.raynal@bootlin.com>
	<CY5PR11MB6366441D6777C577032AE77FED05A@CY5PR11MB6366.namprd11.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_015503_989534_E838E36A 
X-CRM114-Status: GOOD (  27.48  )
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

SGkgQWxleGFuZGVyLAoKYWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29tIHdyb3RlIG9uIE1vbiwg
MzEgSnVsIDIwMjMgMDg6Mjc6NDQgKzAwMDA6Cgo+ID4gCj4gPiBUaGUgbG9naWMgaXMgd2F5IHRv
byBjb252b2x1dGVkLCBsZXQncyBjbGVhbiB0aGUga3JlZl9nZXQvcHV0IHNlY3Rpb24gdG8KPiA+
IGNsYXJpZnkgd2hhdCB0aGlzIGJsb2NrIGRvZXMsIGhvcGVmdWxseSBzb2x2aW5nIHRoZSByZWZj
b3VudGluZyBpc3N1ZQo+ID4gd2hlbiB1c2luZyBDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RF
UiBhdCB0aGUgc2FtZSB0aW1lOgo+ID4gLSBJdGVyYXRlIHRocm91Z2ggYWxsIHRoZSBwYXJlbnQg
bXRkIGRldmljZXMKPiA+IC0gR3JhYiBhIHJlZmVyZW5jZSBvdmVyIHRoZW0gYWxsIGJ1dCB0aGUg
bWFzdGVyCj4gPiAtIE9ubHkgZ3JhYiB0aGUgbWFzdGVyIHdoaXRoIENPTkZJR19NVERfUEFSVElU
SU9ORURfTUFTVEVSCj4gPiBTYW1lIGxvZ2ljIG11c3QgYXBwbHkgaW4gdGhlIHB1dCBwYXRoLCBv
dGhlcndpc2UgaXQgd291bGQgYmUgYnJva2VuLgo+ID4gCj4gPiBDYzogVG9tYXMgV2lua2xlciA8
dG9tYXMud2lua2xlckBpbnRlbC5jb20+Cj4gPiBDYzogQWxleGFuZGVyIFVzeXNraW4gPGFsZXhh
bmRlci51c3lza2luQGludGVsLmNvbT4KPiA+IENjOiBaaGFuZyBYaWFveHUgPHpoYW5neGlhb3h1
NUBodWF3ZWkuY29tPgo+ID4gRml4ZXM6IDE5YmZhOWViZWJiNSAoIm10ZDogdXNlIHJlZmNvdW50
IHRvIHByZXZlbnQgY29ycnVwdGlvbiIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4gCj4gPiAtLS0KPiA+IAo+ID4gSGVsbG8s
Cj4gPiAKPiA+IEFsZXhhbmRlciwgWmhhbmcsIHBsZWFzZSB0ZXN0IHRoaXMgdmVyc2lvbiwgaXQg
aXMgY2xvc2UgdG8gd2hhdCBaaGFuZwo+ID4gcHJvZHVjZWQgd2hpbGUgbm90IHN0cmljdGx5IGlk
ZW50aWNhbC4gVGhpcyBjb21waWxlLXRlc3RlZCBvbmx5LCBwbGVhc2UKPiA+IGNoZWNrIG9uIHlv
dSBzaWRlIHdoZXRoZXIgaXQgZml4ZXMgdGhlIHJlZmNvdW50aW5nIGlzc3VlIHdpdGggYW5kCj4g
PiB3aXRob3V0IFBBUlRJVElPTkVEX01BU1RFUiwgYXMgd2VsbCBhcyB3aXRoIEthc2FuLgo+ID4g
Cj4gPiBBbGV4YW5kZXIsIG1heWJlIHRoZXJlIGlzIHNvbWV0aGluZyBlbHNlIHRvIGZpeCwgaW4g
YWxsIGNhc2VzIHRoZSBsb2dpYwo+ID4gaGVyZSB3YXMgYnJva2VuIHNvIGxldCdzIHN0YXJ0IGJ5
IHRoaXMgb25lIGFuZCBzZWUgaWYgd2UgbmVlZCBzb21ldGhpbmcKPiA+IGVsc2Ugb24gdG9wLgo+
ID4gCj4gPiBUaGFua3MsCj4gPiBNaXF1w6hsCj4gPiAtLS0KPiA+ICBkcml2ZXJzL210ZC9tdGRj
b3JlLmMgfCAyMCArKysrKysrKysrLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL210ZGNvcmUuYyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+ID4gaW5kZXggMjQ2NmVh
NDY2NDY2Li45YjkwZTFiZTQzZTcgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9tdGRjb3Jl
LmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+ID4gQEAgLTEyNDEsMTQgKzEyNDEs
MTUgQEAgaW50IF9fZ2V0X210ZF9kZXZpY2Uoc3RydWN0IG10ZF9pbmZvICptdGQpCj4gPiAgCQly
ZXR1cm4gLUVOT0RFVjsKPiA+ICAJfQo+ID4gCj4gPiAtCWtyZWZfZ2V0KCZtdGQtPnJlZmNudCk7
Cj4gPiAtCj4gPiAtCXdoaWxlIChtdGQtPnBhcmVudCkgewo+ID4gLQkJaWYgKElTX0VOQUJMRUQo
Q09ORklHX01URF9QQVJUSVRJT05FRF9NQVNURVIpIHx8Cj4gPiBtdGQtPnBhcmVudCAhPSBtYXN0
ZXIpCj4gPiAtCQkJa3JlZl9nZXQoJm10ZC0+cGFyZW50LT5yZWZjbnQpOwo+ID4gKwl3aGlsZSAo
bXRkKSB7Cj4gPiArCQlpZiAobXRkICE9IG1hc3RlcikKPiA+ICsJCQlrcmVmX2dldCgmbXRkLT5y
ZWZjbnQpOwo+ID4gIAkJbXRkID0gbXRkLT5wYXJlbnQ7Cj4gPiAgCX0KPiA+IAo+ID4gKwlpZiAo
SVNfRU5BQkxFRChDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUikpCj4gPiArCQlrcmVmX2dl
dCgmbWFzdGVyLT5yZWZjbnQpOwo+ID4gKwo+ID4gIAlyZXR1cm4gMDsKPiA+ICB9Cj4gPiAgRVhQ
T1JUX1NZTUJPTF9HUEwoX19nZXRfbXRkX2RldmljZSk7Cj4gPiBAQCAtMTMzMiwxMSArMTMzMywx
MCBAQCB2b2lkIF9fcHV0X210ZF9kZXZpY2Uoc3RydWN0IG10ZF9pbmZvICptdGQpCj4gPiAgewo+
ID4gIAlzdHJ1Y3QgbXRkX2luZm8gKm1hc3RlciA9IG10ZF9nZXRfbWFzdGVyKG10ZCk7Cj4gPiAK
PiA+IC0Jd2hpbGUgKG10ZCAhPSBtYXN0ZXIpIHsKPiA+IC0JCXN0cnVjdCBtdGRfaW5mbyAqcGFy
ZW50ID0gbXRkLT5wYXJlbnQ7Cj4gPiAtCj4gPiAtCQlrcmVmX3B1dCgmbXRkLT5yZWZjbnQsIG10
ZF9kZXZpY2VfcmVsZWFzZSk7Cj4gPiAtCQltdGQgPSBwYXJlbnQ7Cj4gPiArCXdoaWxlIChtdGQp
IHsKPiA+ICsJCWlmIChtdGQgIT0gbWFzdGVyKQo+ID4gKwkJCWtyZWZfcHV0KCZtdGQtPnJlZmNu
dCwgbXRkX2RldmljZV9yZWxlYXNlKTsgIAo+IGtyZWZfcHV0IG1heSByZWxlYXNlIG10ZCBoZXJl
LCBzbyB0aGUgbXRkLT5wYXJlbnQgc2hvdWxkIGJlIHN0b3JlZCBhcyBpbiB0aGUgb3JpZ2luYWwg
cGF0Y2guCgpBYnNvbHV0ZWx5LiBJJ2xsIGZpeCB0aGlzIGluIHYyLgoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
