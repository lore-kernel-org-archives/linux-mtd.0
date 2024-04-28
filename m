Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE1DC4345F
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Apr 2024 07:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dbv0WW+28fHjOGWUmiFebbxL1MMi5DLTHfsOz4W1NLc=; b=HNTpQoihRpmIkZzwHPRKzz4R+g
	B1r4+4Lf+9uVFYvtzAR14rpsoyUAEu+1dNzO61fxstGwmCkF9f3PKwv0XGTqW9j3vqCt6CN4L5MWW
	RJbao1qkFNHIoNUPYdBYXMwhfzwxSpUVcIW7GSJY/80HWBhULoGwrltdnIy/+Umkf65NCMAs7rcNG
	5BsAaraqdH8OlOwhrf+MJ70IJ16gBTIw7De7kUZQGsip8MTpyMjHBTpvIP3TQ5ixxQ6x+J3sVQ/gm
	NIc0Q1zJAEvHgQw3nFEd5raN7OxZJd7lzroN9lmkIjk7HVcnD6GdzwujRndCP5ELIZgutLqvLt6Ep
	x5RL6CQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0zKT-0000000H5hm-11av;
	Sun, 28 Apr 2024 07:52:09 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0zKP-0000000H5e6-44WH
	for linux-mtd@lists.infradead.org;
	Sun, 28 Apr 2024 07:52:07 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VRz8n6GnyzXn7f;
	Sun, 28 Apr 2024 15:48:09 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 344B718007D;
	Sun, 28 Apr 2024 15:51:45 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 28 Apr 2024 15:51:44 +0800
Subject: Re: [PATCH] ubi: block: fix null-pointer-dereference in
 ubiblock_create()
To: <linan666@huaweicloud.com>, <richard@nod.at>, <miquel.raynal@bootlin.com>,
	<vigneshr@ti.com>, <axboe@kernel.dk>, <chaitanya.kulkarni@wdc.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yukuai3@huawei.com>, <yi.zhang@huawei.com>, <houtao1@huawei.com>,
	<yangerkun@huawei.com>
References: <20240428071922.2270892-1-linan666@huaweicloud.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <98698009-e3a2-5c00-7619-6b6e3422cd1b@huawei.com>
Date: Sun, 28 Apr 2024 15:51:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240428071922.2270892-1-linan666@huaweicloud.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_005206_206283_749D5974 
X-CRM114-Status: GOOD (  15.75  )
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

