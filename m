Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21D2E7716A
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Dec 2024 12:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bUopkw4e3aiRXVyNtqx5jfYQQZ/UPvYBjtP5q6xTt8=; b=Mwh7lhrQ2iMa++zTtI0Bgm/jR1
	AGTvVuMH2xOmXepqnn1yj3YCIY+fRBL23fZ/d7jpZnE8c4Q87VqczjJr1QIB+ZYrKZb7dsV4IxVba
	nKp7zwZn+1m/1ZeMlxSw8El3JcAeSpksvXpcausdhNwfa/sjwSLRMg5p2YhvMxIlgfTpuTMeMvo1e
	ZS0OyycJmrRF86wwSDuciekQcwigL80Y4B7cgiTgBCJqipMiIyANV9oFHynhj/p29AdDz95bTECLT
	/7M1e4AwCqSjBP8vWuhHM26jYXrYm3oDXB6KSNTLgypkg+F5C764GjZ4NThwHdu8bZBtgO6xwQZXn
	yAWLBO3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMR76-00000006JPV-21Ou;
	Sat, 14 Dec 2024 12:19:16 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMR72-00000006JOd-1xnP
	for linux-mtd@lists.infradead.org;
	Sat, 14 Dec 2024 12:19:15 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Y9QFG1ypNzqSGl
	for <linux-mtd@lists.infradead.org>; Sat, 14 Dec 2024 20:17:22 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id EA6941400DC
	for <linux-mtd@lists.infradead.org>; Sat, 14 Dec 2024 20:19:08 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 14 Dec 2024 20:19:08 +0800
Subject: Re: [PATCH mtd-utils] ubi-utils: Fix integer overflow in mtdinfo.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241214105128.37995-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <0931efce-826c-c013-f40c-21b16c9dbc35@huawei.com>
Date: Sat, 14 Dec 2024 20:19:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241214105128.37995-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_041912_658018_58F4F97E 
X-CRM114-Status: GOOD (  17.35  )
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

