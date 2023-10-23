Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4A3CDB474
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Oct 2023 07:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fl4Pcv1k6l/6AbyRwtuL3bjaOJ9Sk3dE4iPLZMQSt2g=; b=hKIWkos7e0UURbzr6F9h6Qn7ww
	Nb6gJFVn8FniXs5yBdpjB0bEl8GpfjbVX1XHJFbmkH51B0uv7vYYImHGMTK1wvWqqZWy9w11Jva59
	w3s33CrxuH4GePe5eFpSOM/5hxkqNI35Uff8pMl5IYeMwEKFrrr+DhapSem3Q3lHOvYmOZYKqQI43
	/eW5KkhhXKlrk7BBbT5V+zzItKGZbrJp6QBh7WUOTDbD05SPJG3MPF6ZKPtXhgcSXERdmd7LIhyS+
	V6hDY3EhJcMgzquxWh2+p70d+CN9zIYeXfRFsWe2rKLhX478e8BZFn7BOFXFnT3iEqZ4qjR8MSnDx
	AfzUO8cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qup4d-006c2z-2a;
	Mon, 23 Oct 2023 07:10:03 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qup4W-006c1X-3C
	for linux-mtd@lists.infradead.org;
	Mon, 23 Oct 2023 07:10:02 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4SDR6J1gtnzMmC4;
	Mon, 23 Oct 2023 15:05:28 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 23 Oct 2023 15:09:38 +0800
Subject: Re: [PATCH v2] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
To: Richard Weinberger <richard@nod.at>
CC: ZhaoLong Wang <wangzhaolong1@huawei.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	dpervushin <dpervushin@embeddedalley.com>, Artem Bityutskiy
	<Artem.Bityutskiy@nokia.com>, linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, yi zhang <yi.zhang@huawei.com>,
	yangerkun <yangerkun@huawei.com>
References: <20231018121618.778385-1-wangzhaolong1@huawei.com>
 <1381458025.20897.1697747248632.JavaMail.zimbra@nod.at>
 <891e554b-c133-6378-3a65-836fc9147e54@huawei.com>
 <441107100.23734.1697904580252.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <93b2d5ab-e36c-be08-7343-ef4ca16f991d@huawei.com>
Date: Mon, 23 Oct 2023 15:09:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <441107100.23734.1697904580252.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_001000_537987_EB708BBF 
X-CRM114-Status: GOOD (  20.23  )
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

