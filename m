Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445E7C001E0
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Oct 2023 07:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qq08DOu4twqWKhzuI3AGHao09Q1LECVHiFyh6SYckMA=; b=a/xYJ6YRkLOU5n
	BVXZdp3n16uSxovRSh8Y10KMujXa0HqqMS9UahIgrXXCO5bp6JuIbCa7p+npKjxddDFkgZV/jyeD2
	WFN5IKo6bMoKSX56npzjlW1hWKLrXHcTve2oXTvEGV5HN1slfZDejbv7HL/RZ0TgR0ItjC+rkZN2l
	xAMJzoXNTXKhSnbBZpGMkAZiqSIKd/zeYMK1FyDLV4sOxDiiNZi1uqjZMzWN4L8KBQj84oQ07mxdY
	XPmpsJF6g3SM7np3FiPWeXc1sqR2iUl5A/kNZjgwl7FeJSkqP5r9Hh6+9XU+R0Fo+QFk+XNB43JAG
	OtlwWQT4zVPg7rH0XUnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qup76-006cHy-11;
	Mon, 23 Oct 2023 07:12:36 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qup73-006cGy-1K
	for linux-mtd@lists.infradead.org;
	Mon, 23 Oct 2023 07:12:34 +0000
Received: from dggpemm500009.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4SDRBt3rNcz15NT2;
	Mon, 23 Oct 2023 15:09:26 +0800 (CST)
Received: from [10.174.178.209] (10.174.178.209) by
 dggpemm500009.china.huawei.com (7.185.36.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 23 Oct 2023 15:12:15 +0800
Message-ID: <739480f1-4899-6da7-c9ac-9d4fd26c2474@huawei.com>
Date: Mon, 23 Oct 2023 15:12:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
To: Richard Weinberger <richard@nod.at>
CC: chengzhihao1 <chengzhihao1@huawei.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	dpervushin <dpervushin@embeddedalley.com>, Artem Bityutskiy
	<Artem.Bityutskiy@nokia.com>, linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, yi zhang <yi.zhang@huawei.com>,
	yangerkun <yangerkun@huawei.com>
References: <20231018121618.778385-1-wangzhaolong1@huawei.com>
 <1381458025.20897.1697747248632.JavaMail.zimbra@nod.at>
 <891e554b-c133-6378-3a65-836fc9147e54@huawei.com>
 <441107100.23734.1697904580252.JavaMail.zimbra@nod.at>
 <9b543be7-a858-c982-3fcf-408701ae4ac9@huawei.com>
 <1141312317.29142.1698043564332.JavaMail.zimbra@nod.at>
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
In-Reply-To: <1141312317.29142.1698043564332.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.209]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_001233_655386_B341AD17 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
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

Cj4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBWb246ICJaaGFvTG9uZyBXYW5n
IiA8d2FuZ3poYW9sb25nMUBodWF3ZWkuY29tPgo+PiBBbjogInJpY2hhcmQiIDxyaWNoYXJkQG5v
ZC5hdD4sICJjaGVuZ3poaWhhbzEiIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPj4gQ0M6ICJN
aXF1ZWwgUmF5bmFsIiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4sICJWaWduZXNoIFJhZ2hh
dmVuZHJhIiA8dmlnbmVzaHJAdGkuY29tPiwgImRwZXJ2dXNoaW4iCj4+IDxkcGVydnVzaGluQGVt
YmVkZGVkYWxsZXkuY29tPiwgIkFydGVtIEJpdHl1dHNraXkiIDxBcnRlbS5CaXR5dXRza2l5QG5v
a2lhLmNvbT4sICJsaW51eC1tdGQiCj4+IDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4s
ICJsaW51eC1rZXJuZWwiIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPiwgInlpIHpoYW5n
IiA8eWkuemhhbmdAaHVhd2VpLmNvbT4sCj4+ICJ5YW5nZXJrdW4iIDx5YW5nZXJrdW5AaHVhd2Vp
LmNvbT4KPj4gR2VzZW5kZXQ6IE1vbnRhZywgMjMuIE9rdG9iZXIgMjAyMyAwODo0MToxMgo+PiBC
ZXRyZWZmOiBSZTogW1BBVENIIHYyXSB1Ymk6IGdsdWViaTogRml4IE5VTEwgcG9pbnRlciBkZXJl
ZmVyZW5jZSBjYXVzZWQgYnkgZnRsIG5vdGlmaWVyCj4gCj4+Pgo+Pj4gSU9XLCBubyBtdGRibG9j
ayAoaGVuY2UsIGFsc28gbm8gRlRMcykgb24gdG9wIG9mIGdsdWViaS4KPj4+Cj4+PiBXaGF0IGRv
IHlvdSBndXlzIHRoaW5rPwo+Pj4KPj4+IFRoYW5rcywKPj4+IC8vcmljaGFyZAo+Pj4KPj4KPj4K
Pj4gSkZGUzIgbmVlZHMgdG8gd29yayBvbiB0aGUgYmxvY2sgZGV2aWNlLCBzbyB0aGUgbXRkYmxv
Y2sgbmVlZHMgdG8gd29yawo+PiBvbiB0aGUgdG9wIG9mIGdsdWViaS4KPj4KPj4gVGhpcyBpcyBk
aXJlY3RseSByZWZsZWN0ZWQgaW4gdGhlIGpmZnMyIG1vdW50IGNvbW1hbmQsIHN1Y2ggYXMKPj4K
Pj4gICAgIyBtb3VudCAtdCBqZmZzMiAvZGV2L210ZGJsb2NrWCAvbW50L2pmZnMyCj4gCj4gVGhl
IGxpbWl0YXRpb24gaXMgbG9uZyBnb25lLiBJdCBjb21lcyBmcm9tIHRoZSBkYXJrIGFuZCBvbGQg
dGltZXMKPiB3aGVyZSBMaW51eCB3YXMgb25seSBhYmxlIHRvIG1vdW50IGJsb2NrIGRldmljZXMu
Cj4gCj4gWW91IGNhbiBkbzogbW91bnQgLXQgamZmczIgbXRkWCAvbW50L2pmZnMyCj4gCj4gVGhh
bmtzLAo+IC8vcmljaGFyZAo+IAoKWWVzLCBJIHRyaWVkIGl0IGFuZCBpdCB3b3JrZWQuIFRoYW5r
cyBmb3IgdGhlIHJlbWluZGVyLgoKQnV0IHRoaXMgbW9kaWZpY2F0aW9uIHJlamVjdHMgdGhpcyB1
c2FnZS4gYW5kIHJlamVjdHMgb3RoZXIgYmxvY2sgZGV2aWNlCmZpbGUgc3lzdGVtcyAoc3VjaCBh
cyBleHQ0KSBmcm9tIHdvcmtpbmcgb24gZ2x1ZWJpLgoKVGhhbmsgeW91LgpaaGFvbG9uZwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
