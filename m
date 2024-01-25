Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20065C47258
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jan 2024 09:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TRZBpQFgbhy+FSAlAxuWX/dbquwxtTsN6j26+f1UwEk=; b=dc9CFZlNBgqB7c
	1MsfvX6RDvhUA9aniAEYGjl//UzFGNlmdouTOtDLYxoaKbOpHcUCgt+5MGQ2FWHgBqWrwG5plSJ1N
	mCw8uyyjrZVt7DDxAgVLMouCP/4UtfgjGZhmSCddj12Kz7A787Q2AE42WGVOxd0sBFo/ihYebLS+H
	ODrqyzKeLzQZ5Map5Vmrk/HBMDQa7nSY06p5eHvfJOw5XutW39b5dK8vIFQMbDBHTA4awFykttDl3
	lMKNqC0U+sGmPHixh0RWDNO9uKikwQezdsV0bkT9VPgAEwCaKQQ6jwy1nHKM3ohd2Mxn0Zo54JM0j
	/DT+Vd9AsjyvF1+RTcrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSvv4-007WF2-1y;
	Thu, 25 Jan 2024 09:21:10 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSvv0-007WDn-0x;
	Thu, 25 Jan 2024 09:21:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA3881BF219;
	Thu, 25 Jan 2024 09:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706174461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eKjAu14meoD0UWLGa1Hctnp45OsMD9+KH2IhUcbWrL4=;
	b=VQ86jc4jMi7kZpSX93HTuIEk4dHcoUQO2jYVvHJKrFbWKkXwZunjal+i7HO2/oynf2bGKQ
	CYDTSSZAWfKlxhC0kyB9aI8HFAj//uey3jcaKSEEz/1HaS2w6h2ETfSokmazYkVCoJN4pd
	9QXJE49MHmPyiPllw9VhmA2BRY5LEvfRdNWiuXqt33gGxfFbwv7BZcjNxLofLpQbSeSc+6
	tD9beY3Sn/veWmIUV2Ys8WpFFrOjXXy1++Q9ki3bL0dINJ1K0ewx2Ag+0RXhMRaZ875MXs
	+YHWh7+uEfOy3+IwWuICh8XKLw/5yed/TAzlzTOX+PxM1i1sqZwE8qGfLKzE+g==
Date: Thu, 25 Jan 2024 10:20:58 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, David Regan
 <dregan@broadcom.com>, dregan@mail.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel.peshkin@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com,
 anand.gore@broadcom.com, kursad.oney@broadcom.com, rafal@milecki.pl,
 bcm-kernel-feedback-list@broadcom.com, andre.przywara@arm.com,
 baruch@tkos.co.il, linux-arm-kernel@lists.infradead.org,
 dan.carpenter@linaro.org
Subject: Re: [PATCH v3 02/10] ARM: dts: broadcom: bcmbca: Add NAND
 controller node
Message-ID: <20240125102058.5ae46d8a@xps-13>
In-Reply-To: <722d6bdf-9a43-436d-a9e2-4c21e1deb8c3@broadcom.com>
References: <20240124030458.98408-1-dregan@broadcom.com>
	<20240124030458.98408-3-dregan@broadcom.com>
	<20240124183008.04a1bcb0@xps-13>
	<2c10a764-f74f-45b2-8bba-77c40468f4b5@broadcom.com>
	<85c97d00-a973-46c6-974c-3dfa587ae873@broadcom.com>
	<722d6bdf-9a43-436d-a9e2-4c21e1deb8c3@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_012106_701873_8368A74A 
X-CRM114-Status: GOOD (  25.16  )
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

