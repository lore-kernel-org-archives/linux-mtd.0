Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50177D39413
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Apr 2026 11:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrjRyY6KHHLt22QHO8vw1b7lN6b8Hh7OUvDUWCPhlSs=; b=iNOgYhopuN6D5gCdBG48LDEuF5
	AsIZSr6whVEO/y3dzDs2Q9o4GmM+0yqE2t5rtLAGK558BaRLvzYFOPvS5GZi3GQ7xNsyfxp/hxNC3
	WNjNN7fs8Q4n3rKa6kde5vpXa0uUS8yrGDcu1d0YIla9pylTzj9xS2S8J21/ppQ0aNf6oT4z709lW
	L4Fn2kuoCurrLOEOg+TV8E3eesROcfsqZifYf8rlyDHxbEK2rwc4X2JYG4bBNncoOWbVtmhKZMDGQ
	2ALC/alIhi38kNT7VA85tovLMx7sYVYn5+QxpGF2EyVidnt7YMFu7xhY6KslFTglad/1xnQ+z2qGv
	XxQPXryQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8G4K-0000000HUj8-1mOe;
	Thu, 02 Apr 2026 11:18:36 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8G4E-0000000HUiJ-0T1X
	for linux-mtd@lists.infradead.org;
	Thu, 02 Apr 2026 11:18:33 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=hrvHFtWCk4lVdFE7TR5/Y397b4q9p9V8q32sVbcY68g=;
	b=4v+ah4IyGH+thHmjB8sRwEe1HaInjJ9AYioFsxpfkD2RcG+Mh56WXdth+tfbpnFxf8U2jR3+D
	w/P74EbUGPN44Fw5gtlKPsRMCrWMIKrKxAAhvStDDiMCg/ijCQ6slAGRQdRkYjGujA/546Z2eGC
	4EH+/Bk8Ay/+ESGEpv7COdA=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fmfLj0SYTznTtw;
	Thu,  2 Apr 2026 19:11:41 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 766D44048B;
	Thu,  2 Apr 2026 19:18:06 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 2 Apr 2026 19:18:05 +0800
Subject: Re: [PATCH] ubifs: prefer kstrtobool_from_user() over custom helper
To: Dmitry Antipov <dmantipov@yandex.ru>, Richard Weinberger <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
References: <20260402081332.523352-1-dmantipov@yandex.ru>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <67df08d1-6bbf-560c-de40-9cf1e88c406a@huawei.com>
Date: Thu, 2 Apr 2026 19:18:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20260402081332.523352-1-dmantipov@yandex.ru>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_041831_630709_D392697F 
X-CRM114-Status: GOOD (  17.20  )
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

