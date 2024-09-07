Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F612E6FE53
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Sep 2024 08:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ae6YhffnO0/FonDBe/w7SxOHLwctrb6GassqYcWDfgo=; b=HZNGUPaEb94/+i9Tq86mJ2mG52
	XWjqIav3PKZuCihmTyl7hM7eyJvbSzNG4V1t7YLFRL5MZ6dPuZZoDaa3ukknYWwzkOCjmKeXpIj6a
	TnBtqQEFYJlbxHs4xLq6+DIL3LHCakpMfOimjYN3VMqliS+qa0YBl5tgqlxkusRPtxZJ7jCkd8ZOV
	aHqzm5C5iRvdbV5DGN1c11D7gULUVbAQbPYYNDI6H5NmrRS8phdIOGdPXsiC787yLHOgetEgSEHSZ
	MH32S33jvcuLzqA5VAvToS6v0qmthMoJGU1+NR6jsrU+5sEqL+/1YQ8iZzvXe5tlaBYClNiU0WoLK
	55B5SshA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smqvI-0000000EfxB-3src;
	Sat, 07 Sep 2024 08:36:00 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smquO-0000000Efpp-2xJx
	for linux-mtd@lists.infradead.org;
	Sat, 07 Sep 2024 08:35:06 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4X15wW41d6z1P99m;
	Sat,  7 Sep 2024 16:33:47 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id C1B0D1800F2;
	Sat,  7 Sep 2024 16:34:48 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 7 Sep 2024 16:34:48 +0800
Subject: Re: [PATCH] mtd: ubi: Rmove unused declaration in header file
To: Zhang Zekun <zhangzekun11@huawei.com>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>
CC: <chenjun102@huawei.com>
References: <20240907080025.44001-1-zhangzekun11@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <ba35382d-9cce-1c7d-951a-e789f5caa036@huawei.com>
Date: Sat, 7 Sep 2024 16:34:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240907080025.44001-1-zhangzekun11@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240907_013505_041722_82BA4257 
X-CRM114-Status: GOOD (  11.23  )
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

1NogMjAyNC85LzcgMTY6MDAsIFpoYW5nIFpla3VuINC0tcA6Cj4gVGhlIGRlZmluaXRpb24gb2Yg
dWJpX2Rlc3Ryb3lfYWkoKSBoYXMgYmVlbiByZW1vdmVkIHNpbmNlCj4gY29tbWl0IGRhYzZlMjA4
N2E0MSAoIlVCSTogQWRkIGZhc3RtYXAgc3R1ZmYgdG8gYXR0YWNoLmMiKS4KPiBSZW1vdmUgdGhl
IGVtcHR5IGRlY2xhcmF0aW9uIGluIGhlYWRlciBmaWxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFpo
YW5nIFpla3VuIDx6aGFuZ3pla3VuMTFAaHVhd2VpLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvbXRk
L3ViaS91YmkuaCB8IDEgLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiAKClJl
dmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC91YmkvdWJpLmggYi9kcml2ZXJzL210ZC91YmkvdWJpLmgKPiBp
bmRleCAxYzllODc0ZThlZGUuLmM3OTJiOWJjYWI5YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210
ZC91YmkvdWJpLmgKPiArKysgYi9kcml2ZXJzL210ZC91YmkvdWJpLmgKPiBAQCAtODMxLDcgKzgz
MSw2IEBAIHZvaWQgdWJpX3JlbW92ZV9hdihzdHJ1Y3QgdWJpX2F0dGFjaF9pbmZvICphaSwgc3Ry
dWN0IHViaV9haW5mX3ZvbHVtZSAqYXYpOwo+ICAgc3RydWN0IHViaV9haW5mX3BlYiAqdWJpX2Vh
cmx5X2dldF9wZWIoc3RydWN0IHViaV9kZXZpY2UgKnViaSwKPiAgIAkJCQkgICAgICAgc3RydWN0
IHViaV9hdHRhY2hfaW5mbyAqYWkpOwo+ICAgaW50IHViaV9hdHRhY2goc3RydWN0IHViaV9kZXZp
Y2UgKnViaSwgaW50IGZvcmNlX3NjYW4pOwo+IC12b2lkIHViaV9kZXN0cm95X2FpKHN0cnVjdCB1
YmlfYXR0YWNoX2luZm8gKmFpKTsKPiAgIAo+ICAgLyogdnRibC5jICovCj4gICBpbnQgdWJpX2No
YW5nZV92dGJsX3JlY29yZChzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBpbnQgaWR4LAo+IAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
