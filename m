Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F31EB64D7
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jun 2023 08:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tkx/GDdl0IHERYb7RQ/pD7L5jalf/SnNbxSrw6v44Pg=; b=wfuuaMnXppH+mg
	/Qoxd9uZgxgUzpw2ASuIzM5D7GWIWvnhnTl6MHsbwMnwy7i6guYeGv7/cQjACJvDDH5gfJSWTFpb9
	/+1VWlImOYUadMU5C88dDmesEDIyxDdCh1lgAsYXNE/+t8qi7Cv/9ilgjMnJs6OxSUEdTFnjI4Rck
	+Zq7cdvrXXlU53GPI217x9EdxGPc2IY9160+uUMz7sw3jN47VKgp6IpE/QxJbnii2JGGDkrUpI1s1
	jG/4zcSwmhSI9SpGyjwc+5y6bO1usmOahppBUtmQokYyA9j7B9e5OliI29834gmZTK6FmB+AqP3NV
	EhTZrfC4TJYd0snR0DzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA53z-00HJIg-1u;
	Fri, 16 Jun 2023 08:44:11 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA53v-00HJFb-29;
	Fri, 16 Jun 2023 08:44:09 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686905044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=124xCR73FJ7My9bUcYqnyZtkRBH/lUy5drQixPZ+QjI=;
	b=dCZABiwoUuGPAgpnhhcFhWhfm2UmADaqppObF3tQyWgbT2m7C6UrA8VZy5IN9GJ8/Ym67M
	b1eJaMQBaTKSUIMnFnAWpAmqH4t6WqZXsPidzUx5nBGwVATHF9TQWNZz5OgUGiTNkHa615
	MNo0ba7YmnaW/rhDYtTNse0K3k9ObZKY7ckjm7XpAW42rzreBR2SSsxpQiExTGtbDJbyOX
	Of+UP+5MYlP2Pp/DO8KEjC/0r+2ayKg4qLmpF4jsPlscRvOgyoZ7mnh/QGD7K6Yw9Gxb6R
	pnQb+At8OL6MkMe9/iwgzFUpSK5noRNyUbzH3K6pPBwJeqKu/ClNixEyI9FFxw==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B13D1BF203;
	Fri, 16 Jun 2023 08:44:01 +0000 (UTC)
Date: Fri, 16 Jun 2023 10:44:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>, "richard@nod.at"
 <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "andrew@lunn.ch" <andrew@lunn.ch>,
 "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
 "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Vadym Kochan
 <vadym.kochan@plvision.eu>
Subject: Re: [PATCH v9 3/3] dt-bindings: mtd: marvell-nand: Convert to YAML
 DT scheme
Message-ID: <20230616104401.5ca2b4de@xps-13>
In-Reply-To: <29a9f4a4-b205-d341-bc34-10829af2996a@linaro.org>
References: <20230615040447.3484564-1-chris.packham@alliedtelesis.co.nz>
	<20230615040447.3484564-4-chris.packham@alliedtelesis.co.nz>
	<f16e742f-e6f2-9761-e70d-e0e7cadcba4a@linaro.org>
	<1863cd53-9846-def2-ee5f-f4a51160ed8d@alliedtelesis.co.nz>
	<781c1db2-ecca-901a-4e11-7f7c68cf744d@linaro.org>
	<20230616102414.222dde21@xps-13>
	<29a9f4a4-b205-d341-bc34-10829af2996a@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_014407_965919_482D939B 
X-CRM114-Status: GOOD (  19.07  )
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

