Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550C8C43334
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jun 2022 09:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ufvqFi1JN7IC6RtoN7bMa+iLxRok+/R+wtULmoyJFI=; b=X9NoZ1+oG2q2sA
	Ng3AXmYU1Y0hzoQA7HcYeWWG0vSUKduLy78m0Qi4E/qJFoaJhyElxAL+g8dQ3Klw1VcPXZwgZF21K
	3LpG2bIgbnShq6isiNx04FpVhfk1+1qaKJqQCJJzq/Iek3/RUd5dIoamEHiOL1tGaZy8q63xl9VMe
	/Kx5RalSNx0oKjdcg4nk5oOENI+ifdCHIxi7cIA4LHTtQ3prT9M8XpupYnJpAzV9rOlJuka1IyMha
	7/6xAt2AeQo1XtiayOMf6ErScgv9rxnzrXTce0zN8aks6K0tsAFoHSLm/dtku5G73hjowX04qhGWs
	e+6s+C8F81kxIKlj4Lew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o12gx-008e6S-DP; Tue, 14 Jun 2022 09:18:31 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o12Rb-008VmV-FC; Tue, 14 Jun 2022 09:02:42 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C03BCE001B;
	Tue, 14 Jun 2022 09:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655197355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0VkpGiXPoXaWOWQvypa0vCIM+uO/ijHmOl4KXjKbX0k=;
	b=ZYsOgvJ4SheAj9johdMIEhkWhCZFkH3Rp+m6pvTevjhTrUmiZ/5WPeF0H+1A91/xUTGqIl
	06rgGRGplqFKBI9bxayGayLsIE4YQ8468mhQ6tDsD94gcKo2kppaa8wqQH8hqgK96AGfAi
	72esq1VG+/pvs2iYl2IsqWmTeh9UDHAPLO7ItL7Rr6BuyNeIq8D2wsbxCQldaHDkUzbVdU
	TMtI2jTGzKy8vmG7FVh+ONC3wMto4Qi0dcIHP7NKfuGgwoRMWIyaqAZ0Ee+rrV2ltoSUmB
	sIL3iI7WgyJ81OI/RWvsKU00LdLmV19EHAq3R01/xFLk1gmxcXMU5UdMsd9Phg==
Date: Tue, 14 Jun 2022 11:02:30 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <sha@pengutronix.de>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tom Rini <trini@konsulko.com>, Ahmad
 Fatoum <a.fatoum@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 u-boot@lists.denx.de, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V3 2/2] nvmem: add driver handling U-Boot environment
 variables
Message-ID: <20220614110230.46fab506@xps-13>
In-Reply-To: <20220614074657.GQ2387@pengutronix.de>
References: <20220611204651.19947-1-zajec5@gmail.com>
	<20220611204651.19947-2-zajec5@gmail.com>
	<20220614074657.GQ2387@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_020239_688039_BC0B7D6B 
X-CRM114-Status: GOOD (  13.48  )
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

