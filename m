Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F66E7716A
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Dec 2024 04:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BzjWPK/N7+/sANlJ6gpxI5pMlG9Wy7rlSXzJTb6j7Ng=; b=4D5tZlkSBqmnlvrq3ziwpkaQby
	0IMeSPNY6lCqnDoqzM1Jk8aNfOC34vdl+rsJfMMXjVDlV/Qeg5TfkXLXVcljAJGBMGn+eIeN3S64n
	Nc1iZFLHnSsi+BY6Ke+DqQ7xRuBY2sY4kCFL60oQTxuMBcNAgZ3H1qMM702lShV3BQZ6wbA3KuhYq
	ulqmGJiCxg5tb1oKkCfmtvmHOU046BWMNYYqdhLHrZ9K7BoZjm0bArWBXQKMA5hUMgcZKzoDIgLoD
	Vp+G+FudUw5NdrMgcMtW342qerlI8szNJinFPODndPS14a8dGKKS6nimvROzwJZSjPS2yuwR1YV0B
	lzoaX5gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNPca-0000000CBZQ-0qJX;
	Tue, 17 Dec 2024 04:55:48 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNPcW-0000000CBVp-1hGL
	for linux-mtd@lists.infradead.org;
	Tue, 17 Dec 2024 04:55:46 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4YC4Ft1BlRzRjR4
	for <linux-mtd@lists.infradead.org>; Tue, 17 Dec 2024 12:53:38 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 72F711800CB
	for <linux-mtd@lists.infradead.org>; Tue, 17 Dec 2024 12:55:29 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 17 Dec 2024 12:55:28 +0800
Subject: Re: [PATCH mtd-utils] lib: Fix integer overflow in in libiniparser.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>,
	<linux-mtd@lists.infradead.org>, Anton Moryakov <ant.v.moryakov@gmail.com>
References: <20241216115738.65009-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <134cc728-10f3-9b55-f68e-a227f4529908@huawei.com>
Date: Tue, 17 Dec 2024 12:55:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241216115738.65009-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_205544_607403_1CE2EE48 
X-CRM114-Status: GOOD (  14.08  )
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

1NogMjAyNC8xMi8xNiAxOTo1NywgQW50b24gTW9yeWFrb3Yg0LS1wDoKPiBSZXBvcnQgb2YgdGhl
IHN0YXRpYyBhbmFseXplcjoKPiBQb3NzaWJsZSBpbnRlZ2VyIHVuZGVyZmxvdzogbGVmdCBvcGVy
YW5kIGlzIHRhaW50ZWQuCj4gQW4gaW50ZWdlciB1bmRlcmZsb3cgbWF5IG9jY3VyIGR1ZSB0byBh
cml0aG1ldGljIG9wZXJhdGlvbiAoc3VidHJhY3Rpb24pIGJldHdlZW4gdmFsdWVzCj4geyBbLTIx
NDc0ODM2NDgsIDIxNDc0ODM2NDddIH0gYW5kICcxJywgd2hlcmUgdGhlIGZpcnN0IHZhbHVlIGNv
bWVzIGZyb20gdGhlIGV4cHJlc3Npb24gJyhpbnQpc3RybGVuKGxpbmUpJwo+IAo+IENvcnJlY3Rp
b25zIGV4cGxhaW5lZDoKPiBNb2RpZmllZCBsb2dpYyB0b3NraXAgZW1wdHkgbGluZXMgaW1tZWRp
YXRlbHksIHJlZHVjaW5nIHVubmVjZXNzYXJ5IHByb2Nlc3NpbmcuLSBFbnN1cmVkIHNhZmV0eSBi
eSB2YWxpZGF0aW5nIGxlbiA+PSAwIGJlZm9yZSBhY2Nlc3NpbmcgbGluZVtsZW5dIHRvIGF2b2lk
IG91dC1vZi1ib3VuZHMgYWNjZXNzLgo+IAo+IFRyaWdnZXJzIGZvdW5kIGJ5IHN0YXRpYyBhbmFs
eXplciBTdmFjZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbnRvbiBNb3J5YWtvdiA8YW50LnYubW9y
eWFrb3ZAZ21haWwuY28KPiAKPiAtLS0KPiAgIGxpYi9saWJpbmlwYXJzZXIuYyB8IDIgKy0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKSGksIEFudG9u
LiBJJ20gZmluZSB3aXRoIHRoZSBzaW5nbGUtcG9pbnQgZml4IHNvbHV0aW9uLCBhbmQgeW91IGNh
biBhZGQ6CgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNv
bT4KCk9yIGp1c3QgbGlrZSBBbnRvbidzIHN1Z2dlc3Rpb25zLCBJJ20gYWxzbyBmaW5lIHdpdGgg
dXBkYXRpbmcgCmxpYmluaXBhcnNlciBmcm9tIFsxXSwgd2hpY2ggZGlkIHNvbHZlIHNldmVyYWwg
YnVncyBpbiB0aGUgcGFzdCBmZXcgCnllYXJzLiBBbmQgdGhlcmUgbWF5IGJlIHNvbWUgdW51c2Vk
IGZ1bmN0aW9ucyBzaG91bGQgYmUgZGVsZXRlZCB0byBhdm9pZCAKY29tcGlsaW5nIHdhcm5pbmdz
LgpbMV0gaHR0cHM6Ly9naXRsYWIuY29tL2luaXBhcnNlci9pbmlwYXJzZXIKCj4gCj4gZGlmZiAt
LWdpdCBhL2xpYi9saWJpbmlwYXJzZXIuYyBiL2xpYi9saWJpbmlwYXJzZXIuYwo+IGluZGV4IGE2
ZGRjYzcuLjk3OTBjNzUgMTAwNjQ0Cj4gLS0tIGEvbGliL2xpYmluaXBhcnNlci5jCj4gKysrIGIv
bGliL2xpYmluaXBhcnNlci5jCj4gQEAgLTU0MCw3ICs1NDAsNyBAQCBkaWN0aW9uYXJ5ICogaW5p
cGFyc2VyX2xvYWQoY29uc3QgY2hhciAqIGluaW5hbWUpCj4gICAgICAgICAgICAgICBsZW4tLSA7
Cj4gICAgICAgICAgIH0KPiAgICAgICAgICAgLyogRGV0ZWN0IG11bHRpLWxpbmUgKi8KPiAtICAg
ICAgICBpZiAobGluZVtsZW5dPT0nXFwnKSB7Cj4gKyAgICAgICAgaWYgKGxlbiA+PSAwICYmIGxp
bmVbbGVuXT09J1xcJykgewo+ICAgICAgICAgICAgICAgLyogTXVsdGktbGluZSB2YWx1ZSAqLwo+
ICAgICAgICAgICAgICAgbGFzdD1sZW4gOwo+ICAgICAgICAgICAgICAgY29udGludWUgOwo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
