Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A71BC48BF6
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Feb 2024 02:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2b7KMEr52G4qIlazLKBg48kkXhv/bwBBymovvN/oUY=; b=Hcn3llea/qQwTeQB2gZysYokLD
	vOc0oznblxW7xKvIeFYBwEvN2eV4MM+47XWZCVOfP9FrqIrwYThhjfq/ekjJpKsPM5k75oBu2oTkK
	0VMbYqNhG7LyAw9AKvzCXZRteWCexQMlv5774Y494yJ/Bzw4xwCqFGDNz65VIo9paDlpHqgzem8dq
	xetu22nZXqw9UTGkB/q15Db0zDwraj3Vbeoz3LuQUYpYwI1GWJp9ux+qNC3ajzfweSIPX2jzUSXsN
	z8arbBLWfXKUmXjBfOyuF1QUKAmUJerJ48A8Qq7fnO80E1odc6QWzTWit/vJj+cRaDj6kABzTxkRZ
	+QvXvhqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1renVJ-00000003WJk-1FQT;
	Tue, 27 Feb 2024 02:47:37 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1renVE-00000003WGp-2WNQ
	for linux-mtd@lists.infradead.org;
	Tue, 27 Feb 2024 02:47:35 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4TkMM40qXfzqjhM;
	Tue, 27 Feb 2024 10:46:40 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id B3D291400D3;
	Tue, 27 Feb 2024 10:47:16 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 27 Feb 2024 10:47:15 +0800
Subject: Re: [PATCH] ubifs: fix function comment warning
To: Arnd Bergmann <arnd@kernel.org>, Richard Weinberger <richard@nod.at>, Arnd
 Bergmann <arnd@arndb.de>
CC: kernel test robot <lkp@intel.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20240226121600.1267204-1-arnd@kernel.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <e10d1819-bd02-ad1a-444d-bf77b3a9a369@huawei.com>
Date: Tue, 27 Feb 2024 10:47:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240226121600.1267204-1-arnd@kernel.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_184733_030877_E8B184E0 
X-CRM114-Status: GOOD (  17.31  )
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

