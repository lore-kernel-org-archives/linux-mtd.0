Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD9FC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 09:20:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E7BE6102A
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 09:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E7BE6102A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2vbDkjBFKAirquQIdArGJyn7RcdHZETdDW/zBvViG+4=; b=T3Jq0UnykuiYq4
	ykVnYoSYgPmWUa3nXX6dikbQamW+ELN5yTKAEyYTQMyVW8YcEpnWFUlEiz2gbweBG6AGsgdd5XviU
	sehRXFGer8wRvpENYfpkJ2y9PVFskI4p8AgjXUs3OZCwyYGNg9Mr7sM8taYSdopf3glkQrv63Jasw
	80tvbl7+UIwSQ9tYgBtVK6e124JTOSzeeQL4QCIDL6zuEFvFshwhW4bsioc5DRLG2EnD6xxXcZXo2
	NojXNkkVt1A2H/CTBYs9gmGe3jpOlNqv+0oxuqOin3UM4kZAuDmnz/3ix8ogYqVgpFijawha57L0d
	JLiCoApnF0op/6Cowbmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo03P-009wQZ-7J; Fri, 19 Nov 2021 09:19:31 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo037-009wM6-30; Fri, 19 Nov 2021 09:19:15 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id B9AF2E0003;
 Fri, 19 Nov 2021 09:19:08 +0000 (UTC)
Date: Fri, 19 Nov 2021 10:19:07 +0100
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
Message-ID: <20211119101907.2ce429e6@xps13>
In-Reply-To: <CAMuHMdXi0PPXjH_hHxO1-Lz9fupe4oo936ENe9DzMW8Sb1G6mg@mail.gmail.com>
References: <20211118111940.1275351-1-miquel.raynal@bootlin.com>
 <20211118111940.1275351-2-miquel.raynal@bootlin.com>
 <CAMuHMdXi0PPXjH_hHxO1-Lz9fupe4oo936ENe9DzMW8Sb1G6mg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_011913_442655_C6C2B11A 
