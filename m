Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F047CC54791
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2024 13:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svik5v5l1trR+8k6d/0aIs41DZMVgCTLTYJebHbYxKc=; b=iIcV5NJndcR5J9tf4AJdy66Rfp
	DNDI+9taQx53oN1BxSES4qn2ZEZgq4QISE9NTebeiA3GybSFIZgyTdocBJ7pMmwqJO/35+nnRlaaP
	63HwTvmUlEMFX9aExox3/MqkeOrJ+WQ7NrX3dsgIYbkH4+rkBmMlgGLVWyHi8PThmsenha1LG/N7a
	vpzRap3CZlIhEAU26ze85kGa3By6ngqDzZSOWjhBXeYuM4+w43PAZyG7gM7CzsWxe6Tit5oJp2OBd
	7XjbmQ2+gTX5LtRVyqr3m4bvEUag/6+D7ZdDeo7pu09VCm6jcbLroiyMFzEpogQsisMWrgw6dlp6B
	ET2buTcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkOr3-0000000AGPP-22LG;
	Wed, 13 Mar 2024 13:41:13 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkOqz-0000000AGOX-3FjP
	for linux-mtd@lists.infradead.org;
	Wed, 13 Mar 2024 13:41:11 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Tvs7967dKz1xqk0;
	Wed, 13 Mar 2024 21:39:17 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 451821A0172;
	Wed, 13 Mar 2024 21:41:03 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 21:41:02 +0800
Subject: Re: [PATCH] mtd: ubi: avoid expensive do_div() on 32-bit machines
To: Arnd Bergmann <arnd@kernel.org>, Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Daniel Golle <daniel@makrotopia.org>
CC: Arnd Bergmann <arnd@arndb.de>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20240313084707.3292300-1-arnd@kernel.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <c7c8644b-3dcb-d949-f596-bb8d100f0fe5@huawei.com>
Date: Wed, 13 Mar 2024 21:41:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240313084707.3292300-1-arnd@kernel.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_064110_059271_403EBDF7 
X-CRM114-Status: GOOD (  17.10  )
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
b3B0aW1pemVkIGludG8gYSByZWd1bGFyIGRpdmlzaW9uIG9wZXJhdGlvbi4KPiAKPiBGaXhlczog
YjhhNzdiOWE1ZjljICgibXRkOiB1Ymk6IGZpeCBOVk1FTSBvdmVyIFVCSSB2b2x1bWVzIG9uIDMy
LWJpdCBzeXN0ZW1zIikKPiBGaXhlczogM2NlNDg1ODAzZGExICgibXRkOiB1Ymk6IHByb3ZpZGUg
TlZNRU0gbGF5ZXIgb3ZlciBVQkkgdm9sdW1lcyIpCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJn
bWFubiA8YXJuZEBhcm5kYi5kZT4KPiAtLS0KPiAgIGRyaXZlcnMvbXRkL3ViaS9udm1lbS5jIHwg
NiArKystLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4K
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvdWJpL252bWVtLmMgYi9kcml2ZXJzL210ZC91
YmkvbnZtZW0uYwo+IGluZGV4IDhhZWI5YzQyOGU1MS4uYTk0YTFhOWFhZWMxIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvbXRkL3ViaS9udm1lbS5jCj4gKysrIGIvZHJpdmVycy9tdGQvdWJpL252bWVt
LmMKPiBAQCAtNiw3ICs2LDYgQEAKPiAgIC8qIFVCSSBOVk1FTSBwcm92aWRlciAqLwo+ICAgI2lu
Y2x1ZGUgInViaS5oIgo+ICAgI2luY2x1ZGUgPGxpbnV4L252bWVtLXByb3ZpZGVyLmg+Cj4gLSNp
bmNsdWRlIDxhc20vZGl2NjQuaD4KPiAgIAo+ICAgLyogTGlzdCBvZiBhbGwgTlZNRU0gZGV2aWNl
cyAqLwo+ICAgc3RhdGljIExJU1RfSEVBRChudm1lbV9kZXZpY2VzKTsKPiBAQCAtMjcsMTQgKzI2
LDE1IEBAIHN0YXRpYyBpbnQgdWJpX252bWVtX3JlZ19yZWFkKHZvaWQgKnByaXYsIHVuc2lnbmVk
IGludCBmcm9tLAo+ICAgCXN0cnVjdCB1YmlfbnZtZW0gKnVudiA9IHByaXY7Cj4gICAJc3RydWN0
IHViaV92b2x1bWVfZGVzYyAqZGVzYzsKPiAgIAl1aW50MzJfdCBvZmZzOwo+IC0JdWludDY0X3Qg
bG51bSA9IGZyb207Cj4gKwl1aW50MzJfdCBsbnVtOwo+ICAgCWludCBlcnIgPSAwOwo+ICAgCj4g
ICAJZGVzYyA9IHViaV9vcGVuX3ZvbHVtZSh1bnYtPnViaV9udW0sIHVudi0+dm9sX2lkLCBVQklf
UkVBRE9OTFkpOwo+ICAgCWlmIChJU19FUlIoZGVzYykpCj4gICAJCXJldHVybiBQVFJfRVJSKGRl
c2MpOwo+ICAgCj4gLQlvZmZzID0gZG9fZGl2KGxudW0sIHVudi0+dXNhYmxlX2xlYl9zaXplKTsK
PiArCW9mZnMgPSBmcm9tICUgdW52LT51c2FibGVfbGViX3NpemU7Cj4gKwlsbnVtID0gZnJvbSAv
IHVudi0+dXNhYmxlX2xlYl9zaXplOwo+ICAgCXdoaWxlIChieXRlc19sZWZ0KSB7Cj4gICAJCXRv
X3JlYWQgPSB1bnYtPnVzYWJsZV9sZWJfc2l6ZSAtIG9mZnM7Cj4gICAKPiAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
