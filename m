Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BB6C001DC
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 06:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ys31/ebM38B0sBi/bxeLj3EZTd3GGD2kWlEPfjUjM0M=; b=1c9m+GdkylRIFz
	jeVlDQBJVUVtVPqDl+50Ax1gGzyRToXk4XoK7Kzjc2O+P6qfYkALoyrRIT/gZ3CEizhetfxCNIAge
	KyytdexsUCHmFUdHIjwdsGUBvExmyOaPuiSuoSe4BrbbLa3ljbaN+wmEjoz1QhKBSE3CQBzRlU/rI
	6fk/73ZXPcNpU6EjTf7riFpHKLEPmBu5X9P6j7vqI/uxN0Zq7DaAExCkDhPLo8uqUSA2zRA+RirBj
	DbXpPhsr9ov1JqqMFIDrVVd+duRac3e8sJ55sYJjuiHaCcDZsnsueyRB5E0SZQkw4o2BB2BwgpU+S
	UiC2SwZqqPq2MjwurQ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOuuX-00CNEA-21;
	Thu, 27 Jul 2023 06:55:45 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOuuT-00CN4n-0X
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 06:55:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E0E6FF80B;
	Thu, 27 Jul 2023 06:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690440937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iaoRwisGb1LeT0J1HXstF48SClPZihmj6ym+68S17do=;
	b=l90Y1H6pOsIPnIDn+VQC0szMd6PblujD6glk86LG+HmW512c/Emybl+IVnV92APVgKr/GX
	rnWNyGLy0sZpRHL9Wt0Jn88kPIbnxBlcTIm43AZLJqsBmDx4bru8jftthPu17xfVT4jC2r
	KCfyy3lv42X1/dlbHvv53dCMgsm8qSwgIdTqldeSG2L/yIo4tQakTszXHBD9/WjGdv3Yyx
	iCzh3ad1rgBWeuMXqKJAbF/nKY6iQHKXrwpUxNcj0PG/SacEGT6cjuMzctaN21HdtmtVly
	r7aOUcNpcdD14fsnPpO15NNTvBpdXcuIHYD2FGi8l45zvUgC3j8qJXQTI6/PKw==
Date: Thu, 27 Jul 2023 08:55:30 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Winkler, Tomas" <tomas.winkler@intel.com>
Cc: "Usyskin, Alexander" <alexander.usyskin@intel.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Lubart, Vitaly" <vitaly.lubart@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Biju Das <biju.das.jz@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>, Zhang Xiaoxu
 <zhangxiaoxu5@huawei.com>
Subject: Re: [PATCH 1/2] mtd: use refcount to prevent corruption
Message-ID: <20230727085530.486dd356@xps-13>
In-Reply-To: <MN2PR11MB40937D15FE4076D5F73570B5E501A@MN2PR11MB4093.namprd11.prod.outlook.com>
References: <20230620131905.648089-1-alexander.usyskin@intel.com>
	<20230620131905.648089-2-alexander.usyskin@intel.com>
	<TYWPR01MB87756794A30EB389AB017EB1C234A@TYWPR01MB8775.jpnprd01.prod.outlook.com>
	<20230715174112.3909e43f@xps-13>
	<CY5PR11MB63666C8DA33C93E1DC3BCB21ED3AA@CY5PR11MB6366.namprd11.prod.outlook.com>
	<20230716153926.5e975231@xps-13>
	<CY5PR11MB6366C254F767B6C432C98A0CED02A@CY5PR11MB6366.namprd11.prod.outlook.com>
	<20230724135118.54e39faf@xps-13>
	<CY5PR11MB6366FB890508D05E1D1C1375ED02A@CY5PR11MB6366.namprd11.prod.outlook.com>
	<CY5PR11MB636670FCA46F7F68F21AF44BED03A@CY5PR11MB6366.namprd11.prod.outlook.com>
	<20230727081914.03e44b96@xps-13>
	<MN2PR11MB40937D15FE4076D5F73570B5E501A@MN2PR11MB4093.namprd11.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_235541_623522_E5EF7391 
X-CRM114-Status: GOOD (  39.63  )
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

