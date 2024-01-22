Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36E6C4725D
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 09:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+qOi8nL0qVuE2hOOy0Udn14hPon+M6bpQEZwKMF8fm0=; b=0SYYEVDboFWMHzAF6BVnLmPCTi
	z9u/3bObC9adlEXgQs38Up0C32r5276Bv0PGza6DF5+sgyaq7yEQKa/a4FiHq8xJceNw5fxm6VvyJ
	VY97k5irsGKDkqaI8v4700iBiPkX8nOS9TKW+yn9pqg9fjx36WscvNG8e0oggpxvw58h7F3SNcNdH
	MW6gKijanSwxOu2nfOnE4l24iEe9VT5GpWQuqJsjr4BmoazXWXQeC5FcQbvMj0/xGEHPbUiP5lhVJ
	RM6iNGEtFiStvTGerT9ZUvZ+2G/tGrY5e6fKPexOntKzYhzFoI+JTDjXR8+qTjq2Us0zQlfq0ppOq
	4eXmxWfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRqeg-00BIZs-02;
	Mon, 22 Jan 2024 09:31:46 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRqed-00BIZ2-0h
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jan 2024 09:31:44 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4TJQ180M1GzvVG5;
	Mon, 22 Jan 2024 17:30:04 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 11DA118007A;
	Mon, 22 Jan 2024 17:31:34 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 17:31:33 +0800
Subject: Re: [PATCH 04/15] ubifs: Use a folio in do_truncation()
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
References: <20240120230824.2619716-1-willy@infradead.org>
 <20240120230824.2619716-5-willy@infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <cc5667c1-6df9-357f-425a-c5c3c8b1f15d@huawei.com>
Date: Mon, 22 Jan 2024 17:31:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240120230824.2619716-5-willy@infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_013143_421631_BD3CFBBA 
X-CRM114-Status: GOOD (  17.72  )
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

