Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77113C3DA4A
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Aug 2024 12:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2rlpwJ8ivogALRnTISt/2pQmsCMhLY36ZXsuQnKEYE=; b=XfS8ziLSivpUIfW0eKqZAj8Ob1
	FK59nqzmzCPVAnzQ21JlbuiHiqlT/j0AXV/Mxvg9ZKCsLvZfIx6kOvTPDcwAl/go/lOMrsk/9ACX/
	LUeGmmvPxVlvqHc1K242KyYEgRm0JaROC0RV6Jy8Eu921G4rvZFLWbGcsBIdgC04XT3snXMSET/Zf
	NdgBKusmm8nX6rQxYE16vzFk384hq2PRrEDNVqQ/jMmcwAvZZ/DX5QIrdy6+2n3t0HUFe7+45XbRW
	o7/on2KQRrlX5mEAV1xq9FeLqWARog5d7B/SOw4NE8yvzZ5fEEaySUqLGv3UIdoFSr7AVNi4aq+AZ
	dhGVHpjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sewPk-0000000Cw9U-28La;
	Fri, 16 Aug 2024 12:50:44 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sewP3-0000000Cvy7-3MVV
	for linux-mtd@lists.infradead.org;
	Fri, 16 Aug 2024 12:50:04 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WlhXV66Mpz1j6QS
	for <linux-mtd@lists.infradead.org>; Fri, 16 Aug 2024 20:44:58 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 597CB1A0188
	for <linux-mtd@lists.infradead.org>; Fri, 16 Aug 2024 20:49:53 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 20:49:52 +0800
Subject: Re: [PATCH 2/2] fs-tests: integck: Refactor: split out common remount
 logic
To: =?UTF-8?B?Q3PDs2vDoXMsIEJlbmNl?= <csokas.bence@prolan.hu>,
	<linux-mtd@lists.infradead.org>
References: <20240815091225.3237097-1-csokas.bence@prolan.hu>
 <20240815091225.3237097-2-csokas.bence@prolan.hu>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <e3892b59-2bc7-5506-41de-ba9dddc26ca4@huawei.com>
Date: Fri, 16 Aug 2024 20:49:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240815091225.3237097-2-csokas.bence@prolan.hu>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_055002_278047_820069B6 
X-CRM114-Status: GOOD (  17.80  )
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

