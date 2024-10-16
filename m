Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2138CD1AD4F
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2024 12:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5GM5KOcMt+MhccF55ELiSmRl3wukoaZh/t1u0R8Kvx8=; b=tZnhJvG+21aoO5
	1PhKjclOsqRDD0gGii6XDqgnd/MmXuKxVsLTJyaBydImUow76IM/8aBZeY7XKryY43wucSrjdxsxY
	GWkamRf+nG981xrT314cEEWgc2QhFf6r2gUBnXvkl3NYJzhuxzKLCVPUHrgXbomC8S2cq9W3qMOYM
	mq+fqoGaUrsWEcFvKgfuepnhd2YWi549iSFqjhZJoFrkbrLi/6eaxzSTAf3GGk0NBuLe1kIIwjvOL
	06sUTc6O6NOseskplehY2GZ+1VLpM2UnxxlfChibR9G+UZmCOOlMeCsA4tksMeQhZjx7EgEFUdMqG
	PK71p2E5Ce4Yo2TO7xsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t12iJ-0000000BfwG-1NVO;
	Wed, 16 Oct 2024 12:01:15 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t12iG-0000000Bfto-0CyN
	for linux-mtd@lists.infradead.org;
	Wed, 16 Oct 2024 12:01:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E19181C000E;
	Wed, 16 Oct 2024 12:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729080069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8krP1VYwxBLXUznJQJXAi4O+kQ5+/JlOE4x1ZUEOX5Q=;
	b=GiHCUWumFVs/jO1YMHSG7rA16gQjs6pbBAiCcd4D2BnG68yciTjh4sr3vI4BbD9wRFLIXZ
	ywhlWbF+mgFQwXe8c1SIWmQNHhsrjT6sGcDurP5aun4v/ivL8cPFVvZyLItnCUQ7XewBtN
	c5gqEnGoTBWStvdi7oiwdUi14SRLV2TW6k4UiWI+VFbCQB27jBALEMzf4IiFcy4PnGkkXV
	GDfhB1mXcf04qYRnZXW28xbwqJU7EJy070PC6YGk4VKniMql09sBrx5GtrSLl51wXLInSc
	w/j8sZE2guTIgfjVs1SL84HeOdp94leXtZtxTRIu5hSOOecqNhrnL139Ra9YRA==
Date: Wed, 16 Oct 2024 14:01:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v10 1/2] dt-bindings: mtd: Add Loongson-1 NAND
 Controller
Message-ID: <20241016140108.00273712@xps-13>
In-Reply-To: <CAJhJPsW+cRY13in41NpTrEB4VP7jYLFdgrt8+9EJSwgkvXZR=g@mail.gmail.com>
References: <20241002-loongson1-nand-v10-0-17162eff80e2@gmail.com>
	<20241002-loongson1-nand-v10-1-17162eff80e2@gmail.com>
	<20241007161027.386e7409@xps-13>
	<CAJhJPsW+cRY13in41NpTrEB4VP7jYLFdgrt8+9EJSwgkvXZR=g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_050112_255986_83422FF0 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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

SGkgS2VndWFuZywKCmtlZ3VhbmcuemhhbmdAZ21haWwuY29tIHdyb3RlIG9uIFdlZCwgMTYgT2N0
IDIwMjQgMTY6MDY6MDkgKzA4MDA6Cgo+IE9uIE1vbiwgT2N0IDcsIDIwMjQgYXQgMTA6MTDigK9Q
TSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+Cj4g
PiBIaSBLZWd1YW5nLAo+ID4gIAo+ID4gPiArcGF0dGVyblByb3BlcnRpZXM6Cj4gPiA+ICsgICJe
bmFuZEBbMC0zXSQiOgo+ID4gPiArICAgIHR5cGU6IG9iamVjdAo+ID4gPiArICAgICRyZWY6IHJh
dy1uYW5kLWNoaXAueWFtbAo+ID4gPiArCj4gPiA+ICsgICAgcmVxdWlyZWQ6Cj4gPiA+ICsgICAg
ICAtIG5hbmQtdXNlLXNvZnQtZWNjLWVuZ2luZQo+ID4gPiArICAgICAgLSBuYW5kLWVjYy1hbGdv
ICAKPiA+Cj4gPiBBY3R1YWxseSBJIHRvbGQgeW91IGEgbWlzdGFrZS4gVGhlIG5vLWVjYy1lbmdp
bmUgY2FzZSBzaG91bGQgcmVtYWluCj4gPiB2YWxpZCwgc28gd2UgY2Fubm90IHJlcXVpcmUgdGhl
c2UgcHJvcGVydGllcyBpbiB0aGUgYmluZGluZ3MuCj4gPiAgCj4gVGhlbiwgcmVtb3ZlIHRoaXMg
c2VjdGlvbiwgcmlnaHQ/CgpZZXMsIHBsZWFzZS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
