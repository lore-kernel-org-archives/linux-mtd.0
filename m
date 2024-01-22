Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11999C47DD3
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 11:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UFP374KK1s9WyKtExgxXl1RwSrsQrkEZsBWzGcYAEVs=; b=QFJYhbckrmL2MThSljAhKttlt1
	SICqoiDG1yQCQpc5DJwXzHYYFRVbx9/B//vRZI0LaaMXt2q/KTafxDDl7ArzMvAH4SNWKqClZJWay
	FUlxPOWviuZZJ/yFB+VYfEha7ZyDRVpHG26nds6wVD+M++MCEKphop1TfFJqg3YI/tAjQi7Cw/uG1
	4QUYRFzCLW9xQCSwsAtN5Bk2PkHHAS7oFGCHX231FMiXfrdxPs3WYXDtvsewL5N1uAhANxH8lecpG
	L73zjKzNlQ1a6mf9bO87mgDBVQQy6383JY964xKJSxHdiwBJa6h3yQawcj3cFvysboGfyIltr1aJj
	YNkq/b5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRsWg-00BmAz-1A;
	Mon, 22 Jan 2024 11:31:38 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRsWc-00Bm7R-09
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jan 2024 11:31:36 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4TJSh86979zNlPY;
	Mon, 22 Jan 2024 19:30:32 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 98234140499;
	Mon, 22 Jan 2024 19:31:23 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 19:31:22 +0800
Subject: Re: [PATCH 05/15] ubifs: Convert do_writepage() to take a folio
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
References: <20240120230824.2619716-1-willy@infradead.org>
 <20240120230824.2619716-6-willy@infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <5fdb5f71-999e-bd9b-9f85-ecd3ce81ff48@huawei.com>
Date: Mon, 22 Jan 2024 19:31:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240120230824.2619716-6-willy@infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_033134_453849_2D449AA5 
X-CRM114-Status: GOOD (  18.95  )
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

