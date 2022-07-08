Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F90FC43334
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Jul 2022 09:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8pER2HlwtBWDcA7bk4wwLWn0Lb0ghF+hZZ/a0Z6eNE=; b=4B/f+HkIPjzqPBSmpYMub5z9Cy
	/eltGa0Ow78K+nzWeBvC7bTTvtRHd7QfGmWhk/wgoENALzveUT0StCzUGfp+NOTCe1bU0X4Nil3FU
	O3C3bPP0MQ38xV6VEHExwCsCrP4mlAVrXsUaaUR3/cvWqTANUQB92KUt8mqRqcHNnyejEjAy8U1Ko
	vpIqyo02h5EHFnPMhgk/AyGsZAdU83qH9+/JLid+p+UHLmZuhFn2WC+Y0C+Srynuk0VblnFOIODpf
	odKvMHQPzW8joBIwf+rDnYvbamhkbXxvw8d38/gKOZ+PLV7G0sc+BTygLTEGZpVcgztQtsvdC4AMd
	9saXsh3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jyd-002mbV-Ds; Fri, 08 Jul 2022 09:08:43 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jxo-002mKZ-MC; Fri, 08 Jul 2022 09:07:54 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4LfS6Q2vNtz1L8tg;
	Fri,  8 Jul 2022 17:05:18 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 8 Jul 2022 17:07:46 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 8 Jul 2022 17:07:45 +0800
Subject: Re: [PATCH] ubi: fastmap: Use the bitmap API to allocate bitmaps
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Richard Weinberger
	<richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <64cde893efca8f4dc381184cd7f6e5a54cd000f9.1656960335.git.christophe.jaillet@wanadoo.fr>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <16e6eef2-bf83-f5c1-6543-8c49a70c7d85@huawei.com>
Date: Fri, 8 Jul 2022 17:07:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <64cde893efca8f4dc381184cd7f6e5a54cd000f9.1656960335.git.christophe.jaillet@wanadoo.fr>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_020752_930250_1D041FA2 
X-CRM114-Status: GOOD (  12.03  )
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

1NogMjAyMi83LzUgMjo0NiwgQ2hyaXN0b3BoZSBKQUlMTEVUINC0tcA6Cj4gVXNlIGJpdG1hcF96
YWxsb2MoKS9iaXRtYXBfZnJlZSgpIGluc3RlYWQgb2YgaGFuZC13cml0aW5nIHRoZW0uCj4gCj4g
SXQgaXMgbGVzcyB2ZXJib3NlIGFuZCBpdCBpbXByb3ZlcyB0aGUgc2VtYW50aWMuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBKQUlMTEVUIDxjaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRv
by5mcj4KPiAtLS0KPiAgIGRyaXZlcnMvbXRkL3ViaS9mYXN0bWFwLmMgfCAxMCArKysrLS0tLS0t
Cj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC91YmkvZmFzdG1hcC5jIGIvZHJpdmVycy9tdGQvdWJp
L2Zhc3RtYXAuYwo+IGluZGV4IDZlOTVjNGIxNDczZS4uY2EyZDllZmU2MmMzIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvbXRkL3ViaS9mYXN0bWFwLmMKPiArKysgYi9kcml2ZXJzL210ZC91YmkvZmFz
dG1hcC5jCj4gQEAgLTIwLDggKzIwLDcgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nICpp
bml0X3NlZW4oc3RydWN0IHViaV9kZXZpY2UgKnViaSkKPiAgIAlpZiAoIXViaV9kYmdfY2hrX2Zh
c3RtYXAodWJpKSkKPiAgIAkJcmV0dXJuIE5VTEw7Cj4gICAKPiAtCXJldCA9IGtjYWxsb2MoQklU
U19UT19MT05HUyh1YmktPnBlYl9jb3VudCksIHNpemVvZih1bnNpZ25lZCBsb25nKSwKPiAtCQkg
ICAgICBHRlBfS0VSTkVMKTsKPiArCXJldCA9IGJpdG1hcF96YWxsb2ModWJpLT5wZWJfY291bnQs
IEdGUF9LRVJORUwpOwo+ICAgCWlmICghcmV0KQo+ICAgCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVN
KTsKPiAgIAo+IEBAIC0zNCw3ICszMyw3IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyAq
aW5pdF9zZWVuKHN0cnVjdCB1YmlfZGV2aWNlICp1YmkpCj4gICAgKi8KPiAgIHN0YXRpYyBpbmxp
bmUgdm9pZCBmcmVlX3NlZW4odW5zaWduZWQgbG9uZyAqc2VlbikKPiAgIHsKPiAtCWtmcmVlKHNl
ZW4pOwo+ICsJYml0bWFwX2ZyZWUoc2Vlbik7Cj4gICB9Cj4gICAKPiAgIC8qKgo+IEBAIC0xMTA4
LDggKzExMDcsNyBAQCBpbnQgdWJpX2Zhc3RtYXBfaW5pdF9jaGVja21hcChzdHJ1Y3QgdWJpX3Zv
bHVtZSAqdm9sLCBpbnQgbGViX2NvdW50KQo+ICAgCWlmICghdWJpLT5mYXN0X2F0dGFjaCkKPiAg
IAkJcmV0dXJuIDA7Cj4gICAKPiAtCXZvbC0+Y2hlY2ttYXAgPSBrY2FsbG9jKEJJVFNfVE9fTE9O
R1MobGViX2NvdW50KSwgc2l6ZW9mKHVuc2lnbmVkIGxvbmcpLAo+IC0JCQkJR0ZQX0tFUk5FTCk7
Cj4gKwl2b2wtPmNoZWNrbWFwID0gYml0bWFwX3phbGxvYyhsZWJfY291bnQsIEdGUF9LRVJORUwp
Owo+ICAgCWlmICghdm9sLT5jaGVja21hcCkKPiAgIAkJcmV0dXJuIC1FTk9NRU07Cj4gICAKPiBA
QCAtMTExOCw3ICsxMTE2LDcgQEAgaW50IHViaV9mYXN0bWFwX2luaXRfY2hlY2ttYXAoc3RydWN0
IHViaV92b2x1bWUgKnZvbCwgaW50IGxlYl9jb3VudCkKPiAgIAo+ICAgdm9pZCB1YmlfZmFzdG1h
cF9kZXN0cm95X2NoZWNrbWFwKHN0cnVjdCB1Ymlfdm9sdW1lICp2b2wpCj4gICB7Cj4gLQlrZnJl
ZSh2b2wtPmNoZWNrbWFwKTsKPiArCWJpdG1hcF9mcmVlKHZvbC0+Y2hlY2ttYXApOwo+ICAgfQo+
ICAgCj4gICAvKioKPiAKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1
YXdlaS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
