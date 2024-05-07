Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB35EC25B74
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2024 07:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vbKvLaQJC8gWbxfz2C1HE+fZN3F7DPHnQEMIs6p0eB4=; b=CLFhB2DsBzzx0A
	3d4lE0IIPn/Tr+mpqKQa6Jxj89Z+jlPwON70d9jODrPSiknTzqlQgvyUsnfFnds5KAwZhnGzJsruO
	HXJPRXWNOmqEMJ/OLXoBqczeHd04n1wXzekSE/fx5am8qCYfaTPSpmyH72r21qCH9RM5855HH3hUi
	VrEPsCfwMKC7RSu+1ZSNOD/TKFIsKY1EGKOdhnrPblclc/6XEm9BnK0ML5e4A5MDOrnA81z0c346q
	hl8kSznzyN6XwCmbvxMfs1/8gKekuXiYr1ifhQcHHlbIg7xIAc83naSKfzc++Uc2vMSHmxPs1IaB4
	wEIQpND/yw7D6OXKiUKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4FEj-00000009ypJ-0NbK;
	Tue, 07 May 2024 07:27:41 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4FEe-00000009ymj-32On;
	Tue, 07 May 2024 07:27:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A155D24000B;
	Tue,  7 May 2024 07:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715066849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hP/KCyJu/jC8qwnU4+ma1+qdgNY2kC0wtIaU2BlN2Ac=;
	b=SGwQ/VNurTMMep1bl+Igu0U09fhmyUGntaSDl5Xk6HXMXB2WENivRB0MTOb+fQs9KbV0Sj
	wT6SxUawqtYG5Tz4Ps3OZbuUZGUX4dbdyj3Dd2UU6v6mPFp055Qxo2B3inVBzS4yB+pf0l
	o1gqec4A4XshTe20snNzyRZ7e9QR4GVOWKZv4xqfQPyivhcmL4L4Y94QHfXPB6XhQIBAg1
	yGmLd30KzUXGl+Je7dGhhYieOy+A3dZBXVpYQh1ZSpnNHu3zkLFtqI82hqh9Y5KCTLIEjG
	0eVaM7OqT3Pva2HoXqYxnSDhh/CIFwGuPdNrjQIKneVaYFgeUZB7q3gnZcwCOA==
Date: Tue, 7 May 2024 09:27:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <oxffffaa@gmail.com>, <kernel@sberdevices.ru>
Subject: Re: [PATCH v5 1/2] dt-bindings: mtd: amlogic,meson-nand: support
 fields for boot ROM code
Message-ID: <20240507092726.4ab1afdb@xps-13>
In-Reply-To: <d90f9d3d-7823-503f-4cc6-73783a083d0e@salutedevices.com>
References: <20240416085101.740458-1-avkrasnov@salutedevices.com>
	<20240416085101.740458-2-avkrasnov@salutedevices.com>
	<20240506154858.003bab54@xps-13>
	<d90f9d3d-7823-503f-4cc6-73783a083d0e@salutedevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_002736_940353_1ED4A202 
X-CRM114-Status: GOOD (  16.90  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYWx1dGVkZXZpY2VzLmNvbSB3cm90ZSBvbiBUdWUsIDcg
TWF5IDIwMjQgMDk6NTM6MDYgKzAzMDA6Cgo+IE9uIDA2LjA1LjIwMjQgMTY6NDgsIE1pcXVlbCBS
YXluYWwgd3JvdGU6Cj4gPiBIaSBBcnNlbml5LAo+ID4gCj4gPiBhdmtyYXNub3ZAc2FsdXRlZGV2
aWNlcy5jb20gd3JvdGUgb24gVHVlLCAxNiBBcHIgMjAyNCAxMTo1MTowMCArMDMwMDoKPiA+ICAg
Cj4gPj4gQm9vdCBST00gY29kZSBvbiBNZXNvbiByZXF1aXJlcyB0aGF0IHNvbWUgcGFnZXMgb24g
TkFORCBtdXN0IGJlIHdyaXR0ZW4KPiA+PiBpbiBzcGVjaWFsIG1vZGU6ICJzaG9ydCIgRUNDIG1v
ZGUgd2hlcmUgZWFjaCBibG9jayBpcyAzODQgYnl0ZXMgYW5kCj4gPj4gc2NyYW1ibGluZyBtb2Rl
IGlzIG9uLiAgCj4gPiAKPiA+IE9rCj4gPiAgIAo+ID4+IFN1Y2ggcGFnZXMgbG9jYXRlZCB3aXRo
IHRoZSBzcGVjaWZpZWQgaW50ZXJ2YWwgd2l0aGluIHNwZWNpZmllZCBvZmZzZXQuICAKPiA+IAo+
ID4gSSdtIHNvcnJ5IEkgZG9uJ3QgZ2V0IHRoYXQgc2VudGVuY2UuICAKPiAKPiBTb3JyeSwgSSBt
ZWFuIHRoaXMgKGxldCBtZSBkcmF3IDopICkgOgo+IAo+IFsgcGFnZSAwIF1bIHBhZ2UgMSBdWyBw
YWdlIDIgXVsgcGFnZSAzIF1bIHBhZ2UgNCBdWyBwYWdlIDUgXVsgcGFnZSA2IF1bIHBhZ2UgNyBd
WyBwYWdlIDggXVsgcGFnZSA5IF0KPiAKPiBGb3IgZXhhbXBsZSwgd2UgaGF2ZSAxMCBwYWdlcyBz
dGFydGluZyBmcm9tIHRoZSBiZWdpbm5pbmcgb2YgdGhlIGNoaXAgLSB0aGlzIGlzICJ3aXRoaW4g
c3BlY2lmaWVkIG9mZnNldCIsCj4gZS5nLiBvZmZzZXQgaXMgMTAuIEJvb3RST00gb24gYXhnIG5l
ZWRzIHRoYXQgKGZvciBleGFtcGxlKSBldmVyeSB0aGlyZCBwYWdlIG11c3QgYmUgd3JpdHRlbiBp
biAic3BlY2lhbCIKPiBtb2RlOiBzY3JhbWJsaW5nIGlzIG9uIGFuZCBFQ0MgaXMgMzg0IGJ5dGVz
LiBTdWNoIHBhZ2VzIGFyZSAwLCAyLCA0LCA2LCA4LiBFLmcuICJzcGVjaWZpZWQgaW50ZXJ2YWwi
IHdpbGwKPiBiZSAzLgoKU2hhbGwgYmUgMiwgbm8/Cgo+IAo+IFNvOgo+IAo+IGFtbG9naWMsYm9v
dC1wYWdlczogMTAKPiBhbWxvZ2ljLGJvb3QtcGFnZS1zdGVwOiAzCgpPayBJIGdldCBpdC4gVGhh
bmtzIGZvciB0aGUgZXhwbGFuYXRpb24uIEkgZG9uJ3QgcmVhbGx5IHVuZGVyc3RhbmQgdGhlCmxv
Z2ljIGJlaGluZCBpdCB0aG91Z2guIERvIHlvdSBrbm93IHdoeSB0aGUgYm9vdFJPTSB3b3VsZCBh
Y2Nlc3Mgb25seQpvbmUgcGFnZSBvdmVyIDIgb3IgMz8gSXMgdGhlcmUgYSBkZWZhdWx0IHZhbHVl
PyBJcyB0aGlzIGNvbmZpZ3VyYWJsZT8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
