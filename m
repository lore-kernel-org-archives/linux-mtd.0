Return-Path: <SRS0=Ia6G=Z2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31DEC3F68F
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Dec 2019 10:18:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A86D52068E
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Dec 2019 10:18:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fp4CA8ih"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A86D52068E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ppmwg1Da7xNqW2qV+MBXjGPBFjElkW5GGkP0jW37/tY=; b=fp4CA8ihu2pVJ5
	y85wC+29o7ZLqrtecG1aCiM0oUF0R3/sGWsZS1RCK9EzdKb1t8ebH48P0TqHGqT5g6VDqjkp01L50
	i4K87we5gy0jRCVnBSQU9ji5DQ1WkilTOS9wCLmTyWEN2PkuuKnyDxxRFoBepUqfGG77OspWum6a5
	yWmB//ftqk8IQJi9mpmLbitgBrrjL4fO1jjHk1+zzKQl6qa1BffclZt9+cLDSHEMS8DaJ6Gclm27c
	QtDiQqnLlFkswzwUMMq5rB9Y6VmHE+ExPdh/iLfzuHzMPp4cd9xdlHBxa+obeMLM6oWXl+5uBbNNF
	BQ+RC1YKBVZuBwRevjng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icRjU-0008Md-K5; Wed, 04 Dec 2019 10:18:08 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icRjR-0008LY-MB
 for linux-mtd@lists.infradead.org; Wed, 04 Dec 2019 10:18:07 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B85C14000B;
 Wed,  4 Dec 2019 10:17:52 +0000 (UTC)
Date: Wed, 4 Dec 2019 11:17:51 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v5 4/4] mtd: Add driver for concatenating devices
Message-ID: <20191204111751.5383b426@xps13>
In-Reply-To: <690065a2-619d-3f97-30c6-5dea76896d78@ti.com>
References: <20191127105522.31445-1-miquel.raynal@bootlin.com>
 <20191127105522.31445-5-miquel.raynal@bootlin.com>
 <690065a2-619d-3f97-30c6-5dea76896d78@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191204_021805_874206_E9265493 
