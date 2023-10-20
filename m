Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003E0CDB47E
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Oct 2023 09:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MN4dQM08ZqK6N7UvKG4xW3OBrZvurBxA4rBjiVQFtLM=; b=jptbXLeEuJyNi0aGCBHqNcjQHa
	XOTGnorokhsJEJ0d2Phtz3MDir/xsiLAPzp6NXuhd9ghv+MtWeP4MR+NKKjLwgSMFtj2YIpUqxDo2
	4Gkbg6FNrwHeidySESiUT+7dSsmPuKXp/TcJD6ghQTtp2fRNBsdCLztgVhlk+BJdSibeM1n4uRB4c
	h8WQ+q+g+lg39jXrTH2lnYZ/VkbXu8SHUG8o3T9zI+8bI4EZ77uBwQ2UmMhwJ7ov3KHhKCvDnCuex
	Uxt1JOjVoZBG7OFDFK50Aq9U5dOniaax9r9eyIEpXqMDB2DYs9l+NohelinmKOM6hgWmZ97yl2JGB
	NfeQmNmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtlWK-001dz2-2I;
	Fri, 20 Oct 2023 09:10:16 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtlWH-001dvX-0y
	for linux-mtd@lists.infradead.org;
	Fri, 20 Oct 2023 09:10:15 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4SBdvs5h7zzYskL;
	Fri, 20 Oct 2023 17:05:13 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 20 Oct 2023 17:09:59 +0800
Subject: Re: [PATCH v3 3/5] ubi: Add six fault injection type for testing
To: ZhaoLong Wang <wangzhaolong1@huawei.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>, <yangerkun@huawei.com>
References: <20231020064803.643399-1-wangzhaolong1@huawei.com>
 <20231020064803.643399-4-wangzhaolong1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <cec45406-85b6-d964-fede-8d16a457308d@huawei.com>
Date: Fri, 20 Oct 2023 17:09:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20231020064803.643399-4-wangzhaolong1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_021013_570514_17ACD43D 
X-CRM114-Status: GOOD (  16.52  )
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

