Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B08C43217
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jan 2022 17:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+5mdbVGIgiTQOnvUZ+7OA6lz3ixb7pIN+U2DoKJa1kg=; b=yGvPUxFuOa2PIj
	94DOqaxi1wiL/Xw6BlDndyOuzdkSrb9fvG658F6ZQ03vKKAxa1Xu4iXpntzTfy8GeN1IRmVq5HSVy
	Gk5DH5ta0MZvYc9SGdpFA2Bu96G8TV0M9mlVb9jGJR6Fc2wro06hVEEp61bO3Wly3xePsyu/6CaeI
	kjFF7BBTDmKpE+JuMHNarbekdvoTTkyS43iP5cxXP/g8LOcHSZXQ16B/96hBxA+E73toyjISpXbXw
	H02JMMcDiVrRhH2suPIozXYQNMXqT3g0XFtqLY1dhJVKp3f1xNPmW6DqKKLw1+KTe4wFEV7FcgWuK
	F0K6KEUb2WfOXNyDBSnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4R9K-009fxf-9i; Mon, 03 Jan 2022 17:29:34 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4R8S-009fXl-CP
 for linux-mtd@lists.infradead.org; Mon, 03 Jan 2022 17:28:42 +0000
Received: by mail-vk1-xa29.google.com with SMTP id u198so19246930vkb.13
 for <linux-mtd@lists.infradead.org>; Mon, 03 Jan 2022 09:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qNcWKQrLWBuk1ywuSBdmMpZzWFQaVsYbPlfcMZU1hxM=;
 b=kGrMKL8qFENKuqOZ8n99FxdgoanFjBmtIuB7d0TsiMfVF2Fd97aVV1x37ZAuR3h3dB
 IaYormZDYLVAviYCMX9h0cqeSfSLjaBS3FFT3bvbOrXU8NpJu+sQDYibg5IU5Yb5I63F
 m5F0BST///BHz6CvIFx9SoHyAdH9hv2TDMbuC6lIQOgkrqhT+FWjdSZQpHiY/N5hxGQc
 B8Y23k7VGOEps6drQxepoP4C+aG5adzJcS2XBo3qbi4zHYu32SzrGaK6ximJOol6KZ/P
 zYdxoUvTH41HEtYPzTIETPLKrT6dicTOfkE0GP3cMeqehrx9d37FZZdNiEUmcgSc0NSZ
 uStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qNcWKQrLWBuk1ywuSBdmMpZzWFQaVsYbPlfcMZU1hxM=;
 b=nlyXJ3vykig+0S76nUzH+bHEJhhtx8LhDTTLEfbKrI463k0QFGnsnkXiwGd8EBEg82
 xwt/3zqzQnJEerXAu9SksHW6bEkXRofl+4DvEpbeURia6qhjNRFuGDZo+MTJ2sniwWFD
 JKEdW5W1arajGeCtcqo53gNc/7LnxKIib1JxiLXIy75pj2YS6m3ICwlTKj/l1/KS8MTx
 X1rIfOQgSLFJgPcku1W3lle57u+TmBF34Khy+HjhH+r2Vi5pk82JdfaDYdymbDFbI8Dz
 2YQNJBpeDa95jfR0KqHBkwtpBc+BP0fb3smJYtLiWcLzjfOjTueplFvj+qibWDtDvN8c
 uipg==
X-Gm-Message-State: AOAM533w2R8IJxhQ+Te8Cm0mNwm+aoXtT5afcXpTcb8u3LE7Xk8fg1md
 r5LMtje9uUKIsR9zolNOHuhk+DiKk+s=
X-Google-Smtp-Source: ABdhPJxcWHzy3oFxvqJxLjHexLOkAE5JFgtX0xE84zjJOeeN7L8F926irB6RNGZ2qLcZV/KsxwkKmg==
X-Received: by 2002:a05:6122:1799:: with SMTP id
 o25mr15425264vkf.3.1641230918902; 
 Mon, 03 Jan 2022 09:28:38 -0800 (PST)
