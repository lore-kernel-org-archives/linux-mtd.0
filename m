Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26B5CFD35C
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 12:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9lUDSvHZvS6tl5Gh5lGt/UNeWvi5KkJ0yj6NkF1I8c=; b=tJfxjQ/8iqHwCcqDfX9d4AE0yF
	WiFBi9tTUNdQ1T9d3PJCSbMcZhgQyNEvsjDU6dCZADSI8yOmDPUq0oDce1EcHTE4EV6bg3VXsR9Gv
	vdg0pvQeadrw/2IqI0DUSUP2gj59DhsayjmkRaUsjozsPX1kEJ872tIQwfXHukxxsal1QhDCMaEr4
	cw1zc+hKc4GOOxmeLSlc/5YefAYF6dGYnYIdvCODF5OIiCYSyyIhAfQWyQFdt+d6fRJk+qh3/eftx
	4ZUMnx00sKCERxEZH0Hf/6m0tdc6YR8f24WEr2UV854ix70GSM5pO/VqGuU0SEwFMAra0e5Z7935y
	jonF7qVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szEMb-0000000GDGw-48xP;
	Fri, 11 Oct 2024 12:03:22 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szEMY-0000000GDEa-21dk
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 12:03:20 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4XQ4wL2FPzz1T8Vp;
	Fri, 11 Oct 2024 20:01:22 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 4E7661400D8;
	Fri, 11 Oct 2024 20:03:08 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 11 Oct 2024 20:03:07 +0800
Subject: Re: [PATCH v2 03/10] ubi: Expose max erase counter for fastmap in
 sysfs
To: Rickard Andersson <rickard.andersson@axis.com>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <kernel@axis.com>
References: <20241011092134.2909496-1-rickard.andersson@axis.com>
 <20241011092134.2909496-3-rickard.andersson@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <2925b897-c127-b885-4bcf-633236fef8a3@huawei.com>
Date: Fri, 11 Oct 2024 20:03:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241011092134.2909496-3-rickard.andersson@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_050319_085345_9C4F37F0 
X-CRM114-Status: GOOD (  22.00  )
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

