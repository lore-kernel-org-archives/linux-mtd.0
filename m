Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A1CCA0FFE
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Sep 2025 13:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/bQq5LUy7EWtphFjahH3lWg+bPj4U65oRGxqWNwFO0=; b=tlwNSNzvE7X0oKfLo41It82OZK
	4hLbb0OfiqVMpGjrvDR0bSnDWsjVAPKtiWmniGJyHsh2V8aE8VEVp8h0axjOy1gJPsgbbRp1dB9ik
	VmnevSJPcc0G7bSmLnGwyl3NnRCpPVgt648+2YaxRFvqCt/hrIzHllyWv6luKRn5HBZTb5/FswotL
	2HHMN3kRlUFBs1gGlkDEmdztEpQ4ru8DMbJ+9M/RjwMVv5pJtyLSKnP/zt25k+sS9HhshS8iQ2ZSh
	sFrXd9xMA4O6jYGKZlwBI7TWSrrLCQ89e4Ovv5szvcgqxiZakrL+boB6FPNi5dJy58yBYze2cIauV
	Vcs9ZdqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQk5-0000000HWiS-07Dy;
	Tue, 02 Sep 2025 13:08:09 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPNz-0000000GxwG-2w9c
	for linux-mtd@lists.infradead.org;
	Tue, 02 Sep 2025 11:41:17 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4cGP2K5XLHz14MVs;
	Tue,  2 Sep 2025 19:40:57 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 6C6B4180490;
	Tue,  2 Sep 2025 19:41:07 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 2 Sep 2025 19:41:06 +0800
Subject: Re: [PATCH V2] mtd: core: skip badblocks increment for blocks already
 known bad
To: Wang Zhaolong <wangzhaolong@huaweicloud.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>, <yangerkun@huawei.com>
References: <20250902092732.2244544-1-wangzhaolong@huaweicloud.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <95bf5e07-7f03-efb0-da9b-cb50999c2524@huawei.com>
Date: Tue, 2 Sep 2025 19:41:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250902092732.2244544-1-wangzhaolong@huaweicloud.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_044115_904772_CAE40CE6 
X-CRM114-Status: GOOD (  20.27  )
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
IDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+
IGluZGV4IDViYTlhNzQxZjVhYy4uMDk2YTNjOTQ2NzBmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
bXRkL210ZGNvcmUuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+IEBAIC0yMzM3LDEw
ICsyMzM3LDExIEBAIGludCBtdGRfYmxvY2tfaXNiYWQoc3RydWN0IG10ZF9pbmZvICptdGQsIGxv
ZmZfdCBvZnMpCj4gICBFWFBPUlRfU1lNQk9MX0dQTChtdGRfYmxvY2tfaXNiYWQpOwo+ICAgCj4g
ICBpbnQgbXRkX2Jsb2NrX21hcmtiYWQoc3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCBvZnMp
Cj4gICB7Cj4gICAJc3RydWN0IG10ZF9pbmZvICptYXN0ZXIgPSBtdGRfZ2V0X21hc3RlcihtdGQp
Owo+ICsJbG9mZl90IG1vZmZzOwo+ICAgCWludCByZXQ7Cj4gICAKPiAgIAlpZiAoIW1hc3Rlci0+
X2Jsb2NrX21hcmtiYWQpCj4gICAJCXJldHVybiAtRU9QTk9UU1VQUDsKPiAgIAlpZiAob2ZzIDwg
MCB8fCBvZnMgPj0gbXRkLT5zaXplKQo+IEBAIC0yMzQ5LDExICsyMzUwLDE5IEBAIGludCBtdGRf
YmxvY2tfbWFya2JhZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IG9mcykKPiAgIAkJcmV0
dXJuIC1FUk9GUzsKPiAgIAo+ICAgCWlmIChtdGQtPmZsYWdzICYgTVREX1NMQ19PTl9NTENfRU1V
TEFUSU9OKQo+ICAgCQlvZnMgPSAobG9mZl90KW10ZF9kaXZfYnlfZWIob2ZzLCBtdGQpICogbWFz
dGVyLT5lcmFzZXNpemU7Cj4gICAKPiAtCXJldCA9IG1hc3Rlci0+X2Jsb2NrX21hcmtiYWQobWFz
dGVyLCBtdGRfZ2V0X21hc3Rlcl9vZnMobXRkLCBvZnMpKTsKPiArCW1vZmZzID0gbXRkX2dldF9t
YXN0ZXJfb2ZzKG10ZCwgb2ZzKTsKPiArCj4gKwlpZiAobWFzdGVyLT5fYmxvY2tfaXNiYWQpIHsK
PiArCQlyZXQgPSBtYXN0ZXItPl9ibG9ja19pc2JhZChtYXN0ZXIsIG1vZmZzKTsKPiArCQlpZiAo
cmV0ID4gMCkKPiArCQkJcmV0dXJuIDA7CgpIaSwgTWlxdaiobC4KSGVyZSwgc2hvdWxkIHdlIGtl
ZXAgdGhlIHNhbWUgbG9naWMgd2l0aCB0aGUgbG93ZXIgbGV2ZWwoZWcuIApuYW5kX2Jsb2NrX21h
cmtiYWQsIG9uZW5hbmRfYmxvY2tfbWFya2JhZCkgd2hlbiAncmV0IDwgMCcgaXMgcmV0dXJuZWQg
YnkgCm1hc3Rlci0+X2Jsb2NrX2lzYmFkLiBNYW55IHNwZWNpZmljIG5hbmQgZHJpdmVycyhtYXJr
YmFkKSByZXR1cm4gdGhlIApuZWdhdGl2ZSBjb2RlIHdoZW4gJ2lzYmFkJyBmYWlscy4KCj4gKwl9
Cj4gKwo+ICsJcmV0ID0gbWFzdGVyLT5fYmxvY2tfbWFya2JhZChtYXN0ZXIsIG1vZmZzKTsKPiAg
IAlpZiAocmV0KQo+ICAgCQlyZXR1cm4gcmV0Owo+ICAgCj4gICAJd2hpbGUgKG10ZC0+cGFyZW50
KSB7Cj4gICAJCW10ZC0+ZWNjX3N0YXRzLmJhZGJsb2NrcysrOwo+IAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
