Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EA5C5320E
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 01:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/Sxby4TE/X85xVKPlJKmzati5kWFqnpBpeyXFhAjmE=; b=yk5rgI1kj03X7piFHQPX2SSagd
	8QySfuTT4yqIrAERBp2MYA23T/d5hxutCyvfOmkBJrrS2Pu1/CGinBQ7b/hbuoyl0GZ1oDTRdShbI
	bBI+p+AjpQ+7lhA5aoTLxEPi7AUhnoIhJlTpJT6ynFlUUv18302Jtmee4yZKZhJpIjQlVsbGCCQC2
	Xif6XiEI4lweXLODbHslT+zrZYKEhXfRgs1HhkwkPIyc6Qm0a/ynF7Iq7gPvDQvGurUZfpf1l20+W
	EAmbFT4ziTx2t32RfkHPuKDMNxisratHznZQN6TXOWP5S9RkqNhuOsmymKAKU0BGtz8Fh4e0OPQit
	K2d3dtaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siOMt-00000005Q5H-2geC;
	Mon, 26 Aug 2024 01:18:03 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siOMq-00000005Q29-1w2d
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 01:18:02 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WsXn201RKzpSwx;
	Mon, 26 Aug 2024 09:16:05 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 5DA7E1800A5;
	Mon, 26 Aug 2024 09:17:44 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 09:17:43 +0800
Subject: Re: [PATCH] mtd: ubi: remove unused parameter 'pnum' from
 add_volume()
To: Wang Zhaolong <wangzhaolong1@huawei.com>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>
References: <20240825083515.4074081-1-wangzhaolong1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <7ef4f6c2-feae-e98b-cc85-a9f92eadaa67@huawei.com>
Date: Mon, 26 Aug 2024 09:17:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240825083515.4074081-1-wangzhaolong1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_181801_267535_649109C2 
X-CRM114-Status: GOOD (  17.99  )
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

1NogMjAyNC84LzI1IDE2OjM1LCBXYW5nIFpoYW9sb25nINC0tcA6Cj4gVGhlIHBhcmFtZXRlciAn
cG51bScgaW4gdGhlIGZ1bmN0aW9uIGFkZF92b2x1bWUoKSBpcyBub3QgdXNlZCBpbnNpZGUgdGhl
Cj4gZnVuY3Rpb24gYm9keS4gVGhpcyBwYXRjaCByZW1vdmVzIHRoaXMgdW51c2VkIHBhcmFtZXRl
ciB0byBjbGVhbiB1cCB0aGUKPiBjb2RlIGFuZCBpbXByb3ZlIHJlYWRhYmlsaXR5Lgo+IAo+IFRo
aXMgY2hhbmdlIGRvZXMgbm90IGFmZmVjdCB0aGUgZnVuY3Rpb25hbGl0eSBvZiBhZGRfdm9sdW1l
KCkgb3IgYW55IG90aGVyCj4gcGFydCBvZiB0aGUgVUJJIHN1YnN5c3RlbSwgYXMgdGhlIHJlbW92
ZWQgcGFyYW1ldGVyIGlzIG5vdCB1dGlsaXplZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXYW5nIFpo
YW9sb25nIDx3YW5nemhhb2xvbmcxQGh1YXdlaS5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL210ZC91
YmkvYXR0YWNoLmMgfCA1ICsrLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8x
QGh1YXdlaS5jb20+Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3ViaS9hdHRhY2guYyBi
L2RyaXZlcnMvbXRkL3ViaS9hdHRhY2guYwo+IGluZGV4IGFlNWFiZTQ5MmI1Mi4uZmU5Nzg0Yzkw
ZWE0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3ViaS9hdHRhY2guYwo+ICsrKyBiL2RyaXZl
cnMvbXRkL3ViaS9hdHRhY2guYwo+IEBAIC0zOTMsOCArMzkzLDcgQEAgc3RhdGljIGludCB2YWxp
ZGF0ZV92aWRfaGRyKGNvbnN0IHN0cnVjdCB1YmlfZGV2aWNlICp1YmksCj4gICAgKiB0byB0aGUg
YWxsb2NhdGVkICJhdiIgb2JqZWN0IGluIGNhc2Ugb2Ygc3VjY2VzcyBhbmQgYSBuZWdhdGl2ZSBl
cnJvciBjb2RlIGluCj4gICAgKiBjYXNlIG9mIGZhaWx1cmUuCj4gICAgKi8KPiAtc3RhdGljIHN0
cnVjdCB1YmlfYWluZl92b2x1bWUgKmFkZF92b2x1bWUoc3RydWN0IHViaV9hdHRhY2hfaW5mbyAq
YWksCj4gLQkJCQkJICBpbnQgdm9sX2lkLCBpbnQgcG51bSwKPiArc3RhdGljIHN0cnVjdCB1Ymlf
YWluZl92b2x1bWUgKmFkZF92b2x1bWUoc3RydWN0IHViaV9hdHRhY2hfaW5mbyAqYWksIGludCB2
b2xfaWQsCj4gICAJCQkJCSAgY29uc3Qgc3RydWN0IHViaV92aWRfaGRyICp2aWRfaGRyKQo+ICAg
ewo+ICAgCXN0cnVjdCB1YmlfYWluZl92b2x1bWUgKmF2Owo+IEBAIC01NzYsNyArNTc1LDcgQEAg
aW50IHViaV9hZGRfdG9fYXYoc3RydWN0IHViaV9kZXZpY2UgKnViaSwgc3RydWN0IHViaV9hdHRh
Y2hfaW5mbyAqYWksIGludCBwbnVtLAo+ICAgCWRiZ19ibGQoIlBFQiAlZCwgTEVCICVkOiVkLCBF
QyAlZCwgc3FudW0gJWxsdSwgYml0ZmxpcHMgJWQiLAo+ICAgCQlwbnVtLCB2b2xfaWQsIGxudW0s
IGVjLCBzcW51bSwgYml0ZmxpcHMpOwo+ICAgCj4gLQlhdiA9IGFkZF92b2x1bWUoYWksIHZvbF9p
ZCwgcG51bSwgdmlkX2hkcik7Cj4gKwlhdiA9IGFkZF92b2x1bWUoYWksIHZvbF9pZCwgdmlkX2hk
cik7Cj4gICAJaWYgKElTX0VSUihhdikpCj4gICAJCXJldHVybiBQVFJfRVJSKGF2KTsKPiAgIAo+
IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
