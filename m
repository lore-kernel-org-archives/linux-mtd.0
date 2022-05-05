Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDE5C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  5 May 2022 05:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Wc+gmsn0+7F6CxUC5f1Vv2QvReWziGbQy53lyGcD94=; b=nH4002btOZKOyg
	Oe5sXdbVXpPnu9cRsS8PsNkEzGh1L9In9Ih3IkF34ISckv+W9zIquGlqXZ8VLGYZYCSBYHQwfEFBt
	nONR0YXR3svgGvgP69gAGq3Gin9XzfB7Z0cwDrvxcHa4c2mW0GC0LxjYlLkeXT4sRv/jCxG01OkkC
	y/nf0LGnq2sFaslWYH+D8g9O7mx7MY15b/FWjNGD5sjgas50ZQXRxCVYAKca2XSzgmoenXcIKksCw
	yjfdugXkO+RgYCDvmhYC2BxhiqV/SvAq3C2SXvwccA2EAPUl69SaLCdrXxB8p6EZkjNtwZN+ny+e3
	1/WsgVl6EoiFDPCfrYiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmUK1-00E5pf-9k; Thu, 05 May 2022 05:46:41 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmUJy-00E5ny-HU; Thu, 05 May 2022 05:46:39 +0000
Received: by mail-ej1-x62f.google.com with SMTP id kq17so6680731ejb.4;
 Wed, 04 May 2022 22:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :from:in-reply-to:content-transfer-encoding;
 bh=AAqxEn14F2urq7gRW6XIInZJqYKSj6uaZRKkj7ztyxc=;
 b=iVInBQQc78CUYacNlpsH9Ud7kB6dqn23jW7w+jMJscvFFkOHvZBF54dzHIWhvU3llN
 qW0uY0HHzTq1H9e10V+kPJH7f9nsk5NsPgVxzBhUXMTmiHdbSLSfbQiD6VysHFoae+Dh
 JFilEyLYF9y7tE5HunM7u10h/4uBoOSZYLbV5OsBHJWx8zA7ewQVvD7mRBRKh0EeAf5s
 fDfVGfhSWyajKH0AaR0S1TvwlCtCCjXTck9Cumtnlv7g4rsUW/ExegF650iQ+7M8EkaJ
 W9OofsnjDhmPo7P59xG8naTefJsMm8WeFaoU4y0mIE28JQ+Zg9heoq3GCh7vep4TvCgU
 IIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AAqxEn14F2urq7gRW6XIInZJqYKSj6uaZRKkj7ztyxc=;
 b=UlHT/tB9K73A4S1zPLGbT5aznGL6dSaeQJIVEggPCc+zQ95l/WK9XQa0s2J81oGzSy
 j19zm8AiRpH8GIshvCwEAIxdN2jMtEfXb1Ee/60hBiaKc4LtQXIhBl5v4oCKIe40F+lA
 69V+v1HG+W6aANwzUM/GVBgLe+MzPVXBYHuHpSse9liDRv6qEnbSwdj6Y35CQwvKJ+qj
 X07dl/L0b5S0+JbjI7pnt7kf9wZScXF/YjZ4uVEKrvE+DpzSC2dRPGXG3/bq3Oh+p9K3
 YGikZcDh0krBomuICH9FrpD1/4Mh8akfW+nIn/aG25S6yAPS7/ECO9VEWkjGHQAskc8w
 0YDA==
X-Gm-Message-State: AOAM531XvgNkh/2zTDZ8nLJKQmIAlBLYbujtvQZaTnAlU837yrDuczip
 QSCqNlXLJDNFpQseHwEaJE0=
X-Google-Smtp-Source: ABdhPJxmEoOm7L1U4kbR4F1xUSjzh+Guzq53ory3XJUYqqgkU5cBr7/B9HTGtNiGANSfQ2qgdwaB1Q==
X-Received: by 2002:a17:907:7f09:b0:6f4:9f76:d10a with SMTP id
 qf9-20020a1709077f0900b006f49f76d10amr9971400ejc.248.1651729595926; 
 Wed, 04 May 2022 22:46:35 -0700 (PDT)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id
 eb7-20020a170907280700b006f3ef214e4esm326062ejc.180.2022.05.04.22.46.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 22:46:35 -0700 (PDT)
Message-ID: <318c0814-7f0b-9798-6998-5039094b010d@gmail.com>
Date: Thu, 5 May 2022 07:46:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH V2] nvmem: add driver handling U-Boot environment variables
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tom Rini <trini@konsulko.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 u-boot@lists.denx.de, devicetree@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20220503165658.13932-1-zajec5@gmail.com>
 <79c7891a-9a68-a111-094d-be9804071a9e@pengutronix.de>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <79c7891a-9a68-a111-094d-be9804071a9e@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_224638_637160_B27AACA7 
X-CRM114-Status: GOOD (  17.97  )
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

