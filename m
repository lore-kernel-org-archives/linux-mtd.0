Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6368DC76196
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Apr 2023 04:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SjiN0CDZYAbhV10Ofhr3JDWNYyC1nB7LJyh4AKajqyU=; b=Q5WSIj9u56JXC4jrhjQXG6hGxK
	xhkqPRLlqQ0QzgJIIDnhtHkcM0uBJQQaiWj6VnTCjk9rcbO+ap7PY8NvnSrbFOECYoAM4lyJrA//A
	GOsNMIZ7TYBhzddMFey4Kjytm9Um0Y1v0TbcWK/K4XHvAEEVg9KDuGfilgghqkNHmaw2M+1F9h5Fr
	APV0fDV9TqDXBUk1JHUCjG0bEz5DHYmsXKjmMwetoCsgJ/fNTdfmKMouZjXx6/uoyp9Jbj9XvkxQq
	vC1jiywOh0vvkpNv/o6mQ9TjnMML3FtQEogGGqXIIH8StQ1S6DUTqWkQCOl2xDYw5+cJbEMY4PRLP
	JCLSwleQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjC1W-00E8ZD-1E;
	Mon, 03 Apr 2023 04:42:30 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjC1T-00E8Y1-0b
	for linux-mtd@lists.infradead.org;
	Mon, 03 Apr 2023 04:42:29 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4PqdSc1WrrzSkcZ;
	Mon,  3 Apr 2023 12:38:40 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 3 Apr 2023 12:42:22 +0800
Subject: Re: Two bug fix commit fixes in the ubi_resize_volume() were fixed by
 a patch in the mailing list
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: ZhaoLong Wang <wangzhaolong1@huawei.com>, <linux-mtd@lists.infradead.org>,
	Richard Weinberger <richard@nod.at>, "guoxuenan@huawei.com >> Guo Xuenan"
	<guoxuenan@huawei.com>
References: <20230403020402.2261218-1-wangzhaolong1@huawei.com>
 <f55c0db7-ef93-86ae-c4f9-476515358787@huawei.com>
Message-ID: <d1e8fb5b-d99c-0e02-5b53-3cecf45aeee9@huawei.com>
Date: Mon, 3 Apr 2023 12:42:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <f55c0db7-ef93-86ae-c4f9-476515358787@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_214227_393082_10B592DF 
X-CRM114-Status: GOOD (  18.33  )
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

