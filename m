Return-Path: <SRS0=prrA=7Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7330FC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 18:48:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45EDB207F7
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 18:48:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ndc23SG3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2x9dGEH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45EDB207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jqNc1QahFaX3KxsHYpr8vLqCykSGFXAf9Vp+cKcyX6E=; b=Ndc23SG33vaDbI
	pwoy+bGR/diJy8OYuQS7XuP/cw2FF/HMiQ3rxb5pGnTv168Bpwl4ngqZWNXpRAssTXZ112qLbBQDg
	2b9BL+lAncDudZ34PK0unVyd4gRFmT99c/OfYPvIF+UNMaVyiq/8+hHgaWA4nj8Legy5sSQgrbvft
	a7sVJ1AJQRXBQX+TFMCEsBnc4cd8EjMGOqmE3iMyHLFtC4CZ94pLWMQJziCILTo7hL3iaKiRZ1MIi
	1jSp0pr8ngkN4VtlYbeKUDJtDi7Gd5Hyg8vVD1Q4ceR0h44T5wMA1CeSAKtU3XhQXbVyYjvN5ejJP
	480g4ibFJhpQy25m11EQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjoiY-00032h-9F; Fri, 12 Jun 2020 18:47:54 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjoiT-0002zQ-Vt
 for linux-mtd@lists.infradead.org; Fri, 12 Jun 2020 18:47:52 +0000
Received: by mail-io1-xd41.google.com with SMTP id u13so11297514iol.10
 for <linux-mtd@lists.infradead.org>; Fri, 12 Jun 2020 11:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LZDy9XcI4N1lUd1gGa7ISl9lwNSdZf1QWRf62wPMnVw=;
 b=S2x9dGEHkOnJf+7GpQkXBNyZgMb+NG5lpVqGB+F8ObbicBblcPnt1Zj0z2T2BJN1ak
 BE5tyB3SXO/vcPpoE1SV0kY1Hyiuhx8BaCvyI4y2wl5zVlTziIxk6WAAGlfkyrGWK2Ab
 ZJmk91KRA2HRL5FDYwjDYXfdoxwSeDYU2+fZ5Z8Mkt+x8+aREd4LyXa1focAkMeBM167
 RGDhyMr0dOAIZK/jg79jEb+znkyhK/DuF8F1TzcM7Ak+2abPElSzvfEwgLwHRZ/tiXLT
 XcVd6vAWGmnp9IO5dm4LC11qH4Ycso5wykJuil7n4kQNX5Uq5tVU5q/eYugeOmAWp9i4
 NGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LZDy9XcI4N1lUd1gGa7ISl9lwNSdZf1QWRf62wPMnVw=;
 b=cEnvUjWzkaYsOXAXrWsAI933QPJZ4KVxqhUU6764yFOM/+hL3QxLe19gsr5Wi3t3iG
 G8k3MltPHM1mecKmnq9DphCVTU+/5lfzXoflm/5ABD2W2CXZ/2ygN/1hQDUmAnPKEfe7
 1DE/lHYcfXSsdPaK5aE/sw0sGBwKU0yHaTmC4gQpelRcEBIxoVC8MFIdkGtQjtdsZFzR
 UgVpv25EbpN0oOHYJsv0r5Gbh67g3PVF/1+5M/JZH0LSxj22yNhSxcmB9DaWqL+0M8++
 2dZbVpW+FaAdH+juphaj7zQUyNB597rt09kcLFw8rdF7QUzDdu42mh/K23XVoo7Rejce
 4zSA==
X-Gm-Message-State: AOAM531L7K11B2KVQub9EjIeaUH0JYS3GCDEhDeg3fPnqyePmwQXtDjz
 vnJzegygQ5uDbVJ7cMMmITBRycJR7mButJ2OSxo=
X-Google-Smtp-Source: ABdhPJzfRaFPvLx+fMxGrt+I4C3SRFJHleONaqg7i4IvAGQ6aQvoRRGtLFcMRTSg9k7ZAk6Yl7tZSKL1xoRRRuVrgIQ=
X-Received: by 2002:a05:6602:1601:: with SMTP id
 x1mr15442631iow.129.1591987668271; 
 Fri, 12 Jun 2020 11:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200605170720.2478262-1-noltari@gmail.com>
