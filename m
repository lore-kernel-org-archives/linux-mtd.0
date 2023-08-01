Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F2DEB64DD
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Aug 2023 08:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JVwY6XCdz5YuCz5/JAoWq0SNpmlXtsdMVFdqdJHG1ag=; b=PdhM4JW/5gfFUO
	0yjBtyEv6XI7qep8GoheRdwsgHyJVle4zjRr8lg8Sr4OcRo8SsdPIpwJizpLe91VTklixQT2ORWjZ
	NEBtETgYB+yLOl1BvT40dD1l9f+s3gsktt/SqA0WnYo0Hs8sqxctjUUrvkwV857ppbi/5j6lT7tJo
	nIzJrc5KF7P22CkKY5gDmxb9Pxw2oDpqVbfNwQMU4ZdfsJIfKc6N7H17d0a5zo938sHnkBn1ptcDO
	Rd3EIJYDzuw/ufRi3bDdVK32p2aArjejEHSYhnGoLBDdYjrREStGtuaPyekQmQYVZBCcxUFLP6hPB
	D5TKfEC4NnyExi1A0x6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQlCw-000hpa-2w;
	Tue, 01 Aug 2023 08:58:22 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQlCt-000hmX-2I
	for linux-mtd@lists.infradead.org;
	Tue, 01 Aug 2023 08:58:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5DFA2240009;
	Tue,  1 Aug 2023 08:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690880295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GTud+IBzOGVuxt61GTjTnVPiZ9H3UzCO3mW4+DKFYXs=;
	b=fGXuU0EoRTitAS6NMFCBv2WVDmrS6b0414cIYimBCorhem+j1rI6Z9aU3gCjfIKrEAn6tw
	sDhtG5U7SjjLuGStRVo5YmMWSm8x3gr16aaFD4+tyHHfxmWC7s2ImUVmSr8laD1o/iTcQK
	+mpuSD0ODeA/2SaDgV1XsZa101DuUOkPwDiLNoNulmk1yBx4LtmhxgrZulqIkZRtvNu3l/
	pBgOkLENTw/BQFpppLlss5EbjM388A4HFUNpe41GJAsPPNjFOEZ8NGq2KacTEQrT3HdQyW
	gXvbvrymnPFta2Fafxx6u00K0PMK/iZPRtm28NroB0Kl65D/HZO9d6iXVI9u5A==
Date: Tue, 1 Aug 2023 10:58:11 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, "Michael Walle" <michael@walle.cc>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Winkler,
 Tomas" <tomas.winkler@intel.com>, Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
Subject: Re: [PATCH v2] mtd: Fix refcounting with MTD_PARTITIONED_MASTER
Message-ID: <20230801105811.2f0edc64@xps-13>
In-Reply-To: <CY5PR11MB63664273EC02BE1A9AC05D7EED0AA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20230731090903.770277-1-miquel.raynal@bootlin.com>
	<CY5PR11MB63664273EC02BE1A9AC05D7EED0AA@CY5PR11MB6366.namprd11.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_015820_182925_032C7C26 
X-CRM114-Status: GOOD (  34.29  )
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

SGkgQWxleGFuZGVyLAoKYWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29tIHdyb3RlIG9uIFR1ZSwg
MSBBdWcgMjAyMyAwODo0NTo0NyArMDAwMDoKCj4gSGkgTWlxdWVsLAo+IAo+ID4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20+Cj4gPiBTZW50OiBNb25kYXksIEp1bHkgMzEsIDIwMjMgMTI6MDkKPiA+IFRv
OiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PjsgVmlnbmVzaCBSYWdoYXZlbmRy
YQo+ID4gPHZpZ25lc2hyQHRpLmNvbT47IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbGlu
YXJvLm9yZz47IFByYXR5dXNoCj4gPiBZYWRhdiA8cHJhdHl1c2hAa2VybmVsLm9yZz47IE1pY2hh
ZWwgV2FsbGUgPG1pY2hhZWxAd2FsbGUuY2M+OyBsaW51eC0KPiA+IG10ZEBsaXN0cy5pbmZyYWRl
YWQub3JnCj4gPiBDYzogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT47
IFdpbmtsZXIsIFRvbWFzCj4gPiA8dG9tYXMud2lua2xlckBpbnRlbC5jb20+OyBVc3lza2luLCBB
bGV4YW5kZXIKPiA+IDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+OyBaaGFuZyBYaWFveHUg
PHpoYW5neGlhb3h1NUBodWF3ZWkuY29tPgo+ID4gU3ViamVjdDogW1BBVENIIHYyXSBtdGQ6IEZp
eCByZWZjb3VudGluZyB3aXRoIE1URF9QQVJUSVRJT05FRF9NQVNURVIKPiA+IAo+ID4gVGhlIGxv
Z2ljIGlzIHdheSB0b28gY29udm9sdXRlZCwgbGV0J3MgY2xlYW4gdGhlIGtyZWZfZ2V0L3B1dCBz
ZWN0aW9uIHRvCj4gPiBjbGFyaWZ5IHdoYXQgdGhpcyBibG9jayBkb2VzLCBob3BlZnVsbHkgc29s
dmluZyB0aGUgcmVmY291bnRpbmcgaXNzdWUKPiA+IHdoZW4gdXNpbmcgQ09ORklHX01URF9QQVJU
SVRJT05FRF9NQVNURVIgYXQgdGhlIHNhbWUgdGltZToKPiA+IC0gSXRlcmF0ZSB0aHJvdWdoIGFs
bCB0aGUgcGFyZW50IG10ZCBkZXZpY2VzCj4gPiAtIEdyYWIgYSByZWZlcmVuY2Ugb3ZlciB0aGVt
IGFsbCBidXQgdGhlIG1hc3Rlcgo+ID4gLSBPbmx5IGdyYWIgdGhlIG1hc3RlciB3aGl0aCBDT05G
SUdfTVREX1BBUlRJVElPTkVEX01BU1RFUgo+ID4gU2FtZSBsb2dpYyBtdXN0IGFwcGx5IGluIHRo
ZSBwdXQgcGF0aCwgb3RoZXJ3aXNlIGl0IHdvdWxkIGJlIGJyb2tlbi4KPiA+IAo+ID4gQ2M6IFRv
bWFzIFdpbmtsZXIgPHRvbWFzLndpbmtsZXJAaW50ZWwuY29tPgo+ID4gQ2M6IEFsZXhhbmRlciBV
c3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+Cj4gPiBDYzogWmhhbmcgWGlhb3h1
IDx6aGFuZ3hpYW94dTVAaHVhd2VpLmNvbT4KPiA+IEZpeGVzOiAxOWJmYTllYmViYjUgKCJtdGQ6
IHVzZSByZWZjb3VudCB0byBwcmV2ZW50IGNvcnJ1cHRpb24iKQo+ID4gU2lnbmVkLW9mZi1ieTog
TWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiA+ICAgCj4gCj4gSSd2
ZSBwdXQgaXQgb24gdG9wIG9mIG15ICJbUEFUQ0ggdjJdIG10ZDogZml4IHVzZS1hZnRlci1mcmVl
IGluIG10ZCByZWxlYXNlIiwKPiBsb29rcyBvaywgYnV0IEkgaGF2ZSBoYWQgbm8gcHJvYmxlbXMg
d2l0aCByZWZjb3VudGluZyBiZWZvcmUuLi4KPiBJTU8sIHdlIG5lZWQgYm90aCB0aGlzIHBhdGNo
IGFuZCBteSBwYXRjaCBhcyB0aGV5IGZpeCBkaWZmZXJlbnQgaXNzdWVzLgoKTGlrZWx5LCB5ZXMs
IGxldCdzIHdhaXQgZm9yIFpoYW5nJ3MgZmVlZGJhY2s7IFpoYW5nLCBkb2VzIEthc2FuIHN0aWxs
CmNvbXBsYWluPwoKPiBUZXN0ZWQtYnk6IEFsZXhhbmRlciBVc3lza2luIDxhbGV4YW5kZXIudXN5
c2tpbkBpbnRlbC5jb20+Cj4gCj4gPiAtLS0KPiA+IAo+ID4gSGVsbG8sCj4gPiAKPiA+IEFsZXhh
bmRlciwgWmhhbmcsIHBsZWFzZSB0ZXN0IHRoaXMgdmVyc2lvbiwgaXQgaXMgY2xvc2UgdG8gd2hh
dCBaaGFuZwo+ID4gcHJvZHVjZWQgd2hpbGUgbm90IHN0cmljdGx5IGlkZW50aWNhbC4gVGhpcyBj
b21waWxlLXRlc3RlZCBvbmx5LCBwbGVhc2UKPiA+IGNoZWNrIG9uIHlvdSBzaWRlIHdoZXRoZXIg
aXQgZml4ZXMgdGhlIHJlZmNvdW50aW5nIGlzc3VlIHdpdGggYW5kCj4gPiB3aXRob3V0IFBBUlRJ
VElPTkVEX01BU1RFUiwgYXMgd2VsbCBhcyB3aXRoIEthc2FuLgo+ID4gCj4gPiBBbGV4YW5kZXIs
IG1heWJlIHRoZXJlIGlzIHNvbWV0aGluZyBlbHNlIHRvIGZpeCwgaW4gYWxsIGNhc2VzIHRoZSBs
b2dpYwo+ID4gaGVyZSB3YXMgYnJva2VuIHNvIGxldCdzIHN0YXJ0IGJ5IHRoaXMgb25lIGFuZCBz
ZWUgaWYgd2UgbmVlZCBzb21ldGhpbmcKPiA+IGVsc2Ugb24gdG9wLgo+ID4gCj4gPiBDaGFuZ2Vz
IGluIHYyOgo+ID4gKiBHcmFiIHRoZSBwYXJlbnQgYmVmb3JlIGNhbGxpbmcga3JlZl9wdXQoKSB0
byBhdm9pZCBhY2Nlc3NpbmcgYSBmcmVlZAo+ID4gICBtdGQgcG9pbnRlci4KPiA+IAo+ID4gVGhh
bmtzLAo+ID4gTWlxdcOobAo+ID4gLS0tCj4gPiAgZHJpdmVycy9tdGQvbXRkY29yZS5jIHwgMTcg
KysrKysrKysrKy0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwg
NyBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNvcmUu
YyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+ID4gaW5kZXggMjQ2NmVhNDY2NDY2Li45ZThmZjNh
OTk5ZGUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPiA+ICsrKyBiL2Ry
aXZlcnMvbXRkL210ZGNvcmUuYwo+ID4gQEAgLTEyNDEsMTQgKzEyNDEsMTUgQEAgaW50IF9fZ2V0
X210ZF9kZXZpY2Uoc3RydWN0IG10ZF9pbmZvICptdGQpCj4gPiAgCQlyZXR1cm4gLUVOT0RFVjsK
PiA+ICAJfQo+ID4gCj4gPiAtCWtyZWZfZ2V0KCZtdGQtPnJlZmNudCk7Cj4gPiAtCj4gPiAtCXdo
aWxlIChtdGQtPnBhcmVudCkgewo+ID4gLQkJaWYgKElTX0VOQUJMRUQoQ09ORklHX01URF9QQVJU
SVRJT05FRF9NQVNURVIpIHx8Cj4gPiBtdGQtPnBhcmVudCAhPSBtYXN0ZXIpCj4gPiAtCQkJa3Jl
Zl9nZXQoJm10ZC0+cGFyZW50LT5yZWZjbnQpOwo+ID4gKwl3aGlsZSAobXRkKSB7Cj4gPiArCQlp
ZiAobXRkICE9IG1hc3RlcikKPiA+ICsJCQlrcmVmX2dldCgmbXRkLT5yZWZjbnQpOwo+ID4gIAkJ
bXRkID0gbXRkLT5wYXJlbnQ7Cj4gPiAgCX0KPiA+IAo+ID4gKwlpZiAoSVNfRU5BQkxFRChDT05G
SUdfTVREX1BBUlRJVElPTkVEX01BU1RFUikpCj4gPiArCQlrcmVmX2dldCgmbWFzdGVyLT5yZWZj
bnQpOwo+ID4gKwo+ID4gIAlyZXR1cm4gMDsKPiA+ICB9Cj4gPiAgRVhQT1JUX1NZTUJPTF9HUEwo
X19nZXRfbXRkX2RldmljZSk7Cj4gPiBAQCAtMTMzMiwxMCArMTMzMywxMiBAQCB2b2lkIF9fcHV0
X210ZF9kZXZpY2Uoc3RydWN0IG10ZF9pbmZvICptdGQpCj4gPiAgewo+ID4gIAlzdHJ1Y3QgbXRk
X2luZm8gKm1hc3RlciA9IG10ZF9nZXRfbWFzdGVyKG10ZCk7Cj4gPiAKPiA+IC0Jd2hpbGUgKG10
ZCAhPSBtYXN0ZXIpIHsKPiA+ICsJd2hpbGUgKG10ZCkgewo+ID4gKwkJLyoga3JlZl9wdXQoKSBj
YW4gcmVsZXNlIG10ZCwgc28ga2VlcCBhIHJlZmVyZW5jZSBtdGQtPnBhcmVudAo+ID4gKi8KPiA+
ICAJCXN0cnVjdCBtdGRfaW5mbyAqcGFyZW50ID0gbXRkLT5wYXJlbnQ7Cj4gPiAKPiA+IC0JCWty
ZWZfcHV0KCZtdGQtPnJlZmNudCwgbXRkX2RldmljZV9yZWxlYXNlKTsKPiA+ICsJCWlmIChtdGQg
IT0gbWFzdGVyKQo+ID4gKwkJCWtyZWZfcHV0KCZtdGQtPnJlZmNudCwgbXRkX2RldmljZV9yZWxl
YXNlKTsKPiA+ICAJCW10ZCA9IHBhcmVudDsKPiA+ICAJfQo+ID4gCj4gPiAtLQo+ID4gMi4zNC4x
ICAKPiAKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
