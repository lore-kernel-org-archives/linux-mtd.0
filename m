Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE8AC4167B
	for <linux-mtd@archiver.kernel.org>; Sat, 16 Dec 2023 04:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbImfzC6dCeS2cUMBg2Mb8w9fxf3AMDfpoxedhSk+vM=; b=QERa4LkqpomQ/R47w6cwf/9Yqb
	iVwvwGouRVx0UHODSk1FuKcvzdzy+NlH3CUHYYZMz55RTzB+hlvb6eWdGyUaShNV/Nenng/wabr6z
	d7gifgUzr2pknIaEAogChVzmYuoV7BQBI4ltNurLyrfO2Ygy5M9hfC1djHgbWlq5DkeGiVAbn2Jgq
	2Y0w9MYT/k5lX+DIgubr/VFaOm9TYN50zn8vi7nZqTWViF5njiEe81fgbo/F9sasQmIDOiPW+RHeH
	zbpjTP1Gbr9ZpmLexDr591cJBYapbPSimDys/H/QRCP1ZuzraNOsmf0GvY/9wz33vsddkdH5XUHg+
	Plf0r8bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEMVY-005P7r-0O;
	Sat, 16 Dec 2023 04:42:36 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEMVT-005P4G-2r
	for linux-mtd@lists.infradead.org;
	Sat, 16 Dec 2023 04:42:34 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4SsYN44Hd0z1Q6hY;
	Sat, 16 Dec 2023 12:42:12 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id E033C140415;
	Sat, 16 Dec 2023 12:42:23 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 16 Dec 2023 12:42:23 +0800
Subject: Re: [PATCH] mkfs.ubifs: fix xattr scanning for builds with selinux
 support
To: David Oberhollenzer <goliath@infraroot.at>,
	<linux-mtd@lists.infradead.org>
CC: <david.oberhollenzer@sigma-star.at>, <richard@nod.at>
References: <20231215114824.15236-1-goliath@infraroot.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <a301483d-2d63-4335-cc63-3b31d05e2988@huawei.com>
Date: Sat, 16 Dec 2023 12:42:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20231215114824.15236-1-goliath@infraroot.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_204232_296797_180CF984 
X-CRM114-Status: GOOD (  22.37  )
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

