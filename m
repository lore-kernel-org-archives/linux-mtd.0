Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A1CC05027
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Jan 2023 14:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NUxU6aDLe5KT8zXOj5j5Gxjrqf8eXYR0OewY1qZV01s=; b=v7R0gOHPiVaRPz
	vYAqBybrkh9Ffsi0FEWNwmrM6SeJXSw9LDuPdGHUG0cKBUYlA5jOLgLc+1CO5YLigusoIl+T64pLi
	+nVUydv9/HA0sFeqiwV8b7RyZUdd9BfIdO1oDfCdF2B8EVQHbVU1wUPJQyI4XS42u1R6+Vvrqixge
	T8b1RgWichCDBAYX2ELhqVsEaTha2STFNh+Z5kxcw0xaV0lDF94bWPzucQoWisQXdkBRiDLKgj+Wu
	nLKJ9JHvIClesIdXd6/yuvKBWPJfI3sydO5UOAj9H3NqKxOd/ijY+1KCA8Sd04oRzGFxFzIUllFNt
	PeOKfLL4e+HcKhcHzLkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL3i5-00BLFs-TS; Thu, 26 Jan 2023 14:58:42 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL3aR-00BICu-DR
	for linux-mtd@lists.infradead.org; Thu, 26 Jan 2023 14:50:53 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 802DA40003;
	Thu, 26 Jan 2023 14:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674744641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o5HaAlf12Z8C/D/Ob84tlnnUxlZv1t3lQu23e+eG6VU=;
	b=T06iD/Tj6WN+jWDKKWNC3vwkDxozfkV2YSxzkqHNC1qkzKLOnLOWXMGdSMTX1j5bRoAg3A
	1DsJmbBN9Iu8JGmHD75hz0zBsQzDASTSqJiShDevjrZhepirjShQSxM16pGgWhCFPJrUEv
	POIAIEkTXy6I3rDp7dYzsN2dQf6ZtCR+Ch0HQTJZ4PuLlW9YWB2eWl8uDjlXzvkogvCfIg
	vjxGUZqEr0qnePuglYmdS0CeSaDBlANUUbAAys0xnbR2u2wp6t/5VhQhCa7I6EyFBPKs5m
	wZLEJdYGl+Pq7qvF4FYCmy+pFAkaY0g0A1bWWFQ8we8UXKsDd8f0uMnU+gWVzA==
Date: Thu, 26 Jan 2023 15:50:36 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mario Kicherer <dev@kicherer.org>
Cc: linux-mtd@lists.infradead.org, richard@nod.at, vigneshr@ti.com, Dhruva
 Gole <d-gole@ti.com>
Subject: Re: [PATCH v2] mtd: spinand: Add support for AllianceMemory
 AS5F34G04SND
Message-ID: <20230126155036.532ca8fe@xps-13>
In-Reply-To: <07c86c5f57145fdc5f06c6f57b8fea84@kicherer.org>
References: <20230117165441.1368447-1-dev@kicherer.org>
	<20230123113337.78f5e3db@xps-13>
	<fae6950f62ebde63b3be0cde384fbde9@kicherer.org>
	<20230125152733.3b6bf0bd@xps-13>
	<c452cc08efa87359294d7042ea68ffee@kicherer.org>
	<20230126095112.3fd55899@xps-13>
	<07c86c5f57145fdc5f06c6f57b8fea84@kicherer.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_065047_730507_593324BC 
X-CRM114-Status: GOOD (  10.05  )
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

