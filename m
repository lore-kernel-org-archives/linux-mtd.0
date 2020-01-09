Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D4E7C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 16:36:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EC4F206ED
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 16:36:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tLTiHvnT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EC4F206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pxZSr0kujj/ozG/kuyRre8qJIFBoUTiHVpPdQNi+5uA=; b=tLTiHvnTT3ozJZ
	96ZuD6iBGxaKXlWzeeytvRsOOhCuCaXcbt7ROmK5zgYnlN982DOlkXYCTOFi1xUoHJEqLMshZx5UZ
	KUFcgh+pkBo5012kLBICr2Tr0vVBidW+AWfd+9Gx4l66BGYVl0quTy4L6HxcXojzmkDiZKiFlbO8J
	LNUXEbY5O4sfAJswSNFbM++ijUjBFJhuYQvyGJvyAyfE2q6tv6h6bimyxBiHLQWOn9OuiT7Y2xX4j
	+vAEg8hw22EvscODlHYjg8G/GjVeebt3BCs0uUe7BbyOebW7yMyz+LIfD7EcDgX1L/rViEQpZUlV5
	L+Eyw2q+ul24fl5fCqdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipanX-0003Td-GS; Thu, 09 Jan 2020 16:36:39 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipanU-0003Qj-Nq
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 16:36:38 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 6A09520000F;
 Thu,  9 Jan 2020 16:36:33 +0000 (UTC)
