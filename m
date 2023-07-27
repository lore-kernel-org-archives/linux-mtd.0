Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD225EB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 06:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AOx+j6suBkDIUcJtl1KqgIklptEB7o+QC1+AyXskCew=; b=xBjTQv8ibSGjpP
	hytumv4T6y7Gzm//PznO8PIf9DCmUmFBSOnp0YB60Qqq8AsWJTaS+r6WKpUqQy8/JrTMDFMO+bKY7
	YGVh/LFBd0Zafjs/GtIfQ4XyZ9fnGedr/ivGPBqVIS8mllI68Uwj1D0epIkueYEJbF1aUPJQFSnFm
	pnPH89D6qT8P8rG8qUMhuwmpPS6c+YRW4PkZFEJH9LTUBEeut4ycMFHvOrYw9ZEJ15bYJMllBrUaX
	vaVXB+shAfHkCWYyivohLsx+LWCxgMy881rn5Mf9yjbUpnR04GqbWymeGJpvh85hOBY0v7pzrq9te
	l1zPuVa6B4fii8W++dfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOuLQ-00CIn0-0b;
	Thu, 27 Jul 2023 06:19:28 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOuLL-00CIm1-2b
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 06:19:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 334DE1BF208;
	Thu, 27 Jul 2023 06:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690438758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qskc8UL7HpZtZS2sXdp6DAYX33Iw0SkA6UUJwMFN1pc=;
	b=MQ0XLEXe41fjTls2Ua+EtFbn5ci6ACukYOsA5oI8CXGsqok8uG8giYHxAruqtu7zDUPPux
	nSQuSUKMgQLcH2Eiy/Uh8gd0/SYBhgXC+61KeB1mQUMz42yetKDk8Hos1WrFB6y/Jkqin9
	T7krT175sF10KnPzoxC9sp2OHE5iPgYvnqFUZPd2kNeS8tr/5EeJbEg7GKAEUXW/PtVfm4
	tHn6XncNABpQORtDSCONGiZMHqvgA7YsARmbNRo+un8syOWAgts7U3wohC38L+SPFSCO/r
	vmjWsCUXPi5CfftItyX2o8PWcZMLB8L36WlK93cuXAQRN0HPqoZyIL8gDV1xeQ==
Date: Thu, 27 Jul 2023 08:19:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Winkler,
 Tomas" <tomas.winkler@intel.com>, "Lubart, Vitaly"
 <vitaly.lubart@intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Biju Das <biju.das.jz@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Re: [PATCH 1/2] mtd: use refcount to prevent corruption
