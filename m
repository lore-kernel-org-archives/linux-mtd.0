Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B50BCA0EC4
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Aug 2025 03:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQKNEE0Gceuzeu7uRvyzCLsxz+KyR6Fbpa7EFsLvFfI=; b=20bD8lioi2iyAXlJ8dKUTbtVHJ
	SBwIkirXyldPiYRuL9NAvhSRa9Of4hdQfdhuueJEO2IKoxgEXiYb8CyIK2YZs6MKf8cfyqTLqyNWp
	nuzZATITxfFCMe0zHfXIvromiTC6PlNyMP3ndZnzsFzH6Zbr8lQlDI471eTPg93IQClxCn0Z/MNEe
	H2F7iu1Ap1YcxwG5FwMw8H/uqvKcb/bxoDPPBCtaUAArtuVewBqMF5cLgZyy8bI4w8kXZyzxJZt9M
	fjlGCVgAXDtPlNfq2OPj0OhencOuzt/wXkQYdJmji4KoxSBZ7TCzKEQUhi5Z+9BGLAcpScRUOi6oG
	vs4l15yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulfNn-00000009gWZ-0qxF;
	Tue, 12 Aug 2025 03:09:03 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulfLQ-00000009g9x-2vPp
	for linux-mtd@lists.infradead.org;
	Tue, 12 Aug 2025 03:06:38 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4c1GVl2bXsz14MRF;
	Tue, 12 Aug 2025 11:01:35 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 2E1C8180064;
	Tue, 12 Aug 2025 11:06:34 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 12 Aug 2025 11:06:33 +0800
Subject: Re: [PATCH v2 2/2] ubifs: Simplify the code using ubifs_crc_node
To: Xichao Zhao <zhao.xichao@vivo.com>, Richard Weinberger <richard@nod.at>,
	"open list:UBI FILE SYSTEM (UBIFS)" <linux-mtd@lists.infradead.org>, open
 list <linux-kernel@vger.kernel.org>
References: <20250812021009.414756-1-zhao.xichao@vivo.com>
 <20250812021009.414756-3-zhao.xichao@vivo.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <b0c99eb4-ff3d-cfa9-5f4d-92d138e688a7@huawei.com>
Date: Tue, 12 Aug 2025 11:06:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250812021009.414756-3-zhao.xichao@vivo.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_200637_034626_CBF9831D 
X-CRM114-Status: GOOD (  16.87  )
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

