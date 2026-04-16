Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C42F433C7
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2026 03:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbNEZpUT6h40LfDLKvKjJs27jTffRqReDUwFHm6T9tA=; b=Y5lOki/qBjxleT4FGc8Htx7eC4
	Ypm3LwCfcbrt043lWCl8Dfp0nByOcDm9lOPQw0WgcrhXXkcYq+yD5Hff0TR3Qvu9d3+rpjD2uI15G
	yeanBaK5F4sIdoujdjV9NdGQXw0oyH9fw5ZJwAikzSrNktDeojWTzacHiENeoSZnuVrnG2pLjlKF8
	kCyccVJ7zBF8GjLPz4UtimWjjHVQVNEv7z/a5N5mH2gkk5qnDB9YcLdjW31ruadcD6s0RVzGN9ejx
	D/4FW0HhwP0m/nbxY3P14ycO+S1PBI26HkyO5FPspjjd1sK7kommxtZf0QhKbvxp7RWMHATBmM/f4
	EoSy9ZxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDDmE-00000001wXa-0P7x;
	Thu, 16 Apr 2026 03:52:26 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDDm9-00000001wWf-2yOy
	for linux-mtd@lists.infradead.org;
	Thu, 16 Apr 2026 03:52:24 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=5JWd2T3o7DGFlnn8+qsFr2VdL/IvlRK34+BrJXueA1Q=;
	b=LUE+dIyF4FvsJ82PjDTuR2xgvqOC7DRgT1Pw0OZtn3S1MN7sJRy2lJOuGf26ENK8HO5rwdw+T
	rUH5/Rtloo7S/v9X7G9ZvcNStFAQDn5wJsc3426cWShaPyEbatZiLhrYa1bhEGZvo4oPtKbiZ2N
	W9oILDRBIiAOmOTlQGqeqvw=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fx3nb40llzcZyN;
	Thu, 16 Apr 2026 11:45:39 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 0DDE34056D;
	Thu, 16 Apr 2026 11:52:11 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 16 Apr 2026 11:52:10 +0800
Subject: Re: [PATCH v5 3/3] ubifs: avoid redundant calls to memset()
To: Dmitry Antipov <dmantipov@yandex.ru>, Richard Weinberger <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
References: <20260415071812.1139054-1-dmantipov@yandex.ru>
 <20260415071812.1139054-3-dmantipov@yandex.ru>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <91ddedbd-9df3-8d9e-2928-3ba090a4ee2b@huawei.com>
Date: Thu, 16 Apr 2026 11:52:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20260415071812.1139054-3-dmantipov@yandex.ru>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_205222_414108_67D94341 
X-CRM114-Status: GOOD (  19.74  )
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