5ZyoIDIwMjQvOC8xNSAxNzoxMiwgQ3PDs2vDoXMsIEJlbmNlIOWGmemBkzoKPiByZW1vdW50X3Rl
c3RlZF9mcygpIGFuZCByZWNvdmVyX3Rlc3RlZF9mcygpIGJvdGggaGF2ZQo+IGFsbW9zdCB0aGUg
c2FtZSBjb2RlIGZvciByZW1vdW50aW5nIHRoZSB0YXJnZXQgRlMKPiBSTyB0aGVuIFJXLiBTcGxp
dCB0aGlzIHNlcXVlbmNlIGludG8gYSBuZXcKPiBmdW5jdGlvbiBjYWxsZWQgcmVtb3VudF9yb19y
dygpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENzw7Nrw6FzLCBCZW5jZSA8Y3Nva2FzLmJlbmNlQHBy
b2xhbi5odT4KPiAtLS0KPiAgIHRlc3RzL2ZzLXRlc3RzL2ludGVncml0eS9pbnRlZ2NrLmMgfCA4
NSArKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzNSBp
bnNlcnRpb25zKCspLCA1MCBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcg
PGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9mcy10ZXN0
cy9pbnRlZ3JpdHkvaW50ZWdjay5jIGIvdGVzdHMvZnMtdGVzdHMvaW50ZWdyaXR5L2ludGVnY2su
Ywo+IGluZGV4IDZjZThjOWQuLmVkZDA5YzAgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvZnMtdGVzdHMv
aW50ZWdyaXR5L2ludGVnY2suYwo+ICsrKyBiL3Rlc3RzL2ZzLXRlc3RzL2ludGVncml0eS9pbnRl
Z2NrLmMKPiBAQCAtMjY2OCw2ICsyNjY4LDM1IEBAIHN0YXRpYyBpbnQgdW1vdW50X2FuZF9yZW1v
dW50KGludCBtb3VudGVkLCBpbnQgcmVhdHQsIGludCB1bV9yb3J3KQo+ICAgCXJldHVybiAwOwo+
ICAgfQo+ICAgCj4gKy8qKgo+ICsgKiBSZW1vdW50IHRoZSB0ZXN0IGZpbGUtc3lzdGVtIFJPIGZp
cnN0LCB0aGVuIFJXLgo+ICsgKi8KPiArc3RhdGljIGludCByZW1vdW50X3JvX3J3KGNvbnN0IGNo
YXIgKnRyaWVzKQo+ICt7Cj4gKwlpbnQgcmV0Owo+ICsJdW5zaWduZWQgbG9uZyBmbGFnczsKPiAr
Cj4gKwlmbGFncyA9IGZzaW5mby5tb3VudF9mbGFncyB8IE1TX1JET05MWSB8IE1TX1JFTU9VTlQ7
Cj4gKwlyZXQgPSBtb3VudChmc2luZm8uZnNkZXYsIGZzaW5mby5tb3VudF9wb2ludCwgZnNpbmZv
LmZzdHlwZSwKPiArCQkgICAgZmxhZ3MsIGZzaW5mby5tb3VudF9vcHRzKTsKPiArCWlmIChyZXQp
IHsKPiArCQlwY3YoImNhbm5vdCByZW1vdW50ICVzIFIvTyVzIiwgdHJpZXMsIGZzaW5mby5tb3Vu
dF9wb2ludCk7Cj4gKwkJcmV0dXJuIC0xOwo+ICsJfQo+ICsKPiArCWZsYWdzID0gZnNpbmZvLm1v
dW50X2ZsYWdzIHwgTVNfUkVNT1VOVDsKPiArCWZsYWdzICY9IH4oKHVuc2lnbmVkIGxvbmcpTVNf
UkRPTkxZKTsKPiArCXJldCA9IG1vdW50KGZzaW5mby5mc2RldiwgZnNpbmZvLm1vdW50X3BvaW50
LCBmc2luZm8uZnN0eXBlLAo+ICsJCSAgICBmbGFncywgZnNpbmZvLm1vdW50X29wdHMpOwo+ICsJ
aWYgKHJldCkgewo+ICsJCXBjdigicmVtb3VudGVkICVzIFIvTyVzLCBidXQgY2Fubm90IHJlLW1v
dW50IGl0IFIvVyIsCj4gKwkJICAgIHRyaWVzLCBmc2luZm8ubW91bnRfcG9pbnQpOwo+ICsJCXJl
dHVybiAtMTsKPiArCX0KPiArCj4gKwlyZXR1cm4gMDsKPiArfQo+ICsKPiAgIC8qKgo+ICAgICog
UmUtbW91bnQgdGhlIHRlc3QgZmlsZS1zeXN0ZW0uIFRoaXMgZnVuY3Rpb24gcmFuZG9tbHkgc2Vs
ZWN0IGhvdyB0bwo+ICAgICogcmUtbW91bnQuCj4gQEAgLTI2OTIsMjQgKzI3MjEsOSBAQCBzdGF0
aWMgaW50IHJlbW91bnRfdGVzdGVkX2ZzKHZvaWQpCj4gICAJCXVtID0gMTsKPiAgIAo+ICAgCWlm
IChyb3J3MSkgewo+IC0JCWZsYWdzID0gZnNpbmZvLm1vdW50X2ZsYWdzIHwgTVNfUkRPTkxZIHwg
TVNfUkVNT1VOVDsKPiAtCQlyZXQgPSBtb3VudChmc2luZm8uZnNkZXYsIGZzaW5mby5tb3VudF9w
b2ludCwgZnNpbmZvLmZzdHlwZSwKPiAtCQkJICAgIGZsYWdzLCBmc2luZm8ubW91bnRfb3B0cyk7
Cj4gLQkJaWYgKHJldCkgewo+IC0JCQlwY3YoImNhbm5vdCByZW1vdW50ICVzIFIvTyAoMSkiLAo+
IC0JCQkgICAgZnNpbmZvLm1vdW50X3BvaW50KTsKPiAtCQkJcmV0dXJuIC0xOwo+IC0JCX0KPiAt
Cj4gLQkJZmxhZ3MgPSBmc2luZm8ubW91bnRfZmxhZ3MgfCBNU19SRU1PVU5UOwo+IC0JCWZsYWdz
ICY9IH4oKHVuc2lnbmVkIGxvbmcpTVNfUkRPTkxZKTsKPiAtCQlyZXQgPSBtb3VudChmc2luZm8u
ZnNkZXYsIGZzaW5mby5tb3VudF9wb2ludCwgZnNpbmZvLmZzdHlwZSwKPiAtCQkJICAgIGZsYWdz
LCBmc2luZm8ubW91bnRfb3B0cyk7Cj4gLQkJaWYgKHJldCkgewo+IC0JCQlwY3YoInJlbW91bnRl
ZCAlcyBSL08gKDEpLCBidXQgY2Fubm90IHJlLW1vdW50IGl0IFIvVyIsCj4gLQkJCSAgICBmc2lu
Zm8ubW91bnRfcG9pbnQpOwo+ICsJCXJldCA9IHJlbW91bnRfcm9fcncoIiAoMSkiKTsKPiArCQlp
ZiAocmV0KQo+ICAgCQkJcmV0dXJuIC0xOwo+IC0JCX0KPiAgIAl9Cj4gICAKPiAgIAlpZiAodW0p
IHsKPiBAQCAtMjczMCwyMyArMjc0NCw5IEBAIHN0YXRpYyBpbnQgcmVtb3VudF90ZXN0ZWRfZnMo
dm9pZCkKPiAgIAl9Cj4gICAKPiAgIAlpZiAocm9ydzIpIHsKPiAtCQlmbGFncyA9IGZzaW5mby5t
b3VudF9mbGFncyB8IE1TX1JET05MWSB8IE1TX1JFTU9VTlQ7Cj4gLQkJcmV0ID0gbW91bnQoZnNp
bmZvLmZzZGV2LCBmc2luZm8ubW91bnRfcG9pbnQsIGZzaW5mby5mc3R5cGUsCj4gLQkJCSAgICBm
bGFncywgZnNpbmZvLm1vdW50X29wdHMpOwo+IC0JCWlmIChyZXQpIHsKPiAtCQkJcGN2KCJjYW5u
b3QgcmUtbW91bnQgJXMgUi9PICgzKSIsIGZzaW5mby5tb3VudF9wb2ludCk7Cj4gLQkJCXJldHVy
biAtMTsKPiAtCQl9Cj4gLQo+IC0JCWZsYWdzID0gZnNpbmZvLm1vdW50X2ZsYWdzIHwgTVNfUkVN
T1VOVDsKPiAtCQlmbGFncyAmPSB+KCh1bnNpZ25lZCBsb25nKU1TX1JET05MWSk7Cj4gLQkJcmV0
ID0gbW91bnQoZnNpbmZvLmZzZGV2LCBmc2luZm8ubW91bnRfcG9pbnQsIGZzaW5mby5mc3R5cGUs
Cj4gLQkJCSAgICBmbGFncywgZnNpbmZvLm1vdW50X29wdHMpOwo+IC0JCWlmIChyZXQpIHsKPiAt
CQkJcGN2KCJyZW1vdW50ZWQgJXMgUi9PICgzKSwgYnV0IGNhbm5vdCByZS1tb3VudCBpdCBiYWNr
IFIvVyIsCj4gLQkJCSAgICAgZnNpbmZvLm1vdW50X3BvaW50KTsKPiArCQlyZXQgPSByZW1vdW50
X3JvX3J3KCIgKDMpIik7Cj4gKwkJaWYgKHJldCkKPiAgIAkJCXJldHVybiAtMTsKPiAtCQl9Cj4g
ICAJfQo+ICAgCj4gICAJQ0hFQ0soY2hkaXIoZnNpbmZvLm1vdW50X3BvaW50KSA9PSAwKTsKPiBA
QCAtMzIwOSw3ICszMjA5LDYgQEAgc3RhdGljIHZvaWQgZnJlZV9mc19pbmZvKHN0cnVjdCBkaXJf
aW5mbyAqZGlyKQo+ICAgc3RhdGljIGludCByZWNvdmVyX3Rlc3RlZF9mcyh2b2lkKQo+ICAgewo+
ICAgCWludCByZXQ7Cj4gLQl1bnNpZ25lZCBsb25nIGZsYWdzOwo+ICAgCXVuc2lnbmVkIGludCAg
dW1fcm9ydywgcm9ydzI7Cj4gICAJc3RydWN0IG1udGVudCAqbW50ZW50Owo+ICAgCj4gQEAgLTMy
MzEsMjMgKzMyMzAsOSBAQCBzdGF0aWMgaW50IHJlY292ZXJfdGVzdGVkX2ZzKHZvaWQpCj4gICAJ
CXJldHVybiAtMTsKPiAgIAo+ICAgCWlmIChyb3J3Mikgewo+IC0JCWZsYWdzID0gZnNpbmZvLm1v
dW50X2ZsYWdzIHwgTVNfUkRPTkxZIHwgTVNfUkVNT1VOVDsKPiAtCQlyZXQgPSBtb3VudChmc2lu
Zm8uZnNkZXYsIGZzaW5mby5tb3VudF9wb2ludCwgZnNpbmZvLmZzdHlwZSwKPiAtCQkJICAgIGZs
YWdzLCBmc2luZm8ubW91bnRfb3B0cyk7Cj4gLQkJaWYgKHJldCkgewo+IC0JCQlwY3YoImNhbm5v
dCByZS1tb3VudCAlcyBSL08iLCBmc2luZm8ubW91bnRfcG9pbnQpOwo+IC0JCQlyZXR1cm4gLTE7
Cj4gLQkJfQo+IC0KPiAtCQlmbGFncyA9IGZzaW5mby5tb3VudF9mbGFncyB8IE1TX1JFTU9VTlQ7
Cj4gLQkJZmxhZ3MgJj0gfigodW5zaWduZWQgbG9uZylNU19SRE9OTFkpOwo+IC0JCXJldCA9IG1v
dW50KGZzaW5mby5mc2RldiwgZnNpbmZvLm1vdW50X3BvaW50LCBmc2luZm8uZnN0eXBlLAo+IC0J
CQkgICAgZmxhZ3MsIGZzaW5mby5tb3VudF9vcHRzKTsKPiAtCQlpZiAocmV0KSB7Cj4gLQkJCXBj
digicmVtb3VudGVkICVzIFIvTywgYnV0IGNhbm5vdCByZS1tb3VudCBpdCBiYWNrIFIvVyIsCj4g
LQkJCSAgICAgZnNpbmZvLm1vdW50X3BvaW50KTsKPiArCQlyZXQgPSByZW1vdW50X3JvX3J3KCIi
KTsKPiArCQlpZiAocmV0KQo+ICAgCQkJcmV0dXJuIC0xOwo+IC0JCX0KPiAgIAl9Cj4gICAKPiAg
IAlyZXR1cm4gMDsKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