1NogMjAyNi80LzIgMTY6MTMsIERtaXRyeSBBbnRpcG92INC0tcA6Cj4gQWRqdXN0ICdkZnNfZmls
ZV93cml0ZSgpJyBhbmQgJ2Rmc19nbG9iYWxfZmlsZV93cml0ZSgpJyB0byBwcmVmZXIgZ2VuZXJp
Ywo+ICdrc3RydG9ib29sX2Zyb21fdXNlcigpJyBvdmVyIGFuIGFkLWhvYyAnaW50ZXJwcmV0X3Vz
ZXJfaW5wdXQoKScgaGVscGVyLAo+IHRodXMgbWFraW5nIHRoZSBsYXR0ZXIgbm90IG5lZWRlZCBh
bnltb3JlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBBbnRpcG92IDxkbWFudGlwb3ZAeWFu
ZGV4LnJ1Pgo+IC0tLQo+ICAgZnMvdWJpZnMvZGVidWcuYyB8IDQ0ICsrKysrKysrKystLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKSwgMzQgZGVsZXRpb25zKC0pCj4gCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxj
aGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvZGVidWcuYyBi
L2ZzL3ViaWZzL2RlYnVnLmMKPiBpbmRleCAxNjBjMTZhYTdiNmUuLjI1MmNmODIwMTJjZiAxMDA2
NDQKPiAtLS0gYS9mcy91Ymlmcy9kZWJ1Zy5jCj4gKysrIGIvZnMvdWJpZnMvZGVidWcuYwo+IEBA
IC0yNzMyLDM5ICsyNzMyLDE0IEBAIHN0YXRpYyBzc2l6ZV90IGRmc19maWxlX3JlYWQoc3RydWN0
IGZpbGUgKmZpbGUsIGNoYXIgX191c2VyICp1LCBzaXplX3QgY291bnQsCj4gICAJcmV0dXJuIHBy
b3ZpZGVfdXNlcl9vdXRwdXQodmFsLCB1LCBjb3VudCwgcHBvcyk7Cj4gICB9Cj4gICAKPiAtLyoq
Cj4gLSAqIGludGVycHJldF91c2VyX2lucHV0IC0gaW50ZXJwcmV0IHVzZXIgZGVidWdmcyBmaWxl
IGlucHV0Lgo+IC0gKiBAdTogdXNlci1wcm92aWRlZCBidWZmZXIgd2l0aCB0aGUgaW5wdXQKPiAt
ICogQGNvdW50OiBidWZmZXIgc2l6ZQo+IC0gKgo+IC0gKiBUaGlzIGlzIGEgaGVscGVyIGZ1bmN0
aW9uIHdoaWNoIGludGVycHJldCB1c2VyIGlucHV0IHRvIGEgYm9vbGVhbiBVQklGUwo+IC0gKiBk
ZWJ1Z2ZzIGZpbGUuIFJldHVybnMgJTAgb3IgJTEgaW4gY2FzZSBvZiBzdWNjZXNzIGFuZCBhIG5l
Z2F0aXZlIGVycm9yIGNvZGUKPiAtICogaW4gY2FzZSBvZiBmYWlsdXJlLgo+IC0gKi8KPiAtc3Rh
dGljIGludCBpbnRlcnByZXRfdXNlcl9pbnB1dChjb25zdCBjaGFyIF9fdXNlciAqdSwgc2l6ZV90
IGNvdW50KQo+IC17Cj4gLQlzaXplX3QgYnVmX3NpemU7Cj4gLQljaGFyIGJ1Zls4XTsKPiAtCj4g
LQlidWZfc2l6ZSA9IG1pbl90KHNpemVfdCwgY291bnQsIChzaXplb2YoYnVmKSAtIDEpKTsKPiAt
CWlmIChjb3B5X2Zyb21fdXNlcihidWYsIHUsIGJ1Zl9zaXplKSkKPiAtCQlyZXR1cm4gLUVGQVVM
VDsKPiAtCj4gLQlpZiAoYnVmWzBdID09ICcxJykKPiAtCQlyZXR1cm4gMTsKPiAtCWVsc2UgaWYg
KGJ1ZlswXSA9PSAnMCcpCj4gLQkJcmV0dXJuIDA7Cj4gLQo+IC0JcmV0dXJuIC1FSU5WQUw7Cj4g
LX0KPiAtCj4gICBzdGF0aWMgc3NpemVfdCBkZnNfZmlsZV93cml0ZShzdHJ1Y3QgZmlsZSAqZmls
ZSwgY29uc3QgY2hhciBfX3VzZXIgKnUsCj4gICAJCQkgICAgICBzaXplX3QgY291bnQsIGxvZmZf
dCAqcHBvcykKPiAgIHsKPiAgIAlzdHJ1Y3QgdWJpZnNfaW5mbyAqYyA9IGZpbGUtPnByaXZhdGVf
ZGF0YTsKPiAgIAlzdHJ1Y3QgdWJpZnNfZGVidWdfaW5mbyAqZCA9IGMtPmRiZzsKPiAgIAlzdHJ1
Y3QgZGVudHJ5ICpkZW50ID0gZmlsZS0+Zl9wYXRoLmRlbnRyeTsKPiAtCWludCB2YWw7Cj4gKwli
b29sIHZhbDsKPiArCWludCByZXQ7Cj4gICAKPiAgIAlpZiAoZmlsZS0+Zl9wYXRoLmRlbnRyeSA9
PSBkLT5kZnNfZHVtcF9scHJvcHMpIHsKPiAgIAkJdWJpZnNfZHVtcF9scHJvcHMoYyk7Cj4gQEAg
LTI3ODEsOSArMjc1Niw5IEBAIHN0YXRpYyBzc2l6ZV90IGRmc19maWxlX3dyaXRlKHN0cnVjdCBm
aWxlICpmaWxlLCBjb25zdCBjaGFyIF9fdXNlciAqdSwKPiAgIAkJcmV0dXJuIGNvdW50Owo+ICAg
CX0KPiAgIAo+IC0JdmFsID0gaW50ZXJwcmV0X3VzZXJfaW5wdXQodSwgY291bnQpOwo+IC0JaWYg
KHZhbCA8IDApCj4gLQkJcmV0dXJuIHZhbDsKPiArCXJldCA9IGtzdHJ0b2Jvb2xfZnJvbV91c2Vy
KHUsIGNvdW50LCAmdmFsKTsKPiArCWlmICh1bmxpa2VseShyZXQpKQo+ICsJCXJldHVybiByZXQ7
Cj4gICAKPiAgIAlpZiAoZGVudCA9PSBkLT5kZnNfY2hrX2dlbikKPiAgIAkJZC0+Y2hrX2dlbiA9
IHZhbDsKPiBAQCAtMjkyNiwxMSArMjkwMSwxMiBAQCBzdGF0aWMgc3NpemVfdCBkZnNfZ2xvYmFs
X2ZpbGVfd3JpdGUoc3RydWN0IGZpbGUgKmZpbGUsIGNvbnN0IGNoYXIgX191c2VyICp1LAo+ICAg
CQkJCSAgICAgc2l6ZV90IGNvdW50LCBsb2ZmX3QgKnBwb3MpCj4gICB7Cj4gICAJc3RydWN0IGRl
bnRyeSAqZGVudCA9IGZpbGUtPmZfcGF0aC5kZW50cnk7Cj4gLQlpbnQgdmFsOwo+ICsJYm9vbCB2
YWw7Cj4gKwlpbnQgcmV0Owo+ICAgCj4gLQl2YWwgPSBpbnRlcnByZXRfdXNlcl9pbnB1dCh1LCBj
b3VudCk7Cj4gLQlpZiAodmFsIDwgMCkKPiAtCQlyZXR1cm4gdmFsOwo+ICsJcmV0ID0ga3N0cnRv
Ym9vbF9mcm9tX3VzZXIodSwgY291bnQsICZ2YWwpOwo+ICsJaWYgKHVubGlrZWx5KHJldCkpCj4g
KwkJcmV0dXJuIHJldDsKPiAgIAo+ICAgCWlmIChkZW50ID09IGRmc19jaGtfZ2VuKQo+ICAgCQl1
Ymlmc19kYmcuY2hrX2dlbiA9IHZhbDsKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
