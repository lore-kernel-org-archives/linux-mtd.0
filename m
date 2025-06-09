Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9375AC5B552
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Jun 2025 09:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xdyHe2Cu3O1z2i0uIwJtBRtvzqtnSODd2oqVH8bI+Ts=; b=fSsi9X8UGvZ1rs
	/h7BRTAiBAwVsfkzbT6gjYgphyAaM+0Q0rkjAQTcEh242I2Vl67cDtg1U6pLZdvsMT5A72MEZtIbC
	PV9bh4Cfz4yt1rL+ypQDURdFt4Y/eDcDnTZ4eGZ/wT9FaTM8N9WVhl6jsc6tD72T9EarmW89fA6xo
	fdFyFGjv7U15iMNjIxMsQDc9XjMWSUv05D9AaCJdUUgEQ9x8YzY6SCO0Vw/KGUbsuImD4f23P4TfF
	vAQHI2UqKq/sEEliyw1aods3PlStoCCML8lTqa4jZbuz1/D5i7Ca1puTEHVEHhejJy0hJWw6Q+Hkf
	E4glyEazeEXhiEg6/Phg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYkm-00000003lsM-2dtf;
	Mon, 09 Jun 2025 09:25:16 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYbW-00000003kG4-2sbS;
	Mon, 09 Jun 2025 09:15:43 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-235d6de331fso47970465ad.3;
        Mon, 09 Jun 2025 02:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749460541; x=1750065341; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpmkGucy2RS3jBDTNw16VboUFxkjN0cf7us7G6qbOho=;
        b=aqPLqFvmsqaGGIV98IqRCr4lYj/8mE5dVbDwheSRtRxhFK6RFBaEjqT6vdGqTOke2I
         hhsmL7QMr5rNbWe717fEcPC1vlp44VS/YWW5kf3r0DvDzx8gtZMGeb4ktTB7dLCMDXrZ
         HxeODsTqqpgkTuZx2RD5RWc1wSlCoAqT92Rai4bYObXsPRUz8+rLypojh1UF0aggDdbC
         734csqKfH8StDhaxV/WdrGY6pTW9Mp+ull+nWmlJVtf39le8usjMylr+GJ+5S2cCM/x5
         WGZarAYCFEzKsQdp+h6Xw5P38SrH0HYBCgN2b3o9jBPMVkbPddBhtX9GuSveZXRzVzYP
         kbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749460541; x=1750065341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpmkGucy2RS3jBDTNw16VboUFxkjN0cf7us7G6qbOho=;
        b=CXCqudHR3UXQIY2vU2o01vM+MH54/YwPeNCjHSz6Was70HDmTwtgSlDLPzVWI23TMc
         II0jBW50BGxxDjyOk/Er3L9WrO1QjJNFKvGynTqPXJMtQefuFBNhu9pWZEyGGo6Qy2Zi
         xSkTwaA15Va4EG+85uw5t5TMigHZF4a/pOVKJRGqPW824k/1OIYRGy9ZoA6aLMth+Xb6
         Kw5rA+l/iMDGf6ThaeQRbc+t93oGj7Q0JGkLH3CPUhO5XwDsGi8zbmSHnyDGJ8onuC0V
         gITnrmFOxoV9QYjiTmsDqDssLx2AE2AVQnYkaPpF9G2Oj4BXXO3WCUxArrcFVCwP6orJ
         YXIw==
X-Forwarded-Encrypted: i=1; AJvYcCXa2SmfuAeDwY7GS4fquNSt9H2nglWJb0la8odwBHPBLTWf3qr9p8mD036TxBrk8skqZ+EaHDdWx7v8TV9hYkkI@lists.infradead.org, AJvYcCXkwdHjr0Gfq7c5Gpm0kuuLWFJ4hgi6cFCiUPb4pwukwCw+YUls4BVocg33B1zMnizDpR9QV3oxcSDe@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4mMIts9a8PqJW2sYLjSyAQRUeWc0Vdc79HgOG9bV3mAOsH5mN
	Wxuj4lCzsaXx2trA5aDU6ZySVcuoe0nXgs2THUaq9JDZOYkkAlI15AJwDn/r/4M5UKrLzNhAXi+
	ndiS/sRqVsmbxnXh66TwG3Jfb8+dQzLwH5G7dH4+H3dRb
