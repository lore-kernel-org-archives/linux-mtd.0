Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0FECDB478
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 03:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Z9Qd0lTbYuMjk4imX/hkVcLmHVYNnXMjmUCyK3UOgk=; b=ZcucK0JTO/d7mPbKwSpUnzBUza
	IM9x1JAuW/fH72+99vTIcLKwafMKdVNqGz6CRBh9Vvw8VGWgwUEo72H6AzqWQ1Uxfg/GWm284QQGE
	qKYKPF/+lwbSGwrZKluYUD7B8rtZDfHHI0oX7DRzERuQ16WOC2Qj37SUbSaP4EJFPrk0Z6ioxudHE
	R1vorgi/LGiLKTo7Lf0SUpqsq96ONcDeyddHvcVOf5dEiRfQzRjJjNNDQt5FyBPcSu7TIHGWUWHUc
	H8D2rWjaEJ47jY+sNC/vMmGdu/6yltIMrlJt54+SBXua6EXT3AnmTCtqkcG4s+W+dOS1q5mXe6gL7
	xSUpFERQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkHh-0000000BSOt-38Tg;
	Fri, 14 Nov 2025 03:15:37 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkHe-0000000BSNz-3sUX
	for linux-mtd@lists.infradead.org;
	Fri, 14 Nov 2025 03:15:36 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=JiLmQUPAHZq7EDOgq/BpCT2GO71mr9lugu5nNevD4vE=;
	b=Grp0m8KsRuqGbHzbsi5vNJ8r/JBidSk9BzDWhcg0/9Zqncc7q9XAmrnQXpH1nIsLtKb/8hLQy
	yRPd4ZRVeiG4AihJtcRdlosNbdqBr1lQJN39JCx7iOJEcu8TK4hq/jhF4mJ9yhXuRmT6572IQSF
	E8tgkfKHkplrlwQR8EpCePM=
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4d72KR0XV9znTWj
	for <linux-mtd@lists.infradead.org>; Fri, 14 Nov 2025 11:13:47 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 813C9140277
	for <linux-mtd@lists.infradead.org>; Fri, 14 Nov 2025 11:15:17 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 14 Nov 2025 11:15:16 +0800
Subject: Re: [PATCH mtd-utils 1/2] fsck.ubifs: don't use pointers that
 reference out-of-scope variables
To: Yuta Hayama <hayama@lineo.co.jp>, <linux-mtd@lists.infradead.org>
References: <9276ac09-7c7d-41df-9ee2-094f1c8edf93@lineo.co.jp>
 <0828e7c7-c036-49ad-9019-8f94b6a87c27@lineo.co.jp>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <bcb5c4f2-e017-d6b7-a0fc-1c5dd51d08ec@huawei.com>
Date: Fri, 14 Nov 2025 11:15:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0828e7c7-c036-49ad-9019-8f94b6a87c27@lineo.co.jp>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_191535_383588_2A6ACAA2 
X-CRM114-Status: GOOD (  14.07  )
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

