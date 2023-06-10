Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BD3C77B7A
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Jun 2023 07:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Sp2rpxuYXC8Ca0o3mvTwNPRMZXkeTNv7ll/5dXEswg=; b=xuSrcG0yMU9w3eM3BRmbWVJza1
	fv0X8AET1StoIJfkWL/I0LWZkcfFxsVpn1ZeEsbo9VPh07IKaIjEc+D7NDcoH76aYVcoOj6RZ9QlJ
	kJtzwhILaibKj5LYBMqZJw3RH5V7Z8f2S5ZrDT5l049f9rrKvyGq/2pKeL/KO9Y5bEfxMrA+zGquo
	icgG44HFNwMf/DRlWe8OK08rdWsPbUlepURVj9YFYKTdY41cZiQ2n7kmIqw0LP9d4yoK6EZE6ds59
	AvmAOiTpL1DVNza/sCi0iw5YjUkjIlXPrNRotPY/Xe0/M/j/MVcQTeMC2FzS6nK13rqQvD9WQgPWR
	kim9o/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7ssm-00FSFj-0x;
	Sat, 10 Jun 2023 07:19:32 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7ssi-00FSEJ-1P
	for linux-mtd@lists.infradead.org;
	Sat, 10 Jun 2023 07:19:31 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4QdThv3q1wzqTql
	for <linux-mtd@lists.infradead.org>; Sat, 10 Jun 2023 15:14:23 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 10 Jun 2023 15:19:15 +0800
Subject: Re: [PATCH v2] ubi: block: Fix cleanup handling
To: <linux-mtd@lists.infradead.org>
References: <20230523-ubiblock-remove-v2-1-7671fc60ba49@axis.com>
 <597afb16-dccd-5361-cc44-cabcba802fe0@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <79c99334-2d30-33ae-cbd5-6db4898494f0@huawei.com>
Date: Sat, 10 Jun 2023 15:19:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <597afb16-dccd-5361-cc44-cabcba802fe0@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_001928_865750_D714530D 
X-CRM114-Status: GOOD (  19.09  )
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

