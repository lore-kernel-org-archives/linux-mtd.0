Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A451EC3DA59
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Jul 2024 08:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OeFsgUdjEe0+Ivu5Lv3BjDFPoyIeRvem3HqF4vklvpk=; b=cUDtylVTp5dxhD8KFJOf3aCWvH
	Hl4/kPYf9+0dLGV3z8Ew3LyzK86H1zauvCuH7Vhy1/+Fw1Wpsd6OMuIyH7iMTbrwDprGTWdk1DRP5
	uewhsqPsO9mVl5X90oY8kX+wJ/Qq83X23ZVUU1jZBLVGKWclRoD4blXY6xbsrw5AFr9NA2lRjkXRK
	NEtm7rGjuwY56hhiiu4jo6jLuUP1Jtm2fzglt5fH1hbfvwuxC6U0Kd6r8K33LLu5v5tWFC2MWaWsu
	tE8qBw3MHo1IX0MnCu6VHw9wVqCwj3MTlDMy0fb7ycixzPN4cLXMLzJbvfGXoC+grZsy9ATk6u4pY
	+NHXvl7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUihS-000000021If-3zh9;
	Fri, 19 Jul 2024 08:10:46 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUign-000000020x2-1ECd
	for linux-mtd@lists.infradead.org;
	Fri, 19 Jul 2024 08:10:07 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WQMfZ38yhzyN4B;
	Fri, 19 Jul 2024 16:05:10 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 646841800A5;
	Fri, 19 Jul 2024 16:09:55 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 16:09:54 +0800
Subject: Re: [PATCH] mtd: ubi: remove __exit annotation on ubiblock_exit
To: Arnd Bergmann <arnd@kernel.org>, Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Ben Hutchings <ben.hutchings@mind.be>
CC: Arnd Bergmann <arnd@arndb.de>, Li Nan <linan122@huawei.com>, Daniel Golle
	<daniel@makrotopia.org>, Jens Axboe <axboe@kernel.dk>, ZhaoLong Wang
	<wangzhaolong1@huawei.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20240719073912.2743171-1-arnd@kernel.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <92d8047d-1bee-d100-fd3f-ec27f030b1e5@huawei.com>
Date: Fri, 19 Jul 2024 16:09:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240719073912.2743171-1-arnd@kernel.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_011005_612489_9B4D4109 
X-CRM114-Status: GOOD (  14.80  )
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

1NogMjAyNC83LzE5IDE1OjM5LCBBcm5kIEJlcmdtYW5uINC0tcA6CkhpLCBBcm5kCj4gRnJvbTog
QXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiAKPiBDYWxsaW5nIGFuIF9fZXhpdCBmdW5j
dGlvbiBmcm9tIGFuIF9faW5pdCBmdW5jdGlvbiBsZWFkcyB0byB1bmRlZmluZWQgYmVoYXZpb3IK
PiB3aGVuIHRoZSBkcmllciBpcyBidWlsdC1pbiBhbmQgdGhlIF9fZXhpdCBmdW5jdGlvbnMgYXJl
IGRyb3BwZWQgZnJvbSB0aGUKPiBvYmplY3Q6Cj4gCj4gV0FSTklORzogbW9kcG9zdDogZHJpdmVy
cy9tdGQvdWJpL3ViaTogc2VjdGlvbiBtaXNtYXRjaCBpbiByZWZlcmVuY2U6IHViaV9pbml0KzB4
YmUgKHNlY3Rpb246IC5pbml0LnRleHQpIC0+IHViaWJsb2NrX2V4aXQgKHNlY3Rpb246IC5leGl0
LnRleHQpCj4gRVJST1I6IG1vZHBvc3Q6IFNlY3Rpb24gbWlzbWF0Y2hlcyBkZXRlY3RlZC4KPiBT
ZXQgQ09ORklHX1NFQ1RJT05fTUlTTUFUQ0hfV0FSTl9PTkxZPXkgdG8gYWxsb3cgdGhlbS4KPiAK
PiBSZW1vdmUgdGhlIG5vdyBpbmNvcnJlY3QgYW5ub3RhdGlvbi4KPiAKPiBGaXhlczogNzJmM2Qz
ZGFkZGQ3ICgibXRkOiB1Ymk6IFJlc3RvcmUgbWlzc2luZyBjbGVhbnVwIG9uIHViaV9pbml0KCkg
ZmFpbHVyZSBwYXRoIikKPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPgo+IC0tLQo+ICAgZHJpdmVycy9tdGQvdWJpL2Jsb2NrLmMgfCAyICstCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKClJpY2hhcmQgaGFzIHNlbnQg
dGhlIHNhbWUgbW9kaWZpY2F0aW9uLCBzZWUKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
bXRkLzlhMjEwNDI0LWVhYzEtOTU3ZS1kZDZlLTQyOTA5MjQyMTZlM0BodWF3ZWkuY29tL1QvI21k
ZWZiZDc5Mzk5MjYzNWY2YTIzNmE2MjZkZDdkM2EyOTZmYjk4MjBlCgo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC91YmkvYmxvY2suYyBiL2RyaXZlcnMvbXRkL3ViaS9ibG9jay5jCj4gaW5k
ZXggYmY3MzA4ZThlYzJmLi42MGQwMTU1YmU4NjkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQv
dWJpL2Jsb2NrLmMKPiArKysgYi9kcml2ZXJzL210ZC91YmkvYmxvY2suYwo+IEBAIC02NzAsNyAr
NjcwLDcgQEAgaW50IF9faW5pdCB1YmlibG9ja19pbml0KHZvaWQpCj4gICAJcmV0dXJuIHJldDsK
PiAgIH0KPiAgIAo+IC12b2lkIF9fZXhpdCB1YmlibG9ja19leGl0KHZvaWQpCj4gK3ZvaWQgdWJp
YmxvY2tfZXhpdCh2b2lkKQo+ICAgewo+ICAgCXViaV91bnJlZ2lzdGVyX3ZvbHVtZV9ub3RpZmll
cigmdWJpYmxvY2tfbm90aWZpZXIpOwo+ICAgCXViaWJsb2NrX3JlbW92ZV9hbGwoKTsKPiAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
