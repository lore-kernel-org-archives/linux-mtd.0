Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19D8C48BC3
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Feb 2024 01:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=orUBrr43vOITqvdZQtnMDS5nH8bXuydQlGMQ9XJOcvA=; b=u79OotVM7MRprATiulbRtz3Hvx
	z7e/QmFj/BRV2B8P+KUyfxk5Dz3AE6zWsQGTH8dXUMI5L0Zlkgrh6e5HjGDc5HAG+co7qYBg4Ok7/
	m3esMRVtlMZUX2WTeg+TZZdKDECnq73skQN7WI79k1wh8p0SkPS4HcGbNSfIhXgHpDRLtSXOwx4ya
	MUZ2RhqyIayvq8nP8PkezZ2BT1vO36HOyq43QHsldJ41hIfLPBp9hjwlUQx4m9dGawF3nJgYEaK6k
	Qurp238JYMrQoFxZZEsrln7zcSNy6C+WkP+9Kb2AWltFWqjw8Z7r6rCZJNekogsK4054ofbRu5lS4
	RLXx3T0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbVwa-00000006j6H-1X6I;
	Sun, 18 Feb 2024 01:26:12 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbVwW-00000006j4d-0XQo
	for linux-mtd@lists.infradead.org;
	Sun, 18 Feb 2024 01:26:10 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TcnyY2Fwxz1xnZm;
	Sun, 18 Feb 2024 09:24:37 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 4193D140157;
	Sun, 18 Feb 2024 09:25:56 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 18 Feb 2024 09:25:55 +0800
Subject: Re: [PATCH 1/2] ubifs: fix sort function prototype
To: Arnd Bergmann <arnd@kernel.org>, Richard Weinberger <richard@nod.at>,
	Nathan Chancellor <nathan@kernel.org>, Adrian Hunter
	<ext-adrian.hunter@nokia.com>, Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
CC: Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>
References: <20240213095412.453787-1-arnd@kernel.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <e9687d56-1ee4-37ee-4a0e-d0b7933f3353@huawei.com>
Date: Sun, 18 Feb 2024 09:25:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240213095412.453787-1-arnd@kernel.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_172608_523602_05A0D81A 
X-CRM114-Status: GOOD (  17.08  )
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

