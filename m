Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76C5C678D5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Mar 2023 11:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lFW6T4eytm5QrMwfvZ8UZNX8hr9+Fd70Nh/owa8NFFk=; b=3OnuNvGxK/oOBw
	az1HrGCdxv+qtMFQRWK++fmZJo3D2da+tzixsrYNVaZiv5ByRXAjoFdJWkWD47LwjXoWyjZIv2wZQ
	rkx/pIZidcEXNuFMD3vb48YMCk1hjTkaeKX8yK+L/9dI0D3olXU1gBulY+aRYeqQPVy8lKAGXan/e
	OtzVRtKQYCMpUL9AZpk+TS12MCJ1sCZbHqlPGxrCbQUpX3ECO73UarRvbVMjAyqEF6nDm9CMY2d8T
	wjOcBy5ZNoHgsJasdd+INMCORl8qvNb10pHbbenovP5Ja1aYNYCUpU+qUN9tABGAOGs9oulo5E1v+
	nvMfPaA2ZYLuyB5bbltg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZVP9-00HS7V-4d; Tue, 07 Mar 2023 11:22:51 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZVP5-00HS5n-AT
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2023 11:22:49 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5A544FF805;
	Tue,  7 Mar 2023 11:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678188162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R0hEM7ISBUqXXS/ZqJd+VTykSF0s9BCSq2N153XQuMY=;
	b=RQtVcjTA7kA4faWxb1cyqjsEPHmok7xwmu02vJX+83wq0qxG53hsnnFGx0txkT/FElcN7W
	tLnphAoKc/E8VL7XzXbFlOJ2oNWAiArwU38M4XZlJVBGQeCpfFnS6UJGhpgdLqqcVGU6HK
	0EIQQbThLZ11n79yKqzsysTs82zuVZqCfNDuujd2I0E9gmSgoRlxAEFejY0yvmypuDh3LT
	zv01ydejEWekSzEomsWk6cABvCknE2q84w/VX7yL4PsmRsiCCDGMb2UV96Vh82lLAD80Yb
	A9YzJvNnlT5OQcv1Vg2gtvWGni28yUf8rHGMkpbMS7mQYzmXaUy+qeNxKr3Crw==
Date: Tue, 7 Mar 2023 12:22:40 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: parsers: remove reference to config MTD_NAND_TMIO
Message-ID: <20230307122240.1694501c@xps-13>
In-Reply-To: <CAKXUXMwn8wLBtTru74Mo4D=X6gA-M3b3Zin0L_ugtN9-R2L7-A@mail.gmail.com>
References: <20230307074038.17391-1-lukas.bulwahn@gmail.com>
	<20230307100350.1c0af7b9@xps-13>
	<1e321754-5bdd-4019-8524-2222ee369502@app.fastmail.com>
	<20230307113846.5dab6e66@xps-13>
	<CAKXUXMwn8wLBtTru74Mo4D=X6gA-M3b3Zin0L_ugtN9-R2L7-A@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_032247_643588_D2E52013 
X-CRM114-Status: GOOD (  33.20  )
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

