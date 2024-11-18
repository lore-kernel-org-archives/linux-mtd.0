Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F5AD10F57
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2024 05:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dn46LxjIgviTKq7l7+95KbHMKjJOgFoN4WpY/eA6ovw=; b=fJ35avoISZrWwq2f2MzZ9i/7qC
	vxJW/Hn3bZrvjaMjqV4idJNeEA0mMjGhHnZ7nBfyWMzL4aGnuOVkPcKXVeG5sDLilW7nypUyehTxI
	8sbwpkLSkOxMdmZi0JRONpLYV1XpXbVcfig3Whz+xzi0JCyrTvjFyDY7FBiXmCG/piu6VK2pJu9oP
	mT0mKKtFxC3Q2oON7y9tm6vAybFt7kZHpKmkFlwJeMNn0+41SlkjTv+WkPk0OXaRq4o9USblZjX5O
	/eRL0gorAdj3Bh4mtSUhGEYwSo5HrYnopuHgfHn7B79V1uv1QFWiGMMOknygxmF0Go7DSAOO8VRBX
	M1zxriaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCuF8-00000008O8O-2Xrj;
	Mon, 18 Nov 2024 05:24:10 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCuDP-00000008NUX-1gco
	for linux-mtd@lists.infradead.org;
	Mon, 18 Nov 2024 05:22:25 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XsGD063cWz2GZky;
	Mon, 18 Nov 2024 13:20:16 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id F00B5140135;
	Mon, 18 Nov 2024 13:22:12 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 18 Nov 2024 13:22:11 +0800
Subject: Re: [PATCH 1/2] jffs2: initialize filesystem-private inode info in
 ->alloc_inode callback
To: Fedor Pchelkin <pchelkin@ispras.ru>, Richard Weinberger <richard@nod.at>
CC: David Woodhouse <dwmw2@infradead.org>, Wang Yong <wang.yong12@zte.com.cn>,
	Lu Zhongjun <lu.zhongjun@zte.com.cn>, Yang Tao <yang.tao172@zte.com.cn>, Al
 Viro <viro@zeniv.linux.org.uk>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>,
	<stable@vger.kernel.org>
References: <20241117184412.366672-1-pchelkin@ispras.ru>
 <20241117184412.366672-2-pchelkin@ispras.ru>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <c68152b5-e91a-2296-21fd-c6a80a406958@huawei.com>
Date: Mon, 18 Nov 2024 13:22:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241117184412.366672-2-pchelkin@ispras.ru>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_212223_734442_087273E0 
X-CRM114-Status: GOOD (  24.43  )
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

