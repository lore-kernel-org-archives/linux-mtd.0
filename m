Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F954CA0EDB
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Aug 2025 03:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HzcXoHLpacUxZNpXgHcGpQoy0KcE28vIWj8SH6XnoFY=; b=tDXfdnhPzPXA5ICBw7MrvGraO5
	T0BpbohPU7UIHhQm20jAp79oUX1uh6SzkxUHeThY7TdC7MRpsFss5rNIZfi3f1AF9qQPGnwiGHDTy
	w0SAWct5OGBCtNSJmPjgV2M1nW4USZ+Ls8bbeRFdQyLRIHgy9wFJ0e+25/8z1dT/CAQ8mFKyCvg4S
	P65ZyQlP0EaKqb0M3v93O/HJPl9KVwTXx3EC1rGkrnle3eMIFx7wXAYEXKq0K8BG1BP2/x21mNwR6
	SDfwhGIDIwc4vio3l7sJc2OrBHZFuVtozrEBhsVCOZlEAfDmmJMQShcX4z1a1cJc1F6IiLatRNqWN
	+V3DzBJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulfNm-00000009gWD-2heH;
	Tue, 12 Aug 2025 03:09:02 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulfLF-00000009g7x-3TdD
	for linux-mtd@lists.infradead.org;
	Tue, 12 Aug 2025 03:06:27 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4c1GY01m91z1R7pJ;
	Tue, 12 Aug 2025 11:03:32 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 9AF2A180044;
	Tue, 12 Aug 2025 11:06:21 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 12 Aug 2025 11:06:21 +0800
Subject: Re: [PATCH v2 1/2] ubifs: Remove unnecessary parameters '*c'
To: Xichao Zhao <zhao.xichao@vivo.com>, Richard Weinberger <richard@nod.at>,
	"open list:UBI FILE SYSTEM (UBIFS)" <linux-mtd@lists.infradead.org>, open
 list <linux-kernel@vger.kernel.org>
References: <20250812021009.414756-1-zhao.xichao@vivo.com>
 <20250812021009.414756-2-zhao.xichao@vivo.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <be8c49cd-82e9-10ff-30d6-f5dfd461d731@huawei.com>
Date: Tue, 12 Aug 2025 11:06:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250812021009.414756-2-zhao.xichao@vivo.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_200626_054318_74D3E8BE 
X-CRM114-Status: GOOD (  14.37  )
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

1NogMjAyNS84LzEyIDEwOjEwLCBYaWNoYW8gWmhhbyDQtLXAOgo+IEJlY2F1c2UgdGhlIHZhcmlh
YmxlICpjIGlzIG5vdCB1c2VkIHdpdGhpbiB0aGUgZnVuY3Rpb24sCj4gcmVtb3ZlIGl0IGZyb20g
dGhlIHViaWZzX2NyY19ub2RlIGZ1bmN0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFhpY2hhbyBa
aGFvIDx6aGFvLnhpY2hhb0B2aXZvLmNvbT4KPiAtLS0KPiAgIGZzL3ViaWZzL2lvLmMgICAgfCA0
ICsrLS0KPiAgIGZzL3ViaWZzL3ViaWZzLmggfCAyICstCj4gICAyIGZpbGVzIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcg
PGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IAo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9pby5j
IGIvZnMvdWJpZnMvaW8uYwo+IGluZGV4IGE3OWYyMjlkZjQ3NS4uZTBkZmU2ODI3ZDY1IDEwMDY0
NAo+IC0tLSBhL2ZzL3ViaWZzL2lvLmMKPiArKysgYi9mcy91Ymlmcy9pby5jCj4gQEAgLTM5NSw3
ICszOTUsNyBAQCB2b2lkIHViaWZzX2luaXRfbm9kZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgdm9p
ZCAqbm9kZSwgaW50IGxlbiwgaW50IHBhZCkKPiAgIAl9Cj4gICB9Cj4gICAKPiAtdm9pZCB1Ymlm
c19jcmNfbm9kZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgdm9pZCAqbm9kZSwgaW50IGxlbikKPiAr
dm9pZCB1Ymlmc19jcmNfbm9kZSh2b2lkICpub2RlLCBpbnQgbGVuKQo+ICAgewo+ICAgCXN0cnVj
dCB1Ymlmc19jaCAqY2ggPSBub2RlOwo+ICAgCXVpbnQzMl90IGNyYzsKPiBAQCAtNDMyLDcgKzQz
Miw3IEBAIGludCB1Ymlmc19wcmVwYXJlX25vZGVfaG1hYyhzdHJ1Y3QgdWJpZnNfaW5mbyAqYywg
dm9pZCAqbm9kZSwgaW50IGxlbiwKPiAgIAkJCXJldHVybiBlcnI7Cj4gICAJfQo+ICAgCj4gLQl1
Ymlmc19jcmNfbm9kZShjLCBub2RlLCBsZW4pOwo+ICsJdWJpZnNfY3JjX25vZGUobm9kZSwgbGVu
KTsKPiAgIAo+ICAgCXJldHVybiAwOwo+ICAgfQo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy91Ymlm
cy5oIGIvZnMvdWJpZnMvdWJpZnMuaAo+IGluZGV4IDVkYjQ1YzllMjZlZS4uNWQxNzI1MDkwOTFh
IDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL3ViaWZzLmgKPiArKysgYi9mcy91Ymlmcy91Ymlmcy5o
Cj4gQEAgLTE3NDMsNyArMTc0Myw3IEBAIGludCB1Ymlmc193cml0ZV9ub2RlX2htYWMoc3RydWN0
IHViaWZzX2luZm8gKmMsIHZvaWQgKmJ1ZiwgaW50IGxlbiwgaW50IGxudW0sCj4gICBpbnQgdWJp
ZnNfY2hlY2tfbm9kZShjb25zdCBzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgY29uc3Qgdm9pZCAqYnVm
LCBpbnQgbGVuLAo+ICAgCQkgICAgIGludCBsbnVtLCBpbnQgb2ZmcywgaW50IHF1aWV0LCBpbnQg
bXVzdF9jaGtfY3JjKTsKPiAgIHZvaWQgdWJpZnNfaW5pdF9ub2RlKHN0cnVjdCB1Ymlmc19pbmZv
ICpjLCB2b2lkICpidWYsIGludCBsZW4sIGludCBwYWQpOwo+IC12b2lkIHViaWZzX2NyY19ub2Rl
KHN0cnVjdCB1Ymlmc19pbmZvICpjLCB2b2lkICpidWYsIGludCBsZW4pOwo+ICt2b2lkIHViaWZz
X2NyY19ub2RlKHZvaWQgKmJ1ZiwgaW50IGxlbik7Cj4gICB2b2lkIHViaWZzX3ByZXBhcmVfbm9k
ZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgdm9pZCAqYnVmLCBpbnQgbGVuLCBpbnQgcGFkKTsKPiAg
IGludCB1Ymlmc19wcmVwYXJlX25vZGVfaG1hYyhzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgdm9pZCAq
bm9kZSwgaW50IGxlbiwKPiAgIAkJCSAgICBpbnQgaG1hY19vZmZzLCBpbnQgcGFkKTsKPiAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
