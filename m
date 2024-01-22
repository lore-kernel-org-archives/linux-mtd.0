Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3AEC47DAF
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 09:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fAAPAQCNoznZCZU3pQQA4s8y10p8OdFL4lMMmYdQhA=; b=fJO56sSwJ9jVr0Chstcjgmeh/n
	DD1N+hQP4C37KsSOcuzQZIobry++ST/ISK2Uc5XjlvNnod7XTzCiE5zW9n0n1OErt2z8oUGhWfbpv
	gfPmEmRi6F/S6LVbw6JkzgZl7i8kCXQO8FH5IImegT9TmrKcqfEuiiRjih+Tir1KMNUdAIHpyovJw
	9BmHX+jag0/s70xLL2YQB204j0bkQRT5jZBEXb9LItSIbpayxltGcZfzBcv7Mv9J0Kp4xoy/x0Pao
	c2ur8vDfJxIyz4kUoLQQZ7cnUfYHM3VDPUS6BdOY+xXwATu42tPOaEUkOQjHNNAU0lszJdtPc4dn7
	vaJgi0lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRqaj-00BHh1-1n;
	Mon, 22 Jan 2024 09:27:41 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRqaf-00BHdu-05
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jan 2024 09:27:39 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TJPw21QKzz29kdp;
	Mon, 22 Jan 2024 17:25:38 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id A86281400FD;
	Mon, 22 Jan 2024 17:27:20 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 17:27:20 +0800
Subject: Re: [PATCH 03/15] ubifs: Convert ubifs_writepage to use a folio
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
References: <20240120230824.2619716-1-willy@infradead.org>
 <20240120230824.2619716-4-willy@infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <9902761c-c8d6-64d2-8a78-d99d4450996e@huawei.com>
Date: Mon, 22 Jan 2024 17:27:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240120230824.2619716-4-willy@infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_012737_434962_C1DE45DF 
X-CRM114-Status: GOOD (  21.53  )
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

