Return-Path: <SRS0=zMTj=7Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 899C4C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 14:22:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E00E20679
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 14:22:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lR85w9CS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E00E20679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZoAZS8FbDCq3NezX+0/MClkilNV1ZRzkinM9Cf+KWW4=; b=lR85w9CSWDWMYp
	tjJYGYTbbxaCDO9nc/BsEpTimeyIQx7ggi0RFJ/RV/Eu0rYt/FOETTzwBSpMR92lZMCqKOHqDsx0d
	2f5/iIaMxUSBFR+OTj5DLZOeVvuEYUPY70bJb0R2+crAgfyua9mA6X8uiFgIaRd3Pbbtl1H3WD6qk
	Nvqq86FIcdjUrWzWCDriU8ZGWG78b97ov7XoMwZ62o6jKnGSnW2TH3dXcOfuncWo4MoXU5eVwpArr
	LmE8QUgVR8q4jqpNKTREJPzXQNnO73+6AIompnP119lNtbVZqGtHe2EQO9NJreZklkzGGzhYIh3jy
	P9GrJrGiP3dXXlfDJdZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgUHU-0002rb-DU; Wed, 03 Jun 2020 14:22:12 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgUHQ-0002qp-VK
 for linux-mtd@lists.infradead.org; Wed, 03 Jun 2020 14:22:10 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 06B3C240009;
 Wed,  3 Jun 2020 14:22:04 +0000 (UTC)
Date: Wed, 3 Jun 2020 16:22:03 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 0/8] mtd: rawnand: bcm47xx: Convert to exec_op() (and
 more)
