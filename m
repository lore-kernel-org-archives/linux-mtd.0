Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C604ECF042D
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2024 01:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c//FDP6F6P692Rze923n2L0lPahChxr7hgPWGQDXSWQ=; b=MaBitkJmGlP+bKSzs0o7dwEZCk
	xy+6olrpnnI0tMwGQoYqBQg9I7/gDk6EQKlZfKIyCFbsFfnoafIWHshMmC1ouXGjibYpAQlVl2dRg
	6DG6adm2IIxJVbalTxETjonqt9CIAizZlVQN/qXMDSotXg6x0ByCWaUH/hJJL1Vl4G3r+OwDVs0Gv
	jqAWEe+cxvKlBpjlSpJWEDKCZX8gfvTu8Oy+1P3rdZKUxVeu1fCTzivTUQUQascTBkBRAW+YO/XFF
	ExdgQRfCcSuHZ5ZogSecZZr/bsyx8bPqCSIwu+N2C6Ogs2gJV/wVvTsiNckJCZGsgT15wKhABcbH/
	iYbdbl3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syLAm-00000007ZEE-3n1n;
	Wed, 09 Oct 2024 01:07:28 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syLAj-00000007ZDY-3jiF
	for linux-mtd@lists.infradead.org;
	Wed, 09 Oct 2024 01:07:27 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XNZSz3VR6zyScm;
	Wed,  9 Oct 2024 09:05:55 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 564A61800CF;
	Wed,  9 Oct 2024 09:07:11 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 9 Oct 2024 09:07:10 +0800
Subject: Re: [PATCH] fs: jffs2: Fix inconsistent indentation in
 jffs2_mark_node_obsolete
To: SurajSonawane2415 <surajsonawane0215@gmail.com>, <dwmw2@infradead.org>,
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241008182411.30387-1-surajsonawane0215@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <442b62cc-a57d-04c4-0e25-07af7a0dad76@huawei.com>
Date: Wed, 9 Oct 2024 09:07:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241008182411.30387-1-surajsonawane0215@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_180726_217870_CC31E0E6 
X-CRM114-Status: GOOD (  12.36  )
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

1NogMjAyNC8xMC85IDI6MjQsIFN1cmFqU29uYXdhbmUyNDE1INC0tcA6Cj4gRnJvbTogU3VyYWog
U29uYXdhbmUgPHN1cmFqc29uYXdhbmUwMjE1QGdtYWlsLmNvbT4KPiAKPiBGaXggdGhlIGluZGVu
dGF0aW9uIHRvIGVuc3VyZSBjb25zaXN0ZW50IGNvZGUgc3R5bGUgYW5kIGltcHJvdmUKPiByZWFk
YWJpbGl0eSwgYW5kIHRvIGZpeCB0aGlzIHdhcm5pbmdzOgo+IGZzL2pmZnMyL25vZGVtZ210LmM6
NjM1IGpmZnMyX21hcmtfbm9kZV9vYnNvbGV0ZSgpIHdhcm46IGluY29uc2lzdGVudAo+IGluZGVu
dGluZwo+IGZzL2pmZnMyL25vZGVtZ210LmM6NjQ2IGpmZnMyX21hcmtfbm9kZV9vYnNvbGV0ZSgp
IHdhcm46IGluY29uc2lzdGVudAo+IGluZGVudGluZwo+IAo+IFNpZ25lZC1vZmYtYnk6IFN1cmFq
IFNvbmF3YW5lIDxzdXJhanNvbmF3YW5lMDIxNUBnbWFpbC5jb20+Cj4gLS0tCj4gICBmcy9qZmZz
Mi9ub2RlbWdtdC5jIHwgOCArKysrLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKPiAKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5n
emhpaGFvMUBodWF3ZWkuY29tPgo+IGRpZmYgLS1naXQgYS9mcy9qZmZzMi9ub2RlbWdtdC5jIGIv
ZnMvamZmczIvbm9kZW1nbXQuYwo+IGluZGV4IGJiYWIyYmRjNy4uY2M1MWM4NWVmIDEwMDY0NAo+
IC0tLSBhL2ZzL2pmZnMyL25vZGVtZ210LmMKPiArKysgYi9mcy9qZmZzMi9ub2RlbWdtdC5jCj4g
QEAgLTYzMCw4ICs2MzAsOCBAQCB2b2lkIGpmZnMyX21hcmtfbm9kZV9vYnNvbGV0ZShzdHJ1Y3Qg
amZmczJfc2JfaW5mbyAqYywgc3RydWN0IGpmZnMyX3Jhd19ub2RlX3JlZgo+ICAgCQkJCQkgIHJl
Zi0+Zmxhc2hfb2Zmc2V0LCBqZWItPnVzZWRfc2l6ZSk7Cj4gICAJCQlCVUcoKTsKPiAgIAkJfSkK
PiAtCQkJamZmczJfZGJnKDEsICJPYnNvbGV0aW5nIHByZXZpb3VzbHkgdW5jaGVja2VkIG5vZGUg
YXQgMHglMDh4IG9mIGxlbiAleFxuIiwKPiAtCQkJCSAgcmVmX29mZnNldChyZWYpLCBmcmVlZF9s
ZW4pOwo+ICsJCWpmZnMyX2RiZygxLCAiT2Jzb2xldGluZyBwcmV2aW91c2x5IHVuY2hlY2tlZCBu
b2RlIGF0IDB4JTA4eCBvZiBsZW4gJXhcbiIsCj4gKwkJCQlyZWZfb2Zmc2V0KHJlZiksIGZyZWVk
X2xlbik7Cj4gICAJCWplYi0+dW5jaGVja2VkX3NpemUgLT0gZnJlZWRfbGVuOwo+ICAgCQljLT51
bmNoZWNrZWRfc2l6ZSAtPSBmcmVlZF9sZW47Cj4gICAJfSBlbHNlIHsKPiBAQCAtNjQxLDggKzY0
MSw4IEBAIHZvaWQgamZmczJfbWFya19ub2RlX29ic29sZXRlKHN0cnVjdCBqZmZzMl9zYl9pbmZv
ICpjLCBzdHJ1Y3QgamZmczJfcmF3X25vZGVfcmVmCj4gICAJCQkJCSAgcmVmLT5mbGFzaF9vZmZz
ZXQsIGplYi0+dXNlZF9zaXplKTsKPiAgIAkJCUJVRygpOwo+ICAgCQl9KQo+IC0JCQlqZmZzMl9k
YmcoMSwgIk9ic29sZXRpbmcgbm9kZSBhdCAweCUwOHggb2YgbGVuICUjeDogIiwKPiAtCQkJCSAg
cmVmX29mZnNldChyZWYpLCBmcmVlZF9sZW4pOwo+ICsJCWpmZnMyX2RiZygxLCAiT2Jzb2xldGlu
ZyBub2RlIGF0IDB4JTA4eCBvZiBsZW4gJSN4OiAiLAo+ICsJCQkJcmVmX29mZnNldChyZWYpLCBm
cmVlZF9sZW4pOwo+ICAgCQlqZWItPnVzZWRfc2l6ZSAtPSBmcmVlZF9sZW47Cj4gICAJCWMtPnVz
ZWRfc2l6ZSAtPSBmcmVlZF9sZW47Cj4gICAJfQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