1NogMjAyNC8xLzIxIDc6MDgsIE1hdHRoZXcgV2lsY294IChPcmFjbGUpINC0tcA6Cj4gQ29udmVy
dCBmcm9tIHRoZSBvbGQgcGFnZSBBUElzIHRvIHRoZSBuZXcgZm9saW8gQVBJcyB3aGljaCBzYXZl
cwo+IGEgZmV3IGhpZGRlbiBjYWxscyB0byBjb21wb3VuZF9oZWFkKCkuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogTWF0dGhldyBXaWxjb3ggKE9yYWNsZSkgPHdpbGx5QGluZnJhZGVhZC5vcmc+Cj4gLS0t
Cj4gICBmcy91Ymlmcy9maWxlLmMgfCAyNCArKysrKysrKysrKystLS0tLS0tLS0tLS0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPiAKClJldmll
d2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgoKPiBkaWZmIC0t
Z2l0IGEvZnMvdWJpZnMvZmlsZS5jIGIvZnMvdWJpZnMvZmlsZS5jCj4gaW5kZXggN2QwOTY3ZGFk
ZWQzLi5iMjk3NTgyYzliNzUgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMvZmlsZS5jCj4gKysrIGIv
ZnMvdWJpZnMvZmlsZS5jCj4gQEAgLTExNTgsMTEgKzExNTgsMTEgQEAgc3RhdGljIGludCBkb190
cnVuY2F0aW9uKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+ICAg
Cj4gICAJaWYgKG9mZnNldCkgewo+ICAgCQlwZ29mZl90IGluZGV4ID0gbmV3X3NpemUgPj4gUEFH
RV9TSElGVDsKPiAtCQlzdHJ1Y3QgcGFnZSAqcGFnZTsKPiArCQlzdHJ1Y3QgZm9saW8gKmZvbGlv
Owo+ICAgCj4gLQkJcGFnZSA9IGZpbmRfbG9ja19wYWdlKGlub2RlLT5pX21hcHBpbmcsIGluZGV4
KTsKPiAtCQlpZiAocGFnZSkgewo+IC0JCQlpZiAoUGFnZURpcnR5KHBhZ2UpKSB7Cj4gKwkJZm9s
aW8gPSBmaWxlbWFwX2xvY2tfZm9saW8oaW5vZGUtPmlfbWFwcGluZywgaW5kZXgpOwo+ICsJCWlm
ICghSVNfRVJSKGZvbGlvKSkgewo+ICsJCQlpZiAoZm9saW9fdGVzdF9kaXJ0eShmb2xpbykpIHsK
PiAgIAkJCQkvKgo+ICAgCQkJCSAqICd1Ymlmc19qbmxfdHJ1bmNhdGUoKScgd2lsbCB0cnkgdG8g
dHJ1bmNhdGUKPiAgIAkJCQkgKiB0aGUgbGFzdCBkYXRhIG5vZGUsIGJ1dCBpdCBjb250YWlucwo+
IEBAIC0xMTcxLDE0ICsxMTcxLDE0IEBAIHN0YXRpYyBpbnQgZG9fdHJ1bmNhdGlvbihzdHJ1Y3Qg
dWJpZnNfaW5mbyAqYywgc3RydWN0IGlub2RlICppbm9kZSwKPiAgIAkJCQkgKiAndWJpZnNfam5s
X3RydW5jYXRlKCknIHdpbGwgc2VlIGFuIGFscmVhZHkKPiAgIAkJCQkgKiB0cnVuY2F0ZWQgKGFu
ZCB1cCB0byBkYXRlKSBkYXRhIG5vZGUuCj4gICAJCQkJICovCj4gLQkJCQl1Ymlmc19hc3NlcnQo
YywgUGFnZVByaXZhdGUocGFnZSkpOwo+ICsJCQkJdWJpZnNfYXNzZXJ0KGMsIGZvbGlvLT5wcml2
YXRlICE9IE5VTEwpOwo+ICAgCj4gLQkJCQljbGVhcl9wYWdlX2RpcnR5X2Zvcl9pbyhwYWdlKTsK
PiArCQkJCWZvbGlvX2NsZWFyX2RpcnR5X2Zvcl9pbyhmb2xpbyk7Cj4gICAJCQkJaWYgKFVCSUZT
X0JMT0NLU19QRVJfUEFHRV9TSElGVCkKPiAtCQkJCQlvZmZzZXQgPSBuZXdfc2l6ZSAmCj4gLQkJ
CQkJCSAoUEFHRV9TSVpFIC0gMSk7Cj4gLQkJCQllcnIgPSBkb193cml0ZXBhZ2UocGFnZSwgb2Zm
c2V0KTsKPiAtCQkJCXB1dF9wYWdlKHBhZ2UpOwo+ICsJCQkJCW9mZnNldCA9IG9mZnNldF9pbl9m
b2xpbyhmb2xpbywKPiArCQkJCQkJCW5ld19zaXplKTsKPiArCQkJCWVyciA9IGRvX3dyaXRlcGFn
ZSgmZm9saW8tPnBhZ2UsIG9mZnNldCk7Cj4gKwkJCQlmb2xpb19wdXQoZm9saW8pOwo+ICAgCQkJ
CWlmIChlcnIpCj4gICAJCQkJCWdvdG8gb3V0X2J1ZGc7Cj4gICAJCQkJLyoKPiBAQCAtMTE5MSw4
ICsxMTkxLDggQEAgc3RhdGljIGludCBkb190cnVuY2F0aW9uKHN0cnVjdCB1Ymlmc19pbmZvICpj
LCBzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+ICAgCQkJCSAqIHRvICd1Ymlmc19qbmxfdHJ1bmNhdGUo
KScgdG8gc2F2ZSBpdCBmcm9tCj4gICAJCQkJICogaGF2aW5nIHRvIHJlYWQgaXQuCj4gICAJCQkJ
ICovCj4gLQkJCQl1bmxvY2tfcGFnZShwYWdlKTsKPiAtCQkJCXB1dF9wYWdlKHBhZ2UpOwo+ICsJ
CQkJZm9saW9fdW5sb2NrKGZvbGlvKTsKPiArCQkJCWZvbGlvX3B1dChmb2xpbyk7Cj4gICAJCQl9
Cj4gICAJCX0KPiAgIAl9Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
