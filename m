Return-Path: <SRS0=HfhP=G3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E18C433DB
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jan 2021 20:07:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FABF216FD
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jan 2021 20:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FABF216FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+Ks5zLzBJJtOpve5WanlPe3P6UG30l7q/SsbtUqzYS4=; b=iucPvHkAEV1+d7FmcE31Wd316
	602syTg2RBLPcO/oBsfjU5HJ4kCnGk3xjZZEfFBybTgBsriYFvcAGbINw4QaaqWs4nrgxLq00HbvT
	A/nBIgFL8YVnODtN8q8sGXhAcwLowxzlIH432y0aBMlZkqufGm8dG0o/IBquW8589k2LH3F39OUyi
	2k7gDjRPFdpW1RxAGqw2tA+xPPoddK1hoRrTkykepajI2+RWT6I00zl/B3Uug5SlbVRb4XzgO/blP
	EaewzYf4aI9oGErb+xbB++V+AHY9LJRTiSmPs7DcJcfB/2MRRUtLwx+ylNo+pCgyhPeZYV/4tjikJ
	wA5SFbuFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3ldo-0002RG-Bc; Sun, 24 Jan 2021 20:05:44 +0000
Received: from mout.web.de ([212.227.17.12])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3ldf-0002QT-Dl
 for linux-mtd@lists.infradead.org; Sun, 24 Jan 2021 20:05:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1611518707;
 bh=CnpPr2Di2X8boUoC0fZ83a9z1iYmnpqIYKwkkP1r9rc=;
 h=X-UI-Sender-Class:To:Cc:References:From:Subject:Date:In-Reply-To;
 b=IJBVHSGtadjDPOfV+wIqnImmA+ODteuCohY4iRSarGT4woSgDqNeneXIm5+fDwPT9
 9pOVT9HS/7DmSzhAcWUyZfQHCJIN0WOL2/zIfrUuNI5rXIwXKKMUEA/GD9ive4kYfo
 tafUcFlzR+WAaoYJczsi0vghuUahQaAold5VHlQA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.175.89]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M0QYD-1lqnPz47WH-00ucmW; Sun, 24
 Jan 2021 21:05:07 +0100
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 linux-mtd@lists.infradead.org
References: <20210124073955.728797-1-christophe.jaillet@wanadoo.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] mtd: rawnand: Fix an error handling path in
 'ebu_dma_start()'
Message-ID: <fe72d1d2-8222-5cda-74ff-9327725f196a@web.de>
Date: Sun, 24 Jan 2021 21:05:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210124073955.728797-1-christophe.jaillet@wanadoo.fr>
Content-Language: en-GB
X-Provags-ID: V03:K1:qacjJxa93kz3hLy+5GZvaKbn8QFd7RSI5k/Zavs64AWNUUCZk1+
 xp/PJ+rEdte519XVoeKneSeckJ9FftxLYpsvUogDZN+0/NZp8ABqmPrq41dtUmWAwUjUUZ6
 uII9wJ2RBnM7stzzCV9+dNbFg19mrM9B9hiWfP/cHB4Q18X6O4VJTfCaCWFiDxfvHsLP8yG
 o5vaxQTqS8xn60i/ifQVg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eTVDx/EbdWA=:Dous+l2niSHpukTWdjm3JP
 DwKI5XBw2FlT/jN3lI5KJ9a37GLRKGW3moZQDC2ZLdAUgKeB2Yo4VZRZ1L9Hi+2VEY5l48zzk
 jjGkN9oSyQ/wYAQHHGPP1H0qvmGeHRBkk7DS5zxYEOcEL69dcTD6Tgtf36TyHt72OuWyoVemy
 Fsr5WGR+mBgvRUpgTlKnXjhifzvmJWd/V94sn81omKBQk2jwf0f2rtAAB+O1LguVVPwZ+Ols2
 +01c9gTWCi2no/Zh8MOvlzFyudq3Mnna39nNghjqqTYjFGPAEt4gd1STAvKiu5tkfR6WF7x9U
 wn666aBwLKfaUnthzD6q+dtHpAnX/iYiN7PtoMqDMM2QrWZs7+Ro/8Fov5rv4BTiYPHdhRqie
 M5yAoC2uWK9bcZmZ4apYVpZ0YpOKBa95H9O+/3Mj1hniTZRRMU9U9U1w0m1e6lTNoMYF5Z96I
 rgweiiIKs0wh05M2o5syyLEh3LjepXDbeha+NNlGzBi7yfuaWpKspkgX4i9j0NeNF9UFVYtaK
 3jKarKFjkp02WKkXlU54BjgVkJ2kbaWrCHFHOQ3EmOjgrztpjCSen3yA8daG7FMGer1UO+wZG
 oDQ++szqCHKsRRQ7Z7qFIWMO7IWVZs80Dlbp+RT+n/LF0T1sRrNTwIrk6eBC/+aYBY5KX0q2Z
 FGsEKbi2yeNZNzbYD8E4oihPSBaSsHxTeh2LeRoM4QGdnbhkgaNDFn7t7bK2zvwSSSRi9YkOn
 xIAb9LX7DIKW4d9NzD54I5iFZrGHN18Xd0vXGfCc1VxK0nwSbM6D7z2d43ZJLUAyrWE2X4oJS
 Z9X6tqCrzsI5tITuVjO7f3n9MzybI3QPu0rOZ4cYnILFtGwpZb6TB/4mo/DFLbOHRet2/IZMb
 aZyxN3xh4tzEaGBu7T/A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210124_150535_766919_151D959F 
