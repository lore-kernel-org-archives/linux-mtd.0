Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1E9C3DA4A
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Aug 2024 13:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KoIaq478dvzQwd0XK+scGgwq0y8RGdayavZ3oeBDp54=; b=UuuotEb5Nu3JYk8xOjlbE5IW1a
	st78KQjEsNOC6IJxwYfMzBf+l4hrgnY7lcLrXlCu9UmGcKyPXwmQJOb/Zz70ylyG5MsgwWr7TTk/P
	tDE1glF1AUSPfZzrZgb6WkyAl99/mOXUzAhJaZ+lo66a+mFcN/78QIZ3m8mi73drVBn84OH0U+D/R
	h+CI7kFcn6iPCNTrGER3FjK81aPEPLFNUlKEe5HcQZGZcM26X3GgKSCTIgcULZSCXjlQ0uyg0qY05
	EHWsYhcQ0IkWuijpkiLOgnSqQF9Z+uth7ZXffsvRBK2ULfrXWpH7zrFX0E8/S351DcLljXxyfuzKM
	NEyfr1Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sewjf-0000000D0B8-3UoO;
	Fri, 16 Aug 2024 13:11:19 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sewjb-0000000D09b-3Dzu
	for linux-mtd@lists.infradead.org;
	Fri, 16 Aug 2024 13:11:18 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Wlj601F4Pz1T7MZ;
	Fri, 16 Aug 2024 21:10:32 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id A7E011400E3;
	Fri, 16 Aug 2024 21:11:04 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 21:11:03 +0800
Subject: Re: [PATCH 2/2] jffs2: Use a folio in jffs2_garbage_collect_dnode()
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, David Woodhouse
	<dwmw2@infradead.org>
CC: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
	<linux-fsdevel@vger.kernel.org>, Christian Brauner <brauner@kernel.org>
References: <20240814195915.249871-1-willy@infradead.org>
 <20240814195915.249871-3-willy@infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <61d4e3a3-20f7-0236-79b8-b6be135a0124@huawei.com>
Date: Fri, 16 Aug 2024 21:10:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240814195915.249871-3-willy@infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_061116_473746_99F7469D 
X-CRM114-Status: GOOD (  19.60  )
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

