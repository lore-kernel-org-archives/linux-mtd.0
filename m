Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BCCCF0430
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2024 02:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7DZbUvTg5bHz90GH5sIBoKAVxjfUjRhtkFmsugFTG0U=; b=Q/msskZq1o+0tMfS26doRVAW3H
	rOvwdvrOXpJyGnYawx+XGU2Vkbzg1u/IB7Wu+z2hD+/OW2sHTCySV9z6H7cwxdlIqgFq68OPnHLJ+
	czJioGCBoMC0i+IFgHEBhYxwCaKKzkSi0Cb+6cM/5TxLtH0MhI9c0nbkusDgNl8EyDGoCsfvzYCy9
	vts9NC8uoBagRAzgiI5RsSUBnAMge1z4ugfwPTbE+tDD4OFo0VsvxYXv4k4TqXQwXAdiGK4KERlvs
	v+C5y3kxDBE143k6Kfk+hy/gxRFOUjL6gFwlPd0+5kF+lk/W83toRZhCdKvLvqLZc1Ck5ZJKLu/mL
	kLHh5oIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syMNH-00000007hnL-2uwD;
	Wed, 09 Oct 2024 02:24:27 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syMM6-00000007hdk-01T0
	for linux-mtd@lists.infradead.org;
	Wed, 09 Oct 2024 02:23:16 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4XNc810qy0z1T8P4;
	Wed,  9 Oct 2024 10:21:21 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id F074F140133;
	Wed,  9 Oct 2024 10:23:03 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 9 Oct 2024 10:23:03 +0800
Subject: Re: [PATCH 1/1] ubifs: Try to recover from missing znode
To: Benedikt Spranger <b.spranger@linutronix.de>,
	<linux-kernel@vger.kernel.org>
CC: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>
References: <20241008133342.1937674-1-b.spranger@linutronix.de>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <0840be30-63bc-449d-a9a4-c4e6b54c8885@huawei.com>
Date: Wed, 9 Oct 2024 10:23:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241008133342.1937674-1-b.spranger@linutronix.de>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_192314_591383_7E541A48 
X-CRM114-Status: GOOD (  20.41  )
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

