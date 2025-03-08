Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EF0C282EC
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Mar 2025 04:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BMV30oPPI2aBGmG5FAf05Zk0H08QpOkaYIhMU6VldKk=; b=vauVTcPND+UK3B8CFbUeATb0+Y
	z100h0ChnK8QAiPgSPmrtEUrJiej/cubRygQc/OTQqE1Vm/hdFJ3plr89UtQqOagrrjZTOUEmdctw
	jvaeskAbc7QFdG5A0YAwrRHCVgnmbPPl+lG4wrMgW15j8BArqEPxhxWl7AnS93tekB9h3xA0CdLBe
	9Kpr5av0S0FbraOgnfqzNjmzOFowOXr0nNg/YF9VjAns86pXwrXfK/5AyAZ1GyBRW1i6WhOfdOSU5
	4NuDnnfTFmz9zzJSEYOWPYGf75tRxhcfETU3AWhgdVQxKP7/u8SWdmuMsMf2cXrCYLxTIUUVs6lXw
	YBMzI52A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqlZ2-0000000GADs-3bC3;
	Sat, 08 Mar 2025 04:13:28 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqlYz-0000000GABS-2hJK
	for linux-mtd@lists.infradead.org;
	Sat, 08 Mar 2025 04:13:27 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Z8qQt25Ghz1dyhD;
	Sat,  8 Mar 2025 12:08:54 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 0229A1A0188;
	Sat,  8 Mar 2025 12:13:11 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 8 Mar 2025 12:13:10 +0800
Subject: Re: [PATCH] jffs2: check that raw node were preallocated before
 writing summary
To: Artem Sadovnikov <a.sadovnikov@ispras.ru>, <linux-mtd@lists.infradead.org>
CC: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger
	<richard@nod.at>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>, <stable@vger.kernel.org>
References: <20250307163409.13491-2-a.sadovnikov@ispras.ru>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <6d0b7143-8e36-6bb7-16c1-817ef3287e10@huawei.com>
Date: Sat, 8 Mar 2025 12:13:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250307163409.13491-2-a.sadovnikov@ispras.ru>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_201325_997560_9936A2BB 
X-CRM114-Status: GOOD (  15.53  )
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

