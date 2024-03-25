Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD979C54E64
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 13:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N4AOHwzgPsO1kJudXt4v42siG3EDqYcjGt0a283rccE=; b=Sy/tz0l8d71dqJYSwExFxaEdBu
	FReklFwYOCiNbqRV8uCVVvPWnCpeBP9Ew632rPjANp90K+v9mZ1F2DUcCxpHhGio4LFf46k8xSX4m
	Z9FhW4GjFUpUAzAyWpBvzE9hw/0MuyXu4OKxOUwU+4t2NmDucB3PTBUNmgYuVC6XaktaKhhUZt9dV
	9sMxgwltu+aye5uUoJVMn+4CgMGYXspPd5wTwo8ODl0mAPpi9bIJUzoImaxWzYoVReHc897ghLZcU
	w5zgZwxwP3GFF+Th9mLaT7Ciw55PhsxkHPTTiSDj8SEZ2XHlu8fgeY4BJj09dnLDKfl5nTWXEZ0so
	xBgnHrXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rokfD-000000002u6-2KWe;
	Mon, 25 Mar 2024 13:46:59 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rokf4-000000002pm-0k0S
	for linux-mtd@lists.infradead.org;
	Mon, 25 Mar 2024 13:46:52 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4V3Dfx0HVszXjks;
	Mon, 25 Mar 2024 21:43:53 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 4ED3B140258;
	Mon, 25 Mar 2024 21:46:37 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 21:46:36 +0800
Subject: Re: [PATCH V2] ubifs: correct UBIFS_DFS_DIR_LEN macro definition and
 improve code clarity
To: ZhaoLong Wang <wangzhaolong1@huawei.com>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>, <yangerkun@huawei.com>
References: <20240325125713.95035-1-wangzhaolong1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <3fce4fde-0163-4fd4-feb0-2a68aa785e2f@huawei.com>
Date: Mon, 25 Mar 2024 21:46:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240325125713.95035-1-wangzhaolong1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_064650_778994_A3170D51 
X-CRM114-Status: GOOD (  21.09  )
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

