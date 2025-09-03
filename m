Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DEDCA1007
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Sep 2025 02:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jr2BYZbOBzsM6jq6KAg44sJM6hijXQKrVyLCIEO6DYI=; b=USTc0lsZTVQL+co2fDu8ZVQg2F
	8BSkrdsPOtePpEb4P9s0FzM4nkopinX+kyr1/WWIgD3L1IM+VGoSQ+MvEhBMh1HbdLW0Zl5p5JSFF
	gQ3FGghg2OVmYrPVtlaN4o9Bgc93H9WHOODtAdx49mhJZj+JgnZEuBPRURX2dP5rYQb4mhJ4HUXPu
	J+Z5vQIUy5nGZJYfSQdjyBqkKWLUjU+ZkwnLzz9zbvHOH3YPaKXFYiuBrBiL52RqMq+YhMv3emLnS
	+NbamD0C7/53nExvAEYNbmVoORDx0tv15skr6jSK15bVmv3iEcZ92vLayRalHjtk2NPFwcIfItC31
	mNXfIazw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utcy3-00000003COE-2bDJ;
	Wed, 03 Sep 2025 02:11:23 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utcy0-00000003CLr-1NDE
	for linux-mtd@lists.infradead.org;
	Wed, 03 Sep 2025 02:11:21 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4cGmL92gwFz14MlG;
	Wed,  3 Sep 2025 10:10:57 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 4D4CE1402CA;
	Wed,  3 Sep 2025 10:11:07 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 3 Sep 2025 10:11:06 +0800
Subject: Re: [PATCH V2] mtd: core: skip badblocks increment for blocks already
 known bad
To: Wang Zhaolong <wangzhaolong@huaweicloud.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>, <yangerkun@huawei.com>
References: <20250902092732.2244544-1-wangzhaolong@huaweicloud.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <50be01fc-a9d3-0998-2728-82e3595b7820@huawei.com>
Date: Wed, 3 Sep 2025 10:11:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250902092732.2244544-1-wangzhaolong@huaweicloud.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_191120_523929_AB7D47AE 
X-CRM114-Status: GOOD (  19.44  )
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

