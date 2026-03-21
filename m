Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BF01099B59
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Mar 2026 02:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrkzW2FKYVPBsDvEBM2oATqp7h5l74FOYbB4uB5zfB8=; b=E3NF9ByWHGAhVmBayb2Bzr2nFT
	gj+nIdBiupH/n1Ikpr63JYfB41M/Od/HD8UR/fdpXVe7/vTnK8gB1sIzhf0BYh9J+BUZT4dvv38qQ
	BqNYV2xXKWkqrP9T+lAMK6Lnoge05jcTKGFP8KP8ame9dZf2Ur8jnmWGRqgL0Htq4WpbAqL5kDiW/
	6j7vupz8PC1YJlvSLOOfJ0YT1DH64HN3ivmEeOTr8Ge1RbcvyyTk0g18DElp88wLNwVJ8yjtHerbH
	qPXPPNROiTzIRXm+G9Aevwj5q8cNbNvV567wFyhJAI4uaAUvbd1E2etuiL95h0BV8ZyMB7LNjY51M
	nX5QVe9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ljd-0000000Du3Z-26zF;
	Sat, 21 Mar 2026 02:06:41 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ljX-0000000Du2f-1o97
	for linux-mtd@lists.infradead.org;
	Sat, 21 Mar 2026 02:06:37 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=IVfCdhG3Bimzj6BX6QA3XU1WORmYKRToU188kgbX1AU=;
	b=i+c2I+iH4ApXDPVY9+tLYGflmbj1QMQQsFatucRkenzSAJM0GoYU9oqpwanuh1r0exJ8xJlZY
	YXq7OjNftSK1nJ3h1Q7EV5D6Ab7eLN/ZBvyELlXZ9sgeybZPoff1hIFp3Qz98NW7Ji10Js2PJgR
	glXnXFTf6L6Ji5BGfhPhDdM=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fd2hN0ddSzcZyQ;
	Sat, 21 Mar 2026 10:00:36 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 130442012A;
	Sat, 21 Mar 2026 10:06:20 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 21 Mar 2026 10:06:19 +0800
Subject: Re: [PATCH v3 1/2] ubifs: Remove unnecessary cond_resched() from
 list_sort() compare
To: Kuan-Wei Chiu <visitorckw@gmail.com>, <richard@nod.at>,
	<akpm@linux-foundation.org>
CC: <hch@infradead.org>, <jserv@ccns.ncku.edu.tw>, <eleanor15x@gmail.com>,
	<marscheng@google.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260320180938.1827148-1-visitorckw@gmail.com>
 <20260320180938.1827148-2-visitorckw@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <2fdb7cfc-f993-80bf-2519-1614ccd342c5@huawei.com>
Date: Sat, 21 Mar 2026 10:06:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20260320180938.1827148-2-visitorckw@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_190636_188489_7E32BABA 
X-CRM114-Status: GOOD (  16.10  )
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