SGkgS3J6eXN6dG9mLAoKa3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnIHdyb3RlIG9uIEZy
aSwgMTYgSnVuIDIwMjMgMTA6Mzg6MzggKzAyMDA6Cgo+IE9uIDE2LzA2LzIwMjMgMTA6MjQsIE1p
cXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBLcnp5c3p0b2YsCj4gPiAKPiA+IGtyenlzenRvZi5r
b3psb3dza2lAbGluYXJvLm9yZyB3cm90ZSBvbiBGcmksIDE2IEp1biAyMDIzIDEwOjE1OjMxICsw
MjAwOgo+ID4gICAKPiA+PiBPbiAxNS8wNi8yMDIzIDIzOjA2LCBDaHJpcyBQYWNraGFtIHdyb3Rl
OiAgCj4gPj4+PiAgICAKPiA+Pj4+PiArCj4gPj4+Pj4gK3Byb3BlcnRpZXM6Cj4gPj4+Pj4gKyAg
Y29tcGF0aWJsZToKPiA+Pj4+PiArICAgIG9uZU9mOgo+ID4+Pj4+ICsgICAgICAtIGl0ZW1zOgo+
ID4+Pj4+ICsgICAgICAgICAgLSBjb25zdDogbWFydmVsbCxhcm1hZGEtOGstbmFuZC1jb250cm9s
bGVyCj4gPj4+Pj4gKyAgICAgICAgICAtIGNvbnN0OiBtYXJ2ZWxsLGFybWFkYTM3MC1uYW5kLWNv
bnRyb2xsZXIKPiA+Pj4+PiArICAgICAgLSBlbnVtOgo+ID4+Pj4+ICsgICAgICAgICAgLSBtYXJ2
ZWxsLGFybWFkYS04ay1uYW5kLWNvbnRyb2xsZXIgICAgCj4gPj4+PiBUaGlzIGlzIHdyb25nLiA4
ayBjYW5ub3QgYmUgYm90aDogY29tcGF0aWJsZSBhbmQgbm90IGNvbXBhdGlibGUgd2l0aAo+ID4+
Pj4gMzcwLiBJdCdzIG5vdCBzb21lb25lJ3MgY2F0IHRvIGJlIGluIGJvdGggc3RhdGVzIGF0IHRo
ZSBzYW1lIHRpbWUuLi4gICAgCj4gPj4+Cj4gPj4+IFRoZSBjb3JyZWN0IHN0YXRlIChJTUhPLCBN
aXF1ZWwgY29ycmVjdCBtZSBpZiBJJ20gd3JvbmcpIGlzIGBjb21wYXRpYmxlIAo+ID4+PiA9ICJt
YXJ2ZWxsLGFybWFkYS04ay1uYW5kLWNvbnRyb2xsZXIiO2DCoCBhcyB0aGVyZSBhcmUgc29tZSA4
SyBzcGVjaWZpYyAKPiA+Pj4gcmVxdWlyZW1lbnRzIHRoYXQgYXJlbid0IHByZXNlbnQgb24gdGhl
IDM3MCAoc3BlY2lmaWNhbGx5IHRoZSAKPiA+Pj4gc3lzdGVtLWNvbnRyb2xsZXIgYW5kIHRoZSAy
bmQgY2xvY2spLiAgICAgCj4gPj4KPiA+PiBQcmVzZW5jZSBvZiBzcGVjaWZpYyByZXF1aXJlbWVu
dHMgZG9lcyBub3QgaW52YWxpZGF0ZSBjb21wYXRpYmlsaXR5LiBUd28KPiA+PiBkZXZpY2VzIGFy
ZSBjb21wYXRpYmxlIGlmIHRoZSA4ayBjYW4gYmluZCBhbmQgd29yayB3aXRoIDM3MCBjb21wYXRp
YmxlCj4gPj4gc3RyaW5nLCBldmVuIGlmIHRoaXMgbWVhbnMgc29tZSBsb3dlciBwZXJmb3JtYW5j
ZSBvciBsZXNzIGZlYXR1cmVzIChlLmcuCj4gPj4gc3Vic2V0IG9mIGZlYXR1cmVzKS4gIAo+ID4g
Cj4gPiBRdW90aW5nIG15c2VsZiBmcm9tIDIwMTkgKGNvbW1lbnQgaW4gdGhlIGRyaXZlcik6Cj4g
PiAiU29tZSBTb0NzIGxpa2UgQTdrL0E4ayBuZWVkIHRvIGVuYWJsZSBtYW51YWxseSB0aGUgTkFO
RCBjb250cm9sbGVyLAo+ID4gZ2F0ZWQgY2xvY2tzIGFuZCByZXNldCBiaXRzIHRvIGF2b2lkIGJl
aW5nIGJvb3Rsb2FkZXIgZGVwZW5kZW50LiIKPiA+IAo+ID4gU28gY2FuIHRoZSA4ayBjb250cm9s
bGVyIHdvcmsgdXNpbmcgYSAzNzAgY29tcGF0aWJsZSA6IHllcywgaWYgdGhlCj4gPiBib29sb2Fk
ZXIgZW5hYmxlZCB0aGUgTkFORCBjb250cm9sbGVyIGFscmVhZHksIG5vIG90aGVyd2lzZS4gQnV0
IGluCj4gPiBwcmFjdGljZSBpdCBpcyB0aGUgc2FtZSBjb250cm9sbGVyLgo+ID4gCj4gPiBHaXZl
biB0aGlzIGluZm9ybWF0aW9uIEkgZG9uJ3Qga25vdyB3aGV0aGVyIGl0IG1ha2VzIHNlbnNlIHRv
IHF1YWxpZnkKPiA+IHRoZSA4ayBjb250cm9sbGVyIGNvbXBhdGlibGUgd2l0aCB0aGUgMzcwIGNv
bXBhdGlibGUgb3Igbm90LiAgCj4gCj4gSW5kZWVkLCBhIGJpdCB0cmlja3kgZGVjaXNpb24uIEZv
ciBtZSB0aGV5IGNvdWxkIHN0YXkgY29tcGF0aWJsZSwKPiBiZWNhdXNlIGFwcGFyZW50bHkgcHJv
Z3JhbW1pbmcgbW9kZWwgaXMgdGhlIHNhbWUgb3Igc2ltaWxhci4KCkFncmVlZCwgdGhlIHByb2dy
YW1taW5nIG1vZGVsIHdydCB0aGUgY29udHJvbGxlciBpdHNlbGYgaXMgdGhlIHNhbWUuIFNvCndl
IHdpbGwgZXhwZWN0IDhrIGNvbnRyb2xsZXJzIHRvIGJlIGRlc2NyaWJlZCB3aXRoIGJvdGggOGsg
YW5kIDM3MApjb21wYXRpYmxlIHN0cmluZ3MgdGhlbi4KClRoYW5rcyBmb3IgeW91ciBmZWVkYmFj
ay4KCkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
