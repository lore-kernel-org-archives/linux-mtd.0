Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B62D3C53F
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Oct 2024 01:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glNidfzWy6ZnFOEB0IGi9yw0MUxCbQ4DrsVg5eoNzoQ=; b=qlQ8yJcmedjsG/y5h9abSOh+iv
	OpjIJNPLQQE/7nFDaSnHdKR4cVgK7fpC6KOkkN8WiumekZCwP50lub2mFu9nCtsAntGp7RG+/1I2m
	aHePg0jlTG6ncb0epSfDG3+E8ovmfMZ4Ogux00eiMZiyqjAW1/kYuUl/SClZyZoAD1+9mblv/jf2Z
	sVkJmHVlA3aahZ2ECBUNDmmsLj1tcs8ZmuKJ+BP2Y628ZPgyAS7/8eghqxK24ClZU65AQwmPyzxaf
	LAwfXZAzSqiecPKdhLPQiAtldEs3sFvouYZWkF6n9GVjgU2po7gxAT0I2kId9BYVTIqreXJxMo3zN
	PyOcQDUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1bj5-0000000GZNS-3Dru;
	Fri, 18 Oct 2024 01:24:23 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1bj2-0000000GZKe-2moR
	for linux-mtd@lists.infradead.org;
	Fri, 18 Oct 2024 01:24:22 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XV6Qv0ZhWz20qXG;
	Fri, 18 Oct 2024 09:23:19 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id F0593180041;
	Fri, 18 Oct 2024 09:24:04 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 18 Oct 2024 09:24:04 +0800
Subject: Re: [PATCH] ubifs: Move update of cnt in get_znodes_to_commit
To: Waqar Hameed <waqar.hameed@axis.com>, Richard Weinberger <richard@nod.at>
CC: <kernel@axis.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <ebf1570e3d28462a97b1a595794e1969a4c27d81.1729191143.git.waqar.hameed@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <4751d3df-99a6-ec67-1175-ea5375290726@huawei.com>
Date: Fri, 18 Oct 2024 09:24:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ebf1570e3d28462a97b1a595794e1969a4c27d81.1729191143.git.waqar.hameed@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_182420_982472_A04E401D 
X-CRM114-Status: GOOD (  16.94  )
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

