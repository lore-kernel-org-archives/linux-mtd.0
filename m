Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D09E77179
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Dec 2024 04:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYCd5qesT/eJU1J4Ico66j8VZq+YTIDPnbBfck/DpRs=; b=OFka1TkbTBdZDdu1cVC/QxS50G
	lWzGA4DQwnEeoLgE8H2EVMr7rkbA4CHIVVBwSmx9fZh16g2EYCYgj0rDN0TD+Imip+nC8vQGUb3SC
	m4QILNlLvU72p95iVJcXNEF+rgzPWfRNBo0ENVTZ+CyZU+n1E5S5O3ylR4jSQlG9OiOsimM+U954s
	1OhFcGKsdPgH3QHwfQQUcVBpIOvqY7Rq6HRjKOD/jtQvWLp+zNzAE/jvySBwSdLxWudLyR8yZ8Z4q
	Uob9ZcT9SLUHich7HYGquO9799heQFD/Y6U8DbRz9VnaCz/4s52lZnv03CyFV6JFzbe7LwFI7sD8s
	UJ4zk+ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJmGK-00000003ITt-0bVw;
	Sat, 07 Dec 2024 04:17:48 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJmGF-00000003ITE-0KmQ
	for linux-mtd@lists.infradead.org;
	Sat, 07 Dec 2024 04:17:45 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Y4vty5fvNzRhmq;
	Sat,  7 Dec 2024 12:15:54 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 426C51800FD;
	Sat,  7 Dec 2024 12:17:35 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 7 Dec 2024 12:17:34 +0800
Subject: Re: [PATCH] mtdchar: fix integer overflow in read/write ioctls
To: Dan Carpenter <dan.carpenter@linaro.org>,
	=?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel-janitors@vger.kernel.org>
References: <020f98d2-eee1-434e-8236-775cca9fd157@stanley.mountain>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <e3da1bba-9740-6b6f-385a-1bdf25f056a9@huawei.com>
Date: Sat, 7 Dec 2024 12:17:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <020f98d2-eee1-434e-8236-775cca9fd157@stanley.mountain>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_201743_387440_9B21084F 
X-CRM114-Status: GOOD (  15.59  )
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

