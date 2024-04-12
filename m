Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2EDC001CC
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2024 01:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHpbyM3IwZusFLED6UXB2rwnC9gcAOqgxuAfekOl7jQ=; b=gi7qJZn+QJrAyPKawtXgfvoAIB
	By2I7w9jHltMWLMVRMnY4lad09UzyNp6OAKUCZ0bwfMGRN45pvk8orvW17LmE/5VphG5kSpkmdali
	PQ/kkpJ6rGCfDtvxOaCF4wlziX+sgy50LSZ8C5gkV7Li2jm1cbWWeVSqU8HKwLWKV+7IrhUnZllsr
	7K81RbbZGY1gaQ67mKT89ft75AlXTWufliGmUpg//LeQ7YY8HqanF822IrYyAdbce5RjKO/wZrF5y
	A+zp4g3p6M26jhYzTD4y5mHtSLIXLchPs8EBD8xT73MYB8LmenSKqGVqXmzti7EAL3EQ1IfnCGf6z
	XL3JHVAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv5ax-0000000Ejm6-3M8W;
	Fri, 12 Apr 2024 01:20:48 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv5as-0000000EjjX-3zug
	for linux-mtd@lists.infradead.org;
	Fri, 12 Apr 2024 01:20:45 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VFzFh2xg9ztScQ;
	Fri, 12 Apr 2024 09:17:44 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id E58151400C8;
	Fri, 12 Apr 2024 09:20:29 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 09:20:29 +0800
Subject: Re: [PATCH v2 2/4] ubi: ubi_init: Fix missed ubiblock cleanup in
 error handling path
To: Daniel Golle <daniel@makrotopia.org>
CC: <richard@nod.at>, <miquel.raynal@bootlin.com>, <ben.hutchings@mind.be>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240411031903.3050278-1-chengzhihao1@huawei.com>
 <20240411031903.3050278-3-chengzhihao1@huawei.com>
 <ZhgGPE_5urw2izAA@makrotopia.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <fb1de5ee-46d3-7148-7b59-a5d736e00f1c@huawei.com>
Date: Fri, 12 Apr 2024 09:20:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ZhgGPE_5urw2izAA@makrotopia.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_182043_267338_4C4313FA 
X-CRM114-Status: GOOD (  19.00  )
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

