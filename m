Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFFDC43458
	for <linux-mtd@archiver.kernel.org>; Sun,  5 Jul 2026 22:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VgM8pTG5wb8/BdQvJrWrXeXlOkqQKkVbtZhZOZb2vi4=; b=x1By5ftMY6yHq+
	EEWazM0Ns2BsX8yL+2mrd2Nc6vlsjbfX+g7P7zAYq91FyvP6SAnubpkQKgObFNtGVE5LzghL5i47+
	ewCqeZA5J9qXO1cTpgv2fL4o+3z/uklEicHIHktQEi8yBHgvijdF42dWRf0R3V338Z3C9DfC/K/pV
	6tZYdPdP0e1o4h4idfLeO6fzO1DqnGL7fHqo2Rfb7+nCWsGIT3ZgH3rdxXt8g7nYP2qf38CZHmLNn
	nPhNo2bTO2mOi6YD85HAWPYtaBnqTqT17254Rct75bcVDLCNThaqDCeH3QCoXZq2vdRuJiBGKA56f
	IV7rIEV+lNM0nqJuSyqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgV4n-0000000AC5A-1B8O;
	Sun, 05 Jul 2026 22:12:37 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgV4j-0000000AC1w-2tYo
	for linux-mtd@lists.infradead.org;
	Sun, 05 Jul 2026 22:12:36 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 07C522C01EE;
	Mon,  6 Jul 2026 10:12:08 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1783289528;
	bh=RuH0FhXzRneZINd5+WhkQRtRZ0K75CzbsjfQEE5KbB8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ST4Phj/AOmFnPZV9gQgfPrV7hRGyl/WIozU8Lw9HqnQQzXeMN2QYujXBUlsPxsAG3
	 XBcEHHOxG0Eumg/bUKm2/XEOCDj/Maw3MiByqNsJkBHgZsXS3wy5X6UqvhC9FiKOHL
	 V+XGAeAdTEV+aBqwvldQi4ubr9ks7diJ2l7RDK5exkqCrwNMNdB7312fJXdP2BDDgY
	 nITaOXgOt+tacNrctnPlyIr+6MmE1pbpVa6liQCrEG4Qpsy3YYAOHwt1zFk/KbEoUN
	 iDlp2TmDt9UjqvRYhbYBTKJGDeZE/J95MaPge/C3FBBP7MvfQGHUcJDwQVUoT8ilhQ
	 wakpSRiU6WncA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6a4ad6b70000>; Mon, 06 Jul 2026 10:12:07 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.39; Mon, 6 Jul 2026 10:12:07 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1748.039; Mon, 6 Jul 2026 10:12:07 +1200
From: Ronan Dalton <Ronan.Dalton@alliedtelesis.co.nz>
To: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
	<richard@nod.at>
CC: "Takahiro.Kuwano@infineon.com" <Takahiro.Kuwano@infineon.com>,
	"pratyush@kernel.org" <pratyush@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"mwalle@kernel.org" <mwalle@kernel.org>, Aryan Srivastava
	<Aryan.Srivastava@alliedtelesis.co.nz>, Chris Packham
	<Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v2 1/3] Revert "mtd: spi-nor: remove Fujitsu MB85RS1MT
 support"
Thread-Topic: [PATCH v2 1/3] Revert "mtd: spi-nor: remove Fujitsu MB85RS1MT
 support"
Thread-Index: AQHdCtTu+HvBPYSwmEi4Lf0sk+8LHLZet82A
Date: Sun, 5 Jul 2026 22:12:07 +0000
Message-ID: <e3642e02f14116ade71ce73031c35e72efa4cba5.camel@alliedtelesis.co.nz>
References: <87wlvcnztx.fsf@bootlin.com>
In-Reply-To: <87wlvcnztx.fsf@bootlin.com>
Accept-Language: en-US, en-NZ
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.12.18]
Content-ID: <723CEF2CB49E59489ACCC2C64ADE7EB3@alliedtelesis.co.nz>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=TI3mSEla c=1 sm=1 tr=0 ts=6a4ad6b7 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=BhaoXNk7gXQA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=dc4VICSrPZJHsbjF4L0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_151234_211556_AD372520 
X-CRM114-Status: GOOD (  29.01  )
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