SGkgV2lsbGlhbSwKCj4gPj4+PiArwqDCoMKgwqDCoMKgwqAgbmFuZF9jb250cm9sbGVyOiBuYW5k
LWNvbnRyb2xsZXJAMTgwMCB7Cj4gPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjYWRkcmVz
cy1jZWxscyA9IDwxPjsKPiA+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICNzaXplLWNlbGxz
ID0gPDA+Owo+ID4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJicmNt
LG5hbmQtYmNtNjMxMzgiLCA+Pj4+ICJicmNtLGJyY21uYW5kLXY3LjEiLCAiYnJjbSxicmNtbmFu
ZCI7Cj4gPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgxODAwIDB4NjAwPiwg
PDB4MjAwMCAweDEwPjsKPiA+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZy1uYW1lcyA9
ICJuYW5kIiwgIm5hbmQtaW50LWJhc2UiOwo+ID4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
YnJjbSxuYW5kLXVzZS13cCA9IDwwPjsKPiA+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0
YXR1cyA9ICJkaXNhYmxlZCI7Cj4gPj4+PiArCj4gPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBuYW5kY3M6IG5hbmRAMCB7Cj4gPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNvbXBhdGlibGUgPSAiYnJjbSxuYW5kY3MiOwo+ID4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZWcgPSA8MD47Cj4gPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIG5hbmQtb24tZmxhc2gtYmJ0Owo+ID4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBicmNtLG5hbmQtZWNjLXVzZS1zdHJhcDsgIAo+ID4+Pgo+ID4+PiBEZXNjcmliaW5nIHRo
ZSBOQU5EIGNoaXAgaW4gYSBTb0MgRFRTSSBkb2VzIG5vdCBsb29rIHJlbGV2YW50IHRvIG1lLgo+
ID4+PiBFdmVuIG1vcmUgaWYgeW91IGFkZCBzb21ldGhpbmcgbGlrZSB0aGlzIG5hbmQtZWNjLXVz
ZS1zdHJhcCBzZXR0aW5nCj4gPj4+IHdoaWNoIGlzIHZlcnkgYm9hcmQgZGVwZW5kZW50Lgo+ID4+
PiAgCj4gPj4gSSBhbSBub3Qgc3VyZSBpZiBJIHVuZGVyc3RhbmQgeW91IGNvbW1lbnRzIGNvcnJl
Y3RseSBidXQgYXJlIHlvdSA+PiBzdWdnZXN0aW5nIHRvIHB1dCB0aGlzIHdob2xlIG5hbmQgY29u
dHJvbGxlciBub2RlIGludG8gZWFjaCBib2FyZCBkdHM/ID4+IFdlIGhhdmUgb3RoZXIgaXAgYmxv
Y2sgbm9kZXMgbGlrZSBTUEksIHVhcnQgaW4gdGhpcyBzYW1lIHNvYyBkdHNpIGZpbGUgPj4gdG9v
LsKgIEZvciBhbGwgdGhlIGJjbWJjYSBzb2MgZHRzaSBJIGFtIHVwZGF0aW5nIGhlcmUoYW5kIGl0
cyBib2FyZCA+PiBkZXNpZ24pLCB3ZSBhbHdheXMgdXNlIHRoZSBzdHJhcCB0byBmb3IgZWNjIHNl
dHRpbmcuwqAgU28gSSB0aG91Z2h0IGl0ID4+IHNob3VsZCBiZSBva2F5IHRvIHB1dCBicmNtLG5h
bmQtZWNjLXVzZS1zdHJhcCBpbiB0aGUgZGVmYXVsdCBkdHNpID4+IGZpbGUuIEZvciBhbnkgYm9h
cmQgdGhhdCB1c2VzIHRoZSByYXcgbmFuZCBuYW5kLWVjYyBwcm9wZXJ0eSwgdGhlID4+IGJvYXJk
IGR0cyBjYW4gZG8gc28gYW5kIG92ZXJyaWRlIHRoZSBicmNtLG5hbmQtZWNjLXVzZS1zdHJhcCBz
ZXR0aW5nLiAgCj4gPiAKPiA+IEkgcmVhZCBNaXF1ZWwncyBjb21tZW50IGFzIG1lYW5pbmcgdGhh
dCB0aGUgbmFuZGNzIGFrYSB0aGUgTkFORCA+IGNoaXAvZmxhc2ggcGFydCBkZXNjcmlwdGlvbiBz
aG91bGQgYmUgaW4gdGhlIGJvYXJkIC5kdHMgZmlsZSwgd2hpbGUgdGhlID4gY29udHJvbGxlciBp
dHNlbGYgY2FuIHJlbWFpbiBpbiB0aGUgLmR0c2kgZmlsZSB3aXRoIGl0cyBzdGF0dXMgPSA+ICJk
aXNhYmxlZCIgcHJvcGVydHkuCj4gPiAKPiA+IEFyZSB0aGVyZSBjdXN0b21lciBib2FyZHMsIHRo
YXQgaXMgbm9uIHJlZmVyZW5jZSBib2FyZHMgdGhhdCBtaWdodCBjaG9zZSA+IGEgZGlmZmVyZW50
IGNoaXAgc2VsZWN0IG51bWJlciBhbmQvb3Igbm90IHVzZSB0aGUgc3RyYXAgc2V0dGluZ3M/ICAK
PiBJbiBCQ01CQ0EgU29DLCB0aGVyZSBpcyBvbmx5IG9uZSBjcyBhbmQgY3VzdG9tZXIgZGVzaWdu
IGFsc28gaGF2ZSB0byB1c2Ugc3RyYXAgZm9yIHRoZSBib290cm9tIHRvIGJvb3QgdXAgcHJvcGVy
bHkuICBUaGV5IGNhbiBvdmVycmlkZSBpdCB3aXRoIGR0cyBpbiBsaW51eCBidXQgSSBkb24ndCB0
aGluayBhbnkgY3VzdG9tZXIgd291bGQgZG8gdGhhdC4KPiAKPiBNYXliZSB0aGUgbmFuZC1vbi1m
bGFzaC1iYnQgY291bGQgYmUgcG9zc2libGUgaXRlbSB0aGF0IGN1c3RvbWVyIG1heSBoYXZlIHRv
IHNldCBpdCBkaWZmZXJlbnRseSBpZiB0aGV5IGRvbid0IGZvbGxvdyBvdXIgcmVmZXJlbmNlIHNv
ZnR3YXJlIGRlc2lnbi4KPiAKPiBJIHdpbGwgbW92ZSB0aGUgbmFuZC1vbi1mbGFzaC1iYnQgdG8g
dGhlIGJvYXJkIGR0cyBidXQgSSB3b3VsZCBsaWtlIHRvIGtlZXAgdGhlIG90aGVyIGRlZmF1bHQg
bmFuZGNzIHNldHRpbmdzIGluIFNvQy5kc3RpIGlmIHRoYXQgaXMgbm90IHRvbyBvdXQgb2YgdGhl
IGNvbnZlbnRpb25hbCBydWxlIGFuZCBNaXF1ZWwgaXMgb2theSB3aXRoIGl0LgoKSSB0aGluayB0
aGVyZSBpcyBhIGdsb2JhbCBtaXN1bmRlcnN0YW5kaW5nIHJlZ2FyZGluZyB0aGUgdXNlIG9mIHRo
ZQpuYW5kLWVjYy0qIHByb3BlcnRpZXMuIFRoZXNlIGFyZSBub3QgdGhlIGRlZmF1bHQuIFRoZSBk
ZWZhdWx0IGlzIHRoZSBPUwpjaG9pY2UgYW5kIGRlcGVuZHMgb24gdGhlIE5BTkQgY2FwYWJpbGl0
aWVzLiBUaGUgT1Mgd2lsbCBhbHdheXMgdHJ5IHRvCm1hdGNoIHRoZSBjbG9zZXN0IEVDQyBzZXR0
aW5ncyBvZmZlcmVkIGJ5IHRoZSBlbmdpbmUsIGJhc2VkIG9uIHRoZSBOQU5ECmNoaXAgcmVxdWly
ZW1lbnRzIHdoaWNoIGFyZSBkaXNjb3ZlcmFibGUuIElmIHlvdSB3YW50IHRvIG1heGltaXplIHlv
dXIKc3RyZW5ndGgsIGl0IGlzIGFsc28gcG9zc2libGUgdG8gdGVsbCB0aGUgT1Mgd2l0aCBhIGRl
ZGljYXRlZCAoZ2VuZXJpYykKcHJvcGVydHkuIEFuZCBvbmx5IGlmIHlvdSB3YW50IHNvbWV0aGlu
ZyBkaWZmZXJlbnQsIHlvdSBtYXkgdXNlIHRoZXNlCnByb3BlcnRpZXMsIGJ1dCB0aGV5IHNob3Vs
ZCBiZSB0aGUgZXhjZXB0aW9uIHJhdGhlciB0aGFuIHRoZSBydWxlLgoKT3ZlcnJpZGluZyB0aGlz
IHdpdGggYSBzdHJhcCBpcyBhIGJhZCBoYXJkd2FyZSBkZXNpZ24gb24gY29tbWVyY2lhbApwcm9k
dWN0cyBJTU8uIEkgYW0gdG90YWxseSBmaW5lIHdpdGggdGhlIGlkZWEgb2YgYSBzdHJhcCB0byBj
aG9vc2UKdGhlIEVDQyBjb25maWd1cmF0aW9uIGZvciBkZXZlbG9wbWVudCBib2FyZHMvZXZhbHVh
dGlvbiBraXRzLCBidXQgb25jZQp5b3UndmUgZGVjaWRlZCB3aGljaCBzZXR0aW5nIHlvdSB3YW50
IHlvdSBjYW5ub3QgY2hhbmdlIGl0IGZvciB0aGUKbGlmZXRpbWUgb2YgeW91ciBwcm9qZWN0IChv
ciB3aXRoIGEgbG90IG9mIGRpZmZpY3VsdGllcykgc28gSSBkb24ndCBzZWUKdGhlIHBvaW50IG9m
IHN1Y2ggYSBzdHJhcC4gU28gcmVhbGx5LCBJIGRvbid0IGxpa2UgdGhlIGlkZWEgb2YgZGVmaW5p
bmcKYnkgZGVmYXVsdCBhIHZhcmlhYmxlIHdoaWNoIGFza3MgZm9yIGFuIG92ZXJyaWRlIG9mIHRo
ZSBkZWZhdWx0cywgZXZlbgp0aG91Z2ggbWFueSBvZiB5b3VyIGN1c3RvbWVycyBtaWdodCB3YW50
IHRvIHVzZSB0aGF0LgoKU28sIGFueXRoaW5nIHRoYXQgaXMgZGVzaWduIGRlcGVuZGVudCAodGhl
IGNoaXAgQ1MsIEVDQwpjb25maWd1cmF0aW9uLCBldGMpIHNob3VsZCBnbyBpbnRvIHRoZSBib2Fy
ZCBEVFMsIGFuZCB3aGF0IGlzIFNvQwpyZWxhdGVkIGhhcmR3YXJlIChsaWtlIHRoZSBkZWZpbml0
aW9uIG9mIHRoZSBOQU5EIGNvbnRyb2xsZXIpIHNob3VsZApzdGF5IGluIHRoZSBEVFNJLCBhcyBw
cm9wZXJseSBjbGFyaWZpZWQgYnkgRmxvcmlhbi4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
