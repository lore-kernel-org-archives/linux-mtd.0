Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0603CE7A8E
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 09:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58h1euwTBweLUMoOsH+SpyDpIJ4/K+Ft+RlSywlvLuE=; b=ukHyTxQd+k0bhqg1K1XVBQn/7F
	w44/YmKLcr70Z14Fu3Nkqlqm++HB7PnUtmuu4DXUP8gL6T5gQiZSbgjfEi3mccEX+EK1/AWqwU7A6
	lXWWe55h6lqSeo4xrmlue8SFD/TrSm0WtbZo09oWrHOOS/g1F4N+qbklt7qRy6m7MP1mpLpEKTbV3
	yLQQCunj+k7Xo3imCDYBAvH5y+90ZPM+Zys35avFH4IsnQ24sToN3GByW6UPtPYepYW0KmmKMq8fk
	W7Z8O54EQZOXBv18vPyZ/Yjt4FzkSbMBhfcT1jWXPxn7ic5+PJNUpXy/gBq/lX1pxxqQz5brXR7rG
	2ar97/6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJq3M-0000000BuXB-3GJZ;
	Fri, 14 Nov 2025 09:25:12 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJq3I-0000000BuWe-3bXg
	for linux-mtd@lists.infradead.org;
	Fri, 14 Nov 2025 09:25:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=mXh3Sg/4VNzp1O6p81BjeKu9TXpJqfmqBMy49wEQ4PQ=;
	b=GPvyvqkp0Bf2FT2aU1FNuN1NVIU9GgNgWLhQOnj8Jbbi4IZFlm1M4ztmxbcNXwrZLc7OOnXAI
	KbEOlp1QsPg24b4S0yunTdrjmsQzfzcUMeLh7paNKOwRoVkKR0i/euvuoPhiQ5z3BoWmuEYnQqM
	LNjMLejT9nOt+/ZWNfB/8js=
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4d7BX03KGGznTYS;
	Fri, 14 Nov 2025 17:23:28 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id BB0211A0188;
	Fri, 14 Nov 2025 17:24:58 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 14 Nov 2025 17:24:57 +0800
Subject: Re: [PATCH v2 1/1] mtd: ubi: skip programming unused bits in ubi
 headers
To: Cheng Ming Lin <linchengming884@gmail.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>
CC: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <alvinzhou@mxic.com.tw>, <leoyu@mxic.com.tw>,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20251114024452.2927429-1-linchengming884@gmail.com>
 <20251114024452.2927429-2-linchengming884@gmail.com>
 <87qzu1f218.fsf@bootlin.com>
 <CAAyq3SYtJOZFwSY-UBfd+SwsSBV_1SPBMACCi1JCoCV-khVe6w@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <a6acb300-7333-d3b6-f1c5-f0ad5d6c744b@huawei.com>
Date: Fri, 14 Nov 2025 17:24:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAAyq3SYtJOZFwSY-UBfd+SwsSBV_1SPBMACCi1JCoCV-khVe6w@mail.gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_012509_561382_4020C3F9 
X-CRM114-Status: GOOD (  16.54  )
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

