Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75B2C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 18:04:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8524320678
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 18:04:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YjS8PzeG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8524320678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RabTS+WqrXsK+aMn2ssGd6IN8PdMKBPQODsi9HY9xc4=; b=YjS8PzeGTUrK8j
	bmPXOHE0qnxfMsPbSvwpVZlbcLZi/wGBPgdiblO6Y+LdsdUEmwEA5ohdTM77u7MMEUny0h2HwM77r
	k2bhP5facfQ/sdpkjEke7DDaa7YVfQ8vGbY8m6JuKy36d5bP1bhc4P8qHGewycv3hRu2Ix4WF2iAn
	L0wHGGHi0zRT8hAD1JTbtkSCIU6GXnhNFQ82ekdIwTQU2DBCbqMUyZzgtpMH2+CcFhKRFzRIe9RHP
	j+IPcExi8UhLtcUQXOVhvMhg1XkqqIu2FvUUuzkjxQymKyhUHuqzrCWOzTt/FxqILWprMUy6djdOO
	N+IawgSsQasNKAcipWQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipcAY-0000Tr-00; Thu, 09 Jan 2020 18:04:30 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipcAU-0000TJ-D7
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 18:04:28 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 42837C0003;
 Thu,  9 Jan 2020 18:04:24 +0000 (UTC)
Date: Thu, 9 Jan 2020 19:04:23 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin DEVERA <devik@eaxlabs.cz>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: Fix unexpected timeouts in waitrdy
Message-ID: <20200109190423.60070968@xps13>
In-Reply-To: <20200109190240.6fee87fb@xps13>
References: <20191210150319.3125-1-devik@eaxlabs.cz>
 <20200109163752.621c6248@xps13>
 <73164aea-d889-21e4-4e7d-345ebd4e5197@eaxlabs.cz>
 <20200109182242.03743cf7@xps13>
 <0501ddbd-9e0f-62ec-ab57-d092502680d5@eaxlabs.cz>
 <20200109190240.6fee87fb@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_100426_714876_EDE601AB 
