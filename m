Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EFCC624A4
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Sep 2026 09:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5FPmwcOEP3H/KIylL5B56ZpaCUOjV6YGVYfdzw6tPVc=; b=jvjhz7iLIlL311
	+pe8EagBoNIh725cxiKsF2/b0qaREXm1rSK/1qnGcLJhXTZLxBe2suO2lnSb4QMsJWGt5ws5w9O/o
	mEZ3nClHjT2Ds7Wr3yMZb8UN3O8IWNrAJ1w0GOczTPxA2n6wuP6FqY6200avnYs/QGwYd4n2HYV9S
	5qhQunMSzBe25iuHekQ7C3s6ISfN3uTXu0Mx9LXkGGp0gwq2NFIw9pQsQTUJsgWmvlyT1boNeGfsZ
	GxLjdNU2f7rTaXq0FLHIKniHvgLl8Yssu5CqDvSuw+bJab+InP/8Ze+1DzhxaWduUDzW0hH720GXy
	sCNIoQjLyhN9dwJjV/9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23yS-0000000Gz98-3SGj;
	Thu, 03 Sep 2026 09:43:12 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23yQ-0000000Gz8h-19ZK
	for linux-mtd@lists.infradead.org;
	Thu, 03 Sep 2026 09:43:11 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso1924747a91.1
        for <linux-mtd@lists.infradead.org>; Thu, 03 Sep 2026 02:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788428589; x=1789033389; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eeQmjVkVna13xNvuP7KXsaAPQ0j3npYARLOdxRgDqJ0=;
        b=BAJs+HFiq8qK+NgwFIdshOaiPLzVvXTqbfm55g1+sZnYPfm5BQa4pO2UmEnbhOGmC/
         +paiFYWya+57JYEdTkJrOUyPSyO1d+Jgo9bGfOT+qabLZaGMMbqVQnkb8zk4K+eB8zhb
         0rn6rboQbtzP6mivcFAjT+DleOXO9YAzYIcue8c04/9gL7dzMlDG8yzasyXb9O+gyx+i
         OPZ/ly9pQGl0PEbiSPT+LU7l7b1h74aEEuGjtD5pgcdQI1ARpBP1Qp3FhqRWsw2MjT7p
         ktLfghV+lVQxf+9IcWrYcoC3Wb5TvKavjgfzxsZp2UcQInaiGefCaQfoitgolLnVgiVk
         DK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788428589; x=1789033389;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eeQmjVkVna13xNvuP7KXsaAPQ0j3npYARLOdxRgDqJ0=;
        b=mJddejTzsI/J5CfxeKQ/CyJdAs9XixeoixRrks1+PdDLnfILdMqhRg1hwPsdcOfr2N
         K1wRj9DlN3UbtV7R17DLx5nUbJ+ag9QzvK1cj/VxokT/lPHsWNv40fZI3rKFO4EyBFLE
         AOoWZz0ARlL17g5cHQBNU5/P94mzFneqHO8XgRNKNgpou4H7SegStPCDntxSiSWFFDUu
         rbqqchM9QgU68OwocAKbyoIELvp5HHVG4RcapYcpdr7Yi0whANqpZNojHoULfR9rjdoq
         uItfEiX7KgNoH+wBMGdKDP7D1n3nyGVGF/F1vHRrrYIRoRI1/wPHc5zdjgPCIsJiU3bx
         F/0A==
X-Gm-Message-State: AFuF++nO0IsaZoWxEWpVh7ltAvPpgCn8w9kSYbVPcSo6EEjQhwWwtVq/
	f7xyDRYTvSRFw7x1kd9vYP0KWTCUmq0j1QsWMlTXtwufR8Tqj+r8qBtk