SGVsbG8sCgo+ID4gK3N0YXRpYyBpbnQgdV9ib290X2Vudl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQo+ID4gK3sKPiA+ICsJc3RydWN0IG52bWVtX2NvbmZpZyBjb25maWcgPSB7
Cj4gPiArCQkubmFtZSA9ICJ1LWJvb3QtZW52IiwKPiA+ICsJCS5yZWdfcmVhZCA9IHVfYm9vdF9l
bnZfcmVhZCwKPiA+ICsJfTsKPiA+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsK
PiA+ICsJc3RydWN0IGRldmljZV9ub2RlICpucCA9IGRldi0+b2Zfbm9kZTsKPiA+ICsJY29uc3Qg
c3RydWN0IG9mX2RldmljZV9pZCAqb2ZfaWQ7Cj4gPiArCXN0cnVjdCB1X2Jvb3RfZW52ICpwcml2
Owo+ID4gKwlpbnQgZXJyOwo+ID4gKwo+ID4gKwlwcml2ID0gZGV2bV9remFsbG9jKGRldiwgc2l6
ZW9mKCpwcml2KSwgR0ZQX0tFUk5FTCk7Cj4gPiArCWlmICghcHJpdikKPiA+ICsJCXJldHVybiAt
RU5PTUVNOwo+ID4gKwlwcml2LT5kZXYgPSBkZXY7Cj4gPiArCj4gPiArCW9mX2lkID0gb2ZfbWF0
Y2hfZGV2aWNlKHVfYm9vdF9lbnZfb2ZfbWF0Y2hfdGFibGUsIGRldik7Cj4gPiArCWlmICghb2Zf
aWQpCj4gPiArCQlyZXR1cm4gLUVJTlZBTDsKPiA+ICsJcHJpdi0+Zm9ybWF0ID0gKHVpbnRwdHJf
dClvZl9pZC0+ZGF0YTsKPiA+ICsKPiA+ICsJaWYgKG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5wLCAi
cmVnIiwgKHUzMiAqKSZwcml2LT5vZmZzZXQpIHx8Cj4gPiArCSAgICBvZl9wcm9wZXJ0eV9yZWFk
X3UzMl9pbmRleChucCwgInJlZyIsIDEsICh1MzIgKikmcHJpdi0+c2l6ZSkpIHsKPiA+ICsJCWRl
dl9lcnIoZGV2LCAiRmFpbGVkIHRvIHJlYWQgXCJyZWdcIiBwcm9wZXJ0eVxuIik7Cj4gPiArCQly
ZXR1cm4gLUVJTlZBTDsKPiA+ICsJfQo+ID4gKwo+ID4gKwlwcml2LT5tdGQgPSBvZl9nZXRfbXRk
X2RldmljZV9ieV9ub2RlKG5wLT5wYXJlbnQpOwo+ID4gKwlpZiAoSVNfRVJSKHByaXYtPm10ZCkp
IHsKPiA+ICsJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdldCAlcE9GIE1URDogJWxkXG4iLCBu
cC0+cGFyZW50LCBQVFJfRVJSKHByaXYtPm10ZCkpOwo+ID4gKwkJcmV0dXJuIFBUUl9FUlIocHJp
di0+bXRkKTsKPiA+ICsJfSAgCj4gCj4gUGFydGl0aW9ucyBhcmUgbXRkIGRldmljZXMgdGhlbXNl
bHZlcyBhbmQgdGhlIG10ZCBsYXllciBkaXJlY3RseQo+IGFzc29jaWF0ZXMgdGhlc2UgZGV2aWNl
cyB0byB0aGVpciBPRiBub2RlLCBzbyBpdCBzaG91bGQgYmUgcG9zc2libGUKPiB0byBkbyBhIG9m
X2dldF9tdGRfZGV2aWNlX2J5X25vZGUobnApIHdoaWNoIGdldHMgeW91IHRoZSBwYXJ0aXRpb24u
Cj4gWW91IGNhbiB1c2UgdGhlIHdob2xlIG10ZCBkZXZpY2UgdGhlbiBhbmQgZG8gbm90IGhhdmUg
dG8gZmlkZGxlIHdpdGgKPiByZWcgcHJvcGVydGllcywgb2Zmc2V0cyBhbmQgc2l6ZXMgaW4geW91
ciBkcml2ZXIgeW91cnNlbGYuCgpKdXN0IGZvciB0aGUgcmVjb3JkLCB0aGVyZSB3aWxsIGJlIG9u
ZSBtdGQgZGV2aWNlIHBlciBwYXJ0aXRpb24sIGJ1dAp0aGUgImZ1bGwiIG10ZCBkZXZpY2Ugd2ls
bCBvbmx5IGV4aXN0IGlmIHRoZSBjb25maWd1cmF0aW9uIGNvbnRhaW5zCkNPTkZJR19NVERfUEFS
VElUSU9ORURfTUFTVEVSLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
