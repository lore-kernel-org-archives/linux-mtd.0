Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E17C7EE25
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 14:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	CC:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2hNOioZken0l8VqZefqmLfufyA1TXCBmsuhIf6iRys=; b=D4ChuYcIt965v0PlWySJkVA51T
	Y7k3/RRu2/JR10wfFr/SZrneBbQh4J7fTw+F7iVUBWVmQa1k6yO9wnzdt0s0+/ZFzvhpIr1+C7ozw
	Yxceo9mkeexcgqvKdDDNeurmGyWmUr/INBuXSnZ6kOs0XB+nmuJXGfOXK2HV605IscPcw6iYRNMil
	sjt/7BUSUPk9EfwtfdLvDRC3MRxo6cg3JmoeT8YVZEKdxca9pigKtHpEDSOwS35Ext+48hZLJ8cW0
	wEdZauzvbw2IbnyaBIexWRdXMMmKh68C8Ba8D+FBrbOto4qtLriY3o5MpGQfdUzPpZE27mBnfPiKS
	93DIV62g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ttR-006DOG-1S;
	Wed, 07 Jun 2023 14:12:09 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ttM-006DMK-3B
	for linux-mtd@lists.infradead.org;
	Wed, 07 Jun 2023 14:12:08 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Qbq0Y1ShJz18Lvp;
	Wed,  7 Jun 2023 22:07:09 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 22:11:56 +0800
Subject: Re: [PATCH 1/4] ubifs: Convert from writepage to writepages
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20230605165029.2908304-1-willy@infradead.org>
 <20230605165029.2908304-2-willy@infradead.org>
 <be9f30d1-d840-fb76-f185-5ebc70a7b72b@huawei.com>
