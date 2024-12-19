Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BFDE77184
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2024 13:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DrOsruCUmSybSmaCXzIk9YsvgCvXHClK71CAVCNc9z4=; b=NmSMYcDqtJw+7yCZOGhzL/ZjwP
	r+4lDlNj1JNddpkEC+nKjz1hU+0JiOfd5BOXvLEyV8bglHIqR79fzKIjqGAqj25YnG+9/O1trFMZS
	AozMIWUlxbUkyH/7usHj65XirV90MUZR8xPCJmlQu2M/UkoNkVII14JOcZgveh9Mpo0qn+Q6VCfSB
	yeS05E7WCHpwd0CeRq5jNr5epmpbNoqEy9bELosLAu1MWuRP5aze9VJxEbuuK7kl7f7FDPGIHmYrN
	eqKnwAKLWfK6S2ZF0AxMdKTCJ3VE9IoA7cACeO/otmH4WHfEVWwwLbrodgDlW33tUXe+cwEPg53Ph
	GcEmFlvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGS1-00000001vND-1Mhw;
	Thu, 19 Dec 2024 13:20:25 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGRx-00000001vMR-38qL
	for linux-mtd@lists.infradead.org;
	Thu, 19 Dec 2024 13:20:23 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4YDWLW5z1qz1kwQC
	for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2024 21:17:39 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id BCADB1402CA
	for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2024 21:20:15 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Dec 2024 21:20:15 +0800
Subject: Re: [PATCH mtd-utils] misc-utils: fix integer overflow in ftl_check.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241219123009.703272-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <eb7b9d87-f43d-7535-ae90-0ca583ab175a@huawei.com>
Date: Thu, 19 Dec 2024 21:20:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241219123009.703272-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_052021_972464_654AC74D 
X-CRM114-Status: GOOD (  15.17  )
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

1NogMjAyNC8xMi8xOSAyMDozMCwgQW50b24gTW9yeWFrb3Yg0LS1wDoKCj4gUmVwb3J0IG9mIHRo
ZSBzdGF0aWMgYW5hbHl6ZXI6Cj4gQW4gaW50ZWdlciBvdmVyZmxvdyBtYXkgb2NjdXIgZHVlIHRv
IGFyaXRobWV0aWMgb3BlcmF0aW9uIChtdWx0aXBsaWNhdGlvbikgYmV0d2VlbiB2YXJpYWJsZSAn
bmJhbScgYW5kIHZhbHVlICc0JyBvZiAnc2l6ZW9mKHVfaW50KScsIHdoZW4gJ25iYW0nIGlzIGlu
IHJhbmdlCkFib3ZlIGxpbmVzIGNhbiBiZSByZW1vdmVkLgpBbmQgdGhlIHRpdGxlIG9mIHRoZSBw
YXRjaCBzaG91bGQgYmUgIltQQVRDSCBtdGQtdXRpbHNdIG1pc2MtdXRpbHM6IGFkZCAKbWlzc2lu
ZyBlcnJvciBoYW5kbGluZyBmb3IgJ2JhbScgYWxsb2NhdGlvbiIuCgo+IAo+IENvcnJlY3Rpb25z
IGV4cGxhaW5lZDoKPiBBZGRlZCByb2J1c3QgaGFuZGxpbmcgZm9yIG1hbGxvYygpIGZhaWx1cmUg
YnkgY2hlY2tpbmcgdGhlIHJldHVybnZhbHVlYW5kIHByb3ZpZGluZyBhIGNsZWFyIGVycm9yIG1l
c3NhZ2UuCj4gCj4gVHJpZ2dlcnMgZm91bmQgYnkgc3RhdGljIGFuYWx5emVyIFN2YWNlLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEFudG9uIE1vcnlha292IDxhbnQudi5tb3J5YWtvdkBnbWFpbC5jb20+
Cj4gCj4gLS0tCj4gICBtaXNjLXV0aWxzL2Z0bF9jaGVjay5jIHwgOSArKysrKysrKysKPiAgIDEg
ZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcg
PGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IAo+IGRpZmYgLS1naXQgYS9taXNjLXV0aWxzL2Z0
bF9jaGVjay5jIGIvbWlzYy11dGlscy9mdGxfY2hlY2suYwo+IGluZGV4IDViMmRhZTUuLmZlNDNh
MjQgMTAwNjQ0Cj4gLS0tIGEvbWlzYy11dGlscy9mdGxfY2hlY2suYwo+ICsrKyBiL21pc2MtdXRp
bHMvZnRsX2NoZWNrLmMKPiBAQCAtMTIwLDggKzEyMCwxNyBAQCBzdGF0aWMgdm9pZCBjaGVja19w
YXJ0aXRpb24oaW50IGZkKQo+ICAgCj4gICAJLyogQ3JlYXRlIGJhc2ljIGJsb2NrIGFsbG9jYXRp
b24gdGFibGUgZm9yIGNvbnRyb2wgYmxvY2tzICovCj4gICAJbmJhbSA9IChtdGQuZXJhc2VzaXpl
ID4+IGhkci5CbG9ja1NpemUpOwo+ICAgCWJhbSA9IG1hbGxvYyhuYmFtICogc2l6ZW9mKHVfaW50
KSk7Cj4gKwlpZiAoIWJhbSkgewo+ICsJCXBlcnJvcigibWFsbG9jIGZhaWxlZCIpOwo+ICsJCXJl
dHVybjsKPiArCX0KPiAKPiAgIAlmb3IgKGkgPSAwOyBpIDwgbGUxNl90b19jcHUoaGRyLk51bUVy
YXNlVW5pdHMpOyBpKyspIHsKPiAgIAkJaWYgKGxzZWVrKGZkLCAoaSA8PCBoZHIuRXJhc2VVbml0
U2l6ZSksIFNFRUtfU0VUKSA9PSAtMSkgewo+ICAgCQkJcGVycm9yKCJzZWVrIGZhaWxlZCIpOwo+
IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
