Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA5EC77B7A
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 14:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFuBMcBz+5nr4qwQ7QLjeIdP4iLX6b2f1BJmDO6ODdM=; b=neai2efix6VD4f3DGSVHen46So
	UvtkZurMh0gshUv1TA8g34BVIgrOACo0NHxxyCFvEIwOk1cT1qzmVN14+2sIo4ZVpSiLqhRNzQMNE
	z7f2h4gExC0pyb0CT2zEUhNnuD7n9wL/bNSi8j5vsHovKqSOYsUwhN9kqtI8oHHpt9c4pCSS5hxmC
	bSaSXA1xmMsrO7v02OdzjJCbC6sS7080cmUa3lifkKLp6u4eToZer+xFsoOe6WldnbwDYTbGz2Xmd
	gwIw7YznfzUfpv40FveFgSNlob/zVIhUzzgfHSTokpDs6lZ647z7NIt3x2eRZneQxkQ4VatP4h0VW
	t+w/DTxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6uSu-006IMX-0i;
	Wed, 07 Jun 2023 14:48:48 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6uSq-006IKj-1V
	for linux-mtd@lists.infradead.org;
	Wed, 07 Jun 2023 14:48:46 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Qbqpc0lNrzqSNF;
	Wed,  7 Jun 2023 22:43:36 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 22:48:24 +0800
Subject: Re: [PATCH 2/4] ubifs: Convert ubifs_writepage to use a folio
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20230605165029.2908304-1-willy@infradead.org>
 <20230605165029.2908304-3-willy@infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <d5286cf4-6d86-db9e-13e9-0d0bb1229493@huawei.com>
Date: Wed, 7 Jun 2023 22:48:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230605165029.2908304-3-willy@infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_074844_943981_615D1D15 
X-CRM114-Status: GOOD (  22.59  )
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