1NogMjAyNC8xMi8xNCAxODo1MSwgQW50b24gTW9yeWFrb3Yg0LS1wDoKPiBSZXBvcnQgb2YgdGhl
IHN0YXRpYyBhbmFseXplcjoKPiBUaGUgdmFsdWUgb2YgYW4gYXJpdGhtZXRpYyBleHByZXNzaW9u
ICdyZWdpbmZvLT5vZmZzZXQgKyBpICogcmVnaW5mby0+ZXJhc2VzaXplJyBpcyBhIHN1YmplY3Qg
dG8gb3ZlcmZsb3cKPiBiZWNhdXNlIGl0cyBvcGVyYW5kcyBhcmUgbm90IGNhc3QgdG8gYSBsYXJn
ZXIgZGF0YSB0eXBlIGJlZm9yZSBwZXJmb3JtaW5nIGFyaXRobWV0aWMKPiAKPiBDb3JyZWN0aW9u
cyBleHBsYWluZWQ6Cj4gQWRkZWQgY2FzdGluZyBpIGFuZCBzdGFydCB0byB1bnNpZ25lZCBsb25n
IGxvbmcKPiAKPiBUcmlnZ2VycyBmb3VuZCBieSBzdGF0aWMgYW5hbHl6ZXIgU3ZhY2UuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQW50b24gTW9yeWFrb3YgPGFudC52Lm1vcnlha292QGdtYWlsLmNvbT4K
PiAKPiAtLS0KPiAgIHViaS11dGlscy9tdGRpbmZvLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdWJpLXV0
aWxzL210ZGluZm8uYyBiL3ViaS11dGlscy9tdGRpbmZvLmMKPiBpbmRleCA3ZGZmMGRlLi44NTAy
OTdiIDEwMDY0NAo+IC0tLSBhL3ViaS11dGlscy9tdGRpbmZvLmMKPiArKysgYi91YmktdXRpbHMv
bXRkaW5mby5jCj4gQEAgLTIwMyw3ICsyMDMsNyBAQCBzdGF0aWMgdm9pZCBwcmludF9yZWdpb25f
bWFwKGNvbnN0IHN0cnVjdCBtdGRfZGV2X2luZm8gKm10ZCwgaW50IGZkLAo+ICAgCQlyZXRfbG9j
a2VkID0gcmV0X2JhZCA9IGVycm5vX2xvY2tlZCA9IGVycm5vX2JhZCA9IDA7Cj4gICAKPiAgIAlm
b3IgKGkgPSAwOyBpIDwgcmVnaW5mby0+bnVtYmxvY2tzOyArK2kpIHsKPiAtCQlzdGFydCA9IHJl
Z2luZm8tPm9mZnNldCArIGkgKiByZWdpbmZvLT5lcmFzZXNpemU7Cj4gKwkJKHVuc2lnbmVkIGxv
bmcgbG9uZylzdGFydCA9IHJlZ2luZm8tPm9mZnNldCArICh1bnNpZ25lZCBsb25nIGxvbmcpaSAq
IHJlZ2luZm8tPmVyYXNlc2l6ZTsKPiAgIAkJcHJpbnRmKCIgJSppOiAlMDhseCAiLCB3aWR0aCwg
aSwgc3RhcnQpOwo+ICAgCj4gICAJCWlmIChyZXRfbG9ja2VkICE9IC0xKSB7Cj4gCgpXaGF0IEkg
bWVhbiBpcyBtb2RpZnlpbmcgbGlrZSBmb2xsb3dpbmc6CgpkaWZmIC0tZ2l0IGEvdWJpLXV0aWxz
L210ZGluZm8uYyBiL3ViaS11dGlscy9tdGRpbmZvLmMKaW5kZXggN2RmZjBkZS4uMTJkMzVlYiAx
MDA2NDQKLS0tIGEvdWJpLXV0aWxzL210ZGluZm8uYworKysgYi91YmktdXRpbHMvbXRkaW5mby5j
CkBAIC0xODUsNyArMTg1LDcgQEAgc3RhdGljIHZvaWQgcHJpbnRfdWJpX2luZm8oY29uc3Qgc3Ry
dWN0IG10ZF9pbmZvIAoqbXRkX2luZm8sCiAgc3RhdGljIHZvaWQgcHJpbnRfcmVnaW9uX21hcChj
b25zdCBzdHJ1Y3QgbXRkX2Rldl9pbmZvICptdGQsIGludCBmZCwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uc3QgcmVnaW9uX2luZm9fdCAqcmVnaW5mbykKICB7Ci0gICAgICAgdW5z
aWduZWQgbG9uZyBzdGFydDsKKyAgICAgICB1bnNpZ25lZCBsb25nIGxvbmcgc3RhcnQ7CiAgICAg
ICAgIGludCBpLCB3aWR0aDsKICAgICAgICAgaW50IHJldF9sb2NrZWQsIGVycm5vX2xvY2tlZCwg
cmV0X2JhZCwgZXJybm9fYmFkOwoKQEAgLTIwMyw3ICsyMDMsNyBAQCBzdGF0aWMgdm9pZCBwcmlu
dF9yZWdpb25fbWFwKGNvbnN0IHN0cnVjdCAKbXRkX2Rldl9pbmZvICptdGQsIGludCBmZCwKICAg
ICAgICAgICAgICAgICByZXRfbG9ja2VkID0gcmV0X2JhZCA9IGVycm5vX2xvY2tlZCA9IGVycm5v
X2JhZCA9IDA7CgogICAgICAgICBmb3IgKGkgPSAwOyBpIDwgcmVnaW5mby0+bnVtYmxvY2tzOyAr
K2kpIHsKLSAgICAgICAgICAgICAgIHN0YXJ0ID0gcmVnaW5mby0+b2Zmc2V0ICsgaSAqIHJlZ2lu
Zm8tPmVyYXNlc2l6ZTsKKyAgICAgICAgICAgICAgIHN0YXJ0ID0gcmVnaW5mby0+b2Zmc2V0ICsg
KHVuc2lnbmVkIGxvbmcgbG9uZylpICogCnJlZ2luZm8tPmVyYXNlc2l6ZTsKICAgICAgICAgICAg
ICAgICBwcmludGYoIiAlKmk6ICUwOGx4ICIsIHdpZHRoLCBpLCBzdGFydCk7CgogICAgICAgICAg
ICAgICAgIGlmIChyZXRfbG9ja2VkICE9IC0xKSB7CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
