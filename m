Return-Path: <SRS0=IhQK=BN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14AA7C433DF
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 08:37:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3C3520678
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 08:37:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ddHqMxTB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3C3520678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NaNBuITTVvE6UNnVEBDK0qdF/WJvf9npv7iZ+8Osszg=; b=ddHqMxTBw1qldrkOIZM1E0a44
	uC4tNKZ3UBuZI/X9yrHA6Yepan2oZiP1aoZmMig0/nmrzRPIYD9CTwYqabg4bKZWQHy3esOEBeTwE
	ySzR9aKxApC+g4s60Rnv0euvWyRuGGXKw2xsE7a459mflfbcBFBxpCpZEveW0sFq89qpRjfln6UON
	V2F/WRBCn2Ouk2SGkQI0R4Rvxw4oR5blv5fTZMm+aIu6b9BxKEVjC8b7Xuyb/dgilHxPwHtj6ASRZ
	ZcfItrxSyAB76x9CcXySey39RHpjO+gUbCjhkv0TW95/451oN/9VtIILWz8PQP9euw2N0YYCR/6hn
	H0RFbeUEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2Vxn-0001KB-Rs; Mon, 03 Aug 2020 08:36:55 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2Vxl-0001JX-Ti
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2020 08:36:54 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 194E3C000A;
 Mon,  3 Aug 2020 08:36:49 +0000 (UTC)
Date: Mon, 3 Aug 2020 10:36:48 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: ingenic: Limit MTD_NAND_JZ4780 to
 architecture only
Message-ID: <20200803103648.17273c10@xps13>
In-Reply-To: <CAK8P3a3zM4M2y1shVnUYCArZxxf9FHbOkVCK0yAK8wbfQTVChg@mail.gmail.com>
References: <CAJKOXPc2w0QHQDEwqoeg9Nm361MszM4LRaCoJD2En-fPgPp+4Q@mail.gmail.com>
 <IBDZDQ.K28R5FAI0BXI2@crapouillou.net>
 <20200724155436.GA7460@kozik-lap>
 <K5Y0EQ.WYAK00ADM46F3@crapouillou.net>
 <CAK8P3a0HDu15u5dREd6gk_e9D6mrZ9JqT0DJs9AeC9C2602nAw@mail.gmail.com>
 <20200726160616.GA2662@kozik-lap>
 <RO33EQ.546WD84D5N7K2@crapouillou.net>
 <20200726161545.GA6058@kozik-lap>
 <B243EQ.VEXGA7ZL5JAE2@crapouillou.net>
 <CAK8P3a1r6AMz2wKBEosAqn7qkuJY4LGFYK7o85sO++d+TSVOgQ@mail.gmail.com>
 <20200727170302.GA3507@kozik-lap>
 <CAK8P3a3zM4M2y1shVnUYCArZxxf9FHbOkVCK0yAK8wbfQTVChg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_043654_093699_D563BED5 
X-CRM114-Status: GOOD (  20.65  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPiB3cm90ZSBvbiBNb24sIDI3IEp1
bCAyMDIwIDE5OjI4OjQ4ICswMjAwOgoKPiBPbiBNb24sIEp1bCAyNywgMjAyMCBhdCA3OjAzIFBN
IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiBPbiBNb24s
IEp1bCAyNywgMjAyMCBhdCAwOTo1NTo1NEFNICswMjAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOiAg
Cj4gPiA+Cj4gPiA+IFRoZSB3YXkgd2UgZG8gaXQgb24gQXJtLCB0aGUgbWFjaGluZSBLY29uZmln
IGlkZW50aWZpZXJzIHN0YXkgYXJvdW5kCj4gPiA+IGV2ZW4gZm9yIG11bHRpcGxhdGZvcm0gdGFy
Z2V0cyAod2hpY2ggbm93IG1ha2UgdXAgYmFzaWNhbGx5IGFjdGl2ZWx5Cj4gPiA+IG1haW50YWlu
ZWQgbWFjaGluZXMpLgo+ID4gPgo+ID4gPiBJIGRvbid0IHRoaW5rIGl0IG1ha2VzIGFueSBzZW5z
ZSBmb3IgYSBkcml2ZXIgdG8gZGVwZW5kIG9uIE1JUFNfR0VORVJJQzoKPiA+ID4gZWl0aGVyIGl0
IGlzIGEgZ2VuZXJpYyBkcml2ZXIgdGhhdCBzaG91bGQgYWx3YXlzIGJlIHZpc2libGUgb3IgaXQg
aXMgc3BlY2lmaWMKPiA+ID4gdG8gYSBzZXQgb2YgU29DcyBhbmQgc2hvdWxkIGRlcGVuZCBvbiBz
b21lIGNvcnJlc3BvbmRpbmcgdmVuZG9yCj4gPiA+IHNwZWNpZmljIGlkZW50aWZpZXJzLiAgCj4g
Pgo+ID4gSWYgc3VwcG9ydCBmb3IgSW5nZW5pYyBpcyBwcm92aWRlZCBhbHNvIGJ5IE1JUFNfR0VO
RVJJQyAod2l0aG91dAo+ID4gc2VsZWN0aW5nIE1BQ0hfSU5HRU5JQyksIHRoZW4gaXQgbWFrZXMg
c2Vuc2UuIFRoaXMgd291bGQgYmUganVzdCBhCj4gPiBkaWZmZXJlbnQgd2F5IHRoYW4gQVJNIG9m
IGJ1aWxkaW5nIG11bHRpLXBsYXRmb3JtIGtlcm5lbC4gIAo+IAo+IFllcywgaXQgd291bGQgd29y
ayBqdXN0IGFzIHdlbGwsIG15IHBvaW50IHdhcyBqdXN0IHRoYXQgaXQgaXMgc29tZXdoYXQKPiBj
b25mdXNpbmcgdG8gaGF2ZSBldmVyeSBhcmNoaXRlY3R1cmUgZG8gaXQgZGlmZmVyZW50bHksIGFu
ZCB0aGF0IEkKPiBwcmVmZXIgdGhlIHdheSBBcm0gKGFuZCBhbHNvIHBwYywgeDg2IGV0YykgaGFu
ZGxlcyBpdCB0b2RheS4KPiAKPiBPbiBNSVBTLCBtb3N0IHBsYXRmb3JtcyBhcmUgbm90IHlldCBw
YXJ0IG9mIE1JUFNfR0VORVJJQywgc28KPiB0aGV5IGFyZSBmYWlybHkgZnJlZSB0byBwaWNrIHdo
YXRldmVyIG1ldGhvZCB3b3JrcyBiZXN0IGFuZCBpcwo+IGNvbnNpc3RlbnQgd2l0aCB0aGUgcmVz
dCBvZiB0aGUga2VybmVsLgoKSW4gdGhlIGVuZCwgc2hhbGwgSSBhcHBseSBLcnp5c3p0b2YgcGF0
Y2ggb3Igc2hhbGwgSSB3YWl0IGZvciBhbiB1cGRhdGUKKGVnLiB3aXRob3V0ICdkZWZhdWx0IHkn
KT8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
