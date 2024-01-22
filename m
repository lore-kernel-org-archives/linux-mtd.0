Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5BCC4725D
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 12:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47MFJyPMwGPoG5gV9UKViPwRPz8A0eu2j9eOSGl6WU8=; b=atTj2wlJumpRVGvLnRPXpIMbi3
	1w5KmPUv5201Hm9hJ0OLItij9nef/F8aHcGA/OhJYWNEme8TohyW4bsrs4N0pbN75hfpGkmwS8o8u
	OgvG45rFnU+7ztQ8Q5bqo9bpdMrAHwxTHDsa49GCcU6Spcf8HW0i0ypwPqSB1RKBJwB7UKTMbna5o
	rLyXZUGxexY2eU1ug7S3pwYb9COKb4aoffWQOlDd09PXqWe3+Jy0HaIhmc9wSwIjiSgVplILF8S8D
	WhOMZr0SM0A/GQREUXJx849gisqsD7XhvaylexJen8fnSDhAHNTCIoz36Z79NkFdCmGfs2BqITDAy
	6aqmjhnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtK7-00C5Ha-18;
	Mon, 22 Jan 2024 12:22:43 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtK2-00C5C6-2E
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jan 2024 12:22:41 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4TJTpl61RMzXgc7;
	Mon, 22 Jan 2024 20:21:19 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 3E2D91404F7;
	Mon, 22 Jan 2024 20:22:29 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 20:22:28 +0800
Subject: Re: [PATCH 15/15] ubifs: Convert populate_page() to take a folio
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
References: <20240120230824.2619716-1-willy@infradead.org>
 <20240120230824.2619716-16-willy@infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <cd97f781-ce92-8814-e41f-210b6150084e@huawei.com>
Date: Mon, 22 Jan 2024 20:22:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240120230824.2619716-16-willy@infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_042239_079515_120C06C2 
X-CRM114-Status: GOOD (  17.89  )
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