X-CRM114-Status: GOOD (  13.46  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

PiBJZiAnZG1hZW5naW5lX3ByZXBfc2xhdmVfc2luZ2xlKCknIGZhaWxzLCB3ZSBtdXN0IHVuZG8g
YSBwcmV2aW91cwo+ICdkbWFfbWFwX3NpbmdsZSgpJyBjYWxsLCBhcyBhbHJlYWR5IGRvbmUgaW4g
YWxsIHRoZSBvdGhlciBlcnJvciBoYW5kbGluZwo+IHBhdGhzIG9mIHRoaXMgZnVuY3Rpb24uCgpX
b3VsZCB5b3UgZXZlciBsaWtlIHRvIHVzZSBhbiBpbXBlcmF0aXZlIHdvcmRpbmcgZm9yIHRoZSBj
aGFuZ2UgZGVzY3JpcHRpb24/Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9z
dWJtaXR0aW5nLXBhdGNoZXMucnN0P2lkPWZkYmM4MGJkYzQzNjUwNzhhMGY3ZDY1NjMxMTcxY2I4
MGUzZmZkNmUjbjg5CgoK4oCmCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW50ZWwtbmFu
ZC1jb250cm9sbGVyLmMKPiBAQCAtMzE4LDggKzMxOCwxMCBAQCBzdGF0aWMgaW50IGVidV9kbWFf
c3RhcnQoc3RydWN0IGVidV9uYW5kX2NvbnRyb2xsZXIgKmVidV9ob3N0LCB1MzIgZGlyLAo+ICAJ
fQo+Cj4gIAl0eCA9IGRtYWVuZ2luZV9wcmVwX3NsYXZlX3NpbmdsZShjaGFuLCBidWZfZG1hLCBs
ZW4sIGRpciwgZmxhZ3MpOwo+IC0JaWYgKCF0eCkKPiAtCQlyZXR1cm4gLUVOWElPOwo+ICsJaWYg
KCF0eCkgewo+ICsJCXJldCA9IC1FTlhJTzsKPiArCQlnb3RvIGVycl91bm1hcDsKPiArCX0KPgo+
ICAJdHgtPmNhbGxiYWNrID0gY2FsbGJhY2s7CuKApgoKQnkgdGhlIHdheToKQ2FuIGl0IGJlIG5p
Y2VyIHRvIGFjaGlldmUgdGhlIHN0YXRlbWVudCDigJxyZXQgPSAtRUlPO+KAnSBieSBhIGp1bXAg
Zm9yCmEgdGFyZ2V0IGxpa2Ug4oCcZV9pb+KAnSBzbyB0aGF0IGxlc3MgZXhjZXB0aW9uIGhhbmRs
aW5nIGNvZGUgd291bGQgYmUgZHVwbGljYXRlZApmb3IgdGhpcyBmdW5jdGlvbiBpbXBsZW1lbnRh
dGlvbj8KClJlZ2FyZHMsCk1hcmt1cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
