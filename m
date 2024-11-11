Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC00D2E9D5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 10:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3b01/LETmn8Jg4yC5U/KjZ4acCi4sfIAw2zaq2lC5s=; b=bLeofRbmnflU18AWp68wz9z09d
	3R6+PGrKZY/jRRaobmBoZ5xUqd2crSI4e8CbTMCt44WF2joxpbi0CWnf0jcTAeKlzqj07pJlKno7u
	H0rZaUsxDOQq794FkFDOCbIgqPWRpBr1O0N/H/g0j1hqpB6DaFNbLt3Tz5AO1SLYa6A/Tyqv+JQAq
	JxP2S5QuG+p1WobZbRB7lrgbpEVxuDDMI4LVxf3mTS8A6n4qamnJPiCme67g2NhPUUOxSW8H/3ZRa
	aO6RJtul39hRkBeZFDD/tdDFHcVcr/FJNHHubIP0HClFB1vfrEDC8o/dD+g2MErPipQWW/0yK3lYF
	WbYe5rcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tARmd-0000000HJ8Q-2DrN;
	Mon, 11 Nov 2024 10:36:35 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tARmZ-0000000HJ7T-1A90
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 10:36:33 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Xn5Wv1sr8z1hwNb;
	Mon, 11 Nov 2024 18:34:35 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 47B641402D0;
	Mon, 11 Nov 2024 18:36:23 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 11 Nov 2024 18:36:22 +0800
Subject: Re: [PATCH mtd-utils v2 RESEND 000/102] Add fsck.ubifs support
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>, <richard@nod.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
References: <20241111083711.1916125-1-chengzhihao1@huawei.com>
 <7905b16f-1e7a-44b7-b16b-3f2a84e23390@sigma-star.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <5b7d6bf1-c067-a7e9-5715-8b4f8af19241@huawei.com>
Date: Mon, 11 Nov 2024 18:36:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7905b16f-1e7a-44b7-b16b-3f2a84e23390@sigma-star.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_023631_497183_195E2AE3 
X-CRM114-Status: GOOD (  21.76  )
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