1NogMjAyNC80LzI4IDE1OjE5LCBsaW5hbjY2NkBodWF3ZWljbG91ZC5jb20g0LS1wDoKPiBGcm9t
OiBMaSBOYW4gPGxpbmFuMTIyQGh1YXdlaS5jb20+Cj4gCj4gU2ltaWxhciB0byBjb21taXQgYWRi
ZjRjNDk1NGUzICgidWJpOiBibG9jazogZml4IG1lbWxlYWsgaW4KPiB1YmlibG9ja19jcmVhdGUo
KSIpLCAnZGV2LT5nZCcgaXMgbm90IGFzc2lnbmVkIGJ1dCBkZXJlZmVyZW5jZWQgaWYKPiBibGtf
bXFfYWxsb2NfdGFnX3NldCgpIGZhaWxzLCBhbmQgbGVhZGluZyB0byBhIG51bGwtcG9pbnRlci1k
ZXJlZmVyZW5jZS4KPiAKPiBVc2luZyAnZ2QnIGRpcmVjdGx5IGhlcmUgaXMgbm90IGEgZ29vZCBp
ZGVhLCB0b28uICdnZC0+cGFydDAuYmRfZGV2aWNlJwo+IGlzIG5vdCBpbml0aWFsaXplZCBhdCB0
aGlzIHBvaW50LiBUaGUgZXJyb3IgbG9nIHdpbGwgYmU6Cj4gICAgYmxvY2sgKG51bGwpOiBibG9j
azogZHluYW1pYyBtaW5vciBhbGxvY2F0aW9uIGZhaWxlZAo+IAo+IEZpeCBpdCBieSB1c2luZyBw
cl9lcnIoKSBhbmQgcHJpbnQgdWJpIGlkLgo+IAo+IEZpeGVzOiA3NzU2N2IyNWFiOWYgKCJ1Ymk6
IHVzZSBibGtfbXFfYWxsb2NfZGlzayBhbmQgYmxrX2NsZWFudXBfZGlzayIpCj4gU2lnbmVkLW9m
Zi1ieTogTGkgTmFuIDxsaW5hbjEyMkBodWF3ZWkuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9tdGQv
dWJpL2Jsb2NrLmMgfCA3ICsrKystLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3ViaS9ibG9j
ay5jIGIvZHJpdmVycy9tdGQvdWJpL2Jsb2NrLmMKPiBpbmRleCBmODJlMzQyM2FjYjkuLmJmNzMw
OGU4ZWMyZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC91YmkvYmxvY2suYwo+ICsrKyBiL2Ry
aXZlcnMvbXRkL3ViaS9ibG9jay5jCj4gQEAgLTM5MCw3ICszOTAsOCBAQCBpbnQgdWJpYmxvY2tf
Y3JlYXRlKHN0cnVjdCB1Ymlfdm9sdW1lX2luZm8gKnZpKQo+ICAgCj4gICAJcmV0ID0gYmxrX21x
X2FsbG9jX3RhZ19zZXQoJmRldi0+dGFnX3NldCk7Cj4gICAJaWYgKHJldCkgewo+IC0JCWRldl9l
cnIoZGlza190b19kZXYoZGV2LT5nZCksICJibGtfbXFfYWxsb2NfdGFnX3NldCBmYWlsZWQiKTsK
PiArCQlwcl9lcnIoInViaWJsb2NrJWRfJWQ6IGJsa19tcV9hbGxvY190YWdfc2V0IGZhaWxlZFxu
IiwKPiArCQkJZGV2LT51YmlfbnVtLCBkZXYtPnZvbF9pZCk7Cj4gICAJCWdvdG8gb3V0X2ZyZWVf
ZGV2Owo+ICAgCX0KPiAgIAo+IEBAIC00MDcsOCArNDA4LDggQEAgaW50IHViaWJsb2NrX2NyZWF0
ZShzdHJ1Y3QgdWJpX3ZvbHVtZV9pbmZvICp2aSkKPiAgIAlnZC0+bWlub3JzID0gMTsKPiAgIAln
ZC0+Zmlyc3RfbWlub3IgPSBpZHJfYWxsb2MoJnViaWJsb2NrX21pbm9yX2lkciwgZGV2LCAwLCAw
LCBHRlBfS0VSTkVMKTsKClRoZXJlIGlzIG5vIG5lZWQgdG8gbW9kaWZ5IHRoaXMgcGxhY2UuIFRo
ZSBkZXZpY2Ugb2YgJ2dkJyBpcyBpbml0aWFsaXplZCAKaW4gYmxrX21xX2FsbG9jX2Rpc2suIFJl
ZmVyIHRvIG5iZF9kZXZfYWRkLgo+ICAgCWlmIChnZC0+Zmlyc3RfbWlub3IgPCAwKSB7Cj4gLQkJ
ZGV2X2VycihkaXNrX3RvX2RldihnZCksCj4gLQkJCSJibG9jazogZHluYW1pYyBtaW5vciBhbGxv
Y2F0aW9uIGZhaWxlZCIpOwo+ICsJCXByX2VycigidWJpYmxvY2slZF8lZDogYmxvY2s6IGR5bmFt
aWMgbWlub3IgYWxsb2NhdGlvbiBmYWlsZWRcbiIsCj4gKwkJCWRldi0+dWJpX251bSwgZGV2LT52
b2xfaWQpOwo+ICAgCQlyZXQgPSAtRU5PREVWOwo+ICAgCQlnb3RvIG91dF9jbGVhbnVwX2Rpc2s7
Cj4gICAJfQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
