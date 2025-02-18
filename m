Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FC2C021AD
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2025 12:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3MnikquR5Tgk04CZKm7a47a1Bq9q4s44oytB8/pxHQ=; b=HrqJ8snqcNoU05O61PU0AHUAVZ
	ojsi+ltWGEJuxOY3p5VjBdz3fBfKKQKCD1FrJaUsajp9e1NqJUt2yGEpFQsYzrtWUscCtdjUDF8IM
	oot+wHnjr0Qg1z5MrljhNXGRvZN6Oso0qOuxlu3Nq1ESx2qYow18SmVtIbcbcgOdALLznsAJrBuvV
	bHzlyEhFLc8vMokJl40uBmavFT8wGyMuyFCHS9RHzxpAei4OS1rb72b6iD4xe6MJgOx9JlXFGf3LG
	rF5NMslR8JUrUm9zb6tQPiB3yRW1MxyuYGyoXW4mW/iD+rrtpdvD/+DjK+ELA5AQ93e3tqk+eH/2f
	YBVbDqIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMhT-000000088lt-1Zmi;
	Tue, 18 Feb 2025 12:27:43 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMHg-000000083sm-2heH
	for linux-mtd@lists.infradead.org;
	Tue, 18 Feb 2025 12:01:06 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Yxyh12BPgzhZt6;
	Tue, 18 Feb 2025 19:57:37 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 7A4D0140361;
	Tue, 18 Feb 2025 20:01:00 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 18 Feb 2025 20:00:59 +0800
Subject: Re: [PATCH v2 mtd-utils 2/4] ubifs-utils: journal: Include
 <sys/stat.h>
To: Fabio Estevam <festevam@gmail.com>, <david.oberhollenzer@sigma-star.at>
CC: <raj.khem@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20250218113123.1956575-1-festevam@gmail.com>
 <20250218113123.1956575-2-festevam@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <62081e22-6fd0-0fb3-5c19-0217a50372c3@huawei.com>
Date: Tue, 18 Feb 2025 20:00:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250218113123.1956575-2-festevam@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_040104_866119_913F70A1 
X-CRM114-Status: GOOD (  16.17  )
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

1NogMjAyNS8yLzE4IDE5OjMxLCBGYWJpbyBFc3RldmFtINC0tcA6Cj4gSW5jbHVkZSB0aGUgPHN5
cy9zdGF0Lmg+IGhlYWRlciBmaWxlIHRvIGZpeCB0aGUgZm9sbG93aW5nIGVycm9yCj4gd2hlbiBi
dWlsZGluZyB3aXRoIG11c2w6Cj4gCj4gfCAuLi9naXQvdWJpZnMtdXRpbHMvbGlidWJpZnMvam91
cm5hbC5jOiBJbiBmdW5jdGlvbiAndWJpZnNfZ2V0X2RlbnRfdHlwZSc6Cj4gfCAuLi9naXQvdWJp
ZnMtdXRpbHMvbGlidWJpZnMvam91cm5hbC5jOjQxNDoyNDogZXJyb3I6ICdTX0lGTVQnIHVuZGVj
bGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQo+IHwgICA0MTQgfCAgICAgICAgIHN3
aXRjaCAobW9kZSAmIFNfSUZNVCkgewo+IHwgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
IF5+fn5+fgo+IHwgLi4vZ2l0L3ViaWZzLXV0aWxzL2xpYnViaWZzL2pvdXJuYWwuYzo0MTQ6MjQ6
IG5vdGU6IGVhY2ggdW5kZWNsYXJlZCBpZGVudGlmaWVyIGlzIHJlcG9ydGVkIG9ubHkgb25jZSBm
b3IgZWFjaCBmdW5jdGlvbiBpdCBhcHBlYXJzIGluCj4gfCAuLi9naXQvdWJpZnMtdXRpbHMvbGli
dWJpZnMvam91cm5hbC5jOjQxNToxNDogZXJyb3I6ICdTX0lGUkVHJyB1bmRlY2xhcmVkIChmaXJz
dCB1c2UgaW4gdGhpcyBmdW5jdGlvbikKPiB8ICAgNDE1IHwgICAgICAgICBjYXNlIFNfSUZSRUc6
Cj4gCj4gU2lnbmVkLW9mZi1ieTogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgo+
IC0tLQo+IENoYW5nZXMgc2luY2UgdjE6Cj4gLSBOb25lLgo+IAo+ICAgdWJpZnMtdXRpbHMvbGli
dWJpZnMvam91cm5hbC5jIHwgMSArCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykK
PiAKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+
IGRpZmYgLS1naXQgYS91Ymlmcy11dGlscy9saWJ1Ymlmcy9qb3VybmFsLmMgYi91Ymlmcy11dGls
cy9saWJ1Ymlmcy9qb3VybmFsLmMKPiBpbmRleCBlNzhlYTE0ZjNlNjkuLjQ1ZDgyZmQ1NGJkYiAx
MDA2NDQKPiAtLS0gYS91Ymlmcy11dGlscy9saWJ1Ymlmcy9qb3VybmFsLmMKPiArKysgYi91Ymlm
cy11dGlscy9saWJ1Ymlmcy9qb3VybmFsLmMKPiBAQCAtNDYsNiArNDYsNyBAQAo+ICAgICogYWxs
IHRoZSBub2Rlcy4KPiAgICAqLwo+ICAgCj4gKyNpbmNsdWRlIDxzeXMvc3RhdC5oPgo+ICAgI2lu
Y2x1ZGUgImJpdG9wcy5oIgo+ICAgI2luY2x1ZGUgImttZW0uaCIKPiAgICNpbmNsdWRlICJ1Ymlm
cy5oIgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
