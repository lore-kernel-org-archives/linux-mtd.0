Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37F3C0218F
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jan 2025 22:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ppjol9qHfpR9zjKWckWqDVyR1m4a7ti7fuNg91vDUbc=; b=FxdHHdEi5ERUjJ
	v1oRBzOHpN46fXfLQZ8iVdJJcO3Ob2HnHvk7bT1C7t/1GtPbUjyppTutmZrt8SKUZPZ+OHtOrcqUm
	KADxXms77Z5EF34608PpJbU4GtxfiVE80nzowPzZRJfRbMEGWvE0q6+8VFut8PC4O46Y2WhJNYhjC
	v+qT6GctunI3LhkMZvDhyMfkVZWVjbY9cl9YKf9DukB9rzmOrNakq22X1IQye2rPn1rofbaCb7WPw
	Cpjyl2Ja3L4370cWJSSptuhRdeYCFoH5c+cYiyvYAPXb0+r/EkxWwMPz2UYJ59i/LBBGT+XoZRk/u
	7Dq4Q/R1ROU/urbqlvaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdzJJ-0000000BXoU-3aPM;
	Fri, 31 Jan 2025 22:16:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdzJG-0000000BXo1-2P7T
	for linux-mtd@lists.infradead.org;
	Fri, 31 Jan 2025 22:16:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EA76FA4258F
	for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2025 22:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B80F8C4CEF8
	for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2025 22:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738361780;
	bh=24W6Dps3y7DxZ6YhfkzynKPlf3swLWZxkwFai0Y3sBI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AtfqOBV+hgn5E2OvcJZHV5aNQwRoYZB/CgESGBejHG/zkhQV1sAuR0NIwBLg9xAnH
	 NMF7ihG8arT55ilvdLTKTWJmugXTWXqCJSDlTZeS2zxMmwQFLqm8D5VukL5YR/EcBJ
	 mghfb/3SO3dWStF5RQqNApP46SZDdaOsLZ08uuh/lqxQcZeBdoAPNo9gglpGJJlJBa
	 6d8A+j+Z5Ei31O2xP6t7GYTdzHI8rFqRWRC6V6NAruBJpu/X9qlSJBZZtbTiSe2K0U
	 95VqbK3A1v+Ko/GNl3nXSzntI4YcNvUJuqPzC39Twtw/FyZPNjLEwB4c+7+1U/hjuu
	 +Zc2srHyIOMnQ==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5dc10fe4e62so4761788a12.1
        for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2025 14:16:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUiOklGUfVPrssC2V2GMmZCaHBX+FRCy5wngIoQle0x8BE6iJACfHoI2PXwcFLNsnzhyuMAGKpjLSw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9UwjtH4SYIVCbKW8as6yh6fCwJXowdwWg0rSB8UOHuPXUcVnT
	d62oI75HSK3bewYNixRfEtOkQhW3gqpdSD3xXo0Yvel8gUgvOatW8uvfJ85zNVVS0iFTjV4YG+j
	tJe+o8WmHcYB//YS/cbTmu9qw9w==
X-Google-Smtp-Source: AGHT+IG+40Vie6I5qh4Xa+hjwERq+fPWo6Sglqt6y5ghUP/X8RySc2w5nt0i3mGF0G2DQOmC/TQjR33KPq7ga7buNyY=
X-Received: by 2002:a05:6402:2390:b0:5dc:72e1:63ee with SMTP id
 4fb4d7f45d1cf-5dc72e1647cmr7162768a12.6.1738361778979; Fri, 31 Jan 2025
 14:16:18 -0800 (PST)
MIME-Version: 1.0
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-5-50649f51c3dd@posteo.net> <20250127044735.GD3106458-robh@kernel.org>
 <Z5zYGdZU-IXwIuR6@probook>