X-Gm-Gg: AYBFou17toPSoR+C4tGOwMbB1kzDfSzptCXE+bRX/JeIBsNxjpav8TLN4R+VNxVX1rT
	CK7+0o4s6O66ibOYc3T30ZBr7Y0oE3lNwIVeZn1P+831ThDUiUrRD6gzNLQkwGkS6Ovi5BjGTnI
	m385ZbR5OtMppgVK9n5oVZ0AtlkWWUhDD2QngSKiemLFUGtsQwu8SwLvZv+4sqE/3/TAtMgfXzP
	QXhAeJ/yNoikIYT94o12Wwd68fNBOGdk2iJv7pk9NKg507rgKPu3EivhL9I16h96yE4s3pbCELA
	ZtnLTiDKXUG0sOu/F0pq45MzOJGTBSqmqxb3E517IBDfIB6X06psNHKJw7TYlUw1x9ghrDf7aEO
	GkZUptOuLpXUxvkbvSjKyqfdiTztXp29+cl/hPeCTtxZNjd15EaO+dirEqK+pJJYfORtRSKo6H5
	bhgHsTARdOkB7FTtxalW+eJAUYOYQMkC8qB3aOF6EPmDfREuU8onsyCHpHk9Dggm7oWpgk0nzrs
	sxmzjVBzEym2lGGQOQ4vqXS0te9YxGrYw==
X-Received: by 2002:a17:90b:2552:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-39aedec7bbbmr17515317a91.5.1788428588043;
        Thu, 03 Sep 2026 02:43:08 -0700 (PDT)
Received: from [192.168.255.10] ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0832c14fsm4421347a91.3.2026.09.03.02.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:43:07 -0700 (PDT)
Message-ID: <906239c1-e78c-435c-954f-1198595d62b2@gmail.com>
Date: Thu, 3 Sep 2026 17:43:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: inftl: validate MediaHeader partition geometry
 before allocating tables
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, richard@nod.at, vigneshr@ti.com,
 linux-kernel@vger.kernel.org, Aohan Mei <henrymei@tencent.com>,
 TencentOS Corvus AI <corvus@tencent.com>, stable@vger.kernel.org
References: <20260902124044.3942821-1-henrymei@tencent.com>
 <87h5k67ocd.fsf@bootlin.com>
From: =?UTF-8?B?5p6X5L2z6bmP?= <ljp1205831794@gmail.com>
In-Reply-To: <87h5k67ocd.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_024310_312942_D6F2658F 
X-CRM114-Status: GOOD (  10.96  )
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