5ZyoIDIwMjUvMTEvMTQgMTY6NDcsIENoZW5nIE1pbmcgTGluIOWGmemBkzoKPiBIaSBNaXF1ZWws
Cj4gCj4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8IDIwMjXl
ubQxMeaciDE05pelIOmAseS6lCDkuIvljYg0OjMx5a+r6YGT77yaCj4+Cj4+IEhpIENoZW5nIE1p
bmcsCj4+Cj4+PiBAQCAtMTE1MCw2ICsxMTUyLDE0IEBAIGludCB1YmlfaW9fd3JpdGVfdmlkX2hk
cihzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBpbnQgcG51bSwKPj4+ICAgICAgICAgICAgICAgIHJl
dHVybiAtRVJPRlM7Cj4+PiAgICAgICAgfQo+Pj4KPj4+ICsgICAgIGlmICh1YmktPnZpZF9oZHJf
c2hpZnQpIHsKPj4+ICsgICAgICAgICAgICAgbWVtc2V0KChjaGFyICopcCwgMHhGRiwgdWJpLT52
aWRfaGRyX3NoaWZ0KTsKPj4+ICsgICAgICAgICAgICAgbWVtc2V0KChjaGFyICopcCArIHViaS0+
dmlkX2hkcl9zaGlmdCArIFVCSV9WSURfSERSX1NJWkUsIDB4RkYsCj4+PiArICAgICAgICAgICAg
ICAgICAgICB1YmktPnZpZF9oZHJfYWxzaXplIC0gKHViaS0+dmlkX2hkcl9zaGlmdCArIFVCSV9W
SURfSERSX1NJWkUpKTsKPj4+ICsgICAgIH0gZWxzZSB7Cj4+PiArICAgICAgICAgICAgIG1lbXNl
dCgoY2hhciAqKXAgKyBVQklfVklEX0hEUl9TSVpFLCAweEZGLCB1YmktPnZpZF9oZHJfYWxzaXpl
IC0gVUJJX1ZJRF9IRFJfU0laRSk7Cj4+PiArICAgICB9Cj4+PiArCj4+Cj4+IElzIGl0IG5vdCBw
b3NzaWJsZSB0byBtZW1zZXQoKSB0aGUgYnVmZmVyIGJlZm9yZSB3cml0aW5nIHRoZSBWSUQgaGVh
ZGVyPwo+PiBJIGhhdmVuJ3QgZm91bmQgcXVpY2tseSBhIGdvb2QgcGxhY2UgdG8gZG8gdGhhdCwg
c28gaW4gYW55IGNhc2UsCj4gCj4gSWYgd2Ugd2FudCB0byBtZW1zZXQoKSB0aGUgYnVmZmVyIGJl
Zm9yZSB3cml0aW5nIHRoZSBWSUQgaGVhZGVyLCBvbmUKPiBwb3NzaWJsZSBvcHRpb24gaXMgdG8g
bW9kaWZ5IHViaV9pbml0X3ZpZF9idWYoKSBpbgo+IGRyaXZlcnMvbXRkL3ViaS91YmkuaC4KClRo
ZSB1YmlfaW5pdF92aWRfYnVmKCkgaXMgY2FsbGVkIGluIG1hbnkgcmVhZGluZyBwcm9jZXNzZXMs
IHRoZSBzb2x1dGlvbiAKaW1wcm92ZXMgZmxhc2ggd2VhcmluZyBmb3Igd3JpdGUgc2l0dWF0aW9u
LCBzbyBJIHRoaW5rIGRvaW5nIG1lbXNldCBpbiAKdWJpX2lvX3dyaXRlX3ZpZF9oZHIoKSBpcyBm
aW5lLgo+IAo+IFNwZWNpZmljYWxseSwgd2UgY291bGQgcmVwbGFjZSB0aGUgZXhpc3RpbmcKPiBt
ZW1zZXQoYnVmLCAwLCB1YmktPnZpZF9oZHJfYWxzaXplKSBpbnNpZGUgdGhlICJpZiAoYnVmKSIg
YmxvY2sgd2l0aAo+IG1lbXNldChidWYsIDB4ZmYsIHViaS0+dmlkX2hkcl9hbHNpemUpLiBBZnRl
ciB0aGUgVklEIGhlYWRlcgo+IHBvc2l0aW9uIGhhcyBiZWVuIGRldGVybWluZWQsIHdlIGNhbiB0
aGVuIGFwcGx5IGEgc2Vjb25kIG1lbXNldCgpIG9uCj4gdmlkaC0+aGRyIHRvIHplcm8taW5pdGlh
bGl6ZSBVQklfVklEX0hEUl9TSVpFLiBUaGlzIGFwcHJvYWNoIHNob3VsZAo+IHByb3ZpZGUgdGhl
IHNhbWUgZWZmZWN0IHdoaWxlIGVuc3VyaW5nIHRoYXQgYWxsIGZpZWxkcyBpbnNpZGUgdGhlIFZJ
RAo+IGhlYWRlciBhcmUgcHJvcGVybHkgaW5pdGlhbGl6ZWQgdG8gemVyby4KPiAKPiBEb2VzIHRo
aXMgbWFrZSBzZW5zZSB0byB5b3U/IElmIHRoaXMgZGlyZWN0aW9uIGlzIHByZWZlcmFibGUsIEkg
Y2FuCj4gcHJlcGFyZSBhIHYzIHJlZmxlY3RpbmcgdGhpcyBjaGFuZ2UsIGFuZCBJIHdpbGwgYWxz
byBydW4gdWJpLXRlc3RzIHRvCj4gdmVyaWZ5IHRoZSBiZWhhdmlvci4gVGhhbmtzIQo+IAo+Pgo+
PiBSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4K
Pj4KPj4gVGhhbmtzLAo+PiBNaXF1w6hsCj4gCj4gVGhhbmtzLAo+IENoZW5nIE1pbmcgTGluCj4g
Lgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
