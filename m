Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AFAC46CD2
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jan 2024 01:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URuc3Tq7EhOyT33ytZ8mQl0oeZ1chqijl/xhfLPLAqE=; b=hcKWrnZnq1bKP7uxdlkKjtqZWM
	2/rnzMLNZeVkMvb8CFd9csGIlRd7nZj40KLf0OiNpq6wmU5zTBmxb1jS7FlgZVIe/VmPVGxm72ndJ
	mzbEoTCtKJv7EkFvBHt2zvtQLSmCBmhTwl+gKCXJ9Q6gBBcgeTwayyVgunPKvy/j1jKaj6hzGVa0G
	cg/Lb7r8j0gsXjv0uQHaCo+KPXRCID3iX+0ZUQhPZCgcmYosoB0g2xVuk7NmzczA8AixHbVXMoXnT
	Mbl5A1JtrjdG9GV8rhdLVbSh2JbAhenlN/DmTkyvaGblfHxQI1hJ+ZsfFkkUUSq+HfKcz7YKayDNy
	fVU1yYxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSopU-005qlU-27;
	Thu, 25 Jan 2024 01:46:56 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSopO-005qkY-2C
	for linux-mtd@lists.infradead.org;
	Thu, 25 Jan 2024 01:46:54 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4TL3Zb6rQDzbcMt;
	Thu, 25 Jan 2024 09:46:15 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 47460180073;
	Thu, 25 Jan 2024 09:46:39 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 09:46:38 +0800
Subject: Re: [PATCH v2 07/15] ubifs: Convert write_begin_slow() to use a folio
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
References: <20240124175302.1750912-1-willy@infradead.org>
 <20240124175302.1750912-8-willy@infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <12c94842-6402-e0ee-42f8-d37d66d6bf45@huawei.com>
Date: Thu, 25 Jan 2024 09:46:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240124175302.1750912-8-willy@infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_174653_027646_57625FA7 
X-CRM114-Status: GOOD (  29.52  )
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

