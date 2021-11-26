Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07E3C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Nov 2021 12:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=08lWiA23RTV4w97zYj+BydUiAXzqjCRtHagmxRjOaHs=; b=v+6WMy8voXw979
	n3iNzKWhJVC74Fc29jk7GCq/SXDDUbv3FIQPWM675anM4aNSzFDoClsK/2MDMw8yEM7COLdrnyW9o
	tbhDU+8+o22pMYp7DV7tvbxMrMt9SQniVtZXbXJIG1IeYPhdS5bGo1+nTnZuTC9vHWFOK7C19mSQw
	c2hhJdK6JQoZ1mvXR7Gwgyv1rNUGoNGvAQBNrBmPxKyptVYUOjVWskPTNeDo4BjoU+wWFCkKrGtMU
	jqn1ssiesDhwRL3cpCxJEIELSg9ZtDRxTNW04fCbQWXWSIifRwjBOiuFSFvURlbUcp+TuHK/oJVsA
	JTGiZxYAx8Dysy8EJR3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqa6V-00AJ9y-TF; Fri, 26 Nov 2021 12:13:24 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqZgu-00AD9W-FY; Fri, 26 Nov 2021 11:47:00 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 924821C0010;
 Fri, 26 Nov 2021 11:46:50 +0000 (UTC)
Date: Fri, 26 Nov 2021 12:46:49 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, MTD Maling List
 <linux-mtd@lists.infradead.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Jimmy Lalande <jimmy.lalande@se.com>, Milan
 Stevanovic <milan.stevanovic@se.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Gareth Williams
 <gareth.williams.jx@renesas.com>
Subject: Re: [PATCH 1/3] dt-bindings: mtd: rzn1: Describe Renesas RZ/N1 NAND
 controller
Message-ID: <20211126124649.498366ee@xps13>
In-Reply-To: <CAMuHMdU_uJv2dUk21DKJnLSUErhvObOb1wJOZTqv_UXZ0edRBQ@mail.gmail.com>
References: <20211118111940.1275351-1-miquel.raynal@bootlin.com>
 <20211118111940.1275351-2-miquel.raynal@bootlin.com>
 <CAMuHMdXi0PPXjH_hHxO1-Lz9fupe4oo936ENe9DzMW8Sb1G6mg@mail.gmail.com>
 <20211119101907.2ce429e6@xps13>
 <CAMuHMdU_uJv2dUk21DKJnLSUErhvObOb1wJOZTqv_UXZ0edRBQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_034656_701513_6E6135D2 
X-CRM114-Status: GOOD (  24.21  )
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