X-Gm-Gg: ASbGnctSlAr0YHb0AMIHFOjBLz+/7XP+18xdDwUGVoKrKK8AKKPmNN0StjzHcGcIyfF
	1JzaKwtboT3B7VZos0uNQHr0TBP4QZ8OQq/IwX2mSk/r+cMkiCvoImwjin7QNFEjeFHDz1SZR1E
	helrALuCzGKAoiFI0vaxBOq4j8KBKmgX5Ffy2LUQrCGQ==
X-Google-Smtp-Source: AGHT+IFEiclBaTJZlih4iswbFa1U+LhgFwjDy1Wcd+BvQJmUmpObry6wPhiUxn5NKpdaFyOWKSitROu6/8JAQhawYRU=
X-Received: by 2002:a05:620a:460c:b0:7ce:bd8b:2d08 with SMTP id
 af79cd13be357-7d229862b2cmr1761187785a.10.1749460530096; Mon, 09 Jun 2025
 02:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250510-wmt-sflash-v1-0-02a1ac6adf12@gmail.com>
 <20250510-wmt-sflash-v1-1-02a1ac6adf12@gmail.com> <20250514204159.GA2988411-robh@kernel.org>
 <CABjd4Yz3w75PtkRk_edzD5yf6b2xPuf20gopbm8ygddgCBfpkw@mail.gmail.com>
 <2b520ae5-eb0d-40eb-ba73-cc18759f33b9@kernel.org> <CABjd4YxRMfi3ZFQxhB__6U4Rm3KQ7bm6J=wQLWAkpb++61ddEg@mail.gmail.com>
 <87y0u1z3jk.fsf@bootlin.com>
In-Reply-To: <87y0u1z3jk.fsf@bootlin.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 9 Jun 2025 13:15:22 +0400
X-Gm-Features: AX0GCFvOvTOTy7296A8LugdUtVGVag1zgpyjF2HNfUyXz1MiexIEF2mhKUtpCQk
Message-ID: <CABjd4YyMavJ414JY4bfouTDy41wB=aajJvJ6vCM55mdEiTFPDw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: spi: Add VIA/WonderMedia serial flash controller
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_021542_721984_E42EF84B 
X-CRM114-Status: GOOD (  24.14  )
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

