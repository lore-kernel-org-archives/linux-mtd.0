Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6E7C46CD2
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jan 2024 01:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FOgSrv0Uiiumvzkunwp4uGv+oQ4LnkKrUrVijcEbcvo=; b=JmrjChMqn1gPh2jHe/tu1YGB6F
	SsNPpc/0nVnCyPs3W6FObMUxDwaoaq7ypqMeAgJNGCbBr+kMONX7lx+9aeaYpfs7zNVIqyfrPJy4M
	GhYhSwaFjcWQWXm1VwWnhZq1UoE5rp7t5T2r3uZE8ommpS90M1u7/IBIVPtYkY8KlImTljVEOgopU
	1U4oGZhFCVOqQtssUN2X0LUdvgpRS9pEYLLS1AHlXdP/gTFUkIcxkR37mBrg7Ia41CsvhYjv/wziB
	eVobV+wGUaQLuCAkOYbGOcK/wLmbVzZKV1rcjF7EqltYtk9WIbY1PbJsGm3i1KlnrbgaOLuxDKh/I
	YwZUcIPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSoja-005qHL-0q;
	Thu, 25 Jan 2024 01:40:50 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSojV-005qFO-2r
	for linux-mtd@lists.infradead.org;
	Thu, 25 Jan 2024 01:40:48 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TL3R25Gcmz1xm42;
	Thu, 25 Jan 2024 09:39:42 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id CF0CD1407F7;
	Thu, 25 Jan 2024 09:40:20 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 09:40:11 +0800
Subject: Re: [PATCH v2 01/15] ubifs: Set page uptodate in the correct place
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <stable@vger.kernel.org>
References: <20240124175302.1750912-1-willy@infradead.org>
 <20240124175302.1750912-2-willy@infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f523e709-aebb-eb9a-8a2e-a5229f331062@huawei.com>
Date: Thu, 25 Jan 2024 09:40:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240124175302.1750912-2-willy@infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_174046_206195_03B6342D 
X-CRM114-Status: GOOD (  21.42  )
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