SGksDQoNCk9uIEZyaSwgMjAyNi0wNy0wMyBhdCAxMjoxNSArMDIwMCwgTWlxdWVsIFJheW5hbCB3
cm90ZToNCj4gT24gMDMvMDcvMjAyNiBhdCAwNzo0NTo1NiArMDIsIFJpY2hhcmQgV2VpbmJlcmdl
ciA8cmljaGFyZEBub2QuYXQ+DQo+IHdyb3RlOg0KPiANCj4gPiAtLS0tLSBVcnNwcsO8bmdsaWNo
ZSBNYWlsIC0tLS0tDQo+ID4gPiBWb246ICJSb25hbiBEYWx0b24iIDxSb25hbi5EYWx0b25AYWxs
aWVkdGVsZXNpcy5jby5uej4NCj4gPiA+IE9uIFRodSwgMjAyNi0wNy0wMiBhdCAwNzozOSArMDIw
MCwgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3RlOg0KPiA+ID4gPiBEbyB5b3UgcmVhbGx5IG5lZWQg
KFBPU0lYKSBmaWxlIHN5c3RlbSBzZW1hbnRpY3M/DQo+ID4gPiA+IFlvdSBjb3VsZCBwYXJ0aXRp
b24gdGhlIEZSQU0gaW50byBjZWxscyBhbmQgdGhlbiB3b3JrIHdpdGgNCj4gPiA+ID4gdGhlbS4N
Cj4gPiA+ID4gZS5nLiBKdXN0IGRkIGludG8gaXQgYW5kIGVyYXNlIGl0IHdoZW4gbmVlZGVkLi4u
DQo+ID4gPiA+IE1heWJlIHRoZSBOVk1FTSBjZWxscyBtZWNoYW5pc20gbmVlZHMgc29tZSBwb2xp
c2hpbmcgYnV0IHRoaXMNCj4gPiA+ID4gc291bmRzDQo+ID4gPiA+IHJlYXNvbmFibGUgdG8gbWUu
DQo+ID4gPiANCj4gPiA+IFllcywgdGhhdCBjb3VsZCB3b3JrIGZvciBzZWNyZXRzIHN0b3JhZ2Uu
IEhvd2V2ZXIgd2UgYWxzbyBzdG9yZQ0KPiA+ID4gcGVyc2lzdGVudCBsb2dzIGFuZCBESENQIGxl
YXNlcyBvbiB0aGlzIGZsYXNoIHRvIG1pbmltaXplDQo+ID4gPiByZWFkL3dyaXRlcw0KPiA+ID4g
b24gdGhlIG1haW4gZmxhc2gsIGFuZCB0aGlzIGRhdGEgaXMgc3RvcmVkIGFzIGZpbGVzIG9mIHZh
cnlpbmcNCj4gPiA+IGxlbmd0aHMuDQo+ID4gPiBBIGZpbGVzeXN0ZW0gcHJvdmlkZXMgdGhlIG1v
c3Qgc3RyYWlnaHRmb3J3YXJkIHdheSBvZiBzdG9yaW5nDQo+ID4gPiB0aGlzIGRhdGENCj4gPiA+
IGZvciB1cy4NCj4gPiANCj4gPiBCdXQgdGhlIHN0b3JhZ2UgKEZSQU0pIHlvdSBjaG9zZSBpcyBu
b3Qgc3VpdGFibGUgZm9yIGFueSByZWFsDQo+ID4gZmlsZXN5c3RlbS4NCj4gPiBJbiBhIHByZXZp
b3VzIG1haWwgeW91IHNhaWQgeW91IHVzZSBleHQyIG9uIGl0Lg0KPiA+IEkgaGF2ZSBhIGhhcmQg
dGltZSB0byBzZWUgaG93IHVzaW5nIGV4dDIgb24gdG9wIG9mIG10ZGJsb2NrIG9uIGFuDQo+ID4g
RlJBTQ0KPiA+IGRvZXMgbm90IGVuZCBpbiBhIGRpc2FzdGVyLg0KPiA+IA0KPiA+ID4gVGhhdCdz
IG5vdCB0byBzYXkgd2UgY291bGRuJ3QgZGV2ZWxvcCBzb21lIHN5c3RlbSBvZiB1c2luZyB0aGUN
Cj4gPiA+IG52bWVtDQo+ID4gPiBkZXZpY2UgYXMgYSBiYWNrZW5kIGZvciB0aGlzIGRhdGEuIFRo
aXMgbWF5IGJlIHNvbWV0aGluZyB3ZSBsb29rDQo+ID4gPiBhdCBpbg0KPiA+ID4gdGhlIGZ1dHVy
ZS4NCj4gPiANCj4gPiBNYXliZSBGVVNFIGNhbiBoZWxwIHdpdGggYnVpbGRpbmcgYSBzdXBlciBz
aW1wbGUgZmlsZXN5c3RlbSB3aGljaA0KPiA+IHByb3ZpZGVzDQo+ID4ganVzdCBlbm91Z2ggdG8g
ZnVsZmlsbCB5b3VyIHVzZSBjYXNlLg0KPiANCj4gVGhlIE5WTUVNIGNlbGxzIG1lY2hhbmlzbSBp
cyB2ZXJ5IGZsZXhpYmxlIG5vdyB3aXRoIGxheW91dHMuIFdlIGRvDQo+IGhhdmUNCj4gc3VwcG9y
dCBmb3IgT05JRSBUeXBlLUxlbmd0aC1WYXJpYWJsZSB0YWJsZXMgYXMgd2VsbCBhcyBhbiBleGFt
cGxlIG9mDQo+IHN1cHBvcnQgZm9yIHRoZSBlbnZpcm9ubWVudCB2YXJpYWJsZXMgaW4gVS1Cb290
LiBJZiB5b3UgZm9ybWF0IHZlcnkNCj4gc2xpZ2h0bHkgeW91ciBkYXRhIHlvdSBjYW4gdmVyeSBl
YXNpbHkgZXhwb3NlIGF1dG9tYXRpY2FsbHkgb25lIGNlbGwNCj4gcGVyDQo+IGluZm9ybWF0aW9u
IHdpdGggYSByYXRoZXIgc2ltcGxlIE5WTUVNIGxheW91dCBkcml2ZXIgYW5kIGNvbnN1bWUgaXQN
Cj4gdGhpcw0KPiB3YXkuDQo+IA0KPiBUaGFua3MsDQo+IE1pcXXDqGwNCg0KVGhhbmtzIGZvciB5
b3VyIHN1Z2dlc3Rpb25zLiBXZSdsbCBjb25zaWRlciBhZGFwdGluZyBvdXIgaW1wbGVtZW50YXRp
b24NCmJhc2VkIG9uIHRoaXMgaW5mb3JtYXRpb24uDQoNClJlZ2FyZHMsDQpSb25hbi4NCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
