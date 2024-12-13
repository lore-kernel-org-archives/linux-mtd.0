Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73927E7717F
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Dec 2024 02:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hKfsLwpXBw5ezYZjPTqHgHHYtKrdAhHlKjyKaZyvzHE=; b=D3S6GizkZ66Ngo7JYEsMt/DmMf
	zdeyEyCxKKmghWNx/u2R0g9DMCsKX8dPb3XltjXETeE1O9rRgQy/NotWvP4u39dCZTGWJ3O6pDfN6
	iBv1atJQe42PR0je1aVeyoA5B8Xi4a24hCJ7m5AUkDRX2+IVqJKleDN0+Ul/vHnrYF2ELlhvu+GKB
	BGbqB08eX2EhZ7Lyo8dK4ZKOO92LthLLVV4yBI3lLJ1AZ7emZej8VAlVZ0Wz4tfM3uPQTbkl1gTC1
	s3HUNk7EDlqhP/VIreDHSeupTC9z8+CO6y47XrW4xAXtgP2MGCs+Mse5j0LKz1MJykMj3N4ddqd5D
	QkTTKgxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLvQo-00000002VXS-2aVW;
	Fri, 13 Dec 2024 02:29:30 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLvQk-00000002VWk-279J
	for linux-mtd@lists.infradead.org;
	Fri, 13 Dec 2024 02:29:28 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Y8YFM52c6z20lg0
	for <linux-mtd@lists.infradead.org>; Fri, 13 Dec 2024 10:29:27 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 64C6C1402C3
	for <linux-mtd@lists.infradead.org>; Fri, 13 Dec 2024 10:29:10 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 13 Dec 2024 10:29:09 +0800
Subject: Re: [PATCH mtd-utils] ubi-utils: Fix integer overflow in mtdinfo.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241212171358.53333-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <8c4ba115-fedc-8f8f-974d-e1e417f90893@huawei.com>
Date: Fri, 13 Dec 2024 10:29:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241212171358.53333-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_182926_693923_EB8A3BFD 
X-CRM114-Status: GOOD (  16.64  )
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

1NogMjAyNC8xMi8xMyAxOjEzLCBBbnRvbiBNb3J5YWtvdiDQtLXAOgo+IFJlcG9ydCBvZiB0aGUg
c3RhdGljIGFuYWx5emVyOgo+IFRoZSB2YWx1ZSBvZiBhbiBhcml0aG1ldGljIGV4cHJlc3Npb24g
J3JlZ2luZm8tPm9mZnNldCArIGkgKiByZWdpbmZvLT5lcmFzZXNpemUnIGlzIGEgc3ViamVjdCB0
byBvdmVyZmxvdwo+IGJlY2F1c2UgaXRzIG9wZXJhbmRzIGFyZSBub3QgY2FzdCB0byBhIGxhcmdl
ciBkYXRhIHR5cGUgYmVmb3JlIHBlcmZvcm1pbmcgYXJpdGhtZXRpYwo+IAo+IENvcnJlY3Rpb25z
IGV4cGxhaW5lZDoKPiBBZGRlZCBjYXN0aW5nIHJlZ2luZm8tPm9mZnNldCB0byBsb25nIGxvbmcK
PiAKPiBUcmlnZ2VycyBmb3VuZCBieSBzdGF0aWMgYW5hbHl6ZXIgU3ZhY2UuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQW50b24gTW9yeWFrb3YgPGFudC52Lm1vcnlha292QGdtYWlsLmNvbT4KPiAKPiAt
LS0KPiAgIHViaS11dGlscy9tdGRpbmZvLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdWJpLXV0aWxzL210
ZGluZm8uYyBiL3ViaS11dGlscy9tdGRpbmZvLmMKPiBpbmRleCA3ZGZmMGRlLi44NTAyOTdiIDEw
MDY0NAo+IC0tLSBhL3ViaS11dGlscy9tdGRpbmZvLmMKPiArKysgYi91YmktdXRpbHMvbXRkaW5m
by5jCj4gQEAgLTIwMyw3ICsyMDMsNyBAQCBzdGF0aWMgdm9pZCBwcmludF9yZWdpb25fbWFwKGNv
bnN0IHN0cnVjdCBtdGRfZGV2X2luZm8gKm10ZCwgaW50IGZkLAo+ICAgCQlyZXRfbG9ja2VkID0g
cmV0X2JhZCA9IGVycm5vX2xvY2tlZCA9IGVycm5vX2JhZCA9IDA7Cj4gICAKPiAgIAlmb3IgKGkg
PSAwOyBpIDwgcmVnaW5mby0+bnVtYmxvY2tzOyArK2kpIHsKPiAtCQlzdGFydCA9IHJlZ2luZm8t
Pm9mZnNldCArIGkgKiByZWdpbmZvLT5lcmFzZXNpemU7CgpIaSBBbnRvbi4KSSB0aGluayB0aGUg
ZXhwcmVzc2lvbiAnaSpyZWdpbmZvLT5lcmFzZXNpemUnIGNvdWxkIG92ZXJmbG93IHRvby4gCkJl
c2lkZXMsICd1bnNpZ25lZCBsb25nIHN0YXJ0JyBjb3VsZCBiZSBhIDMyLWJpdCBudW1iZXIgb24g
YSAzMi1iaXQgCnBsYXRmb3JtLgpTbywgd2Ugc2hvdWxkIG1ha2UgJ3N0YXJ0JyBiZSB0aGUgJ3Vu
c2lnbmVkIGxvbmcgbG9uZycgdHlwZSwgYW5kIHRoZW4gCmNvbnZlcnQgJ2knIGludG8gJ3Vuc2ln
bmVkIGxvbmcgbG9uZycgaW4gZXhwcmVzc2lvbiAnaSAqIApyZWdpbmZvLT5lcmFzZXNpemUnLiBG
b3IgZXhhbXBsZSwgc3RhcnQgPSByZWdpbmZvLT5vZmZzZXQgKyAodW5zaWduZWQgCmxvbmcgbG9u
ZylpICogcmVnaW5mby0+ZXJhc2VzaXplLgo+ICsJCXN0YXJ0ID0gKGxvbmcgbG9uZylyZWdpbmZv
LT5vZmZzZXQgKyBpICogcmVnaW5mby0+ZXJhc2VzaXplOwo+ICAgCQlwcmludGYoIiAlKmk6ICUw
OGx4ICIsIHdpZHRoLCBpLCBzdGFydCk7Cj4gICAKPiAgIAkJaWYgKHJldF9sb2NrZWQgIT0gLTEp
IHsKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