5ZyoIDIwMjQvMTEvMTEgMTc6NTIsIERhdmlkIE9iZXJob2xsZW56ZXIg5YaZ6YGTOgo+IEhpLAo+
IAo+IEknbSBzb3JyeSBmb3IgdGhlIGxvbmcgd2FpdC4gSSBoYWQgeW91ciBSRkMgcGF0Y2ggc2V0
IGFwcGxpZWQgbG9jYWxseQo+IGFuZCBhdCBvbmUgcG9pbnQgZXZlbiBwdWxsZWQgeW91ciB1cGRh
dGVkIHZlcnNpb24gZnJvbSBnaXRlZS5jb20uIEFzIHlvdQo+IG5vdGljZWQsIEkgY2hlcnJ5LXBp
Y2tlZCBzb21lIG9mIHRoZSBmaXhlcyBmb3IgdGhlIGxhc3QgbXRkLXV0aWxzIHJlbGVhc2UsCj4g
aG9waW5nIHRvIGdldCBhcm91bmQgdG8gcmV2aWV3aW5nIHRoZSByZXN0IHRoYXQgbW9zdGx5IGFk
ZHMgZmVhdHVyZXMKPiBhZnRlcndhcmRzLgo+IAo+IER1ZSB0byB0aGUgc2hlZXIgc2l6ZSBvZiB0
aGlzIGFuZCB0aGUgcHJldmlvdXMgcGF0Y2ggc2V0LCBJIG9ubHkgcmV2aWV3ZWQKPiBzbWFsbCBw
YXJ0cyBvZiBpdCBhdCBhdCB0aW1lLCBhbHdheXMgcG9zdCBwb25pbmcgdGhlIHJlc3QgYmFjayAi
Zm9yIGxhdGVyIgo+IHdoaWNoIGVuZGVkIHVwIGNvbnN0YW50bHkgc2xpcHBpbmcgZnVydGhlciBh
d2F5Lgo+IAoKSGksIERhdmlkLiBWZXJ5IGhhcHB5IHRvIGJlIGF3YXJlZCBvZiB0aGUgcHJvZ3Jl
c3MgZm9yIHRoZSBmc2NrLnViaWZzIApwYWN0aGVzLiBJIGtub3cgeW91IGFuZCBSaWNoYXJkIGFy
ZSBidXN5IG1lbiwgYW5kIGZzY2sudWJpZnMgaXMgYSBiaWcgCndvcmssIHNvIEkgYWRtaXQgdGhh
dCBpdCBkb2VzIHRha2UgYSBsb25nIHRpbWUgdG8gcmV2aWV3IHRob3NlIHBhdGNoZXMuCkFuZCBJ
J20gaGFwcHkgdG8gYW5zd2VyIGFueSBxdWVzdGlvbnMgYWJvdXQgdGhlIGNvZGUvZGVzaWdubWVu
dC4KCj4gSSB0aGluayBieSBub3cgSSd2ZSBtYW5hZ2VkIHRvIGxvb2sgaW50byBhbGwgb2YgdGhl
IFJGQyBzZXQgaW4gc2V2ZXJhbAo+IHNpdHRpbmdzIGFuZCBJTU8gdGhhdCBsb29rZWQgZ29vZCBz
byBmYXIuIFdlIGV2ZW4gZGlkIHNvbWUgbGltaXRlZCB0ZXN0aW5nCj4gd2l0aCBicm9rZW4gVUJJ
RlMgaW1hZ2VzIGFzIHdlbGwuCj4gCj4gSSBhcHBsaWVkIHlvdXIgdjIgcGF0Y2hlcyBhbmQgZGlk
IGEgZGlmZiBhZ2FpbnN0IG15IGxvY2FsIGJyYW5jaCB3aXRoIHRoZQo+IHByZXZpb3VzIHZlcnNp
b24uIEZyb20gd2hhdCBJIGNhbiB0ZWxsLCB0aGUgZGlmZiBpcyBxdWl0ZSBzbWFsbC4gQmVzaWRl
cwo+IGF1dG9jb25mIHBsdW1iaW5nIGZvciBBU0FOIHN1cHBvcnQsIHRoZSBjaGFuZ2VzIHNlZW0g
dG8gYmUgbW9zdGx5IGNvc21ldGljLgoKWWVzLCB0aGVyZSBhcmUgb25seSBhIGZldyBkaWZmZXJl
bmNlcyBiZXR3ZWVuIHYxLT52MiwgYW5kIG1vc3Qgb2YgdGhlbSAKYXJlIHNwZWxsaW5nIG1pc3Rh
a2VzIGFuZCBjb2RlIG9wdGltaXphdGlvbnMuCj4gCj4gSWYgbm9ib2R5IGVsc2UgaGFzIGFueSBv
YmplY3Rpb25zLCBJIHdvdWxkIGxpa2UgdG8gKmZpbmFsbHkqIHB1c2ggdGhpcyB0bwo+IHVwc3Ry
ZWFtIG10ZC11dGlscy4KCipOb3RpY2UqLCBpbiBwYXRjaCA5Nyh0ZXN0czogdWJpZnNfdG9vbHM6
IGZzY2tfdGVzdHM6IEFkZCBjb3JydXB0ZWQgCmltYWdlcyksIHBhdGNod29ya1sxXSBkb2Vzbid0
IGNvbnRhaW4gdGhlIGNvbnRlbnQgb2YgZmlsZSAKdGVzdHMvdWJpZnNfdG9vbHMtdGVzdHMvaW1h
Z2VzL3hpbm9kZV9tb2RlLmd6LCBwbGVhc2UgcmVmZXJlbmNlIHRvIGxvcmVbMl0uCkFueXdheSwg
YWZ0ZXIgdGhhdCwgSSB3aWxsIGRvIGEgY29tcGFyaXNvbiBiZXR3ZWVuIGl0IGFuZCB0aGUgdmVy
c2lvbiBvbiAKbXkgbG9jYWwgbWFjaGluZSwgYW5kIHRoZW4gbGV0IHlvdSBrd25vdyB3aGV0aGVy
IHRoZSBwYXRjaGVzIGFyZSBhcHBsaWVkIApjb3JyZWN0bHkuCgpbMV0gCmh0dHBzOi8vcGF0Y2h3
b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1tdGQvcGF0Y2gvMjAyNDExMTEwOTA4MzIuMjA5
MzU5Ni0yOC1jaGVuZ3poaWhhbzFAaHVhd2VpLmNvbS8KWzJdIApodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1tdGQvMjAyNDExMTEwOTA4MzIuMjA5MzU5Ni0yOC1jaGVuZ3poaWhhbzFAaHVh
d2VpLmNvbS9ULyN1Cj4gCj4gUC5TLiBJIHR5cGVkIHRoaXMgdXAgfjEuNSBob3VycyBhZ28gYXMg
YSByZXNwb25zZSB0byB0aGUgdjIgcGF0Y2ggc2V0LiBJIAo+IGhlbGQKPiBvZiBzZW5kaW5nLCB3
aGVuIHRoZSBSRVNFTkQgKGFuZCByZXNlbmQgYXR0ZW1wdD8pIGNhbWUgaW4uIFRoZSBnaXQtZGlm
ZiAKPiBmcm9tCj4gdGhlIFJFU0VORCB0byB0aGUgdjIgSSBoYWQgYWxyZWFkeSBhcHBsaWVkIGlz
IGluZGVlZCBlbXB0eSwgc28gdGhhdCBzaG91bGQKPiBiZSBmaW5lLgoKWWVzLCB0aGUgY29udGVu
dCBvZiB2MiBhbmQgJ3YyIFJFU0VORCcgaXMgc2FtZS4KPiAKPiBHcmVldGluZ3MsCj4gCj4gRGF2
aWQKPiAuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
