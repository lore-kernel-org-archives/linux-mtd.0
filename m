Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAB0C54E64
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Mar 2024 02:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ls9nScXFniIixjgQDkGmX4tHU8W4067enVsD8mOVI+g=; b=s7RlqxrXf/Ibkfi3EhX8JKFjYu
	YLs1KnTYwS4WFhReO2342tDZ0kM93P+UdQ968kl8RW5s6B4KmhThVWGzZ0WTFZ8UnKVXTlhXP/L6Y
	96gGIsB9wgLUuOUe8X9a/Ogeg9H3oqegg2oigJu/jFLh/FwL6LzWsUXJIprwhEgMoZOAJtx9hLKwX
	aQMxuMR3jjkmkdgAxs90yDcECoK4AZtJ1+UJu5a27Afc5ZRtU12wFIMDQqj6npU3sbWQ73xMbHTb9
	VKJU7Lcz4Xdmp0rz9gJopMt7Nj17ynPZldrCy3sMpsxi1pm6Pgv9NeMKmxd1ncvHlhAk9H+l92HH4
	W+90X08A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnrL9-00000009GnO-0QEG;
	Sat, 23 Mar 2024 02:42:35 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnrL5-00000009GjW-1YuG
	for linux-mtd@lists.infradead.org;
	Sat, 23 Mar 2024 02:42:33 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4V1k1L5ny6zwQ28;
	Sat, 23 Mar 2024 10:39:34 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 599581400D7;
	Sat, 23 Mar 2024 10:42:10 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 23 Mar 2024 10:42:09 +0800
Subject: Re: [RFC PATCH v2 2/5] ubifs: Implement POSIX Access Control Lists
 (ACLs)
To: Li Zetao <lizetao1@huawei.com>, <richard@nod.at>, <corbet@lwn.net>,
	<kent.overstreet@linux.dev>, <agruenba@redhat.com>
CC: <linux-mtd@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20240322154812.215369-1-lizetao1@huawei.com>
 <20240322154812.215369-3-lizetao1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <daa0f858-ea85-1bf3-906c-4ef1a4998ccf@huawei.com>
Date: Sat, 23 Mar 2024 10:42:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240322154812.215369-3-lizetao1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_194231_773541_A594EB51 
X-CRM114-Status: GOOD (  20.46  )
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

