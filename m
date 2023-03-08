Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC75C678D5
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Mar 2023 13:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZtJ8DQzM+V10CUp5EGJyyAVPN8j5DTmXsX35HA/YXwM=; b=ChS2YX/PTBby+i
	ue6J+9jlJJK9BlZ97rUxyZHcELVX9qMDFSoSslyDgM/WZuKWUt7/6V1V1xwiYD8s0H5Na91c6AmQH
	zBPL+PPZVyZFBo359qxW9qeovutjiTtbJyPFD86fTeBeDnotoQUBUQIclhTMH7i5VRuz1qQZibdg7
	ZuT8eDcpDilXyzNw17wglfFG+X7jVNQgZRFUGA5HHslR2ktEuqWHMN5TPX9YHdLwT3jmmtuQA3QLP
	E47bF5+iYQb9NzW43HQ1RrM3aYcqQ/tiL/JICgb9uYe7qB+P73rk+Cp41x7C1I9/caIT/LS+cHGXz
	E0wQRODyYN9JYfMyIrBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZuFt-005Jmt-4k; Wed, 08 Mar 2023 13:54:57 +0000
Received: from relay10.mail.gandi.net ([2001:4b98:dc4:8::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZuFq-005Jjt-3C
	for linux-mtd@lists.infradead.org; Wed, 08 Mar 2023 13:54:55 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8236B240009;
	Wed,  8 Mar 2023 13:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678283683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WQFZeuk6uWmUrpQ/KvdXB4TDmIFd/TCGdx6rXRYWHXw=;
	b=oLZ2yFHdam3ZhLNudLxoVog5fY6enqmgoigu/iJ/hfyj9Zgj3HjGhJ7JhrlNYShZDnPupw
	OCtZjQbcBgi8euF1vNPDdLcvo7j2MVwN0rnoQlBDv3t04ksiDoTVM1ukcV2ynQjEMUcVGZ
	Vg+Gd7N/xHOMvQZFl4aQukQSMEpCW4kmnGdBy71rZEfo2hlZ9RE81bvy6GC5Lv+BX4G9ij
	r/WBMmBclhgmBom/Bp0leWaKrxrkZcEi3LB8417aXwZ3sr87zypPmvy0KUq/T5imJPwpdx
	fFZYdMs+MIXhX3LeuHsXsoNaQJOifC8sM9kbdEgxAQKccti8Ed5TE7xdXZoE9A==
Date: Wed, 8 Mar 2023 14:54:41 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: Avoid printing error messages on probe
 deferrals
Message-ID: <20230308145441.2dc96ddb@xps-13>
In-Reply-To: <5ff078a1f994c87621cc9ea9335ff6b6@walle.cc>
References: <20230307192506.439532-1-miquel.raynal@bootlin.com>
	<5ff078a1f994c87621cc9ea9335ff6b6@walle.cc>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_055454_310087_C4AE6022 
X-CRM114-Status: GOOD (  20.71  )
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

SGkgTWljaGFlbCwKCm1pY2hhZWxAd2FsbGUuY2Mgd3JvdGUgb24gVHVlLCAwNyBNYXIgMjAyMyAy
MTozNTowNSArMDEwMDoKCj4gQW0gMjAyMy0wMy0wNyAyMDoyNSwgc2NocmllYiBNaXF1ZWwgUmF5
bmFsOgo+ID4gVGhlcmUgaXMgbm8gcmVhc29uIHRvIGNvbXBsYWluIGFib3V0IHByb2JlIGVycm9y
cyBpbiBjYXNlIG9mIGRlZmVycmFscy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiA+IC0tLQo+ID4gQ2hhbmdlcyBpbiB2
MjoKPiA+ICogVXNlIG9mIGRldl9lcnJfcHJvYmUoKS4KPiA+IAo+ID4gIGRyaXZlcnMvbXRkL210
ZGNvcmUuYyB8IDkgKysrKy0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNv
cmUuYyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+ID4gaW5kZXggMGZlYWNiOWZiZGFjLi5lNGUx
MDI1ODUwMjEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPiA+ICsrKyBi
L2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+ID4gQEAgLTUzNiwxMiArNTM2LDExIEBAIHN0YXRpYyBp
bnQgbXRkX252bWVtX2FkZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKPiA+ICAJbXRkLT5udm1lbSA9
IG52bWVtX3JlZ2lzdGVyKCZjb25maWcpOwo+ID4gIAlpZiAoSVNfRVJSKG10ZC0+bnZtZW0pKSB7
Cj4gPiAgCQkvKiBKdXN0IGlnbm9yZSBpZiB0aGVyZSBpcyBubyBOVk1FTSBzdXBwb3J0IGluIHRo
ZSBrZXJuZWwgKi8KPiA+IC0JCWlmIChQVFJfRVJSKG10ZC0+bnZtZW0pID09IC1FT1BOT1RTVVBQ
KSB7Cj4gPiArCQlpZiAoUFRSX0VSUihtdGQtPm52bWVtKSA9PSAtRU9QTk9UU1VQUCkKPiA+ICAJ
CQltdGQtPm52bWVtID0gTlVMTDsKPiA+IC0JCX0gZWxzZSB7Cj4gPiAtCQkJZGV2X2VycigmbXRk
LT5kZXYsICJGYWlsZWQgdG8gcmVnaXN0ZXIgTlZNRU0gZGV2aWNlXG4iKTsKPiA+IC0JCQlyZXR1
cm4gUFRSX0VSUihtdGQtPm52bWVtKTsKPiA+IC0JCX0KPiA+ICsJCWVsc2UKPiA+ICsJCQlyZXR1
cm4gZGV2X2Vycl9wcm9iZSgmbXRkLT5kZXYsCVBUUl9FUlIobXRkLT5udm1lbSksICAKPiAKPiBU
aGVyZSBpcyBhICdcdCcgYWZ0ZXIgdGhlICIsIi4KCk1tbWgsIGRpZG4ndCBub3RpY2UsIHdpbGwg
Zml4IGl0IHdoaWxlIGFwcGx5aW5nLgoKPiAKPiBXaXRoIHRoYXQgZml4ZWQsCj4gUmV2aWV3ZWQt
Ynk6IE1pY2hhZWwgV2FsbGUgPG1pY2hhZWxAd2FsbGUuY2M+Cj4gCj4gLW1pY2hhZWwKCgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