In-Reply-To: <20200605170720.2478262-1-noltari@gmail.com>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Fri, 12 Jun 2020 14:47:37 -0400
Message-ID: <CAC=U0a3xa9k76mxsiVKDyXsuvboZAyMkXT-S3-6oVZKjnWkeHA@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: brcmnand: force raw OOB writes
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200612_114750_041342_46FA1D27 
X-CRM114-Status: GOOD (  14.95  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "R, Vignesh" <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdW4gNSwgMjAyMCBhdCAxOjA3IFBNIMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8
bm9sdGFyaUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gTVREX09QU19BVVRPX09PQiBpcyB3cml0dGlu
ZyBPT0Igd2l0aCBFQ0MgZW5hYmxlZCwgd2hpY2ggY2hhbmdlcyBhbGwgRUNDIGJ5dGVzCj4gZnJv
bSBhbiBlcmFzZWQgcGFnZSB0byAweDAwIHdoZW4gSkZGUzIgY2xlYW5tYXJrZXJzIGFyZSBhZGRl
ZCB3aXRoIG10ZC11dGlscy4KPiAgICAgICAgICB8IEJCSSB8ICAgSkZGUzIgICB8ICAgRUNDICAg
fCAgIEpGRlMyICAgfCBTcGFyZSAgfAo+IDAwMDAwODAwICBmZiBmZiAxOSA4NSAyMCAwMyAwMCAw
MCAgMDAgMDAgMDAgMDAgMDggZmYgZmYgZmYKPgo+IEhvd2V2ZXIsIGlmIE9PQiBpcyB3cml0dGVu
IHdpdGggRUNDIGRpc2FibGVkLCB0aGUgSkZGUzIgY2xlYW5tYXJrZXJzIGFyZQo+IGNvcnJlY3Rs
eSB3cml0dGVuIHdpdGhvdXQgY2hhbmdpbmcgdGhlIEVDQyBieXRlczoKPiAgICAgICAgICB8IEJC
SSB8ICAgSkZGUzIgICB8ICAgRUNDICAgfCAgIEpGRlMyICAgfCBTcGFyZSAgfAo+IDAwMDAwODAw
ICBmZiBmZiAxOSA4NSAyMCAwMyBmZiBmZiAgZmYgMDAgMDAgMDAgMDggZmYgZmYgZmYKCkJvdGgg
YnJjbWFuZF93cml0ZV9vb2JfcmF3KCkgYW5kIGJyY21uYW5kX3dyaXRlX29vYigpIHVzZQpicmNt
bmFuZF93cml0ZSgpIHRoYXQgdXNlcyBQUk9HUkFNX1BBR0UgY21kLCBtZWFucyBhbHNvIHByb2dy
YW1zIGRhdGEKYXJlYXMgYW5kIEVDQyB3aGVuIGVuYWJsZWQgIGlzIGFsd2F5cyBjYWxjdWxhdGVk
IG9uIERBVEErT09CLiAgc2luY2UKaW4gYm90aCBjYXNlcyB3ZSBvbmx5IHdhbnQgdG8gbW9kaWZ5
IE9PQiwgZGF0YSBpcyBhbHdheXMgYXNzdW1lZCB0byBiZQoweGZmcyAobWVhbnMgZXJhc2VkIHN0
YXRlKS4gU28gYXMgZmFyIGFzIHRoaXMgYXBpIGFsd2F5cyBpcyB1c2VkIG9uCnRoZSBlcmFzZWQg
cGFnZSBpdCBzaG91bGQgYmUgZ29vZC4gQXJlIHRoZSBzdWItcGFnZXMvb29iIGFyZWFzIHJlYWQg
YnkKamZmczIgIGFsc28gcmVhZCB3aXRob3V0IGVjYyBlbmFibGVkPy4gSnVzdCB3YW50IHRvIGJl
IHN1cmUgdGhhdCBpdApkb2VzIG5vdCBicmVhayBhbnkgb3RoZXIgdXRpbGl0aWVzIGxpa2UgbmFu
ZHdyaXRlLgoKPgo+IFNpZ25lZC1vZmYtYnk6IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9s
dGFyaUBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2Jy
Y21uYW5kLmMgfCA5ICstLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDggZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJj
bW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5k
LmMKPiBpbmRleCA4ZjlmZmI0NmEwOWYuLjU2NjI4MTc3MDg0MSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+IEBAIC0yMjc5LDEzICsyMjc5LDYgQEAgc3Rh
dGljIGludCBicmNtbmFuZF93cml0ZV9wYWdlX3JhdyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBj
b25zdCB1aW50OF90ICpidWYsCj4gICAgICAgICByZXR1cm4gbmFuZF9wcm9nX3BhZ2VfZW5kX29w
KGNoaXApOwo+ICB9Cj4KPiAtc3RhdGljIGludCBicmNtbmFuZF93cml0ZV9vb2Ioc3RydWN0IG5h
bmRfY2hpcCAqY2hpcCwgaW50IHBhZ2UpCj4gLXsKPiAtICAgICAgIHJldHVybiBicmNtbmFuZF93
cml0ZShuYW5kX3RvX210ZChjaGlwKSwgY2hpcCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAodTY0KXBhZ2UgPDwgY2hpcC0+cGFnZV9zaGlmdCwgTlVMTCwKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjaGlwLT5vb2JfcG9pKTsKPiAtfQo+IC0KPiAgc3RhdGljIGludCBi
cmNtbmFuZF93cml0ZV9vb2JfcmF3KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGludCBwYWdlKQo+
ICB7Cj4gICAgICAgICBzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRfdG9fbXRkKGNoaXApOwo+
IEBAIC0yNjQyLDcgKzI2MzUsNyBAQCBzdGF0aWMgaW50IGJyY21uYW5kX2luaXRfY3Moc3RydWN0
IGJyY21uYW5kX2hvc3QgKmhvc3QsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqZG4pCj4gICAgICAgICBj
aGlwLT5lY2Mud3JpdGVfb29iX3JhdyA9IGJyY21uYW5kX3dyaXRlX29vYl9yYXc7Cj4gICAgICAg
ICBjaGlwLT5lY2MucmVhZF9vb2JfcmF3ID0gYnJjbW5hbmRfcmVhZF9vb2JfcmF3Owo+ICAgICAg
ICAgY2hpcC0+ZWNjLnJlYWRfb29iID0gYnJjbW5hbmRfcmVhZF9vb2I7Cj4gLSAgICAgICBjaGlw
LT5lY2Mud3JpdGVfb29iID0gYnJjbW5hbmRfd3JpdGVfb29iOwo+ICsgICAgICAgY2hpcC0+ZWNj
LndyaXRlX29vYiA9IGJyY21uYW5kX3dyaXRlX29vYl9yYXc7Cj4KPiAgICAgICAgIGNoaXAtPmNv
bnRyb2xsZXIgPSAmY3RybC0+Y29udHJvbGxlcjsKPgo+IC0tCj4gMi4yNi4yCj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
