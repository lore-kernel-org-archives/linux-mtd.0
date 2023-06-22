Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12427EB64D8
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jun 2023 08:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5YtRE62rgQu/oOOAPpJfOx2Q4bfxOwKh3Bpz1gmXpOE=; b=bERm7ASsuhSGkS
	iGOsPUFHY8ceWx1uxXeq54A8aRBPJKfor+DJhdBd9zPx6jorcLALBHPq67Hpu1uqmBpflOFBOaHa9
	R3FA65FJrVY5kvkoNGxZBM/JlAHofLVO6wvS+aVtAGYT0Tbbccy9lTvyOqJmeqW8CSdCWUOn57Dcg
	pg/+4qBtOr+MM1+onoTc1goPl+66xTY+cqYtWxQneNkQHZYk5Ia76gD6JfkApTbYyWekqEvGpOU9g
	nh8RUDtwRih3Y2kPuU4pzsh3TLCP8G0G0fWnWMpz6Y/DNTDJ1Bs66LE5nvfy6AjJVVxQS+rf2Xdf4
	7HW/vm4freD0STDfHTIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCFgf-00HQIA-1D;
	Thu, 22 Jun 2023 08:29:05 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCFgb-00HQFd-1p
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jun 2023 08:29:03 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687422539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Hu3MCvJbtH5Uydd/RtIXSndvH3codqm8tSUoxC5yDI=;
	b=cVvLcZCulrEap/xzXOHQMkw4n5h4NRJCGYKZiA0y5sl2IoYDnBP2+wezVy59rdDhGkXFf/
	Zu9h9OkPg/kq6dTm+McbxlUlZzHinTJlkw5ysALVlXQCuVRu4bdhFhyVRZn+FMFmz9C7+X
	JSjFjl4gS1OfUCvjMBBUPDJz0Ny0Uz9igF7ZjT/1VEsEL0KhCWGCeMkA7JG8OWXivVmjzb
	idgYnnonlMsadzXG4TMr7ETMd5v8j2y2LM3waluRIk1eBDPFX2QXHj/KYi77yubD4ouaJu
	pj70s56s/sC3DJibix2FZFztYDHarPRM0KwqnH2mlaSIfS8i314QHBBYiDC7MA==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E50F1C0008;
	Thu, 22 Jun 2023 08:28:58 +0000 (UTC)
Date: Thu, 22 Jun 2023 10:28:57 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: vigneshr@ti.com, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add myself as reviewer for HYPERBUS
Message-ID: <20230622102836.2be2ab1b@xps-13>
In-Reply-To: <20230620025359.33839-1-tudor.ambarus@linaro.org>
References: <20230620025359.33839-1-tudor.ambarus@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_012901_734916_D44A9479 
X-CRM114-Status: GOOD (  14.05  )
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

SGkgVmlnbmVzaCwKCnR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZyB3cm90ZSBvbiBUdWUsIDIwIEp1
biAyMDIzIDA1OjUzOjU5ICswMzAwOgoKPiBBZGQgbXlzZWxmIGFzIERlc2lnbmF0ZWQgUmV2aWV3
ZXIgZm9yIEh5cGVyYnVzIHN1cHBvcnQuCj4gSSdtIGFzc2Vzc2luZyB0aGUgZnJhbWV3b3JrIGFu
ZCBJJ2QgbGlrZSB0byBnZXQgaW52b2x2ZWQKPiBpbiByZXZpZXdpbmcgZnVydGhlciBwYXRjaGVz
LgoKVmlnbmVzaCwgYW55IGNoYW5jZSB5b3UgY291bGQgZ2l2ZSBmZWVkYmFjayBvbiB0aGlzIHBh
dGNoIHF1aWNrbHk/IEknZApsaWtlIHRvIHRha2UgaXQgZm9yIHRoZSBuZXh0IFBSIGlmIHlvdSBh
Z3JlZS4KCj4gU2lnbmVkLW9mZi1ieTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5h
cm8ub3JnPgo+IC0tLQo+ICBNQUlOVEFJTkVSUyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+
IGluZGV4IDY5OTJiN2NjNzA5NS4uZGY1YzAzOWZjNTc3IDEwMDY0NAo+IC0tLSBhL01BSU5UQUlO
RVJTCj4gKysrIGIvTUFJTlRBSU5FUlMKPiBAQCAtOTYyMyw2ICs5NjIzLDcgQEAgRjoJdG9vbHMv
aHYvCj4gIAo+ICBIWVBFUkJVUyBTVVBQT1JUCj4gIE06CVZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZp
Z25lc2hyQHRpLmNvbT4KPiArUjoJVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8u
b3JnPgo+ICBMOglsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ICBTOglTdXBwb3J0ZWQK
PiAgUToJaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXgtbXRkL2xpc3Qv
CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
