Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EABC5321D
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 10:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/VyESFlWggR6k5ZQ7qiVMY6fMRVI6w0Sl6IuXu2toio=; b=dU5fouEEZ4B/xeXEdpmDfiEohY
	h3dljLNi4hE/lEhEso+NiXAwQOAru3LUp7yIvr81ETTODQyQZugrssoQnlOd2VTp6gPY/9zKbW63f
	3S5CDDTstzgjYuQxr7cu4zibUTDK1kPkR2y2nPMrWLRsKZ/zGsnmA9ohm37P5LqFi2q12FIXNAwPV
	LtchA7pDjnisvaGbCBu+yDN/VTRgahNYPqshT5X1C18IANQXUezT9jHasQW9BCLNJ7/95wsbj5wXG
	dIYNeOJc1xxtikz34SMhM5KkRJ2JEAd2dLvXc8iWSjGASwDVFfDrZISLNFP5ru769jEhKL2jb30Bc
	HBpXomSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siX47-00000006x3m-2GWW;
	Mon, 26 Aug 2024 10:35:15 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siX44-00000006x2E-3Eqe
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 10:35:14 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Wsn8773z3zpTcp;
	Mon, 26 Aug 2024 18:33:27 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id EA5031401F0;
	Mon, 26 Aug 2024 18:35:06 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 18:35:06 +0800
Subject: Re: [PATCH -next 2/2] ubifs: add support for FS_IOC_GETFSSYSFSPATH
To: Hongbo Li <lihongbo22@huawei.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
References: <20240826091700.2812779-1-lihongbo22@huawei.com>
 <20240826091700.2812779-3-lihongbo22@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <ab0a6aec-e8df-ab6e-154c-ed3e21737546@huawei.com>
Date: Mon, 26 Aug 2024 18:35:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240826091700.2812779-3-lihongbo22@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_033513_098156_4B59C971 
X-CRM114-Status: GOOD (  16.02  )
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

1NogMjAyNC84LzI2IDE3OjE3LCBIb25nYm8gTGkg0LS1wDoKPiBJbiBjb21taXQgYWU4YzUxMTc1
NzMwICgiZnM6IGFkZCBGU19JT0NfR0VURlNTWVNGU1BBVEgiKSwgYQo+IG5ldyBmcyBpb2N0bCB3
YXMgaW50cm9kdWNlZCB0byBzdGFuZGFyZGl6ZSBleHBvcnRpbmcgZGF0YSBmcm9tCj4gc3lzZnMg
YWNyb3NzIGZpbGVzeXN0ZW1zLiBUaGUgcmV0dXJuZWQgcGF0aCB3aWxsIGFsd2F5cyBiZSBvZiB0
aGUKPiBmb3JtICIkRlNUWVAvJFNZU0ZTX0lERU5USUZJRVIiLCB3aGVyZSB0aGUgc3lzZnMgaWRl
bnRpZmllciBtYXkKPiBiZSBhIFVVSUQgb3IgYSBkZXZpY2UgbmFtZS4KPiAKPiBUaGUgdWJpZnMg
aXMgYSBmaWxlIHN5c3RlbSBiYXNlZCBvbiBjaGFyIGRldmljZSwgYW5kIHRoZSBjb21tb24KPiBt
ZXRob2QgdG8gZmlsbCBzX3N5c2ZzX25hbWUgKHN1cGVyX3NldF9zeXNmc19uYW1lX2JkZXYpIGlz
Cj4gdW5hdmlhbGFibGUuIFNvIGluIG9yZGVyIHRvIHN1cHBvcnQgRlNfSU9DX0dFVEZTU1lTRlNQ
QVRIIGlvY3RsLAo+IHdlIGZpbGwgdGhlIHNfc3lzZnNfbmFtZSB3aXRoIHViaV92b2x1bWVfaW5m
byBtZW1iZXIgd2hpY2gga2VlcHMKPiB0aGUgZm9ybWF0IGRlZmluZWQgaW4gbWFjcm8gVUJJRlNf
REZTX0RJUl9OQU1FIGJ5IHVzaW5nCj4gc3VwZXJfc2V0X3N5c2ZzX25hbWVfZ2VuZXJpYy4KPiAK
PiBUaGF0J3MgZm9yIHViaWZzLCBpdCB3aWxsIG91dHB1dCAidWJpZnMvPGRldj4iLgo+IAo+IGBg
YAo+ICQgLi9pb2N0bF9nZXRmc3N5c2ZzX3BhdGggL21udC91Ymlmcy90ZXN0ZmlsZQo+IHBhdGg6
IHViaWZzL3ViaTBfMAo+IAo+ICQgbHMgL3N5cy9mcy91Ymlmcy91YmkwXzAvCj4gZXJyb3JzX2Ny
YyAgZXJyb3JzX21hZ2ljICBlcnJvcnNfbm9kZQo+IGBgYAo+IAo+IFNpZ25lZC1vZmYtYnk6IEhv
bmdibyBMaSA8bGlob25nYm8yMkBodWF3ZWkuY29tPgo+IC0tLQo+ICAgZnMvdWJpZnMvc3VwZXIu
YyB8IDIgKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKClJldmlld2VkLWJ5
OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IAo+IGRpZmYgLS1naXQg
YS9mcy91Ymlmcy9zdXBlci5jIGIvZnMvdWJpZnMvc3VwZXIuYwo+IGluZGV4IDI5MTU4MzAwNWRk
MS4uY2IyNmI4YjI3ZWY2IDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL3N1cGVyLmMKPiArKysgYi9m
cy91Ymlmcy9zdXBlci5jCj4gQEAgLTIyNDksNiArMjI0OSw4IEBAIHN0YXRpYyBpbnQgdWJpZnNf
ZmlsbF9zdXBlcihzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCB2b2lkICpkYXRhLCBpbnQgc2lsZW50
KQo+ICAgCX0KPiAgIAo+ICAgCXN1cGVyX3NldF91dWlkKHNiLCBjLT51dWlkLCBzaXplb2YoYy0+
dXVpZCkpOwo+ICsJc3VwZXJfc2V0X3N5c2ZzX25hbWVfZ2VuZXJpYyhzYiwgVUJJRlNfREZTX0RJ
Ul9OQU1FLAo+ICsJCQkJICAgICBjLT52aS51YmlfbnVtLCBjLT52aS52b2xfaWQpOwo+ICAgCj4g
ICAJbXV0ZXhfdW5sb2NrKCZjLT51bW91bnRfbXV0ZXgpOwo+ICAgCXJldHVybiAwOwo+IAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
