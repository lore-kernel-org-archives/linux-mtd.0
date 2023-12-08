Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9E3C4167B
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Dec 2023 02:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qvf2ZlILqVnoFj81DFCLeV+ePFU91gdHkCvfPlcCzn8=; b=cY0CjM1tZGi4zOJrfP6gQ1dEWl
	O56Qu+zUfabcad+FbIwYwtZaLZi14npmw5gXJxtdBHLI5N4bkn7Q0xCYKFRdfcCr5Kp6k17yVSNfb
	V18mxUz1ir8ExD1pYNAlV6sCJheaOYcK7OD4RTVeJe8sWz+aS33v2Q6NuntB4Jpew8JzVT1yEVReQ
	yTbGkZqq0+KmhWgAzLcI/LAQpoO/9h55vWZ1LrHzDxbxvc4LPF5RAN46NcYRqxHIN6AFUqC7DEz8O
	cURrFd6FFSqzwuEu2nWc7YDyOGwELuKxMrfpPjDH9zrm5jDBGXcQhl5Ccf+VCShLWp7KW3htypXf+
	JZvkTfnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBQAZ-00EVp4-1f;
	Fri, 08 Dec 2023 02:00:47 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBQAV-00EVnq-2d
	for linux-mtd@lists.infradead.org;
	Fri, 08 Dec 2023 02:00:45 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4SmZ4h2ZWyzsRtk
	for <linux-mtd@lists.infradead.org>; Fri,  8 Dec 2023 09:56:36 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 10:00:26 +0800
Subject: Re: UBI scrubbing behavior when readonly
To: Chuck Meade <chuckmeade@gmail.com>, <linux-mtd@lists.infradead.org>
References: <cbff425d-0196-4124-99a0-f7ea8d6e6ab6@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <414d3586-0882-5bf9-a257-f819932ceae7@huawei.com>
Date: Fri, 8 Dec 2023 10:00:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <cbff425d-0196-4124-99a0-f7ea8d6e6ab6@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_180044_030422_3E499FF8 
X-CRM114-Status: GOOD (  18.67  )
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

5ZyoIDIwMjMvMTIvOCAxOjU2LCBDaHVjayBNZWFkZSDlhpnpgZM6Cj4gSGVsbG8sCj4KPiBEb2Vz
IFVCSSBzY3J1YmJpbmcgKG1vdmluZyBkYXRhIHRvIG5ldyBQRUIgd2hlbiByZWFkIG9wZXJhdGlv
bnMgcmVwb3J0IAo+IEVDQwo+IGJpdGZsaXBzKSBzdGlsbCBvY2N1ciB3aGVuIGEgVUJJRlMgbW91
bnRlZCBvbiB0aGUgVUJJIHZvbHVtZSBpcyAKPiByZWFkb25seSwgaW4KPiB0ZXJtcyBvZiBMaW51
eCBmaWxlc3lzdGVtIHBlcm1pc3Npb25zPwo+Cj4gSSBoYXZlIGxvb2tlZCBhdCB0aGUgVUJJIHNv
dXJjZSBmb3Igc2NydWJiaW5nLCBhbmQgaXQgYXBwZWFycyB0aGF0IGl0IAo+IHdpbGwgbm90Cj4g
b2NjdXIgd2hlbiB0aGUgVUJJIGRldmljZSAob3IgTVREIHBhcnRpdGlvbiB0byB3aGljaCB0aGUg
ZGV2aWNlIGlzIAo+IGF0dGFjaGVkKQo+IGlzIGluIHJlYWRvbmx5IG1vZGUuIEJ1dCB3aGF0IGlm
IHRoZSBVQkkgZGV2aWNlIGlzIGluIHJlYWQvd3JpdGUgbW9kZSwgCj4gYnV0IHRoZQo+IFVCSUZT
IG1vdW50ZWQgb24gdGhlIGRldmljZSBpcyBpbiByZWFkb25seSBtb2RlPwo+CkRvZXMgJ1VCSSBz
Y3J1YmJpbmcnIG1lYW4gdGhlIHdlYXJfbGV2ZWxpbmdfd29ya2VyKGUxIGNvbWVzIGZyb20gCnVi
aS0+c2NydWIpPyBJZiBzbywgSSB0aGluayBpdCBzdGlsbCB3b3JrIHdoZW4gVUJJIGlzIHJ3IG1v
ZGUgYW5kIHViaWZzIAppcyByZWFkb25seS4gRm9yIGV4YW1wbGU6IHViaWZzX2xlYl9yZWFkIC0+
IHViaV9sZWJfcmVhZCAtPiAKdWJpX2ViYV9yZWFkX2xlYiAtPiB1Ymlfd2xfc2NydWJfcGViOiB3
bF90cmVlX2FkZChlLCAmdWJpLT5zY3J1YinCoCAmJiAKZW5zdXJlX3dlYXJfbGV2ZWxpbmcKPiBJ
IGFtIHRyeWluZyB0byBjcmVhdGUgYSBjb25maWd1cmF0aW9uIHdoZXJlIHRoZSBVQklGUyBpcyBy
ZWFkb25seSBhdCAKPiB0aGUgTGludXgKPiBmaWxlc3lzdGVtIHBlcm1pc3Npb25zIGxldmVsLCBi
dXQgVUJJIHNjcnViYmluZyBzdGlsbCBvY2N1cnMgd2hlbiByZWFkCj4gb3BlcmF0aW9ucyByZXBv
cnQgZW5vdWdoIEVDQyBiaXRmbGlwcy7CoCBTbyBubyBMaW51eCB1c2Vyc3BhY2UgcHJvZ3JhbXMg
Cj4gbWF5Cj4gbW9kaWZ5IHRoZSBmaWxlc3lzdGVtIGR1ZSB0byBwZXJtaXNzaW9ucywgYnV0IFVC
SSBzY3J1YmJpbmcgc3RpbGwgCj4gd291bGQgb2NjdXIuCj4KPiBJcyB0aGlzIHBvc3NpYmxlLCBv
ciBhbSBJIG1pc3Npbmcgc29tZXRoaW5nIGluIHRoZSBVQkkgc291cmNlIGNvZGU/Cj4KPiBUaGFu
a3MsCj4gQ2h1Y2sKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cj4gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