SGVsbG8sCgpkZXZAa2ljaGVyZXIub3JnIHdyb3RlIG9uIFRodSwgMjYgSmFuIDIwMjMgMTU6MzQ6
NDcgKzAxMDA6Cgo+IEhlbGxvIE1pcXXDqGwsCj4gCj4gSSBtYWRlIGFsbCByZXF1ZXN0ZWQgY2hh
bmdlcyBhbmQgYWRkZWQgYWRkaXRpb25hbCBjb2RlIHRvIG1ha2UgdGhlIG9vYmxheW91dAo+IGZ1
bmN0aW9ucyBjb21wYXRpYmxlIHdpdGggYWxsIGZsYXNoZXMgb2YgdGhpcyBzZXJpZXMuCj4gCj4g
SSBhbHNvIHJhbiBuYW5kYml0ZXJycyB3aXRoIHRoZSBmb2xsb3dpbmcgcmVzdWx0Ogo+IAo+ICMg
bmFuZGJpdGVycnMgLWkgL2Rldi9tdGQxMQo+IGluY3JlbWVudGFsIGJpdGVycm9ycyB0ZXN0Cj4g
U3VjY2Vzc2Z1bGx5IGNvcnJlY3RlZCAwIGJpdCBlcnJvcnMgcGVyIHN1YnBhZ2UKPiBJbnNlcnRl
ZCBiaXRlcnJvciBAIDAvNQo+IFJlYWQgcmVwb3J0ZWQgNyBjb3JyZWN0ZWQgYml0IGVycm9ycwo+
IFN1Y2Nlc3NmdWxseSBjb3JyZWN0ZWQgMSBiaXQgZXJyb3JzIHBlciBzdWJwYWdlCgpZZWFoLCB3
ZWxsLCBJIGd1ZXNzIHdlIGRvbid0IGhhdmUgYSBjaG9pY2UuIFVCSSB3b3VsZCBzZWUgdGhpcyBh
cyBhCm5lZWQgdG8gcmV3cml0ZSB0aGUgYmxvY2sgc29tZXdoZXJlIGVsc2UgYmVjYXVzZSBvZiB0
aGUgdG9vIGhpZ2ggYW1vdW50Cm9mIGJpdCBmbGlwcy4gVUJJJ3MgdGhyZXNob2xkIGlzIHNvbWV3
aGVyZSBhcm91bmQgMy80IG9yIHRoZSBzdHJlbmd0aCwKc28gdGhlc2UgZmxhc2hlcyBjb3VsZCBy
YXBpZGx5IHdlYXIgb3V0LCBidXQgSSBkb24ndCB0aGluayB3ZSBoYXZlCmFub3RoZXIgY2hvaWNl
LgoKPiBJbnNlcnRlZCBiaXRlcnJvciBAIDAvMgo+IFJlYWQgcmVwb3J0ZWQgNyBjb3JyZWN0ZWQg
Yml0IGVycm9ycwo+IFN1Y2Nlc3NmdWxseSBjb3JyZWN0ZWQgMiBiaXQgZXJyb3JzIHBlciBzdWJw
YWdlCj4gSW5zZXJ0ZWQgYml0ZXJyb3IgQCAwLzAKPiBSZWFkIHJlcG9ydGVkIDcgY29ycmVjdGVk
IGJpdCBlcnJvcnMKPiBTdWNjZXNzZnVsbHkgY29ycmVjdGVkIDMgYml0IGVycm9ycyBwZXIgc3Vi
cGFnZQo+IEluc2VydGVkIGJpdGVycm9yIEAgMS83Cj4gUmVhZCByZXBvcnRlZCA3IGNvcnJlY3Rl
ZCBiaXQgZXJyb3JzCj4gU3VjY2Vzc2Z1bGx5IGNvcnJlY3RlZCA0IGJpdCBlcnJvcnMgcGVyIHN1
YnBhZ2UKPiBJbnNlcnRlZCBiaXRlcnJvciBAIDEvNQo+IFJlYWQgcmVwb3J0ZWQgNyBjb3JyZWN0
ZWQgYml0IGVycm9ycwo+IFN1Y2Nlc3NmdWxseSBjb3JyZWN0ZWQgNSBiaXQgZXJyb3JzIHBlciBz
dWJwYWdlCj4gSW5zZXJ0ZWQgYml0ZXJyb3IgQCAxLzIKPiBSZWFkIHJlcG9ydGVkIDcgY29ycmVj
dGVkIGJpdCBlcnJvcnMKPiBTdWNjZXNzZnVsbHkgY29ycmVjdGVkIDYgYml0IGVycm9ycyBwZXIg
c3VicGFnZQo+IEluc2VydGVkIGJpdGVycm9yIEAgMS8wCj4gUmVhZCByZXBvcnRlZCA3IGNvcnJl
Y3RlZCBiaXQgZXJyb3JzCj4gU3VjY2Vzc2Z1bGx5IGNvcnJlY3RlZCA3IGJpdCBlcnJvcnMgcGVy
IHN1YnBhZ2UKPiBJbnNlcnRlZCBiaXRlcnJvciBAIDIvNgo+IFJlYWQgcmVwb3J0ZWQgOCBjb3Jy
ZWN0ZWQgYml0IGVycm9ycwo+IFN1Y2Nlc3NmdWxseSBjb3JyZWN0ZWQgOCBiaXQgZXJyb3JzIHBl
ciBzdWJwYWdlCj4gSW5zZXJ0ZWQgYml0ZXJyb3IgQCAyLzUKPiBGYWlsZWQgdG8gcmVjb3ZlciAx
IGJpdGZsaXBzCj4gUmVhZCBlcnJvciBhZnRlciA5IGJpdCBlcnJvcnMgcGVyIHBhZ2UKPiAKPiBJ
IHdvdWxkIHNheSB0aGlzIGxvb2tzIGdvb2Q/Cj4gCj4gSSB3aWxsIHNlbmQgdGhlIG5ldyBwYXRj
aCBpbiBhIGZldyBzZWNvbmRzLgo+IAo+IFRoYW5rIHlvdSEKPiBNYXJpbwo+IAoKClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
