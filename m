Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916EDCA0ECA
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Sep 2023 07:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oS6Ye/IvIm9A5vduXaxKQpFwUi5G3Mf1/BDcrfdEHsk=; b=FXF0xVB1kIqQ4a
	MI5NbdFbrNQaFprMpb3Va5dVCO4/HavSLU1CURziPvwqjOs1Eu5zKzimeA4bObeyjk7M9ZS0LV3Qr
	8uheR0BhomBmXMzTtc1dbFv889oSV8woyK4yEz/OfE7gozpLo5KmlmX0Spi/LZp7hCbHMLgiAmT+9
	JicEYsd7AB/lZR1+vGbcF0RDJKbbuNsFIi02kTSCAeIM+XrXlHKjuM4Npa6d782+6RNrVSBh1qBtS
	K/cIZ7h5NzcvPiof6br1Y5d8Wm1acoRW8BbOC5jaTbuKQA49cyxi7VdFaCDXRsim4i3ejSvLFSdNK
	WH4vLYG+PY69iEqLCl1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxfF-002NEG-33;
	Tue, 12 Sep 2023 07:18:25 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxfC-002NCd-0t
	for linux-mtd@lists.infradead.org;
	Tue, 12 Sep 2023 07:18:23 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-d7225259f52so4769957276.0
        for <linux-mtd@lists.infradead.org>; Tue, 12 Sep 2023 00:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694503097; x=1695107897; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRluws1bKA5tPkRD6dCJv+tjTju2jAo5DUiyO4MGvyo=;
        b=T848kom54XqbwZ+E7Jpcoe4NiygGqJZ0r21uSZMf1EA9if5ZZoPD5BjXCmVHXr46CR
         W1RCMyhVjNxVNFwDPDOFItuG0aHfSjTAq5GlsEM6V1JKEcMNQBoN+YS5XIohnmkNdSeR
         JUmSVMIpeF6/OMpWKZbKAtsyyQoZzhzG8Z8JbrcE7KXX7oPUMmV4iK5sjYoHT/v8N75Y
         +uewJQsRMNe1wE5f0O/ZjpGbZGuI2VKiI88/n0mcY/bAjVlEgUtj42it1Zaolmq1KKHa
         IhrnGmH6uN6WppQ84GUfyD7A1frPBv7iJg1iiaRZN+t2V/MN6UEwbd8x/UbcJ0NXMJeE
         RZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694503097; x=1695107897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RRluws1bKA5tPkRD6dCJv+tjTju2jAo5DUiyO4MGvyo=;
        b=NdWwrXSEuv88D69rNiyyp4P5nnKDpjAY/5ziQyh9c7G4oPfC2LH86COs0cDtCEgK9u
         2iA8bbkX/wuQEfgRYech+bc7PwNJYzySPKgOKD5jJUita6W0hfsnGzoEy0BryZNdcolE
         9oNuYhqJSvU82KmiDg+erlr/DUAdTrM58BE7ZYYw6p4wE9an8Uk39Op3eAP87CSgGoHI
         GUja1JfX+OdHBhPgvOWE8AO+hTHmsswglyUvh9tGs2CStXDcGBh3sk1LKRb3pRByNkRM
         hLQwufAZ93VqHEENJOrh6vfJ1nQX3DjNFoVhYmWPEF/iNg5AoYy4McQK5ApjIqNN3pbg
         /Lfw==
X-Gm-Message-State: AOJu0YyW1yW+pUg18DxOmAz2TCcdo4FF2BKLxdpnJVvVprzjeHPHKScU
	mtXicD4jXL1CL3IqfeBOWg54Iss9Rp1bH04tTROUJA==
X-Google-Smtp-Source: AGHT+IF+Drm1yZXPtH337fh1vDn2QzgzBG2D73iDDROnRZLERLH1RHqq6shn06QA7hITo+o+sOIJhH0K7UeGV8gZX5A=
X-Received: by 2002:a25:dc11:0:b0:d78:878d:e1e1 with SMTP id
 y17-20020a25dc11000000b00d78878de1e1mr10702572ybe.50.1694503096234; Tue, 12
 Sep 2023 00:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <946079fe606d18b97578db42dd57a31acf38b26a.1693407641.git.geert+renesas@glider.be>
In-Reply-To: <946079fe606d18b97578db42dd57a31acf38b26a.1693407641.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Sep 2023 09:18:05 +0200
Message-ID: <CACRpkdbgBtAmyxfiXrZ75gAdc1DeaqMaHRNVX=nz7SuzxFU40w@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: arm: realview: Fix development chip ROM
 compatible value
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Boris Brezillon <bbrezillon@kernel.org>, Ricardo Ribalda <ribalda@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_001822_314488_30F6849E 
X-CRM114-Status: GOOD (  12.94  )
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

T24gV2VkLCBBdWcgMzAsIDIwMjMgYXQgNTowM+KAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbgo8Z2Vl
cnQrcmVuZXNhc0BnbGlkZXIuYmU+IHdyb3RlOgoKPiBXaGVuIHRoZSBkZXZlbG9wbWVudCBjaGlw
IFJPTSB3YXMgYWRkZWQsIHRoZSAiZGlyZWN0LW1hcHBlZCIgY29tcGF0aWJsZQo+IHZhbHVlIHdh
cyBhbHJlYWR5IG9ic29sZXRlLiAgSW4gYWRkaXRpb24sIHRoZSBkZXZpY2Ugbm9kZSBsYWNrZWQg
dGhlCj4gYWNjb21wYW55aW5nICJwcm9iZS10eXBlIiBwcm9wZXJ0eSwgY2F1c2luZyB0aGUgb2xk
IHBoeXNtYXBfb2ZfY29yZQo+IGRyaXZlciB0byBmYWxsIGJhY2sgdG8gdHJ5aW5nIGFsbCBhdmFp
bGFibGUgcHJvYmUgdHlwZXMuCj4gVW5mb3J0dW5hdGVseSB0aGlzIGZhbGxiYWNrIHdhcyBsb3N0
IHdoZW4gdGhlIERUIGFuZCBwZGF0YSBjYXNlcyB3ZXJlCj4gbWVyZ2VkLgo+Cj4gRml4IHRoaXMg
YnkgdXNpbmcgdGhlIG1vZGVybiAibXRkLXJvbSIgY29tcGF0aWJsZSB2YWx1ZSBpbnN0ZWFkLgo+
Cj4gRml4ZXM6IDVjM2Y1ZWRiZTBhMWRmZjMgKCJBUk06IHJlYWx2aWV3OiBhZGQgZmxhc2ggZGV2
aWNlcyB0byB0aGUgUEIxMTc2IERUUyIpCj4gRml4ZXM6IDY0MmIxZThkYmVkN2JiYmYgKCJtdGQ6
IG1hcHM6IE1lcmdlIHBoeXNtYXBfb2YuYyBpbnRvIHBoeXNtYXAtY29yZS5jIikKPiBTaWduZWQt
b2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgoKUGF0
Y2ggYXBwbGllZCEKCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
