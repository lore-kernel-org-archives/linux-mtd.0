Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795E9D3ABED
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 18:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=URq26jNAyF0ungOqqEy3UIzFHp86VvRXIYjome/WC58=; b=gq7eLxEW+JNHok
	36FK27es57VJoeX8JIlSTowL9AizgV43etG6cxksbl4RQCfRAxkEmFF/fmjXZqpMEuLRg8g3VLJ1A
	dWGaJ2YydwB7O2QL5uJNx4D6hpRwEKFjjVmIZ6WZ5f/+S+hWPNjZTAj6uKsPK7nej4KHw3T2XO97T
	VPvOxRcfLdl0SofzKm/ttnBq29JlC3yLSse1AQBDs0x6Vtntx8iP7g9POPARHEzgaRwyMw/qHtjyF
	S1aE2GbQhZmXmONVtYhXCDmDMMlvXCkQgMPZHaV7/ujWtBhgXwO7xgr16qHV78SOqZlYAH4SmKB7/
	iAWswhIy9CBTkYf2ilKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZTq-00000000xNU-2StW;
	Mon, 11 Nov 2024 18:49:42 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZTm-00000000xMK-3vWb
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 18:49:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F24AC0004;
	Mon, 11 Nov 2024 18:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731350975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QcM/qM9hXwBzQaa0r2xD0tpKR2lLYUpy1JeFZyOu0/c=;
	b=bKU6hPwaVc8EBA08i6Fi8CQR7UUcYd1+sBxNvVUHXbuHZLAz8A3OexQ/+k+YYMDx33373Q
	tQKwwpM1ROotI665XUOQ0epRy0XBF6kj3h8r+PS8fHbEgsIOrTL8CxXrlzC2C7dDj0c4dO
	Z+9Urzevn1pWNDPoDHeoxsPJb5V6ZXdAr2Z4+9hGgM9giLDf2uCyIDMF7FX+rKcF29pC+l
	xBOIORwKM81yJJLHoYsc5aByle5oC4rL+ht82FdxXe15fV6Sn6DfmyDTAXR6pnBlSXECXG
	3pT+UYaYRyoaPOZKMamyGs8VRDry/3ISQqim9Z7BYCG0Ga/YeQZL1uFUPfTBug==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org,  richard@nod.at,  vigneshr@ti.com,
  tudor.ambarus@linaro.org,  pratyush@kernel.org,  mwalle@kernel.org,
  kr.kim@skyhighmemory.com,  zhi.feng@skyhighmemory.com,
  Bacem.Daassi@infineon.com,  Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH 2/2] mtd: spinand: Add support for SkyHigh S35ML-3 family
In-Reply-To: <f7e1ac25cc8707a712eafff027ce442f6f2d0aed.1730340421.git.Takahiro.Kuwano@infineon.com>
	(tkuw's message of "Thu, 31 Oct 2024 11:21:55 +0900")
References: <cover.1730340421.git.Takahiro.Kuwano@infineon.com>
	<f7e1ac25cc8707a712eafff027ce442f6f2d0aed.1730340421.git.Takahiro.Kuwano@infineon.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 11 Nov 2024 19:49:33 +0100
Message-ID: <87jzd9sj0i.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_104939_127318_0DFBEC70 
X-CRM114-Status: GOOD (  10.73  )
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

T24gMzEvMTAvMjAyNCBhdCAxMToyMTo1NSArMDksIHRrdXc1ODQ5MjRAZ21haWwuY29tIHdyb3Rl
OgoKPiBGcm9tOiBUYWthaGlybyBLdXdhbm8gPFRha2FoaXJvLkt1d2Fub0BpbmZpbmVvbi5jb20+
Cj4KPiBTa3lIaWdoIFMzNU1MMDFHMzAwLCBTMzVNTDAxRzMwMSwgUzM1TUwwMkczMDAsIGFuZCBT
MzVNTDA0RzMwMCBhcmUgMUdiLAo+IDJHYiwgYW5kIDRHYiBTTEMgU1BJIE5BTkQgZmxhc2ggZmFt
aWx5LiBUaGlzIGZhbWlseSBvZiBkZXZpY2VzIGhhcwo+IG9uLWRpZSBFQ0Mgd2hpY2ggcGFyaXR5
IGJpdHMgYXJlIHN0b3JlZCB0byBoaWRkZW4gYXJlYS4gSW4gdGhpcyBmYW1pbHkKPiB0aGUgb24t
ZGllIEVDQyBjYW5ub3QgYmUgZGlzYWJsZWQgc28gcmF3IGFjY2VzcyBuZWVkcyB0byBiZSBwcmV2
ZW50ZWQuCj4KPiBMaW5rOiBodHRwczovL3d3dy5za3loaWdobWVtb3J5LmNvbS9kb3dubG9hZC9T
UElfUzM1TUwwMV8wNEczXzAwMl8xOTIwNS5wZGY/dj1QCj4gU2lnbmVkLW9mZi1ieTogVGFrYWhp
cm8gS3V3YW5vIDxUYWthaGlyby5LdXdhbm9AaW5maW5lb24uY29tPgo+IFNpZ25lZC1vZmYtYnk6
IEtSIEtpbSA8a3Iua2ltQHNreWhpZ2htZW1vcnkuY29tPgoKUGxlYXNlIGhhdmUgYSBsb29rIHRv
IHRoZSBkb2N1bWVudGF0aW9uIHJlZ2FyZGluZyBob3cgdG8gZG9jdW1lbnQKYXV0aG9yc2hpcCwg
YmVjYXVzZSBjdXJyZW50bHkgdGhlIHRhZ3MgYXJlIHdyb25nLgoKLi4uCgo+ICtzdGF0aWMgaW50
IHNreWhpZ2hfc3BpbmFuZF9pbml0KHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCkKPiAr
ewo+ICsJLyogQTBbMV0gbXVzdCBiZSBlbmFibGVkIGJlZm9yZSBibG9jayB1bmxvY2sgKi8KCldo
YXQgaXMgQTBbMV0gPyBJdCBkb2VzIG5vdCBtZWFuIGFueXRoaW5nIGhlcmUsIHBsZWFzZSBiZSBt
b3JlIGV4cGxpY2l0LgoKPiArCXJldHVybiBzcGluYW5kX3dyaXRlX3JlZ19vcChzcGluYW5kLCBS
RUdfQkxPQ0tfTE9DSywKPiArCQkJCSAgICBTS1lISUdIX0NPTkZJR19QUk9URUNUX0VOKTsKPiAr
fQo+ICsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBzcGluYW5kX21hbnVmYWN0dXJlcl9vcHMgc2t5
aGlnaF9zcGluYW5kX21hbnVmX29wcyA9IHsKPiArCS5pbml0ID0gc2t5aGlnaF9zcGluYW5kX2lu
aXQsCj4gK307CgpPdGhlcndpc2UgdGhpcyBsb29rcyBnb290IGRvIG1lLgoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
