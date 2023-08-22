Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81077EE4996
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 13:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sbWiPCVIu0Pw77/UGoRc3iwCL7p3/nlzo+F9tLeTWKg=; b=jcIMqMFfG/nUCW
	8vXgtYYEx0wFNU6jOwEpVvzfxVQ03fXxx7DkwL14ohwmZOCEFpEb+uQMZR6DTKi/0EfJxmYrTnJFQ
	o/5HgX7B1uYPSO8eAJBnZzxh++KHvEvSUC/gRderbnu4FW0mdBjmuXNpoNqba4HQObelOVHjz1B8W
	DhHGybTm6peZNITZQH0Hw3djSvCVRb4LeEfn08AvIOxWyjBS4CQr6pL5j8PZ6J5Ck1sc0eA4wb9qg
	CtsqE6pa6F10RVSL39mrdB64p2/I987Axeoz3ZGYcXRXp59DvJUqjK8MTX80KhJz2gd6xPt6RAjj3
	RJp9Kzb/be+bgUXe6yiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRYJ-00G3QJ-0j;
	Tue, 22 Aug 2023 13:36:11 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRYE-00G3OP-2H
	for linux-mtd@lists.infradead.org;
	Tue, 22 Aug 2023 13:36:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBDAF1C0002;
	Tue, 22 Aug 2023 13:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692711358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YQhC2oeF//IEqu7mwmb78usJ0wdWGcj8FRhKl534ndU=;
	b=Urgs5+raZ7GIN9HmsjJ2XCsMNojvcMCf0zDI1kG9e4FobGW3GfRpRPFYKx5Uf7eDl7f7k4
	IyWIyB9D1JHAKC2jCk6/8W4gFeYp44woXXxY/xt26hpExAhySy8kqD34CWaHeYJYnZ8VDu
	uIBZRIOSHnWFnpVFwBVlMetYMvYdN5SjKltLiyh9OF/rlyVHk8sa3t7iha6wrQ3znbkF/Y
	1mhqkSvYQTviWAU5MnhLvqh7v/LpKBzsbWU8hNLBfG6r+avveXgdnNWPc9kUwMGqfPHmkR
	49COpekj/f2nf7NPV5h5bNuGsXEeWEU5yWfRUG8JWvEyS0bv9Kk06MeRPpB+JA==
Date: Tue, 22 Aug 2023 15:35:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Kurbanov <mmkurbanov@sberdevices.ru>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <kernel@sberdevices.ru>
Subject: Re: [PATCH v2 2/2] mtd: spinand: micron: fixing the offset for OOB
Message-ID: <20230822153556.630e65b9@xps-13>
In-Reply-To: <20230822122534.872646-3-mmkurbanov@sberdevices.ru>
References: <20230822122534.872646-1-mmkurbanov@sberdevices.ru>
	<20230822122534.872646-3-mmkurbanov@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_063606_896639_0F7A7F54 
X-CRM114-Status: GOOD (  17.22  )
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