1NogMjAyNS84LzEyIDEwOjEwLCBYaWNoYW8gWmhhbyDQtLXAOgo+IFJlcGxhY2UgcGFydCBvZiB0
aGUgY29kZSB1c2luZyB1Ymlmc19jcmNfbm9kZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBYaWNoYW8g
WmhhbyA8emhhby54aWNoYW9Adml2by5jb20+Cj4gLS0tCj4gICBmcy91Ymlmcy9pby5jICAgICAg
IHwgOSArKy0tLS0tLS0KPiAgIGZzL3ViaWZzL3JlY292ZXJ5LmMgfCA0ICstLS0KPiAgIDIgZmls
ZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiAKClJldmlld2Vk
LWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IGRpZmYgLS1naXQg
YS9mcy91Ymlmcy9pby5jIGIvZnMvdWJpZnMvaW8uYwo+IGluZGV4IGUwZGZlNjgyN2Q2NS4uNmM2
ZDY4MjQyNzc5IDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL2lvLmMKPiArKysgYi9mcy91Ymlmcy9p
by5jCj4gQEAgLTMyNyw4ICszMjcsNiBAQCBpbnQgdWJpZnNfY2hlY2tfbm9kZShjb25zdCBzdHJ1
Y3QgdWJpZnNfaW5mbyAqYywgY29uc3Qgdm9pZCAqYnVmLCBpbnQgbGVuLAo+ICAgICovCj4gICB2
b2lkIHViaWZzX3BhZChjb25zdCBzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgdm9pZCAqYnVmLCBpbnQg
cGFkKQo+ICAgewo+IC0JdWludDMyX3QgY3JjOwo+IC0KPiAgIAl1Ymlmc19hc3NlcnQoYywgcGFk
ID49IDApOwo+ICAgCj4gICAJaWYgKHBhZCA+PSBVQklGU19QQURfTk9ERV9TWikgewo+IEBAIC0z
NDMsOCArMzQxLDcgQEAgdm9pZCB1Ymlmc19wYWQoY29uc3Qgc3RydWN0IHViaWZzX2luZm8gKmMs
IHZvaWQgKmJ1ZiwgaW50IHBhZCkKPiAgIAkJY2gtPmxlbiA9IGNwdV90b19sZTMyKFVCSUZTX1BB
RF9OT0RFX1NaKTsKPiAgIAkJcGFkIC09IFVCSUZTX1BBRF9OT0RFX1NaOwo+ICAgCQlwYWRfbm9k
ZS0+cGFkX2xlbiA9IGNwdV90b19sZTMyKHBhZCk7Cj4gLQkJY3JjID0gY3JjMzIoVUJJRlNfQ1JD
MzJfSU5JVCwgYnVmICsgOCwgVUJJRlNfUEFEX05PREVfU1ogLSA4KTsKPiAtCQljaC0+Y3JjID0g
Y3B1X3RvX2xlMzIoY3JjKTsKPiArCQl1Ymlmc19jcmNfbm9kZShidWYsIFVCSUZTX1BBRF9OT0RF
X1NaKTsKPiAgIAkJbWVtc2V0KGJ1ZiArIFVCSUZTX1BBRF9OT0RFX1NaLCAwLCBwYWQpOwo+ICAg
CX0gZWxzZSBpZiAocGFkID4gMCkKPiAgIAkJLyogVG9vIGxpdHRsZSBzcGFjZSwgcGFkZGluZyBu
b2RlIHdvbid0IGZpdCAqLwo+IEBAIC00NjksNyArNDY2LDYgQEAgdm9pZCB1Ymlmc19wcmVwYXJl
X25vZGUoc3RydWN0IHViaWZzX2luZm8gKmMsIHZvaWQgKm5vZGUsIGludCBsZW4sIGludCBwYWQp
Cj4gICAgKi8KPiAgIHZvaWQgdWJpZnNfcHJlcF9ncnBfbm9kZShzdHJ1Y3QgdWJpZnNfaW5mbyAq
Yywgdm9pZCAqbm9kZSwgaW50IGxlbiwgaW50IGxhc3QpCj4gICB7Cj4gLQl1aW50MzJfdCBjcmM7
Cj4gICAJc3RydWN0IHViaWZzX2NoICpjaCA9IG5vZGU7Cj4gICAJdW5zaWduZWQgbG9uZyBsb25n
IHNxbnVtID0gbmV4dF9zcW51bShjKTsKPiAgIAo+IEBAIC00ODMsOCArNDc5LDcgQEAgdm9pZCB1
Ymlmc19wcmVwX2dycF9ub2RlKHN0cnVjdCB1Ymlmc19pbmZvICpjLCB2b2lkICpub2RlLCBpbnQg
bGVuLCBpbnQgbGFzdCkKPiAgIAkJY2gtPmdyb3VwX3R5cGUgPSBVQklGU19JTl9OT0RFX0dST1VQ
Owo+ICAgCWNoLT5zcW51bSA9IGNwdV90b19sZTY0KHNxbnVtKTsKPiAgIAljaC0+cGFkZGluZ1sw
XSA9IGNoLT5wYWRkaW5nWzFdID0gMDsKPiAtCWNyYyA9IGNyYzMyKFVCSUZTX0NSQzMyX0lOSVQs
IG5vZGUgKyA4LCBsZW4gLSA4KTsKPiAtCWNoLT5jcmMgPSBjcHVfdG9fbGUzMihjcmMpOwo+ICsJ
dWJpZnNfY3JjX25vZGUobm9kZSwgbGVuKTsKPiAgIH0KPiAgIAo+ICAgLyoqCj4gZGlmZiAtLWdp
dCBhL2ZzL3ViaWZzL3JlY292ZXJ5LmMgYi9mcy91Ymlmcy9yZWNvdmVyeS5jCj4gaW5kZXggZjBk
NTFkZDIxYzllLi5iMzZkYzliMDMyZjQgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMvcmVjb3Zlcnku
Ywo+ICsrKyBiL2ZzL3ViaWZzL3JlY292ZXJ5LmMKPiBAQCAtMTQwNiw3ICsxNDA2LDYgQEAgc3Rh
dGljIGludCBmaXhfc2l6ZV9pbl9wbGFjZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgc3RydWN0IHNp
emVfZW50cnkgKmUpCj4gICAJdW5pb24gdWJpZnNfa2V5IGtleTsKPiAgIAlpbnQgZXJyLCBsbnVt
LCBvZmZzLCBsZW47Cj4gICAJbG9mZl90IGlfc2l6ZTsKPiAtCXVpbnQzMl90IGNyYzsKPiAgIAo+
ICAgCS8qIExvY2F0ZSB0aGUgaW5vZGUgbm9kZSBMRUIgbnVtYmVyIGFuZCBvZmZzZXQgKi8KPiAg
IAlpbm9fa2V5X2luaXQoYywgJmtleSwgZS0+aW51bSk7Cj4gQEAgLTE0MjgsOCArMTQyNyw3IEBA
IHN0YXRpYyBpbnQgZml4X3NpemVfaW5fcGxhY2Uoc3RydWN0IHViaWZzX2luZm8gKmMsIHN0cnVj
dCBzaXplX2VudHJ5ICplKQo+ICAgCWlubyA9IGMtPnNidWYgKyBvZmZzOwo+ICAgCWluby0+c2l6
ZSA9IGNwdV90b19sZTY0KGUtPmRfc2l6ZSk7Cj4gICAJbGVuID0gbGUzMl90b19jcHUoaW5vLT5j
aC5sZW4pOwo+IC0JY3JjID0gY3JjMzIoVUJJRlNfQ1JDMzJfSU5JVCwgKHZvaWQgKilpbm8gKyA4
LCBsZW4gLSA4KTsKPiAtCWluby0+Y2guY3JjID0gY3B1X3RvX2xlMzIoY3JjKTsKPiArCXViaWZz
X2NyY19ub2RlKCh2b2lkICopaW5vLCBsZW4pOwo+ICAgCS8qIFdvcmsgb3V0IHdoZXJlIGRhdGEg
aW4gdGhlIExFQiBlbmRzIGFuZCBmcmVlIHNwYWNlIGJlZ2lucyAqLwo+ICAgCXAgPSBjLT5zYnVm
Owo+ICAgCWxlbiA9IGMtPmxlYl9zaXplIC0gMTsKPiAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
