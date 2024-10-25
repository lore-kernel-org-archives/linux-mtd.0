Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7990CD11718
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2024 07:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T8jmezGZC83RQK1RG9/4oUnHxi59UIt42QtadvYhrFs=; b=mKEWlnuui3v4pB
	RGFtHvPzh2i7gETDVMr2qU7ITetL58gOEQ0dFNM9V5ZJE0zI9D6b8fZtTPaGpF5s7h3zw3oHqbaym
	HnJ1ScSKPgu7SDHCcn3Aws3j0B/wbNF6qxwky/FooIbhZLGp8LPpmJ4cpd1ZcCRYj/eCGdW/sUY+j
	co1WbPTBbIxHJJt0SCftHYQJgJedX1zPLR+i5INKynamLQzLczM8pAHx/UCMEgRVl5ODWiYReP0fJ
	BhlENiVsgmrZsc5HXZUL43lC3znLdsgXSmAseHmcslPe4qBA5vI7HiiYEzgEAhwA8jV4kA0rRzdfU
	K8qXusvSndfrJmc0QxKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4F8B-00000002rho-3WU4;
	Fri, 25 Oct 2024 07:53:11 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4F6d-00000002rNe-25ay
	for linux-mtd@lists.infradead.org;
	Fri, 25 Oct 2024 07:51:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 912A8FF80D;
	Fri, 25 Oct 2024 07:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729842689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lVBAN1rymyK7VuzJCBezdwk3YLqFB+8QqAHMbWbVMzQ=;
	b=fVs95Oif8DrSyflXMHYkUki/Rlui8+E78aLn8keh625lEMmgyBGba4i3T/us5PHsa5AGNu
	9Bxx33pbY8kRodIQGdnD1xT8TCwcFNdCn4MLWhi5KO3hpT/WD/iJBJQ6EDGIdO+GMS78VY
	jgjHMJLeiKgp/x8mRhNpXjEM/Z/8dcyN64xfYxo7Gwt3OQJtBE9P50+pO9aC1aB6cvC4ih
	njsC60tStqSMI9HyZIFp7R/o8qvDVeSd7D7fxXgJlfr7/Yr1cRoEWxnbmIMW7mtm/x5ioq
	morJDsF1WC/ltE2HNUO6DsJigR0ImAMx8zvNLiHD0EBWV1+AQHA7Yv9+Cu1mpQ==
Date: Fri, 25 Oct 2024 09:51:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Kurbanov <mmkurbanov@salutedevices.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Michael Walle" <michael@walle.cc>, Mark Brown <broonie@kernel.org>,
 Chia-Lin Kao <acelan.kao@canonical.com>, Md Sadre Alam
 <quic_mdalam@quicinc.com>, "Ezra Buehler"
 <ezra.buehler@husqvarnagroup.com>, Sridharan S N <quic_sridsn@quicinc.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, Alexey Romanov
 <avromanov@salutedevices.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <kernel@salutedevices.com>
Subject: Re: [PATCH v2 4/5] mtd: spinand: micron: OTP access for
 MT29F2G01ABAGD
Message-ID: <20241025095124.0403bdd6@xps-13>
In-Reply-To: <de27927d-ce37-4c0f-85d0-e32bae3f0ef9@salutedevices.com>
References: <20240827174920.316756-1-mmkurbanov@salutedevices.com>
	<20240827174920.316756-5-mmkurbanov@salutedevices.com>
	<20241001113108.4fdb6360@xps-13>
	<de27927d-ce37-4c0f-85d0-e32bae3f0ef9@salutedevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_005135_712008_816BB4F2 
X-CRM114-Status: GOOD (  14.83  )
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

SGkgTWFydGluLAoKbW1rdXJiYW5vdkBzYWx1dGVkZXZpY2VzLmNvbSB3cm90ZSBvbiBNb24sIDE0
IE9jdCAyMDI0IDE1OjQ4OjQ2ICswMzAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24gMTAvMS8yNCAx
MjozMSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiAKPiA+PiArI2RlZmluZSBNSUNST05fTVQyOUYy
RzAxQUJBR0RfT1RQX1BBR0VTCQkJMTIKPiA+PiArI2RlZmluZSBNSUNST05fTVQyOUYyRzAxQUJB
R0RfT1RQX1BBR0VfU0laRQkJMjE3NiAgCj4gPiAKPiA+IEluIHRoZSBjb3JlIHdlIGRpZCBhZGQg
dGhlIGRhdGEgc2l6ZSBhbmQgdGhlIE9PQiBzaXplIHRvIGdldCB0aGUgT1RQCj4gPiBwYWdlIHNp
emUuIEkgd291bGQgcHJlZmVyIHNvbWV0aGluZyBkeW5hbWljIGhlcmUgYXMgd2VsbCwgb3RoZXJ3
aXNlIHRoZQo+ID4gaW1wbGVtZW50YXRpb24gaXMgdmVyeSBkZXZpY2Ugc3BlY2lmaWMgZm9yIG5v
dyByZWFzb24/ICAKCgkJCQkJCW5vCgo+IAo+IERvIHlvdSBtZWFuOgo+IG90cF9wYWdlX3NpemUg
PSBuYW5kZGV2X3BhZ2Vfc2l6ZShuYW5kKSArIG5hbmRkZXZfcGVyX3BhZ2Vfb29ic2l6ZShuYW5k
KQoKWWVzIQoKPiA+PiArCQlzaXplX3QgaSA9IDA7Cj4gPj4gKwo+ID4+ICsJCS8qIElmIGFsbCB6
ZXJvcywgdGhlbiB0aGUgT1RQIGFyZWEgaXMgbG9ja2VkLiAqLwo+ID4+ICsJCXdoaWxlIChpIDwg
YnVmX3NpemUgJiYgKih1aW50MzJfdCAqKSgmYnVmW2ldKSA9PSAwKQo+ID4+ICsJCQlpICs9IDQ7
ICAKPiA+IAo+ID4gU2hhbGwgd2UgZXhwZWN0IGJ1Zl9zaXplIHRvIGFsd2F5cyBiZSBhIG11bHRp
cGxlIG9mIDQ/IChyZWFsIHF1ZXN0aW9uKSAgCj4gCj4gVGhpcyBmdW5jdGlvbiBpcyBvbmx5IGZv
ciB0aGUgbmFuZCBmbGFzaCBNVDI5RjJHMDFBQkFHRCB0aGF0IGhhcyBhIHBhZ2UKPiBzaXplIG11
bHRpcGxlIG9mIDQuCgpPay4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
