Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116B4C4345F
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2024 11:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYZMs58nuwXsf3uZlUBLDDA+RDasIMVYjlr60yEpiLY=; b=2RanSYHpgf05qb3zA/SaN8Hsar
	FDiO0Ym0WSvFPyhwAbK4Asb5BG2PD9j2DJYeOxIwc4aNth04dRU23X9PqPqBnFL4MKp8nNGe4aDEV
	TsSFvRuHVuTEYa0+tSZjNqYDKLOcjeDOoZfIt/Kz34koiexQIkPRbemDPc5RbVh0Q/nV9klTJrmmQ
	AnatZIR8nkAXIzKV8NdsipQSvn5THVcyC0UjOQZBngbk4f+DxaDK3IWxUpTtn/taMSnqsf/cKfucB
	GOfQGx3D9QGl69gF4qmEh//ty8HjI/rRwC/zAVVBj9hqVg1WTp1KHBszy5ZIVtEJhcS1vjGMC/ZMg
	CCbBHyfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx3N1-0000000FlpI-1xHp;
	Wed, 17 Apr 2024 11:22:31 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx3Mx-0000000Flmg-2fb7
	for linux-mtd@lists.infradead.org;
	Wed, 17 Apr 2024 11:22:29 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4VKJN80vj2z1xtxF;
	Wed, 17 Apr 2024 19:19:52 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 727FE1A016F;
	Wed, 17 Apr 2024 19:22:15 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 19:22:14 +0800
Subject: Re: [PATCH V3] ubifs: correct UBIFS_DFS_DIR_LEN macro definition and
 improve code clarity
To: ZhaoLong Wang <wangzhaolong1@huawei.com>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>, <yangerkun@huawei.com>
References: <20240417092727.3803910-1-wangzhaolong1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <e4bd7fcd-f740-b2f1-ad20-63860db9fa38@huawei.com>
Date: Wed, 17 Apr 2024 19:22:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240417092727.3803910-1-wangzhaolong1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_042227_857773_B195DAB3 
X-CRM114-Status: GOOD (  18.29  )
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