SGkgR2VlcnQsCgpnZWVydEBsaW51eC1tNjhrLm9yZyB3cm90ZSBvbiBGcmksIDE5IE5vdiAyMDIx
IDEwOjM2OjE2ICswMTAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24gRnJpLCBOb3YgMTksIDIwMjEg
YXQgMTA6MTkgQU0gTWlxdWVsIFJheW5hbAo+IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3
cm90ZToKPiA+IGdlZXJ0QGxpbnV4LW02OGsub3JnIHdyb3RlIG9uIEZyaSwgMTkgTm92IDIwMjEg
MDk6NDE6MzUgKzAxMDA6ICAKPiA+ID4gT24gVGh1LCBOb3YgMTgsIDIwMjEgYXQgMTI6MTkgUE0g
TWlxdWVsIFJheW5hbAo+ID4gPiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6ICAK
PiA+ID4gPiBBZGQgYSBZYW1sIGRlc2NyaXB0aW9uIGZvciB0aGlzIFJlbmVzYXMgTkFORCBjb250
cm9sbGVyIGJpbmRpbmdzLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gIAo+IAo+ID4gPiA+IC0tLSAvZGV2L251
bGwKPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Jl
bmVzYXMscjlhMDZnMDMyLW5hbmQtY29udHJvbGxlci55YW1sCj4gPiA+ID4gQEAgLTAsMCArMSw2
MCBAQAo+ID4gPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9S
IEJTRC0yLUNsYXVzZSkKPiA+ID4gPiArJVlBTUwgMS4yCj4gPiA+ID4gKy0tLQo+ID4gPiA+ICsk
aWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL210ZC9yZW5lc2FzLHI5YTA2ZzAzMi1u
YW5kLWNvbnRyb2xsZXIueWFtbCMKPiA+ID4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUu
b3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gPiA+ID4gKwo+ID4gPiA+ICt0aXRsZTogUmVu
ZXNhcyBSWi9OMXggTkFORCBmbGFzaCBjb250cm9sbGVyIGRldmljZSB0cmVlIGJpbmRpbmdzCj4g
PiA+ID4gKwo+ID4gPiA+ICttYWludGFpbmVyczoKPiA+ID4gPiArICAtIE1pcXVlbCBSYXluYWwg
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPiA+ID4gKwo+ID4gPiA+ICthbGxPZjoKPiA+
ID4gPiArICAtICRyZWY6ICJuYW5kLWNvbnRyb2xsZXIueWFtbCIKPiA+ID4gPiArCj4gPiA+ID4g
K3Byb3BlcnRpZXM6Cj4gPiA+ID4gKyAgY29tcGF0aWJsZToKPiA+ID4gPiArICAgIGNvbnN0OiBy
ZW5lc2FzLHI5YTA2ZzAzMi1uYW5kLWNvbnRyb2xsZXIgIAo+ID4gPgo+ID4gPiBBcyB0aGUgTkFO
RCBGbGFzaCBDb250cm9sbGVyIGlzIHByZXNlbnQgb24gYWxsIG9mIFJaL04xRCwgUlovTjFTLAo+
ID4gPiBhbmQgUlovTjFMLCBJIHRoaW5rIHlvdSBzaG91bGQgYWRkIGEgZmFtaWx5LXNwZWNpZmlj
IGNvbXBhdGlibGUgdmFsdWUKPiA+ID4gInJlbmVzYXMscnpuMS1uYW5kLWNvbnRyb2xsZXIiIGFz
IGEgZmFsbGJhY2suICAKPiA+Cj4gPiBJIHNlZSwgdGhhdCdzIHJpZ2h0LCBJIHNob3VsZCBoYXZl
IGFkZGVkIHR3byBjb21wYXRpYmxlcy4KPiA+Cj4gPiBBcyB0aGVyZSBpcyBjdXJyZW50bHkgb25s
eSBvbmUgJ3NwZWNpZmljJyBjb21wYXRpYmxlIChyOWF4eHgpLCBzaG91bGQgSQo+ID4gZGVzY3Jp
YmUgdGhlIHR3byBjb21wYXRpYmxlcyBhcyBiZWluZyBtYW5kYXRvcnk/IE9yIHNob3VsZCBJIHNl
dCB0aGUKPiA+IG1vc3Qgc3BlY2lmaWMgb25lIGFzIG9wdGlvbmFsIGFuZCB0aGUgbGVhc3Qgc3Bl
Y2lmaWMgb25lIChyem4xKQo+ID4gbWFuZGF0b3J5PyAgCj4gCj4gWWVzIHBsZWFzZS4KCkkgYW0g
YSBsaXR0bGUgYml0IGNvbmZ1c2VkIHRvIHdoaWNoIGFuc3dlcmVkIHlvdSBzYWlkIHllcy4KCj4g
IEVsc2UgeW91IG5lZWQgdG8gbWF0Y2ggb24gYm90aCBpbiB0aGUgZHJpdmVyLCBvciB3ZSBjYW5u
b3QKPiBkaWZmZXJlbnRpYXRlIGxhdGVyIGlmIHRoZSBuZWVkIGV2ZXIgYXJpc2VzLgoKSSBiZWxp
ZXZlIHlvdSBtZWFudCAieWVzIHRoZSB0d28gc2hvdWxkIGJlIGRlc2NyaWJlZCBhcyBtYW5kYXRv
cnkgaW4gdGhlCmJpbmRpbmdzIiAoYXQgbGVhc3QgZm9yIG5vdykgc28gdGhhdCB3aGVuIHRoZSBu
ZWVkIGFyaXNlcywgdGhlIG1vc3QKc3BlY2lmaWMgb25lIGNhbiBiZSByZXBsYWNlZCB3aXRoIGEg
b25lT2YgY2hvaWNlLiBBbSBJIHJpZ2h0PwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
