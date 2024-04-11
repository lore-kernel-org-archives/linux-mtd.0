Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0B0CD11C2
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2024 01:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zDCKRkMXgqjVlVFTFiCgVxwxjv8n6y4JariyK6xI7qE=; b=j7GBOxtpQ68pK5p3Nlsjslj5sX
	Dyu6NxRyTbnfPOg6SuWVAlPquPRE5cDHJxv8V/dkRIFB/YoXOl1nJzfv7Nr9k7Go0RgZ1U332217r
	+EuXJtBfQFSHCst5gjjN0h2KO74HdwAiXw6e+cT6IKX7PIHbKYpyrNmXFAAkIML6+e/rNKNWvgLrS
	/eXRMKzM5Hra540XkccWGgwSVhFiLl8fJGn4W+nQ63FWHMs0y+VVcpT6LDjzzgVvaxcBIs0u1djmq
	dHJcaFKswh29w0jVbG9PiFZirHqFqejJJmZzuoqf4eVY9Q87cGZ6EgzlW4gNLJ55NEod98TiCaNV4
	6zd1lGVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rujLt-00000009rMv-0FEK;
	Thu, 11 Apr 2024 01:35:45 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rujLp-00000009rLz-2UjK
	for linux-mtd@lists.infradead.org;
	Thu, 11 Apr 2024 01:35:43 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VFMdH6rLrzwRyQ;
	Thu, 11 Apr 2024 09:32:35 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 1B6DD140136;
	Thu, 11 Apr 2024 09:35:32 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 09:35:31 +0800
Subject: Re: [PATCH 2/2] mtd: ubi: Ignore all debugfs initialisation failures
To: Ben Hutchings <ben.hutchings@mind.be>, <linux-mtd@lists.infradead.org>
References: <cover.1712788087.git.ben.hutchings@mind.be>
 <ca32bed9956a00d1617ae801ca440ed02fe39570.1712788087.git.ben.hutchings@mind.be>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <ae13a644-2b59-1a38-e9b6-71d91884e6a0@huawei.com>
Date: Thu, 11 Apr 2024 09:35:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ca32bed9956a00d1617ae801ca440ed02fe39570.1712788087.git.ben.hutchings@mind.be>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_183542_257141_A7FB655E 
X-CRM114-Status: GOOD (  21.23  )
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