SGkgVG9tYXMsCgp0b21hcy53aW5rbGVyQGludGVsLmNvbSB3cm90ZSBvbiBUaHUsIDI3IEp1bCAy
MDIzIDA2OjMyOjM5ICswMDAwOgoKPiA+IAo+ID4gSGkgQWxleGFuZGVyLAo+ID4gCj4gPiBhbGV4
YW5kZXIudXN5c2tpbkBpbnRlbC5jb20gd3JvdGUgb24gVHVlLCAyNSBKdWwgMjAyMyAxMjo1MDow
NCArMDAwMDoKPiA+IAo+ID4gPiBIaQo+ID4gPiA+Cj4gPiA+ID4gSGkgTWlxdWVsLAo+ID4gPiA+
ID4KPiA+ID4gPiA+IEhpIEFsZXhhbmRlciwKPiA+ID4gPiA+Cj4gPiA+ID4gPiBhbGV4YW5kZXIu
dXN5c2tpbkBpbnRlbC5jb20gd3JvdGUgb24gTW9uLCAyNCBKdWwgMjAyMyAxMTo0Mzo1OQo+ID4g
KzAwMDA6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiA+IFdpdGggdGhpcyBwYXRjaCBhcHBs
aWVkLCB3aGVuIEkgbG9hZCB1cCB0aGUgbW9kdWxlLCBJCj4gPiA+ID4gPiA+ID4gPiA+ID4gZ2V0
IHRoZSBzYW1lIDMKPiA+ID4gPiA+ID4gPiA+ID4gPiBkZXZpY2VzOgo+ID4gPiA+ID4gPiA+ID4g
PiA+IC9kZXYvbXRkMAo+ID4gPiA+ID4gPiA+ID4gPiA+IC9kZXYvbXRkMHJvCj4gPiA+ID4gPiA+
ID4gPiA+ID4gL2Rldi9tdGRibG9jazAKPiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
ID4gPiA+IFVwb24gcmVtb3ZhbCwgdGhlIGJlbG93IDIgZGV2aWNlcyBzdGlsbCBoYW5nIGFyb3Vu
ZDoKPiA+ID4gPiA+ID4gPiA+ID4gPiAvZGV2L210ZDAKPiA+ID4gPiA+ID4gPiA+ID4gPiAvZGV2
L210ZDBybwo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gT3VyIHVzZS1jYXNlIGRv
IG5vdCBwcm9kdWNlIG10ZGJsb2NrLCBtYXliZSB0aGVyZSBhcmUgc29tZQo+ID4gPiA+ID4gaW1i
YWxhbmNlcwo+ID4gPiA+ID4gPiA+IG9mIGdldC9wdXQ/Cj4gPiA+ID4gPiA+ID4gPiBJIGhhdmUg
c29tZXdoZXJlIHZlcnNpb24gd2l0aCBwcl9kZWJ1ZyBhZnRlciBldmVyeQo+ID4gPiA+ID4gPiA+
ID4ga3JlZl9nZXQvcHV0LiBUaGF0Cj4gPiA+ID4gPiBtYXkKPiA+ID4gPiA+ID4gPiBoZWxwIHRv
IGNhdGNoIHdoZXJlCj4gPiA+ID4gPiA+ID4gPiBpdCBtaXNzZWQsIEkgaG9wZS4KPiA+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiA+IEkgYmVsaWV2ZSBtdGRibG9jayBpcyB0aGUgZ29vZCBjaXRpemVu
IGhlcmUuIEp1c3QgZGlzYWJsZQo+ID4gPiA+ID4gPiA+IENPTkZJR19NVERfQkxPQ0sgZnJvbSB5
b3VyIGNvbmZpZ3VyYXRpb24gYW5kIHlvdSB3aWxsIGxpa2VseQo+ID4gPiA+ID4gPiA+IG9ic2Vy
dmUgdGhlIHNhbWUgaXNzdWUsIGp1c3QgYSBiaXQgbmFycm93ZWQsIHBlcmhhcHMuIEluZGVlZCwK
PiA+ID4gPiA+ID4gPiBpZiB5b3UgbWFuYWdlIHRvIGZvbGxvdyBhbGwgdGhlIGdldC9wdXQgY2Fs
bHMgaXQgY2FuIGhlbHAgdG8gZmluZCBhbgo+ID4gaW1iYWxhbmNlLgo+ID4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+ID4gVGhhbmtzLAo+ID4gPiA+ID4gPiA+IE1pcXXDqGwKPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gTWlxdWVsLCBkbyB5b3UgaGF2ZSBDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RF
UiBzZXQgaW4geW91cgo+ID4gPiA+ID4gY29uZmlnPwo+ID4gPiA+ID4KPiA+ID4gPiA+IE5vdCBz
dXJlIEkgZ2V0IHlvdXIgcXVlc3Rpb24uIFlvdSBjYW4gZW5hYmxlIG9yIGRpc2FibGUgaXQsIGl0
Cj4gPiA+ID4gPiBzaG91bGQgd29yayBpbiBib3RoIGNhc2VzICh5ZXQsIHRoZSBoYW5kbGluZyBp
cyBvZiBjb3Vyc2UgYSBiaXQKPiA+ID4gPiA+IGRpZmZlcmVudCBhcyB0aGUgdG9wIGxldmVsIGRl
dmljZSB3aWxsIGJlIHJldGFpbmVkL25vdCByZXRhaW5lZCkuCj4gPiA+ID4gPgo+ID4gPiA+ID4g
VGhhbmtzLAo+ID4gPiA+ID4gTWlxdcOobAo+ID4gPiA+Cj4gPiA+ID4gSSdtIHRyeWluZyB0byB1
bmRlcnN0YW5kIHdoeSBJIGNhbid0IHJlcHJvZHVjZSB0aGUgcHJvYmxlbSBpbiBteQo+ID4gc2Nl
bmFyaW8uCj4gPiA+ID4gSSBmb3VuZCBhbiBpbXBvcnRhbnQgZGlmZmVyZW5jZSBpbiB1cHN0cmVh
bWVkIHBhdGNoIGFuZCBpbnRlcm5hbCB2ZXJzaW9uOgo+ID4gPiA+IFRoZSBJU19FTkFCTEVEKENP
TkZJR19NVERfUEFSVElUSU9ORURfTUFTVEVSKSBjaGVjayBhcm91bmQKPiA+ID4gPiBrcmVmX2dl
dC9wdXQgZG9lcyBub3QgZXhpc3RzIGluIHRoZSBpbnRlcm5hbCB0cmVlLgo+ID4gPiA+IFRoZSBj
b2RlIGJlZm9yZSBteSBwYXRjaCBkbyBub3QgaGF2ZSBzdWNoIGNoZWNrLCBzbyBJIHRlbmQgdG8g
YXNzdW1lCj4gPiA+ID4gdGhhdCB0aGlzIGNoZWNrIHNob3VsZCBiZSByZW1vdmVkLgo+ID4gPiA+
IElmIHlvdSByZXByb2R1Y2UgaGFwcGVucyB3aXRoIENPTkZJR19NVERfUEFSVElUSU9ORURfTUFT
VEVSCj4gPiBkaXNhYmxlZAo+ID4gPiA+IHRoYXQgbWF5IGV4cGxhaW4gcHJvYmxlbXMgdGhhdCB5
b3Ugc2VlLgo+ID4gPiA+Cj4gPiA+ID4gLS0KPiA+ID4gPiBUaGFua3MsCj4gPiA+ID4gU2FzaGEK
PiA+ID4gPgo+ID4gPgo+ID4gPiBJJ3ZlIHRyaWVkIHRvIHJlcHJvZHVjZSB0aGlzIHdpdGggbGF0
ZXN0IExpbnV4IDYuNS1yYzEgYW5kIG15IHR3byBwYXRjaGVzLgo+ID4gPiBUaGUgbWFudWFsIG1v
ZHByb2JlIG10ZGJsb2NrIGNyZWF0ZXMgbXRkYmxvY2swIG92ZXIgbXkgcGFydGl0aW9ucyB0b28u
Cj4gPiA+IEkgY2FuJ3QgcmVwcm9kdWNlIHByb2JsZW0gbmVpdGhlciB3aXRoIE1URF9QQVJUSVRJ
T05FRF9NQVNURVIgbm9yCj4gPiB3aXRob3V0Lgo+ID4gPgo+ID4gPiBMZXQncyB0cnkgdG8gZGVi
dWcgb24geW91ciBzeXN0ZW0sIGNhbiB5b3UgZW5hYmxlIGR5bmFtaWMgZGVidWcgZm9yCj4gPiA+
IG10ZCBzdWJzeXN0ZW0sIHJlcHJvZHVjZSBhbmQgcHVibGlzaCBkbWVzZz8KPiA+ID4KPiA+ID4g
VGhlIHByaW50cyBmb3Iga3JlZiBnZXQvcHV0IGNhbiBiZSBhZGRlZCBhcyBiZWxvdzoKPiA+ID4K
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYyBiL2RyaXZlcnMvbXRkL210
ZGNvcmUuYyBpbmRleAo+ID4gPiAyNDY2ZWE0NjY0NjYuLjM3NDgzNTgzMTQyOCAxMDA2NDQKPiA+
ID4gLS0tIGEvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvbXRkL210
ZGNvcmUuYwo+ID4gPiBAQCAtMTI0MiwxMCArMTI0MiwxMyBAQCBpbnQgX19nZXRfbXRkX2Rldmlj
ZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKPiA+ID4gICAgICAgICB9Cj4gPiA+Cj4gPiA+ICAgICAg
ICAga3JlZl9nZXQoJm10ZC0+cmVmY250KTsKPiA+ID4gKyAgICAgICBwcl9kZWJ1ZygiZ2V0IG10
ZCAlcyAlZFxuIiwgbXRkLT5uYW1lLAo+ID4gPiArIGtyZWZfcmVhZCgmbXRkLT5yZWZjbnQpKTsK
PiA+ID4KPiA+ID4gICAgICAgICB3aGlsZSAobXRkLT5wYXJlbnQpIHsKPiA+ID4gLSAgICAgICAg
ICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19NVERfUEFSVElUSU9ORURfTUFTVEVSKSB8fCBt
dGQtCj4gPiA+cGFyZW50ICE9IG1hc3RlcikKPiA+ID4gKyAgICAgICAgICAgICAgIGlmIChJU19F
TkFCTEVEKENPTkZJR19NVERfUEFSVElUSU9ORURfTUFTVEVSKSB8fAo+ID4gPiArIG10ZC0+cGFy
ZW50ICE9IG1hc3Rlcikgewo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBrcmVmX2dldCgm
bXRkLT5wYXJlbnQtPnJlZmNudCk7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHByX2Rl
YnVnKCJnZXQgbXRkICVzICVkXG4iLCBtdGQtPnBhcmVudC0+bmFtZSwKPiA+IGtyZWZfcmVhZCgm
bXRkLT5wYXJlbnQtPnJlZmNudCkpOwo+ID4gPiArICAgICAgICAgICAgICAgfQo+ID4gPiAgICAg
ICAgICAgICAgICAgbXRkID0gbXRkLT5wYXJlbnQ7Cj4gPiA+ICAgICAgICAgfQo+ID4gPgo+ID4g
PiBAQCAtMTMzNSwxMiArMTMzOCwxNSBAQCB2b2lkIF9fcHV0X210ZF9kZXZpY2Uoc3RydWN0IG10
ZF9pbmZvCj4gPiAqbXRkKQo+ID4gPiAgICAgICAgIHdoaWxlIChtdGQgIT0gbWFzdGVyKSB7Cj4g
PiA+ICAgICAgICAgICAgICAgICBzdHJ1Y3QgbXRkX2luZm8gKnBhcmVudCA9IG10ZC0+cGFyZW50
Owo+ID4gPgo+ID4gPiArICAgICAgICAgICAgICAgcHJfZGVidWcoInB1dCBtdGQgJXMgJWRcbiIs
IG10ZC0+bmFtZSwKPiA+ID4gKyBrcmVmX3JlYWQoJm10ZC0+cmVmY250KSk7Cj4gPiA+ICAgICAg
ICAgICAgICAgICBrcmVmX3B1dCgmbXRkLT5yZWZjbnQsIG10ZF9kZXZpY2VfcmVsZWFzZSk7Cj4g
PiA+ICAgICAgICAgICAgICAgICBtdGQgPSBwYXJlbnQ7Cj4gPiA+ICAgICAgICAgfQo+ID4gPgo+
ID4gPiAtICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19NVERfUEFSVElUSU9ORURfTUFTVEVS
KSkKPiA+ID4gKyAgICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfTVREX1BBUlRJVElPTkVEX01B
U1RFUikpIHsKPiA+ID4gKyAgICAgICAgICAgICAgIHByX2RlYnVnKCJwdXQgbXRkICVzICVkXG4i
LCBtYXN0ZXItPm5hbWUsCj4gPiA+ICsga3JlZl9yZWFkKCZtYXN0ZXItPnJlZmNudCkpOwo+ID4g
PiAgICAgICAgICAgICAgICAga3JlZl9wdXQoJm1hc3Rlci0+cmVmY250LCBtdGRfZGV2aWNlX3Jl
bGVhc2UpOwo+ID4gPiArICAgICAgIH0KPiA+ID4KPiA+ID4gICAgICAgICBtb2R1bGVfcHV0KG1h
c3Rlci0+b3duZXIpOwo+ID4gPgo+ID4gPgo+ID4gCj4gPiBDb3VsZCB0aGlzIGJlIGhlbHBmdWw/
Cj4gPiAKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDcyNTIxNTUzOS4zMTM1
MzA0LTEtCj4gPiB6aGFuZ3hpYW94dTVAaHVhd2VpLmNvbS8KPiA+IAo+ID4gSWYgeW91IHN1Y2Nl
c3NmdWxseSB0ZXN0IGl0LCBwbGVhc2Ugc2VuZCB5b3VyIFRlc3RlZC1ieS4KPiBJbiB0aGUgZmly
c3QgZ2xhbmNlIGl0IGRvZXNuJ3QgbG9vayBjb3JyZWN0LCB3ZSBoYXZlIHRoZSByZXByb2R1Y2Vk
IHVzaW5nIGthc2FuLCBzbyBob3BlZnVsbHkgdGhlIGZpeCB3aWxsIGZvbGxvdywgc2hvcnRseS4g
Cj4gVGhhbmtzCj4gVG9tYXMKPiAKCldoeSBpcyB0aGlzIGZpeCBub3QgY29ycmVjdD8KCkFyZSB5
b3UgY3VycmVudGx5IHdyaXRpbmcgYSBmaXggeW91cnNlbGY/CgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
