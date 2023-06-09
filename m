Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02D6C7EE23
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jun 2023 03:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6A44xYl91XYD14dv4kTH2iTYABP+NVQsJhivNpO3fJU=; b=G9LMfRJL1A8qXoY/tHRNZj6Hp9
	4byh1NduPlT5CFal+jKn9rzUNx4nCwDhiFGfJoA7JzkaKY9ydVfm5/6rmrOUZd/VmrX0rIkkdUFb0
	I5uN9XpoD74VLAuHEFSn1itE2hy3cp2XFwelidBnX9QjOB0zZF8Kfuimt1ykVf+gZVayTXTgDDbRB
	v8SN+tDadJ/S7ELETip2fkmEsP4NvLnGdBHc4XBZz6yhZkOQ20nQxEKJtyIGfMfN8nX5hvl9qzgHj
	0YcJ2nM6Su0I2Jd2KxLtiGYjLZyra9EfMbZqKlkY050I0q0kyd+/2IRF/Y59JQW9mbOyBWz51lGG/
	KuSxTQaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Scs-00BQnR-1y;
	Fri, 09 Jun 2023 03:17:22 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Sco-00BQjq-2s
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jun 2023 03:17:21 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4QcmSn4NSrzTlKP
	for <linux-mtd@lists.infradead.org>; Fri,  9 Jun 2023 11:16:25 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 11:16:48 +0800
Subject: Re: [PATCH v2] ubi: block: Fix cleanup handling
To: <linux-mtd@lists.infradead.org>
References: <20230523-ubiblock-remove-v2-1-7671fc60ba49@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <597afb16-dccd-5361-cc44-cabcba802fe0@huawei.com>
Date: Fri, 9 Jun 2023 11:16:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230523-ubiblock-remove-v2-1-7671fc60ba49@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_201719_262407_2935F83E 
X-CRM114-Status: GOOD (  21.23  )
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

