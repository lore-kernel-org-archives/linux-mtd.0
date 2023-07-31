Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDB4C001DC
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jul 2023 12:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vPTxD+wNjVT4W4A9fFRGIvfYvT/ZEYV/EsELf9OylfE=; b=P5IIq9whXbT32KxXM91qTJ+awc
	qAJ4ngwqSJLGbm8qHTPEx/jUnB8lwP7lacADEUlttbKOUFdSRGpYwbb9mT7xsv+PmbqE263VlrCCL
	rR0R1XvT4eyf0E2FO73Tza41CQu2g6QURUARWuW4G0nCe5Ey2S91wmRKNtT+HT7+mAX7JXFCVJgHR
	bpft9pOG6YlXiBDktsDpPn1gyE+eNLGqeBKNyPChJ3Hxn0dfE08Yff5MgvnUoiOrJDd0Exj+ff6xn
	HYo4sM9n7domm7ucYOXHnS9uNXc7UaUrkh5HzTiFyvv24nI8TEpYIzeC0wrNnfBSmBkOHc5ZMKMXF
	P/ke+B1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRmo-00FWjR-0b;
	Mon, 31 Jul 2023 12:14:06 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRml-00FWhW-0z
	for linux-mtd@lists.infradead.org;
	Mon, 31 Jul 2023 12:14:04 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RDxsw0JkVzLnhq;
	Mon, 31 Jul 2023 20:11:16 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 20:13:55 +0800
Subject: Re: [PATCH V2 4/5] ubi: Reserve sufficient buffer length for the
 input mask
To: ZhaoLong Wang <wangzhaolong1@huawei.com>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>
References: <20230718085119.3885747-1-wangzhaolong1@huawei.com>
 <20230718085119.3885747-5-wangzhaolong1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <412c027f-a96c-6de3-f493-749566e8c3ac@huawei.com>
Date: Mon, 31 Jul 2023 20:13:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230718085119.3885747-5-wangzhaolong1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_051403_517941_AA5E8DD1 
X-CRM114-Status: GOOD (  13.85  )
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

1NogMjAyMy83LzE4IDE2OjUxLCBaaGFvTG9uZyBXYW5nINC0tcA6Cj4gQmVjYXVzZSB0aGUgbWFz
ayByZWNlaXZlZCBieSB0aGUgZW11bGF0ZV9mYWlsdXJlcyBpbnRlcmZhY2UKPiBpcyBhIDMyLWJp
dCB1bnNpZ25lZCBpbnRlZ2VyLCBlbnN1cmUgdGhhdCB0aGVyZSBpcyBzdWZmaWNpZW50Cj4gYnVm
ZmVyIGxlbmd0aCB0byByZWNlaXZlIGFuZCBkaXNwbGF5IHRoaXMgdmFsdWUuCj4gCj4gU2lnbmVk
LW9mZi1ieTogWmhhb0xvbmcgV2FuZyA8d2FuZ3poYW9sb25nMUBodWF3ZWkuY29tPgo+IC0tLQo+
IFYyOgo+ICAgIC0gQSAxNi1ieXRlIGJ1ZmZlciBpcyByZXNlcnZlZCwgYXMgaW1wbGVtZW50ZWQg
Ynkgb3RoZXIgaW50ZXJmYWNlcy4KPiAKPiAgIGRyaXZlcnMvbXRkL3ViaS9kZWJ1Zy5jIHwgNCAr
Ky0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC91YmkvZGVidWcuYyBiL2RyaXZlcnMvbXRkL3Vi
aS9kZWJ1Zy5jCj4gaW5kZXggMDE2YTg2MWM1MDI5Li4xYzNmMWEyNDM2ZTUgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9tdGQvdWJpL2RlYnVnLmMKPiArKysgYi9kcml2ZXJzL210ZC91YmkvZGVidWcu
Ywo+IEBAIC0zMzIsNyArMzMyLDcgQEAgc3RhdGljIHNzaXplX3QgZGZzX2ZpbGVfcmVhZChzdHJ1
Y3QgZmlsZSAqZmlsZSwgY2hhciBfX3VzZXIgKnVzZXJfYnVmLAo+ICAgCXN0cnVjdCBkZW50cnkg
KmRlbnQgPSBmaWxlLT5mX3BhdGguZGVudHJ5Owo+ICAgCXN0cnVjdCB1YmlfZGV2aWNlICp1Ymk7
Cj4gICAJc3RydWN0IHViaV9kZWJ1Z19pbmZvICpkOwo+IC0JY2hhciBidWZbOF07Cj4gKwljaGFy
IGJ1ZlsxNl07Cj4gICAJaW50IHZhbDsKPiAgIAo+ICAgCXViaSA9IHViaV9nZXRfZGV2aWNlKHVi
aV9udW0pOwo+IEBAIC00MDAsNyArNDAwLDcgQEAgc3RhdGljIHNzaXplX3QgZGZzX2ZpbGVfd3Jp
dGUoc3RydWN0IGZpbGUgKmZpbGUsIGNvbnN0IGNoYXIgX191c2VyICp1c2VyX2J1ZiwKPiAgIAlz
dHJ1Y3QgdWJpX2RldmljZSAqdWJpOwo+ICAgCXN0cnVjdCB1YmlfZGVidWdfaW5mbyAqZDsKPiAg
IAlzaXplX3QgYnVmX3NpemU7Cj4gLQljaGFyIGJ1Zls4XSA9IHswfTsKPiArCWNoYXIgYnVmWzE2
XSA9IHswfTsKPiAgIAlpbnQgdmFsOwo+ICAgCj4gICAJdWJpID0gdWJpX2dldF9kZXZpY2UodWJp
X251bSk7Cj4gCgoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdl
aS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
