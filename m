Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E91C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 10 May 2022 09:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U8x+ja/Ga+EKkmlrsGIn0sI9373jU1Yd7YLbmuF/F1Q=; b=dptOaHAtEFgFA7
	/GT69DTmNMNqae4E5qQX6QEGvtoykLtOXB0bNwwBm90/bPncpETIGnvlgKrERX46EUx6JVGtakE3+
	jBFJm/h2hkFTjsWCZvxmJYeK3FTIjEixY2LUxk0McJGowTx8ASaktUEtyEchYCP4UlWE2L+Hjy9tZ
	zk/3fvPPpDsIKKJ0xxdR7AnOEqW7suhi65Z31UzzVRvgfM7wn9eiup6lnJixx5A62JZjZhhKltABX
	DCHnCK8d41ZUCBDjFxZmowy77eiuaU0Ki4jU6GdfsjPuNHt9sj4Kh4REXeNfsF8gJidVoIu7eiKR4
	kFFrSfpmXw7mcoIsDOrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noLlt-000jbD-F1; Tue, 10 May 2022 09:03:09 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noLlq-000jaf-3a
 for linux-mtd@lists.infradead.org; Tue, 10 May 2022 09:03:08 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4D96FFF816;
 Tue, 10 May 2022 09:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652173382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kvSmQXPf6d/ybJwRZBOSyK1Ahdihg697cloZ8a3+FlA=;
 b=E6z4yXfFnbe7TIseAnbqONIabiLG0CYFKhWVHeYS0M1qwCCSRQ2HUFKsjdCRucV19Uk9uS
 y5fsn/ZS4PC0euz9ncUrEariqOIOqSRtOtEn/SEyJZEM6SgHCVu+8C8JClHf1/rmXhDjd1
 M1dM/9SMPsbRJ2rTp3lvcdzXwDLulHubTjE9H2dt8fRwgXWU4ukiUoHtf2WGlUXfw7qHAS
 ulaWFGr2WTQs3l5V64iHYYgE1vqBiD/CBEp2vdve6/nwCr+Rgk2oH93LltE7rs9cC5mH90
 kVXGsGDvWkGDowDCmFjS9DH7WGGHqOXhTVFjhcZxc+hPuptrw34VSTP4mSj/hg==
Date: Tue, 10 May 2022 11:02:57 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, MTD Maling List
 <linux-mtd@lists.infradead.org>, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>, Phil Edworthy
 <phil.edworthy@renesas.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Milan Stevanovic
 <milan.stevanovic@se.com>, Jimmy Lalande <jimmy.lalande@se.com>, Pascal
 Eberhard <pascal.eberhard@se.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>,
 Clement Leger <clement.leger@bootlin.com>
Subject: Re: [PATCH v2 2/2] mtd: rawnand: renesas: Use runtime PM instead of
 the raw clock API
Message-ID: <20220510110257.11ac55f1@xps13>
In-Reply-To: <CAMuHMdUQafhSHA6vz2FP4=CLodEB3uK2p2W6fu_xK8kA+pMGFA@mail.gmail.com>
References: <20220509154943.25422-1-miquel.raynal@bootlin.com>
 <20220509154943.25422-3-miquel.raynal@bootlin.com>
 <CAMuHMdUQafhSHA6vz2FP4=CLodEB3uK2p2W6fu_xK8kA+pMGFA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_020306_460254_4865CE53 
X-CRM114-Status: GOOD (  35.37  )
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

