Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F44C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  4 May 2022 09:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IGmG8BuklVS6YAou2qquZSIKifnuqPXlON0IX0w9toA=; b=hA2BpRjVSz4qpl
	muWbijL42o1OAPJLNAI5ppTeaJuGtSUQ5TGSYX0iIwG7Zn6BOdBTudl1cPsRIhWJa3sXQUGGtMkmo
	gX7FrJ5U1ksjtr3GM0HPinfIH3uzSFl2iIgZ/kQwZkOEgWSgfMRyKiWxQDd/1FR+/8rIhcOSOYbPH
	7HWU5vw5ie4tgGwM1BMjY0tG5jTX7nJHTUIlHGs2VBHk9pu6sGpeksalAdAdOLT6C+qzmEay3UHif
	TecHdou08BgwkBEwAQZzVthObD95FnBfLvzpQ50XhDaV7ALM55XJ+x+4NLoRLuWT+jCyYKIKRoh3Y
	uSOgZWl1JBbPDeZ5HqrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmBMC-009szL-Fu; Wed, 04 May 2022 09:31:41 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmBE1-009oPv-FK
 for linux-mtd@lists.infradead.org; Wed, 04 May 2022 09:23:14 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1]) by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1nmBDx-0006Us-V7; Wed, 04 May 2022 11:23:10 +0200
Message-ID: <79c7891a-9a68-a111-094d-be9804071a9e@pengutronix.de>
Date: Wed, 4 May 2022 11:23:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH V2] nvmem: add driver handling U-Boot environment variables
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tom Rini <trini@konsulko.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 u-boot@lists.denx.de, devicetree@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20220503165658.13932-1-zajec5@gmail.com>
Content-Language: en-US
In-Reply-To: <20220503165658.13932-1-zajec5@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_022313_549179_631A03E8 
X-CRM114-Status: GOOD (  18.74  )
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

SGVsbG8gUmFmYcWCLAoKT24gMDMuMDUuMjIgMTg6NTYsIFJhZmHFgiBNacWCZWNraSB3cm90ZToK
PiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gCj4gVS1Cb290IHN0
b3JlcyBpdHMgc2V0dXAgYXMgZW52aXJvbm1lbnQgdmFyaWFibGVzLiBJdCdzIGEgbGlzdCBvZgo+
IGtleS12YWx1ZSBwYWlycyBzdG9yZWQgb24gZmxhc2ggZGV2aWNlIHdpdGggYSBjdXN0b20gaGVh
ZGVyLgo+IAo+IFRoaXMgY29tbWl0IGFkZHMgYW4gTlZNRU0gZHJpdmVyIHRoYXQ6Cj4gMS4gUHJv
dmlkZXMgTlZNRU0gYWNjZXNzIHRvIGVudmlyb25tZW50IHZhcnMgYmluYXJ5IGRhdGEKPiAyLiBF
eHRyYWN0cyB2YXJpYWJsZXMgYXMgTlZNRU0gY2VsbHMKPiAKPiBJdCBjYW4gYmUgdXNlZCBmb3I6
Cj4gMS4gQWNjZXNzaW5nIGVudiB2YXJpYWJsZXMgZnJvbSB1c2VyLXNwYWNlCgpJcyB0aGlzIGFs
cmVhZHkgcG9zc2libGU/IFRoZSBvbmx5IGludGVyZmFjZSBJIGtub3cgb2YgaXMgdGhlIC9udm1l
bQpmaWxlIGluIHN5c2ZzLCBidXQgdGhhdCBvbmUgaXMgbm90IHBlciBjZWxsLCBidXQgcGVyIGRl
dmljZS4KCj4gKwlsYWJlbCA9IG9mX2dldF9wcm9wZXJ0eShucC0+cGFyZW50LCAibGFiZWwiLCBO
VUxMKTsKPiArCWlmICghbGFiZWwpCj4gKwkJbGFiZWwgPSBucC0+cGFyZW50LT5uYW1lOwo+ICsK
PiArCXByaXYtPm10ZCA9IGdldF9tdGRfZGV2aWNlX25tKGxhYmVsKTsKPiArCWlmIChJU19FUlIo
cHJpdi0+bXRkKSkgewo+ICsJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGZpbmQgXCIlc1wiIE1U
RCBkZXZpY2U6ICVsZFxuIiwgbGFiZWwsIFBUUl9FUlIocHJpdi0+bXRkKSk7Cj4gKwkJcmV0dXJu
IFBUUl9FUlIocHJpdi0+bXRkKTsKPiArCX0KCkkgYW0gdHJ5aW5nIHRvIG1ha2Ugc2Vuc2Ugb2Yg
dGhpcyB1c2luZyB0aGUgYmluZGluZywgYnV0IEkgY2FuJ3QuCkRvIHlvdSBoYXZlIGFuIGV4YW1w
bGUgZGV2aWNlIHRyZWUgZnJhZ21lbnQ/CgpDaGVlcnMsCkFobWFkCgotLSAKUGVuZ3V0cm9uaXgg
ZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwKU3RldWVyd2FsZGVyIFN0ci4gMjEgICAgICAgICAgICAgICAgICAgICAgIHwgaHR0cDov
L3d3dy5wZW5ndXRyb25peC5kZS8gIHwKMzExMzcgSGlsZGVzaGVpbSwgR2VybWFueSAgICAgICAg
ICAgICAgICAgIHwgUGhvbmU6ICs0OS01MTIxLTIwNjkxNy0wICAgIHwKQW10c2dlcmljaHQgSGls
ZGVzaGVpbSwgSFJBIDI2ODYgICAgICAgICAgIHwgRmF4OiAgICs0OS01MTIxLTIwNjkxNy01NTU1
IHwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
