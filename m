Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A472C46CD2
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jan 2024 02:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RBX0g6Hz7QDLs/BcoL0bMZ9kAj7BX5Ld4AcXPqcYx00=; b=gFCi4X5g7vyxTKKDTFt7hBImHO
	f2bGWLRKdrHrALsoTkjb/Bgtq5aLJe4V0qa8SHEFdYpzBrMxIIJIj3Csk2nJkRm+yXCfsKQlbSRqZ
	saui+snjxZrI/oJDfdhWjLlxawk70xuDetpyMrNlh2E3vgZkoKrhoVHZJg0gdQ2PFg3cFnwRLVuun
	iK1u8DtTT4+L5YQ0oejTRFByjsPM9TEvl9h5quf1K505HGxZ5L76ywKFlDSKP8WtgErTH4OxgaaK9
	VBlwV1WIvlWebRCzDPHyl0ZxtXegFgp+FnTOV1lygcbnU/+NBzc7inZvIVcGUX1nw6wGeRqjibRbY
	ABvJEJNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS6Ke-00Es1U-0t;
	Tue, 23 Jan 2024 02:16:08 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS6KZ-00ErzK-0e
	for linux-mtd@lists.infradead.org;
	Tue, 23 Jan 2024 02:16:06 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4TJrJK5MNlzXgZc;
	Tue, 23 Jan 2024 10:14:41 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 06CBE18005E;
	Tue, 23 Jan 2024 10:15:52 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 10:15:51 +0800
Subject: Re: [PATCH 08/15] ubifs: Convert ubifs_write_begin() to use a folio
To: Matthew Wilcox <willy@infradead.org>
CC: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <20240120230824.2619716-1-willy@infradead.org>
 <20240120230824.2619716-9-willy@infradead.org>
 <0f015efd-4142-764c-24b3-e413f5e16d4c@huawei.com>
 <Za5-_9hwEdPhI-or@casper.infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <1df263aa-99bc-81d2-305e-f5c7a6cc690c@huawei.com>
Date: Tue, 23 Jan 2024 10:15:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <Za5-_9hwEdPhI-or@casper.infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_181603_429819_59E7CA15 
X-CRM114-Status: GOOD (  17.61  )
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

1NogMjAyNC8xLzIyIDIyOjQzLCBNYXR0aGV3IFdpbGNveCDQtLXAOgo+IE9uIE1vbiwgSmFuIDIy
LCAyMDI0IGF0IDA3OjUxOjAzUE0gKzA4MDAsIFpoaWhhbyBDaGVuZyB3cm90ZToKPj4+IEBAIC00
MzcsMTMgKzQzNywxNCBAQCBzdGF0aWMgaW50IHViaWZzX3dyaXRlX2JlZ2luKHN0cnVjdCBmaWxl
ICpmaWxlLCBzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPj4+ICAgIAkJcmV0dXJuIC1F
Uk9GUzsKPj4+ICAgIAkvKiBUcnkgb3V0IHRoZSBmYXN0LXBhdGggcGFydCBmaXJzdCAqLwo+Pj4g
LQlwYWdlID0gZ3JhYl9jYWNoZV9wYWdlX3dyaXRlX2JlZ2luKG1hcHBpbmcsIGluZGV4KTsKPj4+
IC0JaWYgKHVubGlrZWx5KCFwYWdlKSkKPj4+IC0JCXJldHVybiAtRU5PTUVNOwo+Pj4gKwlmb2xp
byA9IF9fZmlsZW1hcF9nZXRfZm9saW8obWFwcGluZywgaW5kZXgsIEZHUF9XUklURUJFR0lOLAo+
Pj4gKwkJCW1hcHBpbmdfZ2ZwX21hc2sobWFwcGluZykpOwo+Pj4gKwlpZiAoSVNfRVJSKGZvbGlv
KSkKPj4+ICsJCXJldHVybiBQVFJfRVJSKGZvbGlvKTsKPj4+IC0JaWYgKCFQYWdlVXB0b2RhdGUo
cGFnZSkpIHsKPj4+ICsJaWYgKCFmb2xpb190ZXN0X3VwdG9kYXRlKGZvbGlvKSkgewo+Pj4gICAg
CQkvKiBUaGUgcGFnZSBpcyBub3QgbG9hZGVkIGZyb20gdGhlIGZsYXNoICovCj4+PiAtCQlpZiAo
IShwb3MgJiB+UEFHRV9NQVNLKSAmJiBsZW4gPT0gUEFHRV9TSVpFKSB7Cj4+PiArCQlpZiAocG9z
ID09IGZvbGlvX3Bvcyhmb2xpbykgJiYgbGVuID49IGZvbGlvX3NpemUoZm9saW8pKSB7Cj4+Cj4+
IFdoeSBub3QgbGVuID09IGZvbGlvX3NpemUoZm9saW8pPyBBbHRob3VnaCAnbGVuID49IGZvbGlv
X3NpemUoZm9saW8pJyBpcyBub3QKPj4gd3JvbmcuCj4gCj4gVGhpcyBpcyBiYXNlZCBvbiBteSBl
eHBlcmllbmNlIHdpdGggaW9tYXAuICBUb2RheSwgdGhlIGNhbGxlciBwYXNzZXMgaW4KPiBtaW4o
bGVuZ3RoLW9mLXdyaXRlLCBQQUdFX1NJWkUpLiAgSW4gb3JkZXIgdG8gYmUgYWJsZSB0byBjcmVh
dGUgbGFyZ2UKPiBmb2xpb3MgaW4gdGhlIHdyaXRlIHBhdGgsIHdlIHdhbnQgdG8gY2hhbmdlIHRo
ZSBjYWxsZXIgb2Ygd3JpdGVfYmVnaW4KPiB0byBwYXNzIGluIHRoZSBsZW5ndGggb2YgdGhlIHdy
aXRlLCBzbyB3ZSBjYW4gc2VlIGEgbGVuIHdoaWNoIGlzIGxhcmdlcgo+IHRoYW4gdGhlIHNpemUg
b2YgdGhlIGZvbGlvIHdlIGZvdW5kLgo+IAo+IC4KPiAKCkkgZ3Vlc3MgeW91IGFyZSBwcmVwYXJp
bmcgZm9yIGFkZGluZyBsYXJnZSBmb2xpbyBzdXBwb3J0IGZvciAKZ2VuZXJpY19wZXJmb3JtX3dy
aXRlIHBhdGgsIG1heSBJIGhhdmUgYSBsb29rIGZvciB0aGUgZGVtbyBjb2RlPyBJJ20gYSAKbGl0
dGxlIGNvbmZ1c2VkIGZvciB0aGlzIHdvcmRzICJ3ZSB3YW50IHRvIGNoYW5nZSB0aGUgY2FsbGVy
IG9mIAp3cml0ZV9iZWdpbiB0byBwYXNzIGluIHRoZSBsZW5ndGggb2YgdGhlIHdyaXRlIi4gQWNj
b3JkaW5nIHRvIHRoZSAKaW1wbGVtZW50YXRpb24gb2YgaW9tYXBfd3JpdGVfaXRlcigpLCBJIGZp
bmQgdGhlIHdyaXRlIGxlbmd0aCBpbiBlYWNoIAppdGVyYXRpb24gaXMgbWluKHdyaXRlX2J5dGVz
LCBmb2xpb19zaXplKSwgc28gSSBndWVzcyB0aGUgd3JpdGUgbGVuZ3RoIApwYXNzZWQgaW4gdWJp
ZnNfd3JpdGVfYmVnaW4gd29uJ3QgZXhjZWVkIGZvbGlvX3NpemUuCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