SGkgTWFydGluLAoKbW1rdXJiYW5vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBUdWUsIDIyIEF1
ZyAyMDIzIDE1OjI1OjM0ICswMzAwOgoKPiBUaGUgZmlyc3QgNCBieXRlcyBhcmUgcmVzZXJ2ZWQg
Zm9yIGJhZCBibG9jayBkYXRhLgoKQXJlIHlvdSBzdXJlIGFib3V0IHRoYXQ/IEkndmUgbmV2ZXIg
c2VlbiA0LWJ5dGVzIEJCTS4KCj4gU2lnbmVkLW9mZi1ieTogTWFydGluIEt1cmJhbm92IDxtbWt1
cmJhbm92QHNiZXJkZXZpY2VzLnJ1Pgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3NwaS9taWNy
b24uYyB8IDIwICsrKysrKysrKysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9u
YW5kL3NwaS9taWNyb24uYyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL21pY3Jvbi5jCj4gaW5kZXgg
MTI2MDFiYzQyMjdhLi42NGI0MWM3YzljY2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFu
ZC9zcGkvbWljcm9uLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9taWNyb24uYwo+IEBA
IC01Nyw2ICs1NywyMCBAQCBzdGF0aWMgU1BJTkFORF9PUF9WQVJJQU5UUyh4MV93cml0ZV9jYWNo
ZV92YXJpYW50cywKPiAgc3RhdGljIFNQSU5BTkRfT1BfVkFSSUFOVFMoeDFfdXBkYXRlX2NhY2hl
X3ZhcmlhbnRzLAo+ICAJCQkgICBTUElOQU5EX1BST0dfTE9BRChmYWxzZSwgMCwgTlVMTCwgMCkp
Owo+ICAKPiArLyoKPiArICogT09CIHNwYXJlIGFyZWEgbWFwICgxMjggYW5kIDI1NiBieXRlcykK
PiArICoKPiArICogICAgICAgICAgICstLS0tLSstLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0t
LS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLSsKPiArICogICAgICAgICAgIHwgQkJNIHwg
ICAgIE5vbiBFQ0MgICAgIHwgICBFQ0MgcHJvdGVjdGVkICAgfCAgICAgIEVDQyBBcmVhICAgICAg
IHwKPiArICogICAgICAgICAgIHwgICAgIHwgcHJvdGVjdGVkIEFyZWEgIHwgICAgICAgQXJlYSAg
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgIHwKPiArICogLS0tLS0tLS0tLSstLS0tLSstLS0t
LS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLSsK
PiArICogIG9vYnNpemUgIHwgMDozIHwgNDozMSAoMjggYnl0ZXMpIHwgMzI6NjMgKDMyIGJ5dGVz
KSAgfCA2NDoxMjcgKDY0IGJ5dGVzKSAgIHwKPiArICogMTI4IGJ5dGVzIHwgICAgIHwgICAgICAg
ICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgIHwKPiAr
ICogLS0tLS0tLS0tLSstLS0tLSstLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0t
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLSsKPiArICogIG9vYnNpemUgIHwgMDozIHwgNDo2MyAoNjAg
Ynl0ZXMpIHwgNjQ6MTI3ICg2NCBieXRlcykgfCAxMjc6MjU1ICgxMjggYnl0ZXMpIHwKPiArICog
MjU2IGJ5dGVzIHwgICAgIHwgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgIHwKPiArICogLS0tLS0tLS0tLSstLS0tLSstLS0tLS0tLS0tLS0t
LS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLSsKPiArICovCj4g
IHN0YXRpYyBpbnQgbWljcm9uXzhfb29ibGF5b3V0X2VjYyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwg
aW50IHNlY3Rpb24sCj4gIAkJCQkgIHN0cnVjdCBtdGRfb29iX3JlZ2lvbiAqcmVnaW9uKQo+ICB7
Cj4gQEAgLTc1LDkgKzg5LDkgQEAgc3RhdGljIGludCBtaWNyb25fOF9vb2JsYXlvdXRfZnJlZShz
dHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50IHNlY3Rpb24sCj4gIAlpZiAoc2VjdGlvbikKPiAgCQly
ZXR1cm4gLUVSQU5HRTsKPiAgCj4gLQkvKiBSZXNlcnZlIDIgYnl0ZXMgZm9yIHRoZSBCQk0uICov
Cj4gLQlyZWdpb24tPm9mZnNldCA9IDI7Cj4gLQlyZWdpb24tPmxlbmd0aCA9IChtdGQtPm9vYnNp
emUgLyAyKSAtIDI7Cj4gKwkvKiBSZXNlcnZlIDQgYnl0ZXMgZm9yIHRoZSBCQk0uICovCj4gKwly
ZWdpb24tPm9mZnNldCA9IDQ7Cj4gKwlyZWdpb24tPmxlbmd0aCA9IChtdGQtPm9vYnNpemUgLyAy
KSAtIDQ7Cj4gIAo+ICAJcmV0dXJuIDA7Cj4gIH0KCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