SGkgR2VlcnQsCgpnZWVydEBsaW51eC1tNjhrLm9yZyB3cm90ZSBvbiBUdWUsIDEwIE1heSAyMDIy
IDEwOjUyOjQxICswMjAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24gTW9uLCBNYXkgOSwgMjAyMiBh
dCA1OjQ5IFBNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3Rl
Ogo+ID4gVGhpcyBOQU5EIGNvbnRyb2xsZXIgaXMgcGFydCBvZiBhIHdlbGwgZGVmaW5lZCBwb3dl
ciBkb21haW4gaGFuZGxlZCBieQo+ID4gdGhlIHJ1bnRpbWUgUE0gY29yZS4gTGV0J3Mga2VlcCB0
aGUgaGFybW9ueSB3aXRoIHRoZSBvdGhlciBSWi9OMSBkcml2ZXJzCj4gPiBhbmQgZXhjbHVzaXZl
bHkgdXNlIHRoZSBydW50aW1lIFBNIEFQSSB0byBlbmFibGUvZGlzYWJsZSB0aGUgY2xvY2tzLgo+
ID4KPiA+IFdlIHN0aWxsIG5lZWQgdG8gcmV0cmlldmUgdGhlIGV4dGVybmFsIGNsb2NrIHJhdGUg
aW4gb3JkZXIgdG8gZGVyaXZlIHRoZQo+ID4gTkFORCB0aW1pbmdzLCBidXQgdGhhdCBpcyBub3Qg
YSBiaWcgZGVhbCwgd2UgY2FuIHN0aWxsIGRvIHRoYXQgaW4gdGhlCj4gPiBwcm9iZSBhbmQganVz
dCBzYXZlIHRoaXMgdmFsdWUgdG8gcmV1c2UgaXQgbGF0ZXIuCj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gIAo+IAo+IFRoYW5r
cyBmb3IgeW91ciBwYXRjaCEKPiAKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3JlbmVz
YXMtbmFuZC1jb250cm9sbGVyLmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3JlbmVz
YXMtbmFuZC1jb250cm9sbGVyLmMgIAo+IAo+ID4gQEAgLTEzMzUsMjkgKzEzMzYsMTAgQEAgc3Rh
dGljIGludCBybmFuZGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ICAg
ICAgICAgaWYgKElTX0VSUihybmFuZGMtPnJlZ3MpKQo+ID4gICAgICAgICAgICAgICAgIHJldHVy
biBQVFJfRVJSKHJuYW5kYy0+cmVncyk7Cj4gPgo+ID4gLSAgICAgICAvKiBBUEIgY2xvY2sgKi8K
PiA+IC0gICAgICAgcm5hbmRjLT5oY2xrID0gZGV2bV9jbGtfZ2V0KCZwZGV2LT5kZXYsICJoY2xr
Iik7Cj4gPiAtICAgICAgIGlmIChJU19FUlIocm5hbmRjLT5oY2xrKSkKPiA+IC0gICAgICAgICAg
ICAgICByZXR1cm4gUFRSX0VSUihybmFuZGMtPmhjbGspOwo+ID4gLQo+ID4gLSAgICAgICAvKiBF
eHRlcm5hbCBOQU5EIGJ1cyBjbG9jayAqLwo+ID4gLSAgICAgICBybmFuZGMtPmVjbGsgPSBkZXZt
X2Nsa19nZXQoJnBkZXYtPmRldiwgImVjbGsiKTsKPiA+IC0gICAgICAgaWYgKElTX0VSUihybmFu
ZGMtPmVjbGspKQo+ID4gLSAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHJuYW5kYy0+ZWNs
ayk7Cj4gPiAtCj4gPiAtICAgICAgIHJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShybmFuZGMtPmhj
bGspOwo+ID4gLSAgICAgICBpZiAocmV0KQo+ID4gLSAgICAgICAgICAgICAgIHJldHVybiByZXQ7
Cj4gPiAtCj4gPiAtICAgICAgIHJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShybmFuZGMtPmVjbGsp
Owo+ID4gLSAgICAgICBpZiAocmV0KQo+ID4gLSAgICAgICAgICAgICAgIGdvdG8gZGlzYWJsZV9o
Y2xrOwo+ID4gLQo+ID4gICAgICAgICBybmFuZGNfZGlzX2ludGVycnVwdHMocm5hbmRjKTsgIAo+
IAo+IFRoaXMgdG91Y2hlcyB0aGUgaGFyZHdhcmUsIHNvIHRoZSBkZXZpY2UgbXVzdCBiZSBvcGVy
YXRpb25hbC4KPiBIZW5jZSBwbGVhc2UgbW92ZSB0aGUgcG1fcnVudGltZV8qKCkgY2FsbHMgdXAs
IHRvIG1ha2Ugc3VyZSB0aGUgZGV2aWNlCj4gaXMgYWNjZXNzaWJsZS4KPiBTb3JyeSBmb3IgbWlz
c2luZyB0aGF0IGJlZm9yZS4KCk9oIGNyYXAsIEkgbW92ZWQgdGhlIHBtIHJ1bnRpbWUgY2FsbHMg
YmVsb3cgdG8gcmVkdWNlIHRoZSBhbW91bnQgb2YKZXJyb3IgaGFuZGxpbmcgYnV0IEkgY2xlYXJs
eSBvdmVybG9va2VkIHRoYXQgZnVuY3Rpb24gY2FsbCBoZXJlLgogCj4gPiAgICAgICAgIGlycSA9
IHBsYXRmb3JtX2dldF9pcnFfb3B0aW9uYWwocGRldiwgMCk7Cj4gPiAgICAgICAgIGlmIChpcnEg
PT0gLUVQUk9CRV9ERUZFUikgewo+ID4gLSAgICAgICAgICAgICAgIHJldCA9IGlycTsKPiA+IC0g
ICAgICAgICAgICAgICBnb3RvIGRpc2FibGVfZWNsazsKPiA+ICsgICAgICAgICAgICAgICByZXR1
cm4gaXJxOwo+ID4gICAgICAgICB9IGVsc2UgaWYgKGlycSA8IDApIHsKPiA+ICAgICAgICAgICAg
ICAgICBkZXZfaW5mbygmcGRldi0+ZGV2LCAiTm8gSVJRIGZvdW5kLCBmYWxsYmFjayB0byBwb2xs
aW5nXG4iKTsKPiA+ICAgICAgICAgICAgICAgICBybmFuZGMtPnVzZV9wb2xsaW5nID0gdHJ1ZTsK
PiA+IEBAIC0xMzY1LDEyICsxMzQ3LDI3IEBAIHN0YXRpYyBpbnQgcm5hbmRjX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgICAgICAgICAgICAgICAgcmV0ID0gZGV2bV9y
ZXF1ZXN0X2lycSgmcGRldi0+ZGV2LCBpcnEsIHJuYW5kY19pcnFfaGFuZGxlciwgMCwKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJyZW5lc2FzLW5hbmQtY29udHJv
bGxlciIsIHJuYW5kYyk7Cj4gPiAgICAgICAgICAgICAgICAgaWYgKHJldCA8IDApCj4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICBnb3RvIGRpc2FibGVfZWNsazsKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiAgICAgICAgIH0KPiA+Cj4gPiAgICAgICAgIHJldCA9
IGRtYV9zZXRfbWFzaygmcGRldi0+ZGV2LCBETUFfQklUX01BU0soMzIpKTsKPiA+ICAgICAgICAg
aWYgKHJldCkKPiA+IC0gICAgICAgICAgICAgICBnb3RvIGRpc2FibGVfZWNsazsKPiA+ICsgICAg
ICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gKwo+ID4gKyAgICAgICBkZXZtX3BtX3J1bnRpbWVf
ZW5hYmxlKCZwZGV2LT5kZXYpOwo+ID4gKyAgICAgICByZXQgPSBwbV9ydW50aW1lX2dldF9zeW5j
KCZwZGV2LT5kZXYpOwo+ID4gKyAgICAgICBpZiAocmV0IDwgMCkKPiA+ICsgICAgICAgICAgICAg
ICByZXR1cm4gcmV0Owo+ID4gKwo+ID4gKyAgICAgICAvKiBUaGUgZXh0ZXJuYWwgTkFORCBidXMg
Y2xvY2sgcmF0ZSBpcyBuZWVkZWQgZm9yIGNvbXB1dGluZyB0aW1pbmdzICovCj4gPiArICAgICAg
IGVjbGsgPSBjbGtfZ2V0KCZwZGV2LT5kZXYsICJlY2xrIik7Cj4gPiArICAgICAgIGlmIChJU19F
UlIoZWNsaykpIHsKPiA+ICsgICAgICAgICAgICAgICByZXQgPSBQVFJfRVJSKGVjbGspOwo+ID4g
KyAgICAgICAgICAgICAgIGdvdG8gZGlzX3J1bnRpbWVfcG07Cj4gPiArICAgICAgIH0KPiA+ICsK
PiA+ICsgICAgICAgcm5hbmRjLT5leHRfY2xrX3JhdGUgPSBjbGtfZ2V0X3JhdGUoZWNsayk7ICAK
PiAKPiBQZXJzb25hbGx5LCBJIHdvdWxkIGRvIHRoaXMgYmVmb3JlIHJlcXVlc3RpbmcgdGhlIGlu
dGVycnVwdC4KPiBCdXQgSSBndWVzcyBpdCdzIGZpbmUgdG8gZG8gdGhhdCBoZXJlLCB0b28uCgpX
aGF0IGRvIHlvdSBtZWFuIGJ5ICJkbyB0aGlzIj8gSWYgeW91IGFyZSB0YWxraW5nIGFib3V0IGdl
dHRpbmcgdGhlCnJhdGUgb2YgdGhlIGNsb2NrIGl0J3Mgb25seSBuZWVkZWQgd2hlbiBpbml0aWFs
aXppbmcgdGhlIHRpbWluZ3Mgd2hpY2gKaGFwcGVucyBsYXRlciBpbiB0aGUgcHJvYmUgcGF0aCBh
bmQgaGFzIG5vIHJlbGF0aW9uc2hpcCB3aXRoIHRoZQppbnRlcnJ1cHRzIGF0IGFsbC4gQW55d2F5
LCBJIHdpbGwgbW92ZSBhbGwgb2YgdGhhdCBlYXJsaWVyIHNvIHRoYXQgd2UKZG9uJ3QgaGF2ZSBh
IHBvc3NpYmxlIHNpdHVhdGlvbiB3aGVyZSB0aGUgZGV2aWNlIGlzIG5vdCBjbG9ja2VkIHdoZW4K
YWNjZXNzaW5nIGl0LgoKPiAKPiA+ICsgICAgICAgY2xrX3B1dChlY2xrKTsKPiA+Cj4gPiAgICAg
ICAgIHJuYW5kY19jbGVhcl9maWZvKHJuYW5kYyk7Cj4gPiAgCj4gCj4gR3J7b2V0amUsZWV0aW5n
fXMsCj4gCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKPiAKPiAtLQo+IEdlZXJ0IFV5
dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRA
bGludXgtbTY4ay5vcmcKPiAKPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5p
Y2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0Cj4gd2hlbiBJJ20gdGFsa2lu
ZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlr
ZSB0aGF0Lgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFs
ZHMKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
