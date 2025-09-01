Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB784CA1009
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 16:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fq1Ncwk86jRjr3JAiZZaHveWV85A99qPApGLj8bi0rM=; b=vFWzjDtH/qpx9WhBrETd5vwoxI
	LArVZNsPiCUzkFG+ONhRfj1iGJJxkFOc76M5R6dEAzdNwPL72dnDg103OB8lRA1+NHewJCoPL+dmy
	Ro3pjiVwX5JWw2nvThqHjL03UceJRgwlxQ92otVXEz61dkDHrbCfhIgEYiiApUIS72vF7kvkNK7wE
	0xkabaQty+lGLCfs6pogdURKo4/a2tI2tndciwzCZg0h1h7HqoZwVrsB20XHU9CWB89MJ8VFVMzHo
	Hw1d7+tWoiQfLrRlyH3ht/fAyqrZvCr/vmvDISFJW2YSYWtZHlnB4ZSgHWISq6EhNKTtTJpTPeMy1
	TN0rIGlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7VM-0000000DGu4-02HW;
	Mon, 01 Sep 2025 16:35:40 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3q5-0000000CYdg-0bt4
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 12:40:51 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4cFpJS4mD4zdcFZ;
	Mon,  1 Sep 2025 20:36:08 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 1B36C1401F2;
	Mon,  1 Sep 2025 20:40:37 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 1 Sep 2025 20:40:36 +0800
Subject: Re: [bug report] mtd: bad block counter inflated when repeatedly
 marking the same block
To: Wang Zhaolong <wangzhaolong@huaweicloud.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
CC: <yi.zhang@huawei.com>, <yangerkun@huawei.com>
References: <ef573188-9815-4a6b-bad1-3d8ff7c9b16f@huaweicloud.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <3ac8c8e7-df84-5595-86df-23064a1c64f8@huawei.com>
Date: Mon, 1 Sep 2025 20:40:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ef573188-9815-4a6b-bad1-3d8ff7c9b16f@huaweicloud.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_054049_484133_F6CE8A33 
X-CRM114-Status: GOOD (  19.05  )
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

