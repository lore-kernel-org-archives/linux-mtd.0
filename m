Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAC6C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 03:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z6oDRvifnnM3actPvzBNVFr2rxy5ORmXh1B91vPFWy4=; b=BbzLjPGleZx5oj
	p+g/wfUUFkTZmLnlgnEdPrj9L1LWu0a0fOf59QYFql3QgQCgqhyVqByTm/5v/1NPZ0BlgpFt3qTMu
	L5hIOH3SAzJJc8FC998YqbXSUfuj5ZMpmnb1rw0pNIqksRJd3A1oYpObIzvm2i1X8USawTmmHqMbm
	NAWTPLqpTdyA0Sb4nUIKa/la3HYPH+bgMe2d6kymtgRnBYVkuMVwrFRiJpnc31hJvHbH2lA/tDT82
	+ayNGFhlzGrztTC51RtV4T1i2BE45KwMfKhog7N6B9UlWS2lnTuk1ZYxtF9KpR9eMnKPwP+rS+5c3
	2+5yQzNdRnXV7TW1zk8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxgRn-00DVMo-Ia; Wed, 23 Nov 2022 03:29:15 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxgRk-00DVHJ-9r
	for linux-mtd@lists.infradead.org; Wed, 23 Nov 2022 03:29:13 +0000
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NH6695YydzmW4H;
	Wed, 23 Nov 2022 11:28:33 +0800 (CST)
Received: from [10.67.109.51] (10.67.109.51) by canpemm500009.china.huawei.com
 (7.192.105.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 23 Nov
 2022 11:29:04 +0800
Message-ID: <ad8ff736-bbce-2ec3-301f-691401a80bd1@huawei.com>
Date: Wed, 23 Nov 2022 11:29:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2] ubifs: Fix build errors as symbol undefined
To: <richard@nod.at>, <s.hauer@pengutronix.de>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<weiyongjun1@huawei.com>, <yusongping@huawei.com>
References: <20221121111847.71648-1-hucool.lihua@huawei.com>
From: "Lihua (lihua, ran)" <hucool.lihua@huawei.com>
In-Reply-To: <20221121111847.71648-1-hucool.lihua@huawei.com>
X-Originating-IP: [10.67.109.51]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_192912_543200_2C7F0D3E 
X-CRM114-Status: GOOD (  11.08  )
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

cGluZwoK5ZyoIDIwMjIvMTEvMjEgMTk6MTgsIExpIEh1YSDlhpnpgZM6Cj4gV2l0aCBDT05GSUdf
VUJJRlNfRlNfQVVUSEVOVElDQVRJT04gbm90IHNldCwgdGhlIGNvbXBpbGVyIGNhbiBhc3N1bWUg
dGhhdAo+IHViaWZzX25vZGVfY2hlY2tfaGFzaCgpIGlzIG5ldmVyIHRydWUgYW5kIGRyb3BzIHRo
ZSBjYWxsIHRvIHViaWZzX2JhZF9oYXNoKCkuCj4gSXMgQ09ORklHX0NDX09QVElNSVpFX0ZPUl9T
SVpFIGVuYWJsZWQgdGhpcyBvcHRpbWl6YXRpb24gZG9lcyBub3QgaGFwcGVuIGFueW1vcmUuCj4g
Cj4gU28gV2hlbiBDT05GSUdfVUJJRlNfRlMgYW5kIENPTkZJR19DQ19PUFRJTUlaRV9GT1JfU0la
RSBpcyBlbmFibGVkIGJ1dAo+IENPTkZJR19VQklGU19GU19BVVRIRU5USUNBVElPTiBpcyBub3Qg
c2V0LCB0aGUgYnVpbGQgZXJyb3JzIGlzIGFzIGZvbGxvd2Q6Cj4gICAgICBFUlJPUjogbW9kcG9z
dDogInViaWZzX2JhZF9oYXNoIiBbZnMvdWJpZnMvdWJpZnMua29dIHVuZGVmaW5lZCEKPiAKPiBG
aXggaXQgYnkgYWRkIG5vLW9wIHViaWZzX2JhZF9oYXNoKCkgZm9yIHRoZSBDT05GSUdfVUJJRlNf
RlNfQVVUSEVOVElDQVRJT049biBjYXNlLgo+IAo+IEZpeGVzOiAxNmEyNmIyMGQyYWYgKCJ1Ymlm
czogYXV0aGVudGljYXRpb246IEFkZCBoYXNoZXMgdG8gaW5kZXggbm9kZXMiKQo+IFNpZ25lZC1v
ZmYtYnk6IExpIEh1YSA8aHVjb29sLmxpaHVhQGh1YXdlaS5jb20+Cj4gLS0tCj4gICBmcy91Ymlm
cy91Ymlmcy5oIHwgNSArKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+
IAo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy91Ymlmcy5oIGIvZnMvdWJpZnMvdWJpZnMuaAo+IGlu
ZGV4IDQ3OGJiYmI1MzgyZi4uMmYxZjMxNTgxMDk0IDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL3Vi
aWZzLmgKPiArKysgYi9mcy91Ymlmcy91Ymlmcy5oCj4gQEAgLTE2MjMsOCArMTYyMywxMyBAQCBz
dGF0aWMgaW5saW5lIGludCB1Ymlmc19jaGVja19obWFjKGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZv
ICpjLAo+ICAgCXJldHVybiBjcnlwdG9fbWVtbmVxKGV4cGVjdGVkLCBnb3QsIGMtPmhtYWNfZGVz
Y19sZW4pOwo+ICAgfQo+ICAgCj4gKyNpZmRlZiBDT05GSUdfVUJJRlNfRlNfQVVUSEVOVElDQVRJ
T04KPiAgIHZvaWQgdWJpZnNfYmFkX2hhc2goY29uc3Qgc3RydWN0IHViaWZzX2luZm8gKmMsIGNv
bnN0IHZvaWQgKm5vZGUsCj4gICAJCSAgICBjb25zdCB1OCAqaGFzaCwgaW50IGxudW0sIGludCBv
ZmZzKTsKPiArI2Vsc2UKPiArc3RhdGljIGlubGluZSB2b2lkIHViaWZzX2JhZF9oYXNoKGNvbnN0
IHN0cnVjdCB1Ymlmc19pbmZvICpjLCBjb25zdCB2b2lkICpub2RlLAo+ICsJCQkJICBjb25zdCB1
OCAqaGFzaCwgaW50IGxudW0sIGludCBvZmZzKSB7fTsKPiArI2VuZGlmCj4gICAKPiAgIGludCBf
X3ViaWZzX25vZGVfY2hlY2tfaGFzaChjb25zdCBzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgY29uc3Qg
dm9pZCAqYnVmLAo+ICAgCQkJICBjb25zdCB1OCAqZXhwZWN0ZWQpOwo+IAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