X-CRM114-Status: GOOD (  24.43  )
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
IDA5OjQxOjM1ICswMTAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gQ0MgR2FyZXRoCj4gCj4gT24gVGh1
LCBOb3YgMTgsIDIwMjEgYXQgMTI6MTkgUE0gTWlxdWVsIFJheW5hbAo+IDxtaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tPiB3cm90ZToKPiA+IEFkZCBhIFlhbWwgZGVzY3JpcHRpb24gZm9yIHRoaXMg
UmVuZXNhcyBOQU5EIGNvbnRyb2xsZXIgYmluZGluZ3MuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
TWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gIAo+IAo+IFRoYW5rcyBm
b3IgeW91ciBwYXRjaCEKPiAKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcmVuZXNhcyxyOWEwNmcwMzItbmFuZC1jb250cm9s
bGVyLnlhbWwKPiA+IEBAIC0wLDAgKzEsNjAgQEAKPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiA+ICslWUFNTCAxLjIKPiA+ICst
LS0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL210ZC9yZW5lc2FzLHI5
YTA2ZzAzMi1uYW5kLWNvbnRyb2xsZXIueWFtbCMKPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+ICsKPiA+ICt0aXRsZTogUmVuZXNh
cyBSWi9OMXggTkFORCBmbGFzaCBjb250cm9sbGVyIGRldmljZSB0cmVlIGJpbmRpbmdzCj4gPiAr
Cj4gPiArbWFpbnRhaW5lcnM6Cj4gPiArICAtIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20+Cj4gPiArCj4gPiArYWxsT2Y6Cj4gPiArICAtICRyZWY6ICJuYW5kLWNvbnRy
b2xsZXIueWFtbCIKPiA+ICsKPiA+ICtwcm9wZXJ0aWVzOgo+ID4gKyAgY29tcGF0aWJsZToKPiA+
ICsgICAgY29uc3Q6IHJlbmVzYXMscjlhMDZnMDMyLW5hbmQtY29udHJvbGxlciAgCj4gCj4gQXMg
dGhlIE5BTkQgRmxhc2ggQ29udHJvbGxlciBpcyBwcmVzZW50IG9uIGFsbCBvZiBSWi9OMUQsIFJa
L04xUywKPiBhbmQgUlovTjFMLCBJIHRoaW5rIHlvdSBzaG91bGQgYWRkIGEgZmFtaWx5LXNwZWNp
ZmljIGNvbXBhdGlibGUgdmFsdWUKPiAicmVuZXNhcyxyem4xLW5hbmQtY29udHJvbGxlciIgYXMg
YSBmYWxsYmFjay4KCkkgc2VlLCB0aGF0J3MgcmlnaHQsIEkgc2hvdWxkIGhhdmUgYWRkZWQgdHdv
IGNvbXBhdGlibGVzLgoKQXMgdGhlcmUgaXMgY3VycmVudGx5IG9ubHkgb25lICdzcGVjaWZpYycg
Y29tcGF0aWJsZSAocjlheHh4KSwgc2hvdWxkIEkKZGVzY3JpYmUgdGhlIHR3byBjb21wYXRpYmxl
cyBhcyBiZWluZyBtYW5kYXRvcnk/IE9yIHNob3VsZCBJIHNldCB0aGUKbW9zdCBzcGVjaWZpYyBv
bmUgYXMgb3B0aW9uYWwgYW5kIHRoZSBsZWFzdCBzcGVjaWZpYyBvbmUgKHJ6bjEpCm1hbmRhdG9y
eT8KCkknbGwgdGhlbiByZW5hbWUgdGhlIHlhbWwgZmlsZSwgdGhlIE1BSU5UQUlORVJTIGVudHJ5
IGFuZCB0aGUKY29tcGF0aWJsZSBpbiB0aGUgZHJpdmVyIG9mIGNvdXJzZS4KCj4gPiArZXhhbXBs
ZXM6Cj4gPiArICAtIHwKPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1j
b250cm9sbGVyL2FybS1naWMuaD4KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVy
cnVwdC1jb250cm9sbGVyL2lycS5oPgo+ID4gKwo+ID4gKyAgICBuYW5kLWNvbnRyb2xsZXJANDAx
MDIwMDAgewo+ID4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5YTA2ZzAzMi1uYW5k
LWNvbnRyb2xsZXIiOwo+ID4gKyAgICAgICAgcmVnID0gPDB4NDAxMDIwMDAgMHgyMDAwPjsKPiA+
ICsgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSA1OCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsK
PiA+ICsgICAgICAgIGNsb2NrcyA9IDwmaGNsa19uYW5kPiwgPCZjbGtfbmFuZD47ICAKPiAKPiBU
aGlzIGNsb2NrcyBwcm9wZXJ0eSBpcyBub3QgYmFzZWQgb24gYW4gYWN0dWFsIC5kdHNpLCByaWdo
dD8KCkl0J3Mgbm90IGluZGVlZC4gQXMgc2FpZCBpbiB0aGUgY292ZXIgbGV0dGVyIEkgYW0gZ29p
bmcgdG8gd29yayBvbiB0aGUKY2xvY2sgdHJlZSAobm92LWRlYyAyMDIxKSBiZWNhdXNlIEkgd291
bGQgbGlrZSB0byBoYXZlIHRoaXMgZHJpdmVyIGZ1bGx5Cndvcmtpbmcgb24gYSBtYWlubGluZSBi
YXNlLiBTbyBmYXIgSSB1c2VkIGEgbWl4ZWQgdmVuZG9yL3Vwc3RyZWFtIERUCmp1c3QgdG8gaGF2
ZSBhY2Nlc3MgdG8gdGhlIGNsb2NrcyBhbmQgZm9jdXMgb24gdGhlICdyZWFsJyBmZWF0dXJlIGJ1
dApub3cgdGhhdCBpdCBpcyB3b3JraW5nIEkgYW0gZ29pbmcgdG8gc3dpdGNoIG9uIHRoZSBjbG9j
a3Mgc2lkZQooaG9wZWZ1bGx5IHdpdGggeW91ciBzdXBwb3J0IDopICkuCgo+IAo+ID4gKyAgICAg
ICAgY2xvY2stbmFtZXMgPSAiaGNsayIsICJlY2xrIjsKPiA+ICsgICAgICAgICNhZGRyZXNzLWNl
bGxzID0gPDE+Owo+ID4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4gPiArICAgIH07ICAK
PiAKPiBUaGUgcmVzdCBsb29rcyBnb29kIHRvIG1lLgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3IQoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