5ZyoIDIwMjUvOS8xIDE3OjI2LCBXYW5nIFpoYW9sb25nIOWGmemBkzoKPiBIaSBhbGwsCj4gCj4g
SeKAmWQgbGlrZSB0byByZXBvcnQgYSBtaXNtYXRjaCBiZXR3ZWVuIGJhZC1ibG9jayBzdGF0aXN0
aWNzIGFuZCBhY3R1YWwKPiBvbi1mbGFzaCBzdGF0ZSB3aGVuIHJlcGVhdGVkbHkgY2FsbGluZyBN
RU1TRVRCQURCTE9DSyBvbiB0aGUgc2FtZQo+IGVyYXNlYmxvY2suCj4gCj4gU3VtbWFyeQo+IC0g
UmVwZWF0ZWRseSBtYXJraW5nIHRoZSBzYW1lIGJsb2NrIGJhZCAoZS5nLiwgNSB0aW1lcykgbWFr
ZXMKPiAgwqAgL3N5cy9jbGFzcy9tdGQvbXRkWC9iYWRfYmxvY2tzIGluY3JlYXNlIGJ5IDUuCj4g
LSBBZnRlciByZWJvb3QswqAgdGhlIHN0YXRpc3RpY2FsIHZhbHVlIHR1cmUgdG8gdGhlIGNvcnJl
Y3QgdmFsdWUgb2YgMS4KPiAtIFNvIHRoZSBydW50aW1lIGNvdW50ZXIgKGVjY19zdGF0cy5iYWRi
bG9ja3MpIGlzIGluZmxhdGVkLgo+IAo+IFJlcHJvICh3aXRoIG5hbmRzaW0ua28pCj4gCj4gYGBg
YmFzaAo+ICMgSUQ9IjB4ZWMsMHhhMSwweDAwLDB4MTUiICMgMTI4TSAxMjhLQiAyS0IKPiAjIG1v
ZHByb2JlIG5hbmRzaW0gaWRfYnl0ZXM9JElECj4gIyB+L210ZC11dGlscy9tdGRfbWFya2JhZCAv
ZGV2L210ZDEgMTAgMSAjIFJlcGVhdCA1IHRpbWVzCj4gLi4uLi4uCj4gIyB+L210ZC11dGlscy9t
dGRfbWFya2JhZCAvZGV2L210ZDEgMTAgMQo+IAo+ICMgLS0gSXQgY2FuIGJlIG9ic2VydmVkIHRo
YXQgNSBiYWQgYmxvY2tzIHdpbGwgYXBwZWFyIGluIHRoZSBzdGF0aXN0aWNhbCAKPiBpbmZvcm1h
dGlvbi4KPiAjIGNhdCAvc3lzL2NsYXNzL210ZC9tdGQxL2JhZF9ibG9ja3MKPiA1Cj4gCj4gIyAt
LSBJbiBmYWN0LCB3ZSBjYW4gb25seSBzY2FuIDEgYmFkIGJsb2NrLgo+ICMgdWJpZm9ybWF0IC12
IC9kZXYvbXRkMcKgIHwgZ3JlcCAiYmFkIGVyYXNlYmxvY2siCj4gdWJpZm9ybWF0OiAxIGJhZCBl
cmFzZWJsb2NrcyBmb3VuZCwgbnVtYmVyczogMTAKPiBgYGAKPiAKPiBSb290IGNhdXNlIGFuYWx5
c2lzIChrZXJuZWwtc2lkZSkKPiAKPiBgYGAKPiBtdGRfYmxvY2tfbWFya2JhZAo+ICDCoCBtdGQt
Pl9ibG9ja19tYXJrYmFkKCkKPiAgwqDCoMKgIG5hbmRfYmxvY2tfbWFya2JhZAo+ICDCoMKgwqDC
oMKgIHJldCA9IG5hbmRfYmxvY2tfaXNiYWQKPiAgwqDCoMKgwqDCoCByZXR1cm4gMDsgLy8gcmV0
ID4gMAo+ICDCoCBtdGQtPmVjY19zdGF0cy5iYWRibG9ja3MrKzvCoCAvLyBObyBiYWQgYmxvY2tz
IHdhcyBtYXJrZWQgYnV0IHdhcyAKPiBjb3VudGVkLgo+IFJlbGV2YW50IGNvZGUKPiAtIGRyaXZl
cnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jOm5hbmRfYmxvY2tfbWFya2JhZCgpCj4gLSBkcml2
ZXJzL210ZC9tdGRjb3JlLmM6bXRkX2Jsb2NrX21hcmtiYWQoKQo+IGBgYAo+IAo+IG5hbmRfYmxv
Y2tfbWFya2JhZCgpIHJldHVybnMgMCBib3RoIGZvciDigJxuZXdseSBtYXJrZWTigJ0gYW5kIOKA
nGFscmVhZHkgYmFk4oCdLgo+IG10ZGNvcmUgY2Fubm90IHRlbGwgd2hldGhlciB0aGlzIGNhbGwg
YWN0dWFsbHkgYWRkZWQgYSBuZXcgYmFkIGJsb2NrLAo+IGJ1dCBzdGlsbCBpbmNyZW1lbnRzIGVj
Y19zdGF0cy5iYWRibG9ja3MuCj4gCj4gUG9zc2libGUgZml4ZXMgKGhpZ2ggbGV2ZWwpCj4gLSBD
b3JlLXNpZGUgY29uc2VydmF0aXZlIGZpeCAobWluaW1hbCBBQkkgY2hhbmdlKToKPiAgwqAgKiBJ
biBtdGRfYmxvY2tfbWFya2JhZCgpLCBwcm9iZSBfYmxvY2tfaXNiYWQobWFzdGVyLCBvZnMpIGJl
Zm9yZQo+ICDCoMKgwqAgY2FsbGluZyBfYmxvY2tfbWFya2JhZCgpLCBhbmQgKGlmIGF2YWlsYWJs
ZSkgcHJvYmUgYWdhaW4gYWZ0ZXIgCj4gc3VjY2Vzcy4KPiAgwqAgKiBPbmx5IGluY3JlbWVudCBl
Y2Nfc3RhdHMuYmFkYmxvY2tzIGlmIHRoZSBzdGF0ZSB0cmFuc2l0aW9uZWQgZnJvbQo+ICDCoMKg
wqAg4oCcZ29vZOKAnSB0byDigJxiYWTigJ0uCgpJTUhPLCB0aGUgcmV0dXJuIHZhbHVlIG9mIF9i
bG9ja19tYXJrYmFkKCkgaXMgdXNlZCB0byBpZGVudGlmeSB3aGV0aGVyIAp0aGUgYmxvY2sgYmVj
b21lcyBiYWQgc3VjY2Vzc2Z1bGx5IGFmdGVyIHRoZSBvcGVyYXRpb24sIHRoZSBleHRyYSAKbWVz
c2FnZShlZy4gd2hldGhlciB0aGUgYmxvY2sgaXMgYWxyZWFkeSBiYWQgb3IgbmV3bHkgbWFya2Vk
IGFzIGJhZCkgCmNvdWxkIGJlIHBhc3NlZCBvdXQgZnJvbSBhIHBvaW50ZXItdHlwZSBmdW5jdGlv
biBwYXJhbWV0ZXIuClNpbmNlIHRoZXJlIGlzIG9ubHkgb25lIHBsYWNlIChtdGRfYmxvY2tfbWFy
a2JhZCkgaW52b2tlcyB0aGUgCl9ibG9ja19tYXJrYmFkKCksIEkgcHJlZmVyIHRoZSBjb25zZXJ2
YXRpdmUoc2ltcGxlKSBmaXguCgo+IAo+IC0gVGVhY2ggKl9ibG9ja19tYXJrYmFkKCkgdG8gcmV0
dXJuIGEgZGlzdGluY3QgcG9zaXRpdmUgY29kZSBmb3IKPiAgwqAg4oCcYWxyZWFkeSBiYWTigJ0g
dnMg4oCcbmV3bHkgbWFya2Vk4oCdLCBzbyB0aGUgY29yZSBjYW4gaW5jcmVtZW50IG9ubHkgb24K
PiAgwqAg4oCcbmV3bHkgbWFya2Vk4oCdLgo+IAo+IFdoYXQgSSB3YW50IHRvIGtub3cgaXM6Cj4g
LSBXb3VsZCB0aGUgY29yZS1zaWRlIHByZS9wb3N0IF9ibG9ja19pc2JhZCBjaGVjayBiZSBhY2Nl
cHRhYmxlIGFzIGEgCj4gc2hvcnQtdGVybSBmaXg/Cj4gLSBBbnkgb2JqZWN0aW9ucyByZWdhcmRp
bmcgdGhlIGV4dHJhIGlzYmFkIElPIGluIHRoZSBtYXJrYmFkIHBhdGg/Cj4gLSBMb25nZXItdGVy
bSwgaXMgdGhlcmUgaW50ZXJlc3QgaW4gYW4gZXhwbGljaXQgQVBJL3JldHVybi1jb2RlIHNlbWFu
dGljcwo+ICDCoCB0byBkaWZmZXJlbnRpYXRlIOKAnGFscmVhZHkgYmFk4oCdIHZzIOKAnG5ld2x5
IG1hcmtlZOKAnT8KPiAKPiBJ4oCZbSB2ZXJ5IGludGVyZXN0ZWQgaW4gaGVscGluZyByZXNvbHZl
IHRoaXMgaXNzdWUgYW5kIHdvdWxkIGJlIGdyYXRlZnVsCj4gZm9yIGFueSBndWlkYW5jZSBvciBz
dWdnZXN0aW9ucy4KPiAKPiBCZXN0IHJlZ2FyZHMsCj4gV2FuZyBaaGFvbG9uZwo+IAo+IC4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
