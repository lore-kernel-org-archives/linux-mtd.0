Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D864DD3C927
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2024 02:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMUnJ1ZmIvpeAnSqxzDzZoEAal73b6Fsz7TYemZhQJo=; b=I39nXKK+n3GV0OWPhB7aPI/N+i
	PVgJbLxNotWWk786i79TuNxau6Qxil087pI88c+D915zgQYFI5PA1DdnICIWnEpxv9GnszttHdGdK
	EeMWidYJr1xcKBkqkBPVTG1NowQky5/elBa72wGPlTktcetk4DrXq08FxbnZ7eMNrOfyRVMpjf8ST
	sslbyuEUhUI2sprLxSDQYge8ZrLwa2VzJx8dleM+v1Z8Ona4h/0aSUY0VJp4cjzH+deRd/KfEqYEo
	WUgxevbiWpKLVyy8cSp4rN01/t7J9Tns1MGPC6BtHIZAFU/CXLQS60Cfea7hAiLqELuVr6V2kH+ZZ
	b7brNSTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2iBT-00000005rtl-1YkW;
	Mon, 21 Oct 2024 02:30:15 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2iBO-00000005rrU-3NSg
	for linux-mtd@lists.infradead.org;
	Mon, 21 Oct 2024 02:30:13 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XWzgM32vLz1HLDB;
	Mon, 21 Oct 2024 10:25:35 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id C2C6314037D;
	Mon, 21 Oct 2024 10:29:53 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 21 Oct 2024 10:29:52 +0800
Subject: Re: [PATCH] mtd: ubi: fix unreleased fwnode_handle in
 find_volume_fwnode()
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>, Richard Weinberger
	<richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh
 Raghavendra <vigneshr@ti.com>, Daniel Golle <daniel@makrotopia.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241019-mtd-uvi-fwnode_handle_put-v1-1-f5ef0d0cf9c8@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f475a196-db30-7aef-6bc7-3c7d0e962382@huawei.com>
Date: Mon, 21 Oct 2024 10:29:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241019-mtd-uvi-fwnode_handle_put-v1-1-f5ef0d0cf9c8@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_193011_139551_54225A11 
X-CRM114-Status: GOOD (  13.80  )
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjQvMTAvMjAgNDoyNywgSmF2aWVyIENhcnJhc2NvIOWGmemBkzoKPiBUaGUgJ2Z3X3Zv
bHMnIGZ3bm9kZV9oYW5kbGUgaW5pdGlhbGl6ZWQgdmlhCj4gZGV2aWNlX2dldF9uYW1lZF9jaGls
ZF9ub2RlKCkgcmVxdWlyZXMgZXhwbGljaXQgY2FsbHMgdG8KPiBmd25vZGVfaGFuZGxlX3B1dCgp
IHdoZW4gdGhlIHZhcmlhYmxlIGlzIG5vIGxvbmdlciByZXF1aXJlZC4KPiAKPiBBZGQgdGhlIG1p
c3NpbmcgY2FsbHMgdG8gZndub2RlX2hhbmRsZV9wdXQoKSBiZWZvcmUgdGhlIGZ1bmN0aW9uCj4g
cmV0dXJucy4KPiAKPiBGaXhlczogNTE5MzJmOWZjNDg3ICgibXRkOiB1Ymk6IHBvcHVsYXRlIHVi
aSB2b2x1bWUgZndub2RlIikKPiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgQ2FycmFzY28gPGphdmll
ci5jYXJyYXNjby5jcnV6QGdtYWlsLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvbXRkL3ViaS92bXQu
YyB8IDIgKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKClJldmlld2VkLWJ5
OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC91Ymkvdm10LmMgYi9kcml2ZXJzL210ZC91Ymkvdm10LmMKPiBpbmRleCA1
YTM1NThiYmI5MDMuLmU1Y2YzYmRjYTNiMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC91Ymkv
dm10LmMKPiArKysgYi9kcml2ZXJzL210ZC91Ymkvdm10LmMKPiBAQCAtMTQzLDggKzE0MywxMCBA
QCBzdGF0aWMgc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZpbmRfdm9sdW1lX2Z3bm9kZShzdHJ1Y3Qg
dWJpX3ZvbHVtZSAqdm9sKQo+ICAgCQkgICAgdm9sLT52b2xfaWQgIT0gdm9saWQpCj4gICAJCQlj
b250aW51ZTsKPiAgIAo+ICsJCWZ3bm9kZV9oYW5kbGVfcHV0KGZ3X3ZvbHMpOwo+ICAgCQlyZXR1
cm4gZndfdm9sOwo+ICAgCX0KPiArCWZ3bm9kZV9oYW5kbGVfcHV0KGZ3X3ZvbHMpOwo+ICAgCj4g
ICAJcmV0dXJuIE5VTEw7Cj4gICB9Cj4gCj4gLS0tCj4gYmFzZS1jb21taXQ6IGYyNDkzNjU1ZDJk
M2Q1YzY5NThlZDk5NmIwNDNjODIxYzIzYWU4ZDMKPiBjaGFuZ2UtaWQ6IDIwMjQxMDE5LW10ZC11
dmktZndub2RlX2hhbmRsZV9wdXQtN2IyMjBkMjc3OGI1Cj4gCj4gQmVzdCByZWdhcmRzLAo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
