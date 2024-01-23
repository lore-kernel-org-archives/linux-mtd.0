Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28423C47258
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jan 2024 04:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rpyY2PyjPumVfJxn9lGKApCk+aYY1x1s6RUgKaQRTug=; b=4NKH4Ky7mXbFvxiv86cn7gqZNb
	dbxVH5SoxnhsboJp8FBoUOdvj8Lfttw7ZZMT3wxenqeDSuEtVNGN0XKdYHAAiRvIYm0Cui8HdE/34
	UlNHzdfpAtkvzD4mM/CoOSAMTIJTWXT7ajD94vhl+S2LrN8dJjhJqGSqU9JtQgunX+xzj5EcDeJHF
	83arklRSSASIxs1tgZJnjvAflr7imiXF4asmw04633VJ1xzOr/PkDJ1gH0IBoPOvseDOjWfk0s9H2
	F1R4DiW9zXru/UNyI+ovW88/xwi4MnBjg582pB801rtyYIqP9TY3tom1uIXXJRv2V+/iGEe8EdIPs
	o8+jGBGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS8OL-00F47r-0P;
	Tue, 23 Jan 2024 04:28:05 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS8OH-00F46t-3D
	for linux-mtd@lists.infradead.org;
	Tue, 23 Jan 2024 04:28:03 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4TJvFh0p9qzbcC3;
	Tue, 23 Jan 2024 12:27:36 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 8E863180076;
	Tue, 23 Jan 2024 12:27:58 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 12:27:57 +0800
Subject: Re: [PATCH 08/15] ubifs: Convert ubifs_write_begin() to use a folio
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
References: <20240120230824.2619716-1-willy@infradead.org>
 <20240120230824.2619716-9-willy@infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <bfff690c-e250-583a-eb74-7d117e0a0357@huawei.com>
