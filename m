Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A6FCEF140
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 09:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PV0bOrq0BLjnhtFBFZVXR+4R1f6ALLfOC1GkrA3a5Pc=; b=ik2pCeyM5X1p248yDGGrIRb6zK
	LmwnwDY4fookeeRzlkcF9jsGV1/ItRgKB2JMCEE4GoafSFfthmlOzT/WUiOd/XoV7HXuhS40lD9R/
	poZWTJ1hfs+vv/MxuvGUsof3zZqcW4X0/+X72f/GDPsPHGmiXT+I8MkqY9aoTinNIyJCq4pft7LO/
	nwYt3c/tSNN88tO86SscKvUQwCbh/wp3/VqYVaAJ9dvmLyT8UwS+6KFJy5Jo1Oy+LC7NWCd1AcFyC
	eGBax+EK2tqGajAsvmqKpd/3ApPB9w6CO028ZQCnuoVWkbWHXYED9nI5e7FJKpib/KvqnwxQ/8QX5
	wxjcl8yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy6Qh-00000005HQG-3DOf;
	Tue, 08 Oct 2024 09:22:55 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy6EX-00000005FAy-1UCK
	for linux-mtd@lists.infradead.org;
	Tue, 08 Oct 2024 09:10:23 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XN9FW23HVz20pks;
	Tue,  8 Oct 2024 17:09:35 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id A819114038F;
	Tue,  8 Oct 2024 17:10:10 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 17:10:10 +0800
Subject: Re: [PATCH 1/4] ubi: Expose mean erase counter in sysfs
To: Rickard Andersson <rickard.andersson@axis.com>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <kernel@axis.com>
References: <20241004082208.1103202-1-rickard.andersson@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <4a9c1279-7eb8-ad45-ab79-a07d4920f27a@huawei.com>
Date: Tue, 8 Oct 2024 17:10:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241004082208.1103202-1-rickard.andersson@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_021021_950064_6AF7BA76 
X-CRM114-Status: GOOD (  25.05  )
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