1NogMjAyMy82LzcgMTc6MjUsIFZpbmNlbnQgV2hpdGNodXJjaCDQtLXAOgo+IHViaWJsb2NrJ3Mg
cmVtb3ZlIGhhbmRsaW5nIGhhcyBhIGNvdXBsZSBvZiBwcm9ibGVtczoKPiAKPiAgIC0gSXQgdXNl
cyB0aGUgZ2VuZGlzayBhZnRlciBwdXRfZGlzaygpLCByZXN1bHRpbmcgaW4gYSB1c2UtYWZ0ZXIt
ZnJlZS4KPiAKPiAgIC0gVGhlcmUgaXMgYSBjaXJjdWxhciBsb2NraW5nIGRlcGVuZGVuY3kgYmV0
d2VlbiBkaXNrLT5vcGVuX211dGV4ICh1c2VkCj4gICAgIGZyb20gZGVsX2dlbmRpc2soKSBhbmQg
YmxrZGV2X29wZW4oKSkgYW5kIGRldi0+ZGV2X211dGV4ICh1c2VkIGZyb20KPiAgICAgdWJpYmxv
Y2tfb3BlbigpIGFuZCB1YmlibG9ja19yZW1vdmUoKSkuCj4gCj4gRml4IHRoZXNlIGJ5IGltcGxl
bWVudGluZyAtPmZyZWVfZGlzaygpIGFuZCBtb3ZpbmcgdGhlIGZpbmFsIGNsZWFudXAKPiB0aGVy
ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFdoaXRjaHVyY2ggPHZpbmNlbnQud2hpdGNo
dXJjaEBheGlzLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+IC0gQ29tYmluZSBhbmQgcmV3
b3JrIHBhdGNoZXMgdG8gaW1wbGVtZW50IGFuZCB1c2UgLT5mcmVlX2Rpc2soKS4KPiAtIExpbmsg
dG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMzA1MjMtdWJpYmxvY2stcmVtb3Zl
LXYxLTAtMjQwYmVkNzU4NDliQGF4aXMuY29tCj4gLS0tCj4gICBkcml2ZXJzL210ZC91YmkvYmxv
Y2suYyB8IDI3ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDIwIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL3ViaS9ibG9jay5jIGIvZHJpdmVycy9tdGQvdWJpL2Jsb2NrLmMKPiBpbmRleCAzNzEx
ZDdmNzQ2MDAuLjU3MGU2NjA2NzNhZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC91YmkvYmxv
Y2suYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3ViaS9ibG9jay5jCj4gQEAgLTI5MywxMSArMjkzLDIz
IEBAIHN0YXRpYyBpbnQgdWJpYmxvY2tfZ2V0Z2VvKHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYs
IHN0cnVjdCBoZF9nZW9tZXRyeSAqZ2VvKQo+ICAgCXJldHVybiAwOwo+ICAgfQo+ICAgCj4gK3N0
YXRpYyB2b2lkIHViaWJsb2NrX2ZyZWVfZGlzayhzdHJ1Y3QgZ2VuZGlzayAqZGlzaykKPiArewo+
ICsJc3RydWN0IHViaWJsb2NrICpkZXYgPSBkaXNrLT5wcml2YXRlX2RhdGE7Cj4gKwo+ICsJbXV0
ZXhfbG9jaygmZGV2aWNlc19tdXRleCk7Cj4gKwlpZHJfcmVtb3ZlKCZ1YmlibG9ja19taW5vcl9p
ZHIsIGRpc2stPmZpcnN0X21pbm9yKTsKPiArCW11dGV4X3VubG9jaygmZGV2aWNlc19tdXRleCk7
Cj4gKwo+ICsJa2ZyZWUoZGV2KTsKPiArfQo+ICsKPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYmxv
Y2tfZGV2aWNlX29wZXJhdGlvbnMgdWJpYmxvY2tfb3BzID0gewo+ICAgCS5vd25lciA9IFRISVNf
TU9EVUxFLAo+ICAgCS5vcGVuID0gdWJpYmxvY2tfb3BlbiwKPiAgIAkucmVsZWFzZSA9IHViaWJs
b2NrX3JlbGVhc2UsCj4gICAJLmdldGdlbwk9IHViaWJsb2NrX2dldGdlbywKPiArCS5mcmVlX2Rp
c2sgPSB1YmlibG9ja19mcmVlX2Rpc2ssCj4gICB9Owo+ICAgCj4gICBzdGF0aWMgYmxrX3N0YXR1
c190IHViaWJsb2NrX3F1ZXVlX3JxKHN0cnVjdCBibGtfbXFfaHdfY3R4ICpoY3R4LAo+IEBAIC00
NTIsOSArNDY0LDggQEAgc3RhdGljIHZvaWQgdWJpYmxvY2tfY2xlYW51cChzdHJ1Y3QgdWJpYmxv
Y2sgKmRldikKPiAgIAlkZWxfZ2VuZGlzayhkZXYtPmdkKTsKPiAgIAkvKiBGaW5hbGx5IGRlc3Ry
b3kgdGhlIGJsayBxdWV1ZSAqLwo+ICAgCWRldl9pbmZvKGRpc2tfdG9fZGV2KGRldi0+Z2QpLCAi
cmVsZWFzZWQiKTsKPiAtCXB1dF9kaXNrKGRldi0+Z2QpOwo+ICAgCWJsa19tcV9mcmVlX3RhZ19z
ZXQoJmRldi0+dGFnX3NldCk7Cj4gLQlpZHJfcmVtb3ZlKCZ1YmlibG9ja19taW5vcl9pZHIsIGRl
di0+Z2QtPmZpcnN0X21pbm9yKTsKPiArCXB1dF9kaXNrKGRldi0+Z2QpOwoKSSB0aG91Z2h0IGl0
J3MgYmV0dGVyIHRvIGRvIHB1dF9kaXNrKCkgZmlyc3QgdGhlbiBkbyAKYmxrX21xX2ZyZWVfdGFn
X3NldCgpLCBsaWtlcyBuYmQsIGxvb3AgZG9lcy4gV2lsbCAKcHV0X2Rpc2stPmRpc2tfcmVsZWFz
ZS0+YmxrX21xX2V4aXRfcXVldWUtPmJsa19tcV9leGl0X2h3X3F1ZXVlcyBhY2Nlc3MgCnRhZ19z
ZXQgd2hpY2ggaGFzIGJlZW4gZnJlZWQgYnkgYmxrX21xX2ZyZWVfdGFnX3NldCgpPwoKPiAgIH0K
PiAgIAo+ICAgaW50IHViaWJsb2NrX3JlbW92ZShzdHJ1Y3QgdWJpX3ZvbHVtZV9pbmZvICp2aSkK
PiBAQCAtNDc4LDExICs0ODksMTEgQEAgaW50IHViaWJsb2NrX3JlbW92ZShzdHJ1Y3QgdWJpX3Zv
bHVtZV9pbmZvICp2aSkKPiAgIAo+ICAgCS8qIFJlbW92ZSBmcm9tIGRldmljZSBsaXN0ICovCj4g
ICAJbGlzdF9kZWwoJmRldi0+bGlzdCk7Cj4gLQl1YmlibG9ja19jbGVhbnVwKGRldik7Cj4gICAJ
bXV0ZXhfdW5sb2NrKCZkZXYtPmRldl9tdXRleCk7Cj4gICAJbXV0ZXhfdW5sb2NrKCZkZXZpY2Vz
X211dGV4KTsKPiAgIAo+IC0Ja2ZyZWUoZGV2KTsKPiArCXViaWJsb2NrX2NsZWFudXAoZGV2KTsK
PiArCj4gICAJcmV0dXJuIDA7Cj4gICAKPiAgIG91dF91bmxvY2tfZGV2Ogo+IEBAIC02MjMsMTcg
KzYzNCwxOSBAQCBzdGF0aWMgdm9pZCB1YmlibG9ja19yZW1vdmVfYWxsKHZvaWQpCj4gICB7Cj4g
ICAJc3RydWN0IHViaWJsb2NrICpuZXh0Owo+ICAgCXN0cnVjdCB1YmlibG9jayAqZGV2Owo+ICsJ
TElTVF9IRUFEKGxpc3QpOwo+ICAgCj4gICAJbXV0ZXhfbG9jaygmZGV2aWNlc19tdXRleCk7Cj4g
LQlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoZGV2LCBuZXh0LCAmdWJpYmxvY2tfZGV2aWNlcywg
bGlzdCkgewo+ICsJbGlzdF9zcGxpY2VfaW5pdCgmdWJpYmxvY2tfZGV2aWNlcywgJmxpc3QpOwo+
ICsJbXV0ZXhfdW5sb2NrKCZkZXZpY2VzX211dGV4KTsKPiArCj4gKwlsaXN0X2Zvcl9lYWNoX2Vu
dHJ5X3NhZmUoZGV2LCBuZXh0LCAmbGlzdCwgbGlzdCkgewo+ICAgCQkvKiBUaGUgbW9kdWxlIGlz
IGJlaW5nIGZvcmNlZnVsbHkgcmVtb3ZlZCAqLwo+ICAgCQlXQVJOX09OKGRldi0+ZGVzYyk7Cj4g
ICAJCS8qIFJlbW92ZSBmcm9tIGRldmljZSBsaXN0ICovCj4gICAJCWxpc3RfZGVsKCZkZXYtPmxp
c3QpOwo+ICAgCQl1YmlibG9ja19jbGVhbnVwKGRldik7Cj4gLQkJa2ZyZWUoZGV2KTsKPiAgIAl9
Cj4gLQltdXRleF91bmxvY2soJmRldmljZXNfbXV0ZXgpOwo+ICAgfQo+ICAgCj4gICBpbnQgX19p
bml0IHViaWJsb2NrX2luaXQodm9pZCkKPiAKPiAtLS0KPiBiYXNlLWNvbW1pdDogNDRjMDI2YTcz
YmU4MDM4ZjAzZGJkZWVmMDI4YjY0Mjg4MGNmMTUxMQo+IGNoYW5nZS1pZDogMjAyMzA1MjMtdWJp
YmxvY2stcmVtb3ZlLWVhYjYxY2Y2ODNmMAo+IAo+IEJlc3QgcmVnYXJkcywKPiAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