1NogMjAyMy8xMi8xNSAxOTo0OCwgRGF2aWQgT2JlcmhvbGxlbnplciDQtLXAOgo+IG1rZnMudWli
ZnMgY2FuIGFkZCBTZWxpbnV4IHhhdHRycyBmcm9tIGEgbGFiZWxpbmcgZmlsZSB1c2luZwo+IGxp
YnNlbGludXggdG8gcGFyc2UgaXQuIFRoZSBjb21taXQgdGhhdCBhZGRlZCB0aGlzIGZlYXR1cmUg
c2ltcGx5Cj4gaW50cm9kdWNlZCBhIHNlcGFyYXRlIGZ1bmN0aW9uLCBpbm9kZV9hZGRfc2VsaW51
eF94YXR0ciwgd2hpY2ggaXMKPiBjYWxsZWQgaW5zdGVhZCBvZiBpbm9kZV9hZGRfeGF0dHIuIElm
IG5vIC0tc2VsaW51eCBhcmd1bWVudCBpcwo+IHNwZWNpZmllZCBmb3IgbWtmcy51YmlmcywgdGhp
cyBpcyBhIG5vLW9wLgo+Cj4gVGhlIHByb2JsZW0gaXMsIHRoYXQgdGhpcyBicmVha3MgeGF0dHIg
c2Nhbm5pbmcgZm9yIGFueSBidWlsZCB3aXRoCj4gU2VsaW51eCBlbmFibGVkLiBUaGUgU2VsaW51
eCB2ZXJzaW9uIGlzIGFsd2F5cyBjYWxsZWQgYW5kIGl0IGRvZXMKPiBub3Qgc2NhbiBmb3IgeGF0
dHJzIG9uIHRoZSBmaWxlc3lzdGVtLCBvciBkaXNwYXRjaCB0byB0aGUgb3JpZ2luYWwuCj4KPiBU
aGlzIGNvbW1pdCBmaXhlcyB0aGUgeGF0dHIgc2Nhbm5pbmcgYmVoYXZpb3IuIFdlIHVuY29uZGl0
aW9uYWxseSBjYWxsCj4gYm90aCBmdW5jdGlvbnMgKHRoZXkgZWFjaCBoYXZlIG5vLW9wIGltcGxl
bWVudGF0aW9ucyBpZiB0aGUgZmVhdHVyZQo+IGlzIG1pc3NpbmcpIGFuZCBpbiB0aGUgcmVndWxh
ciB4YXR0ciBzY2FubmluZyBjb2RlLCB3ZSBza2lwIHNlbGludXgKPiBhdHRyaWJ1dGVzLCBpZiB0
aGUgLS1zZWxpbnV4IG9wdGlvbiB3YXMgZ2l2ZW4uCj4KPiBGaXhlczogZjFmZWNjZWM1YWQ4ICgi
bWtmcy51YmlmczogSW1wbGVtZW50IHNlbGludXggbGFiZWxsaW5nIHN1cHBvcnQiKQo+Cj4gU2ln
bmVkLW9mZi1ieTogRGF2aWQgT2JlcmhvbGxlbnplciA8Z29saWF0aEBpbmZyYXJvb3QuYXQ+Cj4g
LS0tCj4gICB1Ymlmcy11dGlscy9ta2ZzLnViaWZzL21rZnMudWJpZnMuYyB8IDIyICsrKysrKysr
KysrKysrLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA4IGRl
bGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdl
aS5jb20+Cgo+Cj4gZGlmZiAtLWdpdCBhL3ViaWZzLXV0aWxzL21rZnMudWJpZnMvbWtmcy51Ymlm
cy5jIGIvdWJpZnMtdXRpbHMvbWtmcy51Ymlmcy9ta2ZzLnViaWZzLmMKPiBpbmRleCAxNWU2YmRj
Li44ZjhkNDBiIDEwMDY0NAo+IC0tLSBhL3ViaWZzLXV0aWxzL21rZnMudWJpZnMvbWtmcy51Ymlm
cy5jCj4gKysrIGIvdWJpZnMtdXRpbHMvbWtmcy51Ymlmcy9ta2ZzLnViaWZzLmMKPiBAQCAtNTYs
NyArNTYsNiBAQAo+ICAgI2lmZGVmIFdJVEhfU0VMSU5VWAo+ICAgI2RlZmluZSBYQVRUUl9OQU1F
X1NFTElOVVggInNlY3VyaXR5LnNlbGludXgiCj4gICBzdGF0aWMgc3RydWN0IHNlbGFiZWxfaGFu
ZGxlICpzZWhuZDsKPiAtc3RhdGljIGNoYXIgKnNlY29udGV4dDsKPiAgICNlbmRpZgo+ICAgCj4g
ICAvKioKPiBAQCAtMTM4OSw2ICsxMzg4LDE1IEBAIHN0YXRpYyBpbnQgaW5vZGVfYWRkX3hhdHRy
KHN0cnVjdCB1Ymlmc19pbm9fbm9kZSAqaG9zdF9pbm8sCj4gICAJCQljb250aW51ZTsKPiAgIAkJ
fQo+ICAgCj4gKyNpZmRlZiBXSVRIX1NFTElOVVgKPiArCQkvKgo+ICsJCSAgSWdub3JlIHNlbGlu
dXggYXR0cmlidXRlcyBpZiB3ZSBoYXZlIGEgbGFiZWwgZmlsZSwgdGhleSBhcmUKPiArCQkgIGlu
c3RlYWQgcHJvdmlkZWQgYnkgaW5vZGVfYWRkX3NlbGludXhfeGF0dHIuCj4gKwkJICovCj4gKwkJ
aWYgKCFzdHJjbXAobmFtZSwgWEFUVFJfTkFNRV9TRUxJTlVYKSAmJiBjb250ZXh0ICYmIHNlaG5k
KQo+ICsJCQljb250aW51ZTsKPiArI2VuZGlmCj4gKwo+ICAgCQlyZXQgPSBhZGRfeGF0dHIoaG9z
dF9pbm8sIHN0LCBpbnVtLCBuYW1lLCBhdHRyYnVmLCBhdHRyc2l6ZSk7Cj4gICAJCWlmIChyZXQg
PCAwKQo+ICAgCQkJZ290byBvdXRfZnJlZTsKPiBAQCAtMTQxMywxMiArMTQyMSwxMCBAQCBzdGF0
aWMgaW50IGlub2RlX2FkZF9zZWxpbnV4X3hhdHRyKHN0cnVjdCB1Ymlmc19pbm9fbm9kZSAqaG9z
dF9pbm8sCj4gICAJY2hhciAqc2VwYXRoID0gTlVMTDsKPiAgIAljaGFyICpuYW1lOwo+ICAgCXVu
c2lnbmVkIGludCBjb25fc2l6ZTsKPiArCWNoYXIgKnNlY29udGV4dDsKPiAgIAo+IC0JaWYgKCFj
b250ZXh0IHx8ICFzZWhuZCkgewo+IC0JCXNlY29udGV4dCA9IE5VTEw7Cj4gLQkJY29uX3NpemUg
PSAwOwo+ICsJaWYgKCFjb250ZXh0IHx8ICFzZWhuZCkKPiAgIAkJcmV0dXJuIDA7Cj4gLQl9Cj4g
ICAKPiAgIAlpZiAocGF0aF9uYW1lW3N0cmxlbihyb290KV0gPT0gJy8nKQo+ICAgCQlzZXBhdGgg
PSBzdHJkdXAoJnBhdGhfbmFtZVtzdHJsZW4ocm9vdCldKTsKPiBAQCAtMTU5NSwxMSArMTYwMSwx
MSBAQCBzdGF0aWMgaW50IGFkZF9pbm9kZShzdHJ1Y3Qgc3RhdCAqc3QsIGlub190IGludW0sIHZv
aWQgKmRhdGEsCj4gICAJbGVuID0gVUJJRlNfSU5PX05PREVfU1ogKyBkYXRhX2xlbjsKPiAgIAo+
ICAgCWlmICh4YXR0cl9wYXRoKSB7Cj4gLSNpZmRlZiBXSVRIX1NFTElOVVgKPiAgIAkJcmV0ID0g
aW5vZGVfYWRkX3NlbGludXhfeGF0dHIoaW5vLCB4YXR0cl9wYXRoLCBzdCwgaW51bSk7Cj4gLSNl
bHNlCj4gKwkJaWYgKHJldCA8IDApCj4gKwkJCXJldHVybiByZXQ7Cj4gKwo+ICAgCQlyZXQgPSBp
bm9kZV9hZGRfeGF0dHIoaW5vLCB4YXR0cl9wYXRoLCBzdCwgaW51bSk7Cj4gLSNlbmRpZgo+ICAg
CQlpZiAocmV0IDwgMCkKPiAgIAkJCXJldHVybiByZXQ7Cj4gICAJfQoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
