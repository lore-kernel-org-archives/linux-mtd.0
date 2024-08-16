Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D41C3DA4A
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Aug 2024 12:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/k+8aeybX3KjA/e9e+JD+HzF6o37UcMAf4grSWcw2o8=; b=ARhqCa0hLD07hWIP2s7VBE5z9f
	xayHdyqJOKYZVVuEqN5qM2O0IheqTovpsm+9Nk4PBamVcwed25yulLSJdN7/lgCpbVwn98h1zwNyU
	oa8LparsnwOWwxKMPzvHoQKssCWZHqHbqRmOrskw5P7FI6BdEbbqUT94CUcmm7eVbc5omvbz7sX6K
	LW97aJ7acljZAL0UaLHsA/ezelsBU+cvIYZHkcKVbzSa8KLfVG0mYX9GeqmzFLxd5t+FPg0xYAqI+
	aHVYAK5OQKc7shEX8+KP0mC73lwknFE/jGDEq/yVXUuGkyCMFRJfVxDTUH6MuigA1SBGlWrxMSiwH
	93FeV38w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sewJ8-0000000Cv8k-3Ihl;
	Fri, 16 Aug 2024 12:43:54 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sewHI-0000000CubO-2BUE
	for linux-mtd@lists.infradead.org;
	Fri, 16 Aug 2024 12:42:03 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4WlhMG0vkYz1S81X
	for <linux-mtd@lists.infradead.org>; Fri, 16 Aug 2024 20:36:58 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 229B01400FD
	for <linux-mtd@lists.infradead.org>; Fri, 16 Aug 2024 20:41:53 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 20:41:52 +0800
Subject: Re: [PATCH 1/2] fs-tests: integck: Refactor: split out common remount
 logic
To: =?UTF-8?B?Q3PDs2vDoXMsIEJlbmNl?= <csokas.bence@prolan.hu>,
	<linux-mtd@lists.infradead.org>
