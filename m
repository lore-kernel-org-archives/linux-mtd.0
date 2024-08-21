Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDEEC52D6F
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2024 13:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WWlvSdNa9PWP0p9OizcmKALDgysxWuWIfrnS3tKxX/A=; b=zct83onj2cFpDY
	qzKkcbNYf24I/n5ImeznHBsUTTL7Q6WJhTWM1CEgPhQbpQOtdcav50r3ATdCmTteTeX89fHwAF63/
	jI11B7hC1gWxNpr6HXSyDlXFrizFhjubi2brm2gmkDeCsUnAub3MGUkd5GInl5m+FVFNQjKideEHn
	6l0m5XsLeUhO4veM1b+1NlrXGk0VeHwb2OqgbIB7Lg0j+7NzJoxFbEyFcon6k/pE6hfCHnwZf5ZeY
	TES7RqtLVpwtcBq/cTOYQyVL85Ohg8CYTeviI38l57vGwL9urcdn2A0zH1C+/dR6sWZsN0qFGmi0c
	R7WNUwv7M7bfVtP5l20w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sglDn-000000096Lx-3wgT;
	Wed, 21 Aug 2024 13:17:55 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sglD0-00000009684-3E68;
	Wed, 21 Aug 2024 13:17:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3AB3E20005;
	Wed, 21 Aug 2024 13:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724246224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=73Nm2/B6Xncs9FJB0DOzH6zeQokM4Em13F0I7ljPHns=;
	b=fXXcHn2gIugic7xh1nOsHGSipjV/eZsPTSSdYFu2WBJTKdZU6SnEJ5isbZNahpQzYN76/Z
	7QBFaWy/tD9SdS5dNUTyWzUZDz75GgXfeppWsiFwh0YYW4Pdpkf1xyM5F2xROTic9+yJAC
	KuwGvrHs6YLqrBDjvx32q824+9/+DJakx+mnCsHr6KGF1+CmRChP7qeOZU5AgV4f5cl4Zb
	KlIwm+DolrprINxDhAahGjoljdXS7ff4PDsF2bBAIgZ8KiN4U9uARYwPxuAl/zHuKC19cf
	rnci6p9kSn0vz0UNk9iHzMqtoUeJO96NP6+61c1dn9on3ouymaKTsFxQIhOljQ==
Date: Wed, 21 Aug 2024 15:17:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Dahl <ada@thorsis.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91)
 SoC support), linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] mtd: nand: raw: atmel: Add message on DMA usage
Message-ID: <20240821151701.6bde9aba@xps-13>
In-Reply-To: <20240821120517.330868-1-ada@thorsis.com>
References: <20240821120517.330868-1-ada@thorsis.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_061707_031998_AF6D8D09 
X-CRM114-Status: GOOD (  13.07  )
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

SGkgQWxleGFuZGVyLAoKYWRhQHRob3JzaXMuY29tIHdyb3RlIG9uIFdlZCwgMjEgQXVnIDIwMjQg
MTQ6MDU6MTYgKzAyMDA6Cgo+IExpa2UgZm9yIG90aGVyIGF0bWVsIGRyaXZlcnMgKHNlcmlhbCwg
Y3J5cHRvLCBtbWMsIOKApiksIHRvby4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgRGFo
bCA8YWRhQHRob3JzaXMuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9u
YW5kLWNvbnRyb2xsZXIuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNvbnRy
b2xsZXIuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2F0bWVsL25hbmQtY29udHJvbGxlci5jCj4g
aW5kZXggZGM3NWQ1MGQ1MmU4Li45ZTZkZWEyY2YxNDAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvYXRtZWwvbmFuZC1jb250cm9sbGVyLmMKPiArKysgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9hdG1lbC9uYW5kLWNvbnRyb2xsZXIuYwo+IEBAIC0yMDUxLDYgKzIwNTEsOCBAQCBz
dGF0aWMgaW50IGF0bWVsX25hbmRfY29udHJvbGxlcl9pbml0KHN0cnVjdCBhdG1lbF9uYW5kX2Nv
bnRyb2xsZXIgKm5jLAo+ICAJCW5jLT5kbWFjID0gZG1hX3JlcXVlc3RfY2hhbm5lbChtYXNrLCBO
VUxMLCBOVUxMKTsKPiAgCQlpZiAoIW5jLT5kbWFjKQo+ICAJCQlkZXZfZXJyKG5jLT5kZXYsICJG
YWlsZWQgdG8gcmVxdWVzdCBETUEgY2hhbm5lbFxuIik7Cj4gKwkJZGV2X2luZm8obmMtPmRldiwg
InVzaW5nICVzIGZvciBETUEgdHJhbnNmZXJzXG4iLAo+ICsJCQkgZG1hX2NoYW5fbmFtZShuYy0+
ZG1hYykpOwoKClRoZSBtZXNzYWdlIGhlcmUgd291bGQgYmUgbWlzbGVhZGluZyBpZiAhbmMtPmRt
YWMuCgo+ICAJfQo+ICAKPiAgCS8qIFdlIGRvIG5vdCByZXRyaWV2ZSB0aGUgU01DIHN5c2NvbiB3
aGVuIHBhcnNpbmcgb2xkIERUcy4gKi8KPiAKPiBiYXNlLWNvbW1pdDogNDdhYzA5YjkxYmVmYmI2
YTIzNWFiNjIwYzMyYWY3MTlmODIwODM5OQoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