5ZyoIDIwMjMvMTAvMjIgMDowOSwgUmljaGFyZCBXZWluYmVyZ2VyIOWGmemBkzoKPiAtLS0tLSBV
cnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+IFZvbjogImNoZW5nemhpaGFvMSIgPGNoZW5nemhp
aGFvMUBodWF3ZWkuY29tPgo+Pj4+IFN1Y2ggYSBtb2RpZmljYXRpb24gY3VycmVudGx5IHdvcmtz
IGJlY2F1c2UgdGhlIG11dGV4ICJtdGRfdGFibGVfbXV0ZXgiCj4+Pj4gaXMgaGVsZCBvbiBhbGwg
bmVjZXNzYXJ5IHBhdGhzLCBpbmNsdWRpbmcgdGhlIGZ0bF9hZGRfbXRkKCkgY2FsbCBwYXRoLAo+
Pj4+IG9wZW4gYW5kIGNsb3NlIHBhdGhzLiBUaGVyZWZvcmUsIG1hbnkgcmFjZSBjb25kaXRpb24g
Y2FuIGJlIGF2b2lkZWQuCj4+Pgo+Pj4gSSBzZWUgdGhlIHByb2JsZW0sIGJ1dCBJJ20gbm90IHJl
YWxseSBzYXRpc2ZpZWQgYnkgdGhlIHNvbHV0aW9uLgo+Pj4gQWRkaW5nIHRoaXMgaGFjayB0byBn
bHVlYmlfcmVhZCgpIGlzIG5vdCBuaWNlIGF0IGFsbC4KPj4KPj4gWWVzLCBpdCdzIGpzdXQgYSB3
b3JrYXJvdW5kLiBBdCB0aGUgYmVnaW5pbmcsIEkgcHJlZmVyIHRoYXQgaW5jcmVhc2luZwo+PiB2
b2x1bWUgcmVmY250IChieSB1Ymlfb3Blbl92b2x1bWUpIGluIGdsdWViaV9jcmVhdGUgYW5kIHJl
bGVhc2luZyB2b2x1bWUKPj4gcmVmY250IGluIGdsdWViaV9yZW1vdmUuIEl0IGxvb2tzIG1vcmUg
cmVhc29uYWJsZSB0aGF0IGhvbGRpbmcgYSByZWZjbnQKPj4gb2YgVUJJIHZvbHVtZSB3aGVuIGds
dWViaSBpcyBhbGl2ZS4gQWZ0ZXIgbG9va2luZyB0aHJvdWdoIHRoZSBjb2RlLCB0aGUKPj4gY3Jl
YXRpb24vZGVzdHJveWluZyBvZiBnbHVlYmkgaXMgdHJpZ2dlcmVkIGJ5IHZvbHVtZQo+PiBhY3Rp
b25zKFVCSV9WT0xVTUVfQURERUQvVUJJX1ZPTFVNRV9SRU1PVkVEKSwgd2hpY2ggbWVhbnMgdGhh
dDoKPj4gMS4gZ2x1ZWJpX3JlbW92ZSBpcyBkZXBlbmRlZCBvbiBVQklfVk9MVU1FX1JFTU9WRUQo
dHJpZ2dlcmVkIGJ5Cj4+IHViaV9yZW1vdmVfdm9sdW1lKQo+PiAyLiB1YmlfcmVtb3ZlX3ZvbHVt
ZSB3b24ndCBiZSBleGVjdXRlZCB1bnRpbCB0aGUgcmVmY250IG9mIHZvbHVtZQo+PiBiZWNvbWVz
IDAocmVsZWFzZWQgYnkgZ2x1ZWJpX3JlbW92ZSkKPj4KPj4gSWYgd2UgYWRkIG5ldyBpb2N0bHMg
dG8gY29udHJvbCBjcmVhdGlvbi9kZXN0cm95aW5nIG9mIGdsdWViaSwgdGhlbgo+PiBnbHVlYmkg
bXRkIHdvbid0IGJlIGF1dG9tYXRpY2FsbHkgY3JlYXRlZCB3aGVuIFVCSSB2b2x1bWUgaXMgYWRk
ZWQuIEknbQo+PiBub3QgY2VydGFpbiB3aGV0aGVyIHRoaXMgY2hhbmdlIHdpbGwgZWZmZWN0IGV4
aXN0aW5nIHN0YXJ0dXAgcHJvY2Vzcwo+PiB0aGF0IGRlcGVuZHMgb24gZ2x1ZWJpLgo+IAo+IExl
dCdzIHRha2UgYSBzdGFjayBiYWNrLiBUaGUgc29sZSBwdXJwb3NlIG9mIGdsdWViaSBpcyBwcm92
aWRpbmcKPiBhIHdheSB0byBydW4gSkZGUzIgb24gdG9wIG9mIFVCSS4KCklzIGl0IHBvc3NpYmxl
IHRoYXQgc29tZW9uZSBydW5zIGV4dDQgb24gbXRkYmxvY2sgYmFzZWQgb24gZ2x1ZWJpLCBmb3Ig
CnRoZSBhZHZhbnRhZ2Ugb2Ygd2Vhci1sZXZlbGluZz8KCj4gSU1ITyB0aGVyZSBpcyBubyBuZWVk
IHRvIHJ1biBhbiBGVEwgb24gdG9wIG9mIFVCSSBvciBldmVuIG10ZGJsb2NrLgo+IFRoaXMga2lu
ZCBvZiBzdGFja2luZyBkb2VzIG5vdCBtYWtlIHNlbnNlLgo+IAo+IFNvLCBJJ2QgZ28gc28gZmFy
IGFuZCBwcm9wb3NlIHRoZSBmb2xsb3dpbmc6Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210
ZF9ibGtkZXZzLmMgYi9kcml2ZXJzL210ZC9tdGRfYmxrZGV2cy5jCj4gaW5kZXggZmYxODYzNmUw
ODg5Ny4uYjM2MmE2NDQxMWViZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9tdGRfYmxrZGV2
cy5jCj4gKysrIGIvZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYwo+IEBAIC00NjMsNyArNDYzLDcg
QEAgc3RhdGljIHZvaWQgYmxrdHJhbnNfbm90aWZ5X2FkZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCkK
PiAgIHsKPiAgICAgICAgICBzdHJ1Y3QgbXRkX2Jsa3RyYW5zX29wcyAqdHI7Cj4gICAKPiAtICAg
ICAgIGlmIChtdGQtPnR5cGUgPT0gTVREX0FCU0VOVCkKPiArICAgICAgIGlmIChtdGQtPnR5cGUg
PT0gTVREX0FCU0VOVCB8fCBtdGQtPnR5cGUgPT0gTVREX1VCSVZPTFVNRSkKPiAgICAgICAgICAg
ICAgICAgIHJldHVybjsKPiAgIAo+ICAgICAgICAgIGxpc3RfZm9yX2VhY2hfZW50cnkodHIsICZi
bGt0cmFuc19tYWpvcnMsIGxpc3QpCj4gCj4gSU9XLCBubyBtdGRibG9jayAoaGVuY2UsIGFsc28g
bm8gRlRMcykgb24gdG9wIG9mIGdsdWViaS4KPiAKPiBXaGF0IGRvIHlvdSBndXlzIHRoaW5rPwo+
IAo+IFRoYW5rcywKPiAvL3JpY2hhcmQKPiAKPiAuCj4gCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