1NogMjAyNS8zLzggMDozNCwgQXJ0ZW0gU2Fkb3ZuaWtvdiDQtLXAOgo+IFN5emthbGxlciBkZXRl
Y3RlZCBhIGtlcm5lbCBidWcgaW4gamZmczJfbGlua19ub2RlX3JlZiwgY2F1c2VkIGJ5IGZhdWx0
Cj4gaW5qZWN0aW9uIGluIGpmZnMyX3ByZWFsbG9jX3Jhd19ub2RlX3JlZnMuIGpmZnMyX3N1bV93
cml0ZV9zdW1ub2RlIGRvZXNuJ3QKPiBjaGVjayByZXR1cm4gdmFsdWUgb2YgamZmczJfcHJlYWxs
b2NfcmF3X25vZGVfcmVmcyBhbmQgc2ltcGx5IGxldHMgYW55Cj4gZXJyb3IgcHJvcGFnYXRlIGlu
dG8gamZmczJfc3VtX3dyaXRlX2RhdGEsIHdoaWNoIGV2ZW50dWFsbHkgY2FsbHMKPiBqZmZzMl9s
aW5rX25vZGVfcmVmIGluIG9yZGVyIHRvIGxpbmsgdGhlIHN1bW1hcnkgdG8gYW4gZXhwZWN0ZWRs
eSBhbGxvY2F0ZWQKPiBub2RlLgo+IAo+IGtlcm5lbCBCVUcgYXQgZnMvamZmczIvbm9kZWxpc3Qu
Yzo1OTIhCj4gaW52YWxpZCBvcGNvZGU6IDAwMDAgWyMxXSBQUkVFTVBUIFNNUCBLQVNBTiBOT1BU
SQo+IENQVTogMSBQSUQ6IDMxMjc3IENvbW06IHN5ei1leGVjdXRvci43IE5vdCB0YWludGVkIDYu
MS4xMjgtc3l6a2FsbGVyLTAwMTM5LWdlMTBmODNjYTEwYTEgIzAKPiBIYXJkd2FyZSBuYW1lOiBR
RU1VIFN0YW5kYXJkIFBDIChpNDQwRlggKyBQSUlYLCAxOTk2KSwgQklPUyAxLjEyLjAtMSAwNC8w
MS8yMDE0Cj4gUklQOiAwMDEwOmpmZnMyX2xpbmtfbm9kZV9yZWYrMHg1NzAvMHg2OTAgZnMvamZm
czIvbm9kZWxpc3QuYzo1OTIKPiBDYWxsIFRyYWNlOgo+ICAgPFRBU0s+Cj4gICBqZmZzMl9zdW1f
d3JpdGVfZGF0YSBmcy9qZmZzMi9zdW1tYXJ5LmM6ODQxIFtpbmxpbmVdCj4gICBqZmZzMl9zdW1f
d3JpdGVfc3Vtbm9kZSsweGQxYS8weDFkYTAgZnMvamZmczIvc3VtbWFyeS5jOjg3NAo+ICAgamZm
czJfZG9fcmVzZXJ2ZV9zcGFjZSsweGExOC8weGQ2MCBmcy9qZmZzMi9ub2RlbWdtdC5jOjM4OAo+
ICAgamZmczJfcmVzZXJ2ZV9zcGFjZSsweDU1Zi8weGFhMCBmcy9qZmZzMi9ub2RlbWdtdC5jOjE5
Nwo+ICAgamZmczJfd3JpdGVfaW5vZGVfcmFuZ2UrMHgyNDYvMHhiNTAgZnMvamZmczIvd3JpdGUu
YzozNjIKPiAgIGpmZnMyX3dyaXRlX2VuZCsweDcyNi8weDE1ZDAgZnMvamZmczIvZmlsZS5jOjMw
MQo+ICAgZ2VuZXJpY19wZXJmb3JtX3dyaXRlKzB4MzE0LzB4NWQwIG1tL2ZpbGVtYXAuYzozODU2
Cj4gICBfX2dlbmVyaWNfZmlsZV93cml0ZV9pdGVyKzB4MmFlLzB4NGQwIG1tL2ZpbGVtYXAuYzoz
OTczCj4gICBnZW5lcmljX2ZpbGVfd3JpdGVfaXRlcisweGUzLzB4MzUwIG1tL2ZpbGVtYXAuYzo0
MDA1Cj4gICBjYWxsX3dyaXRlX2l0ZXIgaW5jbHVkZS9saW51eC9mcy5oOjIyNjUgW2lubGluZV0K
PiAgIGRvX2l0ZXJfcmVhZHZfd3JpdGV2KzB4MjBmLzB4M2MwIGZzL3JlYWRfd3JpdGUuYzo3MzUK
PiAgIGRvX2l0ZXJfd3JpdGUrMHgxODYvMHg3MTAgZnMvcmVhZF93cml0ZS5jOjg2MQo+ICAgdmZz
X2l0ZXJfd3JpdGUrMHg3MC8weGEwIGZzL3JlYWRfd3JpdGUuYzo5MDIKPiAgIGl0ZXJfZmlsZV9z
cGxpY2Vfd3JpdGUrMHg3M2IvMHhjOTAgZnMvc3BsaWNlLmM6Njg1Cj4gICBkb19zcGxpY2VfZnJv
bSBmcy9zcGxpY2UuYzo3NjMgW2lubGluZV0KPiAgIGRpcmVjdF9zcGxpY2VfYWN0b3IrMHgxMGMv
MHgxNzAgZnMvc3BsaWNlLmM6OTUwCj4gICBzcGxpY2VfZGlyZWN0X3RvX2FjdG9yKzB4MzM3LzB4
YTEwIGZzL3NwbGljZS5jOjg5Ngo+ICAgZG9fc3BsaWNlX2RpcmVjdCsweDFhOS8weDI4MCBmcy9z
cGxpY2UuYzoxMDAyCj4gICBkb19zZW5kZmlsZSsweGIxMy8weDEyYzAgZnMvcmVhZF93cml0ZS5j
OjEyNTUKPiAgIF9fZG9fc3lzX3NlbmRmaWxlNjQgZnMvcmVhZF93cml0ZS5jOjEzMjMgW2lubGlu
ZV0KPiAgIF9fc2Vfc3lzX3NlbmRmaWxlNjQgZnMvcmVhZF93cml0ZS5jOjEzMDkgW2lubGluZV0K
PiAgIF9feDY0X3N5c19zZW5kZmlsZTY0KzB4MWNmLzB4MjEwIGZzL3JlYWRfd3JpdGUuYzoxMzA5
Cj4gICBkb19zeXNjYWxsX3g2NCBhcmNoL3g4Ni9lbnRyeS9jb21tb24uYzo1MSBbaW5saW5lXQo+
ICAgZG9fc3lzY2FsbF82NCsweDM1LzB4ODAgYXJjaC94ODYvZW50cnkvY29tbW9uLmM6ODEKPiAg
IGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDZlLzB4ZDgKPiAKPiBGaXggdGhpcyBp
c3N1ZSBieSBjaGVja2luZyByZXR1cm4gdmFsdWUgb2YgamZmczJfcHJlYWxsb2NfcmF3X25vZGVf
cmVmcwo+IGJlZm9yZSBjYWxsaW5nIGpmZnMyX3N1bV93cml0ZV9kYXRhLgo+IAo+IEZvdW5kIGJ5
IExpbnV4IFZlcmlmaWNhdGlvbiBDZW50ZXIgKGxpbnV4dGVzdGluZy5vcmcpIHdpdGggU3l6a2Fs
bGVyLgo+IAo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gRml4ZXM6IDJmNzg1NDAyZjM5
YiAoIltKRkZTMl0gUmVkdWNlIHZpc2liaWxpdHkgb2YgcmF3X25vZGVfcmVmIHRvIHVwcGVyIGxh
eWVycyBvZiBKRkZTMiBjb2RlLiIpCj4gU2lnbmVkLW9mZi1ieTogQXJ0ZW0gU2Fkb3ZuaWtvdiA8
YS5zYWRvdm5pa292QGlzcHJhcy5ydT4KPiAtLS0KPiAgIGZzL2pmZnMyL3N1bW1hcnkuYyB8IDcg
KysrKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+IAoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+
Cj4gZGlmZiAtLWdpdCBhL2ZzL2pmZnMyL3N1bW1hcnkuYyBiL2ZzL2pmZnMyL3N1bW1hcnkuYwo+
IGluZGV4IDRmZTY0NTE5ODcwZjEuLmQ4MzM3MmQzZTFhMDcgMTAwNjQ0Cj4gLS0tIGEvZnMvamZm
czIvc3VtbWFyeS5jCj4gKysrIGIvZnMvamZmczIvc3VtbWFyeS5jCj4gQEAgLTg1OCw3ICs4NTgs
MTAgQEAgaW50IGpmZnMyX3N1bV93cml0ZV9zdW1ub2RlKHN0cnVjdCBqZmZzMl9zYl9pbmZvICpj
KQo+ICAgCXNwaW5fdW5sb2NrKCZjLT5lcmFzZV9jb21wbGV0aW9uX2xvY2spOwo+ICAgCj4gICAJ
amViID0gYy0+bmV4dGJsb2NrOwo+IC0JamZmczJfcHJlYWxsb2NfcmF3X25vZGVfcmVmcyhjLCBq
ZWIsIDEpOwo+ICsJcmV0ID0gamZmczJfcHJlYWxsb2NfcmF3X25vZGVfcmVmcyhjLCBqZWIsIDEp
Owo+ICsKPiArCWlmIChyZXQpCj4gKwkJZ290byBvdXQ7Cj4gICAKPiAgIAlpZiAoIWMtPnN1bW1h
cnktPnN1bV9udW0gfHwgIWMtPnN1bW1hcnktPnN1bV9saXN0X2hlYWQpIHsKPiAgIAkJSkZGUzJf
V0FSTklORygiRW1wdHkgc3VtbWFyeSBpbmZvISEhXG4iKTsKPiBAQCAtODcyLDYgKzg3NSw4IEBA
IGludCBqZmZzMl9zdW1fd3JpdGVfc3Vtbm9kZShzdHJ1Y3QgamZmczJfc2JfaW5mbyAqYykKPiAg
IAlkYXRhc2l6ZSArPSBwYWRzaXplOwo+ICAgCj4gICAJcmV0ID0gamZmczJfc3VtX3dyaXRlX2Rh
dGEoYywgamViLCBpbmZvc2l6ZSwgZGF0YXNpemUsIHBhZHNpemUpOwo+ICsKPiArb3V0Ogo+ICAg
CXNwaW5fbG9jaygmYy0+ZXJhc2VfY29tcGxldGlvbl9sb2NrKTsKPiAgIAlyZXR1cm4gcmV0Owo+
ICAgfQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
