Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC499CFD364
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 12:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlILn+T7F96yCk5LJWhBcZrqEDibolGqGajNdbkwwpA=; b=MhT9BhnXpq0QIBZwhNOR05oCmA
	LoyA7bGgayXycKkJIVF2yj95uMCTLef+a9Hx5r2ksGVAvI3CjWTT0gYB4Wd3XCInssQyEE3gStz80
	DrIBRvtbyW+nLdEjH/fyDMIMWaILmOKTvlZABCy7CBkUfbFuTQziFmwAlOVe50d+xfvDd+92Xecdo
	rBkQGV91svnTVCAOuCjCfo0Xs3lbp8d9nNR+ovChPD/dWR8NVTD5BRQZGu3yfMp52ttWFxER95Kjo
	hJThxjgP9Ba3Oen6AO++FGJRIBCjwMDZOsbkdTNRSSSuxGHPR8kSAeo56hwqtDbFQUdrL9SR0DaHB
	dcBcoTow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szELE-0000000GCui-0gaP;
	Fri, 11 Oct 2024 12:01:56 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szELA-0000000GCpv-1upF
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 12:01:54 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XQ4tR29XgzpWk3;
	Fri, 11 Oct 2024 19:59:43 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id A8C1E14037C;
	Fri, 11 Oct 2024 20:01:42 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 11 Oct 2024 20:01:41 +0800
Subject: Re: [PATCH v2 01/10] ubi: Expose mean erase counter in sysfs
To: Rickard Andersson <rickard.andersson@axis.com>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <kernel@axis.com>
References: <20241011092134.2909496-1-rickard.andersson@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <ae8aa403-1d31-2e9b-a734-1696eac47e45@huawei.com>
Date: Fri, 11 Oct 2024 20:01:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241011092134.2909496-1-rickard.andersson@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_050153_125621_ECBEA1DF 
X-CRM114-Status: GOOD (  26.33  )
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

