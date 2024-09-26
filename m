Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F72ECCF9EB
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 03:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V26x9wIRslQMxa1hjA7CIn+O5hQC0TSjvisT53d7ELY=; b=eJGzRlQyLgnFqI
	b1vcYunTMgfo5FIJLVuId4qo1xQ8bAEAYXNpEEpG8JnUm8QP2vH33RHvKlzj/XGgDZmWY859i1T8z
	Sa0qvG/t13+S5KnlrwMXc+FjMjhJu30ERexixAJHyI5CtRhAzN/TaN6OyJOWQ4EhRAV3WXaT8V/GZ
	4f4N/8pQRZO6o+hswCn3BfRpGJM+OTfnll+dVZKKvhvSV/dClFxi2I6STorY5VTWKgutx3mkqbuuu
	IctvPC7xzPQ2GMvNkqtMxC7RkaJaQJszPghUUT8PngIWe1iyVzsAtSGZN2pVkTTDuW3/okSBbGfYD
	jmM9wY1njxHr+0KGDIeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ster5-000000073D1-2UGr;
	Thu, 26 Sep 2024 03:07:47 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1steqz-000000073CU-2V03
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 03:07:45 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a90349aa7e5so68796466b.0
        for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2024 20:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727320059; x=1727924859; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjHLO3lK/OQsJDE6OFm+7r5Bk5tao2ttjn7ToVjtLbE=;
        b=VZtTYA+bRXZlWlOZvLZebQtg9Zx7jSYvhS5Gbr1EU+aq/FQ2IG9aHTbDHq1UQJ0lco
         kNTDCZspTc9ujT/u51NdPCJrHDT0mntj2yLQxXbj40oCneYcSazDYETr3lmLj1g1Kuc2
         aUC4WxujR7um2DGRPbvhVUdiwluACeBbe0pMXMqDJob40MOkfSJMmZNSu4niEXBkaJm3
         7f43hBgEX4bHX8qzjOgUDGsZaiyT2M8STZyMRUNYIB+Vvjf967Yk3kwV/WfK47hNwG3N
         WJmoHK0sx9A+8Su10OnFwdu1eDKEXiTFkBltxeBqY7V0Ho/1J+iboLjefOFxbLXh5+mi
         9FOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727320059; x=1727924859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjHLO3lK/OQsJDE6OFm+7r5Bk5tao2ttjn7ToVjtLbE=;
        b=cFFOc2ICaKKYMSjEj1hHdDmnHUudYau4U9vwM0Kfuu7mNE1BmU81SXTj2CmyUe5Zlp
         Y22bcr+6gpw8jXXs87iq2bha03KtiSrE1uUB4spA1yEtyibCxQ+DDvJ7qh8Pq9nSJ1vG
         nRQ1gioLdY2Gy1mm3MHGVUH/WmH7WidV9JXAgLXJXmpCSjdRFWg/2sWDr/0HXk1q1PSD
         FI6gJIXA+lUpP4kISmS58CDUYMVUENNUSxv0juh79tkUeDr56RvlJym97Jq6uysHyJqL
         RAAJjVZSbF+OFvsQoB0KQZlqcfdQ+v4gjH3+vG/cF5vFteFqLUWRjYz28h4bBvB9m0mM
         uuyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW53/Y5vWM9xwI0qBR9E91rkKHf3re6ADeEVFHsH8HXOL/bAorSbrPwCv0wd0DibEbp2hPgAxHxvVo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzwYHwTOBPUaLnLcXCGKxUek8lg7q5BEWFrePsXx9U1Zu+EcKGV
	kHtsbgGQa+zycJyClUTDRO5Hk9Zl/Cb0vpGhsKCVNZIXeSarJ/S79VY/Okx5dMTy5jeOgaXC1U0
	n63BmVlEeoZwzxaOC5EZ5rpDslUQ=
X-Google-Smtp-Source: AGHT+IHQnslP5PPXpBtyd2X2lFAmGTpsIvv0uQ/zlGvwN5ExqoTvexqaymYpjsuH9T2eLl+rbj3GyIp5sEfE5Sm7rPE=
X-Received: by 2002:a17:907:e6d8:b0:a77:cbe5:413f with SMTP id
 a640c23a62f3a-a93a03247a9mr349784066b.4.1727320059072; Wed, 25 Sep 2024
 20:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240718034614.484018-1-alvinzhou.tw@gmail.com>
 <20240718034614.484018-7-alvinzhou.tw@gmail.com> <97134efb-398d-4c21-a915-87a5b4f1b29a@linaro.org>
 <CAPhrvRR3U9=0DuG_FQ81ZJq+RLe6Bn9YO831Mx2n3NkeV3MCdA@mail.gmail.com>
 <368cd6fb-cab1-44ad-af46-651d9323bc19@linaro.org> <618e4514-791b-4a73-a1ba-45170a21e453@linaro.org>
 <79406f2b-8411-4059-b959-9e543944fb9c@linaro.org> <20240925115746.22cdd8fe@xps-13>
