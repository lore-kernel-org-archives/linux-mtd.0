Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB297CEF145
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 09:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ezC/No67E0Aq6a/TyRSFFbYCCp4JkBlcgt10Ww+vR8=; b=Lxh7WRxaaS6w0XsAcH+GaNUi/4
	/z0UbI24ck6Vu4HeRtJ4ABEsRmv6gDk5Wf4hrAKhWj1/sRDkXG0le+Dpi5Z+YUbmADds1GLfLErJS
	xgv51FM/OWVKQoZyiSkbeP4uDUQz5m9QZUADGcPbiMSL+Pb9YLjHCrn1S3eepzLuge+BRscxXm0e2
	fSJEY+AdGlRiuWRV2J5rXF2tCF9n3oACU2RD+7BC4fkImozMac4eelKPJkR9QTUS02j+d1aiAEmDe
	gj1y3rUS48zNeTUg/x2DqPaoAmfc3JouVGcQvpluaHu5mcbnmGI8F6Vz79bwLVFekFOTXyftbqPqs
	QX1CWInw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy6Vn-00000005Ivg-1Tx0;
	Tue, 08 Oct 2024 09:28:11 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy6VJ-00000005ImR-0yIi
	for linux-mtd@lists.infradead.org;
	Tue, 08 Oct 2024 09:27:43 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XN9YV2WPdz1HKL6;
	Tue,  8 Oct 2024 17:23:26 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id E499D1401F1;
	Tue,  8 Oct 2024 17:27:30 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 17:27:30 +0800
Subject: Re: [PATCH 2/4] ubi: Expose mean erase counter for fastmap in sysfs
To: Rickard Andersson <rickard.andersson@axis.com>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <kernel@axis.com>
References: <20241004082208.1103202-1-rickard.andersson@axis.com>
 <20241004082208.1103202-2-rickard.andersson@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <1351167a-6313-9e98-eafd-c8c9e6fe1a5f@huawei.com>
Date: Tue, 8 Oct 2024 17:27:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241004082208.1103202-2-rickard.andersson@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_022741_832969_E116C15B 
X-CRM114-Status: GOOD (  25.67  )
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