1NogMjAyMy8xMC8yMCAxNDo0OCwgWmhhb0xvbmcgV2FuZyDQtLXAOgo+IFRoaXMgY29tbWl0IGFk
ZHMgc2l4IGZhdWx0IGluamVjdGlvbiB0eXBlIGZvciB0ZXN0aW5nIHRvIGNvdmVyIHRoZQo+IGFi
bm9ybWFsIHBhdGggb2YgdGhlIFVCSSBkcml2ZXIuCj4gCj4gSW5qZWN0IHRoZSBmb2xsb3dpbmcg
ZmF1bHRzIHdoZW4gdGhlIFVCSSByZWFkcyB0aGUgTEVCOgo+ICAgKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rCj4gICB8ICAg
IEludGVyZmFjZSBuYW1lICAgICAgICAgIHwgICAgICAgZW11bGF0ZSBiZWhhdmlvciAgICAgICAg
ICAgIHwKPiAgICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tKwo+ICAgfCAgZW11bGF0ZV9lY2NlcnIgICAgICAgICAgICB8IEVD
QyBlcnJvciAgICAgICAgICAgICAgICAgICAgICAgICB8Cj4gICArLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsKPiAgIHwgIGVt
dWxhdGVfcmVhZF9mYWlsdXJlICAgICAgfCByZWFkIGZhaWx1cmUgICAgICAgICAgICAgICAgICAg
ICAgfAo+ICAgfC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0rCj4gICB8ICBlbXVsYXRlX2lvX2ZmICAgICAgICAgICAgIHwgcmVh
ZCBjb250ZW50IGFzIGFsbCBGRiAgICAgICAgICAgIHwKPiAgIHwtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKwo+ICAgfCAgZW11
bGF0ZV9pb19mZl9iaXRmbGlwcyAgICB8IGNvbnRlbnQgRkYgd2l0aCBNVEQgZXJyIHJlcG9ydGVk
ICB8Cj4gICArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLSsKPiAgIHwgIGVtdWxhdGVfYmFkX2hkciAgICAgICAgICAgfCBiYWQg
bGViIGhlYWRlciAgICAgICAgICAgICAgICAgICAgfAo+ICAgfC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rCj4gICB8ICBlbXVs
YXRlX2JhZF9oZHJfZWJhZG1zZyAgIHwgYmFkIGhlYWRlciB3aXRoIEVDQyBlcnIgICAgICAgICAg
IHwKPiAgICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tKwo+IAo+IFNpZ25lZC1vZmYtYnk6IFpoYW9Mb25nIFdhbmcgPHdhbmd6
aGFvbG9uZzFAaHVhd2VpLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvbXRkL3ViaS9kZWJ1Zy5jIHwg
IDMwICsrKysrKysKPiAgIGRyaXZlcnMvbXRkL3ViaS9kZWJ1Zy5oIHwgMTcwICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KPiAgIGRyaXZlcnMvbXRkL3ViaS9pby5jICAg
IHwgIDc2ICsrKysrKysrKysrKysrKysrLQo+ICAgZHJpdmVycy9tdGQvdWJpL3ViaS5oICAgfCAg
MzAgKysrKy0tLQo+ICAgNCBmaWxlcyBjaGFuZ2VkLCAyODYgaW5zZXJ0aW9ucygrKSwgMjAgZGVs
ZXRpb25zKC0pCj4gCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVh
d2VpLmNvbT4KCk9uZSBzbWFsbCBuaXQgYmVsb3cuCgpbLi4uXQoKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvdWJpL2lvLmMgYi9kcml2ZXJzL210ZC91YmkvaW8uYwo+IGluZGV4IGZmYTdiYmYy
N2JjMi4uODAzZTJiN2YxZDE3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3ViaS9pby5jCj4g
KysrIGIvZHJpdmVycy9tdGQvdWJpL2lvLmMKPiBAQCAtMTk1LDcgKzE5NSwxOSBAQCBpbnQgdWJp
X2lvX3JlYWQoY29uc3Qgc3RydWN0IHViaV9kZXZpY2UgKnViaSwgdm9pZCAqYnVmLCBpbnQgcG51
bSwgaW50IG9mZnNldCwKPiAgIAo+ICAgCQlpZiAodWJpX2RiZ19pc19iaXRmbGlwKHViaSkpIHsK
PiAgIAkJCWRiZ19nZW4oImJpdC1mbGlwIChlbXVsYXRlZCkiKTsKPiAtCQkJZXJyID0gVUJJX0lP
X0JJVEZMSVBTOwo+ICsJCQlyZXR1cm4gIFVCSV9JT19CSVRGTElQUzsKClRoZXJlIGFyZSAyIHNw
YWNlcyBiZXR3ZWVuICdyZXR1cm4nIGFuZCAnVUJJX0lPX0JJVEZMSVBTJy4KCj4gKwkJfQo+ICsK
PiArCQlpZiAodWJpX2RiZ19pc19yZWFkX2ZhaWx1cmUodWJpLCBNQVNLX1JFQURfRkFJTFVSRSkp
IHsKPiArCQkJdWJpX3dhcm4odWJpLCAiY2Fubm90IHJlYWQgJWQgYnl0ZXMgZnJvbSBQRUIgJWQ6
JWQgKGVtdWxhdGVkKSIsCj4gKwkJCQkgbGVuLCBwbnVtLCBvZmZzZXQpOwo+ICsJCQlyZXR1cm4g
LUVJTzsKPiArCQl9Cj4gKwo+ICsJCWlmICh1YmlfZGJnX2lzX2VjY2Vycih1YmkpKSB7Cj4gKwkJ
CXViaV93YXJuKHViaSwgIkVDQyBlcnJvciAoZW11bGF0ZWQpIHdoaWxlIHJlYWRpbmcgJWQgYnl0
ZXMgZnJvbSBQRUIgJWQ6JWQsIHJlYWQgJXpkIGJ5dGVzIiwKPiArCQkJCSBsZW4sIHBudW0sIG9m
ZnNldCwgcmVhZCk7Cj4gKwkJCXJldHVybiAtRUJBRE1TRzsKPiAgIAkJfQo+ICAgCX0KPiAgIAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