Date: Tue, 23 Jan 2024 12:27:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240120230824.2619716-9-willy@infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_202802_357711_23FE6C96 
X-CRM114-Status: GOOD (  25.11  )
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
b25zKCspLCAxOSBkZWxldGlvbnMoLSkKPiAKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgoKPiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvZmlsZS5jIGIv
ZnMvdWJpZnMvZmlsZS5jCj4gaW5kZXggNjMwMmNlNjVlMGIzLi5lZjI2MjQ5OWYyMjggMTAwNjQ0
Cj4gLS0tIGEvZnMvdWJpZnMvZmlsZS5jCj4gKysrIGIvZnMvdWJpZnMvZmlsZS5jCj4gQEAgLTQy
OCw3ICs0MjgsNyBAQCBzdGF0aWMgaW50IHViaWZzX3dyaXRlX2JlZ2luKHN0cnVjdCBmaWxlICpm
aWxlLCBzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPiAgIAlwZ29mZl90IGluZGV4ID0g
cG9zID4+IFBBR0VfU0hJRlQ7Cj4gICAJaW50IGVyciwgYXBwZW5kaW5nID0gISEocG9zICsgbGVu
ID4gaW5vZGUtPmlfc2l6ZSk7Cj4gICAJaW50IHNraXBwZWRfcmVhZCA9IDA7Cj4gLQlzdHJ1Y3Qg
cGFnZSAqcGFnZTsKPiArCXN0cnVjdCBmb2xpbyAqZm9saW87Cj4gICAKPiAgIAl1Ymlmc19hc3Nl
cnQoYywgdWJpZnNfaW5vZGUoaW5vZGUpLT51aV9zaXplID09IGlub2RlLT5pX3NpemUpOwo+ICAg
CXViaWZzX2Fzc2VydChjLCAhYy0+cm9fbWVkaWEgJiYgIWMtPnJvX21vdW50KTsKPiBAQCAtNDM3
LDEzICs0MzcsMTQgQEAgc3RhdGljIGludCB1Ymlmc193cml0ZV9iZWdpbihzdHJ1Y3QgZmlsZSAq
ZmlsZSwgc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsCj4gICAJCXJldHVybiAtRVJPRlM7
Cj4gICAKPiAgIAkvKiBUcnkgb3V0IHRoZSBmYXN0LXBhdGggcGFydCBmaXJzdCAqLwo+IC0JcGFn
ZSA9IGdyYWJfY2FjaGVfcGFnZV93cml0ZV9iZWdpbihtYXBwaW5nLCBpbmRleCk7Cj4gLQlpZiAo
dW5saWtlbHkoIXBhZ2UpKQo+IC0JCXJldHVybiAtRU5PTUVNOwo+ICsJZm9saW8gPSBfX2ZpbGVt
YXBfZ2V0X2ZvbGlvKG1hcHBpbmcsIGluZGV4LCBGR1BfV1JJVEVCRUdJTiwKPiArCQkJbWFwcGlu
Z19nZnBfbWFzayhtYXBwaW5nKSk7Cj4gKwlpZiAoSVNfRVJSKGZvbGlvKSkKPiArCQlyZXR1cm4g
UFRSX0VSUihmb2xpbyk7Cj4gICAKPiAtCWlmICghUGFnZVVwdG9kYXRlKHBhZ2UpKSB7Cj4gKwlp
ZiAoIWZvbGlvX3Rlc3RfdXB0b2RhdGUoZm9saW8pKSB7Cj4gICAJCS8qIFRoZSBwYWdlIGlzIG5v
dCBsb2FkZWQgZnJvbSB0aGUgZmxhc2ggKi8KPiAtCQlpZiAoIShwb3MgJiB+UEFHRV9NQVNLKSAm
JiBsZW4gPT0gUEFHRV9TSVpFKSB7Cj4gKwkJaWYgKHBvcyA9PSBmb2xpb19wb3MoZm9saW8pICYm
IGxlbiA+PSBmb2xpb19zaXplKGZvbGlvKSkgewo+ICAgCQkJLyoKPiAgIAkJCSAqIFdlIGNoYW5n
ZSB3aG9sZSBwYWdlIHNvIG5vIG5lZWQgdG8gbG9hZCBpdC4gQnV0IHdlCj4gICAJCQkgKiBkbyBu
b3Qga25vdyB3aGV0aGVyIHRoaXMgcGFnZSBleGlzdHMgb24gdGhlIG1lZGlhIG9yCj4gQEAgLTQ1
MywyOSArNDU0LDI3IEBAIHN0YXRpYyBpbnQgdWJpZnNfd3JpdGVfYmVnaW4oc3RydWN0IGZpbGUg
KmZpbGUsIHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLAo+ICAgCQkJICogbWVkaWEuIFRo
dXMsIHdlIGFyZSBzZXR0aW5nIHRoZSBAUEdfY2hlY2tlZCBmbGFnCj4gICAJCQkgKiBoZXJlLgo+
ICAgCQkJICovCj4gLQkJCVNldFBhZ2VDaGVja2VkKHBhZ2UpOwo+ICsJCQlmb2xpb19zZXRfY2hl
Y2tlZChmb2xpbyk7Cj4gICAJCQlza2lwcGVkX3JlYWQgPSAxOwo+ICAgCQl9IGVsc2Ugewo+IC0J
CQllcnIgPSBkb19yZWFkcGFnZShwYWdlKTsKPiArCQkJZXJyID0gZG9fcmVhZHBhZ2UoJmZvbGlv
LT5wYWdlKTsKPiAgIAkJCWlmIChlcnIpIHsKPiAtCQkJCXVubG9ja19wYWdlKHBhZ2UpOwo+IC0J
CQkJcHV0X3BhZ2UocGFnZSk7Cj4gKwkJCQlmb2xpb191bmxvY2soZm9saW8pOwo+ICsJCQkJZm9s
aW9fcHV0KGZvbGlvKTsKPiAgIAkJCQlyZXR1cm4gZXJyOwo+ICAgCQkJfQo+ICAgCQl9Cj4gICAJ
fQo+ICAgCj4gLQllcnIgPSBhbGxvY2F0ZV9idWRnZXQoYywgcGFnZSwgdWksIGFwcGVuZGluZyk7
Cj4gKwllcnIgPSBhbGxvY2F0ZV9idWRnZXQoYywgJmZvbGlvLT5wYWdlLCB1aSwgYXBwZW5kaW5n
KTsKPiAgIAlpZiAodW5saWtlbHkoZXJyKSkgewo+ICAgCQl1Ymlmc19hc3NlcnQoYywgZXJyID09
IC1FTk9TUEMpOwo+ICAgCQkvKgo+ICAgCQkgKiBJZiB3ZSBza2lwcGVkIHJlYWRpbmcgdGhlIHBh
Z2UgYmVjYXVzZSB3ZSB3ZXJlIGdvaW5nIHRvCj4gICAJCSAqIHdyaXRlIGFsbCBvZiBpdCwgdGhl
biBpdCBpcyBub3QgdXAgdG8gZGF0ZS4KPiAgIAkJICovCj4gLQkJaWYgKHNraXBwZWRfcmVhZCkg
ewo+IC0JCQlDbGVhclBhZ2VDaGVja2VkKHBhZ2UpOwo+IC0JCQlDbGVhclBhZ2VVcHRvZGF0ZShw
YWdlKTsKPiAtCQl9Cj4gKwkJaWYgKHNraXBwZWRfcmVhZCkKPiArCQkJZm9saW9fY2xlYXJfY2hl
Y2tlZChmb2xpbyk7Cj4gICAJCS8qCj4gICAJCSAqIEJ1ZGdldGluZyBmYWlsZWQgd2hpY2ggbWVh
bnMgaXQgd291bGQgaGF2ZSB0byBmb3JjZQo+ICAgCQkgKiB3cml0ZS1iYWNrIGJ1dCBkaWRuJ3Qs
IGJlY2F1c2Ugd2Ugc2V0IHRoZSBAZmFzdCBmbGFnIGluIHRoZQo+IEBAIC00ODcsOCArNDg2LDgg
QEAgc3RhdGljIGludCB1Ymlmc193cml0ZV9iZWdpbihzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0
IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsCj4gICAJCQl1Ymlmc19hc3NlcnQoYywgbXV0ZXhfaXNf
bG9ja2VkKCZ1aS0+dWlfbXV0ZXgpKTsKPiAgIAkJCW11dGV4X3VubG9jaygmdWktPnVpX211dGV4
KTsKPiAgIAkJfQo+IC0JCXVubG9ja19wYWdlKHBhZ2UpOwo+IC0JCXB1dF9wYWdlKHBhZ2UpOwo+
ICsJCWZvbGlvX3VubG9jayhmb2xpbyk7Cj4gKwkJZm9saW9fcHV0KGZvbGlvKTsKPiAgIAo+ICAg
CQlyZXR1cm4gd3JpdGVfYmVnaW5fc2xvdyhtYXBwaW5nLCBwb3MsIGxlbiwgcGFnZXApOwo+ICAg
CX0KPiBAQCAtNDk5LDkgKzQ5OCw4IEBAIHN0YXRpYyBpbnQgdWJpZnNfd3JpdGVfYmVnaW4oc3Ry
dWN0IGZpbGUgKmZpbGUsIHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLAo+ICAgCSAqIHdp
dGggQHVpLT51aV9tdXRleCBsb2NrZWQgaWYgd2UgYXJlIGFwcGVuZGluZyBwYWdlcywgYW5kIHVu
bG9ja2VkCj4gICAJICogb3RoZXJ3aXNlLiBUaGlzIGlzIGFuIG9wdGltaXphdGlvbiAoc2xpZ2h0
bHkgaGFja3kgdGhvdWdoKS4KPiAgIAkgKi8KPiAtCSpwYWdlcCA9IHBhZ2U7Cj4gKwkqcGFnZXAg
PSAmZm9saW8tPnBhZ2U7Cj4gICAJcmV0dXJuIDA7Cj4gLQo+ICAgfQo+ICAgCj4gICAvKioKPiAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