1NogMjAyMy82LzYgMDo1MCwgTWF0dGhldyBXaWxjb3ggKE9yYWNsZSkg0LS1wDoKPiBXZSBzdGls
bCBwYXNzIHRoZSBwYWdlIGRvd24gdG8gZG9fd3JpdGVwYWdlKCksIGJ1dCB1Ymlmc193cml0ZXBh
Z2UoKQo+IGl0c2VsZiBpcyBub3cgbGFyZ2UgZm9saW8gc2FmZS4gIEl0IGFsc28gY29udGFpbnMg
ZmFyIGZld2VyIGhpZGRlbiBjYWxscwo+IHRvIGNvbXBvdW5kX2hlYWQoKS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBNYXR0aGV3IFdpbGNveCAoT3JhY2xlKSA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KPiAt
LS0KPiAgIGZzL3ViaWZzL2ZpbGUuYyB8IDM5ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDIyIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9maWxlLmMgYi9mcy91Ymlmcy9maWxl
LmMKPiBpbmRleCA4YmI0Y2I5ZDUyOGYuLjFjN2E5OWMzNjkwNiAxMDA2NDQKPiAtLS0gYS9mcy91
Ymlmcy9maWxlLmMKPiArKysgYi9mcy91Ymlmcy9maWxlLmMKPiBAQCAtMTAwNiwyMSArMTAwNiwx
OCBAQCBzdGF0aWMgaW50IGRvX3dyaXRlcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSwgaW50IGxlbikK
PiAgIHN0YXRpYyBpbnQgdWJpZnNfd3JpdGVwYWdlKHN0cnVjdCBmb2xpbyAqZm9saW8sIHN0cnVj
dCB3cml0ZWJhY2tfY29udHJvbCAqd2JjLAo+ICAgCQl2b2lkICpkYXRhKQo+ICAgewo+IC0Jc3Ry
dWN0IHBhZ2UgKnBhZ2UgPSAmZm9saW8tPnBhZ2U7Cj4gLQlzdHJ1Y3QgaW5vZGUgKmlub2RlID0g
cGFnZS0+bWFwcGluZy0+aG9zdDsKPiArCXN0cnVjdCBpbm9kZSAqaW5vZGUgPSBmb2xpby0+bWFw
cGluZy0+aG9zdDsKPiAgIAlzdHJ1Y3QgdWJpZnNfaW5mbyAqYyA9IGlub2RlLT5pX3NiLT5zX2Zz
X2luZm87Cj4gICAJc3RydWN0IHViaWZzX2lub2RlICp1aSA9IHViaWZzX2lub2RlKGlub2RlKTsK
PiAgIAlsb2ZmX3QgaV9zaXplID0gIGlfc2l6ZV9yZWFkKGlub2RlKSwgc3luY2VkX2lfc2l6ZTsK
PiAtCXBnb2ZmX3QgZW5kX2luZGV4ID0gaV9zaXplID4+IFBBR0VfU0hJRlQ7Cj4gLQlpbnQgZXJy
LCBsZW4gPSBpX3NpemUgJiAoUEFHRV9TSVpFIC0gMSk7Cj4gLQl2b2lkICprYWRkcjsKPiArCWlu
dCBlcnIsIGxlbiA9IGZvbGlvX3NpemUoZm9saW8pOwo+ICAgCj4gICAJZGJnX2dlbigiaW5vICVs
dSwgcGcgJWx1LCBwZyBmbGFncyAlI2x4IiwKPiAtCQlpbm9kZS0+aV9pbm8sIHBhZ2UtPmluZGV4
LCBwYWdlLT5mbGFncyk7Cj4gLQl1Ymlmc19hc3NlcnQoYywgUGFnZVByaXZhdGUocGFnZSkpOwo+
ICsJCWlub2RlLT5pX2lubywgZm9saW8tPmluZGV4LCBmb2xpby0+ZmxhZ3MpOwo+ICsJdWJpZnNf
YXNzZXJ0KGMsIGZvbGlvLT5wcml2YXRlICE9IE5VTEwpOwo+ICAgCj4gLQkvKiBJcyB0aGUgcGFn
ZSBmdWxseSBvdXRzaWRlIEBpX3NpemU/ICh0cnVuY2F0ZSBpbiBwcm9ncmVzcykgKi8KPiAtCWlm
IChwYWdlLT5pbmRleCA+IGVuZF9pbmRleCB8fCAocGFnZS0+aW5kZXggPT0gZW5kX2luZGV4ICYm
ICFsZW4pKSB7Cj4gKwkvKiBJcyB0aGUgZm9saW8gZnVsbHkgb3V0c2lkZSBAaV9zaXplPyAodHJ1
bmNhdGUgaW4gcHJvZ3Jlc3MpICovCj4gKwlpZiAoZm9saW9fcG9zKGZvbGlvKSA+PSBpX3NpemUp
IHsKPiAgIAkJZXJyID0gMDsKPiAgIAkJZ290byBvdXRfdW5sb2NrOwo+ICAgCX0KPiBAQCAtMTAy
OSw5ICsxMDI2LDkgQEAgc3RhdGljIGludCB1Ymlmc193cml0ZXBhZ2Uoc3RydWN0IGZvbGlvICpm
b2xpbywgc3RydWN0IHdyaXRlYmFja19jb250cm9sICp3YmMsCj4gICAJc3luY2VkX2lfc2l6ZSA9
IHVpLT5zeW5jZWRfaV9zaXplOwo+ICAgCXNwaW5fdW5sb2NrKCZ1aS0+dWlfbG9jayk7Cj4gICAK
PiAtCS8qIElzIHRoZSBwYWdlIGZ1bGx5IGluc2lkZSBAaV9zaXplPyAqLwo+IC0JaWYgKHBhZ2Ut
PmluZGV4IDwgZW5kX2luZGV4KSB7Cj4gLQkJaWYgKHBhZ2UtPmluZGV4ID49IHN5bmNlZF9pX3Np
emUgPj4gUEFHRV9TSElGVCkgewo+ICsJLyogSXMgdGhlIGZvbGlvIGZ1bGx5IGluc2lkZSBpX3Np
emU/ICovCj4gKwlpZiAoZm9saW9fcG9zKGZvbGlvKSArIGxlbiA8IGlfc2l6ZSkgewoKaWYgKGZv
bGlvX3Bvcyhmb2xpbykgKyBsZW4gPD0gaV9zaXplKSA/Cgo+ICsJCWlmIChmb2xpb19wb3MoZm9s
aW8pID49IHN5bmNlZF9pX3NpemUpIHsKPiAgIAkJCWVyciA9IGlub2RlLT5pX3NiLT5zX29wLT53
cml0ZV9pbm9kZShpbm9kZSwgTlVMTCk7Cj4gICAJCQlpZiAoZXJyKQo+ICAgCQkJCWdvdG8gb3V0
X3JlZGlydHk7Cj4gQEAgLTEwNDQsMjAgKzEwNDEsMTggQEAgc3RhdGljIGludCB1Ymlmc193cml0
ZXBhZ2Uoc3RydWN0IGZvbGlvICpmb2xpbywgc3RydWN0IHdyaXRlYmFja19jb250cm9sICp3YmMs
Cj4gICAJCQkgKiB3aXRoIHRoaXMuCj4gICAJCQkgKi8KPiAgIAkJfQo+IC0JCXJldHVybiBkb193
cml0ZXBhZ2UocGFnZSwgUEFHRV9TSVpFKTsKPiArCQlyZXR1cm4gZG9fd3JpdGVwYWdlKCZmb2xp
by0+cGFnZSwgbGVuKTsKPiAgIAl9Cj4gICAKPiAgIAkvKgo+IC0JICogVGhlIHBhZ2Ugc3RyYWRk
bGVzIEBpX3NpemUuIEl0IG11c3QgYmUgemVyb2VkIG91dCBvbiBlYWNoIGFuZCBldmVyeQo+ICsJ
ICogVGhlIGZvbGlvIHN0cmFkZGxlcyBAaV9zaXplLiBJdCBtdXN0IGJlIHplcm9lZCBvdXQgb24g
ZWFjaCBhbmQgZXZlcnkKPiAgIAkgKiB3cml0ZXBhZ2UgaW52b2NhdGlvbiBiZWNhdXNlIGl0IG1h
eSBiZSBtbWFwcGVkLiAiQSBmaWxlIGlzIG1hcHBlZAo+ICAgCSAqIGluIG11bHRpcGxlcyBvZiB0
aGUgcGFnZSBzaXplLiBGb3IgYSBmaWxlIHRoYXQgaXMgbm90IGEgbXVsdGlwbGUgb2YKPiAgIAkg
KiB0aGUgcGFnZSBzaXplLCB0aGUgcmVtYWluaW5nIG1lbW9yeSBpcyB6ZXJvZWQgd2hlbiBtYXBw
ZWQsIGFuZAo+ICAgCSAqIHdyaXRlcyB0byB0aGF0IHJlZ2lvbiBhcmUgbm90IHdyaXR0ZW4gb3V0
IHRvIHRoZSBmaWxlLiIKPiAgIAkgKi8KPiAtCWthZGRyID0ga21hcF9hdG9taWMocGFnZSk7Cj4g
LQltZW1zZXQoa2FkZHIgKyBsZW4sIDAsIFBBR0VfU0laRSAtIGxlbik7Cj4gLQlmbHVzaF9kY2Fj
aGVfcGFnZShwYWdlKTsKPiAtCWt1bm1hcF9hdG9taWMoa2FkZHIpOwo+ICsJZm9saW9femVyb19z
ZWdtZW50KGZvbGlvLCBvZmZzZXRfaW5fZm9saW8oZm9saW8sIGlfc2l6ZSksIGxlbik7Cj4gKwls
ZW4gPSBvZmZzZXRfaW5fZm9saW8oZm9saW8sIGlfc2l6ZSk7Cj4gICAKPiAgIAlpZiAoaV9zaXpl
ID4gc3luY2VkX2lfc2l6ZSkgewo+ICAgCQllcnIgPSBpbm9kZS0+aV9zYi0+c19vcC0+d3JpdGVf
aW5vZGUoaW5vZGUsIE5VTEwpOwo+IEBAIC0xMDY1LDE2ICsxMDYwLDE2IEBAIHN0YXRpYyBpbnQg
dWJpZnNfd3JpdGVwYWdlKHN0cnVjdCBmb2xpbyAqZm9saW8sIHN0cnVjdCB3cml0ZWJhY2tfY29u
dHJvbCAqd2JjLAo+ICAgCQkJZ290byBvdXRfcmVkaXJ0eTsKPiAgIAl9Cj4gICAKPiAtCXJldHVy
biBkb193cml0ZXBhZ2UocGFnZSwgbGVuKTsKPiArCXJldHVybiBkb193cml0ZXBhZ2UoJmZvbGlv
LT5wYWdlLCBsZW4pOwo+ICAgb3V0X3JlZGlydHk6Cj4gICAJLyoKPiAtCSAqIHJlZGlydHlfcGFn
ZV9mb3Jfd3JpdGVwYWdlKCkgd29uJ3QgY2FsbCB1Ymlmc19kaXJ0eV9pbm9kZSgpIGJlY2F1c2UK
PiArCSAqIGZvbGlvX3JlZGlydHlfZm9yX3dyaXRlcGFnZSgpIHdvbid0IGNhbGwgdWJpZnNfZGly
dHlfaW5vZGUoKSBiZWNhdXNlCj4gICAJICogaXQgcGFzc2VzIElfRElSVFlfUEFHRVMgZmxhZyB3
aGlsZSBjYWxsaW5nIF9fbWFya19pbm9kZV9kaXJ0eSgpLCBzbwo+ICAgCSAqIHRoZXJlIGlzIG5v
IG5lZWQgdG8gZG8gc3BhY2UgYnVkZ2V0IGZvciBkaXJ0eSBpbm9kZS4KPiAgIAkgKi8KPiAtCXJl
ZGlydHlfcGFnZV9mb3Jfd3JpdGVwYWdlKHdiYywgcGFnZSk7Cj4gKwlmb2xpb19yZWRpcnR5X2Zv
cl93cml0ZXBhZ2Uod2JjLCBmb2xpbyk7Cj4gICBvdXRfdW5sb2NrOgo+IC0JdW5sb2NrX3BhZ2Uo
cGFnZSk7Cj4gKwlmb2xpb191bmxvY2soZm9saW8pOwo+ICAgCXJldHVybiBlcnI7Cj4gICB9Cj4g
ICAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
