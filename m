Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067CDCDB46E
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Oct 2023 11:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUIdjap9rWhHi//uZy4M8oBUVsan1bqV4Cdh/nmTfQg=; b=4iLP1uc8DGIMEDCioMpdSKi6yI
	ippfAAOchUOSbTgaO3fq31Oc4s3/zpQCr1VN8DrQNraZkpPbhkAf3uPWjTEvjPGAN/QO2jZNYKIPv
	pFN2MSJmuSk6DfxRG/TvZDg7yeS+aDyNOmfkuDuZkLJ9ahdJKhL8lVkqIv2kmyuZkAU7TXWdcKJ9r
	Rf5UjAP3/GKEwh+zhZjJ7tb8m7alH13sfsW/3VErIctQX+54hV+ThO7FdjJlmU+VxVUoEGR2qJnpx
	Fm7eHya0vLJ6SkNOJT0mhWDO2pfiPXaf7RWgfGaTbRnFwA87yTsMCFPsd9+VtsqADxzEBC+JIZI71
	Tcr4BXmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqtpR-000m2Z-1Z;
	Thu, 12 Oct 2023 11:26:09 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqtpN-000m1G-0g
	for linux-mtd@lists.infradead.org;
	Thu, 12 Oct 2023 11:26:07 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4S5nKH4Q9Qz9tJ0;
	Thu, 12 Oct 2023 19:21:55 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 12 Oct 2023 19:25:51 +0800
Subject: Re: [PATCH RFC] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
To: ZhaoLong Wang <wangzhaolong1@huawei.com>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>, <yangerkun@huawei.com>
References: <20231010142925.545238-1-wangzhaolong1@huawei.com>
 <9f96baf1-962e-d595-0e4f-797315cd0348@huawei.com>
 <b972f615-3882-18cf-5b44-7ec021f92e0a@huawei.com>
 <a8a2dc17-7a7a-e725-8ae2-e7e0146150f0@huawei.com>
 <d089e4ff-26dc-22e4-58b3-8756f8ebaabc@huawei.com>
 <2d04fa9e-e594-705c-339b-3090cb7d6fbd@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f1b27408-6eae-4195-4c97-c286c4ad04db@huawei.com>