5ZyoIDIwMjQvMTAvMTEgMTc6MjEsIFJpY2thcmQgQW5kZXJzc29uIOWGmemBkzoKPiBDdXJyZW50
bHksIG9ubHkgIm1heF9lYyIgY2FuIGJlIHJlYWQgZnJvbSBzeXNmcywgd2hpY2ggcHJvdmlkZXMg
YQo+IGxpbWl0ZWQgdmlldyBvZiB0aGUgZmxhc2ggZGV2aWNl4oCZcyB3ZWFyLiBJbiBjZXJ0YWlu
IGNhc2VzLCBzdWNoIGFzCj4gYnVncyBpbiB0aGUgd2Vhci1sZXZlbGluZyBhbGdvcml0aG0sIHNw
ZWNpZmljIGJsb2NrcyBjYW4gYmUgd29ybiBkb3duCj4gbW9yZSB0aGFuIG90aGVycywgcmVzdWx0
aW5nIGluIHVuZXZlbiB3ZWFyIGRpc3RyaWJ1dGlvbi4gUHJvdmlkaW5nIGEKPiBtZWFuIGVyYXNl
IGNvdW50ZXIgdmFsdWUgZ2l2ZXMgYSBiZXR0ZXIgdW5kZXJzdGFuZGluZyBvZiB0aGUgb3ZlcmFs
bAo+IGZsYXNoIHdlYXIuCj4gVGhlcmUgZXhpc3RzIG1vcmUgZGV0YWlsZWQgaW5mbyBpbiBkZWJ1
Z2ZzLCBidXQgdGhpcyBpbmZvcm1hdGlvbiBpcwo+IG9ubHkgYXZhaWxhYmxlIGZvciBkZWJ1ZyBi
dWlsZHMuCj4gCj4gVGhpcyBwYXRjaCBjYWxjdWxhdGVzIHRoZSBtZWFuIHZhbHVlIG9ubHkgd2hl
biBpdCBpcyByZXF1ZXN0ZWQuIFRoaXMKPiBjYWxjdWxhdGlvbiB0eXBpY2FsbHkgdGFrZXMgMi43
IG1zIGZvciBhbiBVQkkgZGV2aWNlIHdpdGggNDA5MSBibG9ja3MKPiBydW5uaW5nIG9uIGEgc2lu
Z2xlIGNvcmUgQ29ydGV4LUE5IGF0IDc5MiBNSHouCj4gCj4gU2lnbmVkLW9mZi1ieTogUmlja2Fy
ZCBBbmRlcnNzb24gPHJpY2thcmQuYW5kZXJzc29uQGF4aXMuY29tPgo+IC0tLQo+ICAgZHJpdmVy
cy9tdGQvdWJpL2J1aWxkLmMgfCA0OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMgYi9kcml2ZXJzL210ZC91YmkvYnVpbGQuYwo+
IGluZGV4IGY1MTQwYTc4YTRhOC4uZmEzOGM0MzRlNDQ3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
bXRkL3ViaS9idWlsZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKPiBAQCAtMTMx
LDYgKzEzMSw4IEBAIHN0YXRpYyBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSBkZXZfdm9sdW1lc19j
b3VudCA9Cj4gICAJX19BVFRSKHZvbHVtZXNfY291bnQsIFNfSVJVR08sIGRldl9hdHRyaWJ1dGVf
c2hvdywgTlVMTCk7Cj4gICBzdGF0aWMgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgZGV2X21heF9l
YyA9Cj4gICAJX19BVFRSKG1heF9lYywgU19JUlVHTywgZGV2X2F0dHJpYnV0ZV9zaG93LCBOVUxM
KTsKPiArc3RhdGljIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlIGRldl9tZWFuX2VjID0KPiArCV9f
QVRUUihtZWFuX2VjLCBTX0lSVUdPLCBkZXZfYXR0cmlidXRlX3Nob3csIE5VTEwpOwo+ICAgc3Rh
dGljIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlIGRldl9yZXNlcnZlZF9mb3JfYmFkID0KPiAgIAlf
X0FUVFIocmVzZXJ2ZWRfZm9yX2JhZCwgU19JUlVHTywgZGV2X2F0dHJpYnV0ZV9zaG93LCBOVUxM
KTsKPiAgIHN0YXRpYyBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSBkZXZfYmFkX3BlYl9jb3VudCA9
Cj4gQEAgLTMzNyw2ICszMzksNDkgQEAgaW50IHViaV9tYWpvcjJudW0oaW50IG1ham9yKQo+ICAg
CXJldHVybiB1YmlfbnVtOwo+ICAgfQo+ICAgCj4gKy8qKgo+ICsgKiB1YmlfY2FsY19tZWFuX2Vj
IC0gY2FsY3VsYXRlIG1lYW4gZXJhc2UgY291bnRlciB2YWx1ZS4KPiArICogQHViaTogVUJJIGRl
dmljZSBkZXNjcmlwdGlvbiBvYmplY3QKPiArICogQHN0YXJ0X3BlYjogRmlyc3QgUEVCIGluIHRo
ZSByYW5nZQo+ICsgKiBAZW5kX3BlYjogRW5kIFBFQiBpbiB0aGUgaGFsZi1vcGVuIHJhbmdlCj4g
KyAqCj4gKyAqIFJldHVybnMgdGhlIG1lYW4gdmFsdWUgb2YgYWxsIG5vbi1iYWQgYmxvY2tzIG9m
IHRoZSBkZXZpY2UgdGhhdCBhcmUKPiArICogaW4gdGhlIHJhbmdlLiBSYW5nZSBpcyBoYWxmLW9w
ZW4gaS5lIGVuZF9wZWIgaXMgbm90IGFjdHVhbGx5IGluY2x1ZGVkLgo+ICsgKgoKPiArICogUmV0
dXJucyB6ZXJvIGlmIGl0IHdhcyBub3QgcG9zc2libGUgdG8gY2FsY3VsYXRlIHRoZSBtZWFuIHZh
bHVlCgpEZWxldGUgdGhpcyBsaW5lIGZyb20gdGhlIGNvbW1lbnRzLCBzaW5jZSB6ZXJvIGlzIGEg
bm9ybWFsIHZhbHVlIGlmIGFsbCAKUEVCcycgZXJhc2UgY291bnRlciBpcyBpbml0aWFsaXplZCBh
cyAnMCcgYnkgdWJpZm9ybWF0IHRvb2wuCj4gKyAqLwo+ICtzdGF0aWMgaW50IHViaV9jYWxjX21l
YW5fZWMoc3RydWN0IHViaV9kZXZpY2UgKnViaSwgaW50IHN0YXJ0X3BlYiwgaW50IGVuZF9wZWIp
Cj4gK3sKPiArCXN0cnVjdCB1Ymlfd2xfZW50cnkgKndsOwo+ICsJaW50IHBlYjsKPiArCWludCBl
Y19jb3VudCA9IDA7Cj4gKwlpbnQgbWVhbl9lYyA9IDA7Cj4gKwl1aW50NjRfdCBlY19zdW0gPSAw
Owo+ICsKPiArCWZvciAocGViID0gc3RhcnRfcGViOyBwZWIgPCBlbmRfcGViOyBwZWIrKykgewo+
ICsJCWludCBlcnI7Cj4gKwo+ICsJCWVyciA9IHViaV9pb19pc19iYWQodWJpLCBwZWIpOwo+ICsJ
CWlmIChlcnIpCj4gKwkJCWNvbnRpbnVlOwo+ICsKPiArCQlzcGluX2xvY2soJnViaS0+d2xfbG9j
ayk7Cj4gKwo+ICsJCXdsID0gdWJpLT5sb29rdXB0YmxbcGViXTsKPiArCQlpZiAod2wpIHsKPiAr
CQkJZWNfc3VtICs9IHdsLT5lYzsKPiArCQkJZWNfY291bnQrKzsKPiArCQl9Cj4gKwo+ICsJCXNw
aW5fdW5sb2NrKCZ1YmktPndsX2xvY2spOwo+ICsJfQo+ICsKPiArCWlmIChlY19jb3VudCA+IDAp
Cj4gKwkJbWVhbl9lYyA9IGRpdl91NjQoZWNfc3VtLCBlY19jb3VudCk7Cj4gKwo+ICsJcmV0dXJu
IG1lYW5fZWM7Cj4gK30KPiArCj4gICAvKiAiU2hvdyIgbWV0aG9kIGZvciBmaWxlcyBpbiAnLzxz
eXNmcz4vY2xhc3MvdWJpL3ViaVgvJyAqLwo+ICAgc3RhdGljIHNzaXplX3QgZGV2X2F0dHJpYnV0
ZV9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwKPiAgIAkJCQkgIHN0cnVjdCBkZXZpY2VfYXR0cmli
dXRlICphdHRyLCBjaGFyICpidWYpCj4gQEAgLTM2Niw2ICs0MTEsOCBAQCBzdGF0aWMgc3NpemVf
dCBkZXZfYXR0cmlidXRlX3Nob3coc3RydWN0IGRldmljZSAqZGV2LAo+ICAgCQlyZXQgPSBzcHJp
bnRmKGJ1ZiwgIiVkXG4iLCB1YmktPnZvbF9jb3VudCAtIFVCSV9JTlRfVk9MX0NPVU5UKTsKPiAg
IAllbHNlIGlmIChhdHRyID09ICZkZXZfbWF4X2VjKQo+ICAgCQlyZXQgPSBzcHJpbnRmKGJ1Ziwg
IiVkXG4iLCB1YmktPm1heF9lYyk7Cj4gKwllbHNlIGlmIChhdHRyID09ICZkZXZfbWVhbl9lYykK
PiArCQlyZXQgPSBzcHJpbnRmKGJ1ZiwgIiVkXG4iLCB1YmlfY2FsY19tZWFuX2VjKHViaSwgMCwg
dWJpLT5wZWJfY291bnQpKTsKPiAgIAllbHNlIGlmIChhdHRyID09ICZkZXZfcmVzZXJ2ZWRfZm9y
X2JhZCkKPiAgIAkJcmV0ID0gc3ByaW50ZihidWYsICIlZFxuIiwgdWJpLT5iZWJfcnN2ZF9wZWJz
KTsKPiAgIAllbHNlIGlmIChhdHRyID09ICZkZXZfYmFkX3BlYl9jb3VudCkKPiBAQCAtMzkyLDYg
KzQzOSw3IEBAIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICp1YmlfZGV2X2F0dHJzW10gPSB7Cj4g
ICAJJmRldl90b3RhbF9lcmFzZWJsb2Nrcy5hdHRyLAo+ICAgCSZkZXZfdm9sdW1lc19jb3VudC5h
dHRyLAo+ICAgCSZkZXZfbWF4X2VjLmF0dHIsCj4gKwkmZGV2X21lYW5fZWMuYXR0ciwKPiAgIAkm
ZGV2X3Jlc2VydmVkX2Zvcl9iYWQuYXR0ciwKPiAgIAkmZGV2X2JhZF9wZWJfY291bnQuYXR0ciwK
PiAgIAkmZGV2X21heF92b2xfY291bnQuYXR0ciwKPiAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
