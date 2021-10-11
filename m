Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47ADC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 06:45:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7572660E78
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 06:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7572660E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baidu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LpSbMqB3jGzPXV9VIHjRZ0jGWVoL2EjiQw8S/R54ADA=; b=XpFiXeUkGBrPvA
	VbQtNxAVzAjWdRH5Wx7KxjU1Dg6IHMV2WbhKsFfjhWvq8Rhv9dikaADQnbKEUMnAdEi7RcyaEQ1UG
	cy6cJLwVX3Zhjmwt3iTGzR4TXeAl+YS7yBIaeHHaHEJCHdbVrsSFBHhgzhtL6yoRGkau+M0u/fBrZ
	QSVl6ZlTvm04hXafATCsjc9vpuXspQbWIUgCm7Gumi+KwHb64sAK/iM+YVtIUxmszT3ot04KtAsuJ
	3+soar4qDnWB1tmfJQKpPUuXuCDjgykGScrbEi5y6UL7jjzcTHUtkaVsrCs1zUwzS3TLM66agpgmz
	3G9+5HqTl3GZRetQbSZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZp3Z-007xf4-Al; Mon, 11 Oct 2021 06:45:05 +0000
Received: from mx22.baidu.com ([220.181.50.185] helo=baidu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZp3V-007xe0-4H
 for linux-mtd@lists.infradead.org; Mon, 11 Oct 2021 06:45:03 +0000
Received: from BJHW-Mail-Ex01.internal.baidu.com (unknown [10.127.64.11])
 by Forcepoint Email with ESMTPS id 10A9125333B5ECEE11EB;
 Mon, 11 Oct 2021 14:44:47 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex01.internal.baidu.com (10.127.64.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Mon, 11 Oct 2021 14:44:47 +0800
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Mon, 11 Oct 2021 14:44:46 +0800
Received: from BJHW-MAIL-EX27.internal.baidu.com ([169.254.58.247]) by
 BJHW-MAIL-EX27.internal.baidu.com ([169.254.58.247]) with mapi id
 15.01.2308.014; Mon, 11 Oct 2021 14:44:46 +0800
From: "Cai,Huoqing" <caihuoqing@baidu.com>
To: "vigneshr@ti.com" <vigneshr@ti.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH] MAINTAINERS: Update the devicetree documentation path of
 hyperbus
Thread-Topic: [PATCH] MAINTAINERS: Update the devicetree documentation path of
 hyperbus
Thread-Index: AQHXvNbBOZ4gVKSIN0mR+yCEygV/8qvNXIhg
Date: Mon, 11 Oct 2021 06:44:46 +0000
Message-ID: <5d496515614a468881a896c2494add37@baidu.com>
References: <20211009062740.833-1-caihuoqing@baidu.com>
In-Reply-To: <20211009062740.833-1-caihuoqing@baidu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.190.132]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211010_234501_363786_9FCBA87F 
X-CRM114-Status: GOOD (  12.24  )
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
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sDQorQ2MgdmlnbmVzaHJAdGkuY29tLCBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9y
Zw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IENhaSxIdW9xaW5nIDxj
YWlodW9xaW5nQGJhaWR1LmNvbT4NCj4gU2VudDogMjAyMcTqMTDUwjnI1SAxNDoyOA0KPiBUbzog
Q2FpLEh1b3FpbmcNCj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVj
dDogW1BBVENIXSBNQUlOVEFJTkVSUzogVXBkYXRlIHRoZSBkZXZpY2V0cmVlIGRvY3VtZW50YXRp
b24gcGF0aCBvZg0KPiBoeXBlcmJ1cw0KPiANCj4gQ2hhbmdlIHRoZSBkZXZpY2V0cmVlIGRvY3Vt
ZW50YXRpb24gcGF0aA0KPiB0byAiRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC90aSxhbTY1NC1oYm1jLnlhbWwiDQo+IHNpbmNlICdjeXByZXNzLGh5cGVyZmxhc2gudHh0JyBh
bmQgJ3RpLGFtNjU0LWhibWMudHh0JyBoYXZlDQo+IGJlZW4gY29udmVydGVkIHRvICd0aSxhbTY1
NC1oYm1jLnlhbWwnLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2FpIEh1b3FpbmcgPGNhaWh1b3Fp
bmdAYmFpZHUuY29tPg0KPiAtLS0NCj4gIE1BSU5UQUlORVJTIHwgMyArLS0NCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTDQo+IGluZGV4IDliMjU1Y2Y0ZmNhOC4uNDg5NDlj
ZDdmODk4IDEwMDY0NA0KPiAtLS0gYS9NQUlOVEFJTkVSUw0KPiArKysgYi9NQUlOVEFJTkVSUw0K
PiBAQCAtODc4Myw4ICs4NzgzLDcgQEAgUzoJU3VwcG9ydGVkDQo+ICBROglodHRwOi8vcGF0Y2h3
b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1tdGQvbGlzdC8NCj4gIEM6CWlyYzovL2lyYy5v
ZnRjLm5ldC9tdGQNCj4gIFQ6CWdpdCBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBjZmkvbmV4dA0KPiAtRjoJRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9jeXByZXNzLGh5cGVyZmxhc2gudHh0DQo+IC1GOglEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3RpLGFtNjU0LWhibWMudHh0DQo+ICtG
OglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3RpLGFtNjU0LWhibWMueWFt
bA0KPiAgRjoJZHJpdmVycy9tdGQvaHlwZXJidXMvDQo+ICBGOglpbmNsdWRlL2xpbnV4L210ZC9o
eXBlcmJ1cy5oDQo+IA0KPiAtLQ0KPiAyLjI1LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