Message-ID: <20230727081914.03e44b96@xps-13>
In-Reply-To: <CY5PR11MB636670FCA46F7F68F21AF44BED03A@CY5PR11MB6366.namprd11.prod.outlook.com>
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
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_231924_287601_17299169 
X-CRM114-Status: GOOD (  34.06  )
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
MjUgSnVsIDIwMjMgMTI6NTA6MDQgKzAwMDA6Cgo+IEhpCj4gPiAKPiA+IEhpIE1pcXVlbCwgIAo+
ID4gPgo+ID4gPiBIaSBBbGV4YW5kZXIsCj4gPiA+Cj4gPiA+IGFsZXhhbmRlci51c3lza2luQGlu
dGVsLmNvbSB3cm90ZSBvbiBNb24sIDI0IEp1bCAyMDIzIDExOjQzOjU5ICswMDAwOgo+ID4gPiAg
Cj4gPiA+ID4gPiA+ID4gPiBXaXRoIHRoaXMgcGF0Y2ggYXBwbGllZCwgd2hlbiBJIGxvYWQgdXAg
dGhlIG1vZHVsZSwgSSBnZXQgdGhlIHNhbWUgMwo+ID4gPiA+ID4gPiA+ID4gZGV2aWNlczoKPiA+
ID4gPiA+ID4gPiA+IC9kZXYvbXRkMAo+ID4gPiA+ID4gPiA+ID4gL2Rldi9tdGQwcm8KPiA+ID4g
PiA+ID4gPiA+IC9kZXYvbXRkYmxvY2swCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4g
VXBvbiByZW1vdmFsLCB0aGUgYmVsb3cgMiBkZXZpY2VzIHN0aWxsIGhhbmcgYXJvdW5kOgo+ID4g
PiA+ID4gPiA+ID4gL2Rldi9tdGQwCj4gPiA+ID4gPiA+ID4gPiAvZGV2L210ZDBybyAgCj4gPiA+
ID4gPiA+ID4gIAo+ID4gPiA+ID4gPiBPdXIgdXNlLWNhc2UgZG8gbm90IHByb2R1Y2UgbXRkYmxv
Y2ssIG1heWJlIHRoZXJlIGFyZSBzb21lICAKPiA+ID4gaW1iYWxhbmNlcyAgCj4gPiA+ID4gPiBv
ZiBnZXQvcHV0PyAgCj4gPiA+ID4gPiA+IEkgaGF2ZSBzb21ld2hlcmUgdmVyc2lvbiB3aXRoIHBy
X2RlYnVnIGFmdGVyIGV2ZXJ5IGtyZWZfZ2V0L3B1dC4gVGhhdCAgCj4gPiA+IG1heSAgCj4gPiA+
ID4gPiBoZWxwIHRvIGNhdGNoIHdoZXJlICAKPiA+ID4gPiA+ID4gaXQgbWlzc2VkLCBJIGhvcGUu
ICAKPiA+ID4gPiA+Cj4gPiA+ID4gPiBJIGJlbGlldmUgbXRkYmxvY2sgaXMgdGhlIGdvb2QgY2l0
aXplbiBoZXJlLiBKdXN0IGRpc2FibGUKPiA+ID4gPiA+IENPTkZJR19NVERfQkxPQ0sgZnJvbSB5
b3VyIGNvbmZpZ3VyYXRpb24gYW5kIHlvdSB3aWxsIGxpa2VseSBvYnNlcnZlCj4gPiA+ID4gPiB0
aGUgc2FtZSBpc3N1ZSwganVzdCBhIGJpdCBuYXJyb3dlZCwgcGVyaGFwcy4gSW5kZWVkLCBpZiB5
b3UgbWFuYWdlIHRvCj4gPiA+ID4gPiBmb2xsb3cgYWxsIHRoZSBnZXQvcHV0IGNhbGxzIGl0IGNh
biBoZWxwIHRvIGZpbmQgYW4gaW1iYWxhbmNlLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoYW5rcywK
PiA+ID4gPiA+IE1pcXXDqGwgIAo+ID4gPiA+Cj4gPiA+ID4gTWlxdWVsLCBkbyB5b3UgaGF2ZSBD
T05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUiBzZXQgaW4geW91ciAgCj4gPiA+IGNvbmZpZz8K
PiA+ID4KPiA+ID4gTm90IHN1cmUgSSBnZXQgeW91ciBxdWVzdGlvbi4gWW91IGNhbiBlbmFibGUg
b3IgZGlzYWJsZSBpdCwgaXQgc2hvdWxkCj4gPiA+IHdvcmsgaW4gYm90aCBjYXNlcyAoeWV0LCB0
aGUgaGFuZGxpbmcgaXMgb2YgY291cnNlIGEgYml0IGRpZmZlcmVudCBhcwo+ID4gPiB0aGUgdG9w
IGxldmVsIGRldmljZSB3aWxsIGJlIHJldGFpbmVkL25vdCByZXRhaW5lZCkuCj4gPiA+Cj4gPiA+
IFRoYW5rcywKPiA+ID4gTWlxdcOobCAgCj4gPiAKPiA+IEknbSB0cnlpbmcgdG8gdW5kZXJzdGFu
ZCB3aHkgSSBjYW4ndCByZXByb2R1Y2UgdGhlIHByb2JsZW0gaW4gbXkgc2NlbmFyaW8uCj4gPiBJ
IGZvdW5kIGFuIGltcG9ydGFudCBkaWZmZXJlbmNlIGluIHVwc3RyZWFtZWQgcGF0Y2ggYW5kIGlu
dGVybmFsIHZlcnNpb246Cj4gPiBUaGUgSVNfRU5BQkxFRChDT05GSUdfTVREX1BBUlRJVElPTkVE
X01BU1RFUikgY2hlY2sgYXJvdW5kCj4gPiBrcmVmX2dldC9wdXQgZG9lcyBub3QgZXhpc3RzIGlu
IHRoZSBpbnRlcm5hbCB0cmVlLgo+ID4gVGhlIGNvZGUgYmVmb3JlIG15IHBhdGNoIGRvIG5vdCBo
YXZlIHN1Y2ggY2hlY2ssIHNvIEkgdGVuZCB0byBhc3N1bWUgdGhhdAo+ID4gdGhpcyBjaGVjayBz
aG91bGQgYmUgcmVtb3ZlZC4KPiA+IElmIHlvdSByZXByb2R1Y2UgaGFwcGVucyB3aXRoIENPTkZJ
R19NVERfUEFSVElUSU9ORURfTUFTVEVSCj4gPiBkaXNhYmxlZCB0aGF0IG1heSBleHBsYWluIHBy
b2JsZW1zIHRoYXQgeW91IHNlZS4KPiA+IAo+ID4gLS0KPiA+IFRoYW5rcywKPiA+IFNhc2hhCj4g
PiAgIAo+IAo+IEkndmUgdHJpZWQgdG8gcmVwcm9kdWNlIHRoaXMgd2l0aCBsYXRlc3QgTGludXgg
Ni41LXJjMSBhbmQgbXkgdHdvIHBhdGNoZXMuCj4gVGhlIG1hbnVhbCBtb2Rwcm9iZSBtdGRibG9j
ayBjcmVhdGVzIG10ZGJsb2NrMCBvdmVyIG15IHBhcnRpdGlvbnMgdG9vLgo+IEkgY2FuJ3QgcmVw
cm9kdWNlIHByb2JsZW0gbmVpdGhlciB3aXRoIE1URF9QQVJUSVRJT05FRF9NQVNURVIgbm9yIHdp
dGhvdXQuCj4gCj4gTGV0J3MgdHJ5IHRvIGRlYnVnIG9uIHlvdXIgc3lzdGVtLCBjYW4geW91IGVu
YWJsZSBkeW5hbWljIGRlYnVnIGZvciBtdGQgc3Vic3lzdGVtLAo+IHJlcHJvZHVjZSBhbmQgcHVi
bGlzaCBkbWVzZz8KPiAKPiBUaGUgcHJpbnRzIGZvciBrcmVmIGdldC9wdXQgY2FuIGJlIGFkZGVk
IGFzIGJlbG93Ogo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMgYi9kcml2
ZXJzL210ZC9tdGRjb3JlLmMKPiBpbmRleCAyNDY2ZWE0NjY0NjYuLjM3NDgzNTgzMTQyOCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPiArKysgYi9kcml2ZXJzL210ZC9tdGRj
b3JlLmMKPiBAQCAtMTI0MiwxMCArMTI0MiwxMyBAQCBpbnQgX19nZXRfbXRkX2RldmljZShzdHJ1
Y3QgbXRkX2luZm8gKm10ZCkKPiAgICAgICAgIH0KPiAKPiAgICAgICAgIGtyZWZfZ2V0KCZtdGQt
PnJlZmNudCk7Cj4gKyAgICAgICBwcl9kZWJ1ZygiZ2V0IG10ZCAlcyAlZFxuIiwgbXRkLT5uYW1l
LCBrcmVmX3JlYWQoJm10ZC0+cmVmY250KSk7Cj4gCj4gICAgICAgICB3aGlsZSAobXRkLT5wYXJl
bnQpIHsKPiAtICAgICAgICAgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX01URF9QQVJUSVRJ
T05FRF9NQVNURVIpIHx8IG10ZC0+cGFyZW50ICE9IG1hc3RlcikKPiArICAgICAgICAgICAgICAg
aWYgKElTX0VOQUJMRUQoQ09ORklHX01URF9QQVJUSVRJT05FRF9NQVNURVIpIHx8IG10ZC0+cGFy
ZW50ICE9IG1hc3Rlcikgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIGtyZWZfZ2V0KCZtdGQt
PnBhcmVudC0+cmVmY250KTsKPiArICAgICAgICAgICAgICAgICAgICAgICBwcl9kZWJ1ZygiZ2V0
IG10ZCAlcyAlZFxuIiwgbXRkLT5wYXJlbnQtPm5hbWUsIGtyZWZfcmVhZCgmbXRkLT5wYXJlbnQt
PnJlZmNudCkpOwo+ICsgICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgIG10ZCA9IG10
ZC0+cGFyZW50Owo+ICAgICAgICAgfQo+IAo+IEBAIC0xMzM1LDEyICsxMzM4LDE1IEBAIHZvaWQg
X19wdXRfbXRkX2RldmljZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKPiAgICAgICAgIHdoaWxlICht
dGQgIT0gbWFzdGVyKSB7Cj4gICAgICAgICAgICAgICAgIHN0cnVjdCBtdGRfaW5mbyAqcGFyZW50
ID0gbXRkLT5wYXJlbnQ7Cj4gCj4gKyAgICAgICAgICAgICAgIHByX2RlYnVnKCJwdXQgbXRkICVz
ICVkXG4iLCBtdGQtPm5hbWUsIGtyZWZfcmVhZCgmbXRkLT5yZWZjbnQpKTsKPiAgICAgICAgICAg
ICAgICAga3JlZl9wdXQoJm10ZC0+cmVmY250LCBtdGRfZGV2aWNlX3JlbGVhc2UpOwo+ICAgICAg
ICAgICAgICAgICBtdGQgPSBwYXJlbnQ7Cj4gICAgICAgICB9Cj4gCj4gLSAgICAgICBpZiAoSVNf
RU5BQkxFRChDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUikpCj4gKyAgICAgICBpZiAoSVNf
RU5BQkxFRChDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUikpIHsKPiArICAgICAgICAgICAg
ICAgcHJfZGVidWcoInB1dCBtdGQgJXMgJWRcbiIsIG1hc3Rlci0+bmFtZSwga3JlZl9yZWFkKCZt
YXN0ZXItPnJlZmNudCkpOwo+ICAgICAgICAgICAgICAgICBrcmVmX3B1dCgmbWFzdGVyLT5yZWZj
bnQsIG10ZF9kZXZpY2VfcmVsZWFzZSk7Cj4gKyAgICAgICB9Cj4gCj4gICAgICAgICBtb2R1bGVf
cHV0KG1hc3Rlci0+b3duZXIpOwo+IAo+IAoKQ291bGQgdGhpcyBiZSBoZWxwZnVsPwoKaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwNzI1MjE1NTM5LjMxMzUzMDQtMS16aGFuZ3hpYW94
dTVAaHVhd2VpLmNvbS8KCklmIHlvdSBzdWNjZXNzZnVsbHkgdGVzdCBpdCwgcGxlYXNlIHNlbmQg
eW91ciBUZXN0ZWQtYnkuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
