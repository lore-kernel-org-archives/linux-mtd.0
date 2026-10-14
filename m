Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B877ECC6B19
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 06:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNACws/O2H+LuIpO/v8DEEbnAQF3prNh93/tXrLrsGs=; b=wj93vfMaf4LFHuLbj8EKC8kKDu
	H8PkVS8CmHUvz2U69fm5kpcahDqj/+udQy0u+6z0EoE6RPnqOwdhPm32YwSBysYrTAHEUi7aeVnYk
	05I2R9i+FUx6CMGQXrxYFUJJb3OEPo9DNwxisnGfb8KQM0mbAUpL/iboOggXeA+Ei45UOkinOfnGL
	YBRSNWJajp2xjfs6he/NSXdBjWg4g/bnCO0bNnytDiMj3GTbBqNPLzNIuujFx2y0CtILUNMB7LawH
	G84rAR6GEQWoMtBRVM5teUt6RGkJjdG2UhLS1pVfeM6dWZIIYkOPpCJzirDkldX0ARWbLH+DqY0gX
	lBW5bZBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsnQ-0000000Eeou-1cvl;
	Wed, 14 Oct 2026 06:49:04 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsnL-0000000EenF-2yRp
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 06:49:03 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=P62B/G2yUQzIczTqNN38f1tFI+QwgusdaQGIcmFGMoM=;
	b=fQVk/6u/wYAdyWPC9GaxaA2hnizBClV4wZYkjScwWXMsVzmOQUH/+q5PItdAjp0AB+7DtxyRq
	S2repipLV0OUt8ZFdStor9Xhn2uvArrPU5Lc7IjrPF3skWjLiM0prYxE5vD9Zwmf/8qhNXjnHYI
	T/2qip4jBgibvL727tR2qjw=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4j4M183NXMzLlSh;
	Wed, 14 Oct 2026 14:36:28 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id C27FA4048B;
	Wed, 14 Oct 2026 14:48:46 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 14 Oct 2026 14:48:45 +0800
Subject: Re: [PATCH 1/2] ubifs: tnc_delete: Don't free zero-branch znodes if
 memory allocation fails
To: <sashiko-reviews@lists.linux.dev>, <richard@nod.at>,
	<ext-adrian.hunter@nokia.com>
CC: <linux-mtd@lists.infradead.org>, <yangerkun@huawei.com>,
	<yi.zhang@huawei.com>
References: <20261014060252.3531356-1-chengzhihao1@huawei.com>
 <20261014060252.3531356-2-chengzhihao1@huawei.com>
 <sashiko-outbox-170861@kernel.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <e439faa2-8c43-e996-302b-11abee7e0e26@huawei.com>
Date: Wed, 14 Oct 2026 14:48:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <sashiko-outbox-170861@kernel.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_234901_812714_B8DAFF7B 
X-CRM114-Status: GOOD (  20.87  )
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

