Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132FEC48BC4
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Feb 2024 04:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6ReTV9tOuqoNy4uhELlLyBdH3WypVN/Rh//otUHphg=; b=beTu3FbheqxwaA/aHsPApPcBdv
	3CIGnSdII6/IZvxnaBGc7u8Akx/QdyANn+/8WV9cy3UfQN/F84jAfMOa/xL4C/w3zAjV0JnHsmrnY
	oSveFITVbQqS7omM6Eh60PcdYEDouCyHzB3r3/yd1mQE9crT9qHsDEHcdFoSmRadTM2dY0r/Ije//
	Bh0AbGI2Bc8jdRU2/HuFbfiPw7hA6piB4+cm3nQnFj2DlBAel4r37rRkLCOfwex2jyMcxM6FHyOEt
	oYbotNzclmJ8lqMfu2lq3MWqT8KTpctlCARmDf4KW1SB13HP5CcDVb4O0hwsNLGRERMGLthKIj3cD
	6Fpbu1iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcHin-0000000D7SX-3xEd;
	Tue, 20 Feb 2024 04:27:09 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcHil-0000000D7RX-0LLq
	for linux-mtd@lists.infradead.org;
	Tue, 20 Feb 2024 04:27:09 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Tf5pM3phkz1FKvd;
	Tue, 20 Feb 2024 12:22:03 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id D8FAF18005F;
	Tue, 20 Feb 2024 12:26:53 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 12:26:52 +0800
Subject: Re: [PATCH] ubi: correct the calculation of fastmap size
To: Zhang Yi <yi.zhang@huaweicloud.com>, <linux-mtd@lists.infradead.org>
CC: <richard@nod.at>, <yi.zhang@huawei.com>, <yukuai3@huawei.com>
References: <20240220024903.2477468-1-yi.zhang@huaweicloud.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <8128700f-1cc6-c8fa-466a-3110c7cce233@huawei.com>
Date: Tue, 20 Feb 2024 12:26:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240220024903.2477468-1-yi.zhang@huaweicloud.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_202707_319408_B6C3866F 
X-CRM114-Status: GOOD (  12.28  )
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

1NogMjAyNC8yLzIwIDEwOjQ5LCBaaGFuZyBZaSDQtLXAOgo+IEZyb206IFpoYW5nIFlpIDx5aS56
aGFuZ0BodWF3ZWkuY29tPgo+IAo+IE5vdyB0aGF0IHRoZSBjYWxjdWxhdGlvbiBvZiBmYXN0bWFw
IHNpemUgaW4gdWJpX2NhbGNfZm1fc2l6ZSgpIGlzCj4gaW5jb3JyZWN0IHNpbmNlIGl0IG1pc3Mg
ZWFjaCB1c2VyIHZvbHVtZSdzIHViaV9mbV9lYmEgc3RydWN0dXJlIGFuZCB0aGUKPiBJbnRlcm5h
bCBVQkkgdm9sdW1lIGluZm8uIExldCdzIGNvcnJlY3QgdGhlIGNhbGN1bGF0aW9uLgo+IAo+IENj
OiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogWmhhbmcgWWkgPHlpLnpo
YW5nQGh1YXdlaS5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL210ZC91YmkvZmFzdG1hcC5jIHwgNyAr
KysrLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQoKTG9va3MgbGlrZSB0aGUgYXNzZXJ0aW9uICd1YmlfYXNzZXJ0KGZtX3BvcyA8PSB1YmktPmZt
X3NpemUpJyBoYXMgbmV2ZXIgCmZhaWxlZCBpbiB0aGUgcmVhbCB3b3JsZCwgbWF5YmUgdGhlIG1p
c3NpbmcgY2FsY3VsYXRlZCBzaXplIGlzIHRvbyBzbWFsbCAKKHNpemVvZihzdHJ1Y3QgdWJpX2Zt
X2ViYSkgKiAxMjkgPSA4ICogMTI5ID0gMTAzMikgYW5kIGhhcmQgdG8gdHJpZ2dlciAKYW4gZWZm
ZWN0aXZlIHByb2JsZW0sIG9yIG5vIG9uZSB3aWxsIGNyZWF0ZSBtYW55IHZvbHVtZXMuCgpJIGhh
dmUgdGVzdGVkIG9uIHNldmVyYWwgdHlwZXMgb2YgZmxhc2hlcywgYWxsIHViaSB0ZXN0cyhmcm9t
IG10ZC11dGlscykgCmFyZSBwYXNzZWQuCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVu
Z3poaWhhbzFAaHVhd2VpLmNvbT4KCgo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC91Ymkv
ZmFzdG1hcC5jIGIvZHJpdmVycy9tdGQvdWJpL2Zhc3RtYXAuYwo+IGluZGV4IDJhNzI4YzMxZTZi
OC4uOWE0OTQwODc0YmU1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3ViaS9mYXN0bWFwLmMK
PiArKysgYi9kcml2ZXJzL210ZC91YmkvZmFzdG1hcC5jCj4gQEAgLTg1LDkgKzg1LDEwIEBAIHNp
emVfdCB1YmlfY2FsY19mbV9zaXplKHN0cnVjdCB1YmlfZGV2aWNlICp1YmkpCj4gICAJCXNpemVv
ZihzdHJ1Y3QgdWJpX2ZtX3NjYW5fcG9vbCkgKwo+ICAgCQlzaXplb2Yoc3RydWN0IHViaV9mbV9z
Y2FuX3Bvb2wpICsKPiAgIAkJKHViaS0+cGViX2NvdW50ICogc2l6ZW9mKHN0cnVjdCB1YmlfZm1f
ZWMpKSArCj4gLQkJKHNpemVvZihzdHJ1Y3QgdWJpX2ZtX2ViYSkgKwo+IC0JCSh1YmktPnBlYl9j
b3VudCAqIHNpemVvZihfX2JlMzIpKSkgKwo+IC0JCXNpemVvZihzdHJ1Y3QgdWJpX2ZtX3ZvbGhk
cikgKiBVQklfTUFYX1ZPTFVNRVM7Cj4gKwkJKChzaXplb2Yoc3RydWN0IHViaV9mbV9lYmEpICsK
PiArCQkgIHNpemVvZihzdHJ1Y3QgdWJpX2ZtX3ZvbGhkcikpICoKPiArCQkgKFVCSV9NQVhfVk9M
VU1FUyArIFVCSV9JTlRfVk9MX0NPVU5UKSkgKwo+ICsJCSh1YmktPnBlYl9jb3VudCAqIHNpemVv
ZihfX2JlMzIpKTsKPiAgIAlyZXR1cm4gcm91bmR1cChzaXplLCB1YmktPmxlYl9zaXplKTsKPiAg
IH0KPiAgIAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