1NogMjAyNC80LzExIDY6NDIsIEJlbiBIdXRjaGluZ3Mg0LS1wDoKPiBEcml2ZXJzIHNob3VsZCBu
ZXZlciBzdG9wIGluaXRpYWxpc2luZyBvciBwcm9iaW5nIGJlY2F1c2Ugb2YgYSBmYWlsdXJlCj4g
dG8gY3JlYXRlIGRlYnVnZnMgZW50cmllcy4gIFN1Y2ggZmFpbHVyZXMgYXJlIGhhcm1sZXNzIGFu
ZCBjb3VsZCBiZQo+IHRoZSBpbnRlbmRlZCByZXN1bHQgb2Ygc2V0dGluZyB0aGUga2VybmVsIHBh
cmFtZXRlciBkZWJ1Z2ZzPW9mZi4KPiAKPiBUaGlzIHdhcyBwYXJ0aWFsbHkgZml4ZWQgaW4gMjAx
OSwgYnV0IHNvbWUgZXJyb3IgY2hlY2tzIHdlcmUgbWlzc2VkCj4gYW5kIGFub3RoZXIgb25lIHdh
cyBiZWVuIGFkZGVkIHNpbmNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlbiBIdXRjaGluZ3MgPGJl
bi5odXRjaGluZ3NAbWluZC5iZT4KPiBGaXhlczogMmE3MzRiYjhkNTAyICgiVUJJOiB1c2UgZGVi
dWdmcyBmb3IgdGhlIGV4dHJhIGNoZWNrcyBrbm9icyIpCj4gRml4ZXM6IGMyZDczYmE4OTJlYSAo
Im10ZDogbm8gbmVlZCB0byBjaGVjayByZXR1cm4gdmFsdWUgb2YgLi4uIikKPiBGaXhlczogNjkz
MWZiNDQ4NThjICgidWJpOiBVc2UgdGhlIGZhdWx0IGluamVjdGlvbiBmcmFtZXdvcmsgdG8gZW5o
YW5jZSAuLi4iKQo+IC0tLQo+ICAgZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMgfCAxMCArKy0tLS0t
LS0tCj4gICBkcml2ZXJzL210ZC91YmkvZGVidWcuYyB8IDMzICsrKysrKystLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+ICAgZHJpdmVycy9tdGQvdWJpL2RlYnVnLmggfCAgNCArKy0tCj4gICAz
IGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC91YmkvYnVpbGQuYyBiL2RyaXZlcnMvbXRkL3ViaS9idWls
ZC5jCj4gaW5kZXggNTBkNzg5NzViM2VkLi5jMDdhNDc1NGI1MjEgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9tdGQvdWJpL2J1aWxkLmMKPiArKysgYi9kcml2ZXJzL210ZC91YmkvYnVpbGQuYwo+IEBA
IC0xMDE4LDkgKzEwMTgsNyBAQCBpbnQgdWJpX2F0dGFjaF9tdGRfZGV2KHN0cnVjdCBtdGRfaW5m
byAqbXRkLCBpbnQgdWJpX251bSwKPiAgIAlpZiAoZXJyKQo+ICAgCQlnb3RvIG91dF9kZXRhY2g7
Cj4gICAKPiAtCWVyciA9IHViaV9kZWJ1Z2ZzX2luaXRfZGV2KHViaSk7Cj4gLQlpZiAoZXJyKQo+
IC0JCWdvdG8gb3V0X3VpZjsKPiArCXViaV9kZWJ1Z2ZzX2luaXRfZGV2KHViaSk7Cj4gICAKPiAg
IAl1YmktPmJndF90aHJlYWQgPSBrdGhyZWFkX2NyZWF0ZSh1YmlfdGhyZWFkLCB1YmksICIlcyIs
IHViaS0+Ymd0X25hbWUpOwo+ICAgCWlmIChJU19FUlIodWJpLT5iZ3RfdGhyZWFkKSkgewo+IEBA
IC0xMDY0LDcgKzEwNjIsNiBAQCBpbnQgdWJpX2F0dGFjaF9tdGRfZGV2KHN0cnVjdCBtdGRfaW5m
byAqbXRkLCBpbnQgdWJpX251bSwKPiAgIAo+ICAgb3V0X2RlYnVnZnM6Cj4gICAJdWJpX2RlYnVn
ZnNfZXhpdF9kZXYodWJpKTsKPiAtb3V0X3VpZjoKPiAgIAl1aWZfY2xvc2UodWJpKTsKPiAgIG91
dF9kZXRhY2g6Cj4gICAJdWJpX3dsX2Nsb3NlKHViaSk7Cj4gQEAgLTEzNjIsOSArMTM1OSw3IEBA
IHN0YXRpYyBpbnQgX19pbml0IHViaV9pbml0KHZvaWQpCj4gICAJCWdvdG8gb3V0X2Rldl91bnJl
ZzsKPiAgIAl9Cj4gICAKPiAtCWVyciA9IHViaV9kZWJ1Z2ZzX2luaXQoKTsKPiAtCWlmIChlcnIp
Cj4gLQkJZ290byBvdXRfc2xhYjsKPiArCXViaV9kZWJ1Z2ZzX2luaXQoKTsKPiAgIAo+ICAgCWVy
ciA9IHViaWJsb2NrX2luaXQoKTsKPiAgIAlpZiAoZXJyKSB7Cj4gQEAgLTEzOTAsNyArMTM4NSw2
IEBAIHN0YXRpYyBpbnQgX19pbml0IHViaV9pbml0KHZvaWQpCj4gICAJdWJpYmxvY2tfZXhpdCgp
Owo+ICAgb3V0X2RlYnVnZnM6Cj4gICAJdWJpX2RlYnVnZnNfZXhpdCgpOwo+IC1vdXRfc2xhYjoK
PiAgIAlrbWVtX2NhY2hlX2Rlc3Ryb3kodWJpX3dsX2VudHJ5X3NsYWIpOwo+ICAgb3V0X2Rldl91
bnJlZzoKPiAgIAltaXNjX2RlcmVnaXN0ZXIoJnViaV9jdHJsX2NkZXYpOwo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC91YmkvZGVidWcuYyBiL2RyaXZlcnMvbXRkL3ViaS9kZWJ1Zy5jCj4gaW5k
ZXggZDU3ZjUyYmQyZmYzLi41MDViYzA3ZDdkYmIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQv
dWJpL2RlYnVnLmMKPiArKysgYi9kcml2ZXJzL210ZC91YmkvZGVidWcuYwo+IEBAIC0yNDgsMTMg
KzI0OCw2IEBAIHN0YXRpYyB2b2lkIGRmc19jcmVhdGVfZmF1bHRfZW50cnkoc3RydWN0IGRlbnRy
eSAqcGFyZW50KQo+ICAgCXN0cnVjdCBkZW50cnkgKmRpcjsKPiAgIAo+ICAgCWRpciA9IGRlYnVn
ZnNfY3JlYXRlX2RpcigiZmF1bHRfaW5qZWN0IiwgcGFyZW50KTsKPiAtCWlmIChJU19FUlJfT1Jf
TlVMTChkaXIpKSB7Cj4gLQkJaW50IGVyciA9IGRpciA/IFBUUl9FUlIoZGlyKSA6IC1FTk9ERVY7
Cj4gLQo+IC0JCXByX3dhcm4oIlVCSSBlcnJvcjogY2Fubm90IGNyZWF0ZSBcImZhdWx0X2luamVj
dFwiIGRlYnVnZnMgZGlyZWN0b3J5LCBlcnJvciAlZFxuIiwKPiAtCQkJIGVycik7Cj4gLQkJcmV0
dXJuOwo+IC0JfQoKSSB0aGluayB3ZSBjYW4ga2VlcCB0aGlzIGVycm9yIHBhdGgsIHN1YiBkaXJz
IHdvbid0IGJlIGNyZWF0ZWQgYnkgCmZvbGxvd2luZyBmdW5jdGlvbnMgaWYgZGlyIGlzIGFzc2ln
bmVkIGFzIGVycm9yIGNvZGUuIHNvIHViaSBjb3VsZCAKcmV0dXJuIGluIGFkdmFuY2UgYW5kIHBy
aW50cyBhIHdhcm5pbmcgbWVzc2FnZSB0byBub3RpZnkgdXNlciB0aGF0IGZhdWx0IAppbmplY3Rp
b24gZGVidWdmcyBpbml0aWFsaXphdGlvbiBpcyBmYWlsZWQuCj4gICAKPiAgIAlmYXVsdF9jcmVh
dGVfZGVidWdmc19hdHRyKCJlbXVsYXRlX2VjY2VyciIsIGRpciwKPiAgIAkJCQkgICZmYXVsdF9l
Y2NlcnJfYXR0cik7Cj4gQEAgLTI5MSwyOCArMjg0LDE4IEBAIHN0YXRpYyB2b2lkIGRmc19jcmVh
dGVfZmF1bHRfZW50cnkoc3RydWN0IGRlbnRyeSAqcGFyZW50KQo+ICAgLyoqCj4gICAgKiB1Ymlf
ZGVidWdmc19pbml0IC0gY3JlYXRlIFVCSSBkZWJ1Z2ZzIGRpcmVjdG9yeS4KPiAgICAqCj4gLSAq
IENyZWF0ZSBVQkkgZGVidWdmcyBkaXJlY3RvcnkuIFJldHVybnMgemVybyBpbiBjYXNlIG9mIHN1
Y2Nlc3MgYW5kIGEgbmVnYXRpdmUKPiAtICogZXJyb3IgY29kZSBpbiBjYXNlIG9mIGZhaWx1cmUu
Cj4gKyAqIFRyeSB0byBjcmVhdGUgVUJJIGRlYnVnZnMgZGlyZWN0b3J5Lgo+ICAgICovCj4gLWlu
dCB1YmlfZGVidWdmc19pbml0KHZvaWQpCj4gK3ZvaWQgdWJpX2RlYnVnZnNfaW5pdCh2b2lkKQo+
ICAgewo+ICAgCWlmICghSVNfRU5BQkxFRChDT05GSUdfREVCVUdfRlMpKQo+IC0JCXJldHVybiAw
Owo+ICsJCXJldHVybjsKPiAgIAo+ICAgCWRmc19yb290ZGlyID0gZGVidWdmc19jcmVhdGVfZGly
KCJ1YmkiLCBOVUxMKTsKPiAtCWlmIChJU19FUlJfT1JfTlVMTChkZnNfcm9vdGRpcikpIHsKPiAt
CQlpbnQgZXJyID0gZGZzX3Jvb3RkaXIgPyBQVFJfRVJSKGRmc19yb290ZGlyKSA6IC1FTk9ERVY7
Cj4gLQo+IC0JCXByX2VycigiVUJJIGVycm9yOiBjYW5ub3QgY3JlYXRlIFwidWJpXCIgZGVidWdm
cyBkaXJlY3RvcnksIGVycm9yICVkXG4iLAo+IC0JCSAgICAgICBlcnIpOwo+IC0JCXJldHVybiBl
cnI7Cj4gLQl9CgpTaW1pbGFyIHRvIHByZXZpb3VzLCBhbHNvIHJlcGxhY2UgJ3ByX2Vycicgd2l0
aCAncHJfd2FybicuCj4gICAKPiAgICNpZmRlZiBDT05GSUdfTVREX1VCSV9GQVVMVF9JTkpFQ1RJ
T04KPiAgIAlkZnNfY3JlYXRlX2ZhdWx0X2VudHJ5KGRmc19yb290ZGlyKTsKPiAgICNlbmRpZgo+
IC0KPiAtCXJldHVybiAwOwo+ICAgfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
