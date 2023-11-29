Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A13C4167B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Nov 2023 16:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N/hDyeWCEX8ip7iDdG0D99NsEcI+5I5oqhYkKeTY4sw=; b=w21pTva/LUxWzr
	RHa15sJ80k8peVRpNt2CBjChTy6nJfZST7n+gTTk3ZFg4jWPOkHyfV4BDVUoDA3P7l8G62/9l7X4u
	KxhfmL9N+GZORr4pTx4pfA1jxCnISZ6h0N0D7Zgo/b2w5RleHlQnXFTULI57UZDjOkIi0hq9Zs1p2
	SZwDOWJz8uAliGkMp+R/rXb86rpjP0AGav9Rr3CmoM5LS/IJoC+BGWpk4Eph3OsHuK1knp1WqXjc7
	Qs5wtas+8ve5UBQVmqTw2twrrEe5OFS9OKRPaYQ0b5zQSkD/daPYyrxuw0jYyOfJFI4lskFae7SoS
	iOBgLD04741lGU8TiYfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Nin-008vxx-15;
	Wed, 29 Nov 2023 16:47:33 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Nij-008vxS-1r
	for linux-mtd@lists.infradead.org;
	Wed, 29 Nov 2023 16:47:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F84BFF813;
	Wed, 29 Nov 2023 16:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701276444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VkefkReIWzyqiZJSPhEnTXAmzyUb/Ar5C+Xf+28fWzA=;
	b=WLP04NEXoF/EPNmxNPgwLICEHOen2oXanUWKsWRA1iZ/LZ+Qlo2awceFETEXMG1y8IfaUy
	3tTEMg09JL03ejZwL+eEGrpRQ1gyuQzVpW/ZUmxXeIaIKfdLQu/iYafXA0x9a1muGB2ALN
	h/9O6HydnjVKJS9HwOX/87S7q9ZBkgj08miJRdUhTqNiTiIaDoRjOWjCDgJXhKrY/l4x3s
	v8OZKcQP66DmMgpFcaH53QUTu8q3+Ilso0ECJ2fgkKANdrAbIBc0uExmedh6m8fwDfVX9l
	DIzGskzZEn5oMiHPHwEoadfjGwTHhNqey+gjV0KATl+6GmOvQXATEBcw4UWeZg==
Date: Wed, 29 Nov 2023 17:47:22 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Marco Felsch <m.felsch@pengutronix.de>, richard@nod.at, vigneshr@ti.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
Subject: Re: [RFC PATCH] mtd: devices: add AT24 eeprom support
Message-ID: <20231129174722.7d4e768c@xps-13>
In-Reply-To: <CAMRc=MdsEWxJLHL__zYXGEMYvvLSH99GsTRv_NTaVXt2fGtNvg@mail.gmail.com>
References: <20231127164623.1008176-1-m.felsch@pengutronix.de>
	<CAMRc=MdsEWxJLHL__zYXGEMYvvLSH99GsTRv_NTaVXt2fGtNvg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_084729_758141_ACDAC1B2 
X-CRM114-Status: GOOD (  19.70  )
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

SGVsbG8sCgpicmdsQGJnZGV2LnBsIHdyb3RlIG9uIFdlZCwgMjkgTm92IDIwMjMgMTA6MTA6Mjgg
KzAxMDA6Cgo+IE9uIE1vbiwgTm92IDI3LCAyMDIzIGF0IDU6NDbigK9QTSBNYXJjbyBGZWxzY2gg
PG0uZmVsc2NoQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPiA+ICAKPiAKPiBbc25pcF0KPiAKPiA+
Cj4gPiBJIGRyb3BwZWQgdGhlIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkgc2luY2UgdGhpcyBpcyBh
IG5ldyBkcml2ZXIgbm90Cj4gPiBoYXZpbmcgdG8gZGVhbCB3aXRoIGl0LiBUaGUgb2xkIGFuZCB0
aGUgbmV3IGRyaXZlciBjYW4gbm90IGJlIHVzZWQgYnkKPiA+IHRoZSBzYW1lIGtlcm5lbCBjb25m
aWcuIFNvIGl0IGlzIGVpdGhlciB1c2luZyB0aGUgTVREIGVlcHJvbSBkcml2ZXIKPiA+IHN1cHBv
cnRpbmcgcGFydGl0aW9uaW5nIGFuZCBOVk1FTSBvciB0aGUgb2xkZXIgb25lIHdoaWNoIGRvZXMg
bm90Cj4gPiBzdXBwb3J0IHBhcnRpdGlvbmluZyBidXQga2VlcHMgdGhlIGJhY2t3YXJkIGNvbXBh
dGliaWxpdHkuCj4gPgo+ID4gQ29tbWVudHMgYW5kIHN1Z2dlc3Rpb25zIGFyZSB2ZXJ5IHdlbGNv
bWUgOikgIAo+IAo+IEkgc2tpbW1lZCB0aHJvdWdoIHRoZSBjb2RlLiBOb3RoaW5nIG9idmlvdXNs
eSB3cm9uZy4gV2hhdCBJIHdvdWxkCj4gc3VnZ2VzdCAtIGlmIHdlJ3JlIGdvaW5nIHRvIGhhdmUg
dHdvIGF0MjQgZHJpdmVycyAtIGlzIGEgbG90IG1vcmUgY29kZQo+IHJldXNlLiBJIGRpc2xpa2Ug
dGhlIGlkZWEgb2YgaGF2aW5nIGJhc2ljYWxseSB0aGUgc2FtZSBjb2RlIGluIHR3bwo+IHBsYWNl
cyBpbiB0aGUga2VybmVsIGFuZCBoYXZpbmcgdG8gZml4IGJ1Z3MgaW4gYm90aC4KCkFncmVlZC4K
Cj4gVGhvdWdoIGlmIEknbSBiZWluZyBob25lc3QgLSBJIHdvdWxkIHByZWZlciBhIHNpbmdsZSBk
cml2ZXIgd2l0aAo+IGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5LiBIYXZlIHlvdSBlc3RpbWF0ZWQg
dGhlIGVmZm9ydCBpdCB3b3VsZCB0YWtlCj4gdG8gYWJzdHJhY3QgYm90aCBudm1lbSBhbmQgbXRk
PwoKQWxzbyBhZ3JlZWQgOi0pCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