1NogMjAyNC8yLzEzIDE3OjU0LCBBcm5kIEJlcmdtYW5uINC0tcA6Cj4gRnJvbTogQXJuZCBCZXJn
bWFubiA8YXJuZEBhcm5kYi5kZT4KPiAKPiBUaGUgZ2xvYmFsIHNvcnQoKSBmdW5jdGlvbiBleHBl
Y3RzIGEgY2FsbGJhY2sgcG9pbnRlciB0byBhIGZ1bmN0aW9uIHdpdGggdHdvCj4gdm9pZCogYXJn
dW1lbnRzLCBidXQgdWJpZnMgaGFzIGEgZnVuY3Rpb24gd2l0aCBzcGVjaWZpYyBvYmplY3QgdHlw
ZXMsIHdoaWNoCj4gY2F1c2VzIGEgd2FybmluZyBpbiBjbGFuZy0xNiBhbmQgaGlnaGVyOgo+IAo+
IGZzL3ViaWZzL2xwcm9wcy5jOjEyNzI6OTogZXJyb3I6IGNhc3QgZnJvbSAnaW50ICgqKShzdHJ1
Y3QgdWJpZnNfaW5mbyAqLCBjb25zdCBzdHJ1Y3QgdWJpZnNfbHByb3BzICosIGludCwgc3RydWN0
IHViaWZzX2xwX3N0YXRzICopJyB0byAndWJpZnNfbHB0X3NjYW5fY2FsbGJhY2snIChha2EgJ2lu
dCAoKikoc3RydWN0IHViaWZzX2luZm8gKiwgY29uc3Qgc3RydWN0IHViaWZzX2xwcm9wcyAqLCBp
bnQsIHZvaWQgKiknKSBjb252ZXJ0cyB0byBpbmNvbXBhdGlibGUgZnVuY3Rpb24gdHlwZSBbLVdl
cnJvciwtV2Nhc3QtZnVuY3Rpb24tdHlwZS1zdHJpY3RdCj4gICAxMjcyIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKHViaWZzX2xwdF9zY2FuX2NhbGxiYWNrKXNjYW5fY2hl
Y2tfY2IsCj4gICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAKPiBDaGFuZ2UgdGhlIHByb3Rv
dHlwZSB0byB0aGUgcmVndWxhciBvbmUgYW5kIGNhc3QgdGhlIG9iamVjdCBwb2ludGVycwo+IGxv
Y2FsbHkgaW5zdGVhZC4KPiAKPiBGaXhlczogMWU1MTc2NGEzYzJhICgiVUJJRlM6IGFkZCBuZXcg
Zmxhc2ggZmlsZSBzeXN0ZW0iKQo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRA
YXJuZGIuZGU+Cj4gLS0tCj4gICBmcy91Ymlmcy9maW5kLmMgfCA5ICsrKystLS0tLQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5
OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IAo+IGRpZmYgLS1naXQg
YS9mcy91Ymlmcy9maW5kLmMgYi9mcy91Ymlmcy9maW5kLmMKPiBpbmRleCA4NzNlNmUxYzkyYjUu
LjFjYjc5YjE2N2E0ZiAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9maW5kLmMKPiArKysgYi9mcy91
Ymlmcy9maW5kLmMKPiBAQCAtNzI2LDExICs3MjYsMTAgQEAgaW50IHViaWZzX2ZpbmRfZnJlZV9s
ZWJfZm9yX2lkeChzdHJ1Y3QgdWJpZnNfaW5mbyAqYykKPiAgIAlyZXR1cm4gZXJyOwo+ICAgfQo+
ICAgCj4gLXN0YXRpYyBpbnQgY21wX2RpcnR5X2lkeChjb25zdCBzdHJ1Y3QgdWJpZnNfbHByb3Bz
ICoqYSwKPiAtCQkJIGNvbnN0IHN0cnVjdCB1Ymlmc19scHJvcHMgKipiKQo+ICtzdGF0aWMgaW50
IGNtcF9kaXJ0eV9pZHgoY29uc3Qgdm9pZCAqYSwgY29uc3Qgdm9pZCAqYikKPiAgIHsKPiAtCWNv
bnN0IHN0cnVjdCB1Ymlmc19scHJvcHMgKmxwYSA9ICphOwo+IC0JY29uc3Qgc3RydWN0IHViaWZz
X2xwcm9wcyAqbHBiID0gKmI7Cj4gKwljb25zdCBzdHJ1Y3QgdWJpZnNfbHByb3BzICpscGEgPSAq
KGNvbnN0IHN0cnVjdCB1Ymlmc19scHJvcHMgKiopYTsKPiArCWNvbnN0IHN0cnVjdCB1Ymlmc19s
cHJvcHMgKmxwYiA9ICooY29uc3Qgc3RydWN0IHViaWZzX2xwcm9wcyAqKiliOwo+ICAgCj4gICAJ
cmV0dXJuIGxwYS0+ZGlydHkgKyBscGEtPmZyZWUgLSBscGItPmRpcnR5IC0gbHBiLT5mcmVlOwo+
ICAgfQo+IEBAIC03NTQsNyArNzUzLDcgQEAgaW50IHViaWZzX3NhdmVfZGlydHlfaWR4X2xudW1z
KHN0cnVjdCB1Ymlmc19pbmZvICpjKQo+ICAgCSAgICAgICBzaXplb2Yodm9pZCAqKSAqIGMtPmRp
cnR5X2lkeC5jbnQpOwo+ICAgCS8qIFNvcnQgaXQgc28gdGhhdCB0aGUgZGlydGllc3QgaXMgbm93
IGF0IHRoZSBlbmQgKi8KPiAgIAlzb3J0KGMtPmRpcnR5X2lkeC5hcnIsIGMtPmRpcnR5X2lkeC5j
bnQsIHNpemVvZih2b2lkICopLAo+IC0JICAgICAoaW50ICgqKShjb25zdCB2b2lkICosIGNvbnN0
IHZvaWQgKikpY21wX2RpcnR5X2lkeCwgTlVMTCk7Cj4gKwkgICAgIGNtcF9kaXJ0eV9pZHgsIE5V
TEwpOwo+ICAgCWRiZ19maW5kKCJmb3VuZCAlZCBkaXJ0eSBpbmRleCBMRUJzIiwgYy0+ZGlydHlf
aWR4LmNudCk7Cj4gICAJaWYgKGMtPmRpcnR5X2lkeC5jbnQpCj4gICAJCWRiZ19maW5kKCJkaXJ0
aWVzdCBpbmRleCBMRUIgaXMgJWQgd2l0aCBkaXJ0eSAlZCBhbmQgZnJlZSAlZCIsCj4gCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