Message-ID: <4f885387-ecaa-532c-97dc-14a2fff5c9c3@huawei.com>
Date: Wed, 7 Jun 2023 22:11:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <be9f30d1-d840-fb76-f185-5ebc70a7b72b@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_071205_411884_E49BE6E3 
X-CRM114-Status: GOOD (  19.25  )
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjMvNi82IDIyOjM3LCBaaGloYW8gQ2hlbmcg5YaZ6YGTOgo+IOWcqCAyMDIzLzYvNiAw
OjUwLCBNYXR0aGV3IFdpbGNveCAoT3JhY2xlKSDlhpnpgZM6Cj4gSGksCj4+IFRoaXMgaXMgYSBz
aW1wbGlzdGljIGNvbnZlcnNpb24gdG8gc2VwYXJhdGUgb3V0IGFueSBlZmZlY3RzIG9mCj4+IG5v
IGxvbmdlciBoYXZpbmcgYSB3cml0ZXBhZ2UgbWV0aG9kLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBN
YXR0aGV3IFdpbGNveCAoT3JhY2xlKSA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KPj4gLS0tCj4+IMKg
IGZzL3ViaWZzL2ZpbGUuYyB8IDEyICsrKysrKysrKystLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwg
MTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzL3Vi
aWZzL2ZpbGUuYyBiL2ZzL3ViaWZzL2ZpbGUuYwo+PiBpbmRleCA5NzlhYjFkOWQwYzMuLjhiYjRj
YjlkNTI4ZiAxMDA2NDQKPj4gLS0tIGEvZnMvdWJpZnMvZmlsZS5jCj4+ICsrKyBiL2ZzL3ViaWZz
L2ZpbGUuYwo+PiBAQCAtMTAwMyw4ICsxMDAzLDEwIEBAIHN0YXRpYyBpbnQgZG9fd3JpdGVwYWdl
KHN0cnVjdCBwYWdlICpwYWdlLCBpbnQgCj4+IGxlbikKPj4gwqDCoCAqIG9uIHRoZSBwYWdlIGxv
Y2sgYW5kIGl0IHdvdWxkIG5vdCB3cml0ZSB0aGUgdHJ1bmNhdGVkIGlub2RlIG5vZGUgCj4+IHRv
IHRoZQo+PiDCoMKgICogam91cm5hbCBiZWZvcmUgd2UgaGF2ZSBmaW5pc2hlZC4KPj4gwqDCoCAq
Lwo+PiAtc3RhdGljIGludCB1Ymlmc193cml0ZXBhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UsIHN0cnVj
dCAKPj4gd3JpdGViYWNrX2NvbnRyb2wgKndiYykKPj4gK3N0YXRpYyBpbnQgdWJpZnNfd3JpdGVw
YWdlKHN0cnVjdCBmb2xpbyAqZm9saW8sIHN0cnVjdCAKPj4gd3JpdGViYWNrX2NvbnRyb2wgKndi
YywKPj4gK8KgwqDCoMKgwqDCoMKgIHZvaWQgKmRhdGEpCj4+IMKgIHsKPj4gK8KgwqDCoCBzdHJ1
Y3QgcGFnZSAqcGFnZSA9ICZmb2xpby0+cGFnZTsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgaW5vZGUg
Kmlub2RlID0gcGFnZS0+bWFwcGluZy0+aG9zdDsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgdWJpZnNf
aW5mbyAqYyA9IGlub2RlLT5pX3NiLT5zX2ZzX2luZm87Cj4+IMKgwqDCoMKgwqAgc3RydWN0IHVi
aWZzX2lub2RlICp1aSA9IHViaWZzX2lub2RlKGlub2RlKTsKPj4gQEAgLTEwNzYsNiArMTA3OCwx
MiBAQCBzdGF0aWMgaW50IHViaWZzX3dyaXRlcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSwgCj4+IHN0
cnVjdCB3cml0ZWJhY2tfY29udHJvbCAqd2JjKQo+PiDCoMKgwqDCoMKgIHJldHVybiBlcnI7Cj4+
IMKgIH0KPj4gK3N0YXRpYyBpbnQgdWJpZnNfd3JpdGVwYWdlcyhzdHJ1Y3QgYWRkcmVzc19zcGFj
ZSAqbWFwcGluZywKPj4gK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCB3cml0ZWJhY2tfY29udHJvbCAq
d2JjKQo+PiArewo+PiArwqDCoMKgIHJldHVybiB3cml0ZV9jYWNoZV9wYWdlcyhtYXBwaW5nLCB3
YmMsIHViaWZzX3dyaXRlcGFnZSwgTlVMTCk7Cj4+ICt9Cj4+ICsKPiAKPiBUaGVyZSBpcyBhIHNt
YWxsIGRpZmZlcmVuY2UuCj4gYmVmb3JlIHBhdGNoIGFwcGxpZWQ6Cj4gZG9fd3JpdGVwYWdlcyAt
PiB3cml0ZV9jYWNoZV9wYWdlcyAtPiB3cml0ZXBhZ2VfY2I6Cj4gIMKgdWJpZnNfd3JpdGVwYWdl
Cj4gIMKgbWFwcGluZ19zZXRfZXJyb3IobWFwcGluZywgcmV0KQo+IAo+IFNvLCB3ZSBjYW4gZ2V0
IGVycm9yIHJldHVybmVkIGZyb20gZXJyc2VxX2NoZWNrX2FuZF9hZHZhbmNlIGluIHN5bmNmcyAK
PiBzeXNjYWxsIGlmIHViaWZzX3dyaXRlcGFnZSBvY2N1cnMgRUlPLgo+IAo+IGFmdGVyIHBhdGNo
IGFwcGxpZWQ6Cj4gCj4gZG9fd3JpdGVwYWdlcyAtPiB1Ymlmc193cml0ZXBhZ2VzIC0+IHdyaXRl
X2NhY2hlX3BhZ2VzIC0+IAo+IHViaWZzX3dyaXRlcGFnZSwgbWFwcGluZyB3b24ndCBiZSBzZXQg
ZXJyb3IgaWYgdWJpZnNfd3JpdGVwYWdlIGZhaWxlZC4gCj4gVW5mb3J0dW5hdGVseSwgdWJpZnMg
aXMgbm90IGEgYmxvY2sgZmlsZXN5c3RlbSwgc28gCj4gc3luY19maWxlc3lzdGVtLT5zeW5jX2Js
b2NrZGV2X25vd2FpdCB3aWxsIHJldHVybiAwLiBGaW5hbGx5LCBzeW5jZnMgCj4gc3lzY2FsbCB3
aWxsIHJldHVybiAwLgo+IAoKSSB0aGluayB3ZSBjYW4gYWRkIG1hcHBpbmdfc2V0X2Vycm9yIGlu
IGVycm9yIGJyYW5jaCBvZiB1Ymlmc193cml0ZXBhZ2UgCnRvIHNvbHZlIGl0LgoKQlRXLCBJIG5v
dGljZSB0aGF0IHNocmlua19mb2xpb19saXN0IC0+IHBhZ2VvdXQgd2lsbCB0cnkgdG8gc2hyaW5r
IHBhZ2UgCmJ5IHdyaXRlcGFnZSBtZXRob2QsIGlmIHdlIHJlbW92ZSAnLT53cml0ZXBhZ2UnLCB0
aGUgZGlydHkgcGFnZSB3b24ndCBiZSAKc2hyaW5rZWQgaW4gdGhhdCB3YXk/Cgo+IAo+PiDCoCAv
KioKPj4gwqDCoCAqIGRvX2F0dHJfY2hhbmdlcyAtIGNoYW5nZSBpbm9kZSBhdHRyaWJ1dGVzLgo+
PiDCoMKgICogQGlub2RlOiBpbm9kZSB0byBjaGFuZ2UgYXR0cmlidXRlcyBmb3IKPj4gQEAgLTE2
MzYsNyArMTY0NCw3IEBAIHN0YXRpYyBpbnQgdWJpZnNfc3ltbGlua19nZXRhdHRyKHN0cnVjdCAK
Pj4gbW50X2lkbWFwICppZG1hcCwKPj4gwqAgY29uc3Qgc3RydWN0IGFkZHJlc3Nfc3BhY2Vfb3Bl
cmF0aW9ucyB1Ymlmc19maWxlX2FkZHJlc3Nfb3BlcmF0aW9ucyA9IHsKPj4gwqDCoMKgwqDCoCAu
cmVhZF9mb2xpb8KgwqDCoMKgID0gdWJpZnNfcmVhZF9mb2xpbywKPj4gLcKgwqDCoCAud3JpdGVw
YWdlwqDCoMKgwqDCoCA9IHViaWZzX3dyaXRlcGFnZSwKPj4gK8KgwqDCoCAud3JpdGVwYWdlc8Kg
wqDCoMKgID0gdWJpZnNfd3JpdGVwYWdlcywKPj4gwqDCoMKgwqDCoCAud3JpdGVfYmVnaW7CoMKg
wqAgPSB1Ymlmc193cml0ZV9iZWdpbiwKPj4gwqDCoMKgwqDCoCAud3JpdGVfZW5kwqDCoMKgwqDC
oCA9IHViaWZzX3dyaXRlX2VuZCwKPj4gwqDCoMKgwqDCoCAuaW52YWxpZGF0ZV9mb2xpbyA9IHVi
aWZzX2ludmFsaWRhdGVfZm9saW8sCj4+Cj4gCj4gCj4gLgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