1NogMjAyNi8zLzIxIDI6MDksIEt1YW4tV2VpIENoaXUg0LS1wDoKPiBIaXN0b3JpY2FsbHksIFVC
SUZTIGVtYmVkZGVkIGNvbmRfcmVzY2hlZCgpIGNhbGxzIGluc2lkZSBpdHMKPiBsaXN0X3NvcnQo
KSBjb21wYXJpc29uIGNhbGxiYWNrcyAoZGF0YV9ub2Rlc19jbXAsIG5vbmRhdGFfbm9kZXNfY21w
LAo+IGFuZCByZXBsYXlfZW50cmllc19jbXApIHRvIHByZXZlbnQgc29mdCBsb2NrdXBzIHdoZW4g
c29ydGluZyBsb25nCj4gbGlzdHMuCj4gCj4gSG93ZXZlciwgZnVydGhlciBpbnNwZWN0aW9uIGJ5
IFJpY2hhcmQgV2VpbmJlcmdlciByZXZlYWxzIHRoYXQgdGhlc2UKPiBjb21wYXJlIGZ1bmN0aW9u
cyBhcmUgZXh0cmVtZWx5IGxpZ2h0d2VpZ2h0IGFuZCBkbyBub3QgcGVyZm9ybSBhbnkKPiBibG9j
a2luZyBNVEQgSS9PLiBGdXJ0aGVybW9yZSwgdGhlIGxpc3RzIGJlaW5nIHNvcnRlZCBhcmUgc3Ry
aWN0bHkKPiBib3VuZGVkIGluIHNpemU6Cj4gLSBJbiB0aGUgR0MgY2FzZSwgdGhlIGxpc3QgY29u
dGFpbnMgYXQgbW9zdCB0aGUgbnVtYmVyIG9mIG5vZGVzIHRoYXQKPiAgICBmaXQgaW50byBhIHNp
bmdsZSBMRUIuCj4gLSBJbiB0aGUgcmVwbGF5IGNhc2UsIHRoZSBsaXN0IHNwYW5zIGFjcm9zcyBh
IGZldyBMRUJzIGZyb20gdGhlIFVCSUZTCj4gICAgam91cm5hbCwgYW1vdW50aW5nIHRvIGF0IG1v
c3QgYSBmZXcgdGhvdXNhbmQgZWxlbWVudHMuCj4gCj4gU2luY2UgdGhlIGNvbXBhcmUgZnVuY3Rp
b25zIGFyZSBjYWxsZWQgYSBmZXcgdGhvdXNhbmQgdGltZXMgYXQgbW9zdCwKPiB0aGUgb3Zlcmhl
YWQgb2YgZnJlcXVlbnQgc2NoZWR1bGluZyBwb2ludHMgaXMgdW5qdXN0aWZpZWQuIFJlbW92aW5n
IHRoZQo+IGNvbmRfcmVzY2hlZCgpIGNhbGxzIHNpbXBsaWZpZXMgdGhlIGNvbXBhcmlzb24gbG9n
aWMgYW5kIHJlZHVjZXMKPiB1bm5lY2Vzc2FyeSBjb250ZXh0IHN3aXRjaCBjaGVja3MgZHVyaW5n
IHRoZSBzb3J0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEt1YW4tV2VpIENoaXUgPHZpc2l0b3Jja3dA
Z21haWwuY29tPgo+IC0tLQo+ICAgZnMvdWJpZnMvZ2MuYyAgICAgfCAyIC0tCj4gICBmcy91Ymlm
cy9yZXBsYXkuYyB8IDEgLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQoKUmV2
aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gCj4gZGlm
ZiAtLWdpdCBhL2ZzL3ViaWZzL2djLmMgYi9mcy91Ymlmcy9nYy5jCj4gaW5kZXggMGJmMDhiNzc1
NWI4Li45MzNjNzliNWNkNmIgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMvZ2MuYwo+ICsrKyBiL2Zz
L3ViaWZzL2djLmMKPiBAQCAtMTA5LDcgKzEwOSw2IEBAIHN0YXRpYyBpbnQgZGF0YV9ub2Rlc19j
bXAodm9pZCAqcHJpdiwgY29uc3Qgc3RydWN0IGxpc3RfaGVhZCAqYSwKPiAgIAlzdHJ1Y3QgdWJp
ZnNfaW5mbyAqYyA9IHByaXY7Cj4gICAJc3RydWN0IHViaWZzX3NjYW5fbm9kZSAqc2EsICpzYjsK
PiAgIAo+IC0JY29uZF9yZXNjaGVkKCk7Cj4gICAJaWYgKGEgPT0gYikKPiAgIAkJcmV0dXJuIDA7
Cj4gICAKPiBAQCAtMTUzLDcgKzE1Miw2IEBAIHN0YXRpYyBpbnQgbm9uZGF0YV9ub2Rlc19jbXAo
dm9pZCAqcHJpdiwgY29uc3Qgc3RydWN0IGxpc3RfaGVhZCAqYSwKPiAgIAlzdHJ1Y3QgdWJpZnNf
aW5mbyAqYyA9IHByaXY7Cj4gICAJc3RydWN0IHViaWZzX3NjYW5fbm9kZSAqc2EsICpzYjsKPiAg
IAo+IC0JY29uZF9yZXNjaGVkKCk7Cj4gICAJaWYgKGEgPT0gYikKPiAgIAkJcmV0dXJuIDA7Cj4g
ICAKPiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvcmVwbGF5LmMgYi9mcy91Ymlmcy9yZXBsYXkuYwo+
IGluZGV4IGE5YTU2OGY0YTg2OC4uMjYzMDQ1ZTA1Y2YxIDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZz
L3JlcGxheS5jCj4gKysrIGIvZnMvdWJpZnMvcmVwbGF5LmMKPiBAQCAtMzA1LDcgKzMwNSw2IEBA
IHN0YXRpYyBpbnQgcmVwbGF5X2VudHJpZXNfY21wKHZvaWQgKnByaXYsIGNvbnN0IHN0cnVjdCBs
aXN0X2hlYWQgKmEsCj4gICAJc3RydWN0IHViaWZzX2luZm8gKmMgPSBwcml2Owo+ICAgCXN0cnVj
dCByZXBsYXlfZW50cnkgKnJhLCAqcmI7Cj4gICAKPiAtCWNvbmRfcmVzY2hlZCgpOwo+ICAgCWlm
IChhID09IGIpCj4gICAJCXJldHVybiAwOwo+ICAgCj4gCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
