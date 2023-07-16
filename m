Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9A8EB64DD
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Jul 2023 13:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vPn6jldRj9HtWXV2xmqCs1JBZLIrQPh6+CGGVSNc5N0=; b=Hh4le7NKJBzQn2
	T7lc+wRniju4I19QxTkYQXhKqGXn1Y6aGm1cCsqNfJo6Eqp7HkwC/mO4B73qtpVG+MxftJxm9mP+M
	pTuT6WQPQ+uUgA10M+FAPfWJ5lOu6jD+GQN5iCXad3+ewUMx373VPQ0Q3tvZJ9CSRsyTVWUFbn+MU
	U1gDlqh6ggiliz7q64OzdUHhnahVMay+mZDLats7G8MhOcnwuWPS/eA2kiFE1Q2wVJwhrimg04n+H
	dHgIw3AFzPEviAC4wi4eL/qJa0irVW/cWZcZE1GxC1X9aMdC/DqX8USg0/4Saew0gz2Vz8jFdbRpB
	XwIH0UEWWfc1xtrQWhmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL1jm-00BS47-1d;
	Sun, 16 Jul 2023 13:24:34 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL1jX-00BRsp-0M;
	Sun, 16 Jul 2023 13:24:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 395481C0005;
	Sun, 16 Jul 2023 13:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689513849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZlAJuoojWBheC8JWE/2d5ZWEyMAatM5WLPn8urq2pfs=;
	b=pxlpXq30z8NQhVbblNWq1AJDPI30WimwJl1hF8f6qibGV5xcoD05V90VqdTf841xQE9pX8
	navcvSLTkpk3oYJkRjoCJM697aaFOkRsFlge77hLR1gr8UkgdbdOlRvjHsKOBmrB6+C35h
	tlT7+2v6o2Hwvw67jotDSktY0H5h/Gbtiv41Ld8T4fLjcZLtEqhtp9BiHFxNF6YjM3Qpsy
	XgiK8+9sGlyZqfNJHXF+blxpC8obu9KL391CUHCfrgfiOVEh+0jNBvb8BCRQv7ZNz9wKBJ
	79M+ecl7Bm03bS84Pkby9io5YgZ8ZMWa7htwxwwtha5AqeLQwKqbyJLGmNIOIw==
Date: Sun, 16 Jul 2023 15:24:05 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
 <kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v3 0/3] support 512B ECC step size for Meson NAND
Message-ID: <20230716152405.729e0922@xps-13>
In-Reply-To: <672e6a2f-21b3-77cd-fe83-04d4aa79f68e@sberdevices.ru>
References: <20230711122129.2635558-1-AVKrasnov@sberdevices.ru>
	<20230715181553.1d2b5637@xps-13>
	<672e6a2f-21b3-77cd-fe83-04d4aa79f68e@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_062419_333256_917C7B96 
X-CRM114-Status: GOOD (  17.95  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBTYXQsIDE1IEp1
bCAyMDIzIDIwOjQ4OjM0ICswMzAwOgoKPiBIZWxsbyBNaXF1ZWwhCj4gCj4gT24gMTUuMDcuMjAy
MyAxOToxNSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIEFyc2VuaXksCj4gPiAKPiA+IEFW
S3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBUdWUsIDExIEp1bCAyMDIzIDE1OjIxOjI2
ICswMzAwOgo+ID4gICAKPiA+PiBIZWxsbywKPiA+Pgo+ID4+IHRoaXMgcGF0Y2hzZXQgYWRkcyBz
dXBwb3J0IGZvciA1MTJCIEVDQyBzdGVwIHNpemUgZm9yIE1lc29uIE5BTkQuIEN1cnJlbnQKPiA+
PiBpbXBsZW1lbnRhdGlvbiBvbmx5IHN1cHBvcnRzIDEwMjRCLiBUaGVyZSBhcmUgdGhyZWUgcGF0
Y2hlczoKPiA+Pgo+ID4+IDEpIFVwZGF0ZSBmb3IgZGV2aWNlIHRyZWUgYmluZGluZ3MgdG8gcmVw
bGFjZSAnY29uc3QnIHR5cGUgb2YgZmllbGQKPiA+PiAgICAnbmFuZC1lY2Mtc3RlcC1zaXplJyB3
aXRoICdlbnVtJyB3aGljaCBjb250YWlucyA1MTIgYW5kIDEwMjQuCj4gPj4KPiA+PiAyKSBVcGRh
dGUgZm9yIGRldmljZSB0cmVlIGJpbmRpbmdzIHRvIGFkZCBkZXBlbmRlbmN5IGJldHdlZW4gcHJv
cGVydGllcwo+ID4+ICAgICduYW5kLWVjYy1zdHJlbmd0aCcgYW5kICduYW5kLWVjYy1zdGVwLXNp
emUnLgo+ID4+Cj4gPj4gMykgVXBkYXRlIGZvciBNZXNvbiBkcml2ZXIgLSBuZXcgZW51bSB2YWx1
ZSBmb3IgNTEyQiBFQ0MgYW5kIHJld29ya2VkCj4gPj4gICAgRUNDIGNhcGFiaWxpdGllcyBzdHJ1
Y3R1cmUgdG8gc3VwcG9ydCBib3RoIDUxMkIgYW5kIDEwMjRCIEVDQy4gQnkKPiA+PiAgICBkZWZh
dWx0IHRoaXMgZHJpdmVyIHVzZXMgMTAyNEIgRUNDLCA1MTJCIGNvdWxkIGJlIGVuYWJsZWQgaW4g
ZGV2aWNlCj4gPj4gICAgdHJlZS4gIAo+ID4gCj4gPiBUaGlzIHNlcmllcyBkb2VzIG5vdCBhcHBs
eSBjb3JyZWN0bHkgb24gbmFuZC9uZXh0LCB3b3VsZCB5b3UgbWluZAo+ID4gcmViYXNpbmcgKG5h
bmQvbmV4dCBvbiBsaW51eC1tdGQpIGFuZCBzZW5kaW5nIGl0IGFnYWluPyAgCj4gCj4gU3VyZSwg
YXMgSSBzZWUgMDAwMSB3YXMgYXBwbGllZCB0byBuYW5kL25leHQsIHNvIEkgY2FuIHJlc2VuZCBv
bmx5IDAwMDIgYW5kIDAwMDMsCj4gYXMgMDAwMiBpcyB0aGUgZmlyc3QgcGF0Y2ggd2hpY2ggZmFp
bHMgdG8gYXBwbHk/CgpZZXMgaW5kZWVkLgoKPiAKPiA+IAo+ID4gQlRXIHRoZSAicmZjIiBwcmVm
aXggaXMgb25seSBuZWVkZWQgZm9yIHRoZSAiZmlyc3QiIHN1Ym1pc3Npb24sIHdoZW4KPiA+IHlv
dSB0cnkgc29tZXRoaW5nICJuZXciLCBvdGhlcndpc2UgaXQgaXMgbm8gbG9uZ2VyIHJlcXVpcmVk
LiAgCj4gCj4gT2ssIGdvdCBpdAo+IAo+ID4gCj4gPiBUaGFua3MsCj4gPiBNaXF1w6hsICAKPiAK
PiBUaGFua3MsIEFyc2VuaXkKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