In-Reply-To: <Z5zYGdZU-IXwIuR6@probook>
From: Rob Herring <robh@kernel.org>
Date: Fri, 31 Jan 2025 16:16:07 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJAX1QbXvG16NV2g6DGece6KiG_V-uyKQQLA618Oq9miw@mail.gmail.com>
X-Gm-Features: AWEUYZlhW5XoGn0HVU0ENeDHSySI0kteJDy_cGfJFvW15zruGH8F_vZTC5Jh93M
Message-ID: <CAL_JsqJAX1QbXvG16NV2g6DGece6KiG_V-uyKQQLA618Oq9miw@mail.gmail.com>
Subject: Re: [PATCH 5/9] dt-bindings: dma: Convert fsl,elo*-dma bindings to YAML
To: =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Scott Wood <oss@buserror.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Lee Jones <lee@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org, 
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_141622_744023_C0D7417C 
X-CRM114-Status: GOOD (  16.44  )
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

T24gRnJpLCBKYW4gMzEsIDIwMjUgYXQgODowM+KAr0FNIEouIE5ldXNjaMOkZmVyIDxqLm5lQHBv
c3Rlby5uZXQ+IHdyb3RlOgo+Cj4gT24gU3VuLCBKYW4gMjYsIDIwMjUgYXQgMTA6NDc6MzVQTSAt
MDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiBPbiBTdW4sIEphbiAyNiwgMjAyNSBhdCAwNzo1
OTowMFBNICswMTAwLCBKLiBOZXVzY2jDpGZlciB3cm90ZToKPiA+ID4gVGhlIGRldmljZXRyZWUg
YmluZGluZ3MgZm9yIEZyZWVzY2FsZSBETUEgZW5naW5lcyBoYXZlIHNvIGZhciBleGlzdGVkIGFz
Cj4gPiA+IGEgdGV4dCBmaWxlLiBUaGlzIHBhdGNoIGNvbnZlcnRzIHRoZW0gdG8gWUFNTCwgYW5k
IHNwZWNpZmllcyBhbGwgdGhlCj4gPiA+IGNvbXBhdGlibGUgc3RyaW5ncyBjdXJyZW50bHkgaW4g
dXNlIGluIGFyY2gvcG93ZXJwYy9ib290L2R0cy4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTog
Si4gTmV1c2Now6RmZXIgPGoubmVAcG9zdGVvLm5ldD4KPiA+ID4gLS0tCj4gPiA+ICAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9kbWEvZnNsLGVsby1kbWEueWFtbCAgICAgICB8IDEyOSArKysrKysr
KysrKysrCj4gPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvZnNsLGVsbzMtZG1hLnlh
bWwgICAgICB8IDEwNSArKysrKysrKysrKwo+ID4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZG1hL2ZzbCxlbG9wbHVzLWRtYS55YW1sICAgfCAxMjAgKysrKysrKysrKysrCj4gPiA+ICAuLi4v
ZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlcnBjL2ZzbC9kbWEudHh0ICAgICAgICB8IDIwNCAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMzU0IGluc2VydGlvbnMo
KyksIDIwNCBkZWxldGlvbnMoLSkKPiBbLi4uXQo+ID4gPiArcGF0dGVyblByb3BlcnRpZXM6Cj4g
PiA+ICsgICJeZG1hLWNoYW5uZWxALiokIjoKPiA+ID4gKyAgICB0eXBlOiBvYmplY3QKPiA+Cj4g
PiAgICAgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4KPiBJJ2xsIGFkZCBpdC4KPgo+
ID4gKFRoZSB0b29scyBzaG91bGQgaGF2ZSBoaWdobGlnaHRlZCB0aGlzKQo+Cj4gV2l0aCBkdHNj
aGVtYSAyMDI0LjExIGluc3RhbGxlZCwgIm1ha2UgZHRfYmluZGluZ19jaGVjawo+IERUX1NDSEVN
QV9GSUxFUz1mc2wsZWxvLWRtYS55YW1sIiBkb2VzIG5vdCBoaWdobGlnaHQgdGhpcy4KCkFjdHVh
bGx5LCBpdCdzIHRoZSB0b3AtbGV2ZWwgJ2FkZHRpb25hbFByb3BlcnRpZXM6IHRydWUnIHRoYXQg
ZGlzYWJsZXMKdGhlIGNoZWNrIGhlcmUuIFRoYXQgc2hvdWxkIGJlIGZhbHNlIGFzIHdlbGwuCgpS
b2IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
