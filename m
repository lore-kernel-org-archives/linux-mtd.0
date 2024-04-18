Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E75AC4345F
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2024 07:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2VVAbyRU++wrB/xf+G724C59Q+qVGkEgS3X28lw1sCs=; b=p/9SgJAQ/jfRdbFeJh/UY3xC06
	ueXmxcPOI9Lu3EG4+9wRg7m+WT73ar1hHUplFRNDgkNxbvufCnE5PWIa7Rdj39NMUIZ5yfAwWJUC/
	YsvuvKjXrnGe0VZnlWt78D7xqdSJZKT1yz3UnL2ti1t0kfojXDI70HVGFZJD0Kti/aEXG4wXfRJFN
	jGl2wQEJa/u4o2dyQ9aQAi2liCZKJWo5nTqY7Om3Hb3eIO4H/HLhfi+GoNTd4ncGeX2UkZ9+6SjYM
	JIdsAYspMWbE7xj/jjg+D7nrEjOaPVgEi/CsZGPAl+kyVwi1HYMlmpqtNUNEM9Hgx+9SyumqZrNwt
	CBN+8tRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxLvu-00000001DzY-0vKC;
	Thu, 18 Apr 2024 07:11:46 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxLvq-00000001Dyy-2EWW
	for linux-mtd@lists.infradead.org;
	Thu, 18 Apr 2024 07:11:44 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4VKpmP04R9zNnhS;
	Thu, 18 Apr 2024 15:09:09 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id A37C31800C4;
	Thu, 18 Apr 2024 15:11:33 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 15:11:32 +0800
Subject: Re: [PATCH V3] ubifs: correct UBIFS_DFS_DIR_LEN macro definition and
 improve code clarity
To: ZhaoLong Wang <wangzhaolong1@huawei.com>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>, <yangerkun@huawei.com>
References: <20240418070704.3080590-1-wangzhaolong1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <fde03388-9673-af46-ffef-9d387605d015@huawei.com>
Date: Thu, 18 Apr 2024 15:11:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240418070704.3080590-1-wangzhaolong1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_001142_789947_D0BC3539 
X-CRM114-Status: GOOD (  15.77  )
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

1NogMjAyNC80LzE4IDE1OjA3LCBaaGFvTG9uZyBXYW5nINC0tcA6Cj4gVGhlIFVCSUZTX0RGU19E
SVJfTEVOIG1hY3JvLCB3aGljaCBkZWZpbmVzIHRoZSBtYXhpbXVtIGxlbmd0aCBvZiB0aGUgVUJJ
RlMKPiBkZWJ1Z2ZzIGRpcmVjdG9yeSBuYW1lLCBoYXMgYW4gaW5jb3JyZWN0IGZvcm11bGEgYW5k
IG1pc2xlYWRpbmcgY29tbWVudHMuCj4gVGhlIGN1cnJlbnQgZm9ybXVsYSBpcyAoMyArIDEgKyAy
KjIgKyAxKSwgd2hpY2ggYXNzdW1lcyB0aGF0IGJvdGggVUJJIGRldmljZQo+IG51bWJlciBhbmQg
dm9sdW1lIElEIGFyZSBsaW1pdGVkIHRvIDIgY2hhcmFjdGVycy4gSG93ZXZlciwgVUJJIGRldmlj
ZSBudW1iZXIKPiByYW5nZXMgZnJvbSAwIHRvIDMxICgyIGNoYXJhY3RlcnMpLCBhbmQgdm9sdW1l
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
aW4gdWJpLmgKPiAgICAgYW5kIGRlYnVnLmguCj4gCj4gV2hpbGUgdGhlc2UgY2hhbmdlcyBkbyBu
b3QgYWZmZWN0IHRoZSBydW50aW1lIGJlaGF2aW9yLCB0aGV5IG1ha2UgdGhlIGNvZGUKPiBtb3Jl
IHJlYWRhYmxlLCBtYWludGFpbmFibGUsIGFuZCBsZXNzIHByb25lIHRvIGZ1dHVyZSBlcnJvcnMu
Cj4gCj4gdjItPnYzOgo+IAo+ICAgLSBSZW1vdmVzIHRoZSBkdXBsaWNhdGVkIFVCSUZTX0RGU19E
SVJfTEVOIGFuZCBVQklGU19ERlNfRElSX05BTUUgbWFjcm8KPiAgICAgZGVmaW5pdGlvbnMgaW4g
dWJpZnMuaCwgYXMgdGhleSBhcmUgYWxyZWFkeSBkZWZpbmVkIGluIGRlYnVnLmguCj4gCj4gU2ln
bmVkLW9mZi1ieTogWmhhb0xvbmcgV2FuZyA8d2FuZ3poYW9sb25nMUBodWF3ZWkuY29tPgoKWW91
IGxvc3QgbXkgJ3Jldmlldy1ieScgaW4gbGFzdCB2My4KClJldmlld2VkLWJ5OiBaaGloYW8gQ2hl
bmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