References: <20240815091225.3237097-1-csokas.bence@prolan.hu>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <5530437c-b564-461f-26af-85bde1a00cb3@huawei.com>
Date: Fri, 16 Aug 2024 20:41:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240815091225.3237097-1-csokas.bence@prolan.hu>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_054201_438734_D68C4F3B 
X-CRM114-Status: GOOD (  24.61  )
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
c2FtZSBjb2RlIGZvciB1bW91bnQnaW5nIHRoZSB0YXJnZXQgRlMgYW5kCj4gbW91bnQnaW5nIGl0
IGJhY2suIFNwbGl0IHRoaXMgc2VxdWVuY2UgaW50byBhIG5ldwo+IGZ1bmN0aW9uIGNhbGxlZCB1
bW91bnRfYW5kX3JlbW91bnQoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDc8Oza8OhcywgQmVuY2Ug
PGNzb2thcy5iZW5jZUBwcm9sYW4uaHU+Cj4gLS0tCj4gCj4gTm90ZXM6Cj4gICAgICBgLS1jb2xv
ci1tb3ZlZGAgaXMgcmVjb21tZW5kZWQKPiAKPiAgIHRlc3RzL2ZzLXRlc3RzL2ludGVncml0eS9p
bnRlZ2NrLmMgfCAyMDQgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCA5NiBpbnNlcnRpb25zKCspLCAxMDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL3Rlc3RzL2ZzLXRlc3RzL2ludGVncml0eS9pbnRlZ2NrLmMgYi90ZXN0cy9mcy10ZXN0cy9p
bnRlZ3JpdHkvaW50ZWdjay5jCj4gaW5kZXggMGE3ZjE0Mi4uNmNlOGM5ZCAxMDA2NDQKPiAtLS0g
YS90ZXN0cy9mcy10ZXN0cy9pbnRlZ3JpdHkvaW50ZWdjay5jCj4gKysrIGIvdGVzdHMvZnMtdGVz
dHMvaW50ZWdyaXR5L2ludGVnY2suYwo+IEBAIC0yNTc3LDYgKzI1NzcsOTcgQEAgc3RhdGljIGlu
dCBybV9taW51c19yZl9kaXIoY29uc3QgY2hhciAqZGlyX25hbWUpCj4gICAJcmV0dXJuIDA7Cj4g
ICB9Cj4gICAKPiArLyoKPiArICogRGV0YWNoIHRoZSBNVEQgZGV2aWNlIGZyb20gVUJJIGFuZCBh
dHRhY2ggaXQgYmFjay4gVGhpcyBmdW5jdGlvbiBpcyB1c2VkCj4gKyAqIHdoZWQgcGVyZm9ybWlu
ZyBlbXVsYXRlZCBwb3dlciBjdXQgdGVzdGluZyBhbmR0aGUgcG93ZXIgY3V0cyBhcmUgYW11bGF0
ZWQgYnkKPiArICogVUJJLCBub3QgYnkgVUJJRlMuIEluIHRoaXMgY2FzZSwgdG8gcmVjb3ZlciBm
cm9tIHRoZSBlbXVsYXRlZCBwb3dlciBjdXQgd2UKPiArICogaGF2ZSB0byB1bm1vdW50IFVCSUZT
IGFuZCByZS1hdHRhY2ggdGhlIE1URCBkZXZpY2UuCj4gKyAqLwo+ICtzdGF0aWMgaW50IHJlYXR0
YWNoKHZvaWQpCj4gK3sKPiArCWludCBlcnIgPSAwOwo+ICsJbGlidWJpX3QgbGlidWJpOwo+ICsJ
c3RydWN0IHViaV9hdHRhY2hfcmVxdWVzdCByZXE7Cj4gKwo+ICsJbGlidWJpID0gbGlidWJpX29w
ZW4oKTsKPiArCWlmICghbGlidWJpKSB7Cj4gKwkJaWYgKGVycm5vID09IDApCj4gKwkJCXJldHVy
biBlcnJtc2coIlVCSSBpcyBub3QgcHJlc2VudCBpbiB0aGUgc3lzdGVtIik7Cj4gKwkJcmV0dXJu
IHN5c19lcnJtc2coImNhbm5vdCBvcGVuIGxpYnViaSIpOwo+ICsJfQo+ICsKPiArCWVyciA9IHVi
aV9kZXRhY2hfbXRkKGxpYnViaSwgIi9kZXYvdWJpX2N0cmwiLCBhcmdzLm10ZG4pOwo+ICsJaWYg
KGVycikgewo+ICsJCXN5c19lcnJtc2coImNhbm5vdCBkZXRhY2ggbXRkJWQiLCBhcmdzLm10ZG4p
Owo+ICsJCWdvdG8gb3V0Owo+ICsJfQo+ICsKPiArCXJlcS5kZXZfbnVtID0gVUJJX0RFVl9OVU1f
QVVUTzsKPiArCXJlcS5tdGRfbnVtID0gYXJncy5tdGRuOwo+ICsJcmVxLnZpZF9oZHJfb2Zmc2V0
ID0gMDsKPiArCXJlcS5tdGRfZGV2X25vZGUgPSBOVUxMOwo+ICsJcmVxLm1heF9iZWJfcGVyMTAy
NCA9IDA7Cj4gKwo+ICsJZXJyID0gdWJpX2F0dGFjaChsaWJ1YmksICIvZGV2L3ViaV9jdHJsIiwg
JnJlcSk7Cj4gKwlpZiAoZXJyKQo+ICsJCXN5c19lcnJtc2coImNhbm5vdCBhdHRhY2ggbXRkJWQi
LCBhcmdzLm10ZG4pOwo+ICsKPiArb3V0Ogo+ICsJbGlidWJpX2Nsb3NlKGxpYnViaSk7Cj4gKwly
ZXR1cm4gZXJyOwo+ICt9Cj4gKwo+ICsvKioKPiArICogVW5tb3VudCBhbmQgbW91bnQgYmFjayB0
aGUgdGVzdCBmaWxlLXN5c3RlbS4KPiArICovCj4gK3N0YXRpYyBpbnQgdW1vdW50X2FuZF9yZW1v
dW50KGludCBtb3VudGVkLCBpbnQgcmVhdHQsIGludCB1bV9yb3J3KQo+ICt7Cj4gKwlpbnQgcmV0
ID0gMDsKPiArCXVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gKwo+ICsJaWYgKG1vdW50ZWQpCj4gKwkJ
cmV0ID0gdW1vdW50KGZzaW5mby5tb3VudF9wb2ludCk7Cj4gKwlpZiAocmV0KSB7Cj4gKwkJcGN2
KCJjYW5ub3QgdW5tb3VudCAlcyIsIGZzaW5mby5tb3VudF9wb2ludCk7Cj4gKwkJcmV0dXJuIC0x
Owo+ICsJfQo+ICsKClsuLi5dCj4gICAvKgo+ICAgICogUmVjb3ZlciB0aGUgdGVzdGVkIGZpbGUt
c3lzdGVtIGZyb20gYW4gZW11bGF0ZWQgcG93ZXIgY3V0IGZhaWx1cmUgYnkKPiAgICAqIHVubW91
bnRpbmcgaXQgYW5kIG1vdW50aW5nIGl0IGFnYWluLgo+IEBAIC0zMjA2LDQxICszMjI1LDEwIEBA
IHN0YXRpYyBpbnQgcmVjb3Zlcl90ZXN0ZWRfZnModm9pZCkKPiAgIAkgKiB3aGlsZSBtb3VudGlu
ZyBpbiAncmVtb3VudF90ZXN0ZWRfZnMoKScuCj4gICAJICovCj4gICAJbW50ZW50ID0gZ2V0X3Rl
c3RlZF9mc19tbnRlbnQoKTsKPiAtCWlmIChtbnRlbnQpCj4gLQkJQ0hFQ0sodW1vdW50KGZzaW5m
by5tb3VudF9wb2ludCkgIT0gLTEpOwoKSSB0aGluayB0aGUgJ0NIRUNLJyBzaG91bGQndCBiZSBy
ZW1vdmVkLCBiZWNhdXNlIGl0IG1heSBsZWFkIHRvIGEgZGVhZCAKbG9vcCBpbiB0aGUgY2FsbGVy
OgoKMzMwMyAgICAgICAgIC8qIENoZWNrIHdoZXRoZXIgd2UgY2FuIHJlLW1vdW50IHRoZSB0ZXN0
ZWQgRlMgICovCjMzMDQgICAgICAgICBkbyB7CjMzMDUgICAgICAgICAgICAgICAgIHJldCA9IHJl
Y292ZXJfdGVzdGVkX2ZzKCk7CjMzMDYgICAgICAgICB9IHdoaWxlIChyZXQgJiYgYXJncy5wb3dl
cl9jdXRfbW9kZSAmJiBlcnJubyA9PSBFUk9GUyk7Cj4gICAKPiAtCWlmIChhcmdzLnJlYXR0YWNo
KQo+IC0JCUNIRUNLKHJlYXR0YWNoKCkgPT0gMCk7Cj4gLQo+IC0JaWYgKCF1bV9yb3J3KSB7Cj4g
LQkJcmV0ID0gbW91bnQoZnNpbmZvLmZzZGV2LCBmc2luZm8ubW91bnRfcG9pbnQsCj4gLQkJCSAg
ICBmc2luZm8uZnN0eXBlLCBmc2luZm8ubW91bnRfZmxhZ3MsCj4gLQkJCSAgICBmc2luZm8ubW91
bnRfb3B0cyk7Cj4gLQkJaWYgKHJldCkgewo+IC0JCQlwY3YoInVubW91bnRlZCAlcywgYnV0IGNh
bm5vdCBtb3VudCBpdCBiYWNrIFIvVyIsCj4gLQkJCSAgICBmc2luZm8ubW91bnRfcG9pbnQpOwo+
IC0JCQlyZXR1cm4gLTE7Cj4gLQkJfQo+IC0JfSBlbHNlIHsKPiAtCQlyZXQgPSBtb3VudChmc2lu
Zm8uZnNkZXYsIGZzaW5mby5tb3VudF9wb2ludCwKPiAtCQkJICAgIGZzaW5mby5mc3R5cGUsIGZz
aW5mby5tb3VudF9mbGFncyB8IE1TX1JET05MWSwKPiAtCQkJICAgIGZzaW5mby5tb3VudF9vcHRz
KTsKPiAtCQlpZiAocmV0KSB7Cj4gLQkJCXBjdigidW5tb3VudGVkICVzLCBidXQgY2Fubm90IG1v
dW50IGl0IGJhY2sgUi9PIiwKPiAtCQkJICAgIGZzaW5mby5tb3VudF9wb2ludCk7Cj4gLQkJCXJl
dHVybiAtMTsKPiAtCQl9Cj4gLQo+IC0JCWZsYWdzID0gZnNpbmZvLm1vdW50X2ZsYWdzIHwgTVNf
UkVNT1VOVDsKPiAtCQlmbGFncyAmPSB+KCh1bnNpZ25lZCBsb25nKU1TX1JET05MWSk7Cj4gLQkJ
cmV0ID0gbW91bnQoZnNpbmZvLmZzZGV2LCBmc2luZm8ubW91bnRfcG9pbnQsCj4gLQkJCSAgICBm
c2luZm8uZnN0eXBlLCBmbGFncywgZnNpbmZvLm1vdW50X29wdHMpOwo+IC0JCWlmIChyZXQpIHsK
PiAtCQkJcGN2KCJ1bm1vdW50ZWQgJXMsIG1vdW50ZWQgUi9PLCBidXQgY2Fubm90IHJlLW1vdW50
IGl0IFIvVyIsCj4gLQkJCSAgICAgZnNpbmZvLm1vdW50X3BvaW50KTsKPiAtCQkJcmV0dXJuIC0x
Owo+IC0JCX0KPiAtCX0KPiArCXJldCA9IHVtb3VudF9hbmRfcmVtb3VudCghIW1udGVudCwgYXJn
cy5yZWF0dGFjaCwgdW1fcm9ydyk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiAtMTsKPiAgIAo+
ICAgCWlmIChyb3J3Mikgewo+ICAgCQlmbGFncyA9IGZzaW5mby5tb3VudF9mbGFncyB8IE1TX1JE
T05MWSB8IE1TX1JFTU9VTlQ7Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
