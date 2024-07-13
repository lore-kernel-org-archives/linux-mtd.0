Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F7BC3DA42
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Jul 2024 08:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WkS+g5r3AC9vlOeS9k0O6Xp0rsmJtsH3QIVLpCvDny0=; b=JXV7kmeWQHZNpguTsuHuf8DPgY
	74/VWkGCMy33xyA5UtzWQYJWJuJIPT8LKHWM+CgG0KRWt0vszlrD+IJHdfozQsbN/lmLRg0TqsHdc
	wgcpcAk7qwgVgw2Ewt/YpwRlbldUcObsTKmT0xP/aEUQ8V1pwoLbtlLeSW6BqcUoA+uQveEKNWZps
	lXkvM6qq//gX4AxRyrQRXQQJOUc/FqI9bqjnHb+9j4DHmq6k5U9tz8p29AA0OBsrn5KzhB2p+t2yW
	b+x8BEFfzJKzxIxpzH3T36DbK6HXPLbWahp112ds2LgzSZlITV2ruYNHCVlL88EweJw8FJxT4QgYx
	ajX9NxmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSXvt-00000002AXn-0oH3;
	Sat, 13 Jul 2024 08:16:41 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSXvo-00000002AWu-3V1c
	for linux-mtd@lists.infradead.org;
	Sat, 13 Jul 2024 08:16:39 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WLh512nFlzxTQR;
	Sat, 13 Jul 2024 16:11:49 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id B990118005F;
	Sat, 13 Jul 2024 16:16:27 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 13 Jul 2024 16:16:27 +0800
Subject: Re: [PATCH] ubi: Fix ubi_init() ubiblock_exit() section mismatch
To: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Ben Hutchings <bwh@kernel.org>, kernel
 test robot <lkp@intel.com>
References: <20240713073519.25325-1-richard@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <3c624cf1-b5a3-f89c-ac6a-0875fcabaf25@huawei.com>
Date: Sat, 13 Jul 2024 16:16:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240713073519.25325-1-richard@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240713_011637_069096_3907AF11 
X-CRM114-Status: GOOD (  12.07  )
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

1NogMjAyNC83LzEzIDE1OjM1LCBSaWNoYXJkIFdlaW5iZXJnZXIg0LS1wDoKPiBTaW5jZSB1Ymli
bG9ja19leGl0KCkgaXMgbm93IGNhbGxlZCBmcm9tIGFuIGluaXQgZnVuY3Rpb24sCj4gdGhlIF9f
ZXhpdCBzZWN0aW9uIG5vIGxvbmdlciBtYWtlcyBzZW5zZS4KPiAKPiBDYzogQmVuIEh1dGNoaW5n
cyA8YndoQGtlcm5lbC5vcmc+Cj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BA
aW50ZWwuY29tPgo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFs
bC8yMDI0MDcxMzE0MDMud1pKcGQ4bjItbGtwQGludGVsLmNvbS8KPiBTaWduZWQtb2ZmLWJ5OiBS
aWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0Pgo+IC0tLQo+ICAgZHJpdmVycy9tdGQv
dWJpL2Jsb2NrLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCkxvb2tzIGxpa2UgdGhhdCB5b3UgcHJlZmVyIGEgc2ltcGxlciBmaXguIEZl
ZWwgZmluZSB0byBhZGQKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBo
dWF3ZWkuY29tPgo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC91YmkvYmxvY2suYyBiL2Ry
aXZlcnMvbXRkL3ViaS9ibG9jay5jCj4gaW5kZXggYmY3MzA4ZThlYzJmZS4uNjBkMDE1NWJlODY5
ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC91YmkvYmxvY2suYwo+ICsrKyBiL2RyaXZlcnMv
bXRkL3ViaS9ibG9jay5jCj4gQEAgLTY3MCw3ICs2NzAsNyBAQCBpbnQgX19pbml0IHViaWJsb2Nr
X2luaXQodm9pZCkKPiAgIAlyZXR1cm4gcmV0Owo+ICAgfQo+ICAgCj4gLXZvaWQgX19leGl0IHVi
aWJsb2NrX2V4aXQodm9pZCkKPiArdm9pZCB1YmlibG9ja19leGl0KHZvaWQpCj4gICB7Cj4gICAJ
dWJpX3VucmVnaXN0ZXJfdm9sdW1lX25vdGlmaWVyKCZ1YmlibG9ja19ub3RpZmllcik7Cj4gICAJ
dWJpYmxvY2tfcmVtb3ZlX2FsbCgpOwo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