1NogMjAyNC84LzE1IDM6NTksIE1hdHRoZXcgV2lsY294IChPcmFjbGUpINC0tcA6Cj4gQ2FsbCBy
ZWFkX2NhY2hlX2ZvbGlvKCkgaW5zdGVhZCBvZiByZWFkX2NhY2hlX3BhZ2UoKSB0byBnZXQgdGhl
IGZvbGlvCj4gY29udGFpbmluZyB0aGUgcGFnZS4gIE5vIGF0dGVtcHQgaXMgbWFkZSBoZXJlIHRv
IHN1cHBvcnQgbGFyZ2UgZm9saW9zCj4gYXMgSSBhc3N1bWUgdGhhdCB3aWxsIG5ldmVyIGJlIGlu
dGVyZXN0aW5nIGZvciBqZmZzMi4gIEluY2x1ZGVzIGEgc3dpdGNoCj4gZnJvbSBrbWFwIHRvIGtt
YXBfbG9jYWwgd2hpY2ggbG9va3Mgc2FmZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IFdp
bGNveCAoT3JhY2xlKSA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KPiAtLS0KPiAgIGZzL2pmZnMyL2dj
LmMgfCAyNSArKysrKysrKysrKystLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMTIg
aW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5n
IDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiAKPiBkaWZmIC0tZ2l0IGEvZnMvamZmczIvZ2Mu
YyBiL2ZzL2pmZnMyL2djLmMKPiBpbmRleCA1YzY2MDJmM2MxODkuLjgyMjk0OWQwZWIwMCAxMDA2
NDQKPiAtLS0gYS9mcy9qZmZzMi9nYy5jCj4gKysrIGIvZnMvamZmczIvZ2MuYwo+IEBAIC0xMTcx
LDcgKzExNzEsNyBAQCBzdGF0aWMgaW50IGpmZnMyX2dhcmJhZ2VfY29sbGVjdF9kbm9kZShzdHJ1
Y3QgamZmczJfc2JfaW5mbyAqYywgc3RydWN0IGpmZnMyX2VyYQo+ICAgCXVpbnQzMl90IGFsbG9j
bGVuLCBvZmZzZXQsIG9yaWdfZW5kLCBvcmlnX3N0YXJ0Owo+ICAgCWludCByZXQgPSAwOwo+ICAg
CXVuc2lnbmVkIGNoYXIgKmNvbXByYnVmID0gTlVMTCwgKndyaXRlYnVmOwo+IC0Jc3RydWN0IHBh
Z2UgKnBhZ2U7Cj4gKwlzdHJ1Y3QgZm9saW8gKmZvbGlvOwo+ICAgCXVuc2lnbmVkIGNoYXIgKnBn
X3B0cjsKPiAgIAo+ICAgCW1lbXNldCgmcmksIDAsIHNpemVvZihyaSkpOwo+IEBAIC0xMzE3LDI1
ICsxMzE3LDI1IEBAIHN0YXRpYyBpbnQgamZmczJfZ2FyYmFnZV9jb2xsZWN0X2Rub2RlKHN0cnVj
dCBqZmZzMl9zYl9pbmZvICpjLCBzdHJ1Y3QgamZmczJfZXJhCj4gICAJCUJVR19PTihzdGFydCA+
IG9yaWdfc3RhcnQpOwo+ICAgCX0KPiAgIAo+IC0JLyogVGhlIHJ1bGVzIHN0YXRlIHRoYXQgd2Ug
bXVzdCBvYnRhaW4gdGhlIHBhZ2UgbG9jayAqYmVmb3JlKiBmLT5zZW0sIHNvCj4gKwkvKiBUaGUg
cnVsZXMgc3RhdGUgdGhhdCB3ZSBtdXN0IG9idGFpbiB0aGUgZm9saW8gbG9jayAqYmVmb3JlKiBm
LT5zZW0sIHNvCj4gICAJICogZHJvcCBmLT5zZW0gdGVtcG9yYXJpbHkuIFNpbmNlIHdlIGFsc28g
aG9sZCBjLT5hbGxvY19zZW0sIG5vdGhpbmcncwo+ICAgCSAqIGFjdHVhbGx5IGdvaW5nIHRvICpj
aGFuZ2UqIHNvIHdlJ3JlIHNhZmU7IHdlIG9ubHkgYWxsb3cgcmVhZGluZy4KPiAgIAkgKgo+ICAg
CSAqIEl0IGlzIGltcG9ydGFudCB0byBub3RlIHRoYXQgamZmczJfd3JpdGVfYmVnaW4oKSB3aWxs
IGVuc3VyZSB0aGF0IGl0cwo+IC0JICogcGFnZSBpcyBtYXJrZWQgVXB0b2RhdGUgYmVmb3JlIGFs
bG9jYXRpbmcgc3BhY2UuIFRoYXQgbWVhbnMgdGhhdCBpZiB3ZQo+IC0JICogZW5kIHVwIGhlcmUg
dHJ5aW5nIHRvIEdDIHRoZSAqc2FtZSogcGFnZSB0aGF0IGpmZnMyX3dyaXRlX2JlZ2luKCkgaXMK
PiAtCSAqIHRyeWluZyB0byB3cml0ZSBvdXQsIHJlYWRfY2FjaGVfcGFnZSgpIHdpbGwgbm90IGRl
YWRsb2NrLiAqLwo+ICsJICogZm9saW8gaXMgbWFya2VkIHVwdG9kYXRlIGJlZm9yZSBhbGxvY2F0
aW5nIHNwYWNlLiBUaGF0IG1lYW5zIHRoYXQgaWYgd2UKPiArCSAqIGVuZCB1cCBoZXJlIHRyeWlu
ZyB0byBHQyB0aGUgKnNhbWUqIGZvbGlvIHRoYXQgamZmczJfd3JpdGVfYmVnaW4oKSBpcwo+ICsJ
ICogdHJ5aW5nIHRvIHdyaXRlIG91dCwgcmVhZF9jYWNoZV9mb2xpbygpIHdpbGwgbm90IGRlYWRs
b2NrLiAqLwo+ICAgCW11dGV4X3VubG9jaygmZi0+c2VtKTsKPiAtCXBhZ2UgPSByZWFkX2NhY2hl
X3BhZ2UoaW5vZGUtPmlfbWFwcGluZywgc3RhcnQgPj4gUEFHRV9TSElGVCwKPiArCWZvbGlvID0g
cmVhZF9jYWNoZV9mb2xpbyhpbm9kZS0+aV9tYXBwaW5nLCBzdGFydCA+PiBQQUdFX1NISUZULAo+
ICAgCQkJICAgICAgIF9famZmczJfcmVhZF9mb2xpbywgTlVMTCk7Cj4gLQlpZiAoSVNfRVJSKHBh
Z2UpKSB7Cj4gLQkJcHJfd2FybigicmVhZF9jYWNoZV9wYWdlKCkgcmV0dXJuZWQgZXJyb3I6ICVs
ZFxuIiwKPiAtCQkJUFRSX0VSUihwYWdlKSk7Cj4gKwlpZiAoSVNfRVJSKGZvbGlvKSkgewo+ICsJ
CXByX3dhcm4oInJlYWRfY2FjaGVfZm9saW8oKSByZXR1cm5lZCBlcnJvcjogJWxkXG4iLAo+ICsJ
CQlQVFJfRVJSKGZvbGlvKSk7Cj4gICAJCW11dGV4X2xvY2soJmYtPnNlbSk7Cj4gLQkJcmV0dXJu
IFBUUl9FUlIocGFnZSk7Cj4gKwkJcmV0dXJuIFBUUl9FUlIoZm9saW8pOwo+ICAgCX0KPiAgIAo+
IC0JcGdfcHRyID0ga21hcChwYWdlKTsKPiArCXBnX3B0ciA9IGttYXBfbG9jYWxfZm9saW8oZm9s
aW8sIDApOwo+ICAgCW11dGV4X2xvY2soJmYtPnNlbSk7Cj4gICAKPiAgIAlvZmZzZXQgPSBzdGFy
dDsKPiBAQCAtMTQwMCw3ICsxNDAwLDYgQEAgc3RhdGljIGludCBqZmZzMl9nYXJiYWdlX2NvbGxl
Y3RfZG5vZGUoc3RydWN0IGpmZnMyX3NiX2luZm8gKmMsIHN0cnVjdCBqZmZzMl9lcmEKPiAgIAkJ
fQo+ICAgCX0KPiAgIAo+IC0Ja3VubWFwKHBhZ2UpOwo+IC0JcHV0X3BhZ2UocGFnZSk7Cj4gKwlm
b2xpb19yZWxlYXNlX2ttYXAoZm9saW8sIHBnX3B0cik7Cj4gICAJcmV0dXJuIHJldDsKPiAgIH0K
PiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
