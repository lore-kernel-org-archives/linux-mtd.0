Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C64EC43219
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Oct 2022 13:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3uq04wPD3UOR2YuLMzS6X+VRSJXbY1XEHe3x01JgBq4=; b=xFAyKLxH61HUzKuCh9rPyLqpk0
	eX1ef5zeb1uMtyxFnSAqCRYipsXsDcjTMnw9fbV9mw/eld/O40p6X5bcu/UkQnuTHL5r4Y7gE/79V
	n5lzMzuaW4CIIKE8qTw6GJS//sSj9B02SCTaUtlRD7Pf2r24Hvc4JaYt/P6yxhRRBpF9I8KRLoSBn
	Fois7XNpHOAkbvZ5jgLBuEXfo7ENahhu9go6EymRATFYmR1auQeEc6grAyaYvUevBYC6hYL0JnL4m
	gl+pMsz+YBPBUM280lNjW9teNTZG1yw/6zGsCjjbtag5A8WOBl4FEqjFQbiL1bDKe08WcMpA2nQdN
	ULyUYh4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olrjc-007nrT-5T; Fri, 21 Oct 2022 13:06:48 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olrjY-007nnC-RQ
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2022 13:06:46 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mv4QW6n6rzpVgw
	for <linux-mtd@lists.infradead.org>; Fri, 21 Oct 2022 21:03:15 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 21:06:36 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 21:06:35 +0800
Subject: Re: [PATCH] ubi: block: KASAN null-ptr-deref in ubiblock_create()
To: <linux-mtd@lists.infradead.org>
References: <20221021075728.1209184-1-lizetao1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <d85d6833-14bc-ab65-7d0b-7adcef412442@huawei.com>
Date: Fri, 21 Oct 2022 21:06:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20221021075728.1209184-1-lizetao1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_060645_079638_C8CA4D4F 
X-CRM114-Status: GOOD (  16.10  )
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

1NogMjAyMi8xMC8yMSAxNTo1NywgTGkgWmV0YW8g0LS1wDoKSGksCj4gVGhlcmUgaXMgYSBudWxs
LXB0ci1kZXJlZiB3aGVuIHRlc3RpbmcgdGhlIHViaWJsb2NrIHRvb2xzOgo+Cj4gICAgS0FTQU46
IG51bGwtcHRyLWRlcmVmIGluIHJhbmdlIFsweDAwMDAwMDAwMDAwMDAwNDAtMHgwMDAwMDAwMDAw
MDAwMDQ3XQo+ICAgIENQVTogMSBQSUQ6IDIyOTkgQ29tbTogdWJpYmxvY2sgTm90IHRhaW50ZWQK
PiAgICA2LjEuMC1yYzEtMDAwMDItZ2ViYjI0YWY4Yzg3Mi1kaXJ0eSAjMTIKPiAgICBIYXJkd2Fy
ZSBuYW1lOiBRRU1VIFN0YW5kYXJkIFBDIChpNDQwRlggKyBQSUlYLCAxOTk2KSwKPiAgICBCSU9T
IDEuMTQuMC0xLmZjMzMgMDQvMDEvMjAxNAo+ICAgIFJJUDogMDAxMDp1YmlibG9ja19jcmVhdGUu
Y29sZCsweDE3NS8weDFiNSBbdWJpXQo+ICAgIC4uLgo+ICAgIENhbGwgVHJhY2U6Cj4gICAgIHZv
bF9jZGV2X2lvY3RsKzB4NmNlLzB4ODcwIFt1YmldCj4gICAgIF9feDY0X3N5c19pb2N0bCsweDEx
ZC8weDE3MAo+ICAgICBkb19zeXNjYWxsXzY0KzB4MzUvMHg4MAo+ICAgICBlbnRyeV9TWVNDQUxM
XzY0X2FmdGVyX2h3ZnJhbWUrMHg0Ni8weGIwCj4gICAgUklQOiAwMDMzOjB4N2ZkOTE0MTIzMGFi
Cj4KPiB3aGVuIGJsa19tcV9hbGxvY190YWdfc2V0KCkgcmV0dXJucyBhbiBlcnJvciwgdGhlIGRl
di0+Z2QgaXMKPiB1bmluaXRpYWxpemVkLCB0aGF0IGNhdXNpbmcgbnVsbC1wdHItZGVyZWYgZmF1
bHQuCj4KPiBGaXggaXQgYnkgcmVwbGFjaW5nIHRoZSBkaXNrX3RvX2RldihkZXYtPmdkKSB3aXRo
IE5VTEwsIHRoYXQKPiB3aWxsIHByaW50ayAiKE5VTEwgZGV2aWNlICopOiAuLi4iIG1lc3NhZ2Ug
aWYgYmxrX21xX2FsbG9jX3RhZ19zZXQoKQo+IHJldHVybnMgYW4gZXJyb3IuCj4KPiBGaXhlczog
Nzc1NjdiMjVhYjlmICgidWJpOiB1c2UgYmxrX21xX2FsbG9jX2Rpc2sgYW5kIGJsa19jbGVhbnVw
X2Rpc2siKQo+IFNpZ25lZC1vZmYtYnk6IExpIFpldGFvIDxsaXpldGFvMUBodWF3ZWkuY29tPgo+
IC0tLQo+ICAgZHJpdmVycy9tdGQvdWJpL2Jsb2NrLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC91YmkvYmxvY2suYyBiL2RyaXZlcnMvbXRkL3ViaS9ibG9jay5jCj4gaW5kZXggNzVlYWVj
Yzg2MzlmLi45NjI1ZGMyZjQ1ZTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvdWJpL2Jsb2Nr
LmMKPiArKysgYi9kcml2ZXJzL210ZC91YmkvYmxvY2suYwo+IEBAIC00MDgsNyArNDA4LDcgQEAg
aW50IHViaWJsb2NrX2NyZWF0ZShzdHJ1Y3QgdWJpX3ZvbHVtZV9pbmZvICp2aSkKPiAgIAo+ICAg
CXJldCA9IGJsa19tcV9hbGxvY190YWdfc2V0KCZkZXYtPnRhZ19zZXQpOwo+ICAgCWlmIChyZXQp
IHsKPiAtCQlkZXZfZXJyKGRpc2tfdG9fZGV2KGRldi0+Z2QpLCAiYmxrX21xX2FsbG9jX3RhZ19z
ZXQgZmFpbGVkIik7Cj4gKwkJZGV2X2VycihOVUxMLCAiYmxrX21xX2FsbG9jX3RhZ19zZXQgZmFp
bGVkIik7CgonZGV2X2VycihOVUxMLCAuLi4nIGxvb2tzIHdpZXJkLiBTaW5jZSBkZXYgaXMgTlVM
TCwgdGhlcmUgaXMgbm8gdXNlZnVsIAppbmZvcm1hdGlvbiBmcm9tIHRoZSBkZXZpY2UsIEkgcHJl
ZmVyIHRvIHJlcGxhY2UgJ2Rldl9lcnInIHdpdGggJ3ByX2VycicuCgoKPiAgIAkJZ290byBvdXRf
ZnJlZV9kZXY7Cj4gICAJfQo+ICAgCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