PiBIaSwKPj4gSGkKPj4KPj4gwqDCoMKgwqAgTWFpbmxpbmUgZml4IGNvbW1pdCAxZTU5MWVhMDcy
ZGYgKCJ1Ymk6IEZpeCB1bnJlZmVyZW5jZWQgb2JqZWN0IAo+PiByZXBvcnRlZCBieSBrbWVtbGVh
ayBpbiB1YmlfcmVzaXplX3ZvbHVtZSgpIikKPj4KPj4gYW5kIDlhZjMxZDZlYzFhNCAoInViaTog
Rml4IHVzZS1hZnRlci1mcmVlIHdoZW4gdm9sdW1lIHJlc2l6aW5nIAo+PiBmYWlsZWQiKcKgIGlu
dm9sdmUgZml4aW5nIG1lbW9yeSBzZWN1cml0eSBpc3N1ZXMsIHdoaWNoCj4+Cj4+IHdlcmUgZml4
ZWQgYnkgYSBwYXRjaCBbMV0gKCJ1Ymk6IGZpeCBzbGFiLW91dC1vZi1ib3VuZHMgaW4gCj4+IHVi
aV9lYmFfZ2V0X2xkZXNjKzB4ZmIvMHgxMzAiKSB0aGF0IHdhcyBvbiB0aGUgbWFpbGluZyBsaXN0
Cj4+Cj4+IGluIDIwMjIuIEluIGFkZGl0aW9uIHRvIGZpeGluZyB0aGUgcmFjZSBpc3N1ZSwgSSB0
aGluayB0aGlzIGZpeCAKPj4ga2VlcGluZyBvbGRfZWJhX3RibCBtaWdodCBiZSBhIGJldHRlciBz
b2x1dGlvbiB0byB0aGUgVUFGCj4+Cj4+IHByb2JsZW0uCj4+Cj4+Cj4+IMKgwqDCoMKgIEknZCBs
aWtlIHRvIGtub3cgd2h5IHBhdGNoWzFdIGRpZG4ndCBnZXQgaW50byB0aGUgbWFpbmxpbmUuCj4+
Cj4+IFsxXSAKPj4gaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXgtbXRk
L3BhdGNoLzIwMjIwMTI0MDI0MDU2LjE5OTY3NjMtMS1ndW94dWVuYW5AaHVhd2VpLmNvbS8gCj4+
Cj4gCj4gSSBmaW5kIHRoZXJlIHdlcmUgdGhyZWUgcHJvYmxlbXMgaW4gdWJpX3Jlc2l6ZV92b2x1
bWUoKToKPiAKPiAxLiBNZW1sZWFrwqAgLSBmaXhlZCBieSAxZTU5MWVhMDcyZGYgKCJ1Ymk6IEZp
eCB1bnJlZmVyZW5jZWQgb2JqZWN0IAo+IHJlcG9ydGVkIGJ5IGttZW1sZWFrIGluIHViaV9yZXNp
emVfdm9sdW1lKCkiKQo+IDIuIFVBRiBpbiBlcnJvciBoYW5kbGluZyBwYXRowqAgLSBmaXhlZCBi
eSA5YWYzMWQ2ZWMxYTQgKCJ1Ymk6IEZpeCAKPiB1c2UtYWZ0ZXItZnJlZSB3aGVuIHZvbHVtZSBy
ZXNpemluZyBmYWlsZWQiKQo+IDMuIFVBRiBpbiBjb25jdXJyZW50IHNocmluZyB2b2x1bWUgYW5k
IHdyaXRpbmcgCj4gZmFzdG1hcCh2b2wtPnJlc2VydmVkX3BlYnMgaXRlcmF0aW9uKcKgIC0gZml4
ZWQgYnkgWzFdCj4gNC4gUG90ZW50aW9uYWwgZGF0YSBsb3N0IGluIGZhaWxlZCBzaHJpbmtpbmco
ZmFpbGVkIGFmdGVyIHVubWFwcGluZyAKPiBsZWJzKcKgIC0gbWVudGlvbmVkIGluIFsxXSwgd2hp
Y2ggaXMgbm90IGEgYmlnIHByb2JsZW0sIHdlIGNhbiBhZGQgc29tZSAKPiBjb21tZW50cyB0byBl
eHBsYWluIGl0Lgo+IDUuIFRvbyBtYW55IGxlYnMgdXNlZCBpZiBleHBhbmRpbmcgdm9sdW1lIGZh
aWxlZCBhZnRlciBbMV0gYXBwbGllZDoKPiBJZiB3ZSB1cGRhdGUgdm9sLT5yZXNlcnZlZF9wZWJz
IHRvZ2V0aGVyIHdpdGggdm9sLT5lYmFfdGJsLCB0aGVuIG90aGVyIAo+IHdyaXRpbmcgcHJvY2Vz
cyBjb3VsZCB0YWtlIGxudW0gYmlnZ2VyIHRoYW4gb2xkIHZvbC0+cmVzZXJ2ZWRfcGVicy4gCj4g
VGhlcmUgd2lsbCBiZSB6b21iaWUgbG9naWNhbCBwZWJzKGxudW0gZ3JlYXRlciB0aGFuIHZvbC0+
cmVzZXJ2ZWRfcGVicywgCj4gY291bGQgbm90IGJlIGFjY2Vzc2VkIG9yIHJlY2xhaW1lZCkgaWYg
cmVzaXppbmcgZmFpbGVkLgo+IE1heWJlIHdlIHNob3VsZCBmaXggdGhhdCBieSBob2xkaW5nICds
ZWJfd3JpdGVfbG9jaycgd2hpbGUgZXhwYW5kaW5nIAo+IHZvbHVtZT8KClByb2JsZW0gNSBjYW5u
b3QgaGFwcGVuZWQsIHViaSByZXNpemVzIHZvbHVtZSB3aXRoIFVCSV9FWENMVVNJVkUgdm9sdW1l
IApsb2NrLCBzbyB0aGVyZSBjb3VsZCBub3QgZXhpc3Qgb3RoZXIgcHJvY2VzcyBvcGVuaW5nIHRo
ZSBzYW1lIHZvbHVtZSBpbiAKd3JpdGUgbW9kZS4KCj4gNi4gSW4gZXJyb3IgaGFuZGxpbmcgcGF0
aCAnb3V0X2FjYycsIFVCSSBzaG91bGQgcmVjb3ZlciAndWJpLT5yc3ZkX3BlYnMnCj4gYW5kICd1
YmktPmF2YWlsX3BlYnMnIGluICdwZWJzID4gMCcgY2FzZSwgb3RoZXJ3aXNlIFVCSSB3aWxsIGRp
c3BsYXkgCj4gd3JvbmcgYXZhaWxhYmxlIHBlYiBjb3VudC4KPiAKPiBSaWNoYXJkLCBIb3cgZG8g
eW91IHRoaW5rPwo+IAo+IFsxXSAKPiBodHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVj
dC9saW51eC1tdGQvcGF0Y2gvMjAyMjAxMjQwMjQwNTYuMTk5Njc2My0xLWd1b3h1ZW5hbkBodWF3
ZWkuY29tLyAKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKPiBodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8KPiAuCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
