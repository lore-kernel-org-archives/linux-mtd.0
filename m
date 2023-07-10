Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61494EB64DA
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jul 2023 09:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mcb7Q/dB7Hml5bdvMYoDo3l7PWnpvnREy1AKV3CuWfY=; b=NfBE7fPrb9VPZ1
	nSQpurK8Y3Elpa/ITSjA8jrArTHH7LY4vD077imF1LBltuFTJNGQhpVF/jsN33mVTerXZUifSiG5d
	a50lc+0C3yGA2tOSqzoAokWgw0HavtjGFqvM3/8dMDebriLw0hRgyoA/JZd24NVINIuQkr+5EJ9O6
	FPKScjah4J6UHNjHvcxuuVbQJwafrFfHQIMAR3DoSmiFdHTX5x9o27gfAvbQAzZoyi83/cW3ix7q/
	wLNCXSZ0+ZZGRyzl77VyB2koxSk2obbeDd7UF0FynES9cCb1wLZJi0p7oCSTWrerXPa5BZpRlySQ0
	Ic9kmc1IWzURrWus1TMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qInW8-00B6vw-2W;
	Mon, 10 Jul 2023 09:49:16 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qInW5-00B6ts-0x
	for linux-mtd@lists.infradead.org;
	Mon, 10 Jul 2023 09:49:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13A261C0009;
	Mon, 10 Jul 2023 09:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688982546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=esbaZstYUmTKpbeA0NmlrMUg8K32jAHi3MEtkOjE08c=;
	b=cvB0hda8puFMHWP2kwb9SNZVdlQIEm//XyiVMeeLZBykMpC2VM7jc6hClcq5b7W+I1vQDC
	I3TK32b2z6wDYGDujfyEHYf31uCA89mATLeUo7lwLt56AKJ6Xhy8TpAaCOk0wY90dWscWv
	gy+sWs/SKhPYtgP4kVIyLz1/1OIh2ywGgzmWTwUXQU4NW/kIq8Hy6A+PfJLMErT7C7hX/F
	P/RbrXIWz06mid+SHtQdCcPoRuylKyVM85rqZ4ZXFwQLVyJ1zVAiHUKMurxR/Wg7Uz/s4+
	GcjFABZuJLwzBLNlZLoYlZ7Or0mhSymTZbmLn/Lj1JsVr8QeXb/eOVLKuThVcw==
Date: Mon, 10 Jul 2023 11:49:03 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: vigneshr@ti.com, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add myself as reviewer for HYPERBUS
Message-ID: <20230710114903.352bc12d@xps-13>
In-Reply-To: <20230622102836.2be2ab1b@xps-13>
References: <20230620025359.33839-1-tudor.ambarus@linaro.org>
	<20230622102836.2be2ab1b@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_024913_521201_5FC49A41 
X-CRM114-Status: GOOD (  17.30  )
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

Cm1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20gd3JvdGUgb24gVGh1LCAyMiBKdW4gMjAyMyAxMDoy
ODo1NyArMDIwMDoKCj4gSGkgVmlnbmVzaCwKPiAKPiB0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcg
d3JvdGUgb24gVHVlLCAyMCBKdW4gMjAyMyAwNTo1Mzo1OSArMDMwMDoKPiAKPiA+IEFkZCBteXNl
bGYgYXMgRGVzaWduYXRlZCBSZXZpZXdlciBmb3IgSHlwZXJidXMgc3VwcG9ydC4KPiA+IEknbSBh
c3Nlc3NpbmcgdGhlIGZyYW1ld29yayBhbmQgSSdkIGxpa2UgdG8gZ2V0IGludm9sdmVkCj4gPiBp
biByZXZpZXdpbmcgZnVydGhlciBwYXRjaGVzLiAgCj4gCj4gVmlnbmVzaCwgYW55IGNoYW5jZSB5
b3UgY291bGQgZ2l2ZSBmZWVkYmFjayBvbiB0aGlzIHBhdGNoIHF1aWNrbHk/IEknZAo+IGxpa2Ug
dG8gdGFrZSBpdCBmb3IgdGhlIG5leHQgUFIgaWYgeW91IGFncmVlLgoKSSdtIHN1cnByaXNlZCB0
aGVyZSBpcyBzdGlsbCBubyBmZWVkYmFjayBhZnRlciAzIHdlZWtzLCBJIGhhdmVuJ3QgaGVhcmQK
ZnJvbSBoaW0gYXQgYWxsIHNpbmNlIGEgd2hpbGUuCgpWaWduZXNoLCBhcmUgeW91IHN0aWxsIGFy
b3VuZD8KClRoYW5rcywKTWlxdcOobAoKPiA+IFNpZ25lZC1vZmYtYnk6IFR1ZG9yIEFtYmFydXMg
PHR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZz4KPiA+IC0tLQo+ID4gIE1BSU5UQUlORVJTIHwgMSAr
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPiAKPiA+IGRpZmYgLS1naXQg
YS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4gPiBpbmRleCA2OTkyYjdjYzcwOTUuLmRmNWMw
MzlmYzU3NyAxMDA2NDQKPiA+IC0tLSBhL01BSU5UQUlORVJTCj4gPiArKysgYi9NQUlOVEFJTkVS
Uwo+ID4gQEAgLTk2MjMsNiArOTYyMyw3IEBAIEY6CXRvb2xzL2h2Lwo+ID4gIAo+ID4gIEhZUEVS
QlVTIFNVUFBPUlQKPiA+ICBNOglWaWduZXNoIFJhZ2hhdmVuZHJhIDx2aWduZXNockB0aS5jb20+
Cj4gPiArUjoJVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPgo+ID4gIEw6
CWxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiAgUzoJU3VwcG9ydGVkCj4gPiAgUToJ
aHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXgtbXRkL2xpc3QvICAKPiAK
PiAKPiBUaGFua3MsCj4gTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