1NogMjAyNS85LzIgMTc6MjcsIFdhbmcgWmhhb2xvbmcg0LS1wDoKPiBSZXBlYXRlZGx5IG1hcmtp
bmcgdGhlIHNhbWUgZXJhc2VibG9jayBiYWQgaW5mbGF0ZXMKPiBtdGQtPmVjY19zdGF0cy5iYWRi
bG9ja3MgYmVjYXVzZSBtdGRfYmxvY2tfbWFya2JhZCgpIHVuY29uZGl0aW9uYWxseQo+IGluY3Jl
bWVudHMgdGhlIGNvdW50ZXIgb24gc3VjY2Vzcywgd2hpbGUgc29tZSBpbXBsZW1lbnRhdGlvbnMg
KGUuZy4KPiBOQU5EKSByZXR1cm4gMCBib3RoIHdoZW4gdGhlIGJsb2NrIHdhcyBhbHJlYWR5IGJh
ZCBhbmQgd2hlbiBpdCBoYXMganVzdAo+IGJlZW4gbWFya2VkWzFdLgo+IAo+IEZpeCBieSBjaGVj
a2luZyBpZiB0aGUgYmxvY2sgaXMgYWxyZWFkeSBiYWQgYmVmb3JlIGNhbGxpbmcKPiAtPl9ibG9j
a19tYXJrYmFkKCkgd2hlbiBfYmxvY2tfaXNiYWQgaXMgYXZhaWxhYmxlLiBPbmx5IHNraXAgdGhl
IGNvdW50ZXIKPiBpbmNyZW1lbnQgd2hlbiB3ZSBjYW4gY29uZmlybSB0aGUgYmxvY2sgd2FzIGFs
cmVhZHkgYmFkLiBJbiBhbGwgb3RoZXIKPiBjYXNlcyBjb250aW51ZSBpbmNyZW1lbnRpbmcgdGhl
IGNvdW50ZXIuCj4gCj4gVGhpcyBrZWVwcyB0aGUgbG9naWMgY2VudHJhbGl6ZWQgaW4gbXRkY29y
ZSB3aXRob3V0IHJlcXVpcmluZyBkcml2ZXIKPiBjaGFuZ2VzLgo+IAo+IExpbms6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC9lZjU3MzE4OC05ODE1LTRhNmItYmFkMS0zZDhmZjdjOWIxNmZA
aHVhd2VpY2xvdWQuY29tLyBbMV0KPiBTaWduZWQtb2ZmLWJ5OiBXYW5nIFpoYW9sb25nIDx3YW5n
emhhb2xvbmdAaHVhd2VpY2xvdWQuY29tPgo+IC0tLQo+IAo+IFYyOgo+IC0gQ2hlY2tzIG9sZCBz
dGF0ZSB3aGVuIF9ibG9ja19pc2JhZCBleGlzdHMgYW5kIGJhaWxzIG91dCBlYXJseSBpZiBhbHJl
YWR5IGJhZAo+IAo+ICAgZHJpdmVycy9tdGQvbXRkY29yZS5jIHwgMTEgKysrKysrKysrKy0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCgpSZXZp
ZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbXRkY29yZS5jIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gaW5k
ZXggNWJhOWE3NDFmNWFjLi4wOTZhM2M5NDY3MGYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQv
bXRkY29yZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gQEAgLTIzMzcsMTAgKzIz
MzcsMTEgQEAgaW50IG10ZF9ibG9ja19pc2JhZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90
IG9mcykKPiAgIEVYUE9SVF9TWU1CT0xfR1BMKG10ZF9ibG9ja19pc2JhZCk7Cj4gICAKPiAgIGlu
dCBtdGRfYmxvY2tfbWFya2JhZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IG9mcykKPiAg
IHsKPiAgIAlzdHJ1Y3QgbXRkX2luZm8gKm1hc3RlciA9IG10ZF9nZXRfbWFzdGVyKG10ZCk7Cj4g
Kwlsb2ZmX3QgbW9mZnM7Cj4gICAJaW50IHJldDsKPiAgIAo+ICAgCWlmICghbWFzdGVyLT5fYmxv
Y2tfbWFya2JhZCkKPiAgIAkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+ICAgCWlmIChvZnMgPCAwIHx8
IG9mcyA+PSBtdGQtPnNpemUpCj4gQEAgLTIzNDksMTEgKzIzNTAsMTkgQEAgaW50IG10ZF9ibG9j
a19tYXJrYmFkKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3Qgb2ZzKQo+ICAgCQlyZXR1cm4g
LUVST0ZTOwo+ICAgCj4gICAJaWYgKG10ZC0+ZmxhZ3MgJiBNVERfU0xDX09OX01MQ19FTVVMQVRJ
T04pCj4gICAJCW9mcyA9IChsb2ZmX3QpbXRkX2Rpdl9ieV9lYihvZnMsIG10ZCkgKiBtYXN0ZXIt
PmVyYXNlc2l6ZTsKPiAgIAo+IC0JcmV0ID0gbWFzdGVyLT5fYmxvY2tfbWFya2JhZChtYXN0ZXIs
IG10ZF9nZXRfbWFzdGVyX29mcyhtdGQsIG9mcykpOwo+ICsJbW9mZnMgPSBtdGRfZ2V0X21hc3Rl
cl9vZnMobXRkLCBvZnMpOwo+ICsKPiArCWlmIChtYXN0ZXItPl9ibG9ja19pc2JhZCkgewo+ICsJ
CXJldCA9IG1hc3Rlci0+X2Jsb2NrX2lzYmFkKG1hc3RlciwgbW9mZnMpOwo+ICsJCWlmIChyZXQg
PiAwKQo+ICsJCQlyZXR1cm4gMDsKPiArCX0KPiArCj4gKwlyZXQgPSBtYXN0ZXItPl9ibG9ja19t
YXJrYmFkKG1hc3RlciwgbW9mZnMpOwo+ICAgCWlmIChyZXQpCj4gICAJCXJldHVybiByZXQ7Cj4g
ICAKPiAgIAl3aGlsZSAobXRkLT5wYXJlbnQpIHsKPiAgIAkJbXRkLT5lY2Nfc3RhdHMuYmFkYmxv
Y2tzKys7Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