1NogMjAyNC8xMC84IDIxOjMzLCBCZW5lZGlrdCBTcHJhbmdlciDQtLXAOgo+IEFmdGVyIHBvd2Vy
Y3V0IG9uIGEgc3lzdGVtIHVzaW5nIHViaWZzIG1vdW50aW5nIGZhaWxlZDoKPiAKPiAyMDI0LTA5
LTMwVDEyOjM4OjI2Ljg4MDQ4NyswMjowMCBzb25qYSBrZXJuZWw6IFVCSUZTIGVycm9yICh1Ymkw
OjAgcGlkIDIxNzgpOiB1Ymlmc19yZWFkX25vZGUgW3ViaWZzXTogYmFkIG5vZGUgdHlwZSAoMjU1
IGJ1dCBleHBlY3RlZCA5KQo+IDIwMjQtMDktMzBUMTI6Mzg6MjYuODgwNTA2KzAyOjAwIHNvbmph
IGtlcm5lbDogVUJJRlMgZXJyb3IgKHViaTA6MCBwaWQgMjE3OCk6IHViaWZzX3JlYWRfbm9kZSBb
dWJpZnNdOiBiYWQgbm9kZSBhdCBMRUIgMTAzOjQ2OTIwLCBMRUIgbWFwcGluZyBzdGF0dXMgMAo+
IDIwMjQtMDktMzBUMTI6Mzg6MjYuODgwNTA5KzAyOjAwIHNvbmphIGtlcm5lbDogTm90IGEgbm9k
ZSwgZmlyc3QgMjQgYnl0ZXM6Cj4gMjAyNC0wOS0zMFQxMjozODoyNi44ODA1MTArMDI6MDAgc29u
amEga2VybmVsOiAwMDAwMDAwMDogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgICAgICAgICAgICAgICAgICAgICAg
ICAgIC4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLgo+IAo+IFdoaWxlIHRyYXZlcnNpbmcgb3ZlciB6
YnJhbmNoZXMgZHVyaW5nIHRoZSBqb3VybmFsIHJlcGxheSBvbmUgemJyYW5jaAo+IHBvaW50cyB0
byBhIHpub2RlLCB3aGljaCB3YXMgbm90IHdyaXR0ZW4gdG8gdGhlIGZsYXNoIGFuZCB0aGVyZWZv
cmUgdGhlCj4gZmxhc2ggaXMgZW1wdHkuCgpVQklGUyBndWFyYW50ZWVzIHR3byB0aGluZ3MgZm9y
IHpub2RlczoKMSkgYWxsIGluZGV4IG5vZGVzKGluIGNvbW1pdCBzZXEgTikgYXJlIHdyaXR0ZW4g
b24gZmxhc2ggYmVmb3JlIG1hc3RlciAKbm9kZXMoZm9yIGNvbW1pdCBzZXEgTikgYXJlIHdyaXR0
ZW4uCjIpIGFsbCBpbmRleCBub2RlcyhpbiBjb21taXQgc2VxIE4pIHdvbid0IGJlIGVyYXNlZCBm
cm9tIGZsYXNoIGJlZm9yZSAKbWFzdGVyIG5vZGVzKGZvciBjb21taXQgc2VxIE4rMSkgYXJlIHdy
aXR0ZW4uClNvLCBJIGRvbid0IHVuZGVyc3RhbmQgdGhhdCB3aHkgem5vZGVzIG5vdCBleGlzdCBk
dXJpbmcgam91cm5hbCByZXBsYXlpbmc/Cj4gCj4gVHJ5IHRvIHJlY292ZXIgZnJvbSB0aGF0IGJ5
IGluc2VydGluZyBhbiBlbXB0eSB6bm9kZSBpbnN0ZWFkIG9mIGZhaWxpbmcuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQmVuZWRpa3QgU3ByYW5nZXIgPGIuc3ByYW5nZXJAbGludXRyb25peC5kZT4KPiBS
ZXZpZXdlZC1ieTogSm9obiBPZ25lc3MgPGpvaG4ub2duZXNzQGxpbnV0cm9uaXguZGU+Cj4gLS0t
Cj4gICBmcy91Ymlmcy9pby5jICAgICAgIHwgMTYgKysrKysrKysrKysrKysrKwo+ICAgZnMvdWJp
ZnMvdG5jX21pc2MuYyB8ICA2ICsrKysrLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL2lvLmMgYi9m
cy91Ymlmcy9pby5jCj4gaW5kZXggMDFkOGViMTcwMzgyLi4wYmJiNDI2ZjkwMDYgMTAwNjQ0Cj4g
LS0tIGEvZnMvdWJpZnMvaW8uYwo+ICsrKyBiL2ZzL3ViaWZzL2lvLmMKPiBAQCAtMTExMCw2ICsx
MTEwLDIyIEBAIGludCB1Ymlmc19yZWFkX25vZGUoY29uc3Qgc3RydWN0IHViaWZzX2luZm8gKmMs
IHZvaWQgKmJ1ZiwgaW50IHR5cGUsIGludCBsZW4sCj4gICAJCXJldHVybiBlcnI7Cj4gICAKPiAg
IAlpZiAodHlwZSAhPSBjaC0+bm9kZV90eXBlKSB7Cj4gKwkJLyoKPiArCQkgKiBXaGlsZSByZWNv
dmVyaW5nLCB3ZSBtYXkgZmFjZSBsb3N0IGRhdGEgaS5lLiBlbXB0eSBmbGFzaC4KPiArCQkgKiBH
aXZlIGNhbGxzaXRlcyBhIGhpbnQgYnkgcmV0dXJuaW5nIC1FTk9EQVRBLgo+ICsJCSAqLwo+ICsJ
CWlmIChjLT5yZXBsYXlpbmcpIHsKPiArCQkJdTggKmIgPSBidWY7Cj4gKwo+ICsJCQlmb3IgKGwg
PSAwOyBsIDwgbGVuOyBsKyspIHsKPiArCQkJCWlmIChiW2xdICE9IDB4ZmYpCj4gKwkJCQkJYnJl
YWs7Cj4gKwkJCX0KPiArCQkJaWYgKGwgPT0gbGVuKSB7Cj4gKwkJCQl1Ymlmc19lcnJjKGMsICJu
byBub2RlLCBidXQgZW1wdHkgZmxhc2giKTsKPiArCQkJCXJldHVybiAtRU5PREFUQTsKPiArCQkJ
fQo+ICsJCX0KPiAgIAkJdWJpZnNfZXJyYyhjLCAiYmFkIG5vZGUgdHlwZSAoJWQgYnV0IGV4cGVj
dGVkICVkKSIsCj4gICAJCQkgICBjaC0+bm9kZV90eXBlLCB0eXBlKTsKPiAgIAkJZ290byBvdXQ7
Cj4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL3RuY19taXNjLmMgYi9mcy91Ymlmcy90bmNfbWlzYy5j
Cj4gaW5kZXggZDNmOGE2YWExZjQ5Li40ZDA4NWZjMTMwMGYgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJp
ZnMvdG5jX21pc2MuYwo+ICsrKyBiL2ZzL3ViaWZzL3RuY19taXNjLmMKPiBAQCAtMzAwLDcgKzMw
MCwxMSBAQCBzdGF0aWMgaW50IHJlYWRfem5vZGUoc3RydWN0IHViaWZzX2luZm8gKmMsIHN0cnVj
dCB1Ymlmc196YnJhbmNoICp6emJyLAo+ICAgCWVyciA9IHViaWZzX3JlYWRfbm9kZShjLCBpZHgs
IFVCSUZTX0lEWF9OT0RFLCBsZW4sIGxudW0sIG9mZnMpOwo+ICAgCWlmIChlcnIgPCAwKSB7Cj4g
ICAJCWtmcmVlKGlkeCk7Cj4gLQkJcmV0dXJuIGVycjsKPiArCQkvKgo+ICsJCSAqIFdoaWxlIHJl
Y292ZXJpbmcgd2UgbWF5IGZhY2UgYSBub24gd3JpdHRlbiB6bm9kZS4KPiArCQkgKiBJbmplY3Qg
YW4gZW1wdHkgem5vZGUgaW4gdGhpcyBjYXNlLgo+ICsJCSAqLwo+ICsJCXJldHVybiAoZXJyID09
IC1FTk9EQVRBKSA/IDAgOiBlcnI7Cj4gICAJfQo+ICAgCj4gICAJZXJyID0gdWJpZnNfbm9kZV9j
aGVja19oYXNoKGMsIGlkeCwgenpici0+aGFzaCk7Cj4gCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