SGkgTHVrYXMsCgpsdWthcy5idWx3YWhuQGdtYWlsLmNvbSB3cm90ZSBvbiBUdWUsIDcgTWFyIDIw
MjMgMTE6NTg6MDcgKzAxMDA6Cgo+IE9uIFR1ZSwgTWFyIDcsIDIwMjMgYXQgMTE6MzjigK9BTSBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+Cj4gPiBI
aSBBcm5kLAo+ID4KPiA+IGFybmRAYXJuZGIuZGUgd3JvdGUgb24gVHVlLCAwNyBNYXIgMjAyMyAx
MToyNjo0OCArMDEwMDoKPiA+ICAKPiA+ID4gT24gVHVlLCBNYXIgNywgMjAyMywgYXQgMTA6MDMs
IE1pcXVlbCBSYXluYWwgd3JvdGU6ICAKPiA+ID4gPiBIaSBMdWthcywKPiA+ID4gPgo+ID4gPiA+
IGx1a2FzLmJ1bHdhaG5AZ21haWwuY29tIHdyb3RlIG9uIFR1ZSwgIDcgTWFyIDIwMjMgMDg6NDA6
MzggKzAxMDA6Cj4gPiA+ID4gIAo+ID4gPiA+PiBDb21taXQgNTY4NDk0ZGI2ODA5ICgibXRkOiBy
ZW1vdmUgdG1pb19uYW5kIGRyaXZlciIpIHJlbW92ZXMgdGhlIGNvbmZpZwo+ID4gPiA+PiBNVERf
TkFORF9UTUlPIGFuZCBpdHMgY29ycmVzcG9uZGluZyBkcml2ZXIuCj4gPiA+ID4+Cj4gPiA+ID4+
IFJlbW92ZSB0aGUgcmVmZXJlbmNlIGluIE1URF9TSEFSUFNMX1BBUlRTIHRvIHRoYXQgcmVtb3Zl
ZCBjb25maWcuCj4gPiA+ID4+Cj4gPiA+ID4+IFNpZ25lZC1vZmYtYnk6IEx1a2FzIEJ1bHdhaG4g
PGx1a2FzLmJ1bHdhaG5AZ21haWwuY29tPgo+ID4gPiA+PiAtLS0KPiA+ID4gPj4gQXJuZCwgcGxl
YXNlIGFjay4KPiA+ID4gPj4gTWlxdWVsLCBwbGVhc2UgcGljayB0aGlzIG1pbm9yIG5vbi11cmdl
bnQgcGF0Y2ggb24gdG9wIG9mIHRoZSBjb21taXQgYWJvdmUuICAKPiA+ID4gPgo+ID4gPiA+IEFj
dHVhbGx5IEkgZ3Vlc3MgdGhlIFNIQVJQU0wgZHJpdmVyIGlzIG5vdCBzZWxlY3RhYmxlIHJpZ2h0
IG5vdywgc28KPiA+ID4gPiB0aGlzIHNob3VsZCBiZSBzZW50IGFzIHBhcnQgb2YgbXkgbmV4dCBm
aXhlcyBQUi4gIAo+ID4gPgo+ID4gPiBJIGRvbid0IHNlZSB3aHkgbm90LCBpdCBqdXN0IGRlcGVu
ZHMgb24gJ0FSQ0hfUFhBfHxDT01QSUxFX1RFU1QnIGFuZAo+ID4gPiBzaG91bGQgd29yayBmaW5l
IHdpdGggQ09ORklHX01BQ0hfU1BJVFogUERBcy4gIAo+ID4KPiA+IFNvcnJ5LCBJIG92ZXJsb29r
ZWQgdGhlIGRpZmYsIGluZGVlZCB0aGVyZSBpcyBub3RoaW5nIGJyb2tlbiwgc28gSSdsbAo+ID4g
cXVldWUgaXQgdG8gbmFuZC9uZXh0LiBJIHRob3VnaHQgTVREX1NIQVJQU0xfUEFSVFMgd2FzIG5v
dCBzZWxlY3RhYmxlCj4gPiBhbnltb3JlIHdpdGhvdXQgQ09NUElMRV9URVNULCB3aGljaCB3b3Vs
ZCBoYXZlIGJlZW4gcHJvYmxlbWF0aWMuCj4gPgo+ID4gRml4ZXMgdGFnIHN0aWxsIHdlbGNvbWUg
dGhvdWdoIDopCj4gPiAgCj4gCj4gQXJuZCdzIGNvbW1pdCBpcyBub3QgYnJva2VuLiBJdCBkb2Vz
IHdoYXQgQXJuZCB3cml0ZXMgaW4gaGlzIGNvbW1pdAo+IG1lc3NhZ2Ugd2hhdCBpdCBzaG91bGQg
ZG8uCj4KPiBBbmQgdGhpcyBwYXRjaCBpcyBqdXN0IGEgY2xlYW4tdXAgdGhhdCByZW1vdmVzIHJl
ZmVyZW5jZXMsIGJ1dCBpdCBpcwo+IGp1c3QgInN0eWxpc3RpYyIgYW5kIHJlZHVjZXMgdGhlIGNv
bXBsZXhpdHkgb2YgS2NvbmZpZyBkZXBlbmRlbmN5Cj4gZGVmaW5pdGlvbnMgZm9yIG5vbi1leGlz
dGluZyBjb25maWcgc3ltYm9scy4gSSBkbyBub3Qgc2VlIHRoYXQgdGhpcwo+IHBhdGNoIGZpeGVz
IEFybmQncyBwYXRjaC4gSXQgaXMganVzdCBhIGNsZWFuLXVwIHdpdGggYSByZWZlcmVuY2UgdG8K
PiBBcm5kJ3MgcGF0Y2ggdG8gdW5kZXJzdGFuZCB3aHkgdGhpcyBjbGVhbiB1cCBjYW4gYmUgZG9u
ZSBub3cuCj4gCj4gSWYgeW91IFJFQUxMWSB3YW50IHRoZSBGaXhlczogdGFnLCBJIGNhbiBzdXJl
IGFkZCBpdC4gQnV0LCBJIGRvIG5vdAo+IGNsYWltIHRoYXQgSSBhbSBmaXhpbmcgYW55dGhpbmcg
aGVyZTsgbm90aGluZyB3YXMgYnJva2VuIGluIHRoZSBmaXJzdAo+IHBsYWNlLiBUaGUgcmVmZXJl
bmNlIHRvIHRoZSBjb21taXQgb2YgaW50ZXJlc3QgaXMgaW4gdGhlIGNvbW1pdAo+IG1lc3NhZ2Us
IGFuZCBhbnlvbmUgY2FuIGZvbGxvdyBvciBleHRyYWN0IHRoZSBpbmZvcm1hdGlvbiBpZiB0aGV5
IGFyZQo+IGludGVyZXN0ZWQuCj4KPiBTbywgcGxlYXNlIGtlZXAgdGhpcyBwYXRjaCBpbiB0aGUg
cXVldWUgZm9yIG5hbmQvbmV4dC4KCldvdywgc28gbXVjaCBhcmd1aW5nIGp1c3QgZm9yIGEgRml4
ZXMgdGFnLgoKSXQgaXMgbm90IGJyb2tlbiwgSSBrbm93LCBidXQgaXQgaXMgc29tZWhvdyBpbmNv
bXBsZXRlIGFzIGl0IGNyZWF0ZXMgYQpzdGFsbGVkIEtjb25maWcgc3ltYm9sLiBBbmQgeW91IGNv
bWUtaW4gYW5kIGZpeCB0aGUgc2l0dWF0aW9uIGJ5CmRyb3BwaW5nIHRoZSByZW1haW5pbmcgc3lt
Ym9sLiBTbyBmb3IgbWUgaXQncyBhIGZpeCwgbm8gbWF0dGVyIGhvdwpkZWVwbHkgYm9ndXMgKG9y
IG5vdCkgdGhlIG9yaWdpbmFsIGNvbW1pdCB3YXMuIEl0J3Mgbm90IGFuIGluc3VsdCwgaXQncwph
IHRhZyB0aGF0IGFsbG93cyBlYXN5IHBhcnNpbmcuIEFueXdheSwgdGhhdCdzIG1lYW5pbmdsZXNz
LiBJJ2xsIHRha2UKaXQgbGlrZSB0aGF0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