1NogMjAyNC8zLzIyIDIzOjQ4LCBMaSBaZXRhbyDQtLXAOgo+IEltcGxlbWVudCB0aGUgQUNMcyBm
ZWF0dXJlIGZvciB1YmlmcyBiYXNlZCBvbiB2ZnMgUG9zaXggQUNMcywKPiBkZXRhaWxzIGFzIGZv
bGxvd3M6Cj4gICAgKiBJbml0aWFsaXplIGFjbCBmb3IgbmV3bHkgY3JlYXRlZCBpbm9kZS4KPiAg
ICAqIFByb3ZpZGVzIGdldC9zZXQgaW50ZXJmYWNlIHRvIGFjY2VzcyBBQ0xzLgo+IAo+IEFDTHMg
ZmVhdHVyZSByZWxpZXMgb24geGF0dHIgaW1wbGVtZW50YXRpb24gd2hpY2ggdXNpbmcgc3BlY2lm
aWMga2V5Cj4gbmFtZXMgInN5c3RlbS5wb3NpeF9hY2xfZGVmYXVsdCIgYW5kICJzeXN0ZW0ucG9z
aXhfYWNsX2FjY2VzcyIuIE5vdyBPbmx5Cj4gdGhlIHYyIHZlcnNpb24gb2YgUE9TSVggQUNMcyBp
cyBzdXBwb3J0ZWQsIGFuZCB1YmlmcyBkb2VzIG5vdCBuZWVkIHRvCj4gY3VzdG9taXplIHRoZSBz
dG9yYWdlIGZvcm1hdCwgd2hpY2ggY2FuIHNpbXBsaWZ5IHRoZSBpbXBsZW1lbnRhdGlvbi4KPiAK
PiBJdCBzaG91bGQgYmUgbm90ZWQgdGhhdCBMaW51eCBzdXBwb3J0cyB1cGRhdGluZyB0aGUgZmls
ZSBtb2RlIHRocm91Z2gKPiBBQ0xzLiBIb3dldmVyIHRoZSBhY2wgbWF5IG5vdCBleGlzdCwgc28g
dWJpZnNfeGF0dHJfcmVtb3ZlKCkgcmV0dXJucwo+IC1FTk9EQVRBLiBTdWNoIGEgc2NlbmFyaW8g
bmVlZHMgdG8gYmUgc3BlY2lhbGx5IGhhbmRsZWQuIEF0IHRoZSBzYW1lCj4gdGltZSwgaXQgbmVl
ZHMgdG8gZW5zdXJlIHRoYXQgdGhlIHVwZGF0ZWQgaW5vZGUgaXMgd3JpdHRlbiB0byBmbGFzaC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBMaSBaZXRhbyA8bGl6ZXRhbzFAaHVhd2VpLmNvbT4KPiAtLS0K
PiB2MSAtPiB2MjoKPiAgICAqIEdldCB4YXR0cl9uYW1lIGJ5IGRpcmVjdCBleHBhbnNpb24gaW5z
dGVhZCBvZiBwb3NpeF9hY2xfeGF0dHJfbmFtZSgpLgo+ICAgICogTW9kaWZ5IHViaWZzX3hhdHRy
X3JlbW92ZSB0byBhbiBleHRlcm5hbCBmdW5jdGlvbiB0byByZW1vdmUgdGhlIHhhdHRyIG9mIEFD
TC4KPiAgICAqIFJlbW92ZSByZWR1bmRhbnQgbGlrZWx5KCkgYW5kIHVubGlrZWx5KCkuCj4gICAg
KiBGaXggdXBkYXRpbmcgZmlsZSBtb2RlIHZpYSBBQ0wgYW5kIHN1cHBvcnQgd3JpdGluZyB0byBm
bGFzaC4KPiAKPiB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwMzE5MTYxNjQ2
LjIxNTM4NjctMi1saXpldGFvMUBodWF3ZWkuY29tLwo+IAo+ICAgZnMvdWJpZnMvTWFrZWZpbGUg
fCAgIDEgKwo+ICAgZnMvdWJpZnMvYWNsLmMgICAgfCAxOTIgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAgZnMvdWJpZnMvdWJpZnMuaCAgfCAgMTQgKysr
Kwo+ICAgZnMvdWJpZnMveGF0dHIuYyAgfCAgIDMgKy0KPiAgIDQgZmlsZXMgY2hhbmdlZCwgMjA4
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZnMv
dWJpZnMvYWNsLmMKPiAKWy4uLl0KPiArc3RhdGljIGludCB1Ymlmc191cGRhdGVfbW9kZShzdHJ1
Y3QgaW5vZGUgKmlub2RlLCB1bW9kZV90IG1vZGUpCj4gK3sKPiArCXN0cnVjdCB1Ymlmc19pbm9k
ZSAqdWkgPSB1Ymlmc19pbm9kZShpbm9kZSk7Cj4gKwlzdHJ1Y3QgdWJpZnNfaW5mbyAqYyA9IGlu
b2RlLT5pX3NiLT5zX2ZzX2luZm87Cj4gKwlzdHJ1Y3QgdWJpZnNfYnVkZ2V0X3JlcSByZXEgPSB7
IC5kaXJ0aWVkX2lubyA9IDEsCj4gKwkJCQkuZGlydGllZF9pbm9fZCA9IEFMSUdOKHVpLT5kYXRh
X2xlbiwgOCkgfTsKPiArCWludCByZWxlYXNlOwo+ICsJaW50IGVycjsKPiArCj4gKwllcnIgPSB1
Ymlmc19idWRnZXRfc3BhY2UoYywgJnJlcSk7Cj4gKwlpZiAoZXJyKQo+ICsJCXJldHVybiBlcnI7
Cj4gKwo+ICsJbXV0ZXhfbG9jaygmdWktPnVpX211dGV4KTsKPiArCXJlbGVhc2UgPSB1aS0+ZGly
dHk7Cj4gKwlpbm9kZS0+aV9tb2RlID0gbW9kZTsKPiArCWlub2RlX3NldF9jdGltZV9jdXJyZW50
KGlub2RlKTsKPiArCW1hcmtfaW5vZGVfZGlydHlfc3luYyhpbm9kZSk7Cj4gKwltdXRleF91bmxv
Y2soJnVpLT51aV9tdXRleCk7Cj4gKwo+ICsJaWYgKHJlbGVhc2UpCj4gKwkJdWJpZnNfcmVsZWFz
ZV9idWRnZXQoYywgJnJlcSk7Cj4gKwlpZiAoSVNfU1lOQyhpbm9kZSkpCj4gKwkJZXJyID0gaW5v
ZGUtPmlfc2ItPnNfb3AtPndyaXRlX2lub2RlKGlub2RlLCBOVUxMKTsKPiArCj4gKwlyZXR1cm4g
ZXJyOwo+ICt9Cj4gKwo+ICtpbnQgdWJpZnNfc2V0X2FjbChzdHJ1Y3QgbW50X2lkbWFwICppZG1h
cCwgc3RydWN0IGRlbnRyeSAqZGVudHJ5LCBzdHJ1Y3QgcG9zaXhfYWNsICphY2wsIGludCB0eXBl
KQo+ICt7Cj4gKwlzdHJ1Y3QgaW5vZGUgKmlub2RlID0gZF9pbm9kZShkZW50cnkpOwo+ICsJdW1v
ZGVfdCBtb2RlID0gaW5vZGUtPmlfbW9kZTsKPiArCWJvb2wgdXBkYXRlX21vZGUgPSBmYWxzZTsK
PiArCWludCBlcnJvcjsKPiArCj4gKwlpZiAodHlwZSA9PSBBQ0xfVFlQRV9BQ0NFU1MgJiYgYWNs
KSB7Cj4gKwkJZXJyb3IgPSBwb3NpeF9hY2xfdXBkYXRlX21vZGUoaWRtYXAsIGlub2RlLCAmbW9k
ZSwgJmFjbCk7Cj4gKwkJaWYgKHVubGlrZWx5KGVycm9yKSkKPiArCQkJcmV0dXJuIGVycm9yOwo+
ICsKPiArCQlpZiAoaW5vZGUtPmlfbW9kZSAhPSBtb2RlKQo+ICsJCQl1cGRhdGVfbW9kZSA9IHRy
dWU7Cj4gKwl9Cj4gKwo+ICsJZXJyb3IgPSBfX3ViaWZzX3NldF9hY2woaW5vZGUsIHR5cGUsIGFj
bCwgMCk7Cj4gKwlpZiAoIWVycm9yICYmIHVwZGF0ZV9tb2RlKQo+ICsJCWVycm9yID0gdWJpZnNf
dXBkYXRlX21vZGUoaW5vZGUsIG1vZGUpOwoKVXBkYXRpbmcgaW5vZGUgbW9kZSB0byBkaXNrIGlz
IGEgcmlnaHQgdGhpbmcuIEhvd2V2ZXIsIHRoaXMgbWFrZXMgCnViaWZzX3NldF9hY2wgaXMgbm90
IGF0b21pYywgd2hpY2ggaXMgbWFuaWZlc3RlZCBpbiB0d28gcG9pbnRzOgoxLiBJZiB1Ymlmc19i
dWRnZXRfc3BhY2UgZmFpbHMgYnkgRU5PU1BDLCBfX3ViaWZzX3NldF9hY2wgaGFzIHN0b3JlZCAK
eGF0dHJzIGludG8gZGlzaywgYnV0IGlub2RlIG1vZGUgaXMgbm90IHVwZGF0ZWQsIHdoaWNoIG1h
a2VzIGlub2RlLT5tb2RlIApiZSBpbmNvbnNpc3RlbnQgd2l0aCBhY2wuIFRoaXMgcHJvYmxlbSBj
YW4gYmUgZWFzaWx5IHNvbHZlZCBieSBtb3ZpbmcgCnViaWZzX2J1ZGdldF9zcGFjZSBiZWZvcmUg
dGhlIF9fdWJpZnNfc2V0X2FjbC4KMi4gSWYgdWJpZnNfd3JpdGVfaW5vZGUgZmFpbHMgb3IgYSBw
b3dlcmN1dCBoYXBwZW5zIGJldHdlZW4gCl9fdWJpZnNfc2V0X2FjbCBhbmQgdWJpZnNfd3JpdGVf
aW5vZGUsIGlub2RlLT5tb2RlIGJlY29tZXMgaW5jb25zaXN0ZW50IAp3aXRoIGFjbC4gUFM6IEV4
dDQgbWFrZXMgc2V0X2FjbCBhdG9taWMgYnkgJ2hhbmRsZScuCj4gKwo+ICsJcmV0dXJuIGVycm9y
Owo+ICsKPiArfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
