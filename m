Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DFFE7716A
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2024 01:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8yCdkq57TTr2uXxyy2q3mzQo4xYAzibe7VzeGzy3r8=; b=Gd1+IJegIJYD6X37A3NngYyqSw
	LD2N5JtiddJQl3ciGpeHLyuy4n9m3Yc2ayqG2MUWXz03EknMceO7tATsrfW2i4dqlxkeK8/S66neb
	xWGZcHphJgluX5ktAYywSZ8RySrogfygY91CXkMheiS8mKqfyGmM+YI+Csxxusl4FmdqgTgGJ8R1z
	powL2uRqsni1Z29bmG1zJ5LCyv4McXVMSn9yGMbK8Jz9dVWdcIQpa9ZOLJAhEM1+ULR8RaoJHs+C/
	c4h2sEQ/JthZ5MaxTw6+/4h1uWOAfpfUcroHtvzc3ohjN4RsKTKT2KAnGP5e4JsDXNlp5orMpQq5q
	BUm8qx4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMzbd-00000008jUg-0QgN;
	Mon, 16 Dec 2024 01:09:05 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMzbZ-00000008jSq-3WY4
	for linux-mtd@lists.infradead.org;
	Mon, 16 Dec 2024 01:09:03 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4YBMFg2cmSzgZ8s
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2024 09:05:59 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 88BF3180064
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2024 09:08:54 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 16 Dec 2024 09:08:53 +0800
Subject: Re: [PATCH mtd-utils] ubi-utils: Fix integer overflow in mtdinfo.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241214123105.75618-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <5849276f-bc8e-4846-c429-aa69d586ddc2@huawei.com>
Date: Mon, 16 Dec 2024 09:08:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241214123105.75618-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_170902_034283_04A228B1 
X-CRM114-Status: GOOD (  15.40  )
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyNC8xMi8xNCAyMDozMSwgQW50b24gTW9yeWFrb3Yg0LS1wDoKPiBSZXBvcnQgb2YgdGhl
IHN0YXRpYyBhbmFseXplcjoKPiBUaGUgdmFsdWUgb2YgYW4gYXJpdGhtZXRpYyBleHByZXNzaW9u
ICdyZWdpbmZvLT5vZmZzZXQgKyBpICogcmVnaW5mby0+ZXJhc2VzaXplJyBpcyBhIHN1YmplY3Qg
dG8gb3ZlcmZsb3cKPiBiZWNhdXNlIGl0cyBvcGVyYW5kcyBhcmUgbm90IGNhc3QgdG8gYSBsYXJn
ZXIgZGF0YSB0eXBlIGJlZm9yZSBwZXJmb3JtaW5nIGFyaXRobWV0aWMKPiAKPiBDb3JyZWN0aW9u
cyBleHBsYWluZWQ6Cj4gQWRkZWQgY2FzdGluZyBpIGFuZCBzdGFydCB0byB1bnNpZ25lZCBsb25n
IGxvbmcKPiAKPiBUcmlnZ2VycyBmb3VuZCBieSBzdGF0aWMgYW5hbHl6ZXIgU3ZhY2UuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQW50b24gTW9yeWFrb3YgPGFudC52Lm1vcnlha292QGdtYWlsLmNvbT4K
PiAKPiAtLS0KPiAgIHViaS11dGlscy9tdGRpbmZvLmMgfCA0ICsrLS0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCgpSZXZpZXdlZC1ieTogWmhp
aGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiBkaWZmIC0tZ2l0IGEvdWJpLXV0
aWxzL210ZGluZm8uYyBiL3ViaS11dGlscy9tdGRpbmZvLmMKPiBpbmRleCA3ZGZmMGRlLi4xMmQz
NWViIDEwMDY0NAo+IC0tLSBhL3ViaS11dGlscy9tdGRpbmZvLmMKPiArKysgYi91YmktdXRpbHMv
bXRkaW5mby5jCj4gQEAgLTE4NSw3ICsxODUsNyBAQCBzdGF0aWMgdm9pZCBwcmludF91YmlfaW5m
byhjb25zdCBzdHJ1Y3QgbXRkX2luZm8gKm10ZF9pbmZvLAo+ICAgc3RhdGljIHZvaWQgcHJpbnRf
cmVnaW9uX21hcChjb25zdCBzdHJ1Y3QgbXRkX2Rldl9pbmZvICptdGQsIGludCBmZCwKPiAgIAkJ
CSAgICAgY29uc3QgcmVnaW9uX2luZm9fdCAqcmVnaW5mbykKPiAgIHsKPiAtCXVuc2lnbmVkIGxv
bmcgc3RhcnQ7Cj4gKwl1bnNpZ25lZCBsb25nIGxvbmcgc3RhcnQ7Cj4gICAJaW50IGksIHdpZHRo
Owo+ICAgCWludCByZXRfbG9ja2VkLCBlcnJub19sb2NrZWQsIHJldF9iYWQsIGVycm5vX2JhZDsK
PiAgIAo+IEBAIC0yMDMsNyArMjAzLDcgQEAgc3RhdGljIHZvaWQgcHJpbnRfcmVnaW9uX21hcChj
b25zdCBzdHJ1Y3QgbXRkX2Rldl9pbmZvICptdGQsIGludCBmZCwKPiAgIAkJcmV0X2xvY2tlZCA9
IHJldF9iYWQgPSBlcnJub19sb2NrZWQgPSBlcnJub19iYWQgPSAwOwo+ICAgCj4gICAJZm9yIChp
ID0gMDsgaSA8IHJlZ2luZm8tPm51bWJsb2NrczsgKytpKSB7Cj4gLQkJc3RhcnQgPSByZWdpbmZv
LT5vZmZzZXQgKyBpICogcmVnaW5mby0+ZXJhc2VzaXplOwo+ICsJCXN0YXJ0ID0gcmVnaW5mby0+
b2Zmc2V0ICsgKHVuc2lnbmVkIGxvbmcgbG9uZylpICogcmVnaW5mby0+ZXJhc2VzaXplOwo+ICAg
CQlwcmludGYoIiAlKmk6ICUwOGx4ICIsIHdpZHRoLCBpLCBzdGFydCk7Cj4gICAKPiAgIAkJaWYg
KHJldF9sb2NrZWQgIT0gLTEpIHsKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