1NogMjAyNC8xMC8xOCAyOjQxLCBXYXFhciBIYW1lZWQg0LS1wDoKPiBUaGVyZSBpcyBubyBuZWVk
IHRvIHVwZGF0ZSBgY250YCBmb3IgdGhlIGZpcnN0IGRpcnR5IG5vZGUganVzdCBiZWZvcmUKPiB0
aGUgbG9vcCwgYW5kIHRoZW4gYWdhaW4gdXBkYXRlIGl0IGF0IHRoZSBlbmQgb2YgZWFjaCBpdGVy
YXRpb24gZm9yIHRoZQo+IG5leHQgZGlydHkgbm9kZXMuIEp1c3QgdXBkYXRlIGBjbnRgIGF0IHRo
ZSBiZWdpbm5pbmcgb2YgZWFjaCBpdGVyYXRpb24KPiBpbnN0ZWFkLiBUaGlzIHdheSwgdGhlIGZp
cnN0IGl0ZXJhdGlvbiB3aWxsIGNvdW50IHRoZSBmaXJzdCBkaXJ0eSBub2RlCj4gYW5kIGFueSBz
dWJzZXF1ZW50IGl0ZXJhdGlvbnMgd2lsbCBjb3VudCB0aGUgbmV4dCBkaXJ0eSBub2Rlcy4KCldl
bGwsIGZyb20gbXkgb3duIHZpZXcsIEkgcHJlZmVyIHRoZSBvcmlnbmFsIHN0eWxlIGJlY2F1c2Ug
aXQgbG9va3MgbW9yZSAKcmVhZGFibGUuCiAgIGMtPmNuZXh0ID0gZmluZF9maXJzdF9kaXJ0eShj
LT56cm9vdC56bm9kZSk7CiAgIHpub2RlID0gYy0+ZW5leHQgPSBjLT5jbmV4dDsKICAgY250ICs9
IDE7ICAvLyBXZSBnZXQgdGhlIGZpcnN0IG9uZS4KCiAgIHdoaWxlICgxKSB7CiAgICAgY25leHQg
PSBmaW5kX25leHRfZGlydHkoem5vZGUpOwogICAgIHpub2RlID0gY25leHQ7CiAgICAgY250ICs9
IDE7IC8vIFdlIGdldCBhbm90aGVyIG9uZS4KICAgfQoKQWZ0ZXIgYXBwbHlpbmcgdGhpcyBwYXRj
aCwgdGhlIGludGVudGlvbiBvZiAnY250JyB1cGRhdGluZyBpcyBub3Qgc28gCm9idmlvdXNseS4g
SG93ZXZlciwgaXQgZG9lcyByZWR1Y2UgdGhlIGR1cGxpY2F0ZWQgY29kZXMuIEkgd2lsbCBhZGQg
YW4gCmFja2VkLWJ5IHRvIGxldCBSaWNoYXJkIGRldGVybWluZSB3aGV0aGVyIG9yIG5vdCBhcHBs
eSB0aGlzIHBhdGNoLgoKQWNrZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdl
aS5jb20+Cj4gCj4gU2lnbmVkLW9mZi1ieTogV2FxYXIgSGFtZWVkIDx3YXFhci5oYW1lZWRAYXhp
cy5jb20+Cj4gLS0tCj4gICBmcy91Ymlmcy90bmNfY29tbWl0LmMgfCAzICstLQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9mcy91Ymlmcy90bmNfY29tbWl0LmMgYi9mcy91Ymlmcy90bmNfY29tbWl0LmMKPiBpbmRleCBh
NTVlMDQ4MjJkMTYuLmQ0MmY3ODI5Mzg5YyAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy90bmNfY29t
bWl0LmMKPiArKysgYi9mcy91Ymlmcy90bmNfY29tbWl0LmMKPiBAQCAtNjUwLDggKzY1MCw4IEBA
IHN0YXRpYyBpbnQgZ2V0X3pub2Rlc190b19jb21taXQoc3RydWN0IHViaWZzX2luZm8gKmMpCj4g
ICAJCWRiZ19jbXQoIm5vIHpub2RlcyB0byBjb21taXQiKTsKPiAgIAkJcmV0dXJuIDA7Cj4gICAJ
fQo+IC0JY250ICs9IDE7Cj4gICAJd2hpbGUgKDEpIHsKPiArCQljbnQgKz0gMTsKPiAgIAkJdWJp
ZnNfYXNzZXJ0KGMsICF1Ymlmc196bl9jb3coem5vZGUpKTsKPiAgIAkJX19zZXRfYml0KENPV19a
Tk9ERSwgJnpub2RlLT5mbGFncyk7Cj4gICAJCXpub2RlLT5hbHQgPSAwOwo+IEBAIC02NjQsNyAr
NjY0LDYgQEAgc3RhdGljIGludCBnZXRfem5vZGVzX3RvX2NvbW1pdChzdHJ1Y3QgdWJpZnNfaW5m
byAqYykKPiAgIAkJem5vZGUtPmNpaXAgPSB6bm9kZS0+aWlwOwo+ICAgCQl6bm9kZS0+Y25leHQg
PSBjbmV4dDsKPiAgIAkJem5vZGUgPSBjbmV4dDsKPiAtCQljbnQgKz0gMTsKPiAgIAl9Cj4gICAJ
ZGJnX2NtdCgiY29tbWl0dGluZyAlZCB6bm9kZXMiLCBjbnQpOwo+ICAgCXViaWZzX2Fzc2VydChj
LCBjbnQgPT0gYXRvbWljX2xvbmdfcmVhZCgmYy0+ZGlydHlfem5fY250KSk7Cj4gCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