In-Reply-To: <20240925115746.22cdd8fe@xps-13>
From: Alvin Zhou <alvinzhou.tw@gmail.com>
Date: Thu, 26 Sep 2024 11:06:41 +0800
Message-ID: <CAPhrvRR2_j=KhFJHWyU48z998q0wkoZJYCBAUuv8ejp7xnkWiQ@mail.gmail.com>
Subject: Re: [PATCH v9 6/6] mtd: spi-nor: add support for Macronix Octal flash
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org, 
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, pratyush@kernel.org, 
	mwalle@kernel.org, richard@nod.at, vigneshr@ti.com, broonie@kernel.org, 
	chengminglin@mxic.com.tw, leoyu@mxic.com.tw, 
	AlvinZhou <alvinzhou@mxic.com.tw>, JaimeLiao <jaimeliao@mxic.com.tw>, 
	Bough Chen <haibo.chen@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_200741_680042_AEDEB6EE 
X-CRM114-Status: GOOD (  28.99  )
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

SGkgTWlxdWVsLAoKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8
IDIwMjTlubQ55pyIMjXml6Ug6YCx5LiJIOS4i+WNiDU6NTflr6vpgZPvvJoKPgo+IEhpIEFsdmlu
LAo+Cj4gdHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnIHdyb3RlIG9uIFR1ZSwgMjQgU2VwIDIwMjQg
MDg6MTc6MjYgKzAxMDA6Cj4KPiA+IE9uIDkvMjQvMjQgNzozNiBBTSwgVHVkb3IgQW1iYXJ1cyB3
cm90ZToKPiA+ID4KPiA+ID4KPiA+ID4gT24gOS8yNC8yNCA3OjI2IEFNLCBUdWRvciBBbWJhcnVz
IHdyb3RlOgo+ID4gPj4KPiA+ID4+Cj4gPiA+PiBPbiA5LzI0LzI0IDQ6MjUgQU0sIEFsdmluIFpo
b3Ugd3JvdGU6Cj4gPiA+Pj4gSGkgVHVkb3IsCj4gPiA+Pj4KPiA+ID4+PiBUdWRvciBBbWJhcnVz
IDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+IOaWvCAyMDI05bm0OeaciDIz5pelIOmAseS4gCDk
uIvljYgyOjU05a+r6YGT77yaCj4gPiA+Pj4+Cj4gPiA+Pj4+IEhpLCBBbHZpbiwKPiA+ID4+Pj4K
PiA+ID4+Pj4gSSBxdWlja2x5IHNraW1tZWQgb3ZlciB0aGUgcHJldmlvdXMgNSBwYXRjaGVzIGFu
ZCB0aGV5IGFyZSBsb29raW5nIGZpbmUuCj4gPiA+Pj4+Cj4gPiA+Pj4+IEkgZG9uJ3QgZ2V0IHRo
aXMgcGF0Y2ggaG93ZXZlci4KPiA+ID4+Pj4KPiA+ID4+Pj4gT24gNy8xOC8yNCA0OjQ2IEFNLCBB
bHZpblpob3Ugd3JvdGU6Cj4gPiA+Pj4+PiBGcm9tOiBBbHZpblpob3UgPGFsdmluemhvdUBteGlj
LmNvbS50dz4KPiA+ID4+Pj4+Cj4gPiA+Pj4+PiBBZGRpbmcgTWFudWZhY3R1cmUgSUQgMHhDMiBp
biBsYXN0IG9mIElEIHRhYmxlIGJlY2F1c2Ugb2YKPiA+ID4+Pj4+IE9jdGFsIEZsYXNoIG5lZWQg
bWFudWZhY3R1cmVyIGZpeHVwIGZvciBlbmFibGluZy9kaXNhYmxpbmcKPiA+ID4+Pj4+IE9jdGFs
IERUUiBtb2RlLgo+ID4gPj4+Pj4KPiA+ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IEphaW1lTGlhbyA8
amFpbWVsaWFvQG14aWMuY29tLnR3Pgo+ID4gPj4+Pj4gU2lnbmVkLW9mZi1ieTogQWx2aW5aaG91
IDxhbHZpbnpob3VAbXhpYy5jb20udHc+Cj4gPiA+Pj4+PiAtLS0KPiA+ID4+Pj4+ICBkcml2ZXJz
L210ZC9zcGktbm9yL21hY3Jvbml4LmMgfCA0ICsrKy0KPiA+ID4+Pj4+ICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Pj4+Pgo+ID4gPj4+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYyBiL2RyaXZlcnMvbXRkL3Nw
aS1ub3IvbWFjcm9uaXguYwo+ID4gPj4+Pj4gaW5kZXggZjAzOTgxOWE1MjUyLi4xYThjY2ViZGZl
MGUgMTAwNjQ0Cj4gPiA+Pj4+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMK
PiA+ID4+Pj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYwo+ID4gPj4+Pj4g
QEAgLTIwMCw3ICsyMDAsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8gbWFjcm9u
aXhfbm9yX3BhcnRzW10gPSB7Cj4gPiA+Pj4+PiAgICAgICAgICAgICAgIC5uYW1lID0gIm14MjVs
MzI1NWUiLAo+ID4gPj4+Pj4gICAgICAgICAgICAgICAuc2l6ZSA9IFNaXzRNLAo+ID4gPj4+Pj4g
ICAgICAgICAgICAgICAubm9fc2ZkcF9mbGFncyA9IFNFQ1RfNEssCj4gPiA+Pj4+PiAtICAgICB9
Cj4gPiA+Pj4+PiArICAgICB9LAo+ID4gPj4+Pj4gKyAgICAgLyogTmVlZCB0aGUgbWFudWZhY3R1
cmVyIGZpeHVwcywgS2VlcCB0aGlzIGxhc3QgKi8KPiA+ID4+Pj4+ICsgICAgIHsgLmlkID0gU05P
Ul9JRCgweGMyKSB9Cj4gPiA+Pj4+PiAgfTsKPiA+ID4+Pj4+Cj4gPiA+Pj4+Cj4gPiA+Pj4+IENv
dWxkIHlvdSBwbGVhc2UgZWxhYm9yYXRlIHdoeSB5b3UgbmVlZCBqdXN0IHRoZSBtYW51ZmFjdHVy
ZXIgaWQgaGVyZT8gSQo+ID4gPj4+PiB3b3VsZCBoYXZlIGV4cGVjdGVkIHRvIHNlZSBhIHNwZWNp
ZmljIGZsYXNoIGVudHJ5IGluc3RlYWQuCj4gPiA+Pj4KPiA+ID4+PiBHcmF0ZWZ1bCB0byBNaWNo
YWVsIGZvciB0aGUgdmFsdWFibGUgc3VnZ2VzdGlvbi4gVGhpcyBhZGRpdGlvbiBvZiB0aGUKPiA+
ID4+PiBNYWNyb25peCBtYW51ZmFjdHVyZXIgSUQgZW5hYmxlcyB0aGUgZml4dXAgZnVuY3Rpb25z
IHN1Y2ggYXMKPiA+ID4+PiBtYWNyb25peF9ub3Jfc2V0X29jdGFsX2R0ciB0byBiZSBleGVjdXRl
ZCB3aXRob3V0IHRoZSBuZWVkIHRvCj4gPiA+Pj4gY3JlYXRlIHNlcGFyYXRlIElEIGVudHJpZXMg
Zm9yIGVhY2ggT2N0YWwgRFRSIE5PUiBGbGFzaCBpbiB0aGUKPiA+ID4+PiBmbGFzaF9pbmZvLgo+
ID4gPj4+Cj4gPiA+Pgo+ID4gPj4gQWgsIG5pY2UuIE9rYXkgdGhlbi4gSSdtIGdvaW5nIHRvIHJl
dmlldyB0aGUgcmVzdCBvZiB0aGUgcGF0Y2hlcy4gVGhleQo+ID4gPj4gbG9vayBwcm9taXNpbmcg
OykuCj4gPiA+Cj4gPiA+IGFoLCBidXQgdGhlbiB5b3UnbGwgYWx3YXlzIGhhdmUgYSBtYXRjaGVk
IElELCBzbyB5b3UgYnJlYWsgdGhlIGdlbmVyaWMKPiA+ID4gZmxhc2ggcHJvYmluZyBmb3IgbWFj
cm9uaXguIElzIHRoYXQgY29ycmVjdD8KPiA+Cj4gPiBBbnN3ZXJpbmcgbXlzZWxmOiBpdCdzIGZp
bmUuIEdlbmVyaWMgZmxhc2ggcHJvYmUganVzdCBmaWxscyBhIG5hbWUsCj4gPiB3aGljaCB3ZSBk
b24ndCByZWFsbHkgY2FyZSBhYm91dC4KPgo+IEkgd2FzIGFsc28gYSBiaXQgc3VycHJpc2VkIGJ5
IHRoZSBkaWZmLCB3b3VsZCB5b3UgbWluZCBmaWxsaW5nIGEgbW9yZQo+IGNvbXBsZXRlIHdpdGgg
ZGV0YWlscyBvbiB0aGUgYWN0dWFsIGdvYWwgb2YgdGhpcyBlbnRyeSAoaGF2aW5nIGFsbAo+IE1h
Y3Jvbml4IGZsYXNoZXMgdG8gZ2V0IHRoZSBmaXh1cHMsIHdpdGhvdXQgY3JlYXRpbmcgc2VwYXJh
dGUgSUQKPiBlbnRyaWVzIGZvciBlYWNoIG9mIHRoZSBmbGFzaGVzKQoKVGhhbmsgeW91IGZvciB0
aGUgcmVtaW5kZXIsIEkgd2lsbCBpbmNvcnBvcmF0ZSBtb3JlIGRldGFpbGVkCmV4cGxhbmF0aW9u
cy4KCj4KPiBUaGFua3MsCj4gTWlxdcOobAoKVGhhbmtzLApBbHZpbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
