Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12D4CF6495
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Sep 2024 01:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LpPbqkq79YQvbMkXjOe7IsTNmSdSEaEuGfFyAyvKC8=; b=kCaLmnvrC7OPykOMhKWR+HxJ2A
	xus+y3rSrAY/gWH4iSmo7hpfewJsyRVX6iqbOatxBQIrqatd2/MLTWe3iTDC4ZblxJjmz883cyZiX
	1BqhqCe7l9hJDGzLuC8LDAVHx/8y46DjY8iiNuVFbzZPO3NW/oE4E+N4UByoZdkYjtPl8P9eaA8LK
	V3za8H7HK/0NDiryQ0Q42+udjgvqyl78GkkQPoYZoBiqfdMX2anR0cxcjCM02Q4PYCOyKL0r7sEAQ
	8EBivrKYO67aZ7QqP6Td97KyUx/8IswkOQ8J++h4U6er5Y26+lYKFPhV41uILSt42ea7SHm5rbipo
	4hxb7rYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sujBW-0000000DwPN-2Pm8;
	Sun, 29 Sep 2024 01:57:18 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sujBS-0000000DwOp-1VCt
	for linux-mtd@lists.infradead.org;
	Sun, 29 Sep 2024 01:57:16 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XGS3Q6D9fzySYF;
	Sun, 29 Sep 2024 09:56:02 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id DEF4A18007C;
	Sun, 29 Sep 2024 09:57:07 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 29 Sep 2024 09:57:07 +0800
Subject: Re: [PATCH] ubifs: Convert ubifs to use the new mount API
To: Eric Sandeen <sandeen@redhat.com>, <linux-mtd@lists.infradead.org>
CC: <brauner@kernel.org>, David Howells <dhowells@redhat.com>, Richard
 Weinberger <richard@nod.at>
References: <20240926203604.23622-1-sandeen@redhat.com>
 <6081021a-be81-7877-8c1d-5311d9968124@huawei.com>
 <a2ff7d9b-799c-46e3-bd43-1b34bf8fdc66@redhat.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <1075eb6d-9de8-8dcb-cd26-b548e6477206@huawei.com>
Date: Sun, 29 Sep 2024 09:57:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a2ff7d9b-799c-46e3-bd43-1b34bf8fdc66@redhat.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_185714_941596_F9E83C96 
X-CRM114-Status: GOOD (  26.30  )
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

