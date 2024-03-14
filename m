Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9E6C54E5D
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2024 23:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F/662HsaR4IGtF/8gV8H+nzlrSdrPCJdAemin8MaXBk=; b=pLz8iFwUtHQSTM
	w0Wthq710j5xkZ1k8zb8tpnEEwuV5ibhbwLdUNh4/CQuVuLBwc0bXj7CtigGs282PSq+NctWVIBOu
	rwF9hx0M71F9VRhjJVOqFtmkwq43C11fX+AaEpKT1J0ZVsuHwJomsZT0KaOAGQ3N+Leu1OF5QIlPZ
	y/Thll6q2hRK3k8SXiagQWugv56P9GlXO+XhfC80Ws8kXQC01BuvL1P+o6m5htNM4GSwx/tGTt5PT
	dJQgeUKXmXZAq5fZY5Zb8zoEmgzx5zxfboOKri1NguGsoj9txlU4LqBsCkLxy9dV08BjWc54l9T32
	BX2f/TaMSv3DLPpXzEjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rku7E-0000000FuIC-1iQU;
	Thu, 14 Mar 2024 23:04:00 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rku7A-0000000FuGv-2vz0;
	Thu, 14 Mar 2024 23:03:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 80A7C1C0003;
	Thu, 14 Mar 2024 23:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710457433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=unEWSBHMmHpgZhaHuZAnj8KkOfObLBKQC0NwtECu18w=;
	b=cahI+a5hBJzOfDEYgrR2KyOvSqJmsXoxLVI82kgnk8R1TSQ5xQvwx10sKl0hxuWKlq8pQo
	osvjm01aoyslbo1pcCuJQYayrxn1XDW0FHIZciU01P5YEZk0W54RYDb5qx5M7mOhoTRq2k
	QfMJOsG24JkMDkQZB2evW3L2vqsLBx99ecWibrR6H/WufUlbjGkQOaVgo8mTalcz9Og2FR
	K5a/yYD0C/TDewzy4WEvB3PVk76GUYtWmJQgqHGHGargunVeIAquBoB77hGnsEy964hkeB
	25PnhmAij03G/ng+jlsSTg4WSssKIFnZcg42GCnrCsag6jiYL5x1G/0QvpcWng==
Date: Fri, 15 Mar 2024 00:03:46 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, William Zhang
 <william.zhang@broadcom.com>, Linux MTD List
 <linux-mtd@lists.infradead.org>, Linux ARM List
 <linux-arm-kernel@lists.infradead.org>, Broadcom Kernel List
 <bcm-kernel-feedback-list@broadcom.com>, kursad.oney@broadcom.com,
 joel.peshkin@broadcom.com, anand.gore@broadcom.com, dregan@mail.com,
 kamal.dasu@broadcom.com, tomer.yacoby@broadcom.com,
 dan.beygelman@broadcom.com, Andre Przywara <andre.przywara@arm.com>, Rob
 Herring <robh+dt@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>, Conor
 Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, David Regan <dregan@broadcom.com>,
 devicetree@vger.kernel.org, Alexandre TORGUE <alexandre.torgue@st.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Brian Norris
 <computersforpeace@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v6 00/13] mtd: rawnand: brcmnand: driver and doc updates
Message-ID: <20240315000346.6fad883e@xps-13>
In-Reply-To: <d3c66783-b71f-431f-9028-45897f12f2a0@gmail.com>
References: <20240223034758.13753-1-william.zhang@broadcom.com>
	<90ecf4d2-0eee-48e6-8222-7d3b5fd52b2f@broadcom.com>
	<20240229101101.5208195c@xps-13>
	<20240314230402.5fc7bbf3@xps-13>
	<d3c66783-b71f-431f-9028-45897f12f2a0@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_160357_325745_7E755B7F 
X-CRM114-Status: GOOD (  28.98  )
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

