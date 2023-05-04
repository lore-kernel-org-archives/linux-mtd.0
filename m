Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA77C7EE23
	for <linux-mtd@archiver.kernel.org>; Thu,  4 May 2023 12:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/AiKxAdjQ0cEqTcMul2KNBbIkTB1bWQEQq+5WG2v+0=; b=AL/mvKi+nulzQy3Hmoza1jCu99
	aWvz7bjOXQ/t2ABDM7mASX0sLOhKeFtymfVYU83Jq5utk9stjZ5OtdJTEpUwF0MCKBWBGXIfZBlM2
	7jpzpcyrFPsUcOMlr4/cS1GmYPvtsdFz8xY8U+D/tAcx1rdBwzInY7Wo5v23wX7CrCR9cUoD39aZM
	ByJOj/m55r1rEjaveddlQrnj0YTOMkgRa55CRwcdahnq3eMZrEn2fL8SVnWtNs5rWsbHtvZXgx6Ue
	HESwB6IRMVPOcThQxBdXmes6RZKCoPwG8yI82cnLy9HcYCcPQIlVLohACofy4lKMlmwPpYnnL1zyM
	ZdAE9+lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puXmm-007mdM-0p;
	Thu, 04 May 2023 12:10:12 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puXmj-007mcY-1n
	for linux-mtd@lists.infradead.org;
	Thu, 04 May 2023 12:10:10 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4QBswV0pM9zpSt7;
	Thu,  4 May 2023 20:06:02 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 20:10:05 +0800
Subject: Re: [PATCH -next,V2 2/2] ubi: Correct the number of PEBs after a
 volume resize failure
To: ZhaoLong Wang <wangzhaolong1@huawei.com>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>
References: <20230504025354.3595768-1-wangzhaolong1@huawei.com>
 <20230504025354.3595768-2-wangzhaolong1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <95408e5b-312c-0b51-e5b4-41fb34f552cd@huawei.com>
Date: Thu, 4 May 2023 20:10:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230504025354.3595768-2-wangzhaolong1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_051009_797527_1C3166A7 
X-CRM114-Status: GOOD (  14.57  )
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

1NogMjAyMy81LzQgMTA6NTMsIFpoYW9Mb25nIFdhbmcg0LS1wDoKPiBJbiB0aGUgZXJyb3IgaGFu
ZGluZyBwYXRoIGBvdXRfYWNjYCBvZiB0aGUgdWJpX3Jlc2l6ZV92b2x1bWUoKSwKPiB3aGVuIGBw
ZWJzIDwgMGAsIGl0IG1lYW5zIHRoYXQgdGhlIHZvbHVtZSB0YWJsZSByZWNvcmQgZmFpbHMgdG8g
YmUKPiB1cGRhdGVkIHdoZW4gdGhlIHZvbHVtZSBpcyBzaHJpbmtlZC4gSW4gdGhpcyBjYXNlLCB0
aGUgbnVtYmVyIG9mCj4gdWJpLT5hdmFpbF9wZWJzYCBhbmQgYHViaS0+cnN2ZF9wZWJzYCBzaG91
bGQgYWxzbyBiZSByZXN0b3JlZCwKPiBvdGhlcndpc2UgdGhlIFVCSSB3aWxsIGRpc3BsYXkgYW4g
aW5jb3JyZWN0IG51bWJlciBvZiBhdmFpbGFibGUgUEVCcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBa
aGFvTG9uZyBXYW5nIDx3YW5nemhhb2xvbmcxQGh1YXdlaS5jb20+Cj4gLS0tCj4gICBkcml2ZXJz
L210ZC91Ymkvdm10LmMgfCA5ICsrKystLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvdWJpL3Zt
dC5jIGIvZHJpdmVycy9tdGQvdWJpL3ZtdC5jCj4gaW5kZXggOTcyOTRkZWYwMWViLi45OTA1NzEy
ODdlODQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvdWJpL3ZtdC5jCj4gKysrIGIvZHJpdmVy
cy9tdGQvdWJpL3ZtdC5jCj4gQEAgLTUxNSwxMyArNTE1LDEyIEBAIGludCB1YmlfcmVzaXplX3Zv
bHVtZShzdHJ1Y3QgdWJpX3ZvbHVtZV9kZXNjICpkZXNjLCBpbnQgcmVzZXJ2ZWRfcGVicykKPiAg
IG91dF9hY2M6Cj4gICAJc3Bpbl9sb2NrKCZ1YmktPnZvbHVtZXNfbG9jayk7Cj4gICAJdm9sLT5y
ZXNlcnZlZF9wZWJzID0gcmVzZXJ2ZWRfcGVicyAtIHBlYnM7Cj4gLQlpZiAocGVicyA+IDApIHsK
PiAtCQl1YmktPnJzdmRfcGVicyAtPSBwZWJzOwo+IC0JCXViaS0+YXZhaWxfcGVicyArPSBwZWJz
Owo+ICsJdWJpLT5yc3ZkX3BlYnMgLT0gcGViczsKPiArCXViaS0+YXZhaWxfcGVicyArPSBwZWJz
Owo+ICsJaWYgKHBlYnMgPiAwKQo+ICAgCQl1YmlfZWJhX2NvcHlfdGFibGUodm9sLCBvbGRfZWJh
X3RibCwgdm9sLT5yZXNlcnZlZF9wZWJzKTsKPiAtCX0gZWxzZSB7Cj4gKwllbHNlCj4gICAJCXVi
aV9lYmFfY29weV90YWJsZSh2b2wsIG9sZF9lYmFfdGJsLCByZXNlcnZlZF9wZWJzKTsKPiAtCX0K
PiAgIAl2b2wtPmViYV90YmwgPSBvbGRfZWJhX3RibDsKPiAgIAlzcGluX3VubG9jaygmdWJpLT52
b2x1bWVzX2xvY2spOwo+ICAgb3V0X2ZyZWU6Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