1NogMjAyNC8xMi83IDQ6MjYsIERhbiBDYXJwZW50ZXIg0LS1wDoKPiBUaGUgInJlcS5zdGFydCIg
YW5kICJyZXEubGVuIiB2YXJpYWJsZXMgYXJlIHU2NCB2YWx1ZXMgdGhhdCBjb21lIGZyb20gdGhl
Cj4gdXNlciBhdCB0aGUgc3RhcnQgb2YgdGhlIGZ1bmN0aW9uLiAgV2UgbWFzayBhd2F5IHRoZSBo
aWdoIDMyIGJpdHMgb2YKPiAicmVxLmxlbiIgc28gdGhhdCdzIGNhcHBlZCBhdCBVMzJfTUFYIGJ1
dCB0aGUgInJlcS5zdGFydCIgdmFyaWFibGUgY2FuIGdvCj4gdXAgdG8gVTY0X01BWC4KPiAKPiBV
c2UgY2hlY2tfYWRkX292ZXJmbG93KCkgdG8gZml4IHRoaXMgYnVnLgo+IAo+IEZpeGVzOiA2NDIw
YWMwYWY5NWQgKCJtdGRjaGFyOiBwcmV2ZW50IHVuYm91bmRlZCBhbGxvY2F0aW9uIGluIE1FTVdS
SVRFIGlvY3RsIikKCkhpLCBEYW4uIFdoeSB0aGlzIGZpeCB0YWc/IEkgdGhpbmsgdGhlIGFkZGlu
ZyByZXN1bHQoJ3JlcS5zdGFydCcgYW5kIAoncmVxLmxlbicpIGNvdWxkIGJlIG92ZXJmbG93IHRv
byBiZWZvcmUgdGhpcyBjb21taXQuCgo+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRh
bi5jYXJwZW50ZXJAbGluYXJvLm9yZz4KPiAtLS0KPiAgIGRyaXZlcnMvbXRkL210ZGNoYXIuYyB8
IDYgKysrKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRjaGFyLmMgYi9kcml2ZXJzL210
ZC9tdGRjaGFyLmMKPiBpbmRleCA4ZGM0ZjVjNDkzZmMuLjMzNWM3MDI2MzNmZiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL210ZC9tdGRjaGFyLmMKPiArKysgYi9kcml2ZXJzL210ZC9tdGRjaGFyLmMK
PiBAQCAtNTk5LDYgKzU5OSw3IEBAIG10ZGNoYXJfd3JpdGVfaW9jdGwoc3RydWN0IG10ZF9pbmZv
ICptdGQsIHN0cnVjdCBtdGRfd3JpdGVfcmVxIF9fdXNlciAqYXJncCkKPiAgIAl1aW50OF90ICpk
YXRidWYgPSBOVUxMLCAqb29iYnVmID0gTlVMTDsKPiAgIAlzaXplX3QgZGF0YnVmX2xlbiwgb29i
YnVmX2xlbjsKPiAgIAlpbnQgcmV0ID0gMDsKPiArCXU2NCBlbmQ7Cj4gICAKPiAgIAlpZiAoY29w
eV9mcm9tX3VzZXIoJnJlcSwgYXJncCwgc2l6ZW9mKHJlcSkpKQo+ICAgCQlyZXR1cm4gLUVGQVVM
VDsKPiBAQCAtNjE4LDcgKzYxOSw3IEBAIG10ZGNoYXJfd3JpdGVfaW9jdGwoc3RydWN0IG10ZF9p
bmZvICptdGQsIHN0cnVjdCBtdGRfd3JpdGVfcmVxIF9fdXNlciAqYXJncCkKPiAgIAlyZXEubGVu
ICY9IDB4ZmZmZmZmZmY7Cj4gICAJcmVxLm9vYmxlbiAmPSAweGZmZmZmZmZmOwo+ICAgCj4gLQlp
ZiAocmVxLnN0YXJ0ICsgcmVxLmxlbiA+IG10ZC0+c2l6ZSkKPiArCWlmIChjaGVja19hZGRfb3Zl
cmZsb3cocmVxLnN0YXJ0LCByZXEubGVuLCAmZW5kKSB8fCBlbmQgPiBtdGQtPnNpemUpCj4gICAJ
CXJldHVybiAtRUlOVkFMOwo+ICAgCj4gICAJZGF0YnVmX2xlbiA9IG1pbl90KHNpemVfdCwgcmVx
LmxlbiwgbXRkLT5lcmFzZXNpemUpOwo+IEBAIC02OTgsNiArNjk5LDcgQEAgbXRkY2hhcl9yZWFk
X2lvY3RsKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBzdHJ1Y3QgbXRkX3JlYWRfcmVxIF9fdXNlciAq
YXJncCkKPiAgIAlzaXplX3QgZGF0YnVmX2xlbiwgb29iYnVmX2xlbjsKPiAgIAlzaXplX3Qgb3Jp
Z19sZW4sIG9yaWdfb29ibGVuOwo+ICAgCWludCByZXQgPSAwOwo+ICsJdTY0IGVuZDsKPiAgIAo+
ICAgCWlmIChjb3B5X2Zyb21fdXNlcigmcmVxLCBhcmdwLCBzaXplb2YocmVxKSkpCj4gICAJCXJl
dHVybiAtRUZBVUxUOwo+IEBAIC03MjQsNyArNzI2LDcgQEAgbXRkY2hhcl9yZWFkX2lvY3RsKHN0
cnVjdCBtdGRfaW5mbyAqbXRkLCBzdHJ1Y3QgbXRkX3JlYWRfcmVxIF9fdXNlciAqYXJncCkKPiAg
IAlyZXEubGVuICY9IDB4ZmZmZmZmZmY7Cj4gICAJcmVxLm9vYmxlbiAmPSAweGZmZmZmZmZmOwo+
ICAgCj4gLQlpZiAocmVxLnN0YXJ0ICsgcmVxLmxlbiA+IG10ZC0+c2l6ZSkgewo+ICsJaWYgKGNo
ZWNrX2FkZF9vdmVyZmxvdyhyZXEuc3RhcnQsIHJlcS5sZW4sICZlbmQpIHx8IGVuZCA+IG10ZC0+
c2l6ZSkgewo+ICAgCQlyZXQgPSAtRUlOVkFMOwo+ICAgCQlnb3RvIG91dDsKPiAgIAl9Cj4gCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