5ZyoIDIwMjYvMTAvMTQgMTQ6MjgsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcg5YaZ6YGTOgo+IFRo
YW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDEg
cG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOgo+IC0gW0hpZ2hdIHViaWZzOiBhc3NlcnRp
b24gZmFpbHVyZSBvbiBsb29rdXBzIGR1ZSB0byB6ZXJvLWNoaWxkIHpub2RlIGFmdGVyIHRuY19k
ZWxldGUoKSBlcnJvcgo+IC0tCj4gCj4gY29tbWl0IDVjMTg1NDQ4M2MyZDA2YjZmZDNmYzQ2Nzkx
YjQyMmZjZDk1ODk1NmYKPiBBdXRob3I6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdl
aS5jb20+Cj4gCj4gdWJpZnM6IHRuY19kZWxldGU6IERvbid0IGZyZWUgemVyby1icmFuY2ggem5v
ZGVzIGlmIG1lbW9yeSBhbGxvY2F0aW9uIGZhaWxzCj4gCj4gVGhpcyBjb21taXQgZGVsYXlzIHRo
ZSBmcmVlaW5nIG9mIHplcm8tYnJhbmNoIHpub2RlcyBpbiB0bmNfZGVsZXRlKCkKPiB1bnRpbCBh
ZnRlciBhbGwgaW5zZXJ0X29sZF9pZHhfem5vZGUoKSBjYWxscyBzdWNjZWVkLiBJdCBpbnRyb2R1
Y2VzIGEKPiBsb2NhbCBzdGFjayBsaXN0IHRvIHRyYWNrIHpub2RlcyB0byBiZSBmcmVlZCwgYWlt
aW5nIHRvIHByZXZlbnQgYQo+IHVzZS1hZnRlci1mcmVlIHJhY2UgY29uZGl0aW9uIHdoZW4gdHJh
dmVyc2luZyB0aGUgVE5DIHRyZWUuCj4gCj4+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy90bmMuYyBi
L2ZzL3ViaWZzL3RuYy5jCj4+IC0tLSBhL2ZzL3ViaWZzL3RuYy5jCj4+ICsrKyBiL2ZzL3ViaWZz
L3RuYy5jCj4gWyAuLi4gXQo+PiBAQCAtMjU0MiwxNSArMjU0MywyMCBAQCBzdGF0aWMgaW50IHRu
Y19kZWxldGUoc3RydWN0IHViaWZzX2luZm8gKmMsIHN0cnVjdCB1Ymlmc196bm9kZSAqem5vZGUs
IGludCBuKQo+PiAgIAkJYXRvbWljX2xvbmdfZGVjKCZjLT5kaXJ0eV96bl9jbnQpOwo+PiAgIAo+
PiAgIAkJZXJyID0gaW5zZXJ0X29sZF9pZHhfem5vZGUoYywgem5vZGUpOwo+PiAtCQlpZiAoZXJy
KQo+PiArCQlpZiAoZXJyKSB7Cj4+ICsJCQl6biA9IGZyZWVfaGVhZC5mbmV4dDsKPj4gKwkJCXdo
aWxlICh6bikgewo+PiArCQkJCXN0cnVjdCB1Ymlmc196bm9kZSAqbmV4dCA9IHpuLT5mbmV4dDsK
Pj4gKwo+PiArCQkJCXpuLT5mbmV4dCA9IE5VTEw7Cj4+ICsJCQkJem4gPSBuZXh0Owo+PiArCQkJ
fQo+PiAgIAkJCXJldHVybiBlcnI7Cj4gCj4gW1NldmVyaXR5OiBIaWdoXQo+IElmIGluc2VydF9v
bGRfaWR4X3pub2RlKCkgcmV0dXJucyBhbiBlcnJvciBsaWtlIC1FTk9NRU0sIGRvZXMgdGhpcyBl
YXJseQo+IHJldHVybiBsZWF2ZSB0aGUgemVyby1jaGlsZCB6bm9kZSBsaW5rZWQgaW4gdGhlIFRO
QyB0cmVlPwo+IAo+IEJlY2F1c2Ugd2UgcmV0dXJuIGJlZm9yZSByZW1vdmluZyB0aGUgem5vZGUg
ZnJvbSBpdHMgcGFyZW50J3MgemJyYW5jaCBhcnJheSwKPiB0aGUgdHJlZSByZXRhaW5zIGEgbm9k
ZSB3aXRoIGNoaWxkX2NudCA9PSAwLiBJZiBhIHN1YnNlcXVlbnQgcmVhZCBvcGVyYXRpb24KPiAo
d2hpY2ggaXMgcGVybWl0dGVkIGV2ZW4gYWZ0ZXIgdGhlIGZpbGVzeXN0ZW0gaXMgZm9yY2VkIHRv
IHJlYWQtb25seSBtb2RlKQo+IHRyYXZlcnNlcyB0aGlzIHpub2RlLCBpdCB3aWxsIGNhbGwgdWJp
ZnNfc2VhcmNoX3picmFuY2goKToKPiAKPiBmcy91Ymlmcy90bmNfbWlzYy5jOnViaWZzX3NlYXJj
aF96YnJhbmNoKCkgewo+ICAgICAgICAgIGludCBiZWcgPSAwLCBlbmQgPSB6bm9kZS0+Y2hpbGRf
Y250LCBtaWQ7Cj4gICAgICAgICAgaW50IGNtcDsKPiAgICAgICAgICBjb25zdCBzdHJ1Y3QgdWJp
ZnNfemJyYW5jaCAqemJyID0gJnpub2RlLT56YnJhbmNoWzBdOwo+IAo+ICAgICAgICAgIHViaWZz
X2Fzc2VydChjLCBlbmQgPiBiZWcpOwo+IC4uLgo+IH0KPiAKPiBXaXRoIGVuZCA9PSAwIGFuZCBi
ZWcgPT0gMCwgdGhpcyB3aWxsIHRyaWdnZXIgdGhlIGFzc2VydGlvbiBmYWlsdXJlLCB3aGljaAo+
IGNhbiBwYW5pYyB0aGUga2VybmVsIGlmIG1vdW50ZWQgd2l0aCBhc3NlcnQ9cGFuaWMuIERvZXMg
dGhpcyBlcnJvciBwYXRoIG5lZWQKPiB0byByZW1vdmUgdGhlIHpub2RlIGZyb20gaXRzIHBhcmVu
dCdzIHpicmFuY2gsIG9yIG90aGVyd2lzZSBtYXJrIGl0IHRvCj4gcHJldmVudCBsb29rdXBzIGZy
b20gdHJpcHBpbmcgdGhlIGFzc2VydGlvbj8KPiAKCkhpLCB0aGUgaW5zZXJ0X29sZF9pZHhfem5v
ZGUoKSBtYWtlcyB0bmNfZGVsZXRlIHJldHVybiBpbW1lZGlhdGVseSBldmVuIApsZXZlbDBfem5v
ZGUtPmNoaWxkX2NudCBiZWNvbWVzIHplcm8sIHdoaWNoIGNvdWxkIHRyaWdnZXIgZm9sbG93aW5n
IAphc3NlcnRpb24gZmFpbHVyZSBpbiB1Ymlmc19zZWFyY2hfemJyYW5jaCgpLCB0aGlzIGlzIGFu
IGFscmVhZHkgZXhpc3RlZCAKcHJvY2Vzcy4KVGhpcyBpc3N1ZSBpcyBub3Qgc2V2ZXJlIGJlY2F1
c2UgYWZ0ZXIgdGhlIGluc2VydF9vbGRfaWR4X3pub2RlIGVycm9yIApvY2N1cnMsIFVCSUZTIGhh
cyBhbHJlYWR5IHN3aXRjaGVkIHRvIHJlYWQtb25seSBtb2RlIGFuZCBpc3N1ZWQgYW4gCmFsYXJt
LiBTdWJzZXF1ZW50IHViaWZzX2Fzc2VydCBpcyBtZXJlbHkgcHJpbnRpbmcgbW9yZSBhbGFybXMs
IHVubGVzcyAKdGhlIG1vdW50IG9wdGlvbiB1c2VzIGFzc2VydD1wYW5pYy4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
