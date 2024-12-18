Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A008E77187
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2024 02:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TgLFmMh0fMjKwWQPhnOS9+hum9iswkEooeylNCYKve4=; b=SmLuEhXE4YnuE5jZvD+TG3aAzs
	1gJsYI9FL10zUTc7tJ/u3CWWu/EawQ/aZ6TuA9KqIEJF2VzuGh8OsDwqEZQArXSi/eB/z9Byf37/5
	JKbQvqi4s2Fgh6YXt4ScZgbxYDJAc3NR5piVTxIshkz1Dep3gFsv12QnJJT/A7NV5r6aEeJUXOEPj
	2irpf2AyASaohrLyEmhwpIQshcEY4dz0yELzTUedZNBCc0mY1XK6RWiU1Dr5cMpHiqw+SQ1xXpzGI
	tblgMmkcIk6lN7EGB3Fmw+qMkkfuTSlILC0QBy97qBROR9HVkcszt1L+f+rsy9VelEVKkZ1Z30Duw
	3w1Ugj7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNkGs-0000000FRWs-13jj;
	Wed, 18 Dec 2024 02:58:46 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNkGp-0000000FRW1-1ESr
	for linux-mtd@lists.infradead.org;
	Wed, 18 Dec 2024 02:58:44 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4YCdcc0hqbz21lGL
	for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 10:56:48 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 29D411400D4
	for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 10:58:40 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 18 Dec 2024 10:58:39 +0800
Subject: Re: [PATCH mtd-utils] ubifs-utils: mkfs.ubifs: fix integer overflow
 in mkfs.ubifs.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241217172816.316694-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <3ab70285-277d-a02b-e5c7-70b6617eaf4a@huawei.com>
Date: Wed, 18 Dec 2024 10:58:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241217172816.316694-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_185843_489333_B4F251F3 
X-CRM114-Status: GOOD (  15.60  )
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

1NogMjAyNC8xMi8xOCAxOjI4LCBBbnRvbiBNb3J5YWtvdiDQtLXAOgo+IFJlcG9ydCBvZiB0aGUg
c3RhdGljIGFuYWx5emVyOgo+IFRoZSB2YWx1ZSBvZiBhbiBhcml0aG1ldGljIGV4cHJlc3Npb24g
JzQgKiBjLT5sZWJfc2l6ZScgaXMgYSBzdWJqZWN0IHRvIG92ZXJmbG93IGJlY2F1c2UgaXRzIG9w
ZXJhbmRzIGFyZSBub3QgY2FzdCB0byBhIGxhcmdlciBkYXRhIHR5cGUgYmVmb3JlIHBlcmZvcm1p
bmcgYXJpdGhtZXRpYwo+IAo+IENvcnJlY3Rpb25zIGV4cGxhaW5lZDoKPiBUbyBhdm9pZCBvdmVy
Zmxvdywgd2UgY2FzdCBvbmUgb2YgdGhlIG9wZXJhbmRzIChpbiB0aGlzIGNhc2UgYy0+bGViX3Np
emUpIHRvIHR5cGUgbG9uZyBsb25nLCB3aGljaCBoYXMgYSBsYXJnZXIgcmFuZ2UuCj4gCj4gVHJp
Z2dlcnMgZm91bmQgYnkgc3RhdGljIGFuYWx5emVyIFN2YWNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEFudG9uIE1vcnlha292IDxhbnQudi5tb3J5YWtvdkBnbWFpbC5jb20+Cj4gCj4gLS0tCj4gICB1
Ymlmcy11dGlscy9ta2ZzLnViaWZzL21rZnMudWJpZnMuYyB8IDQgKystLQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
dWJpZnMtdXRpbHMvbWtmcy51Ymlmcy9ta2ZzLnViaWZzLmMgYi91Ymlmcy11dGlscy9ta2ZzLnVi
aWZzL21rZnMudWJpZnMuYwo+IGluZGV4IGI1ZjM4OTIuLjlmMjc2YzUgMTAwNjQ0Cj4gLS0tIGEv
dWJpZnMtdXRpbHMvbWtmcy51Ymlmcy9ta2ZzLnViaWZzLmMKPiArKysgYi91Ymlmcy11dGlscy9t
a2ZzLnViaWZzL21rZnMudWJpZnMuYwo+IEBAIC04NTgsOCArODU4LDggQEAgc3RhdGljIGludCBn
ZXRfb3B0aW9ucyhpbnQgYXJnYywgY2hhcioqYXJndikKPiAgIAkJLyogTWFrZSB0aGUgbWF4IGpv
dXJuYWwgc2l6ZSA4TWlCICovCj4gICAJCWlmIChjLT5tYXhfYnVkX2J5dGVzID4gOCAqIDEwMjQg
KiAxMDI0KQo+ICAgCQkJYy0+bWF4X2J1ZF9ieXRlcyA9IDggKiAxMDI0ICogMTAyNDsKPiAtCQlp
ZiAoYy0+bWF4X2J1ZF9ieXRlcyA8IDQgKiBjLT5sZWJfc2l6ZSkKPiAtCQkJYy0+bWF4X2J1ZF9i
eXRlcyA9IDQgKiBjLT5sZWJfc2l6ZTsKPiArCQlpZiAoYy0+bWF4X2J1ZF9ieXRlcyA8IDQgKiAo
bG9uZyBsb25nKWMtPmxlYl9zaXplKQo+ICsJCQljLT5tYXhfYnVkX2J5dGVzID0gNCAqIChsb25n
IGxvbmcpYy0+bGViX3NpemU7Cj4gICAJfQoKVGhlICc0ICogYy0+bGViX3NpemUnIGNvdWxkIHRy
aWdnZXIgYW4gb3ZlcmZsb3csIGJlY2F1c2UgJ2MtPmxlYl9zaXplJyAKaXMgaW5pdGlhbGl6ZWQg
YnkgdXNlciBvcHRpb24gJy1lJy4gSG93ZXZlciwgZnVuY3Rpb24gdmFsaWRhdGVfb3B0aW9ucygp
IApjaGVja3MgJ2MtPmxlYl9zaXplJyBhbmQgdGVybWluYXRlcyB0aGUgcHJvZ3JhbSBpZiBpdCBl
eGNlZWRzIApVQklGU19NQVhfTEVCX1NaWzJNXSwgc28gdGhlcmUgd2lsbCBiZSBubyBlZmZlY3Rz
Lgo+ICAgCj4gICAJaWYgKGMtPmxvZ19sZWJzID09IC0xKSB7Cj4gCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