1NogMjAyNS8xMS8xMyAxNjozMSwgWXV0YSBIYXlhbWEg0LS1wDoKPiBzbiBpcyBhIHJlZmVyZW5j
ZSB0byBlaXRoZXIgYW4gaW5vX25vZGUsIGRlbnRfbm9kZSwgb3IgZGF0YV9ub2RlLiBXaGVuIHNu
Cj4gaXMgYWN0dWFsbHkgdXNlZCBpbiBjYWxscyB0byBkYmdfZnNjaygpIG9yIGluc2VydF9vcl91
cGRhdGVfZmlsZSgpLCB0aGVzZQo+IHZhcmlhYmxlcyBtdXN0IG5vdCBiZSBvdXQgb2Ygc2NvcGUu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogWXV0YSBIYXlhbWEgPGhheWFtYUBsaW5lby5jby5qcD4KPiAt
LS0KPiAgIHViaWZzLXV0aWxzL2ZzY2sudWJpZnMvY2hlY2tfZmlsZXMuYyB8IDkgKysrLS0tLS0t
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAoK
VGhhbmtzIGZvciBmaXhpbmcgaXQuCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3po
aWhhbzFAaHVhd2VpLmNvbT4KCj4gZGlmZiAtLWdpdCBhL3ViaWZzLXV0aWxzL2ZzY2sudWJpZnMv
Y2hlY2tfZmlsZXMuYyBiL3ViaWZzLXV0aWxzL2ZzY2sudWJpZnMvY2hlY2tfZmlsZXMuYwo+IGlu
ZGV4IDFlMWE3N2IuLjU0MzAwYTMgMTAwNjQ0Cj4gLS0tIGEvdWJpZnMtdXRpbHMvZnNjay51Ymlm
cy9jaGVja19maWxlcy5jCj4gKysrIGIvdWJpZnMtdXRpbHMvZnNjay51Ymlmcy9jaGVja19maWxl
cy5jCj4gQEAgLTU3LDEyICs1NywxMyBAQCBzdGF0aWMgaW50IGNvbnN0cnVjdF9maWxlKHN0cnVj
dCB1Ymlmc19pbmZvICpjLCB1bmlvbiB1Ymlmc19rZXkgKmtleSwKPiAgIAlzdHJ1Y3QgcmJfcm9v
dCAqdHJlZSA9ICZGU0NLKGMpLT5zY2FubmVkX2ZpbGVzOwo+ICAgCXN0cnVjdCBzY2FubmVkX25v
ZGUgKnNuID0gTlVMTDsKPiAgIAlzdHJ1Y3QgdWJpZnNfY2ggKmNoID0gKHN0cnVjdCB1Ymlmc19j
aCAqKW5vZGU7Cj4gKwlzdHJ1Y3Qgc2Nhbm5lZF9pbm9fbm9kZSBpbm9fbm9kZTsKPiArCXN0cnVj
dCBzY2FubmVkX2RlbnRfbm9kZSBkZW50X25vZGU7Cj4gKwlzdHJ1Y3Qgc2Nhbm5lZF9kYXRhX25v
ZGUgZGF0YV9ub2RlOwo+ICAgCj4gICAJc3dpdGNoIChjaC0+bm9kZV90eXBlKSB7Cj4gICAJY2Fz
ZSBVQklGU19JTk9fTk9ERToKPiAgIAl7Cj4gLQkJc3RydWN0IHNjYW5uZWRfaW5vX25vZGUgaW5v
X25vZGU7Cj4gLQo+ICAgCQlpZiAoIXBhcnNlX2lub19ub2RlKGMsIGxudW0sIG9mZnMsIG5vZGUs
IGtleSwgJmlub19ub2RlKSkgewo+ICAgCQkJaWYgKGZpeF9wcm9ibGVtKGMsIElOVkFMSURfSU5P
X05PREUsIE5VTEwpKQo+ICAgCQkJCXJldHVybiBhZGRfaW52YWxpZF9ub2RlKGMsIGtleSwgbG51
bSwgb2ZmcywgaXRlcik7Cj4gQEAgLTc0LDggKzc1LDYgQEAgc3RhdGljIGludCBjb25zdHJ1Y3Rf
ZmlsZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgdW5pb24gdWJpZnNfa2V5ICprZXksCj4gICAJY2Fz
ZSBVQklGU19ERU5UX05PREU6Cj4gICAJY2FzZSBVQklGU19YRU5UX05PREU6Cj4gICAJewo+IC0J
CXN0cnVjdCBzY2FubmVkX2RlbnRfbm9kZSBkZW50X25vZGU7Cj4gLQo+ICAgCQlpZiAoIXBhcnNl
X2RlbnRfbm9kZShjLCBsbnVtLCBvZmZzLCBub2RlLCBrZXksICZkZW50X25vZGUpKSB7Cj4gICAJ
CQlpZiAoZml4X3Byb2JsZW0oYywgSU5WQUxJRF9ERU5UX05PREUsIE5VTEwpKQo+ICAgCQkJCXJl
dHVybiBhZGRfaW52YWxpZF9ub2RlKGMsIGtleSwgbG51bSwgb2ZmcywgaXRlcik7Cj4gQEAgLTg2
LDggKzg1LDYgQEAgc3RhdGljIGludCBjb25zdHJ1Y3RfZmlsZShzdHJ1Y3QgdWJpZnNfaW5mbyAq
YywgdW5pb24gdWJpZnNfa2V5ICprZXksCj4gICAJfQo+ICAgCWNhc2UgVUJJRlNfREFUQV9OT0RF
Ogo+ICAgCXsKPiAtCQlzdHJ1Y3Qgc2Nhbm5lZF9kYXRhX25vZGUgZGF0YV9ub2RlOwo+IC0KPiAg
IAkJaWYgKCFwYXJzZV9kYXRhX25vZGUoYywgbG51bSwgb2Zmcywgbm9kZSwga2V5LCAmZGF0YV9u
b2RlKSkgewo+ICAgCQkJaWYgKGZpeF9wcm9ibGVtKGMsIElOVkFMSURfREFUQV9OT0RFLCBOVUxM
KSkKPiAgIAkJCQlyZXR1cm4gYWRkX2ludmFsaWRfbm9kZShjLCBrZXksIGxudW0sIG9mZnMsIGl0
ZXIpOwo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
