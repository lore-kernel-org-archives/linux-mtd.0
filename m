Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A78EC4725D
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 11:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXyDmMgM2EdvyeoHtTe/6x8ajdpcddT7WS2eTNzHBWY=; b=x0/ZDGM82ZMs+KQg/W0lEE3oVe
	OIqW849Eu4R6u0lxYWumf3ciwBDgsDSZ7IGpuw4bnkRZDrXzi/NRqHwaT6u9NIhe3iSvc/hWI6Go5
	iFWxELzkaKZrLtUW4G7CBAq/2WA6OkMzOel8kbhLYQYe9m1CailCjzwtPBdHPRvOxmeFv+WGaqME6
	IIK0BVWnD6BA+gqCuIoXsXKBMYLrkVSSTUfqu1Nt5TyKZ5K1CVOEN8wGxePrl6a5Ol82ms3i7vyC9
	Y5zgEoHe0hFordOA6mV9kX8S8AairAz2MeU5d6qG6mN0wXp7lTiM4d+raKcFdNDvjFClUtX5vdKHl
	Jq47ymcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRspr-00BtWq-1o;
	Mon, 22 Jan 2024 11:51:27 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRspo-00BtSC-04
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jan 2024 11:51:26 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TJT754rWDz1xmF5;
	Mon, 22 Jan 2024 19:50:25 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 04C7E1400CC;
	Mon, 22 Jan 2024 19:51:16 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 19:51:15 +0800
Subject: Re: [PATCH 08/15] ubifs: Convert ubifs_write_begin() to use a folio
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
References: <20240120230824.2619716-1-willy@infradead.org>
 <20240120230824.2619716-9-willy@infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <0f015efd-4142-764c-24b3-e413f5e16d4c@huawei.com>
Date: Mon, 22 Jan 2024 19:51:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240120230824.2619716-9-willy@infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_035124_429118_9D87C4C5 
X-CRM114-Status: GOOD (  25.24  )
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

