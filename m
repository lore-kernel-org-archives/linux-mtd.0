Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD35DD3B99E
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Dec 2025 22:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ielXD87nX8vLMHiiLFqGyAEpo8OBhzxRyCO+HyjPxg=; b=3oJGoP6mz09iA2
	pnDE5QY3VTGIU0EBSzan4VAbVMehJtuAfUdKWYPkXF2cIZ4+ZEkBurLy84sYSVheKTg4Jfc9lQfyT
	OL2XpUGX1OUws+8hMiejxwAcZFBsAsxPUdfQn34zKgY/ZQPfPWruzp1q6RsJXFFgAX3f0CIxN+yNh
	c/W5HMShwBwTBmGmmGTIuv3GpyHBqIckMxbnG57+Ug94UVDhX3KHh5y4nHKJ3joP7T13kU8daF58e
	Gb48zrT9M48eAvvpBT31oBr4faNh18HJHkWNjLm/XU+Xb5BqUGGbDIWUlpqKMzxSkel/iemdDRC8y
	oxtqtY8PSFxVdVJ6czLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT6Mi-0000000Es9v-19rh;
	Tue, 09 Dec 2025 22:39:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT6Mf-0000000Es9i-2jjn
	for linux-mtd@lists.infradead.org;
	Tue, 09 Dec 2025 22:39:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 10811601AF
	for <linux-mtd@lists.infradead.org>; Tue,  9 Dec 2025 22:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C18C116B1
	for <linux-mtd@lists.infradead.org>; Tue,  9 Dec 2025 22:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765319964;
	bh=/iTM1jJlu2UuL9uPyqPKM3hRmqrljCMk5Kax+Fk3Csc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P1XSvevLH+LAGfJ+NNt8jsWuhl7jCNbwHUN6ZrOiNNS02BX2fz0OdYFqAnJsUF+Kq
	 6LECNtVta3R1EG1eGCx3G8H29PnFFarfb3LIUdn8q9911wtbs1xsW6GTdi6DfyutdU
	 6ImzBIwLlYPSpSG4m66+dxS/01+DEY0/FmfyeyEiuRFgCchOv4QtEPVOaYUoku3vHS
	 5pQPhIEmdExF+iR5O9KS0G/Kf9iYQPjw7iR7KNssbwEIIYU7s9CHOAdk/K5SF0wyyB
	 qp6maRIJ2IpI2IZzqOAj/1IntdF5RPQeA9TlJUBokJXtSoGpQLCq6qyP2mCNhKJ/86
	 V8uY+y+srVeyg==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b75c7cb722aso977295466b.1
        for <linux-mtd@lists.infradead.org>; Tue, 09 Dec 2025 14:39:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWvTC3L4AkcTSKN6EtO2h0xTt6PzM5YZ641aolDr922lu0ipQ6HfjsDMtUpfNgUk+FmDwEP0DUhraw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWr0VHyQmqXTVgH4aZBUtlMnoJqvSGrCKQdQDBxE4N044hrGCz
	EX6kVxnmK5hPlDqF8LJbqq8ec4GY3XXEBdzkQwTeGimthEWqhpDmWilhJ5nC8eVoy3d8GQIqE64
	HqaEvkiJU8iBxvKr9/RZVlB3i+4J8hw==
X-Google-Smtp-Source: AGHT+IGLCH2P+FlmKcufeRRw22NRHRGtlBZRFMM6bDtNw17e/djrmNK9KZ5LhnrWo2I5IjTlQrfxsgzx1701NlakcLI=
X-Received: by 2002:a17:907:2dac:b0:b73:78f3:15b3 with SMTP id
 a640c23a62f3a-b7ce8404f0dmr26213566b.47.1765319963285; Tue, 09 Dec 2025
 14:39:23 -0800 (PST)
MIME-Version: 1.0
References: <20251120-at91-probe-v2-0-8c8592f02e8e@kernel.org>
 <20251120-at91-probe-v2-2-8c8592f02e8e@kernel.org> <ece2d53c-3e16-4e5e-9bb9-3ed7bb362b7b@tuxon.dev>
In-Reply-To: <ece2d53c-3e16-4e5e-9bb9-3ed7bb362b7b@tuxon.dev>
From: Rob Herring <robh@kernel.org>
Date: Tue, 9 Dec 2025 16:39:12 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ2ghfNKQPhs19F1oxJxyTsrQ47hgPwsa3hUmgbGjpi-A@mail.gmail.com>
X-Gm-Features: AQt7F2pTpyBlT1NDJToDU8xphT7m7aRHUZpyAo2rSEBV3njKup08Munn-uLDhbE
Message-ID: <CAL_JsqJ2ghfNKQPhs19F1oxJxyTsrQ47hgPwsa3hUmgbGjpi-A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ARM: at91: Move PM init functions to .init_late hook
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Russell King <linux@armlinux.org.uk>, 
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

T24gU2F0LCBOb3YgMjIsIDIwMjUgYXQgOTozN+KAr0FNIENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1
LmJlem5lYUB0dXhvbi5kZXY+IHdyb3RlOgo+Cj4gSGksIFJvYiwKPgo+IE9uIDExLzIwLzI1IDIz
OjM3LCBSb2IgSGVycmluZyB3cm90ZToKPiA+IE1vdmUgdGhlIEFUOTEgUE0gaW5pdCBmdW5jdGlv
bnMgdG8gLmluaXRfbGF0ZSBob29rIHRvIGVuc3VyZSBkcml2ZXIKPiA+IGRlcGVuZGVuY2llcyBo
YXZlIHByb2JlZC4KPiA+Cj4gPiBDYzogTmljb2xhcyBGZXJyZSA8bmljb2xhcy5mZXJyZUBtaWNy
b2NoaXAuY29tPgo+ID4gQ2M6IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9uaUBi
b290bGluLmNvbT4KPiA+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcK
PiA+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+Cj4K
PiAnRnJvbTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4nICE9ICdTaWduZWQtb2ZmLWJ5
OiBSb2IgSGVycmluZyAoQXJtKQo+IDxyb2JoQGtlcm5lbC5vcmc+CgpCZWZvcmUgSSByZXNwaW4s
IGFueSBmZWVkYmFjayBvbiB3aGV0aGVyIHRoaXMgc2VyaWVzIGFjdHVhbGx5IHdvcmtzIG9yIG5v
dD8KClJvYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
