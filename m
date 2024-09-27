Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD1CCDD1B2
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Sep 2024 14:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZqs+UJ63poMzPwowsFELffwm+J5BYXXZfQYOyDuSr0=; b=3BhehJ8+M6ncPNrhsIDP1W8CVh
	m4nMTtZf5AOT9CaDWskIhj9g6IfbvL5Vt1LatbnyEcWJvnhHrwNf5q36878bmAiEGZh99XFesfJe1
	rQmr2cNR+o+StzwcV9ty0Dd+hgfrrfndR7vB/n+MbHW2/Mqvz10BOZGDI07qcbK3gZ8VfIfGDfod4
	+/hGKZy7UngGeQnXnL7KkwjavGLFh5fC3Dx/+hlKNmkTigmKcd5x2E1pbOVR65UGN5m1xvSzyqJjn
	3sZUb4QaantpP/QSFLPvbf6tD8DmxUvvS+vsOm1ry00tlXdaIfNQwx+SWMhpMpAeGq9oauZHOuUKl
	9QQ3c3QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suBid-0000000BQb5-1B1A;
	Fri, 27 Sep 2024 14:13:15 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suBiZ-0000000BQZD-2OeB
	for linux-mtd@lists.infradead.org;
	Fri, 27 Sep 2024 14:13:13 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4XFXTc68KRz1SBt4;
	Fri, 27 Sep 2024 22:12:04 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 880DC18002B;
	Fri, 27 Sep 2024 22:12:55 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 22:12:54 +0800
Subject: Re: [PATCH] ubifs: Convert ubifs to use the new mount API
To: Eric Sandeen <sandeen@redhat.com>, <linux-mtd@lists.infradead.org>
CC: <brauner@kernel.org>, David Howells <dhowells@redhat.com>, Richard
 Weinberger <richard@nod.at>
References: <20240926203604.23622-1-sandeen@redhat.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <6081021a-be81-7877-8c1d-5311d9968124@huawei.com>
Date: Fri, 27 Sep 2024 22:12:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240926203604.23622-1-sandeen@redhat.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_071312_262785_CD2797CF 
X-CRM114-Status: GOOD (  25.01  )
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