1NogMjAyNC8xLzIxIDc6MDgsIE1hdHRoZXcgV2lsY294IChPcmFjbGUpINC0tcA6Cj4gQm90aCBj
YWxsZXJzIG5vdyBoYXZlIGEgZm9saW8sIHNvIHBhc3MgaXQgaW4uICBUaGlzIGZ1bmN0aW9uIGNv
bnRhaW5zCj4gc2V2ZXJhbCBhc3N1bXB0aW9ucyB0aGF0IGZvbGlvcyBhcmUgbm90IGxhcmdlLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgV2lsY294IChPcmFjbGUpIDx3aWxseUBpbmZyYWRl
YWQub3JnPgo+IC0tLQo+ICAgZnMvdWJpZnMvZmlsZS5jIHwgNDEgKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25z
KCspLCAyMCBkZWxldGlvbnMoLSkKPiAKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5n
emhpaGFvMUBodWF3ZWkuY29tPgoKPiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvZmlsZS5jIGIvZnMv
dWJpZnMvZmlsZS5jCj4gaW5kZXggZGVjNTI1OGI0ZjM4Li5mYmJkMDczOTA5NTkgMTAwNjQ0Cj4g
LS0tIGEvZnMvdWJpZnMvZmlsZS5jCj4gKysrIGIvZnMvdWJpZnMvZmlsZS5jCj4gQEAgLTU5Miwz
NSArNTkyLDM1IEBAIHN0YXRpYyBpbnQgdWJpZnNfd3JpdGVfZW5kKHN0cnVjdCBmaWxlICpmaWxl
LCBzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPiAgIC8qKgo+ICAgICogcG9wdWxhdGVf
cGFnZSAtIGNvcHkgZGF0YSBub2RlcyBpbnRvIGEgcGFnZSBmb3IgYnVsay1yZWFkLgo+ICAgICog
QGM6IFVCSUZTIGZpbGUtc3lzdGVtIGRlc2NyaXB0aW9uIG9iamVjdAo+IC0gKiBAcGFnZTogcGFn
ZQo+ICsgKiBAZm9saW86IGZvbGlvCj4gICAgKiBAYnU6IGJ1bGstcmVhZCBpbmZvcm1hdGlvbgo+
ICAgICogQG46IG5leHQgemJyYW5jaCBzbG90Cj4gICAgKgo+ICAgICogUmV0dXJuczogJTAgb24g
c3VjY2VzcyBhbmQgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIG9uIGZhaWx1cmUuCj4gICAgKi8KPiAt
c3RhdGljIGludCBwb3B1bGF0ZV9wYWdlKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBzdHJ1Y3QgcGFn
ZSAqcGFnZSwKPiArc3RhdGljIGludCBwb3B1bGF0ZV9wYWdlKHN0cnVjdCB1Ymlmc19pbmZvICpj
LCBzdHJ1Y3QgZm9saW8gKmZvbGlvLAo+ICAgCQkJIHN0cnVjdCBidV9pbmZvICpidSwgaW50ICpu
KQo+ICAgewo+ICAgCWludCBpID0gMCwgbm4gPSAqbiwgb2ZmcyA9IGJ1LT56YnJhbmNoWzBdLm9m
ZnMsIGhvbGUgPSAwLCByZWFkID0gMDsKPiAtCXN0cnVjdCBpbm9kZSAqaW5vZGUgPSBwYWdlLT5t
YXBwaW5nLT5ob3N0Owo+ICsJc3RydWN0IGlub2RlICppbm9kZSA9IGZvbGlvLT5tYXBwaW5nLT5o
b3N0Owo+ICAgCWxvZmZfdCBpX3NpemUgPSBpX3NpemVfcmVhZChpbm9kZSk7Cj4gICAJdW5zaWdu
ZWQgaW50IHBhZ2VfYmxvY2s7Cj4gICAJdm9pZCAqYWRkciwgKnphZGRyOwo+ICAgCXBnb2ZmX3Qg
ZW5kX2luZGV4Owo+ICAgCj4gICAJZGJnX2dlbigiaW5vICVsdSwgcGcgJWx1LCBpX3NpemUgJWxs
ZCwgZmxhZ3MgJSNseCIsCj4gLQkJaW5vZGUtPmlfaW5vLCBwYWdlLT5pbmRleCwgaV9zaXplLCBw
YWdlLT5mbGFncyk7Cj4gKwkJaW5vZGUtPmlfaW5vLCBmb2xpby0+aW5kZXgsIGlfc2l6ZSwgZm9s
aW8tPmZsYWdzKTsKPiAgIAo+IC0JYWRkciA9IHphZGRyID0ga21hcChwYWdlKTsKPiArCWFkZHIg
PSB6YWRkciA9IGttYXBfbG9jYWxfZm9saW8oZm9saW8sIDApOwo+ICAgCj4gICAJZW5kX2luZGV4
ID0gKGlfc2l6ZSAtIDEpID4+IFBBR0VfU0hJRlQ7Cj4gLQlpZiAoIWlfc2l6ZSB8fCBwYWdlLT5p
bmRleCA+IGVuZF9pbmRleCkgewo+ICsJaWYgKCFpX3NpemUgfHwgZm9saW8tPmluZGV4ID4gZW5k
X2luZGV4KSB7Cj4gICAJCWhvbGUgPSAxOwo+IC0JCW1lbXNldChhZGRyLCAwLCBQQUdFX1NJWkUp
Owo+ICsJCWFkZHIgPSBmb2xpb196ZXJvX3RhaWwoZm9saW8sIDAsIGFkZHIpOwo+ICAgCQlnb3Rv
IG91dF9ob2xlOwo+ICAgCX0KPiAgIAo+IC0JcGFnZV9ibG9jayA9IHBhZ2UtPmluZGV4IDw8IFVC
SUZTX0JMT0NLU19QRVJfUEFHRV9TSElGVDsKPiArCXBhZ2VfYmxvY2sgPSBmb2xpby0+aW5kZXgg
PDwgVUJJRlNfQkxPQ0tTX1BFUl9QQUdFX1NISUZUOwo+ICAgCXdoaWxlICgxKSB7Cj4gICAJCWlu
dCBlcnIsIGxlbiwgb3V0X2xlbiwgZGxlbjsKPiAgIAo+IEBAIC02NjksOSArNjY5LDEzIEBAIHN0
YXRpYyBpbnQgcG9wdWxhdGVfcGFnZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgc3RydWN0IHBhZ2Ug
KnBhZ2UsCj4gICAJCQlicmVhazsKPiAgIAkJYWRkciArPSBVQklGU19CTE9DS19TSVpFOwo+ICAg
CQlwYWdlX2Jsb2NrICs9IDE7Cj4gKwkJaWYgKGZvbGlvX3Rlc3RfaGlnaG1lbShmb2xpbykgJiYg
KG9mZnNldF9pbl9wYWdlKGFkZHIpID09IDApKSB7Cj4gKwkJCWt1bm1hcF9sb2NhbChhZGRyIC0g
VUJJRlNfQkxPQ0tfU0laRSk7Cj4gKwkJCWFkZHIgPSBrbWFwX2xvY2FsX2ZvbGlvKGZvbGlvLCBp
ICogVUJJRlNfQkxPQ0tfU0laRSk7Cj4gKwkJfQo+ICAgCX0KPiAgIAo+IC0JaWYgKGVuZF9pbmRl
eCA9PSBwYWdlLT5pbmRleCkgewo+ICsJaWYgKGVuZF9pbmRleCA9PSBmb2xpby0+aW5kZXgpIHsK
PiAgIAkJaW50IGxlbiA9IGlfc2l6ZSAmIChQQUdFX1NJWkUgLSAxKTsKPiAgIAo+ICAgCQlpZiAo
bGVuICYmIGxlbiA8IHJlYWQpCj4gQEAgLTY4MCwyMiArNjg0LDE5IEBAIHN0YXRpYyBpbnQgcG9w
dWxhdGVfcGFnZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgc3RydWN0IHBhZ2UgKnBhZ2UsCj4gICAK
PiAgIG91dF9ob2xlOgo+ICAgCWlmIChob2xlKSB7Cj4gLQkJU2V0UGFnZUNoZWNrZWQocGFnZSk7
Cj4gKwkJZm9saW9fc2V0X2NoZWNrZWQoZm9saW8pOwo+ICAgCQlkYmdfZ2VuKCJob2xlIik7Cj4g
ICAJfQo+ICAgCj4gLQlTZXRQYWdlVXB0b2RhdGUocGFnZSk7Cj4gLQlDbGVhclBhZ2VFcnJvcihw
YWdlKTsKPiAtCWZsdXNoX2RjYWNoZV9wYWdlKHBhZ2UpOwo+IC0Ja3VubWFwKHBhZ2UpOwo+ICsJ
Zm9saW9fbWFya191cHRvZGF0ZShmb2xpbyk7Cj4gKwlmbHVzaF9kY2FjaGVfZm9saW8oZm9saW8p
Owo+ICsJa3VubWFwX2xvY2FsKGFkZHIpOwo+ICAgCSpuID0gbm47Cj4gICAJcmV0dXJuIDA7Cj4g
ICAKPiAgIG91dF9lcnI6Cj4gLQlDbGVhclBhZ2VVcHRvZGF0ZShwYWdlKTsKPiAtCVNldFBhZ2VF
cnJvcihwYWdlKTsKPiAtCWZsdXNoX2RjYWNoZV9wYWdlKHBhZ2UpOwo+IC0Ja3VubWFwKHBhZ2Up
Owo+ICsJZmx1c2hfZGNhY2hlX2ZvbGlvKGZvbGlvKTsKPiArCWt1bm1hcF9sb2NhbChhZGRyKTsK
PiAgIAl1Ymlmc19lcnIoYywgImJhZCBkYXRhIG5vZGUgKGJsb2NrICV1LCBpbm9kZSAlbHUpIiwK
PiAgIAkJICBwYWdlX2Jsb2NrLCBpbm9kZS0+aV9pbm8pOwo+ICAgCXJldHVybiAtRUlOVkFMOwo+
IEBAIC03NjMsNyArNzY0LDcgQEAgc3RhdGljIGludCB1Ymlmc19kb19idWxrX3JlYWQoc3RydWN0
IHViaWZzX2luZm8gKmMsIHN0cnVjdCBidV9pbmZvICpidSwKPiAgIAkJCWdvdG8gb3V0X3dhcm47
Cj4gICAJfQo+ICAgCj4gLQllcnIgPSBwb3B1bGF0ZV9wYWdlKGMsICZmb2xpbzEtPnBhZ2UsIGJ1
LCAmbik7Cj4gKwllcnIgPSBwb3B1bGF0ZV9wYWdlKGMsIGZvbGlvMSwgYnUsICZuKTsKPiAgIAlp
ZiAoZXJyKQo+ICAgCQlnb3RvIG91dF93YXJuOwo+ICAgCj4gQEAgLTc4Nyw3ICs3ODgsNyBAQCBz
dGF0aWMgaW50IHViaWZzX2RvX2J1bGtfcmVhZChzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgc3RydWN0
IGJ1X2luZm8gKmJ1LAo+ICAgCQlpZiAoSVNfRVJSKGZvbGlvKSkKPiAgIAkJCWJyZWFrOwo+ICAg
CQlpZiAoIWZvbGlvX3Rlc3RfdXB0b2RhdGUoZm9saW8pKQo+IC0JCQllcnIgPSBwb3B1bGF0ZV9w
YWdlKGMsICZmb2xpby0+cGFnZSwgYnUsICZuKTsKPiArCQkJZXJyID0gcG9wdWxhdGVfcGFnZShj
LCBmb2xpbywgYnUsICZuKTsKPiAgIAkJZm9saW9fdW5sb2NrKGZvbGlvKTsKPiAgIAkJZm9saW9f
cHV0KGZvbGlvKTsKPiAgIAkJaWYgKGVycikKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
