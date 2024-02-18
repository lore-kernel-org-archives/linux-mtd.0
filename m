Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF10CC4829E
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Feb 2024 08:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2QKZlk30VsxPJ30YYp2St3vyOtgtP0Y3tWv5iqhvlsE=; b=ieZ0XihxRf3ZILs5CGZQO4GTrQ
	lX5hY7d3bAYBwMzGVcI8oVAwdq1UxJVB/K3d8U6WrkX4qfRjn3RthKCOv0nZOuQMXcSk3TLSJHIjK
	VR4295OmmAIPg9vy7sVflxynq6HwdwvWwdMWRGEbssqeqSf65W0INNJzbr4ESGSiOe7eLro3UjEA9
	3tZm2/ekyVvvMHzk3vZL4SyqLsi9T4bKrlaih8cUAhadlKyoozKWkvmppzMGWuH6xHXbme9/BEwSE
	8ekUwxg86wp8H6zDWfeaKaBzFKTsKSe1wFLURlOrMRh658rEPQZiCOQ3zus1eSqSekhat/zEPDA0t
	hoB/BYwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbcqo-00000007LSd-3PU1;
	Sun, 18 Feb 2024 08:48:42 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbcql-00000007LRp-0euG
	for linux-mtd@lists.infradead.org;
	Sun, 18 Feb 2024 08:48:41 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4TczmY4qXxzXh9R;
	Sun, 18 Feb 2024 16:46:37 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 73B041402CF;
	Sun, 18 Feb 2024 16:48:27 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 18 Feb 2024 16:48:26 +0800
Subject: Re: [PATCH 5.4 058/194] mtd: Fix gluebi NULL pointer dereference
 caused by ftl notifier
To: Martin Kepplinger-Novakovic <martink@posteo.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, <stable@vger.kernel.org>
CC: <patches@lists.linux.dev>, ZhaoLong Wang <wangzhaolong1@huawei.com>,
	Richard Weinberger <richard@nod.at>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Sasha Levin <sashal@kernel.org>,
	<linux-mtd@lists.infradead.org>, <vigneshr@ti.com>,
	<dpervushin@embeddedalley.com>, <Artem.Bityutskiy@nokia.com>,
	<linux-kernel@vger.kernel.org>, <yi.zhang@huawei.com>,
	<yangerkun@huawei.com>, Henri Roosen <Henri.Roosen@ginzinger.com>, Melchior
 Franz <Melchior.Franz@ginzinger.com>
References: <20240122235719.206965081@linuxfoundation.org>
 <20240122235721.687806578@linuxfoundation.org>
 <fdfcc3b6e1a884bb986acf072bcc13611eae8bdd.camel@posteo.de>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <a53aacd3-4270-2d80-f14c-8cfd763e4404@huawei.com>