Date: Thu, 9 Jan 2020 17:36:32 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kursad Oney <kursad.oney@broadcom.com>
Subject: Re: Number of bytes for spi-nand bad block marker
Message-ID: <20200109173632.618fe684@xps13>
In-Reply-To: <CAMm8Nh0+BgomkSMrDHgzA5SkQZczp5CVAJefE79z=vfoPrui_Q@mail.gmail.com>
References: <CAMm8Nh0+BgomkSMrDHgzA5SkQZczp5CVAJefE79z=vfoPrui_Q@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_083636_915228_BCF140F3 
X-CRM114-Status: GOOD (  17.31  )
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
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgS3Vyc2FkLAoKS3Vyc2FkIE9uZXkgPGt1cnNhZC5vbmV5QGJyb2FkY29tLmNvbT4gd3JvdGUg
b24gTW9uLCAxMiBBdWcgMjAxOQoxNjoyNDo1NyAtMDQwMDoKCj4gSGksCj4gCj4gVGhlIHNwaS1u
YW5kIGRyaXZlciBpbiBib3RoIGxpbnV4IGFuZCB1LWJvb3QgY2hlY2sgMiBieXRlcyBmb3IgYmFk
Cj4gYmxvY2sgbWFya2VycyBpbiBzcGluYW5kX2lzYmFkKCkuIEhvd2V2ZXIsIHRoZSBkYXRhc2hl
ZXQgZm9yCj4gVzI1TjAxR1Z4eElHIHNheXMgJ0Eg4oCcQmFkIEJsb2NrIE1hcmtlcuKAnSBpcyBh
IG5vbi1GRmggZGF0YSBieXRlIHN0b3JlZAo+IGF0IEJ5dGUgMCBvZiBQYWdlIDAgZm9yIGVhY2gg
YmFkIGJsb2NrLiBBbiBhZGRpdGlvbmFsIG1hcmtlciBpcyBhbHNvCj4gc3RvcmVkIGluIHRoZSBm
aXJzdCBieXRlIG9mIHRoZSA2NC1CeXRlIHNwYXJlIGFyZWEuJyB3aGljaCBpcwo+IGJhc2ljYWxs
eSBvbmUgYnl0ZSBmb3IgQkJNIGluIHNwYXJlLgo+IAo+IEJvcmlzIHNheXMgdGhleSBoYXZlIHVz
ZWQgdGhlIHNhbWUgcGF0dGVybiBmb3IgcGFyYWxsZWwgTkFORCBiZWNhdXNlCj4gc29tZSBOQU5E
cyBhcmUgaW50ZXJmYWNlcyB0aHJvdWdoIGEgMTYtYml0IGJ1cy4KPiAKPiBIZXJlIGlzIHRoZSBz
aXR1YXRpb24gSSBhbSBmYWNpbmc6IFdlIHJvbGxlZCBvdXIgb3duIG93biBzcGktbmFuZAo+IGtl
cm5lbC9ib290bG9hZGVyIGRyaXZlcnMgYmVmb3JlIHRoZSBrZXJuZWwgc3BpLW5hbmQgZHJpdmVy
IHdhcwo+IGludGVncmF0ZWQsIGFuZCBzZXQgQkJNIHNpemUgdG8gMSBieXRlIGZvciB0aGlzIHR5
cGUgb2YgZmxhc2guIFRoaXMKPiBtZWFucyB0aGUgMm5kIGJ5dGUgaXMgYXZhaWxhYmxlIGZvciB1
c2UuIFNvbWUgZGV2aWNlcyBpbiB0aGUgZmllbGQKPiB1dGlsaXplIHRoZSBleHRyYSBieXRlIGZv
ciB0aGUgamZmczIgY2xlYW4gbWFya2VyLgo+IAo+IFdlIHdvdWxkIGxpa2UgdG8gbWlncmF0ZSB0
byB0aGUgbWFpbmxpbmUgZHJpdmVycyBidXQgdGhpcyBwcmVzZW50cyBhbgo+IGlzc3VlLiBXaGVu
IHdlIGZsYXNoIGFuIGltYWdlIHdpdGggdGhlIG1haW5saW5lIHUtYm9vdCBzcGktbmFuZAo+IGRy
aXZlciwgaXQgdGhpbmtzIHRoZSBjbGVhbmVkIGpmZnMyIGJsb2NrcyBhcmUgImJhZCBibG9ja3Mi
IHNpbmNlIG9uZQo+IG9mIHRoZSBieXRlcyBpbmNsdWRlcyB0aGUgY2xlYW4gbWFya2VyLgo+IAo+
IE1hcmVrIHN1Z2dlc3RlZCB3ZSBkbyBhIG9uZS10aW1lIHVwZ3JhZGUgc2NyaXB0IHdoZXJlIHdl
IHJld3JpdGUgdGhlCj4gT09CIGJ1dCBpdCdzIGEgcmlza3kgb3BlcmF0aW9uLCBlc3BlY2lhbGx5
IGluIHRoZSBmaWVsZC4gQm9yaXMgYXNrZWQKPiBtZSB0byBlbWFpbCB0aGUgTVREIGxpc3QgYW5k
IGNvbnRpbnVlIHRoZSBkaXNjdXNzaW9uIGhlcmUuIEkKPiBhcHByZWNpYXRlIGFueSBvcGluaW9u
cy9zdWdnZXN0aW9ucy4KClNvcnJ5IGZvciB0aGUgdmVyeSB2ZXJ5IGxhdGUgcmVwbHkuCgpIb3cg
ZGlkIHlvdSBtYW5hZ2UgdGhpcyBzaXR1YXRpb24/CgpBcyB5b3UgaGF2ZSBhIHZlcnkgc3BlY2lm
aWMgbmVlZCB3aGljaCBpcyBub3QgYWN0dWFsbHkgcmVsYXRlZCB0bwpoYXJkd2FyZSBzdXBwb3J0
IGJ1dCBtb3JlIGEgcHJvYmxlbSBvZiBjb2hlcmVuY2UgYmV0d2VlbiB5b3VyIG9sZApkcml2ZXJz
IGFuZCBtYWlubGluZSwgd2hhdCBhYm91dCB3cml0aW5nIHN1cHBvcnQgZm9yIDEtYnl0ZSBCQk0g
aW4Kc3BpLW5hbmQ/IElmIGl0IGlzIHRvbyBpbnZhc2l2ZSBJIGRvbid0IHRoaW5rIGl0IGNhbiBi
ZSBtYWlubGluZWQsIGJ1dAphdCBsZWFzdCB5b3UgY291bGQgdXNlIGEgbWFpbmxpbmUgZHJpdmVy
IHdpdGggYSBzbWFsbCBjaGFuZ2Ugb24gdG9wIG9mCml0IG9uIHlvdXIgb2xkLXJ1bm5pbmcgaW4t
dGhlLWZpZWxkIGJvYXJkcz8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