Received: from [10.230.2.158] ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id x2sm8465299vsj.32.2022.01.03.09.28.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 09:28:38 -0800 (PST)
Message-ID: <0fb3ff91-a9d6-ef9f-6f3d-7f896da4d44a@gmail.com>
Date: Mon, 3 Jan 2022 09:28:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 9/9] mtd: rawnand: brcmnand: Add BCMA shim
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mtd@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Brian Norris <computersforpeace@gmail.com>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Cai Huoqing <caihuoqing@baidu.com>, Colin Ian King <colin.king@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM SPECIFIC AMBA DRIVER (BCMA)"
 <linux-wireless@vger.kernel.org>,
 "open list:BROADCOM STB NAND FLASH DRIVER"
 <bcm-kernel-feedback-list@broadcom.com>
References: <20211223002225.3738385-1-f.fainelli@gmail.com>
 <20211223002225.3738385-10-f.fainelli@gmail.com>
 <20220103180639.681aca15@xps13>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220103180639.681aca15@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_092840_486354_CC558E62 
X-CRM114-Status: GOOD (  20.55  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAxLzMvMjAyMiA5OjA2IEFNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEZsb3JpYW4s
Cj4gCj4gZi5mYWluZWxsaUBnbWFpbC5jb20gd3JvdGUgb24gV2VkLCAyMiBEZWMgMjAyMSAxNjoy
MjoyNSAtMDgwMDoKPiAKPj4gQWRkIGEgQkNNQSBzaGltIHRvIGFsbG93IHVzIHRvIHJlZ2lzdGVy
IHRoZSBicmNtbmFuZCBkcml2ZXIgdXNpbmcgdGhlCj4+IEJDTUEgYnVzIHdoaWNoIHByb3ZpZGVz
IGluZGlyZWN0IG1lbW9yeSBtYXBwZWQgYWNjZXNzIHRvIFNvQyByZWdpc3RlcnMuCj4+Cj4+IFRo
ZXJlIGFyZSBhIG51bWJlciBvZiByZWdpc3RlcnMgdGhhdCBuZWVkIHRvIGJlIGJ5dGUgc3dhcHBl
ZCBiZWNhdXNlCj4+IHRoZXkgYXJlIG5hdGl2ZWx5IGJpZyBlbmRpYW4sIGNvbWluZyBkaXJlY3Rs
eSBmcm9tIHRoZSBOQU5EIGNoaXAsIGFuZAo+PiB0aGVyZSBpcyBubyBidXMgaW50ZXJmYWNlIHVu
bGlrZSB0aGUgaVByb2Mgb3IgU1RCIHBsYXRmb3JtcyB0aGF0Cj4+IHBlcmZvcm1zIHRoZSBieXRl
IHN3YXBwaW5nIGZvciB1cy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRmxvcmlhbiBGYWluZWxsaSA8
Zi5mYWluZWxsaUBnbWFpbC5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L0tj
b25maWcgICAgICAgICAgICAgIHwgIDExICsrCj4+ICAgZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJj
bW5hbmQvTWFrZWZpbGUgICAgfCAgIDIgKwo+PiAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21u
YW5kL2JjbWFfbmFuZC5jIHwgMTMxICsrKysrKysrKysrKysrKysrKysrKysKPj4gICAzIGZpbGVz
IGNoYW5nZWQsIDE0NCBpbnNlcnRpb25zKCspCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JjbWFfbmFuZC5jCj4+Cj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZp
Zwo+PiBpbmRleCAwYTQ1ZDNjNmMxNWIuLmY2NDNlMDJlNTU1OSAxMDA2NDQKPj4gLS0tIGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZwo+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9L
Y29uZmlnCj4+IEBAIC0yMDgsNiArMjA4LDE3IEBAIGNvbmZpZyBNVERfTkFORF9CUkNNTkFORAo+
PiAgIAkgIG9yaWdpbmFsbHkgZGVzaWduZWQgZm9yIFNldC1Ub3AgQm94IGJ1dCBpcyB1c2VkIG9u
IHZhcmlvdXMgQkNNN3h4eCwKPj4gICAJICBCQ00zeHh4LCBCQ002M3h4eCwgaVByb2MvQ3lnbnVz
IGFuZCBtb3JlLgo+PiAgIAo+PiAraWYgTVREX05BTkRfQlJDTU5BTkQKPj4gKwo+PiArY29uZmln
IE1URF9OQU5EX0JSQ01OQU5EX0JDTUEKPj4gKwl0cmlzdGF0ZSAiQnJvYWRjb20gQkNNQSBOQU5E
IGNvbnRyb2xsZXIiCj4+ICsJZGVwZW5kcyBvbiBCQ01BX05GTEFTSAo+PiArCWRlcGVuZHMgb24g
QkNNQQo+PiArCWhlbHAKPj4gKwkgIEVuYWJsZXMgdGhlIEJSQ01OQU5EIGNvbnRyb2xsZXIgb3Zl
ciBCQ01BIG9uIEJDTTQ3MTg2L0JDTTUzNTggU29Dcy4KPj4gKwo+PiArZW5kaWYgIyBNVERfTkFO
RF9CUkNNTkFORAo+PiArCj4+ICAgY29uZmlnIE1URF9OQU5EX0JDTTQ3WFhORkxBU0gKPj4gICAJ
dHJpc3RhdGUgIkJDTTQ3MDYgQkNNQSBOQU5EIGNvbnRyb2xsZXIiCj4+ICAgCWRlcGVuZHMgb24g
QkNNQV9ORkxBU0gKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5k
L01ha2VmaWxlIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvTWFrZWZpbGUKPj4gaW5k
ZXggMTk1Yjg0NWU0OGI4Li4xNmRjNzI1NDIwMGUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2JyY21uYW5kL01ha2VmaWxlCj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2JyY21uYW5kL01ha2VmaWxlCj4+IEBAIC02LDMgKzYsNSBAQCBvYmotJChDT05GSUdfTVREX05B
TkRfQlJDTU5BTkQpCQkrPSBiY202MzEzOF9uYW5kLm8KPj4gICBvYmotJChDT05GSUdfTVREX05B
TkRfQlJDTU5BTkQpCQkrPSBiY202MzY4X25hbmQubwo+PiAgIG9iai0kKENPTkZJR19NVERfTkFO
RF9CUkNNTkFORCkJCSs9IGJyY21zdGJfbmFuZC5vCj4+ICAgb2JqLSQoQ09ORklHX01URF9OQU5E
X0JSQ01OQU5EKQkJKz0gYnJjbW5hbmQubwo+PiArCj4+ICtvYmotJChDT05GSUdfTVREX05BTkRf
QlJDTU5BTkRfQkNNQSkJKz0gYmNtYV9uYW5kLm8KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2JyY21uYW5kL2JjbWFfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJj
bW5hbmQvYmNtYV9uYW5kLmMKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAw
MDAwMDAwLi5lM2JlOWVjZjA3NjEKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9icmNtbmFuZC9iY21hX25hbmQuYwo+PiBAQCAtMCwwICsxLDEzMSBAQAo+PiAr
Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+PiArLyoKPj4gKyAqIENv
cHlyaWdodCDCqSAyMDIxIEJyb2FkY29tCj4+ICsgKi8KPj4gKyNpbmNsdWRlIDxsaW51eC9iY21h
L2JjbWEuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9iY21hL2JjbWFfZHJpdmVyX2NoaXBjb21tb24u
aD4KPj4gKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1
bGUuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9tb2RfZGV2aWNldGFibGUuaD4KPj4gKyNpbmNsdWRl
IDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPj4gKwo+PiArI2luY2x1ZGUgImJyY21uYW5kLmgi
Cj4+ICsKPj4gK3N0cnVjdCBicmNtbmFuZF9iY21hX3NvYyB7Cj4+ICsJc3RydWN0IGJyY21uYW5k
X3NvYyBzb2M7Cj4+ICsJc3RydWN0IGJjbWFfZHJ2X2NjICpjYzsKPj4gK307Cj4+ICsKPj4gK3N0
YXRpYyBpbmxpbmUgYm9vbCBicmNtbmFuZF9iY21hX25lZWRzX3N3YXBwaW5nKHUzMiBvZmZzZXQp
Cj4+ICt7Cj4+ICsJc3dpdGNoIChvZmZzZXQpIHsKPj4gKwljYXNlIEJDTUFfQ0NfTkFORF9TUEFS
RV9SRDA6Cj4+ICsJY2FzZSBCQ01BX0NDX05BTkRfU1BBUkVfUkQ0Ogo+PiArCWNhc2UgQkNNQV9D
Q19OQU5EX1NQQVJFX1JEODoKPj4gKwljYXNlIEJDTUFfQ0NfTkFORF9TUEFSRV9SRDEyOgo+PiAr
CWNhc2UgQkNNQV9DQ19OQU5EX1NQQVJFX1dSMDoKPj4gKwljYXNlIEJDTUFfQ0NfTkFORF9TUEFS
RV9XUjQ6Cj4+ICsJY2FzZSBCQ01BX0NDX05BTkRfU1BBUkVfV1I4Ogo+PiArCWNhc2UgQkNNQV9D
Q19OQU5EX1NQQVJFX1dSMTI6Cj4+ICsJY2FzZSBCQ01BX0NDX05BTkRfREVWSUQ6Cj4+ICsJY2Fz
ZSBCQ01BX0NDX05BTkRfREVWSURfWDoKPj4gKwljYXNlIEJDTUFfQ0NfTkFORF9TUEFSRV9SRDE2
Ogo+PiArCWNhc2UgQkNNQV9DQ19OQU5EX1NQQVJFX1JEMjA6Cj4+ICsJY2FzZSBCQ01BX0NDX05B
TkRfU1BBUkVfUkQyNDoKPj4gKwljYXNlIEJDTUFfQ0NfTkFORF9TUEFSRV9SRDI4Ogo+PiArCQly
ZXR1cm4gdHJ1ZTsKPj4gKwl9Cj4+ICsKPj4gKwlyZXR1cm4gZmFsc2U7Cj4+ICt9Cj4+ICsKPj4g
K3N0YXRpYyB1MzIgYnJjbW5hbmRfYmNtYV9yZWFkX3JlZyhzdHJ1Y3QgYnJjbW5hbmRfc29jICpz
b2MsIHUzMiBvZmZzZXQpCj4+ICt7Cj4+ICsJc3RydWN0IGJyY21uYW5kX2JjbWFfc29jICpzYzsK
Pj4gKwl1MzIgdmFsOwo+PiArCj4+ICsJc2MgPSBjb250YWluZXJfb2Yoc29jLCBzdHJ1Y3QgYnJj
bW5hbmRfYmNtYV9zb2MsIHNvYyk7Cj4+ICsKPj4gKwkvKiBPZmZzZXQgaW50byB0aGUgTkFORCBi
bG9jayBhbmQgZGVhbCB3aXRoIHRoZSBmbGFzaCBjYWNoZSBzZXBhcmF0ZWx5ICovCj4+ICsJaWYg
KG9mZnNldCA9PSB+MCkKPj4gKwkJb2Zmc2V0ID0gQkNNQV9DQ19OQU5EX0NBQ0hFX0RBVEE7Cj4+
ICsJZWxzZQo+PiArCQlvZmZzZXQgKz0gQkNNQV9DQ19OQU5EX1JFVklTSU9OOwo+PiArCj4+ICsJ
dmFsID0gYmNtYV9jY19yZWFkMzIoc2MtPmNjLCBvZmZzZXQpOwo+PiArCj4+ICsJLyogU3dhcCBp
ZiBuZWNlc3NhcnkgKi8KPj4gKwlpZiAoYnJjbW5hbmRfYmNtYV9uZWVkc19zd2FwcGluZyhvZmZz
ZXQpKQo+PiArCQl2YWwgPSBiZTMyX3RvX2NwdSh2YWwpOwo+PiArCXJldHVybiB2YWw7Cj4+ICt9
Cj4+ICsKPj4gK3N0YXRpYyB2b2lkIGJyY21uYW5kX2JjbWFfd3JpdGVfcmVnKHN0cnVjdCBicmNt
bmFuZF9zb2MgKnNvYywgdTMyIHZhbCwKPj4gKwkJCQkgICAgdTMyIG9mZnNldCkKPj4gK3sKPj4g
KwlzdHJ1Y3QgYnJjbW5hbmRfYmNtYV9zb2MgKnNjOwo+PiArCj4+ICsJc2MgPSBjb250YWluZXJf
b2Yoc29jLCBzdHJ1Y3QgYnJjbW5hbmRfYmNtYV9zb2MsIHNvYyk7Cj4+ICsKPj4gKwkvKiBPZmZz
ZXQgaW50byB0aGUgTkFORCBibG9jayAqLwo+PiArCWlmIChvZmZzZXQgPT0gfjApCj4+ICsJCW9m
ZnNldCA9IEJDTUFfQ0NfTkFORF9DQUNIRV9EQVRBOwo+PiArCWVsc2UKPj4gKwkJb2Zmc2V0ICs9
IEJDTUFfQ0NfTkFORF9SRVZJU0lPTjsKPj4gKwo+PiArCS8qIFN3YXAgaWYgbmVjZXNzYXJ5ICov
Cj4+ICsJaWYgKGJyY21uYW5kX2JjbWFfbmVlZHNfc3dhcHBpbmcob2Zmc2V0KSkKPj4gKwkJdmFs
ID0gY3B1X3RvX2JlMzIodmFsKTsKPj4gKwo+PiArCWJjbWFfY2Nfd3JpdGUzMihzYy0+Y2MsIG9m
ZnNldCwgdmFsKTsKPj4gK30KPj4gKwo+PiArc3RhdGljIHN0cnVjdCBicmNtbmFuZF9pb19vcHMg
YnJjbW5hbmRfYmNtYV9pb19vcHMgPSB7Cj4+ICsJLnJlYWRfcmVnCT0gYnJjbW5hbmRfYmNtYV9y
ZWFkX3JlZywKPj4gKwkud3JpdGVfcmVnCT0gYnJjbW5hbmRfYmNtYV93cml0ZV9yZWcsCj4+ICt9
Owo+PiArCj4+ICtzdGF0aWMgdm9pZCBicmNtbmFuZF9iY21hX3ByZXBhcmVfZGF0YV9idXMoc3Ry
dWN0IGJyY21uYW5kX3NvYyAqc29jLCBib29sIHByZXBhcmUsCj4+ICsJCQkJCSAgIGJvb2wgaXNf
cGFyYW0pCj4+ICt7Cj4+ICsJc3RydWN0IGJyY21uYW5kX2JjbWFfc29jICpzYzsKPj4gKwo+PiAr
CXNjID0gY29udGFpbmVyX29mKHNvYywgc3RydWN0IGJyY21uYW5kX2JjbWFfc29jLCBzb2MpOwo+
IAo+IEEgaGVscGVyIGZvciB0aGF0IHdvdWxkIGJlIG5pY2U/CgpTdXJlLCBJIGNhbiBhZGQgYSBo
ZWxwZXIgc2luY2Ugd2UgdXNlIHRoZSBzYW1lIGNvbnN0cnVjdCBhYm91dCAzIHRpbWVzLCAKdGhh
bmtzIQotLSAKRmxvcmlhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
