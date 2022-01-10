Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C53C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jan 2022 15:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JzwYNL+fgCdb9QtrlyJRMzdPm+Jz9EStRpuWmB8T+3U=; b=Xm2l0+Euo79LZl
	KOBHLYCqoihpWKM9lgrvYsqOXarKubb9Ah5D9t5vxXzDaw/8UIYBr1+1gUeGMqlNxUGTi1KeWnZNT
	VEccM+51SltwYrPbm7mfSOCQguQcJHJAEuGDE+mJjn7c4iADF081ZrrMKhggKhroRNOkhEN1tsF/b
	5jKXTR74kWnTPcj+qr1a7vqYsA9PaqgzWBRpmgK05XHAcfS4qhOHvnmX/rQgJvFXB9d05eIvEswYH
	V+h8p9xECgZLaIIevTzUJ+by5HkW2v65p4FjN1VPMP3b3hY8UhUXAxDKfP7xyfVJpSLz5KXHp+1n+
	XZX5+CGI7ETReQ7zfZpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6wAs-00BxTZ-2V; Mon, 10 Jan 2022 15:01:30 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6wAg-00BxP8-9i
 for linux-mtd@lists.infradead.org; Mon, 10 Jan 2022 15:01:20 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 3A7CB1C000B;
 Mon, 10 Jan 2022 15:01:14 +0000 (UTC)
Date: Mon, 10 Jan 2022 16:01:13 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, MTD Maling List
 <linux-mtd@lists.infradead.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] mtd: Introduce an expert mode for forensics and
 debugging purposes
Message-ID: <20220110160113.751eda38@xps13>
In-Reply-To: <CAMuHMdVgAnfLTkbb7GP2BZMAOtwBkjn9Knfupie5Kpaq=rOcOA@mail.gmail.com>
References: <20211118114659.1282855-1-miquel.raynal@bootlin.com>
 <CAMuHMdVnOdvEbiiQcdZHdVkz1YAj-kgZp_nw4jqb6Z5=KeM=uw@mail.gmail.com>
 <20220110154107.1744c5ea@xps13>
 <CAMuHMdVgAnfLTkbb7GP2BZMAOtwBkjn9Knfupie5Kpaq=rOcOA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_070118_504918_7CAD1D8D 
X-CRM114-Status: GOOD (  22.37  )
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

SGkgR2VlcnQsCgpnZWVydEBsaW51eC1tNjhrLm9yZyB3cm90ZSBvbiBNb24sIDEwIEphbiAyMDIy
IDE1OjU3OjQ5ICswMTAwOgoKPiBIaSBNaXF1w6hsLAo+IAo+IE9uIE1vbiwgSmFuIDEwLCAyMDIy
IGF0IDM6NDEgUE0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3Jv
dGU6Cj4gPiBnZWVydEBsaW51eC1tNjhrLm9yZyB3cm90ZSBvbiBNb24sIDEwIEphbiAyMDIyIDE0
OjE1OjI3ICswMTAwOiAgCj4gPiA+IE9uIFRodSwgTm92IDE4LCAyMDIxIGF0IDEyOjQ3IFBNIE1p
cXVlbCBSYXluYWwKPiA+ID4gPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOiAgCj4g
PiA+ID4gV2hlbiBkZXZlbG9wcGluZyBOQU5EIGNvbnRyb2xsZXIgZHJpdmVycyBvciB3aGVuIGRl
YnVnZ2luZyBmaWxlc3lzdGVtCj4gPiA+ID4gY29ycnVwdGlvbnMsIGl0IGlzIHF1aXRlIGNvbW1v
biB0byBuZWVkIGhhY2tpbmcgbG9jYWxseSBpbnRvIHRoZQo+ID4gPiA+IE1URC9OQU5EIGNvcmUg
aW4gb3JkZXIgdG8gZ2V0IGFjY2VzcyB0byB0aGUgY29udGVudCBvZiB0aGUgYmFkCj4gPiA+ID4g
YmxvY2tzLiBJbnN0ZWFkIG9mIGhhdmluZyBtdWx0aXBsZSBpbXBsZW1lbnRhdGlvbnMgb3V0IHRo
ZXJlIGxldCdzCj4gPiA+ID4gcHJvdmlkZSBhIHNpbXBsZSB5ZXQgZWZmZWN0aXZlIHNwZWNpZmlj
IE1URC13aWRlIGRlYnVnZnMgZW50cnkgdG8gZnVsbHkKPiA+ID4gPiBkaXNhYmxlIHRoZXNlIGNo
ZWNrcyBvbiBwdXJwb3NlLgo+ID4gPiA+Cj4gPiA+ID4gQSB3YXJuaW5nIGlzIGFkZGVkIHRvIGlu
Zm9ybSB0aGUgdXNlciB3aGVuIHRoaXMgbW9kZSBnZXRzIGVuYWJsZWQuCj4gPiA+ID4KPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29t
PiAgCj4gPiA+Cj4gPiA+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCwgd2hpY2ggaXMgbm93IGNvbW1p
dCA2N2I5NjdkZGQ5M2QwZWQ1ICgibXRkOgo+ID4gPiBJbnRyb2R1Y2UgYW4gZXhwZXJ0IG1vZGUg
Zm9yIGZvcmVuc2ljcyBhbmQgZGVidWdnaW5nIHB1cnBvc2VzIikKPiA+ID4gaW4gbXRkL25leHQu
ICAKPiA+Cj4gPiBUaGFua3MgZm9yIHJldmlld2luZyEgVW5mb3J0dW5hdGVseSBJJ3ZlIHNlbnQg
dGhlIE1URCBwdWxsLXJlcXVlc3QgdG8KPiA+IExpbnVzIHRoaXMgbW9ybmluZyBzbyBJJ2xsIGhh
dmUgdG8gYWRkcmVzcyB0aGlzIGluIHN1YnNlcXVlbnQKPiA+IGNvbW1pdHMuICAKPiAKPiBOcCwg
YXMgbG9uZyBhcyBubyBvdXQtb2YtdHJlZSBtb2R1bGVzIHN0YXJ0IHVzaW5nIHRoZXNlIHN5bWJv
bHMgOy0pCj4gCj4gVGhpcyBpcyBqdXN0IG9uZSBvZiB0aGUgdGhpbmdzIEkgbm90aWNlZCByaWdo
dCBiZWZvcmUgdGhlIFhtYXMgYW5kCj4gTlkgaG9saWRheXMsIGJ1dCBkaWRuJ3QgZ2V0IHRvIHJl
cG9ydGluZyBvciBmaXhpbmcgYmVmb3JlLi4uCgpCVFcgaWYgeW91IHdhbnQgdG8gY29udHJpYnV0
ZSB0aGlzIGNoYW5nZSB5b3UncmUgd2VsY29tZSwgb3RoZXJ3aXNlCkknbGwgZG8gaXQgd2hlbiBJ
IGhhdmUgYSBiaXQgb2YgdGltZS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