1NogMjAyNC80LzE3IDE3OjI3LCBaaGFvTG9uZyBXYW5nINC0tcA6Cj4gVGhlIFVCSUZTX0RGU19E
SVJfTEVOIG1hY3JvLCB3aGljaCBkZWZpbmVzIHRoZSBtYXhpbXVtIGxlbmd0aCBvZiB0aGUgVUJJ
RlMKPiBkZWJ1Z2ZzIGRpcmVjdG9yeSBuYW1lLCBoYXMgYW4gaW5jb3JyZWN0IGZvcm11bGEgYW5k
IG1pc2xlYWRpbmcgY29tbWVudHMuCj4gVGhlIGN1cnJlbnQgZm9ybXVsYSBpcyAoMyArIDEgKyAy
KjIgKyAxKSwgd2hpY2ggYXNzdW1lcyB0aGF0IGJvdGggVUJJIGRldmljZQo+IG51bWJlciBhbmQg
dm9sdW1lIElEIGFyZSBsaW1pdGVkIHRvIDIgY2hhcmFjdGVycy4gSG93ZXZlciwgVUJJIGRldmlj
ZSBudW1iZXIKPiByYW5nZXMgZnJvbSAwIHRvIDM3ICgyIGNoYXJhY3RlcnMpLCBhbmQgdm9sdW1l
IElEIHJhbmdlcyBmcm9tIDAgdG8gMTI3ICh1cAoKVUJJIGRldmljZSBudW1iZXIgcmFuZ2VzIGZy
b20gMH4zMT8gVUJJX01BWF9ERVZJQ0VTKDMyKQo+IHRvIDMgY2hhcmFjdGVycykuCj4gCj4gQWx0
aG91Z2ggdGhlIGN1cnJlbnQgY29kZSB3b3JrcyBkdWUgdG8gdGhlIGNhbmNlbGxhdGlvbiBvZiBt
YXRoZW1hdGljYWwKPiBlcnJvcnMgKDkgKyAxID0gMTAsIHdoaWNoIG1hdGNoZXMgdGhlIGNvcnJl
Y3QgVUJJRlNfREZTX0RJUl9MRU4gdmFsdWUpLCBpdAo+IGNhbiBsZWFkIHRvIGNvbmZ1c2lvbiBh
bmQgcG90ZW50aWFsIGlzc3VlcyBpbiB0aGUgZnV0dXJlLgo+IAo+IFRoaXMgcGF0Y2ggYWltcyB0
byBpbXByb3ZlIHRoZSBjb2RlIGNsYXJpdHkgYW5kIG1haW50YWluYWJpbGl0eSBieSBtYWtpbmcK
PiB0aGUgZm9sbG93aW5nIGNoYW5nZXM6Cj4gCj4gMS4gQ29ycmVjdHMgdGhlIFVCSUZTX0RGU19E
SVJfTEVOIG1hY3JvIGRlZmluaXRpb24gdG8gKDMgKyAxICsgMiArIDMgKyAxKSwKPiAgICAgYWNj
b21tb2RhdGluZyB0aGUgbWF4aW11bSBsZW5ndGhzIG9mIGJvdGggVUJJIGRldmljZSBudW1iZXIg
YW5kIHZvbHVtZSBJRCwKPiAgICAgcGx1cyB0aGUgc2VwYXJhdG9ycyBhbmQgbnVsbCB0ZXJtaW5h
dG9yLgo+IDIuIFVwZGF0ZXMgdGhlIHNucHJpbnRmIGNhbGxzIHRvIHVzZSBVQklGU19ERlNfRElS
X0xFTiBpbnN0ZWFkIG9mCj4gICAgIFVCSUZTX0RGU19ESVJfTEVOICsgMSwgcmVtb3ZpbmcgdGhl
IHVubmVjZXNzYXJ5ICsxLgo+IDMuIE1vZGlmaWVzIHRoZSBlcnJvciBjaGVja3MgdG8gY29tcGFy
ZSBhZ2FpbnN0IFVCSUZTX0RGU19ESVJfTEVOIHVzaW5nID49Cj4gICAgIGluc3RlYWQgb2YgPiwg
YWxpZ25pbmcgd2l0aCB0aGUgY29ycmVjdGVkIG1hY3JvIGRlZmluaXRpb24uCj4gNC4gUmVtb3Zl
cyB0aGUgcmVkdW5kYW50ICsxIGluIHRoZSBkZnNfZGlyX25hbWUgYXJyYXkgZGVmaW5pdGlvbnMg
aW4gdWJpLmgKPiAgICAgYW5kIGRlYnVnLmguCj4gNS4gUmVtb3ZlcyB0aGUgZHVwbGljYXRlZCBV
QklGU19ERlNfRElSX0xFTiBhbmQgVUJJRlNfREZTX0RJUl9OQU1FIG1hY3JvCj4gICAgIGRlZmlu
aXRpb25zIGluIHViaWZzLmgsIGFzIHRoZXkgYXJlIGFscmVhZHkgZGVmaW5lZCBpbiBkZWJ1Zy5o
Lgo+IAo+IFdoaWxlIHRoZXNlIGNoYW5nZXMgZG8gbm90IGFmZmVjdCB0aGUgcnVudGltZSBiZWhh
dmlvciwgdGhleSBtYWtlIHRoZSBjb2RlCj4gbW9yZSByZWFkYWJsZSwgbWFpbnRhaW5hYmxlLCBh
bmQgbGVzcyBwcm9uZSB0byBmdXR1cmUgZXJyb3JzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFpoYW9M
b25nIFdhbmcgPHdhbmd6aGFvbG9uZzFAaHVhd2VpLmNvbT4KPiAtLS0KClBsZWFzZSBhZGQgY2hh
bmdlIGxvZyB2Mi0+djMgbmV4dCB0aW1lLgo+ICAgZHJpdmVycy9tdGQvdWJpL2RlYnVnLmMgfCA0
ICsrLS0KPiAgIGRyaXZlcnMvbXRkL3ViaS91YmkuaCAgIHwgMiArLQo+ICAgZnMvdWJpZnMvZGVi
dWcuYyAgICAgICAgfCA0ICsrLS0KPiAgIGZzL3ViaWZzL2RlYnVnLmggICAgICAgIHwgNyArKysr
LS0tCj4gICBmcy91Ymlmcy9zeXNmcy5jICAgICAgICB8IDYgKysrLS0tCj4gICBmcy91Ymlmcy91
Ymlmcy5oICAgICAgICB8IDcgLS0tLS0tLQo+ICAgNiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRp
b25zKCspLCAxOCBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5n
emhpaGFvMUBodWF3ZWkuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