Date: Thu, 12 Oct 2023 19:25:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <2d04fa9e-e594-705c-339b-3090cb7d6fbd@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_042605_701403_6BB21428 
X-CRM114-Status: GOOD (  15.18  )
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjMvMTAvMTIgMTc6MzEsIFpoYW9Mb25nIFdhbmcg5YaZ6YGTOgo+IAo+Pj4KPj4+PiAz
LsKgwqDCoMKgwqDCoMKgwqAgUDHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBQMgo+Pj4+IMKgwqDCoCBnbHVlYmlfY3JlYXRlIC0+IG10ZF9kZXZpY2VfcmVnaXN0ZXIgLT4g
YWRkX210ZF9kZXZpY2U6Cj4+Pj4gwqDCoMKgIGRldmljZV9yZWdpc3RlcsKgwqAgLy8gZGV2L210
ZDEgaXMgdmlzaWJsZQo+Pj4+Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGZkID0gb3BlbigvZGV2L210ZDEsIE9fV1JPTkxZKQo+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdsdWViaV9nZXRfZGV2aWNlCj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnbHVlYmktPmRl
c2MgPSB1Ymlfb3Blbl92b2x1bWUKPj4+Pgo+Pj4+IMKgwqDCoCBmdGxfYWRkX210ZAo+Pj4+IMKg
wqDCoMKgIG10ZF9yZWFkCj4+Pj4gwqDCoMKgwqDCoCBnbHVlYmlfcmVhZAo+Pj4+IMKgwqDCoMKg
wqDCoCBnbHVlYmktPmRlc2MgaXMgbm90IEVSUl9QVFIvTlVMTAo+Pj4+Cj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbG9zZShmZCkKPj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ2x1ZWJpX3B1dF9kZXZpY2UKPj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1YmlfY2xvc2Vfdm9s
dW1lCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBr
ZnJlZShkZXNjKQo+Pj4+IMKgwqDCoMKgwqDCoCB1YmlfcmVhZChnbHVlYmktPmRlc2MpwqDCoCAv
LyBVQUbCoCAow5cpCj4+Pj4KPj4+Cj4+PiBZZXMsIGl0J3MgYWxzbyBhIHByb2JsZW0uIFBlcmhh
cHMgaXQgc2hvdWxkIGJlIHNldCB0byBOVUxMIGFmdGVyCj4+PiBkZXN0cm95aW5nIGdsdWViaS0+
ZGVzYy4KPj4KPj4gVGhlIGtleSBwb2ludCBpcyB0aGF0ICdnbHVlYmktPmRlc2MnIGNoZWNrICYg
dXNhZ2UgaXMgbm90IGF0b21pYyBpbiAKPj4gZ2x1ZWJpX3JlYWQuIFNvIGZvbGxvd2luZyBwYXRj
aCBzdGlsbCBjYW4ndCBoYW5kbGUgc2l0dWF0aW9uIDMuCj4+Cj4gCj4gU2V0dGluZyB0aGUgZGVz
YyB0byBOVUxMIHdvcmtzIGJlY2F1c2UKPiBtdXRleF9sb2NrICJtdGRfdGFibGVfbXV0ZXgiIGlz
IGhlbGQgb24gYWxsIHBhdGhzIHdoZXJlCj4gZnRsX2FkZF9tdGQoKSBpcyBjYWxsZWQuCj4gCgpP
aCwgeW91J3JlIHJpZ2h0LiBKdXN0IG9uZSBuaXQgYmVsb3c6CgoKID4gQEAgLTE1NCw5ICsxNTks
MjYgQEAgc3RhdGljIGludCBnbHVlYmlfcmVhZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90
CiA+IGZyb20sIHNpemVfdCBsZW4sCiA+ICAgICAgICAgICAgICAgICAgc2l6ZV90ICpyZXRsZW4s
IHVuc2lnbmVkIGNoYXIgKmJ1ZikKID4gICB7CiA+ICAgICAgIGludCBlcnIgPSAwLCBsbnVtLCBv
ZmZzLCBieXRlc19sZWZ0OwogPiAtICAgIHN0cnVjdCBnbHVlYmlfZGV2aWNlICpnbHVlYmk7CiA+
ICsgICAgc3RydWN0IGdsdWViaV9kZXZpY2UgKmdsdWViaSA9IGNvbnRhaW5lcl9vZihtdGQsIHN0
cnVjdCAKZ2x1ZWJpX2RldmljZSwKID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBtdGQp
OwogPiArICAgIGludCBpc250X2dldCA9IHVubGlrZWx5KGdsdWViaS0+ZGVzYyA9PSBOVUxMKSA/
IDEgOiAwOwoKVGhpcyAndW5saWtleScgY2FuIGJlIHJlbW92ZWQuCgpSZW5hbWUgJ2lzbnRfZ2V0
JyBhcyAnaGFzX2Rlc2MnID8KCiA+ICsgICAgLyoqCiA+ICsgICAgICogSW4gbm9ybWFsIGNhc2Us
IHRoZSBVQkkgdm9sdW1lIGRlc2MgaGFzIGJlZW4gaW5pdGlhbGl6ZWQgYnkKID4gKyAgICAgKiAt
Pl9nZXRfZGV2aWNlKCkuIEhvd2V2ZXIsIGluIHRoZSBmdGwgbm90aWZpZXIgcHJvY2VzcywgdGhl
CiA+ICsgICAgICogLT5fZ2V0X2RldmljZSgpIGlzIG5vdCBleGVjdXRlZCBpbiBhZHZhbmNlIGFu
ZCB0aGUgTVREIGRldmljZQogPiArICAgICAqIGlzIGRpcmVjdGx5IHNjYW5uZWQgIHdoaWNoIGNh
dXNlIG51bGwgcG9pbnRlIGRlcmVmZXJlbmNlLgogPiArICAgICAqIFRoZXJlZm9yZSwgdHJ5IHRv
IGdldCB0aGUgTVREIGRldmljZSBoZXJlLgogPiArICAgICAqLwogPiArICAgIGlmICh1bmxpa2Vs
eShpc250X2dldCkpIHsKID4gKyAgICAgICAgZXJyID0gX19nZXRfbXRkX2RldmljZShtdGQpOwog
PiArICAgICAgICBpZiAoZXJyKSB7CiA+ICsgICAgICAgICAgICBlcnJfbXNnKCJjYW5ub3QgZ2V0
IE1URCBkZXZpY2UgJWQsIFVCSSBkZXZpY2UgJWQsIHZvbHVtZQogPiAlZCwgZXJyb3IgJWQiLAog
PiArICAgICAgICAgICAgICAgIG10ZC0+aW5kZXgsIGdsdWViaS0+dWJpX251bSwgZ2x1ZWJpLT52
b2xfaWQsIGVycik7CiA+ICsgICAgICAgICAgICByZXR1cm4gZXJyOwogPiArICAgICAgICB9CiA+
ICsgICAgfQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