Cj4gPj4gSSdtIHNvcnJ5IGZvciBub3QgdGhpbmtpbmcgYWJvdXQgdGhpcyBhaGVhZCBvZiB0aW1l
LCBJIHdhcyBhbHNvIG5vdAo+ID4+IENjZWQgb24gdGhlIG90aGVyIHBhdGNoZXMsIEkgbm90aWNl
ZCBpdCAodG9sZCBXaWxsbGlhbSkgYW5kIGp1c3QgZm9yZ290Cj4gPj4gYWJvdXQgdGhpcyB3aGVu
IEkgYXBwbGllZCB0aGUgc2VyaWVzLgo+ID4+Cj4gPj4gSXQgaXMgY3VycmVudGx5IGxpdmluZyBp
biAtbmV4dCBzbyBpZiB0aGVyZSBpcyBhbnkgcHJvYmxlbSBJIGNhbiBzdGlsbAo+ID4+IGFjdC4K
PiA+Pgo+ID4+IEhvd2V2ZXIgZm9yIHRoaXMga2luZCBvZiBjaGFuZ2UgSSB1c3VhbGx5IGFwcGx5
IHRoZSBiaW5kaW5ncyBhbmQgLmMKPiA+PiBjaGFuZ2VzIGluZGVwZW5kZW50bHkgZnJvbSB0aGUg
RFQgcGF0Y2hlcy4gSSBiZWxpZXZlIHRoZXJlIGlzIG5vCj4gPj4gcHJvYmxlbSBoYXZpbmcgb25l
IG9yIHRoZSBvdGhlciBiZWluZyBtZXJnZWQgZmlyc3QsIG9yIGRvIEkgb3Zlcmxvb2sKPiA+PiBz
b21ldGhpbmc/ICAKPiA+IAo+ID4gV2hhdCB0aGUgaGVjayAvb1wgSSBqdXN0IHVuZGVyc3RhbmQg
bm93IG15IG1pc3Rha2UsIEkgYW0gdmVyeSB0cnVseQo+ID4gc29ycnkgZm9yIHRoYXQuLi4KPiA+
IAo+ID4gWW91IHdlcmUgdGVsbGluZyBtZSBJIHNob3VsZCBzeW5jIHdpdGggeW91IGJlZm9yZSB0
YWtpbmcgRFQgY2hhbmdlcywKPiA+IGFuZCBJIHdhcyBzbyBjb252aW5jZWQgSSBfZGlkX25vdF8g
dGFrZSB0aGUgRFQsIHdoZW4gSSBsb29rZWQgYXQgdGhlCj4gPiBicmFuY2ggSSBkaWQgbm90IHVu
ZGVyc3RhbmQgeW91ciBwb2ludC4gQnV0IEkgYW0gdG90YWxseSBzb3JyeSBJCj4gPiBhY3R1YWxs
eSBkaWQgdGFrZSB0aGUgRFRzIGJ5IG1pc3Rha2UgYW5kIEkgdHJ1bHkgZGlkIG5vdCBub3RpY2Ug
aXQuCj4gPiBDb25maXJtYXRpb24gYmlhcyBJIHN1cHBvc2UuIE15IHZlcnkgc2luY2VyZSBhcG9s
b2dpZXMuCj4gPiAKPiA+IEFzIG1lbnRpb25lZCBwcmV2aW91c2x5LCBJIHdhcyBub3QgQ0MnZWQg
b24gdGhlIERUIHBhdGNoZXMsIGJ1dCBJCj4gPiBiZWxpZXZlIHRoZSBsaW51eC1tdGQgbGlzdCB3
YXMsIHNvIHRoZSBwYXRjaGVzIGRpZG4ndCBhcHBlYXIgaW4gbXkKPiA+IGluYm94LCBhbmQgb25j
ZSBJIHdhcyBoYXBweSB3aXRoIHRoZSBiaW5kaW5nL2RyaXZlciBjaGFuZ2VzIEkgYXBwbGllZAo+
ID4gaXQgYWxsIHdpdGhvdXQgbm90aWNpbmcgdGhlIERUIGNoYW5nZXMgaGFkIHNuZWFrZWQgaW4u
Cj4gPiAKPiA+IEknbSBmaW5hbGx5IHByZXBhcmluZyB0aGUgUFIgZm9yIExpbnVzIGFuZCBJIHNl
ZSBpdCBub3cuLi4KPiA+IAo+ID4gSSBiZWxpZXZlIHRoZSBTb0MgdHJlZSBpcyBjbG9zZWQgbm93
IHNvIGl0J3MgdXAgdG8geW91IHdoYXQgSSBzaG91bGQgZG8KPiA+IHdpdGggdGhlbS4gTGV0IG1l
IGtub3cgaWYgeW91IHdhbnQgbWUgdG8ga2VlcCB0aGVtIGluIG15IHRyZWUgYW5kCj4gPiBmb3J3
YXJkIHRoZW0gdG8gTGludXMgb3IgaWYgSSBzaG91bGQgZHJvcCB0aGVtIGFuZCB5b3UnbGwgdGFr
ZSB0aGVtIGZvcgo+ID4gdGhlIG5leHQgY3ljbGUuIEFsc28sIGlmIEkga2VlcCB0aGVtLCBzaGFs
bCBJIGFkZCBzb21lIHRhZyBvZiB5b3VycyBvbgo+ID4gdGhlc2UgMyBwYXRjaGVzPyBGb3IgdGhl
IHJlY29yZCBJIGRpZCBub3QgcmV2aWV3IHRoZW0uICAKPiAKPiBZZXMgcGxlYXNlIGFkZCBteToK
PiAKPiBBY2tlZC1ieTogRmxvcmlhbiBGYWluZWxsaSA8Zmxvcmlhbi5mYWluZWxsaUBicm9hZGNv
bS5jb20+Cj4gCj4gdGFnLCBhbmQgaXQncyBmaW5lIEkgZG9uJ3QgZXhwZWN0IHRoYXQgd2Ugd2ls
bCBnZXQgY29uZmxpY3RzIGZvciB0aG9zZSBmaWxlcy4KPiAKPiA+IAo+ID4gVGhhbmtzIGFuZCBh
Z2FpbiwgSSdtIGNvbmZ1c2VkLiBJIG5ldmVyIGFwcGx5IERUIHBhdGNoZXMgbGlrZSB0aGF0LAo+
ID4geW91ciBpbml0aWFsIHJlbWFyayB3YXMgbW9yZSB0aGFuIGxlZ2l0aW1hdGUuICAKPiAKPiBO
b3QgYSBwcm9ibGVtIQoKVGhhbmtzIDotKQoKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
