Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFB9C5478C
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Feb 2024 02:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqv+SM3tDov8DI+gXj1MoJr8nSCvAtZvrxj9oxB4SEE=; b=pOojd09+Z0m5/MGEKzh3pWVWJ4
	HP3mIaFMgJXWYDsGCTmWpDi63p/r6R4FfdSEZalDZz6i92PuRkUh8DnU7+f19tT6czO+IcP/KE1DS
	tOPcmvPvzExsb4DVeJynA6BUB42wZD1mfagcmnX2m/WEFeMLkFmUBSUtiUPRhld8AHb+/90yivbxs
	Mw1kcxERQMkYKIM0qKwL1OP0qHSswJo31kxqlvMmk9Osb5BMuiBWZwn8h//2w06Sasfio9HR50IG1
	Hnoe76Y3i4U24jPt4HSuA0TtB9p4r/DyJfkP6qq/4k6DTpiaIZf3427XUBl0WfMcnAwCJH55xEoZL
	SUnQIfOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ren84-00000003Sdf-0epy;
	Tue, 27 Feb 2024 02:23:36 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ren80-00000003SZ1-1DI5
	for linux-mtd@lists.infradead.org;
	Tue, 27 Feb 2024 02:23:34 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TkLnY2Rb2z2Bdhq;
	Tue, 27 Feb 2024 10:21:05 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 294F4180060;
	Tue, 27 Feb 2024 10:23:19 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 27 Feb 2024 10:23:18 +0800
Subject: Re: [PATCH] mtd: ubi: fix NVMEM over UBI volumes on 32-bit systems
To: Daniel Golle <daniel@makrotopia.org>, Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <186fa96ae25f7033ff8b6f0f7fcfb1e602f556fc.1708971705.git.daniel@makrotopia.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <ab2b4573-58ce-d895-0aae-69e3647e0a68@huawei.com>
Date: Tue, 27 Feb 2024 10:23:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <186fa96ae25f7033ff8b6f0f7fcfb1e602f556fc.1708971705.git.daniel@makrotopia.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_182332_552947_2D91EBA1 
X-CRM114-Status: GOOD (  17.34  )
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

1NogMjAyNC8yLzI3IDI6MjMsIERhbmllbCBHb2xsZSDQtLXAOgo+IEEgY29tcGlsZXIgd2Fybmlu
ZyByZWxhdGVkIHRvIHNpemVvZihpbnQpICE9IDggd2hlbiBjYWxsaW5nIGRvX2RpdigpCj4gaXMg
dHJpZ2dlcmVkIHdoZW4gYnVpbGRpbmcgb24gMzItYml0IHBsYXRmb3Jtcy4KPiBBZGRyZXNzIHRo
aXMgYnkgdXNpbmcgaW50ZWdlciB0eXBlcyBoYXZpbmcgYSB3ZWxsLWRlZmluZWQgc2l6ZSB3aGVy
ZQo+IGFwcHJvcHJpYXRlLgo+IAo+IEZpeGVzOiAzY2U0ODU4MDNkYTEgKCJtdGQ6IHViaTogcHJv
dmlkZSBOVk1FTSBsYXllciBvdmVyIFVCSSB2b2x1bWVzIikKPiBTaWduZWQtb2ZmLWJ5OiBEYW5p
ZWwgR29sbGUgPGRhbmllbEBtYWtyb3RvcGlhLm9yZz4KPiAtLS0KPiAgIGRyaXZlcnMvbXRkL3Vi
aS9udm1lbS5jIHwgNSArKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC91YmkvbnZtZW0uYyBi
L2RyaXZlcnMvbXRkL3ViaS9udm1lbS5jCj4gaW5kZXggYjdhOTNjNDk1ZDE3Mi4uNTgyMGExNzBk
MjUxMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC91YmkvbnZtZW0uYwo+ICsrKyBiL2RyaXZl
cnMvbXRkL3ViaS9udm1lbS5jCj4gQEAgLTIzLDE0ICsyMywxNyBAQCBzdHJ1Y3QgdWJpX252bWVt
IHsKPiAgIHN0YXRpYyBpbnQgdWJpX252bWVtX3JlZ19yZWFkKHZvaWQgKnByaXYsIHVuc2lnbmVk
IGludCBmcm9tLAo+ICAgCQkJICAgICAgdm9pZCAqdmFsLCBzaXplX3QgYnl0ZXMpCj4gICB7Cj4g
LQlpbnQgZXJyID0gMCwgbG51bSA9IGZyb20sIG9mZnMsIGJ5dGVzX2xlZnQgPSBieXRlcywgdG9f
cmVhZDsKPiArCXVpbnQzMl90IGJ5dGVzX2xlZnQsIG9mZnMsIHRvX3JlYWQ7Cj4gICAJc3RydWN0
IHViaV9udm1lbSAqdW52ID0gcHJpdjsKPiAgIAlzdHJ1Y3QgdWJpX3ZvbHVtZV9kZXNjICpkZXNj
Owo+ICsJdWludDY0X3QgbG51bSA9IGZyb207Cj4gKwlpbnQgZXJyID0gMDsKPiAgIAo+ICAgCWRl
c2MgPSB1Ymlfb3Blbl92b2x1bWUodW52LT51YmlfbnVtLCB1bnYtPnZvbF9pZCwgVUJJX1JFQURP
TkxZKTsKPiAgIAlpZiAoSVNfRVJSKGRlc2MpKQo+ICAgCQlyZXR1cm4gUFRSX0VSUihkZXNjKTsK
PiAgIAo+ICsJYnl0ZXNfbGVmdCA9IGJ5dGVzOwpUaGUgJ2J5dGVzJyBpcyBhIHNpemVfdCB0eXBl
LCB3aGljaCBoYXMgNjQgYml0cyBvbiA2NC1iaXQgcGxhdGZvcm1zLiAKVGhpcyBhc3NpZ25tZW50
IHdpbGwgbGVhZCBhIHR5cGUgdHJ1bmNhdGlvbiwgc28gc2hvdWxkIHdlIGFkZCBhIGV4cGxpY2l0
IAp0eXBlIGNvbnZlcnNpb24gaGVyZSB0byBhdm9pZCBjb21waWxlciB3YXJuaW5nPwo+ICAgCW9m
ZnMgPSBkb19kaXYobG51bSwgdW52LT51c2FibGVfbGViX3NpemUpOwo+ICAgCXdoaWxlIChieXRl
c19sZWZ0KSB7Cj4gICAJCXRvX3JlYWQgPSB1bnYtPnVzYWJsZV9sZWJfc2l6ZSAtIG9mZnM7Cj4g
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
