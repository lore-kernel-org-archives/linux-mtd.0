Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C75C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 09:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XtDFvhVw5WBzwHJ4v9owL1bPucuGCliPR4WF0in1/W8=; b=SZ5q6dAawm0gmx
	5jnSi0JggljWiSbRYGwNM9ZGTvZNDN+s/Rn9z/67gbstMrfiUn/L3hcSswIAgECpNZuvZK31tNad6
	FLCEnaZPFvDBKvalqIi1Y8MO6VvT6Ar2zXuHtsUodmb4/2x6H2PFFImctUdNzzRGkQO/5pBhJc9B5
	vVP/3Bm0qPXu+6AASrcxQVBuIxQe5g1tjXr84u3TOIGo9KyvRBzTMtsxRcpF+ytNCpB+jvH7zGp0u
	RDETKSjbSGsPOHPnx9uIn3BRs7sWe21WOHJnqF2SpVS8iJWDLSga7G9u9d2kHRMChkaap/OYCf/hQ
	brQhzuhbzvbYzSH6p9ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOyrH-00FqoK-6d; Tue, 01 Mar 2022 09:31:51 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOyrA-00Fqmj-Lb; Tue, 01 Mar 2022 09:31:49 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 r187-20020a1c2bc4000000b003810e6b192aso989737wmr.1; 
 Tue, 01 Mar 2022 01:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sy/F02kVEbXeVezWzb6kuJ4AfEtj/UKyfYsVzhs1sMA=;
 b=hyTyytxxOk/V0L+ryoArBX3dTP5ehv2ECBD92v2M/VfPfcghtxLPBZMAqDYknGtKQL
 SgPgqKTvcEPSaYITwv5MrEtvCwdL5URXXbtzJsiLCV35cSeaGtyTho+zDtVGM2LhL3ay
 P1dpsbsNNKFYLnCIgfUTkvpdkcAfP8paVozFhFXKFm6/Xswu0nfKs8izKS7yscwizuSO
 IJoHFjNL5G2yoEf1qF7aDIthHCB+DLNXMBM5s+/FpmNpNLnSWFjKQn3Em1Ds++E6+S54
 jYWVF9f1E9gGbZJPD+ekJQ4JDqN19J2YZU7e/lQDPWksokiGENNjQEAMfmMimCIhbaXq
 PCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sy/F02kVEbXeVezWzb6kuJ4AfEtj/UKyfYsVzhs1sMA=;
 b=5QXDgsOV1w6ko9GHHiHwANHyy1YqHbxtwNPpY2On84WlXNbnX50gxONcl6ZNvRcY6S
 +9RbRcol8d/G/EN0i2UHqrH9jesYrRfVpwZXES/aKxRGQdDEiUsFI/G4p2DIkgH8p0yb
 P3Rg0qURRpuZaXtdcLzNpl4QkzJnjBNsHkLuq5e5Bgaw3PS/sGYmTEDOCxuahapuJeyV
 oKu7vrakLdMbKcanFOAvZFRiN8j+Y1KTKqgjYPz3gpZ9jqWDmYVXQCMSFjUmH+6PH0zv
 +0atQuu28hgCqBm84eCW618czSAz6sLHHfa0bbgTqjRjIRK/4UMtmGTxbeEEtZGbI+Ff
 FgIA==
X-Gm-Message-State: AOAM532eAKpZZ2ZvxdBmTCEzc31J9wrhdFVrUt8uyET97w/nFYzLoFpu
 YvOnVoA0xRtNTpJ2/QvQKhqCX4O5eE+msKKLego=
X-Google-Smtp-Source: ABdhPJwawIIUmqteHjrugQRQ869AZXS/VzTalXUXqyda+xSM3TCxODchNBrrHA3h+8xQhACzeSYcl0nG/Wk2hcC0eKI=
X-Received: by 2002:a7b:c5d5:0:b0:37b:fda9:a5e2 with SMTP id
 n21-20020a7bc5d5000000b0037bfda9a5e2mr16412085wmk.62.1646127102659; Tue, 01
 Mar 2022 01:31:42 -0800 (PST)
MIME-Version: 1.0
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
 <20220228134505.203270-5-tudor.ambarus@microchip.com>
 <CAEyMn7Ynym+kMX6Mkj45UHw7LFXKRVMSHa31+NjmQYpD7es7rQ@mail.gmail.com>
 <eda3476b-4724-f957-291e-4232942416af@microchip.com>