1NogMjAyNC8xLzI1IDE6NTIsIE1hdHRoZXcgV2lsY294IChPcmFjbGUpINC0tcA6Cj4gUGFnZSBj
YWNoZSByZWFkcyBhcmUgbG9ja2xlc3MsIHNvIHNldHRpbmcgdGhlIGZyZXNobHkgYWxsb2NhdGVk
IHBhZ2UKPiB1cHRvZGF0ZSBiZWZvcmUgd2UndmUgb3ZlcndyaXR0ZW4gaXQgd2l0aCB0aGUgZGF0
YSBpdCdzIHN1cHBvc2VkIHRvIGhhdmUKPiBpbiBpdCB3aWxsIGFsbG93IGEgc2ltdWx0YW5lb3Vz
IHJlYWRlciB0byBzZWUgb2xkIGRhdGEuICBNb3ZlIHRoZSBjYWxsCj4gdG8gU2V0UGFnZVVwdG9k
YXRlIGludG8gdWJpZnNfd3JpdGVfZW5kKCksIHdoaWNoIGlzIGFmdGVyIHdlIGNvcGllZCB0aGUK
PiBuZXcgZGF0YSBpbnRvIHRoZSBwYWdlLgo+IAo+IEZpeGVzOiAxZTUxNzY0YTNjMmEgKCJVQklG
UzogYWRkIG5ldyBmbGFzaCBmaWxlIHN5c3RlbSIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmcKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IFdpbGNveCAoT3JhY2xlKSA8d2lsbHlAaW5mcmFk
ZWFkLm9yZz4KPiAtLS0KPiAgIGZzL3ViaWZzL2ZpbGUuYyB8IDEzICsrKystLS0tLS0tLS0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpSZXZpZXdl
ZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KCkp1c3Qgb25lIG5p
dCBiZWxvdy4KCj4gCj4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL2ZpbGUuYyBiL2ZzL3ViaWZzL2Zp
bGUuYwo+IGluZGV4IDUwMjllYjMzOTBhNS4uZDA2OTRiODNkZDAyIDEwMDY0NAo+IC0tLSBhL2Zz
L3ViaWZzL2ZpbGUuYwo+ICsrKyBiL2ZzL3ViaWZzL2ZpbGUuYwo+IEBAIC0yNjEsOSArMjYxLDYg
QEAgc3RhdGljIGludCB3cml0ZV9iZWdpbl9zbG93KHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBw
aW5nLAo+ICAgCQkJCXJldHVybiBlcnI7Cj4gICAJCQl9Cj4gICAJCX0KPiAtCj4gLQkJU2V0UGFn
ZVVwdG9kYXRlKHBhZ2UpOwo+IC0JCUNsZWFyUGFnZUVycm9yKHBhZ2UpOwo+ICAgCX0KPiAgIAo+
ICAgCWlmIChQYWdlUHJpdmF0ZShwYWdlKSkKPiBAQCAtNDYzLDkgKzQ2MCw2IEBAIHN0YXRpYyBp
bnQgdWJpZnNfd3JpdGVfYmVnaW4oc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCBhZGRyZXNzX3Nw
YWNlICptYXBwaW5nLAo+ICAgCQkJCXJldHVybiBlcnI7Cj4gICAJCQl9Cj4gICAJCX0KPiAtCj4g
LQkJU2V0UGFnZVVwdG9kYXRlKHBhZ2UpOwo+IC0JCUNsZWFyUGFnZUVycm9yKHBhZ2UpOwo+ICAg
CX0KPiAgIAo+ICAgCWVyciA9IGFsbG9jYXRlX2J1ZGdldChjLCBwYWdlLCB1aSwgYXBwZW5kaW5n
KTsKPiBAQCAtNDc1LDEwICs0NjksOCBAQCBzdGF0aWMgaW50IHViaWZzX3dyaXRlX2JlZ2luKHN0
cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPiAgIAkJICog
SWYgd2Ugc2tpcHBlZCByZWFkaW5nIHRoZSBwYWdlIGJlY2F1c2Ugd2Ugd2VyZSBnb2luZyB0bwo+
ICAgCQkgKiB3cml0ZSBhbGwgb2YgaXQsIHRoZW4gaXQgaXMgbm90IHVwIHRvIGRhdGUuCgpJdCB3
b3VsZCBiZSBiZXR0ZXIgdG8gdXBkYXRlIGFib3ZlIGNvbW1lbnRzLiBGb3IgZXhhbXBsZSwgIklm
IHdlIHNraXBwZWQgCnJlYWRpbmcgdGhlIHBhZ2UgYmVjYXVzZSB3ZSB3ZXJlIGdvaW5nIHRvIHdy
aXRlIGFsbCBvZiBpdCwgdGhlbiAKUGFnZUNoZWNrZWQgZmxhZyBzaG91bGQgYmUgcmVtb3ZlZC4i
Cgo+ICAgCQkgKi8KPiAtCQlpZiAoc2tpcHBlZF9yZWFkKSB7Cj4gKwkJaWYgKHNraXBwZWRfcmVh
ZCkKPiAgIAkJCUNsZWFyUGFnZUNoZWNrZWQocGFnZSk7Cj4gLQkJCUNsZWFyUGFnZVVwdG9kYXRl
KHBhZ2UpOwo+IC0JCX0KPiAgIAkJLyoKPiAgIAkJICogQnVkZ2V0aW5nIGZhaWxlZCB3aGljaCBt
ZWFucyBpdCB3b3VsZCBoYXZlIHRvIGZvcmNlCj4gICAJCSAqIHdyaXRlLWJhY2sgYnV0IGRpZG4n
dCwgYmVjYXVzZSB3ZSBzZXQgdGhlIEBmYXN0IGZsYWcgaW4gdGhlCj4gQEAgLTU2OSw2ICs1NjEs
OSBAQCBzdGF0aWMgaW50IHViaWZzX3dyaXRlX2VuZChzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0
IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsCj4gICAJCWdvdG8gb3V0Owo+ICAgCX0KPiAgIAo+ICsJ
aWYgKGxlbiA9PSBQQUdFX1NJWkUpCj4gKwkJU2V0UGFnZVVwdG9kYXRlKHBhZ2UpOwo+ICsKPiAg
IAlpZiAoIVBhZ2VQcml2YXRlKHBhZ2UpKSB7Cj4gICAJCWF0dGFjaF9wYWdlX3ByaXZhdGUocGFn
ZSwgKHZvaWQgKikxKTsKPiAgIAkJYXRvbWljX2xvbmdfaW5jKCZjLT5kaXJ0eV9wZ19jbnQpOwo+
IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
