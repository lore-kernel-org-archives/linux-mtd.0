Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C24E7716C
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Dec 2024 01:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNGrSayxS8THNHU0yLnhgj1vEQpnfF+ZjjMQgcXEgWM=; b=xE0pZYgj3eKxDPEzT6qub6zYBX
	D91dz9TaCnjEjHFPkHHRDRpMGF4RWcv9AyN6x7ffCeX2b2aPhMO0wWaVt2sFkbQYZx4ZlG/q4yNB4
	EuDZ3/BkoqRqKbOU6rmu+7Ctd7AU2bay/hwpHBKMndgAz2scL5GPCD0BZsj1204O/Db4CS6l4GCxM
	/yFEUdmIlx9BIMv90pKgkFx7cI80ba1bSVa+loJxU7OAHb8UacqusOIYtg37oImv935xKAnRMyREM
	p3ryYNkZ/QIOfCUT75hN2oDWaoOAKfZVsxLnX5heofwT1Ii+dYjtZChuzSFU4plvcEMjRsI7HBw7u
	BrAsD2Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIeft-0000000BF8v-48xe;
	Wed, 04 Dec 2024 01:59:33 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIefq-0000000BF4d-3Sld
	for linux-mtd@lists.infradead.org;
	Wed, 04 Dec 2024 01:59:32 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Y30y43YDJz1k14H;
	Wed,  4 Dec 2024 09:57:00 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id A75ED1A0188;
	Wed,  4 Dec 2024 09:59:16 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 4 Dec 2024 09:59:15 +0800
Subject: Re: [PATCH v2 2/2] ubi: Implement ioctl for detailed erase counters
To: Richard Weinberger <richard@nod.at>, Rickard X Andersson
	<rickard.andersson@axis.com>
CC: linux-mtd <linux-mtd@lists.infradead.org>, rickard314 andersson
	<rickard314.andersson@gmail.com>, kernel <kernel@axis.com>
References: <20241127091050.1254359-1-rickard.andersson@axis.com>
 <20241127091050.1254359-2-rickard.andersson@axis.com>
 <149851565.29327533.1733252975843.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <9a8882db-0612-5082-3397-429add5803a8@huawei.com>
Date: Wed, 4 Dec 2024 09:59:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <149851565.29327533.1733252975843.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_175931_254396_5AF7918B 
X-CRM114-Status: GOOD (  24.25  )
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