1NogMjAyNC8xLzIxIDc6MDgsIE1hdHRoZXcgV2lsY294IChPcmFjbGUpINC0tcA6Cj4gU2F2ZSBl
aWdodCBjYWxscyB0byBjb21wb3VuZF9oZWFkKCkgYnkgdXNpbmcgdGhlIG5ldyBmb2xpbyBBUEku
Cj4gUmVtb3ZlIGEgZmV3IGFzc3VtcHRpb25zIHRoYXQgd291bGQgYnJlYWsgd2l0aCBsYXJnZSBm
b2xpb3MuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBXaWxjb3ggKE9yYWNsZSkgPHdpbGx5
QGluZnJhZGVhZC5vcmc+Cj4gLS0tCj4gICBmcy91Ymlmcy9maWxlLmMgfCAzNiArKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRp
b25zKCspLCAxOSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvZmlsZS5j
IGIvZnMvdWJpZnMvZmlsZS5jCj4gaW5kZXggNjMwMmNlNjVlMGIzLi5lZjI2MjQ5OWYyMjggMTAw
NjQ0Cj4gLS0tIGEvZnMvdWJpZnMvZmlsZS5jCj4gKysrIGIvZnMvdWJpZnMvZmlsZS5jCj4gQEAg
LTQyOCw3ICs0MjgsNyBAQCBzdGF0aWMgaW50IHViaWZzX3dyaXRlX2JlZ2luKHN0cnVjdCBmaWxl
ICpmaWxlLCBzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPiAgIAlwZ29mZl90IGluZGV4
ID0gcG9zID4+IFBBR0VfU0hJRlQ7Cj4gICAJaW50IGVyciwgYXBwZW5kaW5nID0gISEocG9zICsg
bGVuID4gaW5vZGUtPmlfc2l6ZSk7Cj4gICAJaW50IHNraXBwZWRfcmVhZCA9IDA7Cj4gLQlzdHJ1
Y3QgcGFnZSAqcGFnZTsKPiArCXN0cnVjdCBmb2xpbyAqZm9saW87Cj4gICAKPiAgIAl1Ymlmc19h
c3NlcnQoYywgdWJpZnNfaW5vZGUoaW5vZGUpLT51aV9zaXplID09IGlub2RlLT5pX3NpemUpOwo+
ICAgCXViaWZzX2Fzc2VydChjLCAhYy0+cm9fbWVkaWEgJiYgIWMtPnJvX21vdW50KTsKPiBAQCAt
NDM3LDEzICs0MzcsMTQgQEAgc3RhdGljIGludCB1Ymlmc193cml0ZV9iZWdpbihzdHJ1Y3QgZmls
ZSAqZmlsZSwgc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsCj4gICAJCXJldHVybiAtRVJP
RlM7Cj4gICAKPiAgIAkvKiBUcnkgb3V0IHRoZSBmYXN0LXBhdGggcGFydCBmaXJzdCAqLwo+IC0J
cGFnZSA9IGdyYWJfY2FjaGVfcGFnZV93cml0ZV9iZWdpbihtYXBwaW5nLCBpbmRleCk7Cj4gLQlp
ZiAodW5saWtlbHkoIXBhZ2UpKQo+IC0JCXJldHVybiAtRU5PTUVNOwo+ICsJZm9saW8gPSBfX2Zp
bGVtYXBfZ2V0X2ZvbGlvKG1hcHBpbmcsIGluZGV4LCBGR1BfV1JJVEVCRUdJTiwKPiArCQkJbWFw
cGluZ19nZnBfbWFzayhtYXBwaW5nKSk7Cj4gKwlpZiAoSVNfRVJSKGZvbGlvKSkKPiArCQlyZXR1
cm4gUFRSX0VSUihmb2xpbyk7Cj4gICAKPiAtCWlmICghUGFnZVVwdG9kYXRlKHBhZ2UpKSB7Cj4g
KwlpZiAoIWZvbGlvX3Rlc3RfdXB0b2RhdGUoZm9saW8pKSB7Cj4gICAJCS8qIFRoZSBwYWdlIGlz
IG5vdCBsb2FkZWQgZnJvbSB0aGUgZmxhc2ggKi8KPiAtCQlpZiAoIShwb3MgJiB+UEFHRV9NQVNL
KSAmJiBsZW4gPT0gUEFHRV9TSVpFKSB7Cj4gKwkJaWYgKHBvcyA9PSBmb2xpb19wb3MoZm9saW8p
ICYmIGxlbiA+PSBmb2xpb19zaXplKGZvbGlvKSkgewoKV2h5IG5vdCBsZW4gPT0gZm9saW9fc2l6
ZShmb2xpbyk/IEFsdGhvdWdoICdsZW4gPj0gZm9saW9fc2l6ZShmb2xpbyknIGlzIApub3Qgd3Jv
bmcuCgo+ICAgCQkJLyoKPiAgIAkJCSAqIFdlIGNoYW5nZSB3aG9sZSBwYWdlIHNvIG5vIG5lZWQg
dG8gbG9hZCBpdC4gQnV0IHdlCj4gICAJCQkgKiBkbyBub3Qga25vdyB3aGV0aGVyIHRoaXMgcGFn
ZSBleGlzdHMgb24gdGhlIG1lZGlhIG9yCj4gQEAgLTQ1MywyOSArNDU0LDI3IEBAIHN0YXRpYyBp
bnQgdWJpZnNfd3JpdGVfYmVnaW4oc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCBhZGRyZXNzX3Nw
YWNlICptYXBwaW5nLAo+ICAgCQkJICogbWVkaWEuIFRodXMsIHdlIGFyZSBzZXR0aW5nIHRoZSBA
UEdfY2hlY2tlZCBmbGFnCj4gICAJCQkgKiBoZXJlLgo+ICAgCQkJICovCj4gLQkJCVNldFBhZ2VD
aGVja2VkKHBhZ2UpOwo+ICsJCQlmb2xpb19zZXRfY2hlY2tlZChmb2xpbyk7Cj4gICAJCQlza2lw
cGVkX3JlYWQgPSAxOwo+ICAgCQl9IGVsc2Ugewo+IC0JCQllcnIgPSBkb19yZWFkcGFnZShwYWdl
KTsKPiArCQkJZXJyID0gZG9fcmVhZHBhZ2UoJmZvbGlvLT5wYWdlKTsKPiAgIAkJCWlmIChlcnIp
IHsKPiAtCQkJCXVubG9ja19wYWdlKHBhZ2UpOwo+IC0JCQkJcHV0X3BhZ2UocGFnZSk7Cj4gKwkJ
CQlmb2xpb191bmxvY2soZm9saW8pOwo+ICsJCQkJZm9saW9fcHV0KGZvbGlvKTsKPiAgIAkJCQly
ZXR1cm4gZXJyOwo+ICAgCQkJfQo+ICAgCQl9Cj4gICAJfQo+ICAgCj4gLQllcnIgPSBhbGxvY2F0
ZV9idWRnZXQoYywgcGFnZSwgdWksIGFwcGVuZGluZyk7Cj4gKwllcnIgPSBhbGxvY2F0ZV9idWRn
ZXQoYywgJmZvbGlvLT5wYWdlLCB1aSwgYXBwZW5kaW5nKTsKPiAgIAlpZiAodW5saWtlbHkoZXJy
KSkgewo+ICAgCQl1Ymlmc19hc3NlcnQoYywgZXJyID09IC1FTk9TUEMpOwo+ICAgCQkvKgo+ICAg
CQkgKiBJZiB3ZSBza2lwcGVkIHJlYWRpbmcgdGhlIHBhZ2UgYmVjYXVzZSB3ZSB3ZXJlIGdvaW5n
IHRvCj4gICAJCSAqIHdyaXRlIGFsbCBvZiBpdCwgdGhlbiBpdCBpcyBub3QgdXAgdG8gZGF0ZS4K
PiAgIAkJICovCj4gLQkJaWYgKHNraXBwZWRfcmVhZCkgewo+IC0JCQlDbGVhclBhZ2VDaGVja2Vk
KHBhZ2UpOwo+IC0JCQlDbGVhclBhZ2VVcHRvZGF0ZShwYWdlKTsKPiAtCQl9Cj4gKwkJaWYgKHNr
aXBwZWRfcmVhZCkKPiArCQkJZm9saW9fY2xlYXJfY2hlY2tlZChmb2xpbyk7Cj4gICAJCS8qCj4g
ICAJCSAqIEJ1ZGdldGluZyBmYWlsZWQgd2hpY2ggbWVhbnMgaXQgd291bGQgaGF2ZSB0byBmb3Jj
ZQo+ICAgCQkgKiB3cml0ZS1iYWNrIGJ1dCBkaWRuJ3QsIGJlY2F1c2Ugd2Ugc2V0IHRoZSBAZmFz
dCBmbGFnIGluIHRoZQo+IEBAIC00ODcsOCArNDg2LDggQEAgc3RhdGljIGludCB1Ymlmc193cml0
ZV9iZWdpbihzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcs
Cj4gICAJCQl1Ymlmc19hc3NlcnQoYywgbXV0ZXhfaXNfbG9ja2VkKCZ1aS0+dWlfbXV0ZXgpKTsK
PiAgIAkJCW11dGV4X3VubG9jaygmdWktPnVpX211dGV4KTsKPiAgIAkJfQo+IC0JCXVubG9ja19w
YWdlKHBhZ2UpOwo+IC0JCXB1dF9wYWdlKHBhZ2UpOwo+ICsJCWZvbGlvX3VubG9jayhmb2xpbyk7
Cj4gKwkJZm9saW9fcHV0KGZvbGlvKTsKPiAgIAo+ICAgCQlyZXR1cm4gd3JpdGVfYmVnaW5fc2xv
dyhtYXBwaW5nLCBwb3MsIGxlbiwgcGFnZXApOwo+ICAgCX0KPiBAQCAtNDk5LDkgKzQ5OCw4IEBA
IHN0YXRpYyBpbnQgdWJpZnNfd3JpdGVfYmVnaW4oc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCBh
ZGRyZXNzX3NwYWNlICptYXBwaW5nLAo+ICAgCSAqIHdpdGggQHVpLT51aV9tdXRleCBsb2NrZWQg
aWYgd2UgYXJlIGFwcGVuZGluZyBwYWdlcywgYW5kIHVubG9ja2VkCj4gICAJICogb3RoZXJ3aXNl
LiBUaGlzIGlzIGFuIG9wdGltaXphdGlvbiAoc2xpZ2h0bHkgaGFja3kgdGhvdWdoKS4KPiAgIAkg
Ki8KPiAtCSpwYWdlcCA9IHBhZ2U7Cj4gKwkqcGFnZXAgPSAmZm9saW8tPnBhZ2U7Cj4gICAJcmV0
dXJuIDA7Cj4gLQo+ICAgfQo+ICAgCj4gICAvKioKPiAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
