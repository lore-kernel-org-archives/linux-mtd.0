Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E47C433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Oct 2022 13:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTEys8+OwGNcOo3gVlvahXX4GzLGXWnpu82XTkwfjlk=; b=lO5Nnsa4qG8DsESKM7E3pGlR1r
	C2JZTuyfNJCPzAf8GAN3LMaL4jTDcoCUm5r5dM5szDS14zs63MCKWw/44P6LnM4Nv+xVKM0drP5zk
	xuPhCd9SAa9HncgiNDm3XFten2JtT6tDZ9q97nJoXZPjY88oOziRr36nwAi8yzOWu8RsihdWtRm1W
	ESUEJAd+F9t+loKUJT/lWoZKt3bgGEpJ60xPuxsLk8QxtsuSr1v2+4+roSjtpDVZpQIG0WOo/uPYH
	gWzvvmHq+Scf+N8Qp2CgIiS8wOutgR0G3w9SmwfVfbUO6xHSiPmQqGdCYY740Iod/GIaPIUekmSwr
	MikKFJbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ols0Y-007vKz-Jk; Fri, 21 Oct 2022 13:24:18 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ols0T-007vFb-GM
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2022 13:24:16 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mv4n50q9HzmV8R;
	Fri, 21 Oct 2022 21:19:21 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 21:24:07 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 21:24:06 +0800
Subject: Re: [PATCH 1/2] ubi: Fix use-after-free when volume resizing failed
To: Li Zetao <lizetao1@huawei.com>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <vigneshr@ti.com>, <dedekind@linutronix.de>,
	<haver@vnet.ibm.com>, <bbrezillon@kernel.org>
CC: <boris.brezillon@free-electrons.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20221021102157.1341807-1-lizetao1@huawei.com>
 <20221021102157.1341807-2-lizetao1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <017d217a-5497-2627-afe3-c3c4ef70723a@huawei.com>
Date: Fri, 21 Oct 2022 21:24:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20221021102157.1341807-2-lizetao1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_062413_967000_3DCF409E 
X-CRM114-Status: GOOD (  17.71  )
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