1NogMjAyNi80LzE1IDE1OjE4LCBEbWl0cnkgQW50aXBvdiDQtLXAOgo+IFJlbHkgb24gcGFydGlh
bCBpbXBsaWNpdCBpbml0aWFsaXphdGlvbiBvZiAnc3RydWN0IHViaWZzX2J1ZGdldF9yZXEnCj4g
b2JqZWN0cyBhbmQgc28gc2ltcGxpZnkgJ3ViaWZzX3JlbGVhc2VfZGlydHlfaW5vZGVfYnVkZ2V0
KCknLCAnZG9fcmVuYW1lKCknCj4gYW5kICdkb190cnVuY2F0aW9uKCknIGJ5IGRyb3BwaW5nIGV4
cGxpY2l0IGNhbGxzIHRvICdtZW1zZXQoKScuCj4gCj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IEFu
dGlwb3YgPGRtYW50aXBvdkB5YW5kZXgucnU+Cj4gLS0tCj4gdjU6IGluaXRpYWwgdmVyc2lvbiB0
byBqb2luIHRoZSBzZXJpZXMKPiAtLS0KPiAgIGZzL3ViaWZzL2J1ZGdldC5jIHwgIDkgKysrKy0t
LS0tCj4gICBmcy91Ymlmcy9kaXIuYyAgICB8ICA0ICstLS0KPiAgIGZzL3ViaWZzL2ZpbGUuYyAg
IHwgMTAgKysrKystLS0tLQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAx
MyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvYnVkZ2V0LmMgYi9mcy91
Ymlmcy9idWRnZXQuYwo+IGluZGV4IGQ3NmViN2IzOWY1Ni4uYTczZjFlOTY5ZjdjIDEwMDY0NAo+
IC0tLSBhL2ZzL3ViaWZzL2J1ZGdldC5jCj4gKysrIGIvZnMvdWJpZnMvYnVkZ2V0LmMKPiBAQCAt
NTkwLDExICs1OTAsMTAgQEAgdm9pZCB1Ymlmc19jb252ZXJ0X3BhZ2VfYnVkZ2V0KHN0cnVjdCB1
Ymlmc19pbmZvICpjKQo+ICAgdm9pZCB1Ymlmc19yZWxlYXNlX2RpcnR5X2lub2RlX2J1ZGdldChz
dHJ1Y3QgdWJpZnNfaW5mbyAqYywKPiAgIAkJCQkgICAgICBzdHJ1Y3QgdWJpZnNfaW5vZGUgKnVp
KQo+ICAgewo+IC0Jc3RydWN0IHViaWZzX2J1ZGdldF9yZXEgcmVxOwo+IC0KPiAtCW1lbXNldCgm
cmVxLCAwLCBzaXplb2Yoc3RydWN0IHViaWZzX2J1ZGdldF9yZXEpKTsKPiAtCS8qIFRoZSAibm8g
c3BhY2UiIGZsYWdzIHdpbGwgYmUgY2xlYXJlZCBiZWNhdXNlIGRkX2dyb3d0aCBpcyA+IDAgKi8K
PiAtCXJlcS5kZF9ncm93dGggPSBjLT5iaS5pbm9kZV9idWRnZXQgKyBBTElHTih1aS0+ZGF0YV9s
ZW4sIDgpOwo+ICsJc3RydWN0IHViaWZzX2J1ZGdldF9yZXEgcmVxID0gewo+ICsJCS8qIFRoZSAi
bm8gc3BhY2UiIGZsYWdzIHdpbGwgYmUgY2xlYXJlZCBiZWNhdXNlIGRkX2dyb3d0aCBpcyA+IDAg
Ki8KPiArCQkuZGRfZ3Jvd3RoID0gYy0+YmkuaW5vZGVfYnVkZ2V0ICsgQUxJR04odWktPmRhdGFf
bGVuLCA4KQo+ICsJfTsKPiAgIAl1Ymlmc19yZWxlYXNlX2J1ZGdldChjLCAmcmVxKTsKPiAgIH0K
PiAgIAo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9kaXIuYyBiL2ZzL3ViaWZzL2Rpci5jCj4gaW5k
ZXggODZkNDFlMDc3ZTRkLi5jMTYwMmU4YWZmMDEgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMvZGly
LmMKPiArKysgYi9mcy91Ymlmcy9kaXIuYwo+IEBAIC0xMzM1LDcgKzEzMzUsNyBAQCBzdGF0aWMg
aW50IGRvX3JlbmFtZShzdHJ1Y3QgaW5vZGUgKm9sZF9kaXIsIHN0cnVjdCBkZW50cnkgKm9sZF9k
ZW50cnksCj4gICAJCQkJCS5kaXJ0aWVkX2lubyA9IDMgfTsKPiAgIAlzdHJ1Y3QgdWJpZnNfYnVk
Z2V0X3JlcSBpbm9fcmVxID0geyAuZGlydGllZF9pbm8gPSAxLAo+ICAgCQkJLmRpcnRpZWRfaW5v
X2QgPSBBTElHTihvbGRfaW5vZGVfdWktPmRhdGFfbGVuLCA4KSB9Owo+IC0Jc3RydWN0IHViaWZz
X2J1ZGdldF9yZXEgd2h0X3JlcTsKPiArCXN0cnVjdCB1Ymlmc19idWRnZXRfcmVxIHdodF9yZXEg
PSB7IC5uZXdfaW5vID0gMSB9Owo+ICAgCXVuc2lnbmVkIGludCBzYXZlZF9ubGluazsKPiAgIAlz
dHJ1Y3QgZnNjcnlwdF9uYW1lIG9sZF9ubSwgbmV3X25tOwo+ICAgCj4gQEAgLTE0MjIsOCArMTQy
Miw2IEBAIHN0YXRpYyBpbnQgZG9fcmVuYW1lKHN0cnVjdCBpbm9kZSAqb2xkX2Rpciwgc3RydWN0
IGRlbnRyeSAqb2xkX2RlbnRyeSwKPiAgIAkJd2hpdGVvdXRfdWktPmRhdGFfbGVuID0gdWJpZnNf
ZW5jb2RlX2RldihkZXYsIE1LREVWKDAsIDApKTsKPiAgIAkJdWJpZnNfYXNzZXJ0KGMsICF3aGl0
ZW91dF91aS0+ZGlydHkpOwo+ICAgCj4gLQkJbWVtc2V0KCZ3aHRfcmVxLCAwLCBzaXplb2Yoc3Ry
dWN0IHViaWZzX2J1ZGdldF9yZXEpKTsKPiAtCQl3aHRfcmVxLm5ld19pbm8gPSAxOwo+ICAgCQl3
aHRfcmVxLm5ld19pbm9fZCA9IEFMSUdOKHdoaXRlb3V0X3VpLT5kYXRhX2xlbiwgOCk7Cj4gICAJ
CS8qCj4gICAJCSAqIFRvIGF2b2lkIGRlYWRsb2NrIGJldHdlZW4gc3BhY2UgYnVkZ2V0IChob2xk
cyB1aV9tdXRleCBhbmQKCkkgcHJlZmVyIHRvIGtlZXAgdGhlIG9yZ2luYWwgbG9naWMgZm9yIGRv
X3JlbmFtZSgpLiBpdCBtYWtlcyAnd2hpdGVvdXQnIAphbmQgJ3dodF9yZXEnIGJlIGluaXRpYWxp
emVkIGluIHRoZSBzYW1lIGNvZGUgYmxvY2ssIHdoaWNoIGlzIG1vcmUgcmVhZGFibGUuCj4gZGlm
ZiAtLWdpdCBhL2ZzL3ViaWZzL2ZpbGUuYyBiL2ZzL3ViaWZzL2ZpbGUuYwo+IGluZGV4IGU3M2My
OGIxMmY5Ny4uMzUwNjFhNTg3ZTNjIDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL2ZpbGUuYwo+ICsr
KyBiL2ZzL3ViaWZzL2ZpbGUuYwo+IEBAIC0xMTAxLDEzICsxMTAxLDE2IEBAIHN0YXRpYyBpbnQg
ZG9fdHJ1bmNhdGlvbihzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgc3RydWN0IGlub2RlICppbm9kZSwK
PiAgIAkJCSBjb25zdCBzdHJ1Y3QgaWF0dHIgKmF0dHIpCj4gICB7Cj4gICAJaW50IGVycjsKPiAt
CXN0cnVjdCB1Ymlmc19idWRnZXRfcmVxIHJlcTsKPiArCXN0cnVjdCB1Ymlmc19idWRnZXRfcmVx
IHJlcSA9IHsKPiArCQkuZGlydGllZF9pbm8gPSAxLAo+ICsJCS8qIEEgZnVubnkgd2F5IHRvIGJ1
ZGdldCBmb3IgdHJ1bmNhdGlvbiBub2RlICovCj4gKwkJLmRpcnRpZWRfaW5vX2QgPSBVQklGU19U
UlVOX05PREVfU1oKPiArCX07Cj4gICAJbG9mZl90IG9sZF9zaXplID0gaW5vZGUtPmlfc2l6ZSwg
bmV3X3NpemUgPSBhdHRyLT5pYV9zaXplOwo+ICAgCWludCBvZmZzZXQgPSBuZXdfc2l6ZSAmIChV
QklGU19CTE9DS19TSVpFIC0gMSksIGJ1ZGdldGVkID0gMTsKPiAgIAlzdHJ1Y3QgdWJpZnNfaW5v
ZGUgKnVpID0gdWJpZnNfaW5vZGUoaW5vZGUpOwo+ICAgCj4gICAJZGJnX2dlbigiaW5vICVsbHUs
IHNpemUgJWxsZCAtPiAlbGxkIiwgaW5vZGUtPmlfaW5vLCBvbGRfc2l6ZSwgbmV3X3NpemUpOwo+
IC0JbWVtc2V0KCZyZXEsIDAsIHNpemVvZihzdHJ1Y3QgdWJpZnNfYnVkZ2V0X3JlcSkpOwo+ICAg
Cj4gICAJLyoKPiAgIAkgKiBJZiB0aGlzIGlzIHRydW5jYXRpb24gdG8gYSBzbWFsbGVyIHNpemUs
IGFuZCB3ZSBkbyBub3QgdHJ1bmNhdGUgb24gYQo+IEBAIC0xMTE3LDkgKzExMjAsNiBAQCBzdGF0
aWMgaW50IGRvX3RydW5jYXRpb24oc3RydWN0IHViaWZzX2luZm8gKmMsIHN0cnVjdCBpbm9kZSAq
aW5vZGUsCj4gICAJaWYgKG5ld19zaXplICYgKFVCSUZTX0JMT0NLX1NJWkUgLSAxKSkKPiAgIAkJ
cmVxLmRpcnRpZWRfcGFnZSA9IDE7Cj4gICAKPiAtCXJlcS5kaXJ0aWVkX2lubyA9IDE7Cj4gLQkv
KiBBIGZ1bm55IHdheSB0byBidWRnZXQgZm9yIHRydW5jYXRpb24gbm9kZSAqLwo+IC0JcmVxLmRp
cnRpZWRfaW5vX2QgPSBVQklGU19UUlVOX05PREVfU1o7Cj4gICAJZXJyID0gdWJpZnNfYnVkZ2V0
X3NwYWNlKGMsICZyZXEpOwo+ICAgCWlmIChlcnIpIHsKPiAgIAkJLyoKPiAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
