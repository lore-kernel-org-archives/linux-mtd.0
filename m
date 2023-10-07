Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DA8E9413D
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Oct 2023 01:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRYWghh1I24l/mm6tHMWeudRYn3Nk61WI6mQd0wzDTo=; b=ptbxnH5feJXkSV67fVfiVy5Jci
	u8rABSsrSRwZRrUA/CZhWdF3fOhpPVsqDEo4oeZQqHKeOL0Ijb63sqwLcuPJ9mojLJp0fiLYCD1zb
	i+8llp9L0yUFenjLDJm9qYStexM48QLV/pLLoduHbRcsickBpyT/3rQ0IAQisGleaHiZNDePn3yUg
	Qo4gZUVtNhYM2wC9+1OCD1ikvPjx2Dv0aquTDMeslHTnmxNv+I7hrAmRN1DWTlKdimSkm0NIFDFbx
	BO0712mw1d//+2aTJLQ3aewsPN4XDakHy+5HaKVUO0xLBnnaQlfA80IQj60S7TEUBG6G2HDhVAniA
	IYyvXFsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qowIA-006lTC-2j;
	Sat, 07 Oct 2023 01:39:42 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qowI6-006lS2-10
	for linux-mtd@lists.infradead.org;
	Sat, 07 Oct 2023 01:39:40 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4S2SZf54PBzrTNN;
	Sat,  7 Oct 2023 09:36:58 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Sat, 7 Oct 2023 09:39:26 +0800
Subject: Re: [PATCH 25/29] ubifs: move ubifs_xattr_handlers to .rodata
To: Wedson Almeida Filho <wedsonaf@gmail.com>, Alexander Viro
	<viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
	<linux-fsdevel@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Wedson Almeida Filho
	<walmeida@microsoft.com>, Richard Weinberger <richard@nod.at>,
	<linux-mtd@lists.infradead.org>
References: <20230930050033.41174-1-wedsonaf@gmail.com>
 <20230930050033.41174-26-wedsonaf@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <3b1f3981-639b-83ea-a691-b919f9838644@huawei.com>
Date: Sat, 7 Oct 2023 09:39:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230930050033.41174-26-wedsonaf@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_183938_516664_D23B26A5 
X-CRM114-Status: GOOD (  12.78  )
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

1NogMjAyMy85LzMwIDEzOjAwLCBXZWRzb24gQWxtZWlkYSBGaWxobyDQtLXAOgo+IEZyb206IFdl
ZHNvbiBBbG1laWRhIEZpbGhvIDx3YWxtZWlkYUBtaWNyb3NvZnQuY29tPgo+IAo+IFRoaXMgbWFr
ZXMgaXQgaGFyZGVyIGZvciBhY2NpZGVudGFsIG9yIG1hbGljaW91cyBjaGFuZ2VzIHRvCj4gdWJp
ZnNfeGF0dHJfaGFuZGxlcnMgYXQgcnVudGltZS4KPiAKPiBDYzogUmljaGFyZCBXZWluYmVyZ2Vy
IDxyaWNoYXJkQG5vZC5hdD4KPiBDYzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBT
aWduZWQtb2ZmLWJ5OiBXZWRzb24gQWxtZWlkYSBGaWxobyA8d2FsbWVpZGFAbWljcm9zb2Z0LmNv
bT4KPiAtLS0KPiAgIGZzL3ViaWZzL3ViaWZzLmggfCAyICstCj4gICBmcy91Ymlmcy94YXR0ci5j
IHwgMiArLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4K
Cj4gCj4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL3ViaWZzLmggYi9mcy91Ymlmcy91Ymlmcy5oCj4g
aW5kZXggNGMzNjA0NDE0MGU3Li44YTlhNjYyNTVlN2UgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMv
dWJpZnMuaAo+ICsrKyBiL2ZzL3ViaWZzL3ViaWZzLmgKPiBAQCAtMjA0Myw3ICsyMDQzLDcgQEAg
c3NpemVfdCB1Ymlmc194YXR0cl9nZXQoc3RydWN0IGlub2RlICpob3N0LCBjb25zdCBjaGFyICpu
YW1lLCB2b2lkICpidWYsCj4gICAJCQlzaXplX3Qgc2l6ZSk7Cj4gICAKPiAgICNpZmRlZiBDT05G
SUdfVUJJRlNfRlNfWEFUVFIKPiAtZXh0ZXJuIGNvbnN0IHN0cnVjdCB4YXR0cl9oYW5kbGVyICp1
Ymlmc194YXR0cl9oYW5kbGVyc1tdOwo+ICtleHRlcm4gY29uc3Qgc3RydWN0IHhhdHRyX2hhbmRs
ZXIgKiBjb25zdCB1Ymlmc194YXR0cl9oYW5kbGVyc1tdOwo+ICAgc3NpemVfdCB1Ymlmc19saXN0
eGF0dHIoc3RydWN0IGRlbnRyeSAqZGVudHJ5LCBjaGFyICpidWZmZXIsIHNpemVfdCBzaXplKTsK
PiAgIHZvaWQgdWJpZnNfZXZpY3RfeGF0dHJfaW5vZGUoc3RydWN0IHViaWZzX2luZm8gKmMsIGlu
b190IHhhdHRyX2ludW0pOwo+ICAgaW50IHViaWZzX3B1cmdlX3hhdHRycyhzdHJ1Y3QgaW5vZGUg
Kmhvc3QpOwo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy94YXR0ci5jIGIvZnMvdWJpZnMveGF0dHIu
Ywo+IGluZGV4IDM0OTIyOGRkMTE5MS4uNWUxN2U5NTkxZTZlIDEwMDY0NAo+IC0tLSBhL2ZzL3Vi
aWZzL3hhdHRyLmMKPiArKysgYi9mcy91Ymlmcy94YXR0ci5jCj4gQEAgLTczNSw3ICs3MzUsNyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHhhdHRyX2hhbmRsZXIgdWJpZnNfc2VjdXJpdHlfeGF0dHJf
aGFuZGxlciA9IHsKPiAgIH07Cj4gICAjZW5kaWYKPiAgIAo+IC1jb25zdCBzdHJ1Y3QgeGF0dHJf
aGFuZGxlciAqdWJpZnNfeGF0dHJfaGFuZGxlcnNbXSA9IHsKPiArY29uc3Qgc3RydWN0IHhhdHRy
X2hhbmRsZXIgKiBjb25zdCB1Ymlmc194YXR0cl9oYW5kbGVyc1tdID0gewo+ICAgCSZ1Ymlmc191
c2VyX3hhdHRyX2hhbmRsZXIsCj4gICAJJnViaWZzX3RydXN0ZWRfeGF0dHJfaGFuZGxlciwKPiAg
ICNpZmRlZiBDT05GSUdfVUJJRlNfRlNfU0VDVVJJVFkKPiAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