5ZyoIDIwMjQvMTIvNCAzOjA5LCBSaWNoYXJkIFdlaW5iZXJnZXIg5YaZ6YGTOgo+IFJpY2thcmQs
Cj4gCj4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBWb246ICJSaWNrYXJkIFgg
QW5kZXJzc29uIiA8cmlja2FyZC5hbmRlcnNzb25AYXhpcy5jb20+Cj4+IEFuOiAicmljaGFyZCIg
PHJpY2hhcmRAbm9kLmF0PiwgImNoZW5nemhpaGFvMSIgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29t
PiwgImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwKPj4gInJpY2th
cmQzMTQgYW5kZXJzc29uIiA8cmlja2FyZDMxNC5hbmRlcnNzb25AZ21haWwuY29tPgo+PiBDQzog
IlJpY2thcmQgWCBBbmRlcnNzb24iIDxyaWNrYXJkLmFuZGVyc3NvbkBheGlzLmNvbT4sICJrZXJu
ZWwiIDxrZXJuZWxAYXhpcy5jb20+Cj4+IEdlc2VuZGV0OiBNaXR0d29jaCwgMjcuIE5vdmVtYmVy
IDIwMjQgMTA6MTA6NTAKPj4gQmV0cmVmZjogW1BBVENIIHYyIDIvMl0gdWJpOiBJbXBsZW1lbnQg
aW9jdGwgZm9yIGRldGFpbGVkIGVyYXNlIGNvdW50ZXJzCj4gCj4+IEN1cnJlbnRseSwgIm1heF9l
YyIgY2FuIGJlIHJlYWQgZnJvbSBzeXNmcywgd2hpY2ggcHJvdmlkZXMgYSBsaW1pdGVkCj4+IHZp
ZXcgb2YgdGhlIGZsYXNoIGRldmljZeKAmXMgd2Vhci4gSW4gY2VydGFpbiBjYXNlcywgc3VjaCBh
cyBidWdzIGluCj4+IHRoZSB3ZWFyLWxldmVsaW5nIGFsZ29yaXRobSwgc3BlY2lmaWMgYmxvY2tz
IGNhbiBiZSB3b3JuIGRvd24gbW9yZQo+PiB0aGFuIG90aGVycywgcmVzdWx0aW5nIGluIHVuZXZl
biB3ZWFyIGRpc3RyaWJ1dGlvbi4gQWxzbyBzb21lIHVzZSBjYXNlcwo+PiBjYW4gd2VhciB0aGUg
ZXJhc2UgYmxvY2tzIG9mIHRoZSBmYXN0bWFwIGFyZWEgbW9yZSBoZWF2aWx5IHRoYW4gb3RoZXIK
Pj4gcGFydHMgb2YgZmxhc2guCj4+IFByb3ZpZGluZyBkZXRhaWxlZCBlcmFzZSBjb3VudGVyIHZh
bHVlcyBnaXZlIGEgYmV0dGVyIHVuZGVyc3RhbmRpbmcgb2YKPj4gdGhlIG92ZXJhbGwgZmxhc2gg
d2VhciBhbmQgaXMgbmVlZGVkIHRvIGJlIGFibGUgdG8gY2FsY3VsYXRlIGZvciBleGFtcGxlCj4+
IGV4cGVjdGVkIGxpZmUgdGltZS4KPj4gVGhlcmUgZXhpc3RzIG1vcmUgZGV0YWlsZWQgaW5mbyBp
biBkZWJ1Z2ZzLCBidXQgdGhpcyBpbmZvcm1hdGlvbiBpcwo+PiBvbmx5IGF2YWlsYWJsZSBmb3Ig
ZGVidWcgYnVpbGRzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSaWNrYXJkIEFuZGVyc3NvbiA8cmlj
a2FyZC5hbmRlcnNzb25AYXhpcy5jb20+Cj4+IC0tLQo+PiBkcml2ZXJzL210ZC91YmkvY2Rldi5j
IHwgOTYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+IDEgZmls
ZSBjaGFuZ2VkLCA5NiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC91YmkvY2Rldi5jIGIvZHJpdmVycy9tdGQvdWJpL2NkZXYuYwo+PiBpbmRleCAwZDhmMDRjZjAz
YzUuLjY4MWNmODUyNmUyZiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvdWJpL2NkZXYuYwo+
PiArKysgYi9kcml2ZXJzL210ZC91YmkvY2Rldi5jCj4+IEBAIC04MjgsNiArODI4LDk2IEBAIHN0
YXRpYyBpbnQgcmVuYW1lX3ZvbHVtZXMoc3RydWN0IHViaV9kZXZpY2UgKnViaSwKPj4gCXJldHVy
biBlcnI7Cj4+IH0KPj4KPj4gKwo+PiArc3RhdGljIGludCB1YmlfZ2V0X2VjX2luZm8oc3RydWN0
IHViaV9kZXZpY2UgKnViaSwgc3RydWN0IHViaV9lY2luZm9fcmVxIF9fdXNlcgo+PiAqdXJlcSkK
Pj4gK3sKPj4gKwlzdHJ1Y3QgdWJpX2VjaW5mb19yZXEgcmVxOwo+PiArCXN0cnVjdCB1Ymlfd2xf
ZW50cnkgKndsOwo+PiArCWludCBpOwo+PiArCWludCBwZWI7Cj4+ICsJaW50IGVuZF9wZWI7Cj4+
ICsJaW50IGVyciA9IDA7Cj4+ICsJaW50IG1heF9lbGVtOwo+PiArCWludDMyX3QgKmVyYXNlX2Nv
dW50ZXJzOwo+PiArCj4+ICsJLyogQ29weSB0aGUgaW5wdXQgYXJndW1lbnRzICovCj4+ICsJZXJy
ID0gY29weV9mcm9tX3VzZXIoJnJlcSwgdXJlcSwgc2l6ZW9mKHN0cnVjdCB1YmlfZWNpbmZvX3Jl
cSkpOwo+PiArCWlmIChlcnIpIHsKPj4gKwkJZXJyID0gLUVGQVVMVDsKPj4gKwkJZ290byBvdXQ7
CgpIb3cgYWJvdXQgZGlyZWN0bHkgcmV0dXJuaW5nIGZ1bmN0aW9uPwo+PiArCX0KPj4gKwo+PiAr
CS8qIENoZWNrIGlucHV0IGFyZ3VtZW50cyAqLwo+PiArCWlmIChyZXEubGVuZ3RoIDw9IDAgfHwg
cmVxLnN0YXJ0IDwgMCkgewo+PiArCQllcnIgPSAtRUlOVkFMOwo+PiArCQlnb3RvIG91dDsKPj4g
Kwl9Cj4+ICsKPj4gKwltYXhfZWxlbSA9IHJlcS5sZW5ndGg7Cj4+ICsKPj4gKwkvKiBXZSBjYW4g
bm90IHJlYWQgbW9yZSB0aGFuIHRoZSB0b3RhbCBhbW91bnQgb2YgUEVCcyAqLwo+PiArCWlmICht
YXhfZWxlbSA+IHViaS0+cGViX2NvdW50KQo+PiArCQltYXhfZWxlbSA9IHViaS0+cGViX2NvdW50
Owo+PiArCj4+ICsJLyogQ2hlY2sgZm9yIG92ZXJmbG93ICovCj4+ICsJaWYgKHJlcS5zdGFydCAr
IG1heF9lbGVtIDwgcmVxLnN0YXJ0KSB7Cj4gCj4gWW91IGNhbiB1c2UgY2hlY2tfYWRkX292ZXJm
bG93KCkgb3IgYSBzaW1pbGFyIGhlbHBlci4KPiAKPj4gKwkJZXJyID0gLUVJTlZBTDsKPj4gKwkJ
Z290byBvdXQ7Cj4+ICsJfQo+PiArCj4+ICsJZXJhc2VfY291bnRlcnMgPSBrbWFsbG9jX2FycmF5
KG1heF9lbGVtLAo+PiArCQkJCSAgICAgICBzaXplb2YoaW50MzJfdCksCj4+ICsJCQkJICAgICAg
IEdGUF9LRVJORUwpOwo+IAo+IEkgZG9uJ3QgdGhpbmsgdGhpcyB0ZW1wb3JhbGx5IGJ1ZmZlciBp
cyBuZWVkZWQuCj4gRXNwZWNpYWxseSBzaW5jZSB0aGUgYWxsb2NhdGlvbiBpcyB1c2Vyc3BhY2Ug
Y29udHJvbGxlZCBhbmQgdW5ib3VuZCwKPiBpdCBjYW4gYmUgYSBwcm9ibGVtIGxhdGVyLgo+IAo+
PiArCWlmICghZXJhc2VfY291bnRlcnMpIHsKPj4gKwkJZXJyID0gLUVOT01FTTsKPj4gKwkJZ290
byBvdXQ7Cj4+ICsJfQo+PiArCj4+ICsJZW5kX3BlYiA9IHJlcS5zdGFydCArIG1heF9lbGVtOwo+
PiArCWlmIChlbmRfcGViID4gdWJpLT5wZWJfY291bnQpCj4+ICsJCWVuZF9wZWIgPSB1YmktPnBl
Yl9jb3VudDsKPj4gKwo+PiArCWkgPSAwOwo+PiArCWZvciAocGViID0gcmVxLnN0YXJ0OyBwZWIg
PCBlbmRfcGViOyBpKyssIHBlYisrKSB7Cj4+ICsJCWludCBlYzsKPj4gKwo+PiArCQlpZiAodWJp
X2lvX2lzX2JhZCh1YmksIHBlYikpIHsKPj4gKwkJCWVyYXNlX2NvdW50ZXJzW2ldID0gVUJJX1VO
S05PV047Cj4+ICsJCQljb250aW51ZTsKPj4gKwkJfQo+PiArCj4+ICsJCXNwaW5fbG9jaygmdWJp
LT53bF9sb2NrKTsKPj4gKwo+PiArCQl3bCA9IHViaS0+bG9va3VwdGJsW3BlYl07Cj4+ICsJCWlm
ICh3bCkKPj4gKwkJCWVjID0gd2wtPmVjOwo+PiArCQllbHNlCj4+ICsJCQllYyA9IFVCSV9VTktO
T1dOOwo+PiArCj4+ICsJCXNwaW5fdW5sb2NrKCZ1YmktPndsX2xvY2spOwo+PiArCj4+ICsJCWVy
YXNlX2NvdW50ZXJzW2ldID0gZWM7Cj4gCj4gTXkgaWRlYSB3YXkgdXNpbmcgdGhlcmUgc29tZXRo
aW5nIGxpa2UgX19wdXRfdXNlcigpIHRvIGRpcmVjdGx5IHdyaXRlIHRoZQo+IHJlY29yZCB0byB1
c2Vyc3BhY2UgbWVtb3J5Lgo+IFdpdGggYW4gYWNjZXNzX29rKCkgY2hlY2sgYmVmb3JlIHlvdSBj
YW4gbWFrZSBzdXJlIHRoYXQgdGhlIHdob2xlIGRlc3RpbmF0aW9uCj4gaXMgd2l0aGluIHVzZXJz
cGFjZS4KCkFncmVlLiBIaSwgUmlja2FyZC4gWW91IGNhbiBoYXZlIGEgbG9vayBhdCBpb2N0bF9m
aWVtYXAgLT4gZXh0NF9maWVtYXAgCi0+IGlvbWFwX2ZpZW1hcCAtPiBpb21hcF90b19maWVtYXAg
LT4gZmllbWFwX2ZpbGxfbmV4dF9leHRlbnQsIGp1c3QgbGlrZSAKdGhlIHN1Z2dlc3Rpb25zIGZy
b20gUmljaGFyZC4gTm8gZXh0cmEgbWVtb3J5IGFsbG9jYXRpb25zLCBjb3B5IHJlc3VsdHMgCnRv
IHVzZXJzcGFjZSBvbmUgYnkgb25lLgo+IAo+IFRoYW5rcywKPiAvL3JpY2hhcmQKPiAKPiAuCj4g
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