1NogMjAyNC8xMC8xMSAxNzoyMSwgUmlja2FyZCBBbmRlcnNzb24g0LS1wDoKPiBTaW5jZSB0aGUg
ZmFzdG1hcCBhcmVhIGhhcyBpdHMgb3duIHdlYXIgbGV2ZWxsaW5nIGl0IGlzIHZhbHVhYmxlIHRv
Cj4gcHJvdmlkZSBhIG1heCBlcmFzZSBjb3VudGVyIHZhbHVlIHNwZWNpZmljYWxseSBmb3IgdGhh
dCBhcmVhLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJpY2thcmQgQW5kZXJzc29uIDxyaWNrYXJkLmFu
ZGVyc3NvbkBheGlzLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvbXRkL3ViaS9idWlsZC5jIHwgNDQg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFu
Z2VkLCA0NCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3ViaS9i
dWlsZC5jIGIvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKPiBpbmRleCAzNjMzYzc0M2U3ZDEuLmY1
YTNhM2Y3ZDQ5MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC91YmkvYnVpbGQuYwo+ICsrKyBi
L2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jCj4gQEAgLTEzNCw2ICsxMzQsOCBAQCBzdGF0aWMgc3Ry
dWN0IGRldmljZV9hdHRyaWJ1dGUgZGV2X21heF9lYyA9Cj4gICBzdGF0aWMgc3RydWN0IGRldmlj
ZV9hdHRyaWJ1dGUgZGV2X21lYW5fZWMgPQo+ICAgCV9fQVRUUihtZWFuX2VjLCBTX0lSVUdPLCBk
ZXZfYXR0cmlidXRlX3Nob3csIE5VTEwpOwo+ICAgI2lmZGVmIENPTkZJR19NVERfVUJJX0ZBU1RN
QVAKPiArc3RhdGljIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlIGRldl9tYXhfZWNfZmFzdG1hcCA9
Cj4gKwlfX0FUVFIobWF4X2VjX2Zhc3RtYXAsIFNfSVJVR08sIGRldl9hdHRyaWJ1dGVfc2hvdywg
TlVMTCk7Cj4gICBzdGF0aWMgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgZGV2X21lYW5fZWNfZmFz
dG1hcCA9Cj4gICAJX19BVFRSKG1lYW5fZWNfZmFzdG1hcCwgU19JUlVHTywgZGV2X2F0dHJpYnV0
ZV9zaG93LCBOVUxMKTsKPiAgICNlbmRpZgo+IEBAIC0zODYsNiArMzg4LDQ1IEBAIHN0YXRpYyBp
bnQgdWJpX2NhbGNfbWVhbl9lYyhzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBpbnQgc3RhcnRfcGVi
LCBpbnQgZW5kX3BlYikKPiAgIAlyZXR1cm4gbWVhbl9lYzsKPiAgIH0KPiAgIAo+ICsvKioKPiAr
ICogdWJpX2NhbGNfbWF4X2VjX2Zhc3RtYXAgLSBjYWxjdWxhdGUgbWF4IGVyYXNlIGNvdW50ZXIg
dmFsdWUuCj4gKyAqIEB1Ymk6IFVCSSBkZXZpY2UgZGVzY3JpcHRpb24gb2JqZWN0Cj4gKyAqIEBz
dGFydF9wZWI6IEZpcnN0IFBFQiBpbiB0aGUgcmFuZ2UKPiArICogQGVuZF9wZWI6IEVuZCBQRUIg
aW4gdGhlIGhhbGYtb3BlbiByYW5nZQo+ICsgKgo+ICsgKiBSZXR1cm5zIHRoZSBtYXggZXJhc2Ug
Y291bnRlciB2YWx1ZSB0aGF0IGNhbiBiZSBmb3VuZCBpbiB0aGUgcmFuZ2UuCj4gKyAqIFJhbmdl
IGlzIGhhbGYtb3BlbiBpLmUgZW5kX3BlYiBpcyBub3QgYWN0dWFsbHkgaW5jbHVkZWQuCgo+ICsg
KiBSZXR1cm5zIHplcm8gaWYgaXQgd2FzIG5vdCBwb3NzaWJsZSB0byBjYWxjdWxhdGUgdGhlIG1h
eCBlYyB2YWx1ZQoKRGVsZXRlIHRoaXMgbGluZSBmcm9tIHRoZSBjb21tZW50cywgc2luY2UgemVy
byBpcyBhIG5vcm1hbCB2YWx1ZSBpZiBhbGwgClBFQnMnIGVyYXNlIGNvdW50ZXIgaXMgaW5pdGlh
bGl6ZWQgYXMgJzAnIGJ5IHViaWZvcm1hdCB0b29sLgo+ICsgKi8KPiArI2lmZGVmIENPTkZJR19N
VERfVUJJX0ZBU1RNQVAKPiArc3RhdGljIGludCB1YmlfY2FsY19tYXhfZWMoc3RydWN0IHViaV9k
ZXZpY2UgKnViaSwgaW50IHN0YXJ0X3BlYiwgaW50IGVuZF9wZWIpCj4gK3sKPiArCXN0cnVjdCB1
Ymlfd2xfZW50cnkgKndsOwo+ICsJaW50IHBlYjsKPiArCWludCBtYXhfZWMgPSAwOwo+ICsKPiAr
CWZvciAocGViID0gc3RhcnRfcGViOyBwZWIgPCBlbmRfcGViOyBwZWIrKykgewo+ICsJCWludCBl
cnI7Cj4gKwo+ICsJCWVyciA9IHViaV9pb19pc19iYWQodWJpLCBwZWIpOwo+ICsJCWlmIChlcnIp
Cj4gKwkJCWNvbnRpbnVlOwo+ICsKPiArCQlzcGluX2xvY2soJnViaS0+d2xfbG9jayk7Cj4gKwo+
ICsJCXdsID0gdWJpLT5sb29rdXB0YmxbcGViXTsKPiArCQlpZiAod2wpIHsKPiArCQkJaWYgKG1h
eF9lYyA8IHdsLT5lYykKPiArCQkJCW1heF9lYyA9IHdsLT5lYzsKPiArCQl9Cj4gKwo+ICsJCXNw
aW5fdW5sb2NrKCZ1YmktPndsX2xvY2spOwo+ICsJfQo+ICsKPiArCXJldHVybiBtYXhfZWM7Cj4g
K30KPiArI2VuZGlmCj4gKwo+ICAgLyogIlNob3ciIG1ldGhvZCBmb3IgZmlsZXMgaW4gJy88c3lz
ZnM+L2NsYXNzL3ViaS91YmlYLycgKi8KPiAgIHN0YXRpYyBzc2l6ZV90IGRldl9hdHRyaWJ1dGVf
c2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gICAJCQkJICBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0
ZSAqYXR0ciwgY2hhciAqYnVmKQo+IEBAIC00MTgsNiArNDU5LDggQEAgc3RhdGljIHNzaXplX3Qg
ZGV2X2F0dHJpYnV0ZV9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwKPiAgIAllbHNlIGlmIChhdHRy
ID09ICZkZXZfbWVhbl9lYykKPiAgIAkJcmV0ID0gc3ByaW50ZihidWYsICIlZFxuIiwgdWJpX2Nh
bGNfbWVhbl9lYyh1YmksIDAsIHViaS0+cGViX2NvdW50KSk7Cj4gICAjaWZkZWYgQ09ORklHX01U
RF9VQklfRkFTVE1BUAo+ICsJZWxzZSBpZiAoYXR0ciA9PSAmZGV2X21heF9lY19mYXN0bWFwKQo+
ICsJCXJldCA9IHNwcmludGYoYnVmLCAiJWRcbiIsIHViaV9jYWxjX21heF9lYyh1YmksIDAsIFVC
SV9GTV9NQVhfU1RBUlQpKTsKPiAgIAllbHNlIGlmIChhdHRyID09ICZkZXZfbWVhbl9lY19mYXN0
bWFwKQo+ICAgCQlyZXQgPSBzcHJpbnRmKGJ1ZiwgIiVkXG4iLCB1YmlfY2FsY19tZWFuX2VjKHVi
aSwgMCwgVUJJX0ZNX01BWF9TVEFSVCkpOwo+ICAgI2VuZGlmCj4gQEAgLTQ0OSw2ICs0OTIsNyBA
QCBzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqdWJpX2Rldl9hdHRyc1tdID0gewo+ICAgCSZkZXZf
bWF4X2VjLmF0dHIsCj4gICAJJmRldl9tZWFuX2VjLmF0dHIsCj4gICAjaWZkZWYgQ09ORklHX01U
RF9VQklfRkFTVE1BUAo+ICsJJmRldl9tYXhfZWNfZmFzdG1hcC5hdHRyLAo+ICAgCSZkZXZfbWVh
bl9lY19mYXN0bWFwLmF0dHIsCj4gICAjZW5kaWYKPiAgIAkmZGV2X3Jlc2VydmVkX2Zvcl9iYWQu
YXR0ciwKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
