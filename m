Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5368C48BF6
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Feb 2024 09:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B0Klp5CKozmN5HhOdWi+QD+20rzDXvFr+N6SwUJEHLE=; b=tQUTJX+AHbXq5q
	dKjFIJk9VhrMx3j/kZ6ilEsSU0Nn6izcJg5QNY3q8Bvb66a6X4ofYf3VRryou+JVulSYtLjkrfG0v
	gnpbnxRFwwIhQadRVzdVvDK1ohiOFVldGDekQF9FdzdGfcrHx7+YfrGMhc3jvFvsc4vMNY0uKDIar
	/o2NXRsANyH8cowO/IfrQF5TPQX06E4QHla+HcNSjjK9qlMv9klKHb0FKkY50miO1oXGxXsQqrxHW
	H0DsNXoM7xwFrsp59avsOJ8CduyC1QKxBMlyTBn0L8wb5PkMoRwgpUUwQft4vBMAEI8CC60bTHlqn
	YVIdthB1qoHlkT/s8APQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfcRh-0000000CoSQ-1Ror;
	Thu, 29 Feb 2024 09:11:17 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfcRb-0000000CoM1-2DAX;
	Thu, 29 Feb 2024 09:11:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54D971C0003;
	Thu, 29 Feb 2024 09:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709197864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=92kcB/YWV/ntVY4lUpHJZK6FifLlezb1/MacIybeCsg=;
	b=SdbJLXmCFd0rOyH8r2S+5m5ptygyt4hKf/BSNCwEexSKapjtMqt7+fR4vbLUZwd6zeIkl8
	vaL6jdfUbGcr+6AJMijzqNFPUF0aBBI+IY2FPzHBW2N8xcG0yzxseW3H9b8PgZcpp5309F
	nYPJAiM0bYYIqyKwNrn+gy/cwBifKRIUj0p1WclHxVe2RBoM1St6OV7BGkcRbjSX8hmqKJ
	y8TZc8zeVzfLRxm1sHP+0Zj2XKulZrtdN+wofeFeD0tcoRFDM0PnSxim2gm/D15IP7Q3WD
	ruxNruv2+Vc/5pyadr+81BPlRVuX11ux9UxrN16lscUYLLQ6/gIfXVI6hkMH9g==
Date: Thu, 29 Feb 2024 10:11:01 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: William Zhang <william.zhang@broadcom.com>, Linux MTD List
 <linux-mtd@lists.infradead.org>, Linux ARM List
 <linux-arm-kernel@lists.infradead.org>, Broadcom Kernel List
 <bcm-kernel-feedback-list@broadcom.com>, f.fainelli@gmail.com,
 kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 anand.gore@broadcom.com, dregan@mail.com, kamal.dasu@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com, Andre Przywara
 <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?B?UmFmYcWCIE1pxYJl?=
 =?UTF-8?B?Y2tp?= <rafal@milecki.pl>, David Regan <dregan@broadcom.com>,
 devicetree@vger.kernel.org, Alexandre TORGUE <alexandre.torgue@st.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Brian Norris
 <computersforpeace@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v6 00/13] mtd: rawnand: brcmnand: driver and doc updates
Message-ID: <20240229101101.5208195c@xps-13>
In-Reply-To: <90ecf4d2-0eee-48e6-8222-7d3b5fd52b2f@broadcom.com>
References: <20240223034758.13753-1-william.zhang@broadcom.com>
	<90ecf4d2-0eee-48e6-8222-7d3b5fd52b2f@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_011112_021133_6A18594B 
X-CRM114-Status: GOOD (  20.50  )
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

SGkgRmxvcmlhbiwKCmZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tIHdyb3RlIG9uIE1vbiwg
MjYgRmViIDIwMjQgMDk6MzY6MDIgLTA4MDA6Cgo+IE9uIDIvMjIvMjQgMTk6NDcsIFdpbGxpYW0g
Wmhhbmcgd3JvdGU6Cj4gPiBUaGlzIHBhdGNoIHNlcmllcyBpcyBhbiB1cGRhdGUgZnJvbSB0aGUg
cHJldmlvdXMgdmVyc2lvbiBbMV0gYWZ0ZXIKPiA+IGV4ZXhfb3Agc3VwcG9ydCBhbmQgZml4ZXMg
KHBhdGNoIDEgdG8gNCBmcm9tIHRoZSBwcmV2aW91cyB2ZXJzaW9uLikKPiA+IAo+ID4gSXQgdXBk
YXRlcyBhbGwgdGhlIEJDTUJDQSBTb0MgdG8gc3VwcG9ydCB0aGUgbmFuZCBjb250cm9sbGVyIGFu
ZCBhZGQKPiA+IGZ1bmN0aW9ucyB0byBoYW5kbGUgQkNNQkNBIHNwZWNpZmljIG5lZWRzIG9uIEVD
QyBhbmQgV3JpdGUgUHJvdGVjdGlvbgo+ID4gdXNhZ2UuIFRoZSBkZXZpY2UgdHJlZSBkb2N1bWVu
dCBpcyBhbHNvIHVwZGF0ZWQgYWNjb3JkaW5nbHkgd2l0aCB0aGUgbmV3Cj4gPiBwcm9wZXJ0aWVz
IG5lZWRlZCBieSB0aGUgZHJpdmVyLgo+ID4gCj4gPiBJbiBhZGRpdGlvbiB0aGVyZSBpcyBhIGJ1
ZyBmaXggZm9yIGV4ZWNfb3AgaGVscGVyIGZ1bmN0aW9ucywgbG9nIGxldmVsCj4gPiBhZGp1c3Rt
ZW50IG9uIHVuY29ycmVjdGFibGUgRUNDIGVycm9yIGFuZCBzb21lIGNvZGluZyBzdHlsZSBmaXhl
cy4KPiA+IAo+ID4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMzA2MDYyMzEy
NTIuOTQ4MzgtMS13aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbS8gIAo+IAo+IE1pcXVlbCwgdGhh
bmtzIGZvciBoYXZpbmcgYXBwbGllZCB0aGUgcGF0Y2hlcywgd2Ugc2hvdWxkIGhhdmUgZGlzY3Vz
c2VkIGFoZWFkIG9mIHRpbWUgd2hldGhlciB5b3Ugc2hvdWxkIHRha2UgdGhlIFNvQy9ib2FyZC1s
ZXZlbCBEVFMgY2hhbmdlcyB0aHJvdWdoIHlvdXIgdHJlZSBvciBtaW5lLCBidXQgaXQncyBmaW5l
IGVpdGhlciB3YXkgYW5kIHNob3VsZCBub3QgbGVhZCB0byBjb25mbGljdHMgaW4gTGludXMnIHRy
ZWUuCgpJJ20gc29ycnkgZm9yIG5vdCB0aGlua2luZyBhYm91dCB0aGlzIGFoZWFkIG9mIHRpbWUs
IEkgd2FzIGFsc28gbm90CkNjZWQgb24gdGhlIG90aGVyIHBhdGNoZXMsIEkgbm90aWNlZCBpdCAo
dG9sZCBXaWxsbGlhbSkgYW5kIGp1c3QgZm9yZ290CmFib3V0IHRoaXMgd2hlbiBJIGFwcGxpZWQg
dGhlIHNlcmllcy4KCkl0IGlzIGN1cnJlbnRseSBsaXZpbmcgaW4gLW5leHQgc28gaWYgdGhlcmUg
aXMgYW55IHByb2JsZW0gSSBjYW4gc3RpbGwKYWN0LgoKSG93ZXZlciBmb3IgdGhpcyBraW5kIG9m
IGNoYW5nZSBJIHVzdWFsbHkgYXBwbHkgdGhlIGJpbmRpbmdzIGFuZCAuYwpjaGFuZ2VzIGluZGVw
ZW5kZW50bHkgZnJvbSB0aGUgRFQgcGF0Y2hlcy4gSSBiZWxpZXZlIHRoZXJlIGlzIG5vCnByb2Js
ZW0gaGF2aW5nIG9uZSBvciB0aGUgb3RoZXIgYmVpbmcgbWVyZ2VkIGZpcnN0LCBvciBkbyBJIG92
ZXJsb29rCnNvbWV0aGluZz8KCkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
