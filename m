Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4082BC5DF7D
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Aug 2026 03:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7WYxds8toXfbKdL+8zWEN/bT916+92DN7GsZZjKXBz4=; b=v/S/UjOUC+4L78
	iEFU9S9Bw+pnSA04gOuime6cqGwFVU5nGzGLj4K/0jviZ0udwRowtiXxrJfUSLXETiLauVbJABr1e
	5alb+SwluUKzQrsWlAvQsdn9uodBXZ3jQf/+esYxhQlCaFrUavf4tchLKU8sZJiyZqPiVKlxSdbVi
	VD0k29eh4PLefde5H95usw9PGdBuAvBxBMToC1e1h3Nhe1z9xBe98skIF9nzG+wLtWtM5yICz7s/Y
	Zlc65uiiS0S+w1grq27u7PWBEqX9bQF3SLL9MqGri588RYzsoaZaUZoU5COpZs8wqGEf0uenYxa5c
	q4nooBNWqQ1eec+SY5Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxG4k-0000000CVAk-32fl;
	Fri, 21 Aug 2026 03:37:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxG4h-0000000CVAd-0e6z
	for linux-mtd@bombadil.infradead.org;
	Fri, 21 Aug 2026 03:37:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=85JDlCj8Zjk9RrdQn5e3CLdsg7RvvbrEKdMGvCaEEbQ=; b=Y6lVwx3lGKCoiksUPiWKhiYOAc
	/6NDxndYWJuHa/HWX62U44y7HoxmzfN4ECPYRcXURkxiPPDQ5sS2c5IayPnt9rmRiu0SsRJjsMbUe
	hegW68a2NV9Fu7KbqHKg/dcBn4BUzBDMc9oojdJVEebBZ93cXgVfU99FMZp58CZ+PZbYynQxRgr2L
	GtQuG69ONn5D6mCRioMxbxGQ0Xa87HhFVvNxKKvWicyzv9MdeDwE64PxQ1zys4tLDL1c3FLKt1B7w
	ow1+sInJ1HwawTKMCQ/xA3OZWiJQvSkLHFSkb4DNQUbTLBghMPrEVQHytxXzQS7scQmtpCaejQ20h
	LzDyPiAA==;
Received: from [113.46.200.223] (helo=canpmsgout08.his.huawei.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wxG4d-00000003Txd-1bSi
	for linux-mtd@lists.infradead.org;
	Fri, 21 Aug 2026 03:37:45 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=85JDlCj8Zjk9RrdQn5e3CLdsg7RvvbrEKdMGvCaEEbQ=;
	b=19FcrejImvZf/KRbLBk4RFvGEQQTpqPJ6VOh1kxWo0VrNk5aVVrM4VmnpHkFYDG9gE8vo6e3h
	3vwB8G8Ekoc892l2L0cTkJOp6ZihUwpJCVHzF5kse6mt6a6YDDl3CCIfyDPeVwG/gdJQFelvnWr
	D1AoDUtRNpRfiShTKSRq8P8=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4hR5Lx1B6rzmV8f;
	Fri, 21 Aug 2026 11:26:33 +0800 (CST)
Received: from dggpemr100018.china.huawei.com (unknown [7.185.36.64])
	by mail.maildlp.com (Postfix) with ESMTPS id AAD5B40586;
	Fri, 21 Aug 2026 11:37:15 +0800 (CST)
Received: from [10.174.179.156] (10.174.179.156) by
 dggpemr100018.china.huawei.com (7.185.36.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 21 Aug 2026 11:37:14 +0800
Message-ID: <2ca192b7-f903-41ba-8ffe-e8bfe9f79125@huawei.com>
Date: Fri, 21 Aug 2026 11:37:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] jffs2: extend write verification to all write paths
To: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, chengzhihao1 <chengzhihao1@huawei.com>,
	yangerkun <yangerkun@huawei.com>, yi zhang <yi.zhang@huawei.com>
References: <20260820105003.2525647-1-zhouminqiang2@huawei.com>
 <852434244.6574.1787252301788.JavaMail.zimbra@nod.at>
From: zhouminqiang <zhouminqiang2@huawei.com>
In-Reply-To: <852434244.6574.1787252301788.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.179.156]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemr100018.china.huawei.com (7.185.36.64)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_043744_374256_EA42DFEE 
X-CRM114-Status: GOOD (  19.88  )
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