1NogMjAyNC8xLzIxIDc6MDgsIE1hdHRoZXcgV2lsY294IChPcmFjbGUpINC0tcA6Cj4gUmVwbGFj
ZSB0aGUgY2FsbCB0byBTZXRQYWdlRXJyb3IoKSB3aXRoIGEgY2FsbCB0byBtYXBwaW5nX3NldF9l
cnJvcigpLgo+IFN1cHBvcnQgbGFyZ2UgZm9saW9zIGJ5IHVzaW5nIGttYXBfbG9jYWxfZm9saW8o
KSBhbmQgcmVtYXBwaW5nIGVhY2ggdGltZQo+IHdlIGNyb3NzIGEgcGFnZSBib3VuZGFyeS4gIFNh
dmVzIGEgbG90IG9mIGhpZGRlbiBjYWxscyB0byBjb21wb3VuZF9oZWFkKCkuCj4gCj4gU2lnbmVk
LW9mZi1ieTogTWF0dGhldyBXaWxjb3ggKE9yYWNsZSkgPHdpbGx5QGluZnJhZGVhZC5vcmc+Cj4g
LS0tCj4gICBmcy91Ymlmcy9maWxlLmMgfCA1NiArKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygr
KSwgMjYgZGVsZXRpb25zKC0pCj4gCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3po
aWhhbzFAaHVhd2VpLmNvbT4KCj4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL2ZpbGUuYyBiL2ZzL3Vi
aWZzL2ZpbGUuYwo+IGluZGV4IGIyOTc1ODJjOWI3NS4uZTc1NWQwYTExMTQ2IDEwMDY0NAo+IC0t
LSBhL2ZzL3ViaWZzL2ZpbGUuYwo+ICsrKyBiL2ZzL3ViaWZzL2ZpbGUuYwo+IEBAIC05MDMsNjAg
KzkwMyw2NCBAQCBzdGF0aWMgaW50IHViaWZzX3JlYWRfZm9saW8oc3RydWN0IGZpbGUgKmZpbGUs
IHN0cnVjdCBmb2xpbyAqZm9saW8pCj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4gICAKPiAtc3RhdGlj
IGludCBkb193cml0ZXBhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UsIGludCBsZW4pCj4gK3N0YXRpYyBp
bnQgZG9fd3JpdGVwYWdlKHN0cnVjdCBmb2xpbyAqZm9saW8sIHNpemVfdCBsZW4pCj4gICB7Cj4g
LQlpbnQgZXJyID0gMCwgaSwgYmxlbjsKPiArCWludCBlcnIgPSAwLCBibGVuOwo+ICAgCXVuc2ln
bmVkIGludCBibG9jazsKPiAgIAl2b2lkICphZGRyOwo+ICsJc2l6ZV90IG9mZnNldCA9IDA7Cj4g
ICAJdW5pb24gdWJpZnNfa2V5IGtleTsKPiAtCXN0cnVjdCBpbm9kZSAqaW5vZGUgPSBwYWdlLT5t
YXBwaW5nLT5ob3N0Owo+ICsJc3RydWN0IGlub2RlICppbm9kZSA9IGZvbGlvLT5tYXBwaW5nLT5o
b3N0Owo+ICAgCXN0cnVjdCB1Ymlmc19pbmZvICpjID0gaW5vZGUtPmlfc2ItPnNfZnNfaW5mbzsK
PiAgIAo+ICAgI2lmZGVmIFVCSUZTX0RFQlVHCj4gICAJc3RydWN0IHViaWZzX2lub2RlICp1aSA9
IHViaWZzX2lub2RlKGlub2RlKTsKPiAgIAlzcGluX2xvY2soJnVpLT51aV9sb2NrKTsKPiAtCXVi
aWZzX2Fzc2VydChjLCBwYWdlLT5pbmRleCA8PSB1aS0+c3luY2VkX2lfc2l6ZSA+PiBQQUdFX1NI
SUZUKTsKPiArCXViaWZzX2Fzc2VydChjLCBmb2xpby0+aW5kZXggPD0gdWktPnN5bmNlZF9pX3Np
emUgPj4gUEFHRV9TSElGVCk7Cj4gICAJc3Bpbl91bmxvY2soJnVpLT51aV9sb2NrKTsKPiAgICNl
bmRpZgo+ICAgCj4gLQkvKiBVcGRhdGUgcmFkaXggdHJlZSB0YWdzICovCj4gLQlzZXRfcGFnZV93
cml0ZWJhY2socGFnZSk7Cj4gKwlmb2xpb19zdGFydF93cml0ZWJhY2soZm9saW8pOwo+ICAgCj4g
LQlhZGRyID0ga21hcChwYWdlKTsKPiAtCWJsb2NrID0gcGFnZS0+aW5kZXggPDwgVUJJRlNfQkxP
Q0tTX1BFUl9QQUdFX1NISUZUOwo+IC0JaSA9IDA7Cj4gLQl3aGlsZSAobGVuKSB7Cj4gLQkJYmxl
biA9IG1pbl90KGludCwgbGVuLCBVQklGU19CTE9DS19TSVpFKTsKPiArCWFkZHIgPSBrbWFwX2xv
Y2FsX2ZvbGlvKGZvbGlvLCBvZmZzZXQpOwo+ICsJYmxvY2sgPSBmb2xpby0+aW5kZXggPDwgVUJJ
RlNfQkxPQ0tTX1BFUl9QQUdFX1NISUZUOwo+ICsJZm9yICg7Oykgewo+ICsJCWJsZW4gPSBtaW5f
dChzaXplX3QsIGxlbiwgVUJJRlNfQkxPQ0tfU0laRSk7Cj4gICAJCWRhdGFfa2V5X2luaXQoYywg
JmtleSwgaW5vZGUtPmlfaW5vLCBibG9jayk7Cj4gICAJCWVyciA9IHViaWZzX2pubF93cml0ZV9k
YXRhKGMsIGlub2RlLCAma2V5LCBhZGRyLCBibGVuKTsKPiAgIAkJaWYgKGVycikKPiAgIAkJCWJy
ZWFrOwo+IC0JCWlmICgrK2kgPj0gVUJJRlNfQkxPQ0tTX1BFUl9QQUdFKQo+ICsJCWxlbiAtPSBi
bGVuOwo+ICsJCWlmICghbGVuKQo+ICAgCQkJYnJlYWs7Cj4gICAJCWJsb2NrICs9IDE7Cj4gICAJ
CWFkZHIgKz0gYmxlbjsKPiAtCQlsZW4gLT0gYmxlbjsKPiArCQlpZiAoZm9saW9fdGVzdF9oaWdo
bWVtKGZvbGlvKSAmJiAhb2Zmc2V0X2luX3BhZ2UoYWRkcikpIHsKPiArCQkJa3VubWFwX2xvY2Fs
KGFkZHIgLSBibGVuKTsKPiArCQkJb2Zmc2V0ICs9IFBBR0VfU0laRTsKPiArCQkJYWRkciA9IGtt
YXBfbG9jYWxfZm9saW8oZm9saW8sIG9mZnNldCk7Cj4gKwkJfQo+ICAgCX0KPiArCWt1bm1hcF9s
b2NhbChhZGRyKTsKPiAgIAlpZiAoZXJyKSB7Cj4gLQkJU2V0UGFnZUVycm9yKHBhZ2UpOwo+IC0J
CXViaWZzX2VycihjLCAiY2Fubm90IHdyaXRlIHBhZ2UgJWx1IG9mIGlub2RlICVsdSwgZXJyb3Ig
JWQiLAo+IC0JCQkgIHBhZ2UtPmluZGV4LCBpbm9kZS0+aV9pbm8sIGVycik7Cj4gKwkJbWFwcGlu
Z19zZXRfZXJyb3IoZm9saW8tPm1hcHBpbmcsIGVycik7Cj4gKwkJdWJpZnNfZXJyKGMsICJjYW5u
b3Qgd3JpdGUgZm9saW8gJWx1IG9mIGlub2RlICVsdSwgZXJyb3IgJWQiLAo+ICsJCQkgIGZvbGlv
LT5pbmRleCwgaW5vZGUtPmlfaW5vLCBlcnIpOwo+ICAgCQl1Ymlmc19yb19tb2RlKGMsIGVycik7
Cj4gICAJfQo+ICAgCj4gLQl1Ymlmc19hc3NlcnQoYywgUGFnZVByaXZhdGUocGFnZSkpOwo+IC0J
aWYgKFBhZ2VDaGVja2VkKHBhZ2UpKQo+ICsJdWJpZnNfYXNzZXJ0KGMsIGZvbGlvLT5wcml2YXRl
ICE9IE5VTEwpOwo+ICsJaWYgKGZvbGlvX3Rlc3RfY2hlY2tlZChmb2xpbykpCj4gICAJCXJlbGVh
c2VfbmV3X3BhZ2VfYnVkZ2V0KGMpOwo+ICAgCWVsc2UKPiAgIAkJcmVsZWFzZV9leGlzdGluZ19w
YWdlX2J1ZGdldChjKTsKPiAgIAo+ICAgCWF0b21pY19sb25nX2RlYygmYy0+ZGlydHlfcGdfY250
KTsKPiAtCWRldGFjaF9wYWdlX3ByaXZhdGUocGFnZSk7Cj4gLQlDbGVhclBhZ2VDaGVja2VkKHBh
Z2UpOwo+ICsJZm9saW9fZGV0YWNoX3ByaXZhdGUoZm9saW8pOwo+ICsJZm9saW9fY2xlYXJfY2hl
Y2tlZChmb2xpbyk7Cj4gICAKPiAtCWt1bm1hcChwYWdlKTsKPiAtCXVubG9ja19wYWdlKHBhZ2Up
Owo+IC0JZW5kX3BhZ2Vfd3JpdGViYWNrKHBhZ2UpOwo+ICsJZm9saW9fdW5sb2NrKGZvbGlvKTsK
PiArCWZvbGlvX2VuZF93cml0ZWJhY2soZm9saW8pOwo+ICAgCXJldHVybiBlcnI7Cj4gICB9Cj4g
ICAKPiBAQCAtMTA0NCw3ICsxMDQ4LDcgQEAgc3RhdGljIGludCB1Ymlmc193cml0ZXBhZ2Uoc3Ry
dWN0IGZvbGlvICpmb2xpbywgc3RydWN0IHdyaXRlYmFja19jb250cm9sICp3YmMsCj4gICAJCQkg
KiB3aXRoIHRoaXMuCj4gICAJCQkgKi8KPiAgIAkJfQo+IC0JCXJldHVybiBkb193cml0ZXBhZ2Uo
JmZvbGlvLT5wYWdlLCBsZW4pOwo+ICsJCXJldHVybiBkb193cml0ZXBhZ2UoZm9saW8sIGxlbik7
Cj4gICAJfQo+ICAgCj4gICAJLyoKPiBAQCAtMTA2Myw3ICsxMDY3LDcgQEAgc3RhdGljIGludCB1
Ymlmc193cml0ZXBhZ2Uoc3RydWN0IGZvbGlvICpmb2xpbywgc3RydWN0IHdyaXRlYmFja19jb250
cm9sICp3YmMsCj4gICAJCQlnb3RvIG91dF9yZWRpcnR5Owo+ICAgCX0KPiAgIAo+IC0JcmV0dXJu
IGRvX3dyaXRlcGFnZSgmZm9saW8tPnBhZ2UsIGxlbik7Cj4gKwlyZXR1cm4gZG9fd3JpdGVwYWdl
KGZvbGlvLCBsZW4pOwo+ICAgb3V0X3JlZGlydHk6Cj4gICAJLyoKPiAgIAkgKiBmb2xpb19yZWRp
cnR5X2Zvcl93cml0ZXBhZ2UoKSB3b24ndCBjYWxsIHViaWZzX2RpcnR5X2lub2RlKCkgYmVjYXVz
ZQo+IEBAIC0xMTc3LDcgKzExODEsNyBAQCBzdGF0aWMgaW50IGRvX3RydW5jYXRpb24oc3RydWN0
IHViaWZzX2luZm8gKmMsIHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4gICAJCQkJaWYgKFVCSUZTX0JM
T0NLU19QRVJfUEFHRV9TSElGVCkKPiAgIAkJCQkJb2Zmc2V0ID0gb2Zmc2V0X2luX2ZvbGlvKGZv
bGlvLAo+ICAgCQkJCQkJCW5ld19zaXplKTsKPiAtCQkJCWVyciA9IGRvX3dyaXRlcGFnZSgmZm9s
aW8tPnBhZ2UsIG9mZnNldCk7Cj4gKwkJCQllcnIgPSBkb193cml0ZXBhZ2UoZm9saW8sIG9mZnNl
dCk7Cj4gICAJCQkJZm9saW9fcHV0KGZvbGlvKTsKPiAgIAkJCQlpZiAoZXJyKQo+ICAgCQkJCQln
b3RvIG91dF9idWRnOwo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