5ZyoIDIwMjQvOS8yNyAyMzo1NiwgRXJpYyBTYW5kZWVuIOWGmemBkzoKPiBPbiA5LzI3LzI0IDk6
MTIgQU0sIFpoaWhhbyBDaGVuZyB3cm90ZToKPj4g5ZyoIDIwMjQvOS8yNyA0OjM2LCBFcmljIFNh
bmRlZW4g5YaZ6YGTOgo+PiBIaSBFcmljLCB0d28gY29tbWVudHMgYmVsb3cuCj4+PiBGcm9tOiBE
YXZpZCBIb3dlbGxzIDxkaG93ZWxsc0ByZWRoYXQuY29tPgo+Pj4KPj4+IENvbnZlcnQgdGhlIHVi
aWZzIGZpbGVzeXN0ZW0gdG8gdGhlIG5ldyBpbnRlcm5hbCBtb3VudCBBUEkgYXMgdGhlIG9sZAo+
Pj4gb25lIHdpbGwgYmUgb2Jzb2xldGVkIGFuZCByZW1vdmVkLsKgIFRoaXMgYWxsb3dzIGdyZWF0
ZXIgZmxleGliaWxpdHkgaW4KPj4+IGNvbW11bmljYXRpb24gb2YgbW91bnQgcGFyYW1ldGVycyBi
ZXR3ZWVuIHVzZXJzcGFjZSwgdGhlIFZGUyBhbmQgdGhlCj4+PiBmaWxlc3lzdGVtLgo+Pj4KPj4+
IFNlZSBEb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL21vdW50X2FwaS50eHQgZm9yIG1vcmUgaW5m
b3JtYXRpb24uCj4+PgoKWy4uLl0KPj4KPj4gV2UgY2Fubm90IG92ZXJ3cml0ZSBvbGQgY29uZmln
dXJhdGlvbnMgd2l0aCBub24tZnVsbHkgaW5pdGlhbGl6ZWQgbmV3IGNvbmZpZ3VyYXRpb25zIGRp
cmVjdGx5LCBvdGhlcndpc2Ugc29tZSBvbGQgb3B0aW9ucyB3aWxsIGRpc2FwcGVhciwgZm9yIGV4
YW1wbGU6Cj4+IFtyb290QGxvY2FsaG9zdCB+XSMgbW91bnQgLW9jb21wcj1sem8gL2Rldi91Ymkw
XzAgdGVtcAo+PiBbcm9vdEBsb2NhbGhvc3Qgfl0jIG1vdW50IHwgZ3JlcCB1Ymlmcwo+PiAvZGV2
L3ViaTBfMCBvbiAvcm9vdC90ZW1wIHR5cGUgdWJpZnMgKHJ3LHJlbGF0aW1lLGNvbXByPWx6byxh
c3NlcnQ9cmVhZC1vbmx5LHViaT0wLHZvbD0wKQo+PiBUaGUgY29tcHJlc3NvciBpcyBzZXQgYXMg
bHpvLgo+PiBbcm9vdEBsb2NhbGhvc3Qgfl0jIG1vdW50IC1vcmVtb3VudCAvZGV2L3ViaTBfMCB0
ZW1wCj4+IFtyb290QGxvY2FsaG9zdCB+XSMgbW91bnQgfCBncmVwIHViaWZzCj4+IC9kZXYvdWJp
MF8wIG9uIC9yb290L3RlbXAgdHlwZSB1YmlmcyAocncscmVsYXRpbWUsYXNzZXJ0PXJlYWQtb25s
eSx1Ymk9MCx2b2w9MCkKPj4gVGhlIGNvbXByZXNzb3IgaXMgbm90IGx6byBhbnltb3JlLgo+IAo+
IEFoLCB5ZXMuIHJlY29uZmlndXJlIGlzIHN1cnByaXNpbmdseSB0cmlja3kgYXQgdGltZXMgZm9y
IHJlYXNvbnMgbGlrZSB0aGlzLgo+IAo+IElzIG1vdW50IGhlcmUgZnJvbSBidXN5Ym94IGJ5IGNo
YW5jZT8gSSB0aGluayB1c3VhbGx5IHV0aWwtbGludXggbW91bnQgcmVzcGVjaWZpZXMgZXZlcnkK
PiBleGlzdGluZyBtb3VudCBvcHRpb24gb24gcmVtb3VudCB3aGljaCB0ZW5kcyB0byBoaWRlIHRo
aXMgc29ydCBvZiB0aGluZzsgeW91IGNvdWxkCj4gZG91YmxlIGNoZWNrIHRoaXMgYnkgc3RyYWNp
bmcgZnNjb25maWcgY2FsbHMgZHVyaW5nIHJlbW91bnQuCgpJIHRoaW5rIHdlIHNob3VsZG4ndCBk
ZXBlbmQgb24gdGhlIHVzZXJzcGFjZSB1dGlscywgbGV0J3MganVzdCBjb25zaWRlciAKdGhlIHNl
bWFudGljcyBvZiByZW1vdW50aW5nIGZyb20gdGhlIHZpZXcgb2Ygc3lzY2FsbCwgYmVjYXVzZSBs
aW51eCB1c2VyIApjYW4gY2FsbCByZW1vdW50IGJ5IHN5c2NhbGwgZGlyZWN0bHkuCj4gCj4gVGhh
dCBzYWlkLCB3ZSBjYW4gcHJlc2VydmUgbW91bnQgb3B0aW9ucyBpbnRlcm5hbGx5IGFzIHdlbGwu
IERvZXMgdGhpcyBwYXRjaCBvbiB0b3AKPiBvZiB0aGUgZmlyc3Qgb25lIGZpeCBpdCBmb3IgeW91
Pwo+IAo+ICh0aGUgb3RoZXIgb3B0aW9uIHdvdWxkIGJlIHRvIG1ha2UgYW4gLT5mc19wcml2YXRl
IHN0cnVjdCB0aGF0IGhvbGRzIG9ubHkgbW91bnQKPiBvcHRpb25zLCByYXRoZXIgdGhhbiByZS11
c2luZyBzX2ZzX2luZm8gYXMgaXQgZG9lcyBub3cgLSBkaG93ZWxscywgYW55IHRob3VnaHRzPykK
PiAKPiBUaGFua3MgZm9yIHRoZSByZXZpZXcgYW5kIHRlc3RpbmchCj4gCj4gCj4gZGlmZiAtLWdp
dCBhL2ZzL3ViaWZzL3N1cGVyLmMgYi9mcy91Ymlmcy9zdXBlci5jCj4gaW5kZXggY2YyZTkxMDRi
YWZmLi5iZTgxNTQzNTk3NzIgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMvc3VwZXIuYwo+ICsrKyBi
L2ZzL3ViaWZzL3N1cGVyLmMKPiBAQCAtMjI1Niw0NCArMjI1Niw1NiBAQCBzdGF0aWMgaW50IHVi
aWZzX2luaXRfZnNfY29udGV4dChzdHJ1Y3QgZnNfY29udGV4dCAqZmMpCj4gICAJaWYgKCFjKQo+
ICAgCQlyZXR1cm4gLUVOT01FTTsKPiAgIApbLi4uXQo+ICsJCUlOSVRfTElTVF9IRUFEKCZjLT5v
cnBoX25ldyk7Cj4gKwkJYy0+bm9fY2hrX2RhdGFfY3JjID0gMTsKPiArCQljLT5hc3NlcnRfYWN0
aW9uID0gQVNTQUNUX1JPOwo+ICsJCWMtPmhpZ2hlc3RfaW51bSA9IFVCSUZTX0ZJUlNUX0lOTzsK
PiArCQljLT5saGVhZF9sbnVtID0gYy0+bHRhaWxfbG51bSA9IFVCSUZTX0xPR19MTlVNOwo+ICsJ
fSBlbHNlIHsKPiArCQlzdHJ1Y3QgdWJpZnNfaW5mbyAqY19vcmlnID0gZmMtPnJvb3QtPmRfc2It
PnNfZnNfaW5mbzsKPiArCj4gKwkJLyogUHJlc2VydmUgZXhpc3RpbmcgbW91bnQgb3B0aW9ucyBh
Y3Jvc3MgcmVtb3VudHMgKi8KPiArCQljLT5tb3VudF9vcHRzICAgICAgICAgICA9IGNfb3JpZy0+
bW91bnRfb3B0czsKPiArCQljLT5idWxrX3JlYWQgICAgICAgICAgICA9IGNfb3JpZy0+YnVsa19y
ZWFkOwo+ICsJCWMtPm5vX2Noa19kYXRhX2NyYyAgICAgID0gY19vcmlnLT5ub19jaGtfZGF0YV9j
cmM7Cj4gKwkJYy0+ZGVmYXVsdF9jb21wciAgICAgICAgPSBjX29yaWctPmRlZmF1bHRfY29tcHI7
Cj4gKwkJYy0+YXNzZXJ0X2FjdGlvbiAgICAgICAgPSBjX29yaWctPmFzc2VydF9hY3Rpb247Cj4g
Kwl9Cj4gICAKPiAgIAlmYy0+c19mc19pbmZvID0gYzsKPiAgIAlmYy0+b3BzID0gJnViaWZzX2Nv
bnRleHRfb3BzOwo+ICsKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiAgIAo+IAoKQWJvdmUgbW9kaWZp
Y2F0aW9uIGNhbiBmaXggdGhlIHByb2JsZW0sIGJ1dCBpdCBsb29rcyBub3Qgc28gY2xlYW4uClRo
ZXJlIGFyZSB0d28gbWFpbiBzdGVwcyBmb3IgbW91bnQvcmVtb3VudCBpbiB0aGUgbmV3IEFQSSBm
cmFtZXdvcms6CjEuIEdldCBmaWxlc3lzdGVtIGNvbmZpZ3VyYXRpb25zIGJ5IHBhcnNpbmcgdGhl
IHBhcmFtYXRlcnMgZnJvbSB0aGUgdXNlciAKZGF0YS4KMi4gQXBwbHkgdGhlIGZpbGVzeXN0ZW0g
Y29uZmlndXJhdGlvbnMgdG8gc3VwZXJibG9jayhGb3IgbW91bnQsIGEgCnN1cGVyYmxvY2sgc2hv
dWxkIGJlIGFsbG9jYXRlZCBmaXJzdC4pLgoKU28sIGhvdyBhYm91dCBkb2luZyB0aGF0IGxpa2Ug
ZXh0NCBkb2VzOgoxKSB0aGUgZmlsZXN5c3RlbSBzcGVjaWZpZWQgc3VwZXJibG9jayBpcyBhbGxv
Y2F0ZWQgaW4gZmlsbF9zdXBlcigpLCBub3QgCmluIGluaXRfZnNfY29udGV4dCgpLCBpdCBsb29r
cyBtb3JlIHJlYXNvbmFibGUsIGJlY2F1c2UgZmlsZXN5c3RlbSAKZG9lc24ndCBuZWVkIGEgbmV3
IHByaXZhdGUgc3VwZXJibG9jayBpbiByZW1vdW50aW5nIHByb2Nlc3MuIEJ1dCwgVUJJRlMgCmhh
cyBvbmV0aGluZyBkaWZmZXJlbnQsIHNiX3Rlc3QoKSBuZWVkcyB2b2x1bWUgaW5mb3JtYXRpb24g
d2hpY2ggY29tZXMgCmZyb20gcHJpdmF0ZSBzdXBlcmJsb2NrLCBzbyBVQkZJUyBwcml2YXRlIHN1
cGVyYmxvY2soc3RydWN0IHViaWZzX2luZm8pIAppcyBhbGxvY2F0ZWQgaW4gdWJpZnNfbW91bnQo
KS4gSGVyZSwgSSBwcmVmZXIgdG8ga2VlcCBwcml2YXRlIHN1cGVyYmxvY2sgCmFsbG9jYXRpb24g
c3RpbGwgaW4gdWJpZnNfbW91bnQoZm9yIG5ldyBtb3VudCBBUEksIGl0IGlzIGNhbGxlZCAKdWJp
ZnNfZ2V0X3RyZWUpLgoyKSB0aGUgZmlsZXN5c3RlbSBjb25maWd1cmF0aW9ucyhjb250YWlucyBt
b3VudCBvcHRpb25zKSBhcmUgc3RvcmVkIGluIGEgCnNlcGFyYXRlZCBzdHJ1Y3R1cmUoaW4gZXh0
NCwgaXQgaXMgY2FsbGVkIGV4dDRfZnNfY29udGV4dCksIHdoaWNoIGlzIAphbGxvY2F0ZWQgaW4g
aW5pdF9mc19jb250ZXh0KCkuIEZvciBVQklGUywgd2UgY2FuIGRlZmluZSBhIHNpbWlsYXIgCnN0
cnVjdHVyZSB0byBzdG9yZSB0aGUgZmlsZXN5c3RlbSBjb25maWd1cmF0aW9ucy4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