1NogMjAyNC8zLzI1IDIwOjU3LCBaaGFvTG9uZyBXYW5nINC0tcA6Cj4gVGhlIFVCSUZTX0RGU19E
SVJfTEVOIG1hY3JvLCB3aGljaCBkZWZpbmVzIHRoZSBtYXhpbXVtIGxlbmd0aCBvZiB0aGUgVUJJ
RlMKPiBkZWJ1Z2ZzIGRpcmVjdG9yeSBuYW1lLCBoYXMgYW4gaW5jb3JyZWN0IGZvcm11bGEgYW5k
IG1pc2xlYWRpbmcgY29tbWVudHMuCj4gVGhlIGN1cnJlbnQgZm9ybXVsYSBpcyAoMyArIDEgKyAy
KjIgKyAxKSwgd2hpY2ggYXNzdW1lcyB0aGF0IGJvdGggVUJJIGRldmljZQo+IG51bWJlciBhbmQg
dm9sdW1lIElEIGFyZSBsaW1pdGVkIHRvIDIgY2hhcmFjdGVycy4gSG93ZXZlciwgVUJJIGRldmlj
ZSBudW1iZXIKPiByYW5nZXMgZnJvbSAwIHRvIDM3ICgyIGNoYXJhY3RlcnMpLCBhbmQgdm9sdW1l
IElEIHJhbmdlcyBmcm9tIDAgdG8gMTI3ICh1cAo+IHRvIDMgY2hhcmFjdGVycykuCj4gCj4gQWx0
aG91Z2ggdGhlIGN1cnJlbnQgY29kZSB3b3JrcyBkdWUgdG8gdGhlIGNhbmNlbGxhdGlvbiBvZiBt
YXRoZW1hdGljYWwKPiBlcnJvcnMgKDkgKyAxID0gMTAsIHdoaWNoIG1hdGNoZXMgdGhlIGNvcnJl
Y3QgVUJJRlNfREZTX0RJUl9MRU4gdmFsdWUpLCBpdAo+IGNhbiBsZWFkIHRvIGNvbmZ1c2lvbiBh
bmQgcG90ZW50aWFsIGlzc3VlcyBpbiB0aGUgZnV0dXJlLgo+IAo+IFRoaXMgcGF0Y2ggYWltcyB0
byBpbXByb3ZlIHRoZSBjb2RlIGNsYXJpdHkgYW5kIG1haW50YWluYWJpbGl0eSBieSBtYWtpbmcK
PiB0aGUgZm9sbG93aW5nIGNoYW5nZXM6Cj4gCj4gMS4gQ29ycmVjdHMgdGhlIFVCSUZTX0RGU19E
SVJfTEVOIG1hY3JvIGRlZmluaXRpb24gdG8gKDMgKyAxICsgMiArIDMgKyAxKSwKPiAgICAgYWNj
b21tb2RhdGluZyB0aGUgbWF4aW11bSBsZW5ndGhzIG9mIGJvdGggVUJJIGRldmljZSBudW1iZXIg
YW5kIHZvbHVtZSBJRCwKPiAgICAgcGx1cyB0aGUgc2VwYXJhdG9ycyBhbmQgbnVsbCB0ZXJtaW5h
dG9yLgo+IDIuIFVwZGF0ZXMgdGhlIHNucHJpbnRmIGNhbGxzIHRvIHVzZSBVQklGU19ERlNfRElS
X0xFTiBpbnN0ZWFkIG9mCj4gICAgIFVCSUZTX0RGU19ESVJfTEVOICsgMSwgcmVtb3ZpbmcgdGhl
IHVubmVjZXNzYXJ5ICsxLgo+IDMuIE1vZGlmaWVzIHRoZSBlcnJvciBjaGVja3MgdG8gY29tcGFy
ZSBhZ2FpbnN0IFVCSUZTX0RGU19ESVJfTEVOIHVzaW5nID49Cj4gICAgIGluc3RlYWQgb2YgPiwg
YWxpZ25pbmcgd2l0aCB0aGUgY29ycmVjdGVkIG1hY3JvIGRlZmluaXRpb24uCj4gNC4gUmVtb3Zl
cyB0aGUgcmVkdW5kYW50ICsxIGluIHRoZSBkZnNfZGlyX25hbWUgYXJyYXkgZGVmaW5pdGlvbnMg
aW4gdWJpLmgKPiAgICAgYW5kIGRlYnVnLmguCj4gNS4gUmVuYW1lcyB0aGUgZHVwbGljYXRlZCBV
QklGU19ERlNfRElSX0xFTiBhbmQgVUJJRlNfREZTX0RJUl9OQU1FIG1hY3JvcyBpbgo+ICAgICB0
aGUgc3lzZnMtcmVsYXRlZCBjb2RlIChzeXNmcy5jIGFuZCB1Ymlmcy5oKSB0byBVQklGU19TWVNG
U19ESVJfTEVOIGFuZAo+ICAgICBVQklGU19TWVNGU19ESVJfTkFNRSwgcmVzcGVjdGl2ZWx5LCB0
byBkaWZmZXJlbnRpYXRlIHRoZWlyIHVzYWdlIGZyb20gdGhlCj4gICAgIGRlYnVnZnMgY29uc3Rh
bnRzLgo+IApbLi4uXQo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy91Ymlmcy5oIGIvZnMvdWJpZnMv
dWJpZnMuaAo+IGluZGV4IDFmM2VhODc5ZDkzYS4uNTQ5ZTE0N2M1Y2U1IDEwMDY0NAo+IC0tLSBh
L2ZzL3ViaWZzL3ViaWZzLmgKPiArKysgYi9mcy91Ymlmcy91Ymlmcy5oCj4gQEAgLTE1OSwxMCAr
MTU5LDExIEBACj4gICAKPiAgIC8qCj4gICAgKiBUaGUgVUJJRlMgc3lzZnMgZGlyZWN0b3J5IG5h
bWUgcGF0dGVybiBhbmQgbWF4aW11bSBuYW1lIGxlbmd0aCAoMyBmb3IgInViaSIKPiAtICogKyAx
IGZvciAiXyIgYW5kIHBsdXMgMngyIGZvciAyIFVCSSBudW1iZXJzIGFuZCAxIGZvciB0aGUgdHJh
aWxpbmcgemVybyBieXRlLgo+ICsgKiArIDEgZm9yICJfIiBhbmQgMiBmb3IgVUJJIGRldmljZSBu
dW1iZXJzIGFuZCAzIGZvciB2b2x1bWUgbnVtYmVyIGFuZCAxIGZvcgo+ICsgKiB0aGUgdHJhaWxp
bmcgemVybyBieXRlLgo+ICAgICovCj4gLSNkZWZpbmUgVUJJRlNfREZTX0RJUl9OQU1FICJ1Ymkl
ZF8lZCIKPiAtI2RlZmluZSBVQklGU19ERlNfRElSX0xFTiAgKDMgKyAxICsgMioyICsgMSkKPiAr
I2RlZmluZSBVQklGU19TWVNGU19ESVJfTkFNRSAidWJpJWRfJWQiCj4gKyNkZWZpbmUgVUJJRlNf
U1lTRlNfRElSX0xFTiAgKDMgKyAxICsgMiArIDMgKyAxKQoKSSBkb24ndCB0aGlua3MgdGhpcyBy
ZW5hbWluZyBpcyBuZWNlc3NhcnksIGp1c3QgcmVtb3ZlIGl0IGZyb20gInViaWZzLmgiIApsaWtl
IHYxIGRvZXMuCj4gICAKPiAgIC8qCj4gICAgKiBMb2NrZGVwIGNsYXNzZXMgZm9yIFVCSUZTIGlu
b2RlIEB1aV9tdXRleC4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