1NogMjAyNC8xLzI1IDE6NTIsIE1hdHRoZXcgV2lsY294IChPcmFjbGUpINC0tcA6Cj4gVXBkYXRl
IHRvIG5ldyBBUElzLCByZW1vdmluZyBzZXZlcmFsIGNhbGxzIHRvIGNvbXBvdW5kX2hlYWQoKSBh
bmQKPiBpbmNsdWRpbmcgc3VwcG9ydCBmb3IgbGFyZ2UgZm9saW9zLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IE1hdHRoZXcgV2lsY294IChPcmFjbGUpIDx3aWxseUBpbmZyYWRlYWQub3JnPgo+IC0tLQo+
ICAgZnMvdWJpZnMvZmlsZS5jIHwgNDUgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMjIgZGVs
ZXRpb25zKC0pCj4gCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVh
d2VpLmNvbT4KCj4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL2ZpbGUuYyBiL2ZzL3ViaWZzL2ZpbGUu
Ywo+IGluZGV4IDNjNGE5ODQ3NmMyMy4uY2M0ZDJlYzk1YjcwIDEwMDY0NAo+IC0tLSBhL2ZzL3Vi
aWZzL2ZpbGUuYwo+ICsrKyBiL2ZzL3ViaWZzL2ZpbGUuYwo+IEBAIC0yMjIsMTYgKzIyMiwxNiBA
QCBzdGF0aWMgaW50IHdyaXRlX2JlZ2luX3Nsb3coc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBp
bmcsCj4gICAJcGdvZmZfdCBpbmRleCA9IHBvcyA+PiBQQUdFX1NISUZUOwo+ICAgCXN0cnVjdCB1
Ymlmc19idWRnZXRfcmVxIHJlcSA9IHsgLm5ld19wYWdlID0gMSB9Owo+ICAgCWludCBlcnIsIGFw
cGVuZGluZyA9ICEhKHBvcyArIGxlbiA+IGlub2RlLT5pX3NpemUpOwo+IC0Jc3RydWN0IHBhZ2Ug
KnBhZ2U7Cj4gKwlzdHJ1Y3QgZm9saW8gKmZvbGlvOwo+ICAgCj4gICAJZGJnX2dlbigiaW5vICVs
dSwgcG9zICVsbHUsIGxlbiAldSwgaV9zaXplICVsbGQiLAo+ICAgCQlpbm9kZS0+aV9pbm8sIHBv
cywgbGVuLCBpbm9kZS0+aV9zaXplKTsKPiAgIAo+ICAgCS8qCj4gLQkgKiBBdCB0aGUgc2xvdyBw
YXRoIHdlIGhhdmUgdG8gYnVkZ2V0IGJlZm9yZSBsb2NraW5nIHRoZSBwYWdlLCBiZWNhdXNlCj4g
LQkgKiBidWRnZXRpbmcgbWF5IGZvcmNlIHdyaXRlLWJhY2ssIHdoaWNoIHdvdWxkIHdhaXQgb24g
bG9ja2VkIHBhZ2VzIGFuZAo+IC0JICogZGVhZGxvY2sgaWYgd2UgaGFkIHRoZSBwYWdlIGxvY2tl
ZC4gQXQgdGhpcyBwb2ludCB3ZSBkbyBub3Qga25vdwo+IC0JICogYW55dGhpbmcgYWJvdXQgdGhl
IHBhZ2UsIHNvIGFzc3VtZSB0aGF0IHRoaXMgaXMgYSBuZXcgcGFnZSB3aGljaCBpcwo+ICsJICog
QXQgdGhlIHNsb3cgcGF0aCB3ZSBoYXZlIHRvIGJ1ZGdldCBiZWZvcmUgbG9ja2luZyB0aGUgZm9s
aW8sIGJlY2F1c2UKPiArCSAqIGJ1ZGdldGluZyBtYXkgZm9yY2Ugd3JpdGUtYmFjaywgd2hpY2gg
d291bGQgd2FpdCBvbiBsb2NrZWQgZm9saW9zIGFuZAo+ICsJICogZGVhZGxvY2sgaWYgd2UgaGFk
IHRoZSBmb2xpbyBsb2NrZWQuIEF0IHRoaXMgcG9pbnQgd2UgZG8gbm90IGtub3cKPiArCSAqIGFu
eXRoaW5nIGFib3V0IHRoZSBmb2xpbywgc28gYXNzdW1lIHRoYXQgdGhpcyBpcyBhIG5ldyBmb2xp
byB3aGljaCBpcwo+ICAgCSAqIHdyaXR0ZW4gdG8gYSBob2xlLiBUaGlzIGNvcnJlc3BvbmRzIHRv
IGxhcmdlc3QgYnVkZ2V0LiBMYXRlciB0aGUKPiAgIAkgKiBidWRnZXQgd2lsbCBiZSBhbWVuZGVk
IGlmIHRoaXMgaXMgbm90IHRydWUuCj4gICAJICovCj4gQEAgLTI0Myw0MiArMjQzLDQzIEBAIHN0
YXRpYyBpbnQgd3JpdGVfYmVnaW5fc2xvdyhzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywK
PiAgIAlpZiAodW5saWtlbHkoZXJyKSkKPiAgIAkJcmV0dXJuIGVycjsKPiAgIAo+IC0JcGFnZSA9
IGdyYWJfY2FjaGVfcGFnZV93cml0ZV9iZWdpbihtYXBwaW5nLCBpbmRleCk7Cj4gLQlpZiAodW5s
aWtlbHkoIXBhZ2UpKSB7Cj4gKwlmb2xpbyA9IF9fZmlsZW1hcF9nZXRfZm9saW8obWFwcGluZywg
aW5kZXgsIEZHUF9XUklURUJFR0lOLAo+ICsJCQltYXBwaW5nX2dmcF9tYXNrKG1hcHBpbmcpKTsK
PiArCWlmIChJU19FUlIoZm9saW8pKSB7Cj4gICAJCXViaWZzX3JlbGVhc2VfYnVkZ2V0KGMsICZy
ZXEpOwo+IC0JCXJldHVybiAtRU5PTUVNOwo+ICsJCXJldHVybiBQVFJfRVJSKGZvbGlvKTsKPiAg
IAl9Cj4gICAKPiAtCWlmICghUGFnZVVwdG9kYXRlKHBhZ2UpKSB7Cj4gLQkJaWYgKCEocG9zICYg
flBBR0VfTUFTSykgJiYgbGVuID09IFBBR0VfU0laRSkKPiAtCQkJU2V0UGFnZUNoZWNrZWQocGFn
ZSk7Cj4gKwlpZiAoIWZvbGlvX3Rlc3RfdXB0b2RhdGUoZm9saW8pKSB7Cj4gKwkJaWYgKHBvcyA9
PSBmb2xpb19wb3MoZm9saW8pICYmIGxlbiA+PSBmb2xpb19zaXplKGZvbGlvKSkKPiArCQkJZm9s
aW9fc2V0X2NoZWNrZWQoZm9saW8pOwo+ICAgCQllbHNlIHsKPiAtCQkJZXJyID0gZG9fcmVhZHBh
Z2UocGFnZSk7Cj4gKwkJCWVyciA9IGRvX3JlYWRwYWdlKCZmb2xpby0+cGFnZSk7Cj4gICAJCQlp
ZiAoZXJyKSB7Cj4gLQkJCQl1bmxvY2tfcGFnZShwYWdlKTsKPiAtCQkJCXB1dF9wYWdlKHBhZ2Up
Owo+ICsJCQkJZm9saW9fdW5sb2NrKGZvbGlvKTsKPiArCQkJCWZvbGlvX3B1dChmb2xpbyk7Cj4g
ICAJCQkJdWJpZnNfcmVsZWFzZV9idWRnZXQoYywgJnJlcSk7Cj4gICAJCQkJcmV0dXJuIGVycjsK
PiAgIAkJCX0KPiAgIAkJfQo+ICAgCX0KPiAgIAo+IC0JaWYgKFBhZ2VQcml2YXRlKHBhZ2UpKQo+
ICsJaWYgKGZvbGlvLT5wcml2YXRlKQo+ICAgCQkvKgo+IC0JCSAqIFRoZSBwYWdlIGlzIGRpcnR5
LCB3aGljaCBtZWFucyBpdCB3YXMgYnVkZ2V0ZWQgdHdpY2U6Cj4gKwkJICogVGhlIGZvbGlvIGlz
IGRpcnR5LCB3aGljaCBtZWFucyBpdCB3YXMgYnVkZ2V0ZWQgdHdpY2U6Cj4gICAJCSAqICAgbyBm
aXJzdCB0aW1lIHRoZSBidWRnZXQgd2FzIGFsbG9jYXRlZCBieSB0aGUgdGFzayB3aGljaAo+IC0J
CSAqICAgICBtYWRlIHRoZSBwYWdlIGRpcnR5IGFuZCBzZXQgdGhlIFBHX3ByaXZhdGUgZmxhZzsK
PiArCQkgKiAgICAgbWFkZSB0aGUgZm9saW8gZGlydHkgYW5kIHNldCB0aGUgcHJpdmF0ZSBmaWVs
ZDsKPiAgIAkJICogICBvIGFuZCB0aGVuIHdlIGJ1ZGdldGVkIGZvciBpdCBmb3IgdGhlIHNlY29u
ZCB0aW1lIGF0IHRoZQo+ICAgCQkgKiAgICAgdmVyeSBiZWdpbm5pbmcgb2YgdGhpcyBmdW5jdGlv
bi4KPiAgIAkJICoKPiAtCQkgKiBTbyB3aGF0IHdlIGhhdmUgdG8gZG8gaXMgdG8gcmVsZWFzZSB0
aGUgcGFnZSBidWRnZXQgd2UKPiArCQkgKiBTbyB3aGF0IHdlIGhhdmUgdG8gZG8gaXMgdG8gcmVs
ZWFzZSB0aGUgZm9saW8gYnVkZ2V0IHdlCj4gICAJCSAqIGFsbG9jYXRlZC4KPiAgIAkJICovCj4g
ICAJCXJlbGVhc2VfbmV3X3BhZ2VfYnVkZ2V0KGMpOwo+IC0JZWxzZSBpZiAoIVBhZ2VDaGVja2Vk
KHBhZ2UpKQo+ICsJZWxzZSBpZiAoIWZvbGlvX3Rlc3RfY2hlY2tlZChmb2xpbykpCj4gICAJCS8q
Cj4gLQkJICogV2UgYXJlIGNoYW5naW5nIGEgcGFnZSB3aGljaCBhbHJlYWR5IGV4aXN0cyBvbiB0
aGUgbWVkaWEuCj4gLQkJICogVGhpcyBtZWFucyB0aGF0IGNoYW5naW5nIHRoZSBwYWdlIGRvZXMg
bm90IG1ha2UgdGhlIGFtb3VudAo+ICsJCSAqIFdlIGFyZSBjaGFuZ2luZyBhIGZvbGlvIHdoaWNo
IGFscmVhZHkgZXhpc3RzIG9uIHRoZSBtZWRpYS4KPiArCQkgKiBUaGlzIG1lYW5zIHRoYXQgY2hh
bmdpbmcgdGhlIGZvbGlvIGRvZXMgbm90IG1ha2UgdGhlIGFtb3VudAo+ICAgCQkgKiBvZiBpbmRl
eGluZyBpbmZvcm1hdGlvbiBsYXJnZXIsIGFuZCB0aGlzIHBhcnQgb2YgdGhlIGJ1ZGdldAo+ICAg
CQkgKiB3aGljaCB3ZSBoYXZlIGFscmVhZHkgYWNxdWlyZWQgbWF5IGJlIHJlbGVhc2VkLgo+ICAg
CQkgKi8KPiBAQCAtMzAxLDcgKzMwMiw3IEBAIHN0YXRpYyBpbnQgd3JpdGVfYmVnaW5fc2xvdyhz
dHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPiAgIAkJCXViaWZzX3JlbGVhc2VfZGlydHlf
aW5vZGVfYnVkZ2V0KGMsIHVpKTsKPiAgIAl9Cj4gICAKPiAtCSpwYWdlcCA9IHBhZ2U7Cj4gKwkq
cGFnZXAgPSAmZm9saW8tPnBhZ2U7Cj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4gICAKPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
