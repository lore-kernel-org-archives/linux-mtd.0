Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6830FC47DAF
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 12:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ui3CWGaZBufJhZ7N1oWQ1WnkcXarn+1Ma4GLHxTMmvI=; b=ZECfJfJZ9l6esW4ecTS2F23/EO
	khqNLe12MHyTPZz5FYjRIRpMbTqIFP22Va4A+SWpNkhkYAemWCleNvWekrFbEpWM8G9ppFFa9xjzy
	yuXls9eZqMMFhMBUyZ+rldbmddizdLgTu35SwBYqjbHJvd16R3wcdmWXY/nnXCMJNE/KIU3cwOGb7
	eWX4nNGDcPrrKLVv81UKxJIqd56xA/2PA7PM85BvwqHuFJod0AFO1nfu/9uapiaSYt+VeIh8oJJjv
	+21dBww+Bs97iErS7uc/0WN9U3etpuk4xcWatKXrR8qxHDyegN5qhgdim87ZoI15ULIxKHVmUu0xi
	a7ptB0Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtF9-00C3jP-19;
	Mon, 22 Jan 2024 12:17:35 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtF6-00C3hy-0N
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jan 2024 12:17:33 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4TJTh863V2z1S5Nh;
	Mon, 22 Jan 2024 20:15:36 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id BD0B614040F;
	Mon, 22 Jan 2024 20:17:19 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 20:17:19 +0800
Subject: Re: [PATCH 14/15] ubifs: Use a folio in ubifs_do_bulk_read()
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
References: <20240120230824.2619716-1-willy@infradead.org>
 <20240120230824.2619716-15-willy@infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <e2905a68-f360-227b-0d1d-275a04a3ac2b@huawei.com>
Date: Mon, 22 Jan 2024 20:17:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240120230824.2619716-15-willy@infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_041732_316844_931D72C2 
X-CRM114-Status: GOOD (  14.40  )
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

1NogMjAyNC8xLzIxIDc6MDgsIE1hdHRoZXcgV2lsY294IChPcmFjbGUpINC0tcA6Cj4gV2hlbiBs
b29raW5nIGluIHRoZSBwYWdlIGNhY2hlLCByZXRyaWV2ZSBhIGZvbGlvIGluc3RlYWQgb2YgYSBw
YWdlLgo+IFRoaXMgd291bGQgbmVlZCBzb21lIHdvcmsgdG8gbWFrZSBpdCBzYWZlIGZvciBsYXJn
ZSBmb2xpb3MuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBXaWxjb3ggKE9yYWNsZSkgPHdp
bGx5QGluZnJhZGVhZC5vcmc+Cj4gLS0tCj4gICBmcy91Ymlmcy9maWxlLmMgfCAxNCArKysrKysr
LS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMo
LSkKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgoK
PiAKPiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvZmlsZS5jIGIvZnMvdWJpZnMvZmlsZS5jCj4gaW5k
ZXggOGNhZDFmZTljNTBmLi5kZWM1MjU4YjRmMzggMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMvZmls
ZS5jCj4gKysrIGIvZnMvdWJpZnMvZmlsZS5jCj4gQEAgLTc3NywxOSArNzc3LDE5IEBAIHN0YXRp
YyBpbnQgdWJpZnNfZG9fYnVsa19yZWFkKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBzdHJ1Y3QgYnVf
aW5mbyAqYnUsCj4gICAKPiAgIAlmb3IgKHBhZ2VfaWR4ID0gMTsgcGFnZV9pZHggPCBwYWdlX2Nu
dDsgcGFnZV9pZHgrKykgewo+ICAgCQlwZ29mZl90IHBhZ2Vfb2Zmc2V0ID0gb2Zmc2V0ICsgcGFn
ZV9pZHg7Cj4gLQkJc3RydWN0IHBhZ2UgKnBhZ2U7Cj4gKwkJc3RydWN0IGZvbGlvICpmb2xpbzsK
PiAgIAo+ICAgCQlpZiAocGFnZV9vZmZzZXQgPiBlbmRfaW5kZXgpCj4gICAJCQlicmVhazsKPiAt
CQlwYWdlID0gcGFnZWNhY2hlX2dldF9wYWdlKG1hcHBpbmcsIHBhZ2Vfb2Zmc2V0LAo+ICsJCWZv
bGlvID0gX19maWxlbWFwX2dldF9mb2xpbyhtYXBwaW5nLCBwYWdlX29mZnNldCwKPiAgIAkJCQkg
RkdQX0xPQ0t8RkdQX0FDQ0VTU0VEfEZHUF9DUkVBVHxGR1BfTk9XQUlULAo+ICAgCQkJCSByYV9n
ZnBfbWFzayk7Cj4gLQkJaWYgKCFwYWdlKQo+ICsJCWlmIChJU19FUlIoZm9saW8pKQo+ICAgCQkJ
YnJlYWs7Cj4gLQkJaWYgKCFQYWdlVXB0b2RhdGUocGFnZSkpCj4gLQkJCWVyciA9IHBvcHVsYXRl
X3BhZ2UoYywgcGFnZSwgYnUsICZuKTsKPiAtCQl1bmxvY2tfcGFnZShwYWdlKTsKPiAtCQlwdXRf
cGFnZShwYWdlKTsKPiArCQlpZiAoIWZvbGlvX3Rlc3RfdXB0b2RhdGUoZm9saW8pKQo+ICsJCQll
cnIgPSBwb3B1bGF0ZV9wYWdlKGMsICZmb2xpby0+cGFnZSwgYnUsICZuKTsKPiArCQlmb2xpb191
bmxvY2soZm9saW8pOwo+ICsJCWZvbGlvX3B1dChmb2xpbyk7Cj4gICAJCWlmIChlcnIpCj4gICAJ
CQlicmVhazsKPiAgIAl9Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
