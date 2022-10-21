Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CE9C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Oct 2022 13:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qv8YRLD7wGokpeZq5UXw7OpnsM2PBPMG5guIlRvttWc=; b=cRqKA7HDvVHYcSes1vecsZt3u7
	nvw9MJd8qsMeu4vKQvzvAD5WoD9FYeY8B3FWmSROBHXBPP+Hz9EZRumQ/vtuRcyV/fd1JMHylQ4Ub
	14q59p/6eYyhemIKCcAwSkXpt9F4VuP10PKKZ1rgvtraZcp44hE2JNiNaFHxjRoFO7OZTjl5shzfU
	4VmBDNwetWtegLy8V9Qxbrl638Hmmu65F0hLsuij/dn7a+Ci0WWG02xMA0T9lcYXsPMMf2tR8v3Mh
	qXh/+mj5/gK4TnibX2yK1QGXB7x0yz3X6J2zsU0bo2EDZH4tBNcXCz+Wb8QnrE48eRmtqRLcUYVw1
	K4Z+a7dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ols28-007w8Y-Jk; Fri, 21 Oct 2022 13:25:56 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ols19-007vc3-68
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2022 13:24:56 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Mv4rJ5tjCzJn1g;
	Fri, 21 Oct 2022 21:22:08 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 21:24:50 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 21:24:49 +0800
Subject: Re: [PATCH 2/2] ubi: Fix unreferenced object reported by kmemleak in
 ubi_resize_volume()
To: Li Zetao <lizetao1@huawei.com>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <vigneshr@ti.com>, <dedekind@linutronix.de>,
	<haver@vnet.ibm.com>, <bbrezillon@kernel.org>
CC: <boris.brezillon@free-electrons.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20221021102157.1341807-1-lizetao1@huawei.com>
 <20221021102157.1341807-3-lizetao1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <9e6e3ed0-6709-320f-49b2-3e1056699647@huawei.com>
Date: Fri, 21 Oct 2022 21:24:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20221021102157.1341807-3-lizetao1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_062455_437679_AB2E8877 
X-CRM114-Status: GOOD (  13.65  )
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

1NogMjAyMi8xMC8yMSAxODoyMSwgTGkgWmV0YW8g0LS1wDoKPiBUaGVyZSBpcyBhIG1lbW9yeSBs
ZWFrcyBwcm9ibGVtIHJlcG9ydGVkIGJ5IGttZW1sZWFrOgo+Cj4gdW5yZWZlcmVuY2VkIG9iamVj
dCAweGZmZmY4ODgxMDIwMDdhMDAgKHNpemUgMTI4KToKPiAgICBjb21tICJ1Ymlyc3ZvbCIsIHBp
ZCAzMjA5MCwgamlmZmllcyA0Mjk4NDY0MTM2IChhZ2UgMjM2MS4yMzFzKQo+ICAgIGhleCBkdW1w
IChmaXJzdCAzMiBieXRlcyk6Cj4gZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgIC4uLi4uLi4uLi4uLi4uLi4KPiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiAgLi4uLi4uLi4uLi4uLi4uLgo+ICAgIGJhY2t0cmFjZToK
PiBbPGZmZmZmZmZmODE3NmNlY2Q+XSBfX2ttYWxsb2MrMHg0ZC8weDE1MAo+IFs8ZmZmZmZmZmZh
MDJhOWEzNj5dIHViaV9lYmFfY3JlYXRlX3RhYmxlKzB4NzYvMHgxNzAgW3ViaV0KPiBbPGZmZmZm
ZmZmYTAyOTc2NGU+XSB1YmlfcmVzaXplX3ZvbHVtZSsweDFiZS8weGJjMCBbdWJpXQo+IFs8ZmZm
ZmZmZmZhMDJhMzMyMT5dIHViaV9jZGV2X2lvY3RsKzB4NzAxLzB4MTg1MCBbdWJpXQo+IFs8ZmZm
ZmZmZmY4MTk3NWQyZD5dIF9feDY0X3N5c19pb2N0bCsweDExZC8weDE3MAo+IFs8ZmZmZmZmZmY4
M2MxNDJhNT5dIGRvX3N5c2NhbGxfNjQrMHgzNS8weDgwCj4gWzxmZmZmZmZmZjgzZTAwMDZhPl0g
ZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NDYvMHhiMAo+Cj4gVGhpcyBpcyBkdWUg
dG8gYSBtaXNtYXRjaCBiZXR3ZWVuIGNyZWF0ZSBhbmQgZGVzdHJveSBpbnRlcmZhY2VzLCBhbmQK
PiBpbiBkZXRhaWwgdGhhdCAibmV3X2ViYV90YmwiIGNyZWF0ZWQgYnkgdWJpX2ViYV9jcmVhdGVf
dGFibGUoKSBidXQKPiBkZXN0cm95ZWQgYnkga2ZyZWUoKSwgd2hpbGUgd2lsbCBjYXVzaW5nICJu
ZXdfZWJhX3RibC0+ZW50cmllcyIgbm90Cj4gZnJlZWQuCj4KPiBGaXggaXQgYnkgcmVwbGFjaW5n
IGtmcmVlKG5ld19lYmFfdGJsKSB3aXRoCj4gdWJpX2ViYV9kZXN0cm95X3RhYmxlKG5ld19lYmFf
dGJsKQo+Cj4gRml4ZXM6IDc5OWRjYTM0YWM1NCAoIlVCSTogaGlkZSBFQkEgaW50ZXJuYWxzIikK
PiBTaWduZWQtb2ZmLWJ5OiBMaSBaZXRhbyA8bGl6ZXRhbzFAaHVhd2VpLmNvbT4KPiAtLS0KPiAg
IGRyaXZlcnMvbXRkL3ViaS92bXQuYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3ViaS92
bXQuYyBiL2RyaXZlcnMvbXRkL3ViaS92bXQuYwo+IGluZGV4IDc0NjM3NTc1MzQ2ZS4uOWZiYzY0
Yjk5N2NlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3ViaS92bXQuYwo+ICsrKyBiL2RyaXZl
cnMvbXRkL3ViaS92bXQuYwo+IEBAIC01MTUsNyArNTE1LDcgQEAgaW50IHViaV9yZXNpemVfdm9s
dW1lKHN0cnVjdCB1Ymlfdm9sdW1lX2Rlc2MgKmRlc2MsIGludCByZXNlcnZlZF9wZWJzKQo+ICAg
CXJldHVybiBlcnI7Cj4gICAKPiAgIG91dF9mcmVlOgo+IC0Ja2ZyZWUobmV3X2ViYV90YmwpOwo+
ICsJdWJpX2ViYV9kZXN0cm95X3RhYmxlKG5ld19lYmFfdGJsKTsKPiAgIAlyZXR1cm4gZXJyOwo+
ICAgfQo+ICAgCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2Vp
LmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
