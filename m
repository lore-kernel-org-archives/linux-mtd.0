Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF122C54798
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2024 01:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1GgtNUKTvBxwW1MDCZddVeKo7jrcoHAv54RMDnWMzds=; b=bUHYOYDBAMS7oaLbLmU8gPlkW2
	Z5cGSXKSrGNF3LS2tILtinX6XyQM4R6Hl56COffhCi5seKf12l0nchvcoxAlZADGTjdntynfIymu2
	EF77JkS+XcxaHo1GGrlwqLOtZ9ZyJRnvjrvObE8MZWbZlECNC3Q9COhZ6kfOrBKtSdFHpG8ZemkyQ
	XbfDnD9p4vFOlf5Q9ND2hHvuU5PuYnjZU4YygGBgrKIfvdbDsWtMrk8+KmLB3jCEcLaVl+jSre993
	TIHlWbhH/wRjdChA1Tu6XNdWWw55lTlA96hkTeZDD8gYogVCYT3I9tEyFK5S/wfzRi2kyJ/fOcu9I
	FCnRBiCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfrdC-0000000Fqbf-3geE;
	Fri, 01 Mar 2024 01:24:10 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfrd9-0000000Fqb9-36S6
	for linux-mtd@lists.infradead.org;
	Fri, 01 Mar 2024 01:24:09 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Tm9Km5P9GzvW3L;
	Fri,  1 Mar 2024 09:21:48 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 6D65F14037F;
	Fri,  1 Mar 2024 09:24:00 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 1 Mar 2024 09:23:58 +0800
Subject: Re: [PATCH] ubi: eba: properly rollback inside self_check_eba
To: Fedor Pchelkin <pchelkin@ispras.ru>, Richard Weinberger <richard@nod.at>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Alexey
 Khoroshilov <khoroshilov@ispras.ru>, <lvc-project@linuxtesting.org>,
	<stable@vger.kernel.org>
References: <20240229204237.30453-1-pchelkin@ispras.ru>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <1421503e-b1d2-87f2-e33e-1a0428100be2@huawei.com>
Date: Fri, 1 Mar 2024 09:23:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240229204237.30453-1-pchelkin@ispras.ru>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_172407_961231_3725CDA8 
X-CRM114-Status: GOOD (  16.41  )
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

1NogMjAyNC8zLzEgNDo0MiwgRmVkb3IgUGNoZWxraW4g0LS1wDoKPiBJbiBjYXNlIG9mIGEgbWVt
b3J5IGFsbG9jYXRpb24gZmFpbHVyZSBpbiB0aGUgdm9sdW1lcyBsb29wIHdlIGNhbiBvbmx5Cj4g
cHJvY2VzcyB0aGUgYWxyZWFkeSBhbGxvY2F0ZWQgc2Nhbl9lYmEgYW5kIGZtX2ViYSBhcnJheSBl
bGVtZW50cyBvbiB0aGUKPiBlcnJvciBwYXRoIC0gb3RoZXJzIGFyZSBzdGlsbCB1bmluaXRpYWxp
emVkLgo+IAo+IEZvdW5kIGJ5IExpbnV4IFZlcmlmaWNhdGlvbiBDZW50ZXIgKGxpbnV4dGVzdGlu
Zy5vcmcpLgo+IAo+IEZpeGVzOiAwMGFiZjMwNDE1OTAgKCJVQkk6IEFkZCBzZWxmX2NoZWNrX2Vi
YSgpIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEZlZG9y
IFBjaGVsa2luIDxwY2hlbGtpbkBpc3ByYXMucnU+Cj4gLS0tCj4gICBkcml2ZXJzL210ZC91Ymkv
ZWJhLmMgfCAzICsrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5j
b20+Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3ViaS9lYmEuYyBiL2RyaXZlcnMvbXRk
L3ViaS9lYmEuYwo+IGluZGV4IDhkMWYwZTA1ODkyYy4uNmY1ZWFkYjE1OThkIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvbXRkL3ViaS9lYmEuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3ViaS9lYmEuYwo+
IEBAIC0xNTU3LDYgKzE1NTcsNyBAQCBpbnQgc2VsZl9jaGVja19lYmEoc3RydWN0IHViaV9kZXZp
Y2UgKnViaSwgc3RydWN0IHViaV9hdHRhY2hfaW5mbyAqYWlfZmFzdG1hcCwKPiAgIAkJCQkJICBH
RlBfS0VSTkVMKTsKPiAgIAkJaWYgKCFmbV9lYmFbaV0pIHsKPiAgIAkJCXJldCA9IC1FTk9NRU07
Cj4gKwkJCWtmcmVlKHNjYW5fZWJhW2ldKTsKPiAgIAkJCWdvdG8gb3V0X2ZyZWU7Cj4gICAJCX0K
PiAgIAo+IEBAIC0xNTkyLDcgKzE1OTMsNyBAQCBpbnQgc2VsZl9jaGVja19lYmEoc3RydWN0IHVi
aV9kZXZpY2UgKnViaSwgc3RydWN0IHViaV9hdHRhY2hfaW5mbyAqYWlfZmFzdG1hcCwKPiAgIAl9
Cj4gICAKPiAgIG91dF9mcmVlOgo+IC0JZm9yIChpID0gMDsgaSA8IG51bV92b2x1bWVzOyBpKysp
IHsKPiArCXdoaWxlICgtLWkgPj0gMCkgewo+ICAgCQlpZiAoIXViaS0+dm9sdW1lc1tpXSkKPiAg
IAkJCWNvbnRpbnVlOwo+ICAgCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
