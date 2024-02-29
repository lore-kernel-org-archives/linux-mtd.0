Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F8CC48BF6
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Feb 2024 04:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3JGzQlZwZhcTDSP0Lvlaj6u2KnY2UoMUeE3IF/PECak=; b=gv1H+SmN+I9GQXDo9N/dTqQy2Z
	d7aHEev6iMjBbOb/qI3Q4gVnBxavXzIjtQvI1vOYzTniLIglNjqUBvaxOXxAy3TCtJVd7y7gxoExc
	44mm3uZSsuIKbyqVXguMGOn6a30Du8m/J+YdmIDikrEhliiA6Jk6/AItqso20nm7Te6rgM0nktqrr
	JSRilMJwhWKfPU2jqF4Ghfpb0NzQLsSdq9GphHIyErDM4TeGw65635M9H+H/kg4/4HZ371U0qKLVb
	QvXyK7bFiq5vjiflyxlqvuHjA57uRqEZymejqds1Mz2GbHZkIjHaGtddztyc/h20OaDbbsnD0XIrs
	AjnquuTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfXg0-0000000Bztf-3RJZ;
	Thu, 29 Feb 2024 04:05:44 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfXfy-0000000Bzs1-0iVN
	for linux-mtd@lists.infradead.org;
	Thu, 29 Feb 2024 04:05:43 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Tld0Q48mpz1FLNq;
	Thu, 29 Feb 2024 12:04:54 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id E06C214011A;
	Thu, 29 Feb 2024 12:04:55 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 12:04:55 +0800
Subject: Re: [PATCH v3] mtd: ubi: fix NVMEM over UBI volumes on 32-bit systems
To: Daniel Golle <daniel@makrotopia.org>, Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <ff29447dcee834c17e4e1e99725b9454c90136ca.1709178325.git.daniel@makrotopia.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <b64a4423-922b-de8e-3c43-fc5bf2df19be@huawei.com>
Date: Thu, 29 Feb 2024 12:04:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ff29447dcee834c17e4e1e99725b9454c90136ca.1709178325.git.daniel@makrotopia.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_200542_397705_ACA66119 
X-CRM114-Status: GOOD (  16.21  )
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

1NogMjAyNC8yLzI5IDExOjQ3LCBEYW5pZWwgR29sbGUg0LS1wDoKPiBBIGNvbXBpbGVyIHdhcm5p
bmcgcmVsYXRlZCB0byBzaXplb2YoaW50KSAhPSA4IHdoZW4gY2FsbGluZyBkb19kaXYoKQo+IGlz
IHRyaWdnZXJlZCB3aGVuIGJ1aWxkaW5nIG9uIDMyLWJpdCBwbGF0Zm9ybXMuCj4gQWRkcmVzcyB0
aGlzIGJ5IHVzaW5nIGludGVnZXIgdHlwZXMgaGF2aW5nIGEgd2VsbC1kZWZpbmVkIHNpemUuCj4g
Cj4gRml4ZXM6IDNjZTQ4NTgwM2RhMSAoIm10ZDogdWJpOiBwcm92aWRlIE5WTUVNIGxheWVyIG92
ZXIgVUJJIHZvbHVtZXMiKQo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBHb2xsZSA8ZGFuaWVsQG1h
a3JvdG9waWEub3JnPgo+IC0tLQo+IHYzOiB1c2Ugc2l6ZV90IGFsc28gZm9yICd0b19yZWFkJyB2
YXJpYWJsZSB0byBhdm9pZCB0cnVuY2F0aW9uCj4gICAgICAobm8gcHJvYmxlbSBpbiBwcmFjdGlz
ZSBiZXlvbmQgdGhlIGNvbXBpbGVyIHdhcm5pbmcpCj4gdjI6IHVzZSBzaXplX3QgZm9yICdieXRl
c19sZWZ0JyB2YXJpYWJsZSB0byBtYXRjaCBwYXJhbWV0ZXIgdHlwZQo+IAo+ICAgZHJpdmVycy9t
dGQvdWJpL252bWVtLmMgfCA1ICsrKystCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3po
aWhhbzFAaHVhd2VpLmNvbT4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvdWJpL252bWVtLmMg
Yi9kcml2ZXJzL210ZC91YmkvbnZtZW0uYwo+IGluZGV4IGI3YTkzYzQ5NWQxNzIuLjhhZWI5YzQy
OGU1MTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvdWJpL252bWVtLmMKPiArKysgYi9kcml2
ZXJzL210ZC91YmkvbnZtZW0uYwo+IEBAIC0yMyw5ICsyMywxMiBAQCBzdHJ1Y3QgdWJpX252bWVt
IHsKPiAgIHN0YXRpYyBpbnQgdWJpX252bWVtX3JlZ19yZWFkKHZvaWQgKnByaXYsIHVuc2lnbmVk
IGludCBmcm9tLAo+ICAgCQkJICAgICAgdm9pZCAqdmFsLCBzaXplX3QgYnl0ZXMpCj4gICB7Cj4g
LQlpbnQgZXJyID0gMCwgbG51bSA9IGZyb20sIG9mZnMsIGJ5dGVzX2xlZnQgPSBieXRlcywgdG9f
cmVhZDsKPiArCXNpemVfdCB0b19yZWFkLCBieXRlc19sZWZ0ID0gYnl0ZXM7Cj4gICAJc3RydWN0
IHViaV9udm1lbSAqdW52ID0gcHJpdjsKPiAgIAlzdHJ1Y3QgdWJpX3ZvbHVtZV9kZXNjICpkZXNj
Owo+ICsJdWludDMyX3Qgb2ZmczsKPiArCXVpbnQ2NF90IGxudW0gPSBmcm9tOwo+ICsJaW50IGVy
ciA9IDA7Cj4gICAKPiAgIAlkZXNjID0gdWJpX29wZW5fdm9sdW1lKHVudi0+dWJpX251bSwgdW52
LT52b2xfaWQsIFVCSV9SRUFET05MWSk7Cj4gICAJaWYgKElTX0VSUihkZXNjKSkKPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
