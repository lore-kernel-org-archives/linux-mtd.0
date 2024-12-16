Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A81E7716A
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2024 01:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjvC4Z/uI8EgDhSYRJmPI096kqSeegAs1PGkK5LtupY=; b=x6NOQQZmeWSj2B1pGNOmxcVS1F
	Gpr4UxCjSxGy1Pd0xnTwG8Fl541rV1pC6OmHWz0HIvzVDUn/R+wyKr6752MQlOKpry8cQb2NkRAbC
	5yBigB7/ZGWwWbmxSTnhQxV12CkCYDm0gMqSOiS3nBhSPy2OIwgY+DqhjcM3y6tuuaEmksCfLRv/X
	WdmZeUpp6blzXC8g+kSuslfyhIkxOkHB6ZrSJRuOsFOOCUPML+1sKpUme5DRArsYX8d0fD3sWA4cM
	MsHPKk4UuTfmCq+UHvJnLZ6igyu49IhXTQHD1JDw6secY+sfwP0umzVameYuO0fV2ANluEnlOF1e8
	BBabcxjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMzb5-00000008jN1-2PD9;
	Mon, 16 Dec 2024 01:08:31 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMzav-00000008jLw-1fuI
	for linux-mtd@lists.infradead.org;
	Mon, 16 Dec 2024 01:08:23 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4YBMFz4xhqz21nHS
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2024 09:06:15 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 83CF71402DB
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2024 09:08:05 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 16 Dec 2024 09:08:04 +0800
Subject: Re: [PATCH mtd-utils] nand-utils: Fix integer overflow in
 nandflipbits.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241214121835.69687-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <0c6d7337-4b58-53ec-8f5e-088af2370801@huawei.com>
Date: Mon, 16 Dec 2024 09:08:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241214121835.69687-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_170821_604017_39D61B91 
X-CRM114-Status: GOOD (  12.98  )
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

1NogMjAyNC8xMi8xNCAyMDoxOCwgQW50b24gTW9yeWFrb3Yg0LS1wDoKPiBSZXBvcnQgb2YgdGhl
IHN0YXRpYyBhbmFseXplcjoKPiBUaGUgdmFsdWUgb2YgYW4gYXJpdGhtZXRpYyBleHByZXNzaW9u
ICdiaXRfdG9fZmxpcC0+YmxvY2sgKiBtdGQuZWJfc2l6ZSArIGJsa29mZnMnIGlzIGEgc3ViamVj
dCB0byBvdmVyZmxvdyBiZWNhdXNlIGl0cyBvcGVyYW5kcyBhcmUgbm90IGNhc3QgdG8gYSBsYXJn
ZXIgZGF0YSB0eXBlIGJlZm9yZSBwZXJmb3JtaW5nIGFyaXRoJAo+IAo+IENvcnJlY3Rpb25zIGV4
cGxhaW5lZDoKPiBQcmV2ZW50IGFyaXRobWV0aWMgb3ZlcmZsb3cgaW4gT09CIHJlYWQgb3BlcmF0
aW9uCj4gUmVzb2x2ZWQgYW4gaXNzdWUgd2hlcmUgdGhlIGNhbGN1bGF0aW9uIG9mIHRoZSBvZmZz
ZXQgaW4gdGhlIE9PQiByZWFkIG9wZXJhdGlvbiBjb3VsZCBvdmVyZmxvdyBkdWUgdG8gb3BlcmFu
ZHMgbm90IGJlaW5nIGNhc3QgdG8gYSBsYXJnZXIgZGF0YSB0eXBlLiBTcGVjaWZpY2FsbHksIHRo
ZSBtdWx0aXBsaWNhdGlvbiBvZiBiaSQKPiAKPiBUcmlnZ2VycyBmb3VuZCBieSBzdGF0aWMgYW5h
bHl6ZXIgU3ZhY2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW50b24gTW9yeWFrb3YgPGFudC52Lm1v
cnlha292QGdtYWlsLmNvbT4KPiAKPiAtLS0KPiAgIG5hbmQtdXRpbHMvbmFuZGZsaXBiaXRzLmMg
fCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
PiAKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+
IGRpZmYgLS1naXQgYS9uYW5kLXV0aWxzL25hbmRmbGlwYml0cy5jIGIvbmFuZC11dGlscy9uYW5k
ZmxpcGJpdHMuYwo+IGluZGV4IDcwNjY0MDguLmVmNjYzYzYgMTAwNjQ0Cj4gLS0tIGEvbmFuZC11
dGlscy9uYW5kZmxpcGJpdHMuYwo+ICsrKyBiL25hbmQtdXRpbHMvbmFuZGZsaXBiaXRzLmMKPiBA
QCAtMjUxLDcgKzI1MSw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKPiAgIAkJ
CWJ1Zm9mZnMgKz0gbXRkLm1pbl9pb19zaXplOwo+ICAgCj4gICAJCQlyZXQgPSBtdGRfcmVhZF9v
b2IobXRkX2Rlc2MsICZtdGQsIGZkLAo+IC0JCQkJCSAgIGJpdF90b19mbGlwLT5ibG9jayAqIG10
ZC5lYl9zaXplICsKPiArCQkJCQkgICAodW5zaWduZWQgbG9uZyBsb25nKWJpdF90b19mbGlwLT5i
bG9jayAqIG10ZC5lYl9zaXplICsKPiAgIAkJCQkJICAgYmxrb2ZmcywKPiAgIAkJCQkJICAgbXRk
Lm9vYl9zaXplLCBidWZmZXIgKyBidWZvZmZzKTsKPiAgIAkJCWlmIChyZXQpIHsKPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
