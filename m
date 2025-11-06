Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87891CCFA03
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Nov 2025 08:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:Subject:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P2igEhjGcbLqAW8iV2f4qbdOyvyY/AcBp8DNDrtUS3w=; b=ynh6zISE1aHRh7
	clpxhecUD/WpTL0U/b/A/FjugggOtBis3wmykJ4qH8HQJccPoUUxNUFhtFYOPL627b/K0dma+J6JT
	UmpdWEmuhDgxOYp4iSNtUTFRDt6YMFr9OK3KuGoJv+fVeyf6lNGPUOIIPDthPdBLcBgRMbAhJkiCS
	ZyURWxPz+bUY6vxuBTQbh6ltGWyFXGSgUN57ymMNCPx1Ju9reHNY9jNeurJpXmQbu36vw1rYgb//6
	oHDOlw6DDD3OseYb29bFNYBINZAfPrAcduNO0vBCs5IOkxu5xXNi7KXKYaVGRA0EQimKMWAXXjYV1
	rqzF7jTiYU5RvB/TfmeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvNv-0000000F4KJ-22FH;
	Thu, 06 Nov 2025 08:30:23 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvNr-0000000F4Ig-2HoV
	for linux-mtd@lists.infradead.org;
	Thu, 06 Nov 2025 08:30:20 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 579487D6;
	Thu,  6 Nov 2025 09:30:08 +0100 (CET)
Mime-Version: 1.0
Date: Thu, 06 Nov 2025 09:30:08 +0100
Message-Id: <DE1GYZRTAAD7.1VHWUNF8N9RBZ@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
Subject: Re: [PATCH 0/6] Hello,
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin"
 <STLin2@winbond.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20251105-winbond-v6-18-rc1-spi-nor-v1-0-42cc9fb46e1b@bootlin.com>
In-Reply-To: <20251105-winbond-v6-18-rc1-spi-nor-v1-0-42cc9fb46e1b@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_003019_735673_90B7BD49 
X-CRM114-Status: GOOD (  11.59  )
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

T24gV2VkIE5vdiA1LCAyMDI1IGF0IDY6MjYgUE0gQ0VULCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
IEhlcmUgaXMgYSBzZXJpZXMgYWRkaW5nIHN1cHBvcnQgZm9yIDYgV2luYm9uZCBTUEkgTk9SIGNo
aXBzLiBEZXNjcmliaW5nCj4gdGhlc2UgY2hpcHMgaXMgbmVlZGVkIG90aGVyd2lzZSB0aGUgYmxv
Y2sgcHJvdGVjdGlvbiBmZWF0dXJlIGlzIG5vdAo+IGF2YWlsYWJsZS4gRXZlcnl0aGluZyBlbHNl
IGxvb2tzIGZpbmUgb3RoZXJ3aXNlLgo+Cj4gSW4gcHJhY3RpY2UgSSBhbSBvbmx5IGFkZGluZyA2
IHZlcnkgc2ltaWxhciBJRHMgYnV0IEkgc3BsaXQgdGhlIGNvbW1pdHMKPiBiZWNhdXNlIHRoZSBh
bW91bnQgb2YgbWV0YSBkYXRhIHRvIHNob3cgcHJvb2YgdGhhdCBhbGwgdGhlIGNoaXBzIGhhdmUK
PiBiZWVuIHRlc3RlZCBhbmQgd29yayBpcyBwcmV0dHkgYmlnLgo+Cj4gQXMgdGhlIGNvbW1pdHMg
c2ltcGx5IGFkZCBhbiBJRCwgSSBhbSBDYydpbmcgc3RhYmxlIHdpdGggdGhlIGhvcGUgdG8KPiBn
ZXQgdGhlc2UgYmFja3BvcnRlZCB0byBMVFMga2VybmVscyBhcyBhbGxvd2VkIGJ5IHRoZSBzdGFi
bGUgcnVsZXMgKHNlZQo+IGxpbmsgYmVsb3csIGJ1dCBJIGhvcGUgSSBhbSBkb2luZyB0aGlzIHJp
Z2h0KS4KPgo+IExpbms6IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE3Ljcv
c291cmNlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdGFibGUta2VybmVsLXJ1bGVzLnJzdCNMMTUK
Pgo+IFRoYW5rcywKPiBNaXF1w6hsCj4KPiAtLS0KPiBNaXF1ZWwgUmF5bmFsICg2KToKPiAgICAg
ICBtdGQ6IHNwaS1ub3I6IHdpbmJvbmQ6IEFkZCBzdXBwb3J0IGZvciBXMjVRMDFOV3h4SVEgY2hp
cHMKPiAgICAgICBtdGQ6IHNwaS1ub3I6IHdpbmJvbmQ6IEFkZCBzdXBwb3J0IGZvciBXMjVRMDFO
V3h4SU0gY2hpcHMKPiAgICAgICBtdGQ6IHNwaS1ub3I6IHdpbmJvbmQ6IEFkZCBzdXBwb3J0IGZv
ciBXMjVRMDJOV3h4SU0gY2hpcHMKPiAgICAgICBtdGQ6IHNwaS1ub3I6IHdpbmJvbmQ6IEFkZCBz
dXBwb3J0IGZvciBXMjVINTEyTld4eEFNIGNoaXBzCj4gICAgICAgbXRkOiBzcGktbm9yOiB3aW5i
b25kOiBBZGQgc3VwcG9ydCBmb3IgVzI1SDAxTld4eEFNIGNoaXBzCj4gICAgICAgbXRkOiBzcGkt
bm9yOiB3aW5ib25kOiBBZGQgc3VwcG9ydCBmb3IgVzI1SDAyTld4eEFNIGNoaXBzCgpOaWNlLCBm
b3IgdGhlIHdob2xlIHNlcmllczoKClJldmlld2VkLWJ5OiBNaWNoYWVsIFdhbGxlIDxtd2FsbGVA
a2VybmVsLm9yZz4KCi1taWNoYWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