1NogMjAyNC8xMS8xOCAyOjQ0LCBGZWRvciBQY2hlbGtpbiDQtLXAOgo+IFRoZSBzeW1saW5rIGJv
ZHkgKC0+dGFyZ2V0KSBzaG91bGQgYmUgZnJlZWQgYXQgdGhlIHNhbWUgdGltZSBhcyB0aGUgaW5v
ZGUKPiBpdHNlbGYgcGVyIGNvbW1pdCA0ZmRjZmFiNWI1NTMgKCJqZmZzMjogZml4IHVzZS1hZnRl
ci1mcmVlIG9uIHN5bWxpbmsKPiB0cmF2ZXJzYWwiKS4gSXQgaXMgYSBmaWxlc3lzdGVtLXNwZWNp
ZmljIGZpZWxkIGJ1dCB0aGVyZSBleGlzdCBzZXZlcmFsCj4gZXJyb3IgcGF0aHMgZHVyaW5nIGdl
bmVyaWMgaW5vZGUgYWxsb2NhdGlvbiB3aGVuIC0+ZnJlZV9pbm9kZSgpLCBuYW1lbHkKPiBqZmZz
Ml9mcmVlX2lub2RlKCksIGlzIGNhbGxlZCB3aXRoIHN0aWxsIHVuaW5pdGlhbGl6ZWQgcHJpdmF0
ZSBpbmZvLgo+IAo+IFRoZSBjYWxsdHJhY2UgbG9va3MgbGlrZToKPiAgIGFsbG9jX2lub2RlCj4g
ICAgaW5vZGVfaW5pdF9hbHdheXMgLy8gZmFpbHMKPiAgICAgaV9jYWxsYmFjawo+ICAgICAgZnJl
ZV9pbm9kZQo+ICAgICAgamZmczJfZnJlZV9pbm9kZSAvLyB0b3VjaGVzIHVuaW5pdCAtPnRhcmdl
dCBmaWVsZAo+IAo+IENvbW1pdCBhZjlhODczMGRkYjYgKCJqZmZzMjogRml4IHBvdGVudGlhbCBp
bGxlZ2FsIGFkZHJlc3MgYWNjZXNzIGluCj4gamZmczJfZnJlZV9pbm9kZSIpIGFwcHJvYWNoZWQg
dGhlIG9ic2VydmVkIHByb2JsZW0gYnV0IGZpeGVkIGl0IG9ubHkKPiBwYXJ0aWFsbHkuIE91ciBs
b2NhbCBTeXprYWxsZXIgaW5zdGFuY2UgaXMgc3RpbGwgaGl0dGluZyB0aGVzZSBraW5kcyBvZgo+
IGZhaWx1cmVzLgo+IAo+IFRoZSB0aGluZyBpcyB0aGF0IGpmZnMyX2lfaW5pdF9vbmNlKCksIHdo
ZXJlIHRoZSBpbml0aWFsaXphdGlvbiBvZgo+IGYtPnRhcmdldCBoYXMgYmVlbiBtb3ZlZCwgaXMg
Y2FsbGVkIG9uY2UgcGVyIHNsYWIgYWxsb2NhdGlvbiBzbyBpdCB3b24ndAo+IGJlIGNhbGxlZCBm
b3IgdGhlIG9iamVjdCBzdHJ1Y3R1cmUgcG9zc2libHkgcmV0cmlldmVkIGxhdGVyIGZyb20gdGhl
IHNsYWIKPiBjYWNoZSBmb3IgcmV1c2UuCj4gCj4gVGhlIHByYWN0aWNlIGZvbGxvd2VkIGJ5IG1h
bnkgb3RoZXIgZmlsZXN5c3RlbXMgaXMgdG8gaW5pdGlhbGl6ZQo+IGZpbGVzeXN0ZW0tcHJpdmF0
ZSBpbm9kZSBjb250ZW50cyBpbiB0aGUgY29ycmVzcG9uZGluZyAtPmFsbG9jX2lub2RlKCkKPiBj
YWxsYmFja3MuIFRoaXMgYWxzbyBhbGxvd3MgdG8gZHJvcCBpbml0aWFsaXphdGlvbiBmcm9tIGpm
ZnMyX2lnZXQoKSBhbmQKPiBqZmZzMl9uZXdfaW5vZGUoKSBhcyAtPmFsbG9jX2lub2RlKCkgaXMg
Y2FsbGVkIGluIHRob3NlIHBsYWNlcy4KPiAKPiBGb3VuZCBieSBMaW51eCBWZXJpZmljYXRpb24g
Q2VudGVyIChsaW51eHRlc3Rpbmcub3JnKSB3aXRoIFN5emthbGxlci4KPiAKPiBGaXhlczogNGZk
Y2ZhYjViNTUzICgiamZmczI6IGZpeCB1c2UtYWZ0ZXItZnJlZSBvbiBzeW1saW5rIHRyYXZlcnNh
bCIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBGZWRvciBQ
Y2hlbGtpbiA8cGNoZWxraW5AaXNwcmFzLnJ1Pgo+IC0tLQo+ICAgZnMvamZmczIvZnMuYyAgICB8
IDIgLS0KPiAgIGZzL2pmZnMyL3N1cGVyLmMgfCAzICsrLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCgpSZXZpZXdlZC1ieTogWmhpaGFvIENo
ZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiBkaWZmIC0tZ2l0IGEvZnMvamZmczIvZnMu
YyBiL2ZzL2pmZnMyL2ZzLmMKPiBpbmRleCBkMTc1Y2NjYjdjNTUuLjg1YzRiMjczOTE4ZiAxMDA2
NDQKPiAtLS0gYS9mcy9qZmZzMi9mcy5jCj4gKysrIGIvZnMvamZmczIvZnMuYwo+IEBAIC0yNzEs
NyArMjcxLDYgQEAgc3RydWN0IGlub2RlICpqZmZzMl9pZ2V0KHN0cnVjdCBzdXBlcl9ibG9jayAq
c2IsIHVuc2lnbmVkIGxvbmcgaW5vKQo+ICAgCWYgPSBKRkZTMl9JTk9ERV9JTkZPKGlub2RlKTsK
PiAgIAljID0gSkZGUzJfU0JfSU5GTyhpbm9kZS0+aV9zYik7Cj4gICAKPiAtCWpmZnMyX2luaXRf
aW5vZGVfaW5mbyhmKTsKPiAgIAltdXRleF9sb2NrKCZmLT5zZW0pOwo+ICAgCj4gICAJcmV0ID0g
amZmczJfZG9fcmVhZF9pbm9kZShjLCBmLCBpbm9kZS0+aV9pbm8sICZsYXRlc3Rfbm9kZSk7Cj4g
QEAgLTQzOSw3ICs0MzgsNiBAQCBzdHJ1Y3QgaW5vZGUgKmpmZnMyX25ld19pbm9kZSAoc3RydWN0
IGlub2RlICpkaXJfaSwgdW1vZGVfdCBtb2RlLCBzdHJ1Y3QgamZmczJfcgo+ICAgCQlyZXR1cm4g
RVJSX1BUUigtRU5PTUVNKTsKPiAgIAo+ICAgCWYgPSBKRkZTMl9JTk9ERV9JTkZPKGlub2RlKTsK
PiAtCWpmZnMyX2luaXRfaW5vZGVfaW5mbyhmKTsKPiAgIAltdXRleF9sb2NrKCZmLT5zZW0pOwo+
ICAgCj4gICAJbWVtc2V0KHJpLCAwLCBzaXplb2YoKnJpKSk7Cj4gZGlmZiAtLWdpdCBhL2ZzL2pm
ZnMyL3N1cGVyLmMgYi9mcy9qZmZzMi9zdXBlci5jCj4gaW5kZXggNDU0NWY4ODVjNDFlLi5iNTZm
ZjYzMzU3ZjMgMTAwNjQ0Cj4gLS0tIGEvZnMvamZmczIvc3VwZXIuYwo+ICsrKyBiL2ZzL2pmZnMy
L3N1cGVyLmMKPiBAQCAtNDIsNiArNDIsOCBAQCBzdGF0aWMgc3RydWN0IGlub2RlICpqZmZzMl9h
bGxvY19pbm9kZShzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiKQo+ICAgCWYgPSBhbGxvY19pbm9kZV9z
YihzYiwgamZmczJfaW5vZGVfY2FjaGVwLCBHRlBfS0VSTkVMKTsKPiAgIAlpZiAoIWYpCj4gICAJ
CXJldHVybiBOVUxMOwo+ICsKPiArCWpmZnMyX2luaXRfaW5vZGVfaW5mbyhmKTsKPiAgIAlyZXR1
cm4gJmYtPnZmc19pbm9kZTsKPiAgIH0KPiAgIAo+IEBAIC01OCw3ICs2MCw2IEBAIHN0YXRpYyB2
b2lkIGpmZnMyX2lfaW5pdF9vbmNlKHZvaWQgKmZvbykKPiAgIAlzdHJ1Y3QgamZmczJfaW5vZGVf
aW5mbyAqZiA9IGZvbzsKPiAgIAo+ICAgCW11dGV4X2luaXQoJmYtPnNlbSk7Cj4gLQlmLT50YXJn
ZXQgPSBOVUxMOwo+ICAgCWlub2RlX2luaXRfb25jZSgmZi0+dmZzX2lub2RlKTsKPiAgIH0KPiAg
IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