1NogMjAyNC8xLzIxIDc6MDgsIE1hdHRoZXcgV2lsY294IChPcmFjbGUpINC0tcA6Cj4gV2Ugc3Rp
bGwgcGFzcyB0aGUgcGFnZSBkb3duIHRvIGRvX3dyaXRlcGFnZSgpLCBidXQgdWJpZnNfd3JpdGVw
YWdlKCkKPiBpdHNlbGYgaXMgbm93IGxhcmdlIGZvbGlvIHNhZmUuICBJdCBhbHNvIGNvbnRhaW5z
IGZhciBmZXdlciBoaWRkZW4gY2FsbHMKPiB0byBjb21wb3VuZF9oZWFkKCkuCj4gCj4gU2lnbmVk
LW9mZi1ieTogTWF0dGhldyBXaWxjb3ggKE9yYWNsZSkgPHdpbGx5QGluZnJhZGVhZC5vcmc+Cj4g
LS0tCj4gICBmcy91Ymlmcy9maWxlLmMgfCAzOSArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAyMiBkZWxl
dGlvbnMoLSkKPiAKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3
ZWkuY29tPgoKPiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvZmlsZS5jIGIvZnMvdWJpZnMvZmlsZS5j
Cj4gaW5kZXggMDA3YTczMDUyNTYxLi43ZDA5NjdkYWRlZDMgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJp
ZnMvZmlsZS5jCj4gKysrIGIvZnMvdWJpZnMvZmlsZS5jCj4gQEAgLTEwMDksMjEgKzEwMDksMTgg
QEAgc3RhdGljIGludCBkb193cml0ZXBhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UsIGludCBsZW4pCj4g
ICBzdGF0aWMgaW50IHViaWZzX3dyaXRlcGFnZShzdHJ1Y3QgZm9saW8gKmZvbGlvLCBzdHJ1Y3Qg
d3JpdGViYWNrX2NvbnRyb2wgKndiYywKPiAgIAkJdm9pZCAqZGF0YSkKPiAgIHsKPiAtCXN0cnVj
dCBwYWdlICpwYWdlID0gJmZvbGlvLT5wYWdlOwo+IC0Jc3RydWN0IGlub2RlICppbm9kZSA9IHBh
Z2UtPm1hcHBpbmctPmhvc3Q7Cj4gKwlzdHJ1Y3QgaW5vZGUgKmlub2RlID0gZm9saW8tPm1hcHBp
bmctPmhvc3Q7Cj4gICAJc3RydWN0IHViaWZzX2luZm8gKmMgPSBpbm9kZS0+aV9zYi0+c19mc19p
bmZvOwo+ICAgCXN0cnVjdCB1Ymlmc19pbm9kZSAqdWkgPSB1Ymlmc19pbm9kZShpbm9kZSk7Cj4g
ICAJbG9mZl90IGlfc2l6ZSA9ICBpX3NpemVfcmVhZChpbm9kZSksIHN5bmNlZF9pX3NpemU7Cj4g
LQlwZ29mZl90IGVuZF9pbmRleCA9IGlfc2l6ZSA+PiBQQUdFX1NISUZUOwo+IC0JaW50IGVyciwg
bGVuID0gaV9zaXplICYgKFBBR0VfU0laRSAtIDEpOwo+IC0Jdm9pZCAqa2FkZHI7Cj4gKwlpbnQg
ZXJyLCBsZW4gPSBmb2xpb19zaXplKGZvbGlvKTsKPiAgIAo+ICAgCWRiZ19nZW4oImlubyAlbHUs
IHBnICVsdSwgcGcgZmxhZ3MgJSNseCIsCj4gLQkJaW5vZGUtPmlfaW5vLCBwYWdlLT5pbmRleCwg
cGFnZS0+ZmxhZ3MpOwo+IC0JdWJpZnNfYXNzZXJ0KGMsIFBhZ2VQcml2YXRlKHBhZ2UpKTsKPiAr
CQlpbm9kZS0+aV9pbm8sIGZvbGlvLT5pbmRleCwgZm9saW8tPmZsYWdzKTsKPiArCXViaWZzX2Fz
c2VydChjLCBmb2xpby0+cHJpdmF0ZSAhPSBOVUxMKTsKPiAgIAo+IC0JLyogSXMgdGhlIHBhZ2Ug
ZnVsbHkgb3V0c2lkZSBAaV9zaXplPyAodHJ1bmNhdGUgaW4gcHJvZ3Jlc3MpICovCj4gLQlpZiAo
cGFnZS0+aW5kZXggPiBlbmRfaW5kZXggfHwgKHBhZ2UtPmluZGV4ID09IGVuZF9pbmRleCAmJiAh
bGVuKSkgewo+ICsJLyogSXMgdGhlIGZvbGlvIGZ1bGx5IG91dHNpZGUgQGlfc2l6ZT8gKHRydW5j
YXRlIGluIHByb2dyZXNzKSAqLwo+ICsJaWYgKGZvbGlvX3Bvcyhmb2xpbykgPj0gaV9zaXplKSB7
Cj4gICAJCWVyciA9IDA7Cj4gICAJCWdvdG8gb3V0X3VubG9jazsKPiAgIAl9Cj4gQEAgLTEwMzIs
OSArMTAyOSw5IEBAIHN0YXRpYyBpbnQgdWJpZnNfd3JpdGVwYWdlKHN0cnVjdCBmb2xpbyAqZm9s
aW8sIHN0cnVjdCB3cml0ZWJhY2tfY29udHJvbCAqd2JjLAo+ICAgCXN5bmNlZF9pX3NpemUgPSB1
aS0+c3luY2VkX2lfc2l6ZTsKPiAgIAlzcGluX3VubG9jaygmdWktPnVpX2xvY2spOwo+ICAgCj4g
LQkvKiBJcyB0aGUgcGFnZSBmdWxseSBpbnNpZGUgQGlfc2l6ZT8gKi8KPiAtCWlmIChwYWdlLT5p
bmRleCA8IGVuZF9pbmRleCkgewo+IC0JCWlmIChwYWdlLT5pbmRleCA+PSBzeW5jZWRfaV9zaXpl
ID4+IFBBR0VfU0hJRlQpIHsKPiArCS8qIElzIHRoZSBmb2xpbyBmdWxseSBpbnNpZGUgaV9zaXpl
PyAqLwo+ICsJaWYgKGZvbGlvX3Bvcyhmb2xpbykgKyBsZW4gPD0gaV9zaXplKSB7Cj4gKwkJaWYg
KGZvbGlvX3Bvcyhmb2xpbykgPj0gc3luY2VkX2lfc2l6ZSkgewo+ICAgCQkJZXJyID0gaW5vZGUt
Pmlfc2ItPnNfb3AtPndyaXRlX2lub2RlKGlub2RlLCBOVUxMKTsKPiAgIAkJCWlmIChlcnIpCj4g
ICAJCQkJZ290byBvdXRfcmVkaXJ0eTsKPiBAQCAtMTA0NywyMCArMTA0NCwxOCBAQCBzdGF0aWMg
aW50IHViaWZzX3dyaXRlcGFnZShzdHJ1Y3QgZm9saW8gKmZvbGlvLCBzdHJ1Y3Qgd3JpdGViYWNr
X2NvbnRyb2wgKndiYywKPiAgIAkJCSAqIHdpdGggdGhpcy4KPiAgIAkJCSAqLwo+ICAgCQl9Cj4g
LQkJcmV0dXJuIGRvX3dyaXRlcGFnZShwYWdlLCBQQUdFX1NJWkUpOwo+ICsJCXJldHVybiBkb193
cml0ZXBhZ2UoJmZvbGlvLT5wYWdlLCBsZW4pOwo+ICAgCX0KPiAgIAo+ICAgCS8qCj4gLQkgKiBU
aGUgcGFnZSBzdHJhZGRsZXMgQGlfc2l6ZS4gSXQgbXVzdCBiZSB6ZXJvZWQgb3V0IG9uIGVhY2gg
YW5kIGV2ZXJ5Cj4gKwkgKiBUaGUgZm9saW8gc3RyYWRkbGVzIEBpX3NpemUuIEl0IG11c3QgYmUg
emVyb2VkIG91dCBvbiBlYWNoIGFuZCBldmVyeQo+ICAgCSAqIHdyaXRlcGFnZSBpbnZvY2F0aW9u
IGJlY2F1c2UgaXQgbWF5IGJlIG1tYXBwZWQuICJBIGZpbGUgaXMgbWFwcGVkCj4gICAJICogaW4g
bXVsdGlwbGVzIG9mIHRoZSBwYWdlIHNpemUuIEZvciBhIGZpbGUgdGhhdCBpcyBub3QgYSBtdWx0
aXBsZSBvZgo+ICAgCSAqIHRoZSBwYWdlIHNpemUsIHRoZSByZW1haW5pbmcgbWVtb3J5IGlzIHpl
cm9lZCB3aGVuIG1hcHBlZCwgYW5kCj4gICAJICogd3JpdGVzIHRvIHRoYXQgcmVnaW9uIGFyZSBu
b3Qgd3JpdHRlbiBvdXQgdG8gdGhlIGZpbGUuIgo+ICAgCSAqLwo+IC0Ja2FkZHIgPSBrbWFwX2F0
b21pYyhwYWdlKTsKPiAtCW1lbXNldChrYWRkciArIGxlbiwgMCwgUEFHRV9TSVpFIC0gbGVuKTsK
PiAtCWZsdXNoX2RjYWNoZV9wYWdlKHBhZ2UpOwo+IC0Ja3VubWFwX2F0b21pYyhrYWRkcik7Cj4g
KwlsZW4gPSBpX3NpemUgLSBmb2xpb19wb3MoZm9saW8pOwo+ICsJZm9saW9femVyb19zZWdtZW50
KGZvbGlvLCBsZW4sIGZvbGlvX3NpemUoZm9saW8pKTsKPiAgIAo+ICAgCWlmIChpX3NpemUgPiBz
eW5jZWRfaV9zaXplKSB7Cj4gICAJCWVyciA9IGlub2RlLT5pX3NiLT5zX29wLT53cml0ZV9pbm9k
ZShpbm9kZSwgTlVMTCk7Cj4gQEAgLTEwNjgsMTYgKzEwNjMsMTYgQEAgc3RhdGljIGludCB1Ymlm
c193cml0ZXBhZ2Uoc3RydWN0IGZvbGlvICpmb2xpbywgc3RydWN0IHdyaXRlYmFja19jb250cm9s
ICp3YmMsCj4gICAJCQlnb3RvIG91dF9yZWRpcnR5Owo+ICAgCX0KPiAgIAo+IC0JcmV0dXJuIGRv
X3dyaXRlcGFnZShwYWdlLCBsZW4pOwo+ICsJcmV0dXJuIGRvX3dyaXRlcGFnZSgmZm9saW8tPnBh
Z2UsIGxlbik7Cj4gICBvdXRfcmVkaXJ0eToKPiAgIAkvKgo+IC0JICogcmVkaXJ0eV9wYWdlX2Zv
cl93cml0ZXBhZ2UoKSB3b24ndCBjYWxsIHViaWZzX2RpcnR5X2lub2RlKCkgYmVjYXVzZQo+ICsJ
ICogZm9saW9fcmVkaXJ0eV9mb3Jfd3JpdGVwYWdlKCkgd29uJ3QgY2FsbCB1Ymlmc19kaXJ0eV9p
bm9kZSgpIGJlY2F1c2UKPiAgIAkgKiBpdCBwYXNzZXMgSV9ESVJUWV9QQUdFUyBmbGFnIHdoaWxl
IGNhbGxpbmcgX19tYXJrX2lub2RlX2RpcnR5KCksIHNvCj4gICAJICogdGhlcmUgaXMgbm8gbmVl
ZCB0byBkbyBzcGFjZSBidWRnZXQgZm9yIGRpcnR5IGlub2RlLgo+ICAgCSAqLwo+IC0JcmVkaXJ0
eV9wYWdlX2Zvcl93cml0ZXBhZ2Uod2JjLCBwYWdlKTsKPiArCWZvbGlvX3JlZGlydHlfZm9yX3dy
aXRlcGFnZSh3YmMsIGZvbGlvKTsKPiAgIG91dF91bmxvY2s6Cj4gLQl1bmxvY2tfcGFnZShwYWdl
KTsKPiArCWZvbGlvX3VubG9jayhmb2xpbyk7Cj4gICAJcmV0dXJuIGVycjsKPiAgIH0KPiAgIAo+
IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
