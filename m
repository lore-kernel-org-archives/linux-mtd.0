Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98164D73EAA
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jan 2026 01:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7W108AT2rEX9BtSaSKBDv1tCJ1mEOs0N87o5ODDqzDI=; b=ic2hBblz3Mz+IakZTzV+BeHnDK
	Mp0AUUIg1NDKaIuBNLyzA1mj3i+fN9DaV3r+dKgF1wX2uRUkSz0Lwy5jYHIshqVPQqgJ2Y/TkSMAL
	0YkgtvGDhjEqfewGeRXCVmP8zOkD3DzIAtoIrpVi+Htt+XO8wXH2B13gAxrE419qAR1pKprs6tU0u
	BPyUNSzVA7S81iV5z02S2KjX3AvXz78p2FLdd4F20mecVshqoe7xAKeqe3+3ibPJPt4zlBUn5u5P+
	T3SFkW2ww1k9BWKlOCW0cQyhYZPlqBlRD+9jw9zksp6P9d3oJTgBdcjodbZwQS08RcjNhCjU8AGTm
	phPlbkCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vld3u-00000000qPW-40UB;
	Fri, 30 Jan 2026 01:12:38 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vld3r-00000000qOh-2FBJ
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jan 2026 01:12:37 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ahKZQMBWOj9K9jNOvEy18zKOHHsK3BiLR9choHccyBM=;
	b=PjTtxiFDrGWdEKxqrlyHHqBdGWAjMv2e/iT90vlAy++62ISI47ZC2Fr9YgAlmx/otv8S9743m
	vq+ma41S6tI7swK0KmzKfaqwi/rE4PJH2uvlLHm58F69XYivuSdvkBmAJuCJROTxj7yRzBLnhcY
	4cuOYbDTgdB1JnVgxwmS3co=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4f2HvH34vWz12LfP;
	Fri, 30 Jan 2026 09:08:27 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id B3C9740538;
	Fri, 30 Jan 2026 09:12:20 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 30 Jan 2026 09:12:19 +0800
Subject: Re: [PATCH] ubi: ubi.h: fix kernel-doc warnings
To: Randy Dunlap <rdunlap@infradead.org>, <linux-kernel@vger.kernel.org>
CC: Richard Weinberger <richard@nod.at>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>
References: <20260128062434.400750-1-rdunlap@infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <32bed230-4089-92e5-da7a-19741153d19f@huawei.com>
Date: Fri, 30 Jan 2026 09:12:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20260128062434.400750-1-rdunlap@infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_171236_212919_2DBB9D61 
X-CRM114-Status: GOOD (  20.04  )
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