Date: Sun, 18 Feb 2024 16:48:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <fdfcc3b6e1a884bb986acf072bcc13611eae8bdd.camel@posteo.de>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_004839_553658_A5B88E70 
X-CRM114-Status: GOOD (  18.03  )
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjQvMi85IDE1OjA5LCBNYXJ0aW4gS2VwcGxpbmdlci1Ob3Zha292aWMg5YaZ6YGTOgo+
IEFtIE1vbnRhZywgZGVtIDIyLjAxLjIwMjQgdW0gMTU6NTYgLTA4MDAgc2NocmllYiBHcmVnIEty
b2FoLUhhcnRtYW46Cj4+IDUuNC1zdGFibGUgcmV2aWV3IHBhdGNoLsKgIElmIGFueW9uZSBoYXMg
YW55IG9iamVjdGlvbnMsIHBsZWFzZSBsZXQgbWUKPj4ga25vdy4KPj4KPj4gLS0tLS0tLS0tLS0t
LS0tLS0tCj4+Cj4+IEZyb206IFpoYW9Mb25nIFdhbmcgPHdhbmd6aGFvbG9uZzFAaHVhd2VpLmNv
bT4KPj4KPj4gWyBVcHN0cmVhbSBjb21taXQgYTQzYmRjMzc2ZGVhYjVmZmYxY2ViOTNkY2E1NWJj
YWI4ZGJkYzFkNiBdCj4+CgpbLi4uXQoKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZF9i
bGtkZXZzLmMgYi9kcml2ZXJzL210ZC9tdGRfYmxrZGV2cy5jCj4+IGluZGV4IDBjMDVmNzdmOWIy
MS4uZGQwZDBiZjVmNTdmIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9tdGRfYmxrZGV2cy5j
Cj4+ICsrKyBiL2RyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmMKPj4gQEAgLTUzMyw3ICs1MzMsNyBA
QCBzdGF0aWMgdm9pZCBibGt0cmFuc19ub3RpZnlfYWRkKHN0cnVjdCBtdGRfaW5mbwo+PiAqbXRk
KQo+PiAgwqB7Cj4+ICDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IG10ZF9ibGt0cmFuc19vcHMgKnRy
Owo+PiAgIAo+PiAtwqDCoMKgwqDCoMKgwqBpZiAobXRkLT50eXBlID09IE1URF9BQlNFTlQpCj4+
ICvCoMKgwqDCoMKgwqDCoGlmIChtdGQtPnR5cGUgPT0gTVREX0FCU0VOVCB8fCBtdGQtPnR5cGUg
PT0gTVREX1VCSVZPTFVNRSkKPj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0
dXJuOwo+PiAgIAo+PiAgwqDCoMKgwqDCoMKgwqDCoGxpc3RfZm9yX2VhY2hfZW50cnkodHIsICZi
bGt0cmFuc19tYWpvcnMsIGxpc3QpCj4+IEBAIC01NzYsNyArNTc2LDcgQEAgaW50IHJlZ2lzdGVy
X210ZF9ibGt0cmFucyhzdHJ1Y3QgbXRkX2Jsa3RyYW5zX29wcwo+PiAqdHIpCj4+ICDCoMKgwqDC
oMKgwqDCoMKgbGlzdF9hZGQoJnRyLT5saXN0LCAmYmxrdHJhbnNfbWFqb3JzKTsKPj4gICAKPj4g
IMKgwqDCoMKgwqDCoMKgwqBtdGRfZm9yX2VhY2hfZGV2aWNlKG10ZCkKPj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGlmIChtdGQtPnR5cGUgIT0gTVREX0FCU0VOVCkKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChtdGQtPnR5cGUgIT0gTVREX0FCU0VOVCAmJiBt
dGQtPnR5cGUgIT0KPj4gTVREX1VCSVZPTFVNRSkKPj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHRyLT5hZGRfbXRkKHRyLCBtdGQpOwo+PiAgIAo+PiAg
wqDCoMKgwqDCoMKgwqDCoG11dGV4X3VubG9jaygmbXRkX3RhYmxlX211dGV4KTsKPiAKPiBIaSBH
cmVnLCBoaSBwYXRjaC1kZXZlbG9wZXJzLAo+IAo+IHdhaXQgYSBzZWNvbmQuIHRoaXMgYWxyZWFk
eSB3ZW50IGludG8gdjUuNC4yNjggYnV0IHN0aWxsOiBEb2Vzbid0IHRoaXMKPiBicmVhayB1c2Vy
c3BhY2U/Cj4gCj4gQWNjb3JkaW5nIHRvCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC80
NDExMDcxMDAuMjM3MzQuMTY5NzkwNDU4MDI1Mi5KYXZhTWFpbC56aW1icmFAbm9kLmF0Lwo+IHdo
ZXJlIHRoaXMgc29sdXRpb24gc2VlbXMgdG8gY29tZSBmcm9tLCB0aGUgYmVoYXZpb3VyIGNoYW5n
ZXM6ICJubwo+IG10ZGJsb2NrIChoZW5jZSwgYWxzbyBubyBGVExzKSBvbiB0b3Agb2YgZ2x1ZWJp
LiIKPiAKPiBJIGZlbGwgYWNjcm9zcyB0aGlzIGJlY2F1c2Ugb2YgYW4gb3V0LW9mLXRyZWUgbW9k
dWxlIHRoYXQgZG9lcwo+IHN5c19tb3VudCgpIGFuIG10ZGJsb2NrLCBzbyBJIHdvbid0IGNvbXBs
YWluIGFib3V0IG15IGNvZGUgc3BlY2lmaWNhbGx5Cj4gOikgQnV0IGRvZXNuJ3QgaXQgYnJlYWsg
bW91bnRpbmcsIHNheSwgamZmczIgaW5zaWRlIGFuIHViaSB2aWEKPiBtdGRibG9jaz8gSWYgc28s
IGlzIHRoaXMgcmVhbGx5IHNvbWV0aGluZyB0aGF0IHlvdSB3YW50IHRvIHNlZQo+IGJhY2twb3J0
ZWQgdG8gb2xkIGtlcm5lbHM/Cj4gCj4gT3IgZGlmZmVyZW50bHkgcHV0OiBIYXMgdGhpcyBwYXRj
aCBiZWVuIHBpY2tlZCB1cCBmb3Igb2xkIHN0YWJsZQo+IGtlcm5lbHMgYnkgc2NyaXB0cyBvciBi
eSBhIGh1bWFuPwo+IAo+IEkganVzdCB3YW50IHRvIG1ha2Ugc3VyZSwgYW5kIHdobyBrbm93cywg
aXQgbWlnaHQgaGVscCBvdGhlcnMgdG9vLCB3aG8KPiB3b3VsZCBqdXN0IGRvIGEgKHBvc3NpYmx5
IGRhbmdlcm91cz8pIHJldmVydCBpbiB0aGVpciB0cmVlcy4KPiAKClRoaXMgY2hhbmdlIGRvZXMg
YWZmZWN0IHRoZSBtb3VudGluZyhtdGRibG9jayBiYXNlZCBvbiBnbHVlYmkpIGJlaGF2aW9yIApp
biB1c2Vyc3BhY2UuIEl0IHdhcyBwaWNrZWQgaW50byBzdGFibGUgdmVyc2lvbnMgYmVjYXVzZSB0
aGUgZml4ZWQgCnByb2JsZW0gaXMgc2VyaW91cyBhbmQgZWFzeSB0byBiZSByZXByb2R1Y2VkLCBJ
IGd1ZXNzLgpBIHRlbXBvcmFyeSBzb2x1dGlvbiBpcyB0aGF0IG1vZGlmeSBtb3VudGluZyBzb3Vy
Y2UgdGFyZ2V0IGluIHVzZXJzcGFjZSwgCmp1c3QgcmVwbGFjZSBtdGRibG9jayB3aXRoIG10ZCBj
aGFyIGRldmljZS4gRm9yIGV4YW1wbGUsIG1vdW50IC10IGpmZnMyIAptdGQwIC9tbnQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