1NogMjAyNC8yLzI2IDIwOjE1LCBBcm5kIEJlcmdtYW5uINC0tcA6Cj4gRnJvbTogQXJuZCBCZXJn
bWFubiA8YXJuZEBhcm5kYi5kZT4KPgo+IE15IHByZXZpb3VzIGZpeCBpbnRyb2R1Y2VkIGEgbmV3
IFc9MSB3YXJuaW5nIGZvciB0aGUga2VybmVsZG9jIHN0eWxlCj4gY29tbWVudHM6Cj4KPiBmcy91
Ymlmcy9maW5kLmM6ODY6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBzdHJ1Y3QgbWVt
YmVyICdhcmcnIG5vdCBkZXNjcmliZWQgaW4gJ3NjYW5fZm9yX2RpcnR5X2NiJwo+Cj4gQWRqdXN0
IHRoZSBjb21tZW50cyB0byB0aGUgYXJndW1lbnQgbmFtZXMuCj4KPiBSZXBvcnRlZC1ieTogWmhp
aGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiBSZXBvcnRlZC1ieToga2VybmVs
IHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9vZS1rYnVpbGQtYWxsLzIwMjQwMjI2MTU1OS5jWXRNT2tJbi1sa3BAaW50ZWwuY29tLwo+
IEZpeGVzOiBlYzcyNGU1MzRkZmQgKCJ1YmlmczogZml4IGZ1bmN0aW9uIHBvaW50ZXIgY2FzdCB3
YXJuaW5ncyIpCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4K
PiAtLS0KPiAgIGZzL3ViaWZzL2ZpbmQuYyAgIHwgOCArKysrLS0tLQo+ICAgZnMvdWJpZnMvbHBy
b3BzLmMgfCAyICstCj4gICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKClRoZSBjb21taXQgdGl0bGUgY291bGQgYmUgbW9yZSBkZXRhaWxlZChlZy4gYWRk
IGZ1bmN0aW9uIG5hbWUpIGluIG5leHQgdGltZS4KClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcg
PGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgoKPiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvZmluZC5j
IGIvZnMvdWJpZnMvZmluZC5jCj4gaW5kZXggNmViZjNjMDRhYzVmLi42NDM3MTg5MDZiOWYgMTAw
NjQ0Cj4gLS0tIGEvZnMvdWJpZnMvZmluZC5jCj4gKysrIGIvZnMvdWJpZnMvZmluZC5jCj4gQEAg
LTczLDcgKzczLDcgQEAgc3RhdGljIGludCB2YWx1YWJsZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywg
Y29uc3Qgc3RydWN0IHViaWZzX2xwcm9wcyAqbHByb3BzKQo+ICAgICogQGM6IHRoZSBVQklGUyBm
aWxlLXN5c3RlbSBkZXNjcmlwdGlvbiBvYmplY3QKPiAgICAqIEBscHJvcHM6IExFQiBwcm9wZXJ0
aWVzIHRvIHNjYW4KPiAgICAqIEBpbl90cmVlOiB3aGV0aGVyIHRoZSBMRUIgcHJvcGVydGllcyBh
cmUgaW4gbWFpbiBtZW1vcnkKPiAtICogQGRhdGE6IGluZm9ybWF0aW9uIHBhc3NlZCB0byBhbmQg
ZnJvbSB0aGUgY2FsbGVyIG9mIHRoZSBzY2FuCj4gKyAqIEBhcmc6IGluZm9ybWF0aW9uIHBhc3Nl
ZCB0byBhbmQgZnJvbSB0aGUgY2FsbGVyIG9mIHRoZSBzY2FuCj4gICAgKgo+ICAgICogVGhpcyBm
dW5jdGlvbiByZXR1cm5zIGEgY29kZSB0aGF0IGluZGljYXRlcyB3aGV0aGVyIHRoZSBzY2FuIHNo
b3VsZCBjb250aW51ZQo+ICAgICogKCVMUFRfU0NBTl9DT05USU5VRSksIHdoZXRoZXIgdGhlIExF
QiBwcm9wZXJ0aWVzIHNob3VsZCBiZSBhZGRlZCB0byB0aGUgdHJlZQo+IEBAIC0zNDAsNyArMzQw
LDcgQEAgaW50IHViaWZzX2ZpbmRfZGlydHlfbGViKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBzdHJ1
Y3QgdWJpZnNfbHByb3BzICpyZXRfbHAsCj4gICAgKiBAYzogdGhlIFVCSUZTIGZpbGUtc3lzdGVt
IGRlc2NyaXB0aW9uIG9iamVjdAo+ICAgICogQGxwcm9wczogTEVCIHByb3BlcnRpZXMgdG8gc2Nh
bgo+ICAgICogQGluX3RyZWU6IHdoZXRoZXIgdGhlIExFQiBwcm9wZXJ0aWVzIGFyZSBpbiBtYWlu
IG1lbW9yeQo+IC0gKiBAZGF0YTogaW5mb3JtYXRpb24gcGFzc2VkIHRvIGFuZCBmcm9tIHRoZSBj
YWxsZXIgb2YgdGhlIHNjYW4KPiArICogQGFyZzogaW5mb3JtYXRpb24gcGFzc2VkIHRvIGFuZCBm
cm9tIHRoZSBjYWxsZXIgb2YgdGhlIHNjYW4KPiAgICAqCj4gICAgKiBUaGlzIGZ1bmN0aW9uIHJl
dHVybnMgYSBjb2RlIHRoYXQgaW5kaWNhdGVzIHdoZXRoZXIgdGhlIHNjYW4gc2hvdWxkIGNvbnRp
bnVlCj4gICAgKiAoJUxQVF9TQ0FOX0NPTlRJTlVFKSwgd2hldGhlciB0aGUgTEVCIHByb3BlcnRp
ZXMgc2hvdWxkIGJlIGFkZGVkIHRvIHRoZSB0cmVlCj4gQEAgLTU4MSw3ICs1ODEsNyBAQCBpbnQg
dWJpZnNfZmluZF9mcmVlX3NwYWNlKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBpbnQgbWluX3NwYWNl
LCBpbnQgKm9mZnMsCj4gICAgKiBAYzogdGhlIFVCSUZTIGZpbGUtc3lzdGVtIGRlc2NyaXB0aW9u
IG9iamVjdAo+ICAgICogQGxwcm9wczogTEVCIHByb3BlcnRpZXMgdG8gc2Nhbgo+ICAgICogQGlu
X3RyZWU6IHdoZXRoZXIgdGhlIExFQiBwcm9wZXJ0aWVzIGFyZSBpbiBtYWluIG1lbW9yeQo+IC0g
KiBAZGF0YTogaW5mb3JtYXRpb24gcGFzc2VkIHRvIGFuZCBmcm9tIHRoZSBjYWxsZXIgb2YgdGhl
IHNjYW4KPiArICogQGFyZzogaW5mb3JtYXRpb24gcGFzc2VkIHRvIGFuZCBmcm9tIHRoZSBjYWxs
ZXIgb2YgdGhlIHNjYW4KPiAgICAqCj4gICAgKiBUaGlzIGZ1bmN0aW9uIHJldHVybnMgYSBjb2Rl
IHRoYXQgaW5kaWNhdGVzIHdoZXRoZXIgdGhlIHNjYW4gc2hvdWxkIGNvbnRpbnVlCj4gICAgKiAo
JUxQVF9TQ0FOX0NPTlRJTlVFKSwgd2hldGhlciB0aGUgTEVCIHByb3BlcnRpZXMgc2hvdWxkIGJl
IGFkZGVkIHRvIHRoZSB0cmVlCj4gQEAgLTc3Myw3ICs3NzMsNyBAQCBpbnQgdWJpZnNfc2F2ZV9k
aXJ0eV9pZHhfbG51bXMoc3RydWN0IHViaWZzX2luZm8gKmMpCj4gICAgKiBAYzogdGhlIFVCSUZT
IGZpbGUtc3lzdGVtIGRlc2NyaXB0aW9uIG9iamVjdAo+ICAgICogQGxwcm9wczogTEVCIHByb3Bl
cnRpZXMgdG8gc2Nhbgo+ICAgICogQGluX3RyZWU6IHdoZXRoZXIgdGhlIExFQiBwcm9wZXJ0aWVz
IGFyZSBpbiBtYWluIG1lbW9yeQo+IC0gKiBAZGF0YTogaW5mb3JtYXRpb24gcGFzc2VkIHRvIGFu
ZCBmcm9tIHRoZSBjYWxsZXIgb2YgdGhlIHNjYW4KPiArICogQGFyZzogaW5mb3JtYXRpb24gcGFz
c2VkIHRvIGFuZCBmcm9tIHRoZSBjYWxsZXIgb2YgdGhlIHNjYW4KPiAgICAqCj4gICAgKiBUaGlz
IGZ1bmN0aW9uIHJldHVybnMgYSBjb2RlIHRoYXQgaW5kaWNhdGVzIHdoZXRoZXIgdGhlIHNjYW4g
c2hvdWxkIGNvbnRpbnVlCj4gICAgKiAoJUxQVF9TQ0FOX0NPTlRJTlVFKSwgd2hldGhlciB0aGUg
TEVCIHByb3BlcnRpZXMgc2hvdWxkIGJlIGFkZGVkIHRvIHRoZSB0cmVlCj4gZGlmZiAtLWdpdCBh
L2ZzL3ViaWZzL2xwcm9wcy5jIGIvZnMvdWJpZnMvbHByb3BzLmMKPiBpbmRleCBhMTFjM2RhYjdl
MTYuLjg3ODg3NDBlYzU3ZiAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9scHJvcHMuYwo+ICsrKyBi
L2ZzL3ViaWZzL2xwcm9wcy5jCj4gQEAgLTEwMDUsNyArMTAwNSw3IEBAIHZvaWQgZGJnX2NoZWNr
X2hlYXAoc3RydWN0IHViaWZzX2luZm8gKmMsIHN0cnVjdCB1Ymlmc19scHRfaGVhcCAqaGVhcCwg
aW50IGNhdCwKPiAgICAqIEBjOiB0aGUgVUJJRlMgZmlsZS1zeXN0ZW0gZGVzY3JpcHRpb24gb2Jq
ZWN0Cj4gICAgKiBAbHA6IExFQiBwcm9wZXJ0aWVzIHRvIHNjYW4KPiAgICAqIEBpbl90cmVlOiB3
aGV0aGVyIHRoZSBMRUIgcHJvcGVydGllcyBhcmUgaW4gbWFpbiBtZW1vcnkKPiAtICogQGxzdDog
bHByb3BzIHN0YXRpc3RpY3MgdG8gdXBkYXRlCj4gKyAqIEBhcmc6IGxwcm9wcyBzdGF0aXN0aWNz
IHRvIHVwZGF0ZQo+ICAgICoKPiAgICAqIFRoaXMgZnVuY3Rpb24gcmV0dXJucyBhIGNvZGUgdGhh
dCBpbmRpY2F0ZXMgd2hldGhlciB0aGUgc2NhbiBzaG91bGQgY29udGludWUKPiAgICAqICglTFBU
X1NDQU5fQ09OVElOVUUpLCB3aGV0aGVyIHRoZSBMRUIgcHJvcGVydGllcyBzaG91bGQgYmUgYWRk
ZWQgdG8gdGhlIHRyZWUKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