In-Reply-To: <eda3476b-4724-f957-291e-4232942416af@microchip.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 1 Mar 2022 10:31:30 +0100
Message-ID: <CAEyMn7a1F4ew4A-wJ2C-bYY32JMtNhjnLUJ9404kN+rFPH-fUw@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L12805D and MX25L12835F
To: Tudor.Ambarus@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_013144_741528_7523989C 
X-CRM114-Status: GOOD (  30.94  )
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
Cc: sr@denx.de, vigneshr@ti.com, jaimeliao@mxic.com.tw, richard@nod.at,
 esben@geanix.com, linux@rasmusvillemoes.dk, knaerzche@gmail.com,
 Nicolas.Ferre@microchip.com, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 macromorgan@hotmail.com, miquel.raynal@bootlin.com, zhengxunli@mxic.com.tw,
 p.yadav@ti.com, mail@david-bauer.net, code@reto-schneider.ch
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVHVkb3IsCgpBbSBEaS4sIDEuIE3DpHJ6IDIwMjIgdW0gMDk6NTIgVWhyIHNjaHJpZWIgPFR1
ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbT46Cj4KPiBPbiAzLzEvMjIgMDk6NTUsIEhlaWtvIFRo
aWVyeSB3cm90ZToKPiA+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQo+ID4KPiA+
IEhpIFR1ZG9yLAo+Cj4gSGkhCj4KPiA+Cj4gPiBBbSBNby4sIDI4LiBGZWIuIDIwMjIgdW0gMTQ6
NDUgVWhyIHNjaHJpZWIgVHVkb3IgQW1iYXJ1cwo+ID4gPHR1ZG9yLmFtYmFydXNAbWljcm9jaGlw
LmNvbT46Cj4gPj4KPiA+PiBNYWNyb25peCBoYXMgYSBiYWQgaGFiYml0IG9mIHJldXNpbmcgZmxh
c2ggSURzLiBXaGlsZSBNWDI1TDEyODM1RiBzdXBwb3J0cwo+ID4+IFJEU0ZEUCBvcGNvZGUsIE1Y
MjVMMTI4MDVEIGRvZXMgbm90LiBHaXZlbiB0aGF0IGl0IGlzIHVubGlrZWx5IHRoYXQgUkRTRkRQ
Cj4gPj4gd2lsbCBjYXVzZSBhbnkgcHJvYmxlbXMgZm9yIHRoZSBvbGQgTVgyNUwxMjgwNUQsIGRp
ZmZlcmVudGlhdGUgYmV0d2VlbiB0aGUKPiA+PiB0d28gZmxhc2hlcyBieSBwYXJzaW5nIFNGRFAu
Cj4gPj4KPiA+PiBjYzogSGVpa28gVGhpZXJ5IDxoZWlrby50aGllcnlAZ21haWwuY29tPgo+ID4+
IFNpZ25lZC1vZmYtYnk6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbWljcm9jaGlwLmNv
bT4KPiA+PiBBY2tlZC1ieTogUHJhdHl1c2ggWWFkYXYgPHAueWFkYXZAdGkuY29tPgo+ID4+IC0t
LQo+ID4+ICMgY2F0IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9zb2NAMC8zMDgwMDAwMC5idXMvMzBi
YjAwMDAuc3BpL3NwaV9tYXN0ZXIvc3BpMC9zcGkwCj4gPj4gLjAvc3BpLW5vci9zZmRwIHwgeHhk
IC1wCj4gPj4gNTM0NjQ0NTAwMDAxMDFmZjAwMDAwMTA5MzAwMDAwZmZjMjAwMDEwNDYwMDAwMGZm
ZmZmZmZmZmZmZmZmCj4gPj4gZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZTUy
MGYxZmZmZmZmZmYwNzQ0ZWIwODZiCj4gPj4gMDgzYjA0YmJmZWZmZmZmZmZmZmYwMGZmZmZmZjQ0
ZWIwYzIwMGY1MjEwZDgwMGZmZmZmZmZmZmZmZmZmCj4gPj4gZmZmZmZmZmZmZmZmMDAzNjAwMjc5
ZGY5YzA2NDg1Y2JmZmZmZmZmZmZmZmYKPiA+Pgo+ID4+ICBkcml2ZXJzL210ZC9zcGktbm9yL21h
Y3Jvbml4LmMgfCAyMyArKysrKysrKysrKysrKysrKysrKysrLQo+ID4+ICAxIGZpbGUgY2hhbmdl
ZCwgMjIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFj
cm9uaXguYwo+ID4+IGluZGV4IDI3NTRiYmVmM2QyZS4uNDVjMmYyYzUwZTU2IDEwMDY0NAo+ID4+
IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYwo+ID4+ICsrKyBiL2RyaXZlcnMv
bXRkL3NwaS1ub3IvbWFjcm9uaXguYwo+ID4+IEBAIC0yNiw2ICsyNiwyNCBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHNwaV9ub3JfZml4dXBzIG14MjVsMzIwNWRfZml4dXBzID0gewo+ID4+ICAgICAg
ICAgLnBvc3RfYmZwdCA9IG14MjVsMzIwNWRfcG9zdF9iZnB0X2ZpeHVwcywKPiA+PiAgfTsKPiA+
Pgo+ID4+ICtzdGF0aWMgaW50IG14MjVsMTI4MDVkX3Bvc3RfYmZwdF9maXh1cHMoc3RydWN0IHNw
aV9ub3IgKm5vciwKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0
cnVjdCBzZmRwX3BhcmFtZXRlcl9oZWFkZXIgKmJmcHRfaGVhZGVyLAo+ID4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IHNmZHBfYmZwdCAqYmZwdCkKPiA+PiAr
ewo+ID4+ICsgICAgICAgLyoKPiA+PiArICAgICAgICAqIE1hY3Jvbml4IGhhcyBhIGJhZCBoYWJp
dCBvZiByZXVzaW5nIGZsYXNoIElEczogTVgyNUwxMjgzNUYgY29sbGlkZXMKPiA+PiArICAgICAg
ICAqIHdpdGggTVgyNUwxMjgwNUQuIE1YMjVMMTI4MzVGIGRlZmluZXMgU0ZEUCB0YWJsZXMsIHdo
aWxlIHRoZSBvbGRlcgo+ID4+ICsgICAgICAgICogdmFyaWFudCBkb2VzIG5vdC4KPiA+PiArICAg
ICAgICAqLwo+ID4+ICsgICAgICAgbm9yLT5uYW1lID0gIm14MjVsMTI4MzVmIjsKPiA+PiArCj4g
Pj4gKyAgICAgICByZXR1cm4gMDsKPiA+PiArfQo+ID4+ICsKPiA+PiArc3RhdGljIGNvbnN0IHN0
cnVjdCBzcGlfbm9yX2ZpeHVwcyBteDI1bDEyODA1ZF9maXh1cHMgPSB7Cj4gPj4gKyAgICAgICAu
cG9zdF9iZnB0ID0gbXgyNWwxMjgwNWRfcG9zdF9iZnB0X2ZpeHVwcywKPiA+PiArfTsKPiA+PiAr
Cj4gPj4gIHN0YXRpYyBpbnQKPiA+PiAgbXgyNWwyNTYzNV9wb3N0X2JmcHRfZml4dXBzKHN0cnVj
dCBzcGlfbm9yICpub3IsCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0
cnVjdCBzZmRwX3BhcmFtZXRlcl9oZWFkZXIgKmJmcHRfaGVhZGVyLAo+ID4+IEBAIC04Miw4ICsx
MDAsMTEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIG1hY3Jvbml4X25vcl9wYXJ0
c1tdID0gewo+ID4+ICAgICAgICAgeyAibXgyNXU2NDM1ZiIsICBJTkZPKDB4YzIyNTM3LCAwLCA2
NCAqIDEwMjQsIDEyOCkKPiA+PiAgICAgICAgICAgICAgICAgTk9fU0ZEUF9GTEFHUyhTRUNUXzRL
KSB9LAo+ID4+ICAgICAgICAgeyAibXgyNWwxMjgwNWQiLCBJTkZPKDB4YzIyMDE4LCAwLCA2NCAq
IDEwMjQsIDI1NikKPiA+PiArICAgICAgICAgICAgICAgLyogSUQgY29sbGlzaW9uIHdpdGggbXgy
NWwxMjgzNWYuICovCj4gPj4gKyAgICAgICAgICAgICAgIFBBUlNFX1NGRFAKPiA+PiAgICAgICAg
ICAgICAgICAgRkxBR1MoU1BJX05PUl9IQVNfTE9DSyB8IFNQSV9OT1JfNEJJVF9CUCkKPiA+PiAt
ICAgICAgICAgICAgICAgTk9fU0ZEUF9GTEFHUyhTRUNUXzRLKSB9LAo+ID4+ICsgICAgICAgICAg
ICAgICBOT19TRkRQX0ZMQUdTKFNFQ1RfNEspCj4gPj4gKyAgICAgICAgICAgICAgIC5maXh1cHMg
PSAmbXgyNWwxMjgwNWRfZml4dXBzIH0sCj4gPj4gICAgICAgICB7ICJteDI1bDEyODU1ZSIsIElO
Rk8oMHhjMjI2MTgsIDAsIDY0ICogMTAyNCwgMjU2KSB9LAo+ID4+ICAgICAgICAgeyAibXgyNXIx
NjM1ZiIsICBJTkZPKDB4YzIyODE1LCAwLCA2NCAqIDEwMjQsICAzMikKPiA+PiAgICAgICAgICAg
ICAgICAgTk9fU0ZEUF9GTEFHUyhTRUNUXzRLIHwgU1BJX05PUl9EVUFMX1JFQUQgfAo+ID4+IC0t
Cj4gPj4gMi4yNS4xCj4gPj4KPiA+Cj4gPiBJIHRyaWVkIHRoaXMgcGF0Y2ggYW5kIHNhdyB0aGF0
IHRoZSBmbGFzaCBpcyBubyBsb25nZXIgZGV0ZWN0ZWQuIEkgZGlkCj4KPiBUaGFua3MhIE5vIGxv
bmdlciBkZXRlY3RlZD8gUmVhZElEIGZhaWxzPyBXaGF0IGRvIHlvdSBnZXQgb24gdGhlIGNvbnNv
bGU/CgpbICAgIDEuNDQyMjI1XSBzcGktbm9yIHNwaTAuMDogQ1I6IHJlYWQgYmFjayB0ZXN0IGZh
aWxlZApbICAgIDEuNDQ1OTc5XSBzcGktbm9yIHNwaTAuMDogcXVhZCBtb2RlIG5vdCBzdXBwb3J0
ZWQKWyAgICAxLjQ0NTk4OV0gc3BpLW5vcjogcHJvYmUgb2Ygc3BpMC4wIGZhaWxlZCB3aXRoIGVy
cm9yIC01Cgo+ID4gc29tZSBkZWJ1Z2dpbmcgYW5kIHNlZSBub3cgdGhhdCB0aGUgY29ycmVjdCBm
dW5jdGlvbiB0byBzZXQgdGhlIHF1YWQKPiA+IG1vZGUgKHNwaV9ub3Jfc3IxX2JpdDZfcXVhZF9l
bmFibGUpIGlzIG5vdCBjYWxsZWQuIEluc3RlYWQgdGhlCj4gPiBzcGlfbm9yX3NyMl9iaXQxX3F1
YWRfZW5hYmxlKCkgaXMgaW52b2tlZC4gRnVydGhlciBkZWJidWdpbmcgc2hvd2VkIG1lCj4gPiB0
aGF0IHRoZSBtYWNyb25peCBzcGVjaWZpYyBmaXh1cCBpcyBub3QgY2FsbGVkLgo+ID4KPgo+IG9r
LCB0aGlzIGJpdCBpcyBjbGVhcgo+Cj4gPiBGb3IgdGhlIGZsYXNoIHRoYXQgZG9lcyBzdXBwb3J0
IFNGRFAgcGFyc2luZyB0aGUKPiA+IHNwaV9ub3JfbWFudWZhY3R1cmVyX2luaXRfcGFyYW1zKCkg
aXMgbm90IGNhbGxlZC4gSXMgdGhhdCBleHBlY3RlZCB0bwo+ID4gYmU/Cj4KPiBZZXMsIEkgd291
bGQgbGlrZSB0byBnZXQgcmlkIG9mIHRoZSBkZWZhdWx0X2luaXQoKSBob29rcyBmb3IgbmV3IGNv
ZGUuCj4gSSdtIGFkZHJlc3NpbmcgaXQgcmlnaHQgbm93LiBXb3VsZCBiZSBnb29kIGlmIHlvdSBj
YW4gaGVscCB0ZXN0aW5nIGl0Lgo+IFdpbGwgYWRkIHlvdSBpbiB0bzoKClllcywgb2YgY291cnNl
LiBNZWFud2hpbGUgSSBmaWd1cmVkIG91dCB0aGF0IHRoZSBTRkRQIG9mIHRoaXMgZmxhc2gKZG9l
cyBub3QgY29udGFpbiB0aGUgcmVxdWlyZWQgdGFibGUgKERXT1JEWzE1XSkgdG8gZmlndXJlIG91
dCB3aGF0CmZ1bmN0aW9uIHNob3VsZCBiZSB1c2VkIGZvciBxdWFkX2VuYWJsZS4KCi0tIApIZWlr
bwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