Message-ID: <20200603162203.7db6462a@xps13>
In-Reply-To: <20200518162837.304471-1-boris.brezillon@collabora.com>
References: <20200518162837.304471-1-boris.brezillon@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_072209_142841_75AE4B3A 
X-CRM114-Status: GOOD (  17.96  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3
cm90ZSBvbiBNb24sIDE4IE1heQoyMDIwIDE4OjI4OjI5ICswMjAwOgoKPiBIZWxsbywKPiAKPiBB
IGJpdCBvZiBjb250ZXh0IHRvIGV4cGxhaW4gdGhlIG1vdGl2YXRpb24gYmVoaW5kIHRob3NlIGNv
bnZlcnNpb25zCj4gSSd2ZSBiZWVuIHNlbmRpbmcgZm9yIHRoZSBsYXN0IGNvdXBsZSBvZiB3ZWVr
cy4gVGhlIHJhdyBOQU5EIHN1YnN5c3RlbQo+IGNhcnJpZXMgYSBsb3Qgb2YgaGlzdG9yeSB3aGlj
aCBtYWtlcyBhbnkgcmV3b3JrIG5vdCBvbmx5IHBhaW5mdWwsIGJ1dAo+IGFsc28gc3ViamVjdCB0
byByZWdyZXNzaW9ucyB3aGljaCB3ZSBvbmx5IGRldGVjdCB3aGVuIHNvbWVvbmUgZGFyZXMgdG8K
PiB1cGRhdGUgaXRzIGtlcm5lbCBvbiBvbmUgb2YgdGhvc2UgYW5jaWVudCBIVy4gV2hpbGUgY2Fy
cnlpbmcgZHJpdmVycwo+IGZvciBvbGQgSFcgaXMgbm90IGEgcHJvYmxlbSBwZXIgc2UsIGNhcnJ5
aW5nIGFuY2llbnQgYW5kIHVubWFpbnRhaW5lZAo+IGRyaXZlcnMgdGhhdCBhcmUgbm90IGNvbnZl
cnRlZCB0byBuZXcgQVBJcyBpcyBhIG1haW50ZW5hbmNlIGJ1cmRlbiwKPiBoZW5jZSB0aGlzIG1h
c3NpdmUgY29udmVyc2lvbiBhdHRlbXB0IEknbSBjb25kdWN0aW5nIGhlcmUuCj4gCj4gU28gaGVy
ZSBpcyBhIHNlcmllcyBjb252ZXJ0aW5nIHRoZSBCQ000N1hYIE5BTkQgY29udHJvbGxlciBkcml2
ZXIgdG8KPiBleGVjX29wKCksIHBsdXMgYSBidW5jaCBvZiBtaW5vciBpbXByb3ZlbWVudHMgZG9u
ZSBhbG9uZyB0aGUgd2F5Lgo+IEkgaG9wZSBJJ2xsIGZpbmQgc29tZW9uZSB0byB0ZXN0IHRob3Nl
IGNoYW5nZXMsIGJ1dCBpZiB0aGVyZSdzIG5vIG9uZQo+IHN0aWxsIGhhdmluZyBhY2Nlc3MgdG8g
dGhpcyAgSFcgb3Igbm8gaW50ZXJlc3QgaW4ga2VlcGluZyBpdCBzdXBwb3J0ZWQKPiBpbiByZWNl
bnQga2VybmVsIHZlcnNpb25zLCB3ZSBzaG91bGQgZGVmaW5pdGVseSBjb25zaWRlciByZW1vdmlu
ZyB0aGUKPiBkcml2ZXIgaW5zdGVhZC4KPiAKPiBObyBtYWpvciBjaGFuZ2VzIGluIHRoaXMgdjIs
IGFwYXJ0IGZyb20gZml4ZXMgZm9yIHRoaW5ncyByZXBvcnRlZCBieQo+IE1pcXVlbC4gU2VlIHRo
ZSBjaGFuZ2Vsb2cgb24gZWFjaCBwYXRjaCBmb3IgbW9yZSBkZXRhaWxzLgo+IAo+IFJlZ2FyZHMs
Cj4gCj4gQm9yaXMKPiAKPiBCb3JpcyBCcmV6aWxsb24gKDgpOgo+ICAgbXRkOiByYXduYW5kOiBB
ZGQgYW4gaXNfbGFzdCBmbGFnIHRvIG5hbmRfc3Vib3AKPiAgIG10ZDogcmF3bmFuZDogYmNtNDd4
eDogRHJvcCBkZXBlbmRlbmN5IG9uIEJDTUEKPiAgIG10ZDogcmF3bmFuZDogYmNtNDd4eDogQWxs
b3cgY29tcGlsaW5nIHRoZSBkcml2ZXIgd2hlbiBDT01QSUxFX1RFU1Q9eQo+ICAgbXRkOiByYXdu
YW5kOiBiY200N3h4OiBEZW1pc3RpZnkgYSBmZXcgbW9yZSB0aGluZ3MKPiAgIG10ZDogcmF3bmFu
ZDogYmNtNDd4eDogSW1wbGVtZW50IHRoZSBleGVjX29wKCkgaW50ZXJmYWNlCj4gICBtdGQ6IHJh
d25hbmQ6IGJjbTQ3eHg6IEdldCByaWQgb2YgdGhlIGxlZ2FjeSBpbXBsZW1lbnRhdGlvbgo+ICAg
bXRkOiByYXduYW5kOiBiY200N3h4OiBTaW1wbGlmeSB0aGUgaW5pdCgpIGZ1bmN0aW9uCj4gICBt
dGQ6IHJhd25hbmQ6IGJjbTQ3eHg6IE1lcmdlIGFsbCBzb3VyY2UgZmlsZXMKPiAKPiAgZHJpdmVy
cy9tdGQvbmFuZC9yYXcvS2NvbmZpZyAgICAgICAgICAgICAgICAgIHwgICAzICstCj4gIGRyaXZl
cnMvbXRkL25hbmQvcmF3L01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICAuLi4v
bXRkL25hbmQvcmF3L2JjbTQ3eHgtbmFuZC1jb250cm9sbGVyLmMgICAgfCAzNDMgKysrKysrKysr
KysrKwo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9iY200N3h4bmZsYXNoL01ha2VmaWxlICAgfCAg
IDUgLQo+ICAuLi4vbmFuZC9yYXcvYmNtNDd4eG5mbGFzaC9iY200N3h4bmZsYXNoLmggICAgfCAg
MjYgLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9iY200N3h4bmZsYXNoL21haW4uYyAgICAgfCAg
NzcgLS0tCj4gIC4uLi9tdGQvbmFuZC9yYXcvYmNtNDd4eG5mbGFzaC9vcHNfYmNtNDcwNi5jICB8
IDQ1MCAtLS0tLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNl
LmMgICAgICAgICAgICAgIHwgICAyICsKPiAgaW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5oICAg
ICAgICAgICAgICAgICAgIHwgICAyICsKPiAgOSBmaWxlcyBjaGFuZ2VkLCAzNDkgaW5zZXJ0aW9u
cygrKSwgNTYxIGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tdGQv
bmFuZC9yYXcvYmNtNDd4eC1uYW5kLWNvbnRyb2xsZXIuYwo+ICBkZWxldGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9tdGQvbmFuZC9yYXcvYmNtNDd4eG5mbGFzaC9NYWtlZmlsZQo+ICBkZWxldGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9tdGQvbmFuZC9yYXcvYmNtNDd4eG5mbGFzaC9iY200N3h4bmZsYXNo
LmgKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbXRkL25hbmQvcmF3L2JjbTQ3eHhuZmxh
c2gvbWFpbi5jCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL210ZC9uYW5kL3Jhdy9iY200
N3h4bmZsYXNoL29wc19iY200NzA2LmMKPiAKCkFueW9uZSB0byB0ZXN0IHRoaXMgc2VyaWVzPwoK
SWYgbm90IEkgd2lsbCBhcHBseSBpdCBhcyBzb29uIGFzIHY1LjgtcmMxIGlzIHJlbGVhc2VkLgoK
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
