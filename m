Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B35C282EC
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 13:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fvGG2cyfmAOB9kC6gRTQJxqrR7u/RkdDQpQ8ae7Cf0M=; b=xUvry4pu/seKP7BsYixq9TPGcC
	oQ6NsWmTL7KI7O5+z1+35VGcdaJvbc7rU/qc/E4NSv21jj77LGMhJTR0IOJVG9kwA5oZMGfiT1jwI
	GTmcUO47lUAKuIEZrn0UuK/GLBfWxqbFsleX3V4wLhUq0rS4bM/ZM+Y2xQwzRJW+LO/6iWCdCpRZQ
	zAvfanuBH1belRNvGq+KCk1HY0G9w7H84Sj/R0jJwY/rIwJyM+8M8vI1EJ781oJbDaMiHUrutBPC6
	gqsitf+9Gya8DqHPOGLgJqnnktOiOYWgb/52BoYLP0ligZN29ErFsRU91rep5rFLlfpUd79nZ2Gus
	YGx8BsLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiJt-0000000BL0i-3u0G;
	Thu, 13 Mar 2025 13:09:53 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiJP-0000000BKw7-36dV
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 13:09:25 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4ZD79s16TTz1cyt7;
	Thu, 13 Mar 2025 21:09:05 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 126CB180102;
	Thu, 13 Mar 2025 21:09:11 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 13 Mar 2025 21:09:10 +0800
Subject: Re: [PATCH v2 1/1] mtd: mtdpart: Do not supply NULL to printf()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20250313091631.243346-1-andriy.shevchenko@linux.intel.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f17a1851-7360-3f18-4e89-dbf6948eeaff@huawei.com>
Date: Thu, 13 Mar 2025 21:09:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250313091631.243346-1-andriy.shevchenko@linux.intel.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_060923_926059_B5881839 
X-CRM114-Status: GOOD (  13.35  )
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

5ZyoIDIwMjUvMy8xMyAxNzoxNSwgQW5keSBTaGV2Y2hlbmtvIOWGmemBkzoKPiBHQ0MgY29tcGls
ZXIgaXMgbm90IGhhcHB5IGFib3V0IE5VTEwgYmVpbmcgc3VwcGxpZWQgYXMgcHJpbnRmKCkgcGFy
YW1ldGVyOgo+IAo+IGRyaXZlcnMvbXRkL210ZHBhcnQuYzo2OTM6MzQ6IGVycm9yOiDigJglc+KA
mSBkaXJlY3RpdmUgYXJndW1lbnQgaXMgbnVsbCBbLVdlcnJvcj1mb3JtYXQtb3ZlcmZsb3c9XQo+
IAo+IE1vdmUgdGhlIGNvZGUgYWZ0ZXIgdGhlIHBhcnNlciB0ZXN0IGZvciBOVUxMLCBhbmQgZHJv
cCB0aGUgdGVybmFyeSBjb21wbGV0ZWx5Lgo+IFRoZSB1c2VyIGNhbiBkZWR1Y3QgdGhpcyBzaW5j
ZSB3aGVuIGl0J3Mgbm90IE5VTEwgdHdvIG1lc3NhZ2VzIHdpbGwgYmUgcHJpbnRlZC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4Lmlu
dGVsLmNvbT4KPiAtLS0KPiAKPiB2MjogY2hhbmdlZCBhcHByb2FjaCB0byByZW1vdmUgdGhhdCB0
ZXJuYXJ5IGNvbXBsZXRlbHksIHNlZW1zIGxlc3MgaGFja2lzaAo+IAo+ICAgZHJpdmVycy9tdGQv
bXRkcGFydC5jIHwgMyArLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBk
ZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3
ZWkuY29tPgo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRwYXJ0LmMgYi9kcml2ZXJz
L210ZC9tdGRwYXJ0LmMKPiBpbmRleCA2ODExYTcxNDM0OWQuLjk5NGU4YzUxZTY3NCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL210ZC9tdGRwYXJ0LmMKPiArKysgYi9kcml2ZXJzL210ZC9tdGRwYXJ0
LmMKPiBAQCAtNjkwLDEwICs2OTAsOSBAQCBpbnQgcGFyc2VfbXRkX3BhcnRpdGlvbnMoc3RydWN0
IG10ZF9pbmZvICptYXN0ZXIsIGNvbnN0IGNoYXIgKmNvbnN0ICp0eXBlcywKPiAgIAkJCXBhcnNl
ciA9IG10ZF9wYXJ0X3BhcnNlcl9nZXQoKnR5cGVzKTsKPiAgIAkJCWlmICghcGFyc2VyICYmICFy
ZXF1ZXN0X21vZHVsZSgiJXMiLCAqdHlwZXMpKQo+ICAgCQkJCXBhcnNlciA9IG10ZF9wYXJ0X3Bh
cnNlcl9nZXQoKnR5cGVzKTsKPiAtCQkJcHJfZGVidWcoIiVzOiBnb3QgcGFyc2VyICVzXG4iLCBt
YXN0ZXItPm5hbWUsCj4gLQkJCQlwYXJzZXIgPyBwYXJzZXItPm5hbWUgOiBOVUxMKTsKPiAgIAkJ
CWlmICghcGFyc2VyKQo+ICAgCQkJCWNvbnRpbnVlOwo+ICsJCQlwcl9kZWJ1ZygiJXM6IGdvdCBw
YXJzZXIgJXNcbiIsIG1hc3Rlci0+bmFtZSwgcGFyc2VyLT5uYW1lKTsKPiAgIAkJCXJldCA9IG10
ZF9wYXJ0X2RvX3BhcnNlKHBhcnNlciwgbWFzdGVyLCAmcHBhcnRzLCBkYXRhKTsKPiAgIAkJCWlm
IChyZXQgPD0gMCkKPiAgIAkJCQltdGRfcGFydF9wYXJzZXJfcHV0KHBhcnNlcik7Cj4gCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