T24gTW9uLCBKdW4gOSwgMjAyNSBhdCAxOjA34oCvUE0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIaSBBbGV4ZXksCj4KPiA+PiA+IEhhcHB5IHRv
IHJlZmVyZW5jZSB0aGUgc3BpLWNvbnRyb2xsZXIueWFtbCBiaW5kaW5nIGlmIHNvLgo+ID4+Cj4g
Pj4gU1BJIE5PUiBmbGFzaGVzIGFyZSBzdGlsbCBjaGlsZCBkZXZpY2VzIG9mIGFuIFNQSSBjb250
cm9sbGVyLiBZb3UgY2FuCj4gPj4gbG9vayBhdCBvdGhlciBleGFtcGxlcyAtIGFyZW4ndCB0aGV5
IGFsbCB1c2luZyBzcGktY29udHJvbGxlcj8gV2h5IHRoaXMKPiA+PiB3b3VsZCBiZSBkaWZmZXJl
bnQ/IFVubGVzcyB5b3UgZm91bmQgc29tZSBjYXNlcyB0aGF0IGFyZSBkaWZmZXJlbnQsIGJ1dAo+
ID4+IHRoZW4gd2hpY2ggb25lcz8KPiA+Cj4gPiBObyBzdHJvbmcgb3BpbmlvbnMgaGVyZSwgYW5k
IG5vIGV4cGVjdGF0aW9uIG9mIGFueSBzcGVjaWFsIHRyZWF0bWVudAo+ID4gOikgSnVzdCB3YW50
ZWQgdG8gY29uc3VsdCBvbiB3aGF0J3MgbW9zdCBhcHByb3ByaWF0ZS4KPiA+Cj4gPiBNeSAoc3Vi
amVjdGl2ZSBhbmQgcGVyaGFwcyB1bmZvdW5kZWQpIGV4cGVjdGF0aW9uIHdoZW4gc2VlaW5nCj4g
PiBzb21ldGhpbmcgYWR2ZXJ0aXNlIGl0c2VsZiBhcyBhbiBTUEkgY29udHJvbGxlciB3YXMgdGhh
dCBpdCB3b3VsZCBiZSBhCj4gPiBnZW5lcmFsIHB1cnBvc2UgU1BJIG1hc3RlciwgdG8gd2hpY2gg
b25lIGNhbiBlLmcuIGNvbm5lY3QgYW4gU1BJCj4gPiBkcml2ZW4gTENEIHNjcmVlbiBhbmQgZ2V0
IGl0IHRvIHdvcmsgd2l0aCBnZW5lcmljIExpbnV4IFNQSQo+ID4gaW5mcmFzdHJ1Y3R1cmUgLSB3
aGljaCB3b3VsZCBub3QgYmUgcG9zc2libGUgd2l0aCB0aGlzIHNpbmdsZS1wdXJwb3NlCj4gPiBO
T1Itb25seSBmbGFzaCBjb250cm9sbGVyLiBHaXZlbiB0aGF0IEkgZG9uJ3Qga25vdyBob3cgZmxl
eGlibGUgb3IKPiA+IHJlc3RyaWN0aXZlIG90aGVyIGV4YW1wbGVzIGFyZSBpbiB0ZXJtcyBvZiBk
cml2aW5nIGFyYml0cmFyeSBTUEkKPiA+IGRldmljZXMsIEkgdGhvdWdodCBpdCdzIGJldHRlciB0
byBqdXN0IGFzay4KPiA+Cj4gPiBXaGF0IEknbSBnZXR0aW5nIGZyb20gdGhpcyBleGNoYW5nZSBo
ZXJlIGlzIHRoYXQgSSdkIGJldHRlciB1c2UgdGhlCj4gPiBzcGktY29udHJvbGxlciBiaW5kaW5n
IGFuZCByZXNwZWN0aXZlIG5vZGUgbmFtZXMgcmVnYXJkbGVzcyBvZiB0aGUKPiA+IGZhY3QgdGhh
dCB0aGlzIGNvbnRyb2xsZXIgY2Fubm90IGRyaXZlIGFyYml0cmFyeSBTUEkgZGV2aWNlcyBiZXlv
bmQKPiA+IE5PUiBmbGFzaCAod2hpY2gsIGFzIEknbSBnZXR0aW5nLCBpcyBpcnJlbGV2YW50IGFm
dGVyIGFsbCkuCj4KPiBKdXN0IGZvciBpbmZvcm1hdGlvbiwgdGhlcmUgYXJlIHNldmVyYWwgU1BJ
IGNvbnRyb2xsZXJzIHdoaWNoIGFyZQo+IG9wdGltaXplZCBmb3IgZmxhc2ggaGFuZGxpbmcgKG5v
dCBvbmx5IE5PUiwgdGhvdWdoKSBhbmQgZm9yIHRoYXQgd2UgaGF2ZQo+IGEgc3BpLW1lbSBsYXll
ciB3aGljaCBhbGxvd3MgdG8gcmVmZXJlbmNlIGEgc2V0IG9mIFNQSSBtZW1vcnkgIm9ubHkiCj4g
Y2FsbGJhY2tzLiBPbiB0aGUgZGVzY3JpcHRpb24gc2lkZSB0aG91Z2gsIHRoZXNlIGNvbnRyb2xs
ZXJzIGFyZSBsaWtlCj4gYWxsIG90aGVyIFNQSSBjb250cm9sbGVycywgc28gdGhlIHNhbWUgY29u
dHJvbGxlciBiaW5kaW5ncyBtYXkgYXBwbHkuCgpOb3RlZCwgdGhhbmsgeW91IE1pcXXDqGwhCgpC
ZXN0IHJlZ2FyZHMsCkFsZXhleQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