5ZyoIDIwMjQvMTAvNCAxNjoyMiwgUmlja2FyZCBBbmRlcnNzb24g5YaZ6YGTOgo+IEN1cnJlbnRs
eSwgb25seSAibWF4X2VjIiBjYW4gYmUgcmVhZCBmcm9tIHN5c2ZzLCB3aGljaCBwcm92aWRlcyBh
Cj4gbGltaXRlZCB2aWV3IG9mIHRoZSBmbGFzaCBkZXZpY2XigJlzIHdlYXIuIEluIGNlcnRhaW4g
Y2FzZXMsIHN1Y2ggYXMKPiBidWdzIGluIHRoZSB3ZWFyLWxldmVsaW5nIGFsZ29yaXRobSwgc3Bl
Y2lmaWMgYmxvY2tzIGNhbiBiZSB3b3JuIGRvd24KPiBtb3JlIHRoYW4gb3RoZXJzLCByZXN1bHRp
bmcgaW4gdW5ldmVuIHdlYXIgZGlzdHJpYnV0aW9uLiBQcm92aWRpbmcgYQo+IG1lYW4gZXJhc2Ug
Y291bnRlciB2YWx1ZSBnaXZlcyBhIGJldHRlciB1bmRlcnN0YW5kaW5nIG9mIHRoZSBvdmVyYWxs
Cj4gZmxhc2ggd2Vhci4KPiBUaGVyZSBleGlzdHMgbW9yZSBkZXRhaWxlZCBpbmZvIGluIGRlYnVn
ZnMsIGJ1dCB0aGlzIGluZm9ybWF0aW9uIGlzCj4gb25seSBhdmFpbGFibGUgZm9yIGRlYnVnIGJ1
aWxkcy4KPiAKPiBUaGlzIHBhdGNoIGNhbGN1bGF0ZXMgdGhlIG1lYW4gdmFsdWUgb25seSB3aGVu
IGl0IGlzIHJlcXVlc3RlZC4gVGhpcwo+IGNhbGN1bGF0aW9uIHR5cGljYWxseSB0YWtlcyAyLjcg
bXMgZm9yIGFuIFVCSSBkZXZpY2Ugd2l0aCA0MDkxIGJsb2Nrcwo+IHJ1bm5pbmcgb24gYSBzaW5n
bGUgY29yZSBDb3J0ZXgtQTkgYXQgNzkyIE1Iei4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSaWNrYXJk
IEFuZGVyc3NvbiA8cmlja2FyZC5hbmRlcnNzb25AYXhpcy5jb20+Cj4gLS0tCj4gICBkcml2ZXJz
L210ZC91YmkvYnVpbGQuYyB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL210ZC91YmkvYnVpbGQuYyBiL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jCj4g
aW5kZXggMzBiZTRlZDY4ZmFkLi44YmRmYzUxY2FjYjEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9t
dGQvdWJpL2J1aWxkLmMKPiArKysgYi9kcml2ZXJzL210ZC91YmkvYnVpbGQuYwo+IEBAIC0xMzEs
NiArMTMxLDggQEAgc3RhdGljIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlIGRldl92b2x1bWVzX2Nv
dW50ID0KPiAgIAlfX0FUVFIodm9sdW1lc19jb3VudCwgU19JUlVHTywgZGV2X2F0dHJpYnV0ZV9z
aG93LCBOVUxMKTsKPiAgIHN0YXRpYyBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSBkZXZfbWF4X2Vj
ID0KPiAgIAlfX0FUVFIobWF4X2VjLCBTX0lSVUdPLCBkZXZfYXR0cmlidXRlX3Nob3csIE5VTEwp
Owo+ICtzdGF0aWMgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgZGV2X21lYW5fZWMgPQo+ICsJX19B
VFRSKG1lYW5fZWMsIFNfSVJVR08sIGRldl9hdHRyaWJ1dGVfc2hvdywgTlVMTCk7Cj4gICBzdGF0
aWMgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgZGV2X3Jlc2VydmVkX2Zvcl9iYWQgPQo+ICAgCV9f
QVRUUihyZXNlcnZlZF9mb3JfYmFkLCBTX0lSVUdPLCBkZXZfYXR0cmlidXRlX3Nob3csIE5VTEwp
Owo+ICAgc3RhdGljIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlIGRldl9iYWRfcGViX2NvdW50ID0K
PiBAQCAtMzQwLDYgKzM0Miw0NSBAQCBpbnQgdWJpX21ham9yMm51bShpbnQgbWFqb3IpCj4gICAJ
cmV0dXJuIHViaV9udW07Cj4gICB9Cj4gICAKPiArLyoqCj4gKyAqIHViaV9jYWxjX21lYW5fZWMg
LSBjYWxjdWxhdGUgbWVhbiBlcmFzZSBjb3VudGVyIHZhbHVlLgo+ICsgKiBAdWJpOiBVQkkgZGV2
aWNlIGRlc2NyaXB0aW9uIG9iamVjdAo+ICsgKgo+ICsgKiBSZXR1cm5zIHRoZSBtZWFuIHZhbHVl
IG9mIHRoZSBhbGwgYmxvY2tzIG9mIHRoZSBkZXZpY2UuCj4gKyAqIFJldHVybnMgemVybyBpZiBp
dCB3YXMgbm90IHBvc3NpYmxlIHRvIGNhbGN1bGF0ZSB0aGUgbWVhbiB2YWx1ZS4KPiArICovCj4g
K2ludCB1YmlfY2FsY19tZWFuX2VjKHN0cnVjdCB1YmlfZGV2aWNlICp1YmkpCgpzdGF0aWMgaW50
IHViaV9jYWxjX21lYW5fZWMoc3RydWN0IHViaV9kZXZpY2UgKnViaSkKPiArewo+ICsJc3RydWN0
IHViaV93bF9lbnRyeSAqd2w7Cj4gKwlpbnQgcGViOwo+ICsJaW50IGVjX2NvdW50ID0gMDsKPiAr
CWludCBtZWFuX2VjID0gMDsKPiArCXVpbnQ2NF90IGVjX3N1bSA9IDA7Cj4gKwo+ICsJZm9yIChw
ZWIgPSAwOyBwZWIgPCB1YmktPnBlYl9jb3VudDsgcGViKyspIHsKPiArCQlpbnQgZXJyOwo+ICsK
PiArCQllcnIgPSB1YmlfaW9faXNfYmFkKHViaSwgcGViKTsKPiArCQlpZiAoZXJyKQo+ICsJCQlj
b250aW51ZTsKPiArCj4gKwkJc3Bpbl9sb2NrKCZ1YmktPndsX2xvY2spOwo+ICsKPiArCQl3bCA9
IHViaS0+bG9va3VwdGJsW3BlYl07Cj4gKwkJaWYgKHdsKSB7Cj4gKwkJCWVjX3N1bSArPSB3bC0+
ZWM7Cj4gKwkJCWVjX2NvdW50Kys7Cj4gKwkJfQo+ICsKPiArCQlzcGluX3VubG9jaygmdWJpLT53
bF9sb2NrKTsKPiArCX0KPiArCj4gKwlpZiAoZWNfY291bnQgPiAwKQo+ICsJCW1lYW5fZWMgPSBk
aXZfdTY0KGVjX3N1bSwgZWNfY291bnQpOwo+ICsKPiArCXJldHVybiBtZWFuX2VjOwo+ICt9Cj4g
Kwo+ICAgLyogIlNob3ciIG1ldGhvZCBmb3IgZmlsZXMgaW4gJy88c3lzZnM+L2NsYXNzL3ViaS91
YmlYLycgKi8KPiAgIHN0YXRpYyBzc2l6ZV90IGRldl9hdHRyaWJ1dGVfc2hvdyhzdHJ1Y3QgZGV2
aWNlICpkZXYsCj4gICAJCQkJICBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAq
YnVmKQo+IEBAIC0zNjksNiArNDEwLDggQEAgc3RhdGljIHNzaXplX3QgZGV2X2F0dHJpYnV0ZV9z
aG93KHN0cnVjdCBkZXZpY2UgKmRldiwKPiAgIAkJcmV0ID0gc3ByaW50ZihidWYsICIlZFxuIiwg
dWJpLT52b2xfY291bnQgLSBVQklfSU5UX1ZPTF9DT1VOVCk7Cj4gICAJZWxzZSBpZiAoYXR0ciA9
PSAmZGV2X21heF9lYykKPiAgIAkJcmV0ID0gc3ByaW50ZihidWYsICIlZFxuIiwgdWJpLT5tYXhf
ZWMpOwo+ICsJZWxzZSBpZiAoYXR0ciA9PSAmZGV2X21lYW5fZWMpCj4gKwkJcmV0ID0gc3ByaW50
ZihidWYsICIlZFxuIiwgdWJpX2NhbGNfbWVhbl9lYyh1YmkpKTsKPiAgIAllbHNlIGlmIChhdHRy
ID09ICZkZXZfcmVzZXJ2ZWRfZm9yX2JhZCkKPiAgIAkJcmV0ID0gc3ByaW50ZihidWYsICIlZFxu
IiwgdWJpLT5iZWJfcnN2ZF9wZWJzKTsKPiAgIAllbHNlIGlmIChhdHRyID09ICZkZXZfYmFkX3Bl
Yl9jb3VudCkKPiBAQCAtMzk1LDYgKzQzOCw3IEBAIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICp1
YmlfZGV2X2F0dHJzW10gPSB7Cj4gICAJJmRldl90b3RhbF9lcmFzZWJsb2Nrcy5hdHRyLAo+ICAg
CSZkZXZfdm9sdW1lc19jb3VudC5hdHRyLAo+ICAgCSZkZXZfbWF4X2VjLmF0dHIsCj4gKwkmZGV2
X21lYW5fZWMuYXR0ciwKPiAgIAkmZGV2X3Jlc2VydmVkX2Zvcl9iYWQuYXR0ciwKPiAgIAkmZGV2
X2JhZF9wZWJfY291bnQuYXR0ciwKPiAgIAkmZGV2X21heF92b2xfY291bnQuYXR0ciwKPiAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