X-CRM114-Status: GOOD (  11.16  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Bernhard Frauendienst <kernel@nospam.obeliks.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVmlnbmVzaCwKClZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4gd3JvdGUg
b24gV2VkLCA0IERlYyAyMDE5IDE1OjI4OjQ2CiswNTMwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24g
MjcvMTEvMTkgNDoyNSBwbSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEludHJvZHVjZSBhIGdl
bmVyaWMgd2F5IHRvIGRlZmluZSBjb25jYXRlbmF0ZWQgTVREIGRldmljZXMuIFRoaXMgbWF5Cj4g
PiBiZSB2ZXJ5IHVzZWZ1bCBpbiB0aGUgY2FzZSBvZiBpZS4gc3RhY2tlZCBTUEktTk9SLiBQYXJ0
aXRpb25zIHRvCj4gPiBjb25jYXRlbmF0ZSBhcmUgZGVzY3JpYmVkIGluIGFuIGFkZGl0aW9uYWwg
cHJvcGVydHkgb2YgdGhlIHBhcnRpdGlvbnMKPiA+IHN1Ym5vZGU6Cj4gPiAKPiA+ICAgICAgICAg
Zmxhc2gwIHsKPiA+ICAgICAgICAgICAgICAgICBwYXJ0aXRpb25zIHsKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZml4ZWQtcGFydGl0aW9ucyI7Cj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICBwYXJ0LWNvbmNhdCA9IDwmZmxhc2gwX3BhcnQxPiwgPCZmbGFzaDFf
cGFydDA+Owo+ID4gCj4gPiAJCQlwYXJ0MEAwIHsKPiA+IAkJCQlsYWJlbCA9ICJwYXJ0MF8wIjsK
PiA+IAkJCQlyZWcgPSA8MHgwIDB4ODAwMDAwPjsKPiA+IAkJCX07Cj4gPiAKPiA+IAkJCWZsYXNo
MF9wYXJ0MTogcGFydDFAODAwMDAwIHsKPiA+IAkJCQlsYWJlbCA9ICJwYXJ0MF8xIjsKPiA+IAkJ
CQlyZWcgPSA8MHg4MDAwMDAgMHg4MDAwMDA+Owo+ID4gCQkJfTsKPiA+ICAgICAgICAgICAgICAg
ICB9Owo+ID4gICAgICAgICB9OyAgCj4gCj4gSUlVQyBmbGFzaDAgYW5kIGZsYXNoMSBhcmUgc3Vi
bm9kZXMgb2YgYSBTUEkgbWFzdGVyIG5vZGU/Cj4gQW5kIEkgYmVsaWV2ZSBmbGFzaDAgbm9kZSdz
IGNvbXBhdGlibGUgaXMgImplZGVjLHNwaS1ub3IiPwoKSW5kZWVkIHRoaXMgaXMgb25lIHBvc3Np
YmlsaXR5IChwcm9iYWJseSB0aGUgbW9zdCBjb21tb24pIGJ1dCBpbiB0aGVvcnkKdGhpcyBzaG91
bGQgd29yayBmb3IgYW55IGtpbmQgb2YgTVREIGRldmljZSwgaGVuY2UgSSB2b2x1bnRhcmlseQpk
cm9wcGVkIHRoZSBoYXJkd2FyZS1zcGVjaWZpYyBwcm9wZXJ0aWVzIHRvIGZvY3VzIG9uIHRoZSBw
YXJ0aXRpb25zCmRlc2NyaXB0aW9uIGhlcmUuCgo+IAo+IAo+ID4gCj4gPiAgICAgICAgIGZsYXNo
MSB7Cj4gPiAgICAgICAgICAgICAgICAgcGFydGl0aW9ucyB7Cj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOwo+ID4gCj4gPiAJCQlmbGFz
aDBfcGFydDE6IHBhcnQxQDAgeyAgCj4gCj4gcy9mbGFzaDBfcGFydDEvZmxhc2gxX3BhcnQwPwoK
UmlnaHQhCgo+IAo+ID4gCQkJCWxhYmVsID0gInBhcnQxXzAiOwo+ID4gCQkJCXJlZyA9IDwweDAg
MHg4MDAwMDA+Owo+ID4gCQkJfTsKPiA+IAo+ID4gCQkJcGFydDBAODAwMDAwIHsKPiA+IAkJCQls
YWJlbCA9ICJwYXJ0MV8xIjsKPiA+IAkJCQlyZWcgPSA8MHg4MDAwMDAgMHg4MDAwMDA+Owo+ID4g
CQkJfTsKPiA+ICAgICAgICAgICAgICAgICB9Owo+ID4gICAgICAgICB9Owo+ID4gICAKPiAKPiBG
b3IgbXkgdW5kZXJzdGFuZGluZywgaG93IG1hbnkgL2Rldi9tdGRYIGVudHJpZXMgd291bGQgdGhp
cyBjcmVhdGU/CgpJZiB0aGUgbWFzdGVyIGlzIHJldGFpbmVkIChLY29uZmlnIG9wdGlvbikgYW5k
IHRoYW5rcyB0byB0aGUgY29tbW9uCnBhcnRpdGlvbmluZyBzY2hlbWUsIHdlIHdvdWxkIGhhdmU6
CiogZmxhc2gwIChtdGQwKQoqICAgcGFydDBfMCAobXRkMSkKKiAgIHBhcnQwXzEgKG10ZDIpCiog
Zmxhc2gxIChtdGQzKQoqICAgcGFydDFfMCAobXRkNCkKKiAgIHBhcnQxXzEgKG10ZDUpCgpJZiB3
ZSBlbmFibGUgdGhpcyBkcml2ZXIsIHdlIHdvdWxkIGFsc28gZ2V0IGFuIGFkZGl0aW9uYWwgZGV2
aWNlOgoqIG10ZDItbXRkNC1jb25jYXQgKG9yIHBhcnQwXzEtcGFydDFfMC1jb25jYXQsIEkgZG9u
J3QgcmVjYWxsIHRoZSBleGFjdAogIG5hbWUpIGJlaW5nIG10ZDYuCgoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