X-CRM114-Status: GOOD (  29.90  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFydGluLAoKSSBmb3Jnb3QgdG8gbWVudGlvbjogcGxlYXNlIGRvbid0IGZvcmdldCB0byBr
ZWVwIGV2ZXJ5b25lIGluIGNvcHkuIEkKcmUtYWRkZWQgdGhlIG10ZC1saXN0IGluIG15IHByZXZp
b3VzIGFuc3dlci4KCk1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdy
b3RlIG9uIFRodSwgOSBKYW4gMjAyMAoxOTowMjo0MCArMDEwMDoKCj4gSGkgTWFydGluLAo+IAo+
IE1hcnRpbiBERVZFUkEgPGRldmlrQGVheGxhYnMuY3o+IHdyb3RlIG9uIFRodSwgOSBKYW4gMjAy
MCAxODo0Mzo0Ngo+ICswMTAwOgo+IAo+ID4gT24gMS85LzIwIDY6MjIgUE0sIE1pcXVlbCBSYXlu
YWwgd3JvdGU6ICAKPiA+ID4gSGkgTWFydGluLAo+ID4gPgo+ID4gPiBNYXJ0aW4gREVWRVJBIDxk
ZXZpa0BlYXhsYWJzLmN6PiB3cm90ZSBvbiBUaHUsIDkgSmFuIDIwMjAgMTc6MTc6MzAKPiA+ID4g
KzAxMDA6Cj4gPiA+ICAgIAo+ID4gPj4gT24gMS85LzIwIDQ6MzcgUE0sIE1pcXVlbCBSYXluYWwg
d3JvdGU6ICAgIAo+ID4gPj4+IEhpIE1hcnRpbiwKPiA+ID4+Pgo+ID4gPj4+IE1hcnRpbiBEZXZl
cmEgPGRldmlrQGVheGxhYnMuY3o+IHdyb3RlIG9uIFR1ZSwgMTAgRGVjIDIwMTkgMTY6MDM6MTgK
PiA+ID4+PiArMDEwMDogICAgCj4gPiA+Pj4gICA+Pj4+IFRoZSB1c2VkIHdheSB0byBjb21wdXRl
IGppZmZpZXMgdGltZW91dCBicm9rZXMgd2hlbiAgICAKPiA+ID4+Pj4gamlmZmllIGRpZmZlcmVu
Y2UgaXMgMS4gU2ltcGx5IGFkZCAxIC0gaXQgaGFzIG5vIG90aGVyCj4gPiA+Pj4+IHNpZGUgZWZm
ZWN0cy4KPiA+ID4+Pj4gRml4ZXMgU1RNMzJNUDEgRk1DMiBOQU5EIGNvbnRyb2xsZXIgd2hpY2gg
c29tZXRpbWVzIGZhaWxlZAo+ID4gPj4+PiBleGFjdGx5IGluIHRoaXMgd2F5Lgo+ID4gPj4+Pgo+
ID4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gRGV2ZXJhIDxkZXZpa0BlYXhsYWJzLmN6Pgo+
ID4gPj4+PiAtLS0KPiA+ID4+Pj4gICAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMg
fCA2ICsrKysrLQo+ID4gPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gPiA+Pj4+Cj4gPiA+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9uYW5kX2Jhc2UuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4g
PiA+Pj4+IGluZGV4IGQ1MjdlNDQ4Y2UxOS4uYmVhYjNhNzc1Y2M3IDEwMDY0NAo+ID4gPj4+PiAt
LS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+ID4gPj4+PiArKysgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+ID4gPj4+PiBAQCAtNzIxLDcgKzcyMSwxMSBA
QCBpbnQgbmFuZF9zb2Z0X3dhaXRyZHkoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgdW5zaWduZWQg
bG9uZyB0aW1lb3V0X21zKQo+ID4gPj4+PiAgICAJaWYgKHJldCkKPiA+ID4+Pj4gICAgCQlyZXR1
cm4gcmV0OyAgICAKPiA+ID4+Pj4gICAgPj4gLQl0aW1lb3V0X21zID0gamlmZmllcyArIG1zZWNz
X3RvX2ppZmZpZXModGltZW91dF9tcyk7ICAgIAo+ID4gPj4+PiArCS8qICsxIGJlbG93IGlzIG5l
Y2Vzc2FyeSBiZWNhdXNlIGlmIHdlIGFyZSBub3cgaW4gdGhlIGxhc3QgZnJhY3Rpb24KPiA+ID4+
Pj4gKwkgKiBvZiBqaWZmeSBhbmQgbXNlY3NfdG9famlmZmllcyBpcyAxIHRoZW4gd2Ugd2lsbCB3
YWl0IG9ubHkgdGhhdAo+ID4gPj4+PiArCSAqIHNtYWxsIGppZmZ5IGZyYWN0aW9uIC0gcG9zc2li
bHkgbGVhZGluZyB0byBmYWxzZSB0aW1lb3V0Cj4gPiA+Pj4+ICsJICovCj4gPiA+Pj4+ICsJdGlt
ZW91dF9tcyA9IGppZmZpZXMgKyBtc2Vjc190b19qaWZmaWVzKHRpbWVvdXRfbXMpICsgMTsKPiA+
ID4+Pj4gICAgCWRvIHsKPiA+ID4+Pj4gICAgCQlyZXQgPSBuYW5kX3JlYWRfZGF0YV9vcChjaGlw
LCAmc3RhdHVzLCBzaXplb2Yoc3RhdHVzKSwgdHJ1ZSk7Cj4gPiA+Pj4+ICAgIAkJaWYgKHJldCkg
ICAgCj4gPiA+Pj4gSSBkb24ndCByZWFsbHkgd2hhdCB5b3UgYXJlIGZpeGluZyBoZXJlLCBJIHN1
c3BlY3QgdGhlIHJvb3QgY2F1c2UgdG8gYmUKPiA+ID4+PiBhIHdyb25nbHkgY2FsY3VsYXRlZCB0
aW1lb3V0X21zIGluIHRoZSBjYWxsaW5nIGRyaXZlci4KPiA+ID4+Pgo+ID4gPj4+IEl0IGlzIHRo
ZSByZXNwb25zaWJpbGl0eSBvZiB0aGUgY2FsbGVyIHRvIHVzZSB0aGlzIGZ1bmN0aW9uIHdpdGgg
YQo+ID4gPj4+IHJlbGV2YW50IHRpbWVvdXRfbXMgcGFyYW1ldGVyLiBNYXliZSBDaHJpc3RvcGhl
IGNhbiBoZWxwIHlvdSBoZXJlPyAgICAKPiA+ID4+PiAgID4+IEhpIE1pcXVlbCwgICAgCj4gPiA+
Pgo+ID4gPj4gYXNzdW1lIHRoYXQgbmFuZF9zb2Z0X3dhaXRyZHkgaXMgY2FsbGVkIHdpdGggdGlt
ZW91dF9tcz09MS4gSSBzdXBwb3NlIGl0IGlzCj4gPiA+PiB2YWxpZCBjYXNlLiBKaWZmaWVzIGFy
ZSAxMDAwIGZvciBleGFtcGxlIChhc3N1bWUgc29tZXRoaW5nIG1vcmUgbGlrZSAxMDAwLjk5IC0K
PiA+ID4+IGp1c3QgYmVmb3JlIGluY3JlbWVudGluZyB0byAxMDAxKS4KPiA+ID4+IFdlIGNvbXB1
dGUgdGltZW91dF9tcyA9IDEwMDArbXNlY3NfdG9famlmZmllcygxKSA9IDEwMDEgKGF0IGxlYXN0
IGZvciBteSBqaWZmaWVzIHJhdGUpLgo+ID4gPj4gbmFuZF9yZWFkX2RhdGFfb3AgaXMgY2FsbGVk
IGZvciB0aGUgZmlyc3QgdGltZSBhbmQgcmV0dXJucyAwLiBEdXJpbmcgdGhlIGNhbGwgamlmZmll
cyBjaGFuZ2VzCj4gPiA+PiB0byAxMDAxIHRodXMgIndoaWxlIGxvb3AiIGVuZHMgaGVyZSAod3Jv
bmdseSkuCj4gPiA+PiBOb3RpY2UgdGhhdCByb3V0aW5lIHdhcyBjYWxsZWQgd2l0aCBleHBlY3Rl
ZCB0aW1lb3V0IDFtcyBidXQgYWN0dWFsIHRpbWVvdXQgdXNlZCB3YXMgc29tZXRoaW5nCj4gPiA+
PiBiZXR3ZWVuIDAuLi4xbXMgKHdoaWNoIEkgYWxzbyBtZWFzdXJlZCBieSB0cmFjaW5nICYgc2Nv
cGUgb24gdGhlIGJ1cykuCj4gPiA+PiBPciBpcyBteSBhbmFseXNpcyBmbGF3ZWQgc29tZXdoZXJl
ID8gICAgCj4gPiA+IEkgYWdyZWUgd2l0aCB5b3VyIGFuYWx5c2lzLiBFdmVuIGlmIG5hbmRfc29m
dF93YWl0cmR5IHdpbGwgbm8gbG9uZ2VyIGJlCj4gPiA+IHVzZWQgYnkgdGhlIHN0bTMyIGRyaXZl
ciAoQ2hyaXN0b3BoZSBzZW50IGEgcGF0Y2ggZm9yIHRoYXQpIEkgYW0gZmluZQo+ID4gPiBhcHBs
eWluZyB0aGlzIGNoYW5nZS4KPiA+ID4KPiA+ID4gQ291bGQgeW91IGFkZCBhIGNvbW1lbnQgdG8g
ZXhwbGFpbiB0aGUgJysxJyBhbmQgcmVzZW5kPwo+ID4gPiAgICAKPiA+IENhbiB5b3UgZ2l2ZSBt
ZSBzb21lIGd1aWRhbmNlIHBsZWFzZSA/IFdoZXJlIHNob3VsZCBJIGFkZCBtb3JlIGNvbW1lbnQg
dG8KPiA+IHRoZSBnaXQgY29tbWl0IG9yIHRvIHRoZSBDIGNvZGUgPyBJIHRyaWVkIHRvIGNvbW1l
bnQgYm90aCBjb21taXQgYW5kIGNvZGUsIHByb2JhYmx5Cj4gPiB5b3UgZmluZCB0aGUgY29tbWVu
dHMgbm90IGNsZWFyIGVub3VnaCA/ICAKPiAKPiBTb3JyeSBmb3Igbm90IGV4cGxhaW5pbmc6IENv
dWxkIHlvdSBhZGQgdGhlIGV4YW1wbGUgdG8gdGhlIGNvbW1pdAo+IG1lc3NhZ2U/IFRoZSBjb21t
ZW50IGlzIGZpbmUsIGJlc2lkZXMgdGhlIGZhY3QgdGhhdCBpdCBzaG91bGQgc3RhcnQKPiBsaWtl
IHRoaXM6Cj4gCj4gCS8qCj4gCSAqIEJsYSBibGEgYmxhCj4gCj4gQWxzbyBwbGVhc2UgY2hhbmdl
IHRoZSBjb21taXQgdGl0bGUsIG1heWJlCj4gCj4gCW10ZDogcmF3bmFuZDogRW5zdXJlIG5hbmRf
c29mdF93YWl0cmR5IHdhaXQgcGVyaW9kIGlzIGVub3VnaAo+IAo+IFRoYW5rcywKPiBNaXF1w6hs
CgoKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