1NogMjAyMi8xMC8yMSAxODoyMSwgTGkgWmV0YW8g0LS1wDoKPiBUaGVyZSBpcyBhbiB1c2UtYWZ0
ZXItZnJlZSBwcm9ibGVtIHJlcG9ydGVkIGJ5IEtBU0FOOgo+ICAgID09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ICAgIEJV
RzogS0FTQU46IHVzZS1hZnRlci1mcmVlIGluIHViaV9lYmFfY29weV90YWJsZSsweDExZi8weDFj
MCBbdWJpXQo+ICAgIFJlYWQgb2Ygc2l6ZSA4IGF0IGFkZHIgZmZmZjg4ODEwMWVlYzAwOCBieSB0
YXNrIHViaXJzdm9sLzQ3MzUKPgo+ICAgIENQVTogMiBQSUQ6IDQ3MzUgQ29tbTogdWJpcnN2b2wK
PiAgICBOb3QgdGFpbnRlZCA2LjEuMC1yYzEtMDAwMDMtZzg0ZmEzMzA0YTdmYy1kaXJ0eSAjMTQK
PiAgICBIYXJkd2FyZSBuYW1lOiBRRU1VIFN0YW5kYXJkIFBDIChpNDQwRlggKyBQSUlYLCAxOTk2
KSwKPiAgICBCSU9TIDEuMTQuMC0xLmZjMzMgMDQvMDEvMjAxNAo+ICAgIENhbGwgVHJhY2U6Cj4g
ICAgIDxUQVNLPgo+ICAgICBkdW1wX3N0YWNrX2x2bCsweDM0LzB4NDQKPiAgICAgcHJpbnRfcmVw
b3J0KzB4MTcxLzB4NDcyCj4gICAgIGthc2FuX3JlcG9ydCsweGFkLzB4MTMwCj4gICAgIHViaV9l
YmFfY29weV90YWJsZSsweDExZi8weDFjMCBbdWJpXQo+ICAgICB1YmlfcmVzaXplX3ZvbHVtZSsw
eDRmOS8weGJjMCBbdWJpXQo+ICAgICB1YmlfY2Rldl9pb2N0bCsweDcwMS8weDE4NTAgW3ViaV0K
PiAgICAgX194NjRfc3lzX2lvY3RsKzB4MTFkLzB4MTcwCj4gICAgIGRvX3N5c2NhbGxfNjQrMHgz
NS8weDgwCj4gICAgIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ2LzB4YjAKPiAg
ICAgPC9UQVNLPgo+Cj4gV2hlbiB1YmlfY2hhbmdlX3Z0YmxfcmVjb3JkKCkgcmV0dXJucyBhbiBl
cnJvciBpbiB1YmlfcmVzaXplX3ZvbHVtZSgpLAo+ICJuZXdfZWJhX3RibCIgd2lsbCBiZSBmcmVl
ZCBvbiBlcnJvciBoYW5kaW5nIHBhdGgsIGJ1dCBpdCBpcyBob2xkZWQKPiBieSAidm9sLT5lYmFf
dGJsIiBpbiB1YmlfZWJhX3JlcGxhY2VfdGFibGUoKS4gSXQgbWVhbnMgdGhhdCB0aGUgbGlmdGN5
Y2xlCj4gb2YgInZvbC0+ZWJhX3RibCIgYW5kICJ2b2wiIGFyZSBkaWZmZXJlbnQsIHNvIHdoZW4g
cmVzaXppbmcgdm9sdW1lIGluCj4gbmV4dCB0aW1lLCBpdCBjYXVzaW5nIGFuIHVzZS1hZnRlci1m
cmVlIGZhdWx0Lgo+Cj4gRml4IGl0IGJ5IG5vdCBmcmVlaW5nICJuZXdfZWJhX3RibCIgYWZ0ZXIg
aXQgcmVwbGFjZWQgaW4KPiB1YmlfZWJhX3JlcGxhY2VfdGFibGUoKSwgd2hpbGUgd2lsbCBiZSBm
cmVlZCBpbiBuZXh0IHZvbHVtZSByZXNpemluZy4KPgo+IEZpeGVzOiA4MDFjMTM1Y2U3M2QgKCJV
Qkk6IFVuc29ydGVkIEJsb2NrIEltYWdlcyIpCj4gU2lnbmVkLW9mZi1ieTogTGkgWmV0YW8gPGxp
emV0YW8xQGh1YXdlaS5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL210ZC91Ymkvdm10LmMgfCA0ICsr
Ky0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC91Ymkvdm10LmMgYi9kcml2ZXJzL210ZC91Ymkvdm10
LmMKPiBpbmRleCA4ZmNjMGJkZjA2MzUuLjc0NjM3NTc1MzQ2ZSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL210ZC91Ymkvdm10LmMKPiArKysgYi9kcml2ZXJzL210ZC91Ymkvdm10LmMKPiBAQCAtNDY0
LDcgKzQ2NCw3IEBAIGludCB1YmlfcmVzaXplX3ZvbHVtZShzdHJ1Y3QgdWJpX3ZvbHVtZV9kZXNj
ICpkZXNjLCBpbnQgcmVzZXJ2ZWRfcGVicykKPiAgIAkJZm9yIChpID0gMDsgaSA8IC1wZWJzOyBp
KyspIHsKPiAgIAkJCWVyciA9IHViaV9lYmFfdW5tYXBfbGViKHViaSwgdm9sLCByZXNlcnZlZF9w
ZWJzICsgaSk7Cj4gICAJCQlpZiAoZXJyKQo+IC0JCQkJZ290byBvdXRfYWNjOwo+ICsJCQkJZ290
byBvdXRfZnJlZTsKPiAgIAkJfQo+ICAgCQlzcGluX2xvY2soJnViaS0+dm9sdW1lc19sb2NrKTsK
PiAgIAkJdWJpLT5yc3ZkX3BlYnMgKz0gcGViczsKPiBAQCAtNTEyLDYgKzUxMiw4IEBAIGludCB1
YmlfcmVzaXplX3ZvbHVtZShzdHJ1Y3QgdWJpX3ZvbHVtZV9kZXNjICpkZXNjLCBpbnQgcmVzZXJ2
ZWRfcGVicykKPiAgIAkJdWJpLT5hdmFpbF9wZWJzICs9IHBlYnM7Cj4gICAJCXNwaW5fdW5sb2Nr
KCZ1YmktPnZvbHVtZXNfbG9jayk7Cj4gICAJfQo+ICsJcmV0dXJuIGVycjsKPiArCj4gICBvdXRf
ZnJlZToKPiAgIAlrZnJlZShuZXdfZWJhX3RibCk7Cj4gICAJcmV0dXJuIGVycjsKClJldmlld2Vk
LWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