VGhhbmsgeW91IGZvciB5b3VyIHJldmlldyBhbmQgZmVlZGJhY2suCgpTb3JyeSBmb3IgdGhlIGNv
bmZ1c2lvbiBjYXVzZWQgYnkgbXkgY292ZXIgbGV0dGVyLiBXZSBhcmUgbm90IHVzaW5nCkpGRlMy
IG9uIE5BTkQgZmxhc2ggZGV2aWNlcy4gT3VyIHByaW1hcnkgZ29hbCBpcyB0byBleHRlbmQgd3Jp
dGUKdmVyaWZpY2F0aW9uIHRvIHRoZSBOT1IgZmxhc2ggcGF0aCBiZWNhdXNlIHdlIGhhdmUgZW5j
b3VudGVyZWQgZGF0YQpjb3JydXB0aW9uIGluY2lkZW50cyBpbiBwcm9kdWN0aW9uIGVudmlyb25t
ZW50IGFuZCBjdXJyZW50bHkgbGFjayBhCnF1aWNrIGRpYWdub3N0aWMgdG9vbCB0byBpc29sYXRl
IHRoZSBjYXVzZS4gV2hpbGUgcmV2aWV3aW5nIHRoZQpjb2RlIGZsb3csIHdlIG5vdGljZWQgdGhh
dCB0aGUgTkFORCBidWZmZXJlZCB3cml0ZSBwYXRoIGFsc28gbGFja2VkCnZlcmlmaWNhdGlvbiwg
c28gd2UgdG9vayB0aGUgb3Bwb3J0dW5pdHkgdG8gZXh0ZW5kIGl0IGFzIHdlbGwuCgpBbHRob3Vn
aCBKRkZTMiBpcyBpbiAiT2RkIGZpeGVzIiBtYWludGVuYW5jZSBtb2RlLCB0aGVyZSBhcmUgc3Rp
bGwKYSBzaWduaWZpY2FudCBudW1iZXIgb2YgZGV2aWNlcyBpbiBwcm9kdWN0aW9uIHRoYXQgcmVs
eSBvbiBKRkZTMiwKYW5kIHdlIGFyZSBlbmNvdW50ZXJpbmcgZGF0YSBjb3JydXB0aW9uIGlzc3Vl
cyBvbiBsaXZlIG5vZGVzLgpFeHRlbmRpbmcgd3JpdGUgdmVyaWZpY2F0aW9uIHRvIHRoZSBOT1Ig
Zmxhc2ggcGF0aCB3b3VsZCBwcm92aWRlIGEKZGlhZ25vc3RpYyB0b29sIGZvciBmYXVsdCBpc29s
YXRpb24uIFdlIG5vdGljZSB0aGF0IFdCVUZfVkVSSUZZIGhhcwpleGlzdGVkIHNpbmNlIDIwMDcg
KGE2YmM0MzJlMjk2ZCksIHNvIHdlIHdhbnQgdG8gZXh0ZW5kIHRoZSBzYW1lCmRpYWdub3N0aWMg
ZmFjaWxpdHkgdG8gY292ZXIgdGhlIHdyaXRlIHBhdGhzIGl0IG1pc3NlZCwgc28gdGhhdCBpdApj
YW4gc2VydmUgb25nb2luZyBwcm9kdWN0IGlzc3VlIGRpYWdub3Npcy4gSU1ITywgdGhpcyBpcyBh
CmRlYnVnZ2luZy9tYWludGVuYW5jZSBmZWF0dXJlLCBub3QgaW50cm9kdWNpbmcgbmV3IGZ1bmN0
aW9uYWxpdHkuCgpXZSByZXNwZWN0IHlvdXIganVkZ21lbnQgYW5kIHdpbGwgbGVhdmUgdGhlIGZp
bmFsIGRlY2lzaW9uIHRvIHlvdS4KCuWcqCAyMDI2LzgvMjEgMjo1OCwgUmljaGFyZCBXZWluYmVy
Z2VyIOWGmemBkzoKPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+IFZvbjogInpo
b3VtaW5xaWFuZyIgPHpob3VtaW5xaWFuZzJAaHVhd2VpLmNvbT4KPj4gQW46ICJEYXZpZCBXb29k
aG91c2UiIDxkd213MkBpbmZyYWRlYWQub3JnPiwgInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4K
Pj4gQ0M6ICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sICJsaW51
eC1rZXJuZWwiIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPiwgImNoZW5nemhpaGFvMSIK
Pj4gPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPiwgInlhbmdlcmt1biIgPHlhbmdlcmt1bkBodWF3
ZWkuY29tPiwgInlpIHpoYW5nIiA8eWkuemhhbmdAaHVhd2VpLmNvbT4KPj4gR2VzZW5kZXQ6IERv
bm5lcnN0YWcsIDIwLiBBdWd1c3QgMjAyNiAxMjo0OTo1Ngo+PiBCZXRyZWZmOiBbUEFUQ0ggMC82
XSBqZmZzMjogZXh0ZW5kIHdyaXRlIHZlcmlmaWNhdGlvbiB0byBhbGwgd3JpdGUgcGF0aHMKPiAK
Pj4gV2hlbiBKRkZTMiB3cml0ZXMgZGF0YSB0byBmbGFzaCwgaXQgZmlyc3QgY2FsY3VsYXRlcyBh
IG5vZGUgQ1JDLCBhbmQKPj4gdGhlIE5BTkQgY29udHJvbGxlciBjYWxjdWxhdGVzIEVDQyBhcyB0
aGUgZGF0YSBpcyBwcm9ncmFtbWVkLiBJZgo+IAo+IFdoeSB3b3VsZCBvbmUgdXNlIEpGRlMyIGlu
IDIwMjYgb24gTkFORCBmbGFzaD8KPiAKPj4gY29ycnVwdGlvbiBvY2N1cnMgYmV0d2VlbiB0aGVz
ZSB0d28gcG9pbnRzLCB0aGUgcG9zc2libGUgY2F1c2VzIGFyZQo+PiBSQU0gZmFpbHVyZXMgb3Ig
YnVzIHRyYW5zZmVyIGVycm9ycyBiZWZvcmUgdGhlIGRhdGEgcmVhY2hlcyB0aGUgZmxhc2gsCj4+
IG9yIGJpdCBmbGlwcyBvbiB0aGUgZmxhc2ggbWVkaXVtIGl0c2VsZi4gVG8gZGlzdGluZ3Vpc2gg
d2hldGhlciB0aGUKPj4gY29ycnVwdGlvbiBoYXBwZW5lZCBkdXJpbmcgdGhlIHdyaXRlIHRyYW5z
ZmVyIG9yIGFmdGVyIGNvbW1pdCB0byB0aGUKPj4gbWVkaXVtLCBjb21taXQgYTZiYzQzMmUyOTZk
ICgiW0pGRlMyXSBBZGQgc3VwcG9ydCBmb3Igd3JpdGUtYnVmZmVyCj4+IHZlcmlmaWNhdGlvbiIp
IGludHJvZHVjZWQgQ09ORklHX0pGRlMyX0ZTX1dCVUZfVkVSSUZZOiByZWFkaW5nIHRoZQo+PiBk
YXRhIGJhY2sgaW1tZWRpYXRlbHkgYWZ0ZXIgYSBzdWNjZXNzZnVsIHdyaXRlIGFuZCBjb21wYXJp
bmcgaXQgd2l0aAo+PiB0aGUgaW4tbWVtb3J5IHNvdXJjZSBidWZmZXIgcHJvdmlkZXMgdGhlIG1p
c3Npbmcgb2JzZXJ2YXRpb24gcG9pbnQKPj4gZm9yIHRoYXQgZGlhZ25vc2lzLgo+Pgo+PiBIb3dl
dmVyLCB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBvbmx5IHBlcmZvcm1zIHJlYWQtYmFjayB2
ZXJpZmljYXRpb24KPj4gb24gd3JpdGUtYnVmZmVyIGZsdXNoIHBhdGhzLiBUd28gc2NlbmFyaW9z
IHJlbWFpbiB1bmNvdmVyZWQ6Cj4+Cj4+ICAgMS4gV2hlbiB0aGUgd3JpdGUgZGF0YSBsZW5ndGgg
ZXhjZWVkcyB3YnVmX3BhZ2VzaXplLCB0aGUgZXhjZXNzIGRhdGEKPj4gICBieXBhc3NlcyB0aGUg
d3JpdGUgYnVmZmVyIGFuZCBpcyB3cml0dGVuIGRpcmVjdGx5IHRvIGZsYXNoIHZpYQo+PiAgIG10
ZF93cml0ZSgpIGluIGpmZnMyX2ZsYXNoX3dyaXRldigpLCB3aXRoIG5vIHZlcmlmaWNhdGlvbi4K
Pj4gICAyLiBOT1IgRmxhc2ggYW5kIG90aGVyIG5vbi13cml0ZWJ1ZmZlcmVkIGRldmljZXMgd3Jp
dGUgZGlyZWN0bHkgdGhyb3VnaAo+PiAgIGpmZnMyX2ZsYXNoX2RpcmVjdF93cml0ZSgpIGFuZCBq
ZmZzMl9mbGFzaF9kaXJlY3Rfd3JpdGV2KCksIHdpdGggbm8KPj4gICBlcXVpdmFsZW50IGNoZWNr
Lgo+Pgo+PiBJbiBib3RoIGNhc2VzLCBpZiBNVEQgcmVwb3J0cyBhIHN1Y2Nlc3NmdWwgd3JpdGUg
YnV0IHRoZSByZWFkYWJsZSBtZWRpdW0KPj4gZGlmZmVycyBmcm9tIEpGRlMyJ3Mgc291cmNlIGJ1
ZmZlciwgYSBsYXRlciBub2RlIENSQyBmYWlsdXJlIGNhbm5vdAo+PiBkaXN0aW5ndWlzaCB0cmFu
c3BvcnQvcHJvZ3JhbS10aW1lIGNvcnJ1cHRpb24gZnJvbSBwb3N0LWNvbW1pdCBtZWRpYQo+PiBk
YW1hZ2UsIGRlZmVhdGluZyB0aGUgb3JpZ2luYWwgZGlhZ25vc3RpYyBpbnRlbnQuCj4+Cj4+IFRo
aXMgc2VyaWVzIGNvdmVycyBib3RoIHNjZW5hcmlvcyB3aXRoIHRoZSBmb2xsb3dpbmcgY2hhbmdl
cy4KPj4KPj4gUmVwbGFjZSB0aGUgcHJlLWFsbG9jYXRlZCBwZXItc3VwZXJibG9jayB3YnVmX3Zl
cmlmeSBidWZmZXIgd2l0aAo+PiBvbi1kZW1hbmQgYWxsb2NhdGlvbiBpbnNpZGUgamZmczJfdmVy
aWZ5X3dyaXRlKCkuIFRoaXMgYWxsb3dzCj4+IGNvbmN1cnJlbnQgdmVyaWZpY2F0aW9uIGNhbGxz
IHRvIHByb2NlZWQgaW5kZXBlbmRlbnRseSB3aXRob3V0Cj4+IGNvbnRlbmRpbmcgZm9yIGEgc2hh
cmVkIGJ1ZmZlci4gQWRkaXRpb25hbGx5LCBtZW1jbXAoKSBpcyByZXBsYWNlZAo+PiB3aXRoIGEg
Ynl0ZS1ieS1ieXRlIGNvbXBhcmlzb24gdGhhdCBwaW5wb2ludHMgdGhlIGV4YWN0IG1pc21hdGNo
Cj4+IG9mZnNldCwgcmF0aGVyIHRoYW4gbWVyZWx5IHJlcG9ydGluZyBlcXVhbCBvciBub3QtZXF1
YWwuCj4+Cj4+IEFkZCB2ZXJpZmljYXRpb24gY2FsbHMgaW4gamZmczJfZmxhc2hfd3JpdGV2KCkg
Zm9yIGRpcmVjdCBwYWdlCj4+IHdyaXRlcywgYW5kIGluIGpmZnMyX2ZsYXNoX2RpcmVjdF93cml0
ZSgpIGFuZAo+PiBqZmZzMl9mbGFzaF9kaXJlY3Rfd3JpdGV2KCkgZm9yIE5PUiBhbmQgb3RoZXIg
bm9uLXdyaXRlYnVmZmVyZWQKPj4gZGV2aWNlcy4KPj4KPj4gU2luY2UgdmVyaWZpY2F0aW9uIG5v
dyBjb3ZlcnMgYWxsIHdyaXRlIHBhdGhzIHJhdGhlciB0aGFuIG9ubHkgdGhlCj4+IHdyaXRlLWJ1
ZmZlciBwYXRoLCByZW5hbWUgQ09ORklHX0pGRlMyX0ZTX1dCVUZfVkVSSUZZIHRvCj4+IENPTkZJ
R19KRkZTMl9GU19XUklURV9WRVJJRlkgYW5kIHJlbW92ZSB0aGUgS2NvbmZpZyBkZXBlbmRlbmN5
IG9uCj4+IENPTkZJR19KRkZTMl9GU19XUklURUJVRkZFUi4KPj4KPj4gQWRkIGEgbW9kdWxlIHBh
cmFtZXRlciB3cml0ZV92ZXJpZnkgKGRlZmF1bHQgb2ZmLCAwNjQ0KSB0byBhbGxvdwo+PiBkeW5h
bWljIGVuYWJsZS9kaXNhYmxlIG9mIHdyaXRlIHZlcmlmaWNhdGlvbiBhdCBydW50aW1lLCBzbyBr
ZXJuZWxzCj4+IGNhbiBjYXJyeSB0aGUgZGlhZ25vc3RpYyBmYWNpbGl0eSB3aXRob3V0IHJlYWQt
YmFjayBvdmVyaGVhZCB1bnRpbAo+PiBmYXVsdCBpc29sYXRpb24gaXMgcmVxdWlyZWQuIFRoZSBw
YXJhbWV0ZXIgY2FuIGJlIGFjY2Vzc2VkIHRocm91Z2g6Cj4+Cj4+ICAgICAvc3lzL21vZHVsZS9q
ZmZzMi9wYXJhbWV0ZXJzL3dyaXRlX3ZlcmlmeQo+Pgo+PiBUaGlzIHJlbWFpbnMgYW4gb3B0aW9u
YWwgZGlhZ25vc3RpYyBhaWQ7IG5vZGUgQ1JDcyBjb250aW51ZSB0byBwcm92aWRlCj4+IEpGRlMy
J3Mgbm9ybWFsIG9uLW1lZGlhIGludGVncml0eSBjaGVjay4KPiAKPiBQbGVhc2UgZXhwbGFpbiB3
aHkgdGhpcyBpcyBuZWVkZWQuCj4gSkZGUzIgaXMgaW4gIk9kZCBmaXhlcyIgbWFpbnRlbmFuY2Ug
bW9kZS4KPiBJdCBuZXZlciB3b3JrZWQgd2VsbCBmb3IgTkFORCBmbGFzaCwgdGhhdCdzIHdoeSBV
QklGUyAoSkZGUzMpIHdhcyBib3JuLgo+IAo+IFRoYW5rcywKPiAvL3JpY2hhcmQKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