1NogMjAyNC80LzExIDIzOjQ4LCBEYW5pZWwgR29sbGUg0LS1wDoKPiBPbiBUaHUsIEFwciAxMSwg
MjAyNCBhdCAxMToxOTowMUFNICswODAwLCBaaGloYW8gQ2hlbmcgd3JvdGU6Cj4+IFRoZSB1Ymli
bG9ja19pbml0IGNhbGxlZCBieSB1YmlfaW5pdCB3aWxsIHJlZ2lzdGVyIGRldmljZSBudW1iZXIs
IGJ1dAo+PiBkZXZpY2UgbnVtYmVyIGlzIG5vdCByZWxlYXNlZCBpbiBlcnJvciBoYW5kbGluZyBw
YXRoIG9mIHViaV9pbml0IHdoZW4KPj4gdWJpIGlzIGxvYWRlZCBieSBpbnNlcnRpbmcgbW9kdWxl
IChlZy4gYXR0YWNoaW5nIGZhaWx1cmUpLCB3aGljaCBsZWFkcwo+PiB0byBzdWJzZXF1ZW50IHVi
aV9pbml0IGNhbGxzIGZhaWxlZCBieSBydW5uaW5nIG91dCBvZiBkZXZpY2UgbnVtYmVyCj4+IChk
bWVzZyBzaG93cyB0aGF0ICJfX3JlZ2lzdGVyX2Jsa2RldjogZmFpbGVkIHRvIGdldCBtYWpvciBm
b3IgdWJpYmxvY2siKS4KPj4gU2luY2UgdWJpYmxvY2tfaW5pdCgpIHJlZ2lzdGVycyBub3RpZmll
ciBhbmQgaW52b2tlcyBub3RpZmljYXRpb24KPj4gZnVuY3Rpb25zLCBzbyB3ZSBjYW4gbW92ZSBp
dCBhZnRlciB1YmlfaW5pdF9hdHRhY2goKSB0byBmaXggdGhlIHByb2JsZW0uCj4+Cj4+IEZpeGVz
OiA5MjdjMTQ1MjA4YjAgKCJtdGQ6IHViaTogYXR0YWNoIGZyb20gZGV2aWNlIHRyZWUiKQo+PiBT
aWduZWQtb2ZmLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+PiAt
LS0KPj4gICBkcml2ZXJzL210ZC91YmkvYnVpbGQuYyB8IDUxICsrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMo
KyksIDI1IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvdWJpL2J1
aWxkLmMgYi9kcml2ZXJzL210ZC91YmkvYnVpbGQuYwo+PiBpbmRleCA3Zjk1ZmQ3OTY4YTguLmJj
NjNmYmY1ZTk0NyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKPj4gKysr
IGIvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKPj4gQEAgLTEyNjMsOSArMTI2MywyMSBAQCBzdGF0
aWMgc3RydWN0IG10ZF9ub3RpZmllciB1YmlfbXRkX25vdGlmaWVyID0gewo+PiAgIAkucmVtb3Zl
ID0gdWJpX25vdGlmeV9yZW1vdmUsCj4+ICAgfTsKPj4gICAKPj4gK3N0YXRpYyB2b2lkIGRldGFj
aF9tdGRfZGV2cyhpbnQgY291bnQpCj4gCj4gTWlzc2luZyBfX2luaXQgdG8gYXZvaWQgc2VjdGlv
biBtaXNzbWF0Y2guCj4gCj4gU2VlIGFsc286IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWti
dWlsZC1hbGwvMjAyNDA0MTEyMzI3LjE1OEhKZkF3LWxrcEBpbnRlbC5jb20vCgpJIHRoaW5rIGZ1
bmN0aW9uIHdpdGhvdXQgJ19faW5pdCcgYXR0cmlidXRlcyBjYW4gYmUgY2FsbGVkIGluIHViaV9p
bml0LCAKZm9yIGV4YW1wbGUgbWlzY19yZWdpc3Rlciwga21lbV9jYWNoZV9jcmVhdGUsIGFuZCBJ
IHZlcmlmeSBpdCBieSBtYWtlIApXPTEgaW4gbG9jYWwgbWFjaGluZS4gQW5kIGFib3ZlIHdhcm5p
bmcoaW4geW91ciBsaW5rKSBpcyBvbmx5IGRldGVjdGVkIAppbiBteSB2MSBzZXJpZXMuCkFmdGVy
IGludmVzdGlnYXRpbmcgdGhlICdfX2luaXQnIGFuZCAnX19leGl0JywgSSB1bmRlcnN0YW5kIHRo
YXQgdGhlcmUgCmFyZSB0d28gaW5kZXBlbmRlbnQgdGV4dCBzZWN0aW9uIGZvciB0aGVzZSBmdW5j
dGlvbnMsIGZvciBleGFtcGxlLCAKX19pbml0IHRleHQgc2VjdGlvbiB3aWxsIGJlIHJlbW92ZWQg
ZnJvbSBtZW1vcnkgYWZ0ZXIgaXQgaXMgZmluaXNoZWQsIHNvIAp3ZSBjYW5ub3QgY2FsbCBfX2V4
aXQgZnVuY3Rpb24gaW4gX19pbml0IGZ1bmN0aW9uLgo+IAo+PiArewo+PiArCWludCBpOwo+PiAr
Cj4+ICsJZm9yIChpID0gMDsgaSA8IGNvdW50OyBpKyspCj4+ICsJCWlmICh1YmlfZGV2aWNlc1tp
XSkgewo+PiArCQkJbXV0ZXhfbG9jaygmdWJpX2RldmljZXNfbXV0ZXgpOwo+PiArCQkJdWJpX2Rl
dGFjaF9tdGRfZGV2KHViaV9kZXZpY2VzW2ldLT51YmlfbnVtLCAxKTsKPj4gKwkJCW11dGV4X3Vu
bG9jaygmdWJpX2RldmljZXNfbXV0ZXgpOwo+PiArCQl9Cj4+ICt9CgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