T24gNC4wNS4yMDIyIDExOjIzLCBBaG1hZCBGYXRvdW0gd3JvdGU6Cj4gSGVsbG8gUmFmYcWCLAo+
IAo+IE9uIDAzLjA1LjIyIDE4OjU2LCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6Cj4+IEZyb206IFJh
ZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPj4KPj4gVS1Cb290IHN0b3JlcyBpdHMg
c2V0dXAgYXMgZW52aXJvbm1lbnQgdmFyaWFibGVzLiBJdCdzIGEgbGlzdCBvZgo+PiBrZXktdmFs
dWUgcGFpcnMgc3RvcmVkIG9uIGZsYXNoIGRldmljZSB3aXRoIGEgY3VzdG9tIGhlYWRlci4KPj4K
Pj4gVGhpcyBjb21taXQgYWRkcyBhbiBOVk1FTSBkcml2ZXIgdGhhdDoKPj4gMS4gUHJvdmlkZXMg
TlZNRU0gYWNjZXNzIHRvIGVudmlyb25tZW50IHZhcnMgYmluYXJ5IGRhdGEKPj4gMi4gRXh0cmFj
dHMgdmFyaWFibGVzIGFzIE5WTUVNIGNlbGxzCj4+Cj4+IEl0IGNhbiBiZSB1c2VkIGZvcjoKPj4g
MS4gQWNjZXNzaW5nIGVudiB2YXJpYWJsZXMgZnJvbSB1c2VyLXNwYWNlCj4gCj4gSXMgdGhpcyBh
bHJlYWR5IHBvc3NpYmxlPyBUaGUgb25seSBpbnRlcmZhY2UgSSBrbm93IG9mIGlzIHRoZSAvbnZt
ZW0KPiBmaWxlIGluIHN5c2ZzLCBidXQgdGhhdCBvbmUgaXMgbm90IHBlciBjZWxsLCBidXQgcGVy
IGRldmljZS4KCk1heWJlIHRoYXQgd2Fzbid0IHByZWNpc2UgZW5vdWdoLCBJIHNob3VsZCBwcm9i
YWJseSB3cml0ZToKMS4gUGFyc2luZyBiaW5hcnkgZGF0YSBmcm9tIHVzZXItc3BhY2UKCkluIGZ1
dHVyZSBJJ2QgbGlrZSB0byBleHRlbmQgVS1Cb290J3MgInByaW50ZW52IiB0b29sIHRvIHN1cHBv
cnQgcmVhZGluZwplbnYgdmFyaWFibGVzIGJsb2IgdXNpbmcgTGludXgncyBzeXNmcyBhcyBkb2N1
bWVudGVkIGluIHRoZQpEb2N1bWVudGF0aW9uL0FCSS9zdGFibGUvc3lzZnMtYnVzLW52bWVtCgoK
Pj4gKwlsYWJlbCA9IG9mX2dldF9wcm9wZXJ0eShucC0+cGFyZW50LCAibGFiZWwiLCBOVUxMKTsK
Pj4gKwlpZiAoIWxhYmVsKQo+PiArCQlsYWJlbCA9IG5wLT5wYXJlbnQtPm5hbWU7Cj4+ICsKPj4g
Kwlwcml2LT5tdGQgPSBnZXRfbXRkX2RldmljZV9ubShsYWJlbCk7Cj4+ICsJaWYgKElTX0VSUihw
cml2LT5tdGQpKSB7Cj4+ICsJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGZpbmQgXCIlc1wiIE1U
RCBkZXZpY2U6ICVsZFxuIiwgbGFiZWwsIFBUUl9FUlIocHJpdi0+bXRkKSk7Cj4+ICsJCXJldHVy
biBQVFJfRVJSKHByaXYtPm10ZCk7Cj4+ICsJfQo+IAo+IEkgYW0gdHJ5aW5nIHRvIG1ha2Ugc2Vu
c2Ugb2YgdGhpcyB1c2luZyB0aGUgYmluZGluZywgYnV0IEkgY2FuJ3QuCj4gRG8geW91IGhhdmUg
YW4gZXhhbXBsZSBkZXZpY2UgdHJlZSBmcmFnbWVudD8KClRoaXMgY29tZXMgZnJvbSB1bnJlbGVh
c2VkIHlldCBib2FyZCBJJ20gd29ya2luZyBvbi4KCkl0IHN0b3JlcyBVLUJvb3QgZW52IHZhcmlh
YmxlcyBpbiB0aGUgbWlkZGxlIG9mIFUtQm9vdCBiaW5hcnkuCgpwYXJ0aXRpb25zIHsKCWNvbXBh
dGlibGUgPSAiZml4ZWQtcGFydGl0aW9ucyI7CgkjYWRkcmVzcy1jZWxscyA9IDwxPjsKCSNzaXpl
LWNlbGxzID0gPDE+OwoKCXBhcnRpdGlvbkAwIHsKCQlsYWJlbCA9ICJsb2FkZXIiOwoJCXJlZyA9
IDwweDAgMHgxMDAwMDA+OwoKCQlwYXJ0aXRpb25ANDAwMDAgewoJCQljb21wYXRpYmxlID0gInUt
Ym9vdCxlbnYiOwoJCQlsYWJlbCA9ICJ1LWJvb3QtZW52IjsKCQkJcmVnID0gPDB4NDAwMDAgMHg0
MDAwPjsKCQl9OwoJfTsKCglwYXJ0aXRpb25AMTAwMDAwIHsKCQlsYWJlbCA9ICJpbWFnZSI7CgkJ
cmVnID0gPDB4MTAwMDAwIDB4MWZlMDAwMDA+OwoJfTsKfTsKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