1NogMjAyNi8xLzI4IDE0OjI0LCBSYW5keSBEdW5sYXAg0LS1wDoKPiBGaXggYWxsIGRlZmF1bHQg
d2FybmluZyBsZXZlbCBrZXJuZWwtZG9jIHdhcm5pbmdzIGluIHViaS5oOgo+IAo+IFdhcm5pbmc6
IGRyaXZlcnMvbXRkL3ViaS91YmkuaDoxNzYgc3RydWN0IG1lbWJlciAndScgbm90IGRlc2NyaWJl
ZCBpbiAndWJpX3dsX2VudHJ5Jwo+IFdhcm5pbmc6IGRyaXZlcnMvbXRkL3ViaS91YmkuaDozNzAg
c3RydWN0IG1lbWJlciAnaXNfZGVhZCcgbm90IGRlc2NyaWJlZCBpbiAndWJpX3ZvbHVtZScKPiBX
YXJuaW5nOiBkcml2ZXJzL210ZC91YmkvdWJpLmg6NjU1IHN0cnVjdCBtZW1iZXIgJ2lzX2RlYWQn
IG5vdCBkZXNjcmliZWQgaW4gJ3ViaV9kZXZpY2UnCj4gV2FybmluZzogZHJpdmVycy9tdGQvdWJp
L3ViaS5oOjc0MyBiYWQgbGluZTogYWxsIGV4aXN0aW5nIEZhc3RtYXAgZGF0YSBzdHJ1Y3R1cmVz
Cj4gV2FybmluZzogZHJpdmVycy9tdGQvdWJpL3ViaS5oOjc4MyBzdHJ1Y3QgbWVtYmVyICd2aWRi
JyBub3QgZGVzY3JpYmVkIGluICd1YmlfYXR0YWNoX2luZm8nCj4gV2FybmluZzogZHJpdmVycy9t
dGQvdWJpL3ViaS5oOjEwOTggZXhwZWN0aW5nIHByb3RvdHlwZSBmb3IgdWJpX2luaXRfdmlkX2J1
ZigpLgo+ICAgUHJvdG90eXBlIHdhcyBmb3IgdWJpX2FsbG9jX3ZpZF9idWYoKSBpbnN0ZWFkCj4g
Cj4gU2lnbmVkLW9mZi1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+Cj4g
LS0tCj4gQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Cj4gQ2M6IFpoaWhh
byBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gQ2M6IE1pcXVlbCBSYXluYWwgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gQ2M6IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25l
c2hyQHRpLmNvbT4KPiBDYzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPiAKPiAgIGRy
aXZlcnMvbXRkL3ViaS91YmkuaCB8ICAgIDkgKysrKysrLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVu
ZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gCj4gLS0tIGxpbnV4LW5leHQtMjAyNjAxMjYu
b3JpZy9kcml2ZXJzL210ZC91YmkvdWJpLmgKPiArKysgbGludXgtbmV4dC0yMDI2MDEyNi9kcml2
ZXJzL210ZC91YmkvdWJpLmgKPiBAQCAtMTYwLDYgKzE2MCw3IEBAIHN0cnVjdCB1YmlfdmlkX2lv
X2J1ZiB7Cj4gICAgKiBzdHJ1Y3QgdWJpX3dsX2VudHJ5IC0gd2Vhci1sZXZlbGluZyBlbnRyeS4K
PiAgICAqIEB1LnJiOiBsaW5rIGluIHRoZSBjb3JyZXNwb25kaW5nIChmcmVlL3VzZWQpIFJCLXRy
ZWUKPiAgICAqIEB1Lmxpc3Q6IGxpbmsgaW4gdGhlIHByb3RlY3Rpb24gcXVldWUKPiArICogQHU6
IHVuaW9uIG9mIHJiX25vZGUgYW5kIGxpc3RfaGVhZAo+ICAgICogQGVjOiBlcmFzZSBjb3VudGVy
Cj4gICAgKiBAcG51bTogcGh5c2ljYWwgZXJhc2VibG9jayBudW1iZXIKPiAgICAqCj4gQEAgLTI4
Miw2ICsyODMsNyBAQCBzdHJ1Y3QgdWJpX2ViYV9sZWJfZGVzYyB7Cj4gICAgKiBAd3JpdGVyczog
bnVtYmVyIG9mIHVzZXJzIGhvbGRpbmcgdGhpcyB2b2x1bWUgaW4gcmVhZC13cml0ZSBtb2RlCj4g
ICAgKiBAZXhjbHVzaXZlOiB3aGV0aGVyIHNvbWVib2R5IGhvbGRzIHRoaXMgdm9sdW1lIGluIGV4
Y2x1c2l2ZSBtb2RlCj4gICAgKiBAbWV0YW9ubHk6IHdoZXRoZXIgc29tZWJvZHkgaXMgYWx0ZXJp
bmcgb25seSBtZXRhIGRhdGEgb2YgdGhpcyB2b2x1bWUKPiArICogQGlzX2RlYWQ6IHByZXZlbnRz
IHRha2luZyBhIHJlZmVyZW5jZSB0byB0aGUgdm9sdW1lCj4gICAgKgo+ICAgICogQHJlc2VydmVk
X3BlYnM6IGhvdyBtYW55IHBoeXNpY2FsIGVyYXNlYmxvY2tzIGFyZSByZXNlcnZlZCBmb3IgdGhp
cyB2b2x1bWUKPiAgICAqIEB2b2xfdHlwZTogdm9sdW1lIHR5cGUgKCVVQklfRFlOQU1JQ19WT0xV
TUUgb3IgJVVCSV9TVEFUSUNfVk9MVU1FKQo+IEBAIC00NDksNiArNDUxLDcgQEAgc3RydWN0IHVi
aV9kZWJ1Z19pbmZvIHsKPiAgICAqICAgICAgICAgICAgICAgIEB2b2wtPmViYV90YmwuCj4gICAg
KiBAcmVmX2NvdW50OiBjb3VudCBvZiByZWZlcmVuY2VzIG9uIHRoZSBVQkkgZGV2aWNlCj4gICAg
KiBAaW1hZ2Vfc2VxOiBpbWFnZSBzZXF1ZW5jZSBudW1iZXIgcmVjb3JkZWQgb24gRUMgaGVhZGVy
cwo+ICsgKiBAaXNfZGVhZDogcHJldmVudHMgdGFraW5nIGEgcmVmZXJlbmNlIHRvIHRoZSB2b2x1
bWUKPiAgICAqCj4gICAgKiBAcnN2ZF9wZWJzOiBjb3VudCBvZiByZXNlcnZlZCBwaHlzaWNhbCBl
cmFzZWJsb2Nrcwo+ICAgICogQGF2YWlsX3BlYnM6IGNvdW50IG9mIGF2YWlsYWJsZSBwaHlzaWNh
bCBlcmFzZWJsb2Nrcwo+IEBAIC03NDEsNyArNzQ0LDcgQEAgc3RydWN0IHViaV9haW5mX3ZvbHVt
ZSB7Cj4gICAgKiBAaGlnaGVzdF92b2xfaWQ6IGhpZ2hlc3Qgdm9sdW1lIElECj4gICAgKiBAaXNf
ZW1wdHk6IGZsYWcgaW5kaWNhdGluZyB3aGV0aGVyIHRoZSBNVEQgZGV2aWNlIGlzIGVtcHR5IG9y
IG5vdAo+ICAgICogQGZvcmNlX2Z1bGxfc2NhbjogZmxhZyBpbmRpY2F0aW5nIHdoZXRoZXIgd2Ug
bmVlZCB0byBkbyBhIGZ1bGwgc2NhbiBhbmQgZHJvcAo+IC0JCSAgICAgYWxsIGV4aXN0aW5nIEZh
c3RtYXAgZGF0YSBzdHJ1Y3R1cmVzCj4gKyAqCQkgICAgIGFsbCBleGlzdGluZyBGYXN0bWFwIGRh
dGEgc3RydWN0dXJlcwo+ICAgICogQG1pbl9lYzogbG93ZXN0IGVyYXNlIGNvdW50ZXIgdmFsdWUK
PiAgICAqIEBtYXhfZWM6IGhpZ2hlc3QgZXJhc2UgY291bnRlciB2YWx1ZQo+ICAgICogQG1heF9z
cW51bTogaGlnaGVzdCBzZXF1ZW5jZSBudW1iZXIgdmFsdWUKPiBAQCAtNzUwLDcgKzc1Myw3IEBA
IHN0cnVjdCB1YmlfYWluZl92b2x1bWUgewo+ICAgICogQGVjX2NvdW50OiBhIHRlbXBvcmFyeSB2
YXJpYWJsZSB1c2VkIHdoZW4gY2FsY3VsYXRpbmcgQG1lYW5fZWMKPiAgICAqIEBhZWJfc2xhYl9j
YWNoZTogc2xhYiBjYWNoZSBmb3IgJnN0cnVjdCB1YmlfYWluZl9wZWIgb2JqZWN0cwo+ICAgICog
QGVjaDogdGVtcG9yYXJ5IEVDIGhlYWRlci4gT25seSBhdmFpbGFibGUgZHVyaW5nIHNjYW4KPiAt
ICogQHZpZGg6IHRlbXBvcmFyeSBWSUQgYnVmZmVyLiBPbmx5IGF2YWlsYWJsZSBkdXJpbmcgc2Nh
bgo+ICsgKiBAdmlkYjogdGVtcG9yYXJ5IFZJRCBidWZmZXIuIE9ubHkgYXZhaWxhYmxlIGR1cmlu
ZyBzY2FuCj4gICAgKgo+ICAgICogVGhpcyBkYXRhIHN0cnVjdHVyZSBjb250YWlucyB0aGUgcmVz
dWx0IG9mIGF0dGFjaGluZyBhbiBNVEQgZGV2aWNlIGFuZCBtYXkKPiAgICAqIGJlIHVzZWQgYnkg
b3RoZXIgVUJJIHN1Yi1zeXN0ZW1zIHRvIGJ1aWxkIGZpbmFsIFVCSSBkYXRhIHN0cnVjdHVyZXMs
IGZ1cnRoZXIKPiBAQCAtMTA5MCw3ICsxMDkzLDcgQEAgc3RhdGljIGlubGluZSB2b2lkIHViaV9p
bml0X3ZpZF9idWYoY29ucwo+ICAgfQo+ICAgCj4gICAvKioKPiAtICogdWJpX2luaXRfdmlkX2J1
ZiAtIEFsbG9jYXRlIGEgVklEIGJ1ZmZlcgo+ICsgKiB1YmlfYWxsb2NfdmlkX2J1ZiAtIEFsbG9j
YXRlIGEgVklEIGJ1ZmZlcgo+ICAgICogQHViaTogdGhlIFVCSSBkZXZpY2UKPiAgICAqIEBnZnBf
ZmxhZ3M6IEdGUCBmbGFncyB0byB1c2UgZm9yIHRoZSBhbGxvY2F0aW9uCj4gICAgKi8KPiAuCj4g
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