1NogMjAyNC8xMC80IDE2OjIyLCBSaWNrYXJkIEFuZGVyc3NvbiDQtLXAOgo+IFNpbmNlIHRoZSBm
YXN0bWFwIGFyZWEgaGFzIGl0cyBvd24gd2VhciBsZXZlbGxpbmcgaXQgaXMgdmFsdWFibGUgdG8K
PiBwcm92aWRlIGEgbWVhbiB2YWx1ZSBmb3IgdGhhdCBhcmVhLiBUaGlzIHZhbHVlIGNhbiBiZSB1
c2VkIGluIG9yZGVyCj4gdG8gZXN0aW1hdGUgbGlmZSBleHBlY3RhbmN5IG9mIHRoZSBmbGFzaC4K
PiAKClRoZXJlIGFyZSAyIGNhc2VzIHNob3duIGFzIGZvbGxvd2luZzoKMSkgZmFzdG1hcCBpcyBk
aXNhYmxlZDogV2UgY2FuIGRldGVybWluZSB3aGV0aGVyIHRoZSB3ZWFyLWxldmVsaW5nIAphbGdv
cml0aG0gd29ya3MgZmluZSBieSBjb21wYXJpbmcgJ21heF9lYycgd2l0aCAnbWVhbl9lYycuCjIp
IGZhc3RtYXAgaXMgZW5hYmxlZDogVGhlIG1heF9lYyBtYXkgY29tZSBmcm9tIGZpcnN0IDY0IFBF
QnMoZmFzdG1hcCAKYXJlYSksIG9yIGl0IG1heSBjb21lIGZyb20gZGF0YSBhcmVhKHBudW0gPiA2
NCksIGhvdyBjYW4gd2UgZGV0ZXJtaW5lIAp3aGV0aGVyIHRoZSB3ZWFyLWxldmVsaW5nIGFsZ29y
aXRobSB3b3JrcyBmaW5lIGZvciBkYXRhIGFyZWE/Cj4gU2lnbmVkLW9mZi1ieTogUmlja2FyZCBB
bmRlcnNzb24gPHJpY2thcmQuYW5kZXJzc29uQGF4aXMuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9t
dGQvdWJpL2J1aWxkLmMgfCAyOSArKysrKysrKysrKysrKysrKysrKysrKystLS0tLQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jIGIvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMK
PiBpbmRleCA4YmRmYzUxY2FjYjEuLmFmNjdjZWZkM2U1ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L210ZC91YmkvYnVpbGQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jCj4gQEAgLTEz
Myw2ICsxMzMsOCBAQCBzdGF0aWMgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgZGV2X21heF9lYyA9
Cj4gICAJX19BVFRSKG1heF9lYywgU19JUlVHTywgZGV2X2F0dHJpYnV0ZV9zaG93LCBOVUxMKTsK
PiAgIHN0YXRpYyBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSBkZXZfbWVhbl9lYyA9Cj4gICAJX19B
VFRSKG1lYW5fZWMsIFNfSVJVR08sIGRldl9hdHRyaWJ1dGVfc2hvdywgTlVMTCk7Cj4gK3N0YXRp
YyBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSBkZXZfbWVhbl9lY19mYXN0bWFwID0KPiArCV9fQVRU
UihtZWFuX2VjX2Zhc3RtYXAsIFNfSVJVR08sIGRldl9hdHRyaWJ1dGVfc2hvdywgTlVMTCk7Cj4g
ICBzdGF0aWMgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgZGV2X3Jlc2VydmVkX2Zvcl9iYWQgPQo+
ICAgCV9fQVRUUihyZXNlcnZlZF9mb3JfYmFkLCBTX0lSVUdPLCBkZXZfYXR0cmlidXRlX3Nob3cs
IE5VTEwpOwo+ICAgc3RhdGljIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlIGRldl9iYWRfcGViX2Nv
dW50ID0KPiBAQCAtMzQ1LDE5ICszNDcsMzMgQEAgaW50IHViaV9tYWpvcjJudW0oaW50IG1ham9y
KQo+ICAgLyoqCj4gICAgKiB1YmlfY2FsY19tZWFuX2VjIC0gY2FsY3VsYXRlIG1lYW4gZXJhc2Ug
Y291bnRlciB2YWx1ZS4KPiAgICAqIEB1Ymk6IFVCSSBkZXZpY2UgZGVzY3JpcHRpb24gb2JqZWN0
Cj4gKyAqIEBmYXN0bWFwOiB0cnVlIGlmIG1lYW4gdmFsdWUgb2YganVzdCB0aGUgZmFzdG1hcCBh
cmVhIHNob3VsZCBiZSBjYWxjdWxhdGVkCj4gICAgKgo+IC0gKiBSZXR1cm5zIHRoZSBtZWFuIHZh
bHVlIG9mIHRoZSBhbGwgYmxvY2tzIG9mIHRoZSBkZXZpY2UuCj4gLSAqIFJldHVybnMgemVybyBp
ZiBpdCB3YXMgbm90IHBvc3NpYmxlIHRvIGNhbGN1bGF0ZSB0aGUgbWVhbiB2YWx1ZS4KPiArICog
UmV0dXJucyB0aGUgbWVhbiB2YWx1ZSBvZiB0aGUgYWxsIG5vbi1iYWQgYmxvY2tzIG9mIHRoZSBk
ZXZpY2UgaWYgZmFzdG1hcCBpcwo+ICsgKiBmYWxzZS4KPiArICogSWYgZmFzdG1hcCBpcyB0cnVl
IHRoZW4gb25seSBhIG1lYW4gdmFsdWUgb2YgdGhlIGZhc3RtYXAgYXJlYSBpcyBjYWxjdWxhdGVk
Lgo+ICsgKiBSZXR1cm5zIHplcm8gaWYgaXQgd2FzIG5vdCBwb3NzaWJsZSB0byBjYWxjdWxhdGUg
dGhlIG1lYW4gdmFsdWUgb3IgaWYgbm8KPiArICogZmFzdG1hcCBleGlzdHMuCj4gICAgKi8KPiAt
aW50IHViaV9jYWxjX21lYW5fZWMoc3RydWN0IHViaV9kZXZpY2UgKnViaSkKPiAraW50IHViaV9j
YWxjX21lYW5fZWMoc3RydWN0IHViaV9kZXZpY2UgKnViaSwgYm9vbCBmYXN0bWFwKQo+ICAgewo+
ICAgCXN0cnVjdCB1Ymlfd2xfZW50cnkgKndsOwo+ICAgCWludCBwZWI7Cj4gICAJaW50IGVjX2Nv
dW50ID0gMDsKPiArCWludCBwZWJfY291bnQ7Cj4gICAJaW50IG1lYW5fZWMgPSAwOwo+ICAgCXVp
bnQ2NF90IGVjX3N1bSA9IDA7Cj4gICAKPiAtCWZvciAocGViID0gMDsgcGViIDwgdWJpLT5wZWJf
Y291bnQ7IHBlYisrKSB7Cj4gKwlwZWJfY291bnQgPSB1YmktPnBlYl9jb3VudDsKPiArCj4gKwlp
ZiAoZmFzdG1hcCkgewo+ICsJCWlmICgoIXViaS0+Zm1fZGlzYWJsZWQpICYmIChwZWJfY291bnQg
PiBVQklfRk1fTUFYX1NUQVJUKSkKCidpZiAoIXViaS0+Zm1fZGlzYWJsZWQpKScgaXMgZW5vdWdo
Lgo+ICsJCQlwZWJfY291bnQgPSBVQklfRk1fTUFYX1NUQVJUOwo+ICsJCWVsc2UKPiArCQkJcmV0
dXJuIDA7IC8qIE5vIGZhc3RtYXAgb24gdGhpcyBVQkkgZGV2aWNlICovCgpJZiB3ZSBmb3JtYXQg
L2Rldi9tdGRYIGJ5IGNvbW1hbmQgJ3ViaWZvcm1hdCAtZSAwJywgdGhlIHJldHVybiB2YWx1ZSAn
MCcgCm1heSBjb25mdXNlIHVzLCBpdCBtZWFucyB0aGF0IHRoZSBmYXN0bWFwIGlzIGRpc2FibGVk
IG9yIHRoZSAKbWVhbl9lY19mYXN0bWFwIGlzIDAuCj4gKwl9Cj4gKwo+ICsJZm9yIChwZWIgPSAw
OyBwZWIgPCBwZWJfY291bnQ7IHBlYisrKSB7Cj4gICAJCWludCBlcnI7Cj4gICAKPiAgIAkJZXJy
ID0gdWJpX2lvX2lzX2JhZCh1YmksIHBlYik7Cj4gQEAgLTQxMSw3ICs0MjcsOSBAQCBzdGF0aWMg
c3NpemVfdCBkZXZfYXR0cmlidXRlX3Nob3coc3RydWN0IGRldmljZSAqZGV2LAo+ICAgCWVsc2Ug
aWYgKGF0dHIgPT0gJmRldl9tYXhfZWMpCj4gICAJCXJldCA9IHNwcmludGYoYnVmLCAiJWRcbiIs
IHViaS0+bWF4X2VjKTsKPiAgIAllbHNlIGlmIChhdHRyID09ICZkZXZfbWVhbl9lYykKPiAtCQly
ZXQgPSBzcHJpbnRmKGJ1ZiwgIiVkXG4iLCB1YmlfY2FsY19tZWFuX2VjKHViaSkpOwo+ICsJCXJl
dCA9IHNwcmludGYoYnVmLCAiJWRcbiIsIHViaV9jYWxjX21lYW5fZWModWJpLCBmYWxzZSkpOwo+
ICsJZWxzZSBpZiAoYXR0ciA9PSAmZGV2X21lYW5fZWNfZmFzdG1hcCkKPiArCQlyZXQgPSBzcHJp
bnRmKGJ1ZiwgIiVkXG4iLCB1YmlfY2FsY19tZWFuX2VjKHViaSwgdHJ1ZSkpOwo+ICAgCWVsc2Ug
aWYgKGF0dHIgPT0gJmRldl9yZXNlcnZlZF9mb3JfYmFkKQo+ICAgCQlyZXQgPSBzcHJpbnRmKGJ1
ZiwgIiVkXG4iLCB1YmktPmJlYl9yc3ZkX3BlYnMpOwo+ICAgCWVsc2UgaWYgKGF0dHIgPT0gJmRl
dl9iYWRfcGViX2NvdW50KQo+IEBAIC00MzksNiArNDU3LDcgQEAgc3RhdGljIHN0cnVjdCBhdHRy
aWJ1dGUgKnViaV9kZXZfYXR0cnNbXSA9IHsKPiAgIAkmZGV2X3ZvbHVtZXNfY291bnQuYXR0ciwK
PiAgIAkmZGV2X21heF9lYy5hdHRyLAo+ICAgCSZkZXZfbWVhbl9lYy5hdHRyLAo+ICsJJmRldl9t
ZWFuX2VjX2Zhc3RtYXAuYXR0ciwKPiAgIAkmZGV2X3Jlc2VydmVkX2Zvcl9iYWQuYXR0ciwKPiAg
IAkmZGV2X2JhZF9wZWJfY291bnQuYXR0ciwKPiAgIAkmZGV2X21heF92b2xfY291bnQuYXR0ciwK
PiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