1NogMjAyNC85LzI3IDQ6MzYsIEVyaWMgU2FuZGVlbiDQtLXAOgpIaSBFcmljLCB0d28gY29tbWVu
dHMgYmVsb3cuCj4gRnJvbTogRGF2aWQgSG93ZWxscyA8ZGhvd2VsbHNAcmVkaGF0LmNvbT4KPiAK
PiBDb252ZXJ0IHRoZSB1YmlmcyBmaWxlc3lzdGVtIHRvIHRoZSBuZXcgaW50ZXJuYWwgbW91bnQg
QVBJIGFzIHRoZSBvbGQKPiBvbmUgd2lsbCBiZSBvYnNvbGV0ZWQgYW5kIHJlbW92ZWQuICBUaGlz
IGFsbG93cyBncmVhdGVyIGZsZXhpYmlsaXR5IGluCj4gY29tbXVuaWNhdGlvbiBvZiBtb3VudCBw
YXJhbWV0ZXJzIGJldHdlZW4gdXNlcnNwYWNlLCB0aGUgVkZTIGFuZCB0aGUKPiBmaWxlc3lzdGVt
Lgo+IAo+IFNlZSBEb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL21vdW50X2FwaS50eHQgZm9yIG1v
cmUgaW5mb3JtYXRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgSG93ZWxscyA8ZGhvd2Vs
bHNAcmVkaGF0LmNvbT4KPiBbc2FuZGVlbjogZm9yd2FyZC1wb3J0IG9sZCBwYXRjaF0KPiBTaWdu
ZWQtb2ZmLWJ5OiBFcmljIFNhbmRlZW4gPHNhbmRlZW5AcmVkaGF0LmNvbT4KPiBjYzogUmljaGFy
ZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KPiBjYzogWmhpaGFvIENoZW5nIDxjaGVuZ3po
aWhhbzFAaHVhd2VpLmNvbT4KPiBjYzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPiAt
LS0KPiAgIGZzL3ViaWZzL3N1cGVyLmMgfCA0NTkgKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyMDQgaW5zZXJ0aW9ucygr
KSwgMjU1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9zdXBlci5jIGIv
ZnMvdWJpZnMvc3VwZXIuYwo+IGluZGV4IDI5MTU4MzAwNWRkMS4uY2YyZTkxMDRiYWZmIDEwMDY0
NAo+IC0tLSBhL2ZzL3ViaWZzL3N1cGVyLmMKPiArKysgYi9mcy91Ymlmcy9zdXBlci5jClsuLi5d
Cj4gQEAgLTk2Myw3ICs5NjMsNyBAQCBzdGF0aWMgaW50IGNoZWNrX3ZvbHVtZV9lbXB0eShzdHJ1
Y3QgdWJpZnNfaW5mbyAqYykKPiAgICAqIE9wdF9ub19idWxrX3JlYWQ6IGRpc2FibGUgYnVsay1y
ZWFkcwo+ICAgICogT3B0X2Noa19kYXRhX2NyYzogY2hlY2sgQ1JDcyB3aGVuIHJlYWRpbmcgZGF0
YSBub2Rlcwo+ICAgICogT3B0X25vX2Noa19kYXRhX2NyYzogZG8gbm90IGNoZWNrIENSQ3Mgd2hl
biByZWFkaW5nIGRhdGEgbm9kZXMKPiAtICogT3B0X292ZXJyaWRlX2NvbXByOiBvdmVycmlkZSBk
ZWZhdWx0IGNvbXByZXNzb3IKPiArICogT3B0X2NvbXByOiBvdmVycmlkZSBkZWZhdWx0IGNvbXBy
ZXNzb3IKPiAgICAqIE9wdF9hc3NlcnQ6IHNldCB1Ymlmc19hc3NlcnQoKSBhY3Rpb24KPiAgICAq
IE9wdF9hdXRoX2tleTogVGhlIGtleSBuYW1lIHVzZWQgZm9yIGF1dGhlbnRpY2F0aW9uCj4gICAg
KiBPcHRfYXV0aF9oYXNoX25hbWU6IFRoZSBoYXNoIHR5cGUgdXNlZCBmb3IgYXV0aGVudGljYXRp
b24KPiBAQCAtOTc2LDU0ICs5NzYsNDYgQEAgZW51bSB7Cj4gICAJT3B0X25vX2J1bGtfcmVhZCwK
PiAgIAlPcHRfY2hrX2RhdGFfY3JjLAo+ICAgCU9wdF9ub19jaGtfZGF0YV9jcmMsCj4gLQlPcHRf
b3ZlcnJpZGVfY29tcHIsCj4gKwlPcHRfY29tcHIsCgpJTU8sIEkgcHJlZmVyIHRoZSBvbGQgbmFt
ZSAnT3B0X292ZXJyaWRlX2NvbXByJywgaXQgbG9va3MgbW9yZSBjbG9zZXIgdG8gCnRoZSBzZW1h
bnRpY3MuIFVCSUZTIGFscmVhZHkgc2V0IHRoZSBkZWZhdWx0IGNvbXByZXNzb3IgaW4gCidjLT5k
ZWZhdWx0X2NvbXByJywgdGhlICdPcHRfb3ZlcnJpZGVfY29tcHInIGlzIHVzZWQgdG8gb3Zlcndy
aXRlIGl0LgoKWy4uLl0KCj4gLXN0YXRpYyBpbnQgdWJpZnNfcmVtb3VudF9mcyhzdHJ1Y3Qgc3Vw
ZXJfYmxvY2sgKnNiLCBpbnQgKmZsYWdzLCBjaGFyICpkYXRhKQo+ICtzdGF0aWMgaW50IHViaWZz
X3JlY29uZmlndXJlKHN0cnVjdCBmc19jb250ZXh0ICpmYykKPiAgIHsKPiArCXN0cnVjdCBzdXBl
cl9ibG9jayAqc2IgPSBmYy0+cm9vdC0+ZF9zYjsKPiAgIAlpbnQgZXJyOwo+ICAgCXN0cnVjdCB1
Ymlmc19pbmZvICpjID0gc2ItPnNfZnNfaW5mbzsKPiArCXN0cnVjdCB1Ymlmc19pbmZvICpyZWNv
bmYgPSBmYy0+c19mc19pbmZvOwo+ICAgCj4gICAJc3luY19maWxlc3lzdGVtKHNiKTsKPiAtCWRi
Z19nZW4oIm9sZCBmbGFncyAlI2x4LCBuZXcgZmxhZ3MgJSN4Iiwgc2ItPnNfZmxhZ3MsICpmbGFn
cyk7Cj4gKwlkYmdfZ2VuKCJvbGQgZmxhZ3MgJSNseCwgbmV3IGZsYWdzICUjeCIsIHNiLT5zX2Zs
YWdzLCBmYy0+c2JfZmxhZ3MpOwo+ICAgCj4gLQllcnIgPSB1Ymlmc19wYXJzZV9vcHRpb25zKGMs
IGRhdGEsIDEpOwo+IC0JaWYgKGVycikgewo+IC0JCXViaWZzX2VycihjLCAiaW52YWxpZCBvciB1
bmtub3duIHJlbW91bnQgcGFyYW1ldGVyIik7Cj4gLQkJcmV0dXJuIGVycjsKPiAtCX0KPiArCS8q
IEFwcGx5IHRoZSBtb3VudCBvcHRpb24gY2hhbmdlcy4KPiArCSAqCj4gKwkgKiBbIV0gTk9URSBS
ZXBsYWNpbmcgdGhlIGF1dGhfa2V5X25hbWUgYW5kIGF1dGhfaGFzaF9uYW1lIGlzCj4gKwkgKiAg
ICAgdmVyeSBkb2RneSB3aXRob3V0IGxvY2tpbmcuICBQcmV2aW91c2x5IGl0IGp1c3QgbGVha2Vk
Cj4gKwkgKiAgICAgdGhlIG9sZCBzdHJpbmdzLiAgVGhlIHN0cmluZ3Mgb25seSBzZWVtIHRvIGJl
IHVzZWQKPiArCSAqICAgICBkdXJpbmcgbW91bnRpbmcsIHNvIGRvbid0IHJlY29uZmlndXJlIHRo
b3NlLgo+ICsJICovCj4gKwljLT5tb3VudF9vcHRzCQk9IHJlY29uZi0+bW91bnRfb3B0czsKPiAr
CWMtPmJ1bGtfcmVhZAkJPSByZWNvbmYtPmJ1bGtfcmVhZDsKPiArCWMtPm5vX2Noa19kYXRhX2Ny
Ywk9IHJlY29uZi0+bm9fY2hrX2RhdGFfY3JjOwo+ICsJYy0+ZGVmYXVsdF9jb21wcgk9IHJlY29u
Zi0+ZGVmYXVsdF9jb21wcjsKCldlIGNhbm5vdCBvdmVyd3JpdGUgb2xkIGNvbmZpZ3VyYXRpb25z
IHdpdGggbm9uLWZ1bGx5IGluaXRpYWxpemVkIG5ldyAKY29uZmlndXJhdGlvbnMgZGlyZWN0bHks
IG90aGVyd2lzZSBzb21lIG9sZCBvcHRpb25zIHdpbGwgZGlzYXBwZWFyLCBmb3IgCmV4YW1wbGU6
Cltyb290QGxvY2FsaG9zdCB+XSMgbW91bnQgLW9jb21wcj1sem8gL2Rldi91YmkwXzAgdGVtcApb
cm9vdEBsb2NhbGhvc3Qgfl0jIG1vdW50IHwgZ3JlcCB1YmlmcwovZGV2L3ViaTBfMCBvbiAvcm9v
dC90ZW1wIHR5cGUgdWJpZnMgCihydyxyZWxhdGltZSxjb21wcj1sem8sYXNzZXJ0PXJlYWQtb25s
eSx1Ymk9MCx2b2w9MCkKVGhlIGNvbXByZXNzb3IgaXMgc2V0IGFzIGx6by4KW3Jvb3RAbG9jYWxo
b3N0IH5dIyBtb3VudCAtb3JlbW91bnQgL2Rldi91YmkwXzAgdGVtcApbcm9vdEBsb2NhbGhvc3Qg
fl0jIG1vdW50IHwgZ3JlcCB1YmlmcwovZGV2L3ViaTBfMCBvbiAvcm9vdC90ZW1wIHR5cGUgdWJp
ZnMgCihydyxyZWxhdGltZSxhc3NlcnQ9cmVhZC1vbmx5LHViaT0wLHZvbD0wKQoKVGhlIGNvbXBy
ZXNzb3IgaXMgbm90IGx6byBhbnltb3JlLgoKPiArCWMtPmFzc2VydF9hY3Rpb24JPSByZWNvbmYt
PmFzc2VydF9hY3Rpb247Cj4gICAKPiAtCWlmIChjLT5yb19tb3VudCAmJiAhKCpmbGFncyAmIFNC
X1JET05MWSkpIHsKPiArCWlmIChjLT5yb19tb3VudCAmJiAhKGZjLT5zYl9mbGFncyAmIFNCX1JE
T05MWSkpIHsKPiAgIAkJaWYgKGMtPnJvX2Vycm9yKSB7Cj4gICAJCQl1Ymlmc19tc2coYywgImNh
bm5vdCByZS1tb3VudCBSL1cgZHVlIHRvIHByaW9yIGVycm9ycyIpOwo+ICAgCQkJcmV0dXJuIC1F
Uk9GUzsKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