SGkgTWlxdcOobCwKCk9uIDAyLzA5LzIwMjYsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBpcyBl
dmFsdWF0ZWQgaW4gdW5zaWduZWQgMzItYml0IGFyaXRobWV0aWMuwqAgV2l0aCBsYXN0VW5pdCA8
IGZpcnN0VW5pdAo+wqAKPiBsYXN0VW5pdCA8IGZpcnN0VW5pdD8gRGlkIHlvdSBldmVuIHJlYWQg
dGhhdCBzZW50ZW5jZT8KCkkgc2hvdWxkIGhhdmUgbWFkZSB0aGUgYXJpdGhtZXRpYyBleHBsaWNp
dCBpbiB0aGUgZmlyc3QgcGxhY2UuCkFsbCB0aHJlZSBmaWVsZHMgYXJlIF9fdTMyIChzdHJ1Y3Qg
SU5GVExQYXJ0aXRpb24pLCBzbyB3aXRoIHRoZQpjcmFmdGVkIGhlYWRlciB1c2VkIGluIHRlc3Rp
bmcgKGZpcnN0VW5pdD03MDAwLCBsYXN0VW5pdD0zLAp2aXJ0dWFsVW5pdHM9MTAwKToKCsKgIMKg
ICgzIC0gNzAwMCArIDEpID09IDQyOTQ5NjAzMDDCoCDCoCAvKiB1MzIgd3JhcCAqLwrCoCDCoCA0
Mjk0OTYwMzAwIDwgMTAwID09IGZhbHNlwqAgwqAgLyogc2FuaXR5IGNoZWNrIHBhc3NlcyAqLwoK
RXhlY3V0aW9uIHRoZW4gY29udGludWVzIHdpdGggbmJfYm9vdF9ibG9ja3M9NzAwMCBhcyB0aGUg
bG9vcApib3VuZCBhZ2FpbnN0IGEga21hbGxvY19hcnJheShsYXN0VW5pdCArIDEgPSA0LCAyKSA9
IDgtYnl0ZQpQVXRhYmxlLCBhbmQgdGhlIGJvb3QtYmxvY2sgbWFya2luZyBsb29wIHdyaXRlcyB+
MTQgS0IgcGFzdAp0aGUgb2JqZWN0LsKgIFJlcHJvZHVjZWQgb24gdjcuMi1yYzQgd2l0aCBhIFJB
TS1iYWNrZWQgZmFrZQpEaXNrT25DaGlwIE1URCBkZXZpY2UgY2FycnlpbmcgdGhhdCBoZWFkZXI6
CgrCoCDCoCBCVUc6IEtBU0FOOiBzbGFiLW91dC1vZi1ib3VuZHMgaW4gZmluZF9ib290X3JlY29y
ZArCoCDCoCBXcml0ZSBvZiBzaXplIDIgLi4uIDAgYnl0ZXMgdG8gdGhlIHJpZ2h0IG9mIGFsbG9j
YXRlZCA4LWJ5dGUgcmVnaW9uCgpUaGF0IHNhaWQsIHRoZSByZWFjaGFiaWxpdHkgaXMgYWRtaXR0
ZWRseSBuYXJyb3c6IHRoaXMgaXMgYQptb3VudC10aW1lIHBhdGgsIHNvIHRyaWdnZXJpbmcgcmVx
dWlyZXMgcm9vdCAoZGV2aWNlCnJlZ2lzdHJhdGlvbikgb3IgcGh5c2ljYWwgY29udHJvbCBvZiB0
aGUgZmxhc2ggY29udGVudHM7CnVucHJpdmlsZWdlZCB1c2VycyBjYW5ub3QgcmVhY2ggaXQuwqAg
VGhlIGludGVudCBpcyBvbmx5CmhhcmRlbmluZyBvZiB0aGUgTWVkaWFIZWFkZXIgcGFyc2VyLCBp
biB0aGUgc2FtZSBzcGlyaXQgYXMKdGhlIHNhbml0eSBjaGVja3MgYWxyZWFkeSBpbiBmaW5kX2Jv
b3RfcmVjb3JkKCkuCgpPbmUgZmFpciBwb2ludCBhYm91dCB2MTogdGhlIG5ldyBjaGVjayBydW5z
IG9uIGV2ZXJ5IHBhcnRpdGlvbgplbnRyeSBkdXJpbmcgdGhlIHNjYW4sIHdoaWxlIG9ubHkgdGhl
IHNlbGVjdGVkIEJEVEwgZW50cnkncwpmaWVsZHMgYXJlIGFjdHVhbGx5IHVzZWQgZm9yIHRoZSBh
bGxvY2F0aW9ucy7CoCBJZiBlbnRyaWVzIHdpdGgKbGFzdFVuaXQgPCBmaXJzdFVuaXQgY2FuIGxl
Z2l0aW1hdGVseSBhcHBlYXIgaW4gb3RoZXIgc2xvdHMKb24gcmVhbCBtZWRpYSwgSSBjYW4gcmVz
cGluIHRvIHZhbGlkYXRlIG9ubHkgdGhlIHNlbGVjdGVkCnBhcnRpdGlvbiAoYW5kIGRyb3AgdGhl
IGJvb3QtcmVjb3JkLXVuaXQgY2hlY2sgaWYgcHJlZmVycmVkKS4KCkhhcHB5IHRvIHNlbmQgYSB2
MiBhbG9uZyB0aG9zZSBsaW5lcyBpZiB5b3UgdGhpbmsgdGhlCmhhcmRlbmluZyBpcyB3b3J0aHdo
aWxlOyBvdGhlcndpc2UgSSB3aWxsIGRyb3AgaXQuwqAgRWl0aGVyCndheSwgdGhhbmtzIGZvciB0
aGUgdGltZS4KClRoYW5rcywKQW9oYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
