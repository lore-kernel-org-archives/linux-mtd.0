Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4F1EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 07:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVfjoyDHUCcMaRfKNhMmt2SHITEY5//Ps4qxYYw3HOY=; b=b9a4xuNdKURXYQ1roNQyXE6iFT
	iPdxPvMASXEFMxC9P7N0aD1TmRZFZ1IZjFmNsnHUsbbJKTkIhcrXkaQzyftDMjy2FlPeSXzFJJZcA
	WgTNWJHcAm2rFCFlI1OeTF4ToR3/9lCBET/93rw8+DHPi95E9ZALwDLWaQvYXW7zhhEZdGHh4QMLU
	jzwa53PnWQy1m6CRxHcTq4ugsg/xYDZZ3XLeQA0w9ZpP/wunB4T+1JZFOAITYhcyGjSENgyv6w2Wp
	Efls6EgzKApHtoMrCXyb8cXUYwlhP68Pp9Shf37DEtNACjoIjgAD7lSEHpOn6PUWrbOdP+QWCsh+p
	F/EcZl5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJUaY-00GpOH-1k;
	Wed, 12 Jul 2023 07:48:42 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJUaV-00GpNa-2c
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 07:48:41 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4R18ts4xp2zPkFx;
	Wed, 12 Jul 2023 15:46:13 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 12 Jul 2023 15:48:33 +0800
Subject: Re: [PATCH -next v2] ubifs: Fix some kernel-doc comments
To: Yang Li <yang.lee@linux.alibaba.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Abaci
 Robot <abaci@linux.alibaba.com>
References: <20230712074637.129248-1-yang.lee@linux.alibaba.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <0ab0a5de-8530-7cbc-ded0-0ca9cfdfa5e9@huawei.com>
Date: Wed, 12 Jul 2023 15:48:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230712074637.129248-1-yang.lee@linux.alibaba.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_004840_031892_4BF7A774 
X-CRM114-Status: GOOD (  13.19  )
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

1NogMjAyMy83LzEyIDE1OjQ2LCBZYW5nIExpINC0tcA6Cj4gQWRkIGRlc2NyaXB0aW9uIG9mIEB0
aW1lIGFuZCBAZmxhZ3MgaW4gdWJpZnNfdXBkYXRlX3RpbWUoKS4KPiAKPiB0byBzaWxlbmNlIHRo
ZSB3YXJuaW5nczoKPiBmcy91Ymlmcy9maWxlLmM6MTM4Mzogd2FybmluZzogRnVuY3Rpb24gcGFy
YW1ldGVyIG9yIG1lbWJlciAndGltZScgbm90IGRlc2NyaWJlZCBpbiAndWJpZnNfdXBkYXRlX3Rp
bWUnCj4gZnMvdWJpZnMvZmlsZS5jOjEzODM6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBv
ciBtZW1iZXIgJ2ZsYWdzJyBub3QgZGVzY3JpYmVkIGluICd1Ymlmc191cGRhdGVfdGltZScKPiAK
PiBSZXBvcnRlZC1ieTogQWJhY2kgUm9ib3QgPGFiYWNpQGxpbnV4LmFsaWJhYmEuY29tPgo+IENs
b3NlczogaHR0cHM6Ly9idWd6aWxsYS5vcGVuYW5vbGlzLmNuL3Nob3dfYnVnLmNnaT9pZD01ODQ4
Cj4gU2lnbmVkLW9mZi1ieTogWWFuZyBMaSA8eWFuZy5sZWVAbGludXguYWxpYmFiYS5jb20+Cj4g
LS0tCj4gCj4gLS1jaGFuZ2UgaW4gdjI6Cj4gQWNjb3JkaW5nIHRvIFpoaWhhbydzIHN1Z2dlc3Rp
b24sIGFkZCBhIG1vcmUgYWNjdXJhdGUgZGVzY3JpcHRpb24gdG8gQGZsYWdzLgo+IAo+ICAgZnMv
dWJpZnMvZmlsZS5jIHwgMyArKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykK
PiAKPiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvZmlsZS5jIGIvZnMvdWJpZnMvZmlsZS5jCj4gaW5k
ZXggNDM2YjI3ZDdjNThmLi44NjA0OTc1MzI1NTUgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMvZmls
ZS5jCj4gKysrIGIvZnMvdWJpZnMvZmlsZS5jCj4gQEAgLTEzNzUsNiArMTM3NSw5IEBAIHN0YXRp
YyBpbmxpbmUgaW50IG1jdGltZV91cGRhdGVfbmVlZGVkKGNvbnN0IHN0cnVjdCBpbm9kZSAqaW5v
ZGUsCj4gICAvKioKPiAgICAqIHViaWZzX3VwZGF0ZV90aW1lIC0gdXBkYXRlIHRpbWUgb2YgaW5v
ZGUuCj4gICAgKiBAaW5vZGU6IGlub2RlIHRvIHVwZGF0ZQo+ICsgKiBAdGltZTogIHRpbWVzcGVj
IHN0cnVjdHVyZSB0byBob2xkIHRoZSBjdXJyZW50IHRpbWUgdmFsdWUKPiArICogQGZsYWdzOiB0
aW1lIHVwZGF0aW5nIGNvbnRyb2wgZmxhZyBkZXRlcm1pbmVzIHVwZGF0aW5nCj4gKyAqCSAgICB3
aGljaCB0aW1lIGZpZWxkcyBvZiBAaW5vZGUKPiAgICAqCj4gICAgKiBUaGlzIGZ1bmN0aW9uIHVw
ZGF0ZXMgdGltZSBvZiB0aGUgaW5vZGUuCj4gICAgKi8KPiAKClJldmlld2VkLWJ5OiBaaGloYW8g
Q2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
