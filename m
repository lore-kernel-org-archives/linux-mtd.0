Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A5BC54E58
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2024 11:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mK4HMFmmR9WbO6+q03eUb5YwglZJbTinDR9UjPSvhKI=; b=Ik+RcfDJF1PjpoZwJvl70DN9mM
	w4cxF9P2XIzcG2rqGywEYIGYFp2M3y964bAPJLnWbMaNMfPEGYhAcrrQb+yDVrnhG8E9nG+jL6v0u
	ZMeL2PBs/B87yA103fAS5xrfmOPd51FNsThMpzz/73QPvBoxGoFq01XAETE5xQUa9NS+XQajQrGZh
	ZlcnFcOmSsd9gaLFr5vndwd02FWbkf02TTClJnvjD/qwQeYKCFcsO+Iu6Zm8UtWbLW20OJB0SbBHc
	kiocRdaDoIV9t7TUGAns51FYXbytDjTJ4hl2UUiKXrO2zESKgA4hwqsJ0Oq3SkwHSqOpbBbaDd0Yt
	fDhAwvPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkMo0-00000009vLG-0YnL;
	Wed, 13 Mar 2024 11:29:56 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkMnx-00000009vJr-1hA2
	for linux-mtd@lists.infradead.org;
	Wed, 13 Mar 2024 11:29:55 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TvpFM0Pr2z1FMLH;
	Wed, 13 Mar 2024 19:29:27 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id C2CAB1A018A;
	Wed, 13 Mar 2024 19:29:42 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 19:29:41 +0800
Subject: Re: [PATCH] mtd: ubi: avoid expensive do_div() on 32-bit machines
To: Arnd Bergmann <arnd@kernel.org>, Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Daniel Golle <daniel@makrotopia.org>
CC: Arnd Bergmann <arnd@arndb.de>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20240313084707.3292300-1-arnd@kernel.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <4f945f4a-ac29-3ef7-9e15-123962f2a0e9@huawei.com>
Date: Wed, 13 Mar 2024 19:29:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240313084707.3292300-1-arnd@kernel.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_042953_629456_79BF9A9A 
X-CRM114-Status: GOOD (  19.27  )
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

1NogMjAyNC8zLzEzIDE2OjQ2LCBBcm5kIEJlcmdtYW5uINC0tcA6Cj4gRnJvbTogQXJuZCBCZXJn
bWFubiA8YXJuZEBhcm5kYi5kZT4KPiAKPiBUaGUgdXNlIG9mIGRvX2RpdigpIGluIHViaV9udm1l
bV9yZWdfcmVhZCgpIG1ha2VzIGNhbGxpbmcgaXQgb24KPiAzMi1iaXQgbWFjaGluZXMgcmF0aGVy
IGV4cGVuc2l2ZS4gU2luY2UgdGhlICdmcm9tJyB2YXJpYWJsZSBpcwo+IGtub3duIHRvIGJlIGEg
MzItYml0IHF1YW50aXR5LCBpdCBpcyBjbGVhcmx5IG5ldmVyIG5lZWRlZCBhbmQKPiBjYW4gYmUg
b3B0aW1pemVkIGludG8gYSByZWd1bGFyIGRpdmlzaW9uIG9wZXJhdGlvbi4KPiAKRG8geW91IG1l
ZXQgYSBwZXJmb3JtYW5jZSBwcm9ibGVtIG9uIGEgMzItYml0IG1hY2hpbmU/IFRoZXJlIGFyZSB0
b28gCm1hbnkgcGxhY2VzIGludm9raW5nIGRvX2Rpdiwgd2h5IGRvIHlvdSBvcHRpbWl6ZSB0aGlz
IG9uZT8KSGF2ZSB5b3UgdGVzdGVkIHRoZSBpbmZsdWVuY2Ugb24gYSB4ODZfNjQgcGxhdGZvcm0g
YWZ0ZXIgdGhpcyBwYXRjaCAKYXBwbGllZD8gTG9va3MgbGlrZSB0aGF0IGRvX2RpdiBpcyBtb3Jl
IGVmZmljaWVudCBpbiB4ODYuCgo+IEZpeGVzOiBiOGE3N2I5YTVmOWMgKCJtdGQ6IHViaTogZml4
IE5WTUVNIG92ZXIgVUJJIHZvbHVtZXMgb24gMzItYml0IHN5c3RlbXMiKQo+IEZpeGVzOiAzY2U0
ODU4MDNkYTEgKCJtdGQ6IHViaTogcHJvdmlkZSBOVk1FTSBsYXllciBvdmVyIFVCSSB2b2x1bWVz
IikKPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IC0tLQo+
ICAgZHJpdmVycy9tdGQvdWJpL252bWVtLmMgfCA2ICsrKy0tLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvdWJpL252bWVtLmMgYi9kcml2ZXJzL210ZC91YmkvbnZtZW0uYwo+IGluZGV4IDhhZWI5
YzQyOGU1MS4uYTk0YTFhOWFhZWMxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3ViaS9udm1l
bS5jCj4gKysrIGIvZHJpdmVycy9tdGQvdWJpL252bWVtLmMKPiBAQCAtNiw3ICs2LDYgQEAKPiAg
IC8qIFVCSSBOVk1FTSBwcm92aWRlciAqLwo+ICAgI2luY2x1ZGUgInViaS5oIgo+ICAgI2luY2x1
ZGUgPGxpbnV4L252bWVtLXByb3ZpZGVyLmg+Cj4gLSNpbmNsdWRlIDxhc20vZGl2NjQuaD4KPiAg
IAo+ICAgLyogTGlzdCBvZiBhbGwgTlZNRU0gZGV2aWNlcyAqLwo+ICAgc3RhdGljIExJU1RfSEVB
RChudm1lbV9kZXZpY2VzKTsKPiBAQCAtMjcsMTQgKzI2LDE1IEBAIHN0YXRpYyBpbnQgdWJpX252
bWVtX3JlZ19yZWFkKHZvaWQgKnByaXYsIHVuc2lnbmVkIGludCBmcm9tLAo+ICAgCXN0cnVjdCB1
YmlfbnZtZW0gKnVudiA9IHByaXY7Cj4gICAJc3RydWN0IHViaV92b2x1bWVfZGVzYyAqZGVzYzsK
PiAgIAl1aW50MzJfdCBvZmZzOwo+IC0JdWludDY0X3QgbG51bSA9IGZyb207Cj4gKwl1aW50MzJf
dCBsbnVtOwo+ICAgCWludCBlcnIgPSAwOwo+ICAgCj4gICAJZGVzYyA9IHViaV9vcGVuX3ZvbHVt
ZSh1bnYtPnViaV9udW0sIHVudi0+dm9sX2lkLCBVQklfUkVBRE9OTFkpOwo+ICAgCWlmIChJU19F
UlIoZGVzYykpCj4gICAJCXJldHVybiBQVFJfRVJSKGRlc2MpOwo+ICAgCj4gLQlvZmZzID0gZG9f
ZGl2KGxudW0sIHVudi0+dXNhYmxlX2xlYl9zaXplKTsKPiArCW9mZnMgPSBmcm9tICUgdW52LT51
c2FibGVfbGViX3NpemU7Cj4gKwlsbnVtID0gZnJvbSAvIHVudi0+dXNhYmxlX2xlYl9zaXplOwo+
ICAgCXdoaWxlIChieXRlc19sZWZ0KSB7Cj4gICAJCXRvX3JlYWQgPSB1bnYtPnVzYWJsZV9sZWJf
c2l6ZSAtIG9mZnM7Cj4gICAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