5ZyoIDIwMjMvNi85IDExOjE2LCBaaGloYW8gQ2hlbmcg5YaZ6YGTOgo+IOWcqCAyMDIzLzYvNyAx
NzoyNSwgVmluY2VudCBXaGl0Y2h1cmNoIOWGmemBkzoKPj4gdWJpYmxvY2sncyByZW1vdmUgaGFu
ZGxpbmcgaGFzIGEgY291cGxlIG9mIHByb2JsZW1zOgo+Pgo+PiDCoCAtIEl0IHVzZXMgdGhlIGdl
bmRpc2sgYWZ0ZXIgcHV0X2Rpc2soKSwgcmVzdWx0aW5nIGluIGEgdXNlLWFmdGVyLWZyZWUuCj4+
Cj4+IMKgIC0gVGhlcmUgaXMgYSBjaXJjdWxhciBsb2NraW5nIGRlcGVuZGVuY3kgYmV0d2VlbiBk
aXNrLT5vcGVuX211dGV4ICh1c2VkCj4+IMKgwqDCoCBmcm9tIGRlbF9nZW5kaXNrKCkgYW5kIGJs
a2Rldl9vcGVuKCkpIGFuZCBkZXYtPmRldl9tdXRleCAodXNlZCBmcm9tCj4+IMKgwqDCoCB1Ymli
bG9ja19vcGVuKCkgYW5kIHViaWJsb2NrX3JlbW92ZSgpKS4KPj4KPj4gRml4IHRoZXNlIGJ5IGlt
cGxlbWVudGluZyAtPmZyZWVfZGlzaygpIGFuZCBtb3ZpbmcgdGhlIGZpbmFsIGNsZWFudXAKPj4g
dGhlcmUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgV2hpdGNodXJjaCA8dmluY2VudC53
aGl0Y2h1cmNoQGF4aXMuY29tPgo+PiAtLS0KPj4gQ2hhbmdlcyBpbiB2MjoKPj4gLSBDb21iaW5l
IGFuZCByZXdvcmsgcGF0Y2hlcyB0byBpbXBsZW1lbnQgYW5kIHVzZSAtPmZyZWVfZGlzaygpLgo+
PiAtIExpbmsgdG8gdjE6IAo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMwNTIzLXVi
aWJsb2NrLXJlbW92ZS12MS0wLTI0MGJlZDc1ODQ5YkBheGlzLmNvbSAKPj4KPj4gLS0tCj4+IMKg
IGRyaXZlcnMvbXRkL3ViaS9ibG9jay5jIHwgMjcgKysrKysrKysrKysrKysrKysrKystLS0tLS0t
Cj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvdWJpL2Jsb2NrLmMgYi9kcml2ZXJzL210ZC91
YmkvYmxvY2suYwo+PiBpbmRleCAzNzExZDdmNzQ2MDAuLjU3MGU2NjA2NzNhZCAxMDA2NDQKPj4g
LS0tIGEvZHJpdmVycy9tdGQvdWJpL2Jsb2NrLmMKPj4gKysrIGIvZHJpdmVycy9tdGQvdWJpL2Js
b2NrLmMKPj4gQEAgLTI5MywxMSArMjkzLDIzIEBAIHN0YXRpYyBpbnQgdWJpYmxvY2tfZ2V0Z2Vv
KHN0cnVjdCBibG9ja19kZXZpY2UgCj4+ICpiZGV2LCBzdHJ1Y3QgaGRfZ2VvbWV0cnkgKmdlbykK
Pj4gwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4gwqAgfQo+PiArc3RhdGljIHZvaWQgdWJpYmxvY2tf
ZnJlZV9kaXNrKHN0cnVjdCBnZW5kaXNrICpkaXNrKQo+PiArewo+PiArwqDCoMKgIHN0cnVjdCB1
YmlibG9jayAqZGV2ID0gZGlzay0+cHJpdmF0ZV9kYXRhOwo+PiArCj4+ICvCoMKgwqAgbXV0ZXhf
bG9jaygmZGV2aWNlc19tdXRleCk7Cj4+ICvCoMKgwqAgaWRyX3JlbW92ZSgmdWJpYmxvY2tfbWlu
b3JfaWRyLCBkaXNrLT5maXJzdF9taW5vcik7Cj4+ICvCoMKgwqAgbXV0ZXhfdW5sb2NrKCZkZXZp
Y2VzX211dGV4KTsKPj4gKwo+PiArwqDCoMKgIGtmcmVlKGRldik7Cj4+ICt9Cj4+ICsKPj4gwqAg
c3RhdGljIGNvbnN0IHN0cnVjdCBibG9ja19kZXZpY2Vfb3BlcmF0aW9ucyB1YmlibG9ja19vcHMg
PSB7Cj4+IMKgwqDCoMKgwqAgLm93bmVyID0gVEhJU19NT0RVTEUsCj4+IMKgwqDCoMKgwqAgLm9w
ZW4gPSB1YmlibG9ja19vcGVuLAo+PiDCoMKgwqDCoMKgIC5yZWxlYXNlID0gdWJpYmxvY2tfcmVs
ZWFzZSwKPj4gwqDCoMKgwqDCoCAuZ2V0Z2VvwqDCoMKgID0gdWJpYmxvY2tfZ2V0Z2VvLAo+PiAr
wqDCoMKgIC5mcmVlX2Rpc2sgPSB1YmlibG9ja19mcmVlX2Rpc2ssCj4+IMKgIH07Cj4+IMKgIHN0
YXRpYyBibGtfc3RhdHVzX3QgdWJpYmxvY2tfcXVldWVfcnEoc3RydWN0IGJsa19tcV9od19jdHgg
KmhjdHgsCj4+IEBAIC00NTIsOSArNDY0LDggQEAgc3RhdGljIHZvaWQgdWJpYmxvY2tfY2xlYW51
cChzdHJ1Y3QgdWJpYmxvY2sgKmRldikKPj4gwqDCoMKgwqDCoCBkZWxfZ2VuZGlzayhkZXYtPmdk
KTsKPj4gwqDCoMKgwqDCoCAvKiBGaW5hbGx5IGRlc3Ryb3kgdGhlIGJsayBxdWV1ZSAqLwo+PiDC
oMKgwqDCoMKgIGRldl9pbmZvKGRpc2tfdG9fZGV2KGRldi0+Z2QpLCAicmVsZWFzZWQiKTsKPj4g
LcKgwqDCoCBwdXRfZGlzayhkZXYtPmdkKTsKPj4gwqDCoMKgwqDCoCBibGtfbXFfZnJlZV90YWdf
c2V0KCZkZXYtPnRhZ19zZXQpOwo+PiAtwqDCoMKgIGlkcl9yZW1vdmUoJnViaWJsb2NrX21pbm9y
X2lkciwgZGV2LT5nZC0+Zmlyc3RfbWlub3IpOwo+PiArwqDCoMKgIHB1dF9kaXNrKGRldi0+Z2Qp
Owo+IAo+IEkgdGhvdWdodCBpdCdzIGJldHRlciB0byBkbyBwdXRfZGlzaygpIGZpcnN0IHRoZW4g
ZG8gCj4gYmxrX21xX2ZyZWVfdGFnX3NldCgpLCBsaWtlcyBuYmQsIGxvb3AgZG9lcy4gV2lsbCAK
PiBwdXRfZGlzay0+ZGlza19yZWxlYXNlLT5ibGtfbXFfZXhpdF9xdWV1ZS0+YmxrX21xX2V4aXRf
aHdfcXVldWVzIGFjY2VzcyAKPiB0YWdfc2V0IHdoaWNoIGhhcyBiZWVuIGZyZWVkIGJ5IGJsa19t
cV9mcmVlX3RhZ19zZXQoKT8KPiAKCkFsbCByaWdodCwganVzdCBpZ25vcmUgdGhpcyBjb21tZW50
LiBUaGUgbmJkIGRvZXNuJ3QgaW1wbGVtZW50IAonLT5mcmVlX2Rpc2snLiBUaGUgJ3ViaWJsb2Nr
JyB3aWxsIGJlIGZyZWVkIGluICctPmZyZWVfZGlzaycgaW52b2tlZCAKZnJvbSBwdXRfZGlzaywg
c28gJ2Jsa19tcV9mcmVlX3RhZ19zZXQoJmRldi0+dGFnX3NldCknIHNob3VsZCBiZSAKZXhlY3V0
ZWQgYmVmb3JlIHB1dF9kaXNrLgoKPj4gwqAgfQo+PiDCoCBpbnQgdWJpYmxvY2tfcmVtb3ZlKHN0
cnVjdCB1Ymlfdm9sdW1lX2luZm8gKnZpKQo+PiBAQCAtNDc4LDExICs0ODksMTEgQEAgaW50IHVi
aWJsb2NrX3JlbW92ZShzdHJ1Y3QgdWJpX3ZvbHVtZV9pbmZvICp2aSkKPj4gwqDCoMKgwqDCoCAv
KiBSZW1vdmUgZnJvbSBkZXZpY2UgbGlzdCAqLwo+PiDCoMKgwqDCoMKgIGxpc3RfZGVsKCZkZXYt
Pmxpc3QpOwo+PiAtwqDCoMKgIHViaWJsb2NrX2NsZWFudXAoZGV2KTsKPj4gwqDCoMKgwqDCoCBt
dXRleF91bmxvY2soJmRldi0+ZGV2X211dGV4KTsKPj4gwqDCoMKgwqDCoCBtdXRleF91bmxvY2so
JmRldmljZXNfbXV0ZXgpOwo+PiAtwqDCoMKgIGtmcmVlKGRldik7Cj4+ICvCoMKgwqAgdWJpYmxv
Y2tfY2xlYW51cChkZXYpOwo+PiArCj4+IMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+IMKgIG91dF91
bmxvY2tfZGV2Ogo+PiBAQCAtNjIzLDE3ICs2MzQsMTkgQEAgc3RhdGljIHZvaWQgdWJpYmxvY2tf
cmVtb3ZlX2FsbCh2b2lkKQo+PiDCoCB7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IHViaWJsb2NrICpu
ZXh0Owo+PiDCoMKgwqDCoMKgIHN0cnVjdCB1YmlibG9jayAqZGV2Owo+PiArwqDCoMKgIExJU1Rf
SEVBRChsaXN0KTsKPj4gwqDCoMKgwqDCoCBtdXRleF9sb2NrKCZkZXZpY2VzX211dGV4KTsKPj4g
LcKgwqDCoCBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoZGV2LCBuZXh0LCAmdWJpYmxvY2tfZGV2
aWNlcywgbGlzdCkgewo+PiArwqDCoMKgIGxpc3Rfc3BsaWNlX2luaXQoJnViaWJsb2NrX2Rldmlj
ZXMsICZsaXN0KTsKPj4gK8KgwqDCoCBtdXRleF91bmxvY2soJmRldmljZXNfbXV0ZXgpOwo+PiAr
Cj4+ICvCoMKgwqAgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGRldiwgbmV4dCwgJmxpc3QsIGxp
c3QpIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIC8qIFRoZSBtb2R1bGUgaXMgYmVpbmcgZm9yY2Vm
dWxseSByZW1vdmVkICovCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBXQVJOX09OKGRldi0+ZGVzYyk7
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBSZW1vdmUgZnJvbSBkZXZpY2UgbGlzdCAqLwo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgbGlzdF9kZWwoJmRldi0+bGlzdCk7Cj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCB1YmlibG9ja19jbGVhbnVwKGRldik7Cj4+IC3CoMKgwqDCoMKgwqDCoCBrZnJlZShkZXYp
Owo+PiDCoMKgwqDCoMKgIH0KPj4gLcKgwqDCoCBtdXRleF91bmxvY2soJmRldmljZXNfbXV0ZXgp
Owo+PiDCoCB9Cj4+IMKgIGludCBfX2luaXQgdWJpYmxvY2tfaW5pdCh2b2lkKQo+Pgo+PiAtLS0K
Pj4gYmFzZS1jb21taXQ6IDQ0YzAyNmE3M2JlODAzOGYwM2RiZGVlZjAyOGI2NDI4ODBjZjE1MTEK
Pj4gY2hhbmdlLWlkOiAyMDIzMDUyMy11YmlibG9jay1yZW1vdmUtZWFiNjFjZjY4M2YwCj4+Cj4+
IEJlc3QgcmVnYXJkcywKPj4KPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
