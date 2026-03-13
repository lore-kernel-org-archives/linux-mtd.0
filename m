Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE56C105F7A7
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2026 13:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R3uN2yOPFRNSFvd9ONOo0nrhILOXx4w5bArpAOGd6Rs=; b=NWUsfZ4r2OcDlP
	pr0/2CwaumK4edrmovarUk+om5jweiFvb2gDsftBa4dP8Sm4oPDgE8mbASl/GHtmGFGfHZz7Lahrh
	7jDx8wOuU5jOa0w3m7qIOM9CoWGPCTFl950L/cF0sdXOx+PLxnCzVob+OdK5V2m163uMJjEHLN2D6
	7R/PNJxufGoglU7imo38GGc0CJSGGLvPrhCitBNLpOcgOc2DW48msjqbTWF7M5NcBvcZgcrp6Z10V
	w1k3+ingvA8znAwXONjDWsPPIDGOQMgN/g68sly3WeBtqmNJvSRhRL2FNRVz+7LsVm7Bb6zuEKhPT
	Q3uqMwS5ol1/kPh78FGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12OH-00000000Chw-0MPW;
	Fri, 13 Mar 2026 13:17:21 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12OD-00000000Cg6-1pBG
	for linux-mtd@lists.infradead.org;
	Fri, 13 Mar 2026 13:17:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 272D91A2E20;
	Fri, 13 Mar 2026 13:17:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EFCFA60027;
	Fri, 13 Mar 2026 13:17:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8601B10369EFA;
	Fri, 13 Mar 2026 14:17:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773407832; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=JOFoYAGJVyyk6xus0Z9WrQazmgihSHEPBTdXrGtZqcU=;
	b=VvoaKN1dElbt5A/ybhYmCk6wEI1Ngpxe3iW3oiNxdyeYLq1bqdTWhYNUJrTky/N5PLukYP
	+SX8Pxiy0Amwukf7dJZ0u1o3+9D+hjQri/gJIOkGvLzoeunqOR83EhbIwSNY4T1MfA2fpq
	OjmOjaa8OKvYpQP173AzLyfCYegCnyzfkYNCfLRi8p/Q2rq79ZosUn3F4oKIUPvVZCWtoR
	rW6a1Fdzan6FZ6YcGjglY+5bxobYNRmAVtVpYqAFHIWdMLbrf09qfKh6Z/59CMG/T6UzDS
	AHhAfsXlSebetCMmVajdULN7rrm8taDoo3nq/adst4SvEmeygDrg3B+PiH1DiQ==
Message-ID: <8d33c193-995c-4225-9998-8c81a2268065@bootlin.com>
Date: Fri, 13 Mar 2026 14:17:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] mtd: rawnand: sunxi: introduce variable user data
 length
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Wentao Liang <vulab@iscas.ac.cn>,
 Maxime Ripard <mripard@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260305100137.2558423-1-richard.genoud@bootlin.com>
 <20260305100137.2558423-7-richard.genoud@bootlin.com>
 <87a4wdkt3y.fsf@bootlin.com>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <87a4wdkt3y.fsf@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_061717_603755_16D75AD3 
X-CRM114-Status: GOOD (  17.26  )
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

TGUgMTIvMDMvMjAyNiDDoCAxNTo0MSwgTWlxdWVsIFJheW5hbCBhIMOpY3JpdMKgOgo+IEhlbGxv
IFJpY2hhcmQsCj4gCj4gT24gMDUvMDMvMjAyNiBhdCAxMTowMTozNyArMDEsIFJpY2hhcmQgR2Vu
b3VkIDxyaWNoYXJkLmdlbm91ZEBib290bGluLmNvbT4gd3JvdGU6Cj4gCj4+IEluIEFsbHdpbm5l
ciBTb0NzLCB1c2VyIGRhdGEgY2FuIGJlIGFkZGVkIGluIE9PQiBiZWZvcmUgZWFjaCBFQ0MgZGF0
YS4KPj4gRm9yIG9sZGVyIFNvQ3MgbGlrZSBBMTAsIHRoZSB1c2VyIGRhdGEgc2l6ZSB3YXMgdGhl
IHNpemUgb2YgYSByZWdpc3Rlcgo+PiAoNCBieXRlcykgYW5kIHdhcyBtYW5kYXRvcnkgYmVmb3Jl
IGVhY2ggRUNDIHN0ZXAuCj4+IFNvLCB0aGUgQTEwIE9PQiBMYXlvdXQgaXM6Cj4+IFs0Qnl0ZXMg
VVNFUl9EQVRBX1NURVAwXSBbRUNDX1NURVAwIGJ5dGVzXQo+PiBbNGJ5dGVzIFVTRVJfREFUQV9T
VEVQMV0gW0VDQ19TVEVQMSBieXRlc10KPj4gLi4uCj4+IE5COiB0aGUgQkJNIGlzIHN0b3JlZCBh
dCB0aGUgYmVnaW5uaW5nIG9mIHRoZSBVU0VSX0RBVEFfU1RFUDAuCj4+Cj4+IE5vdywgZm9yIEg2
L0g2MTYgTkFORCBmbGFzaCBjb250cm9sbGVyLCB0aGlzIHVzZXIgZGF0YSBjYW4gaGF2ZSBhCj4+
IGRpZmZlcmVudCBzaXplIGZvciBlYWNoIHN0ZXAuCj4+IEFuZCB0aGUgdmVuZG9yIGhhcyBjaG9z
ZW4gYSBkaWZmZXJlbnQgbGF5b3V0IGZyb20gdGhlIG9uZSBvbiBBMTAsIHVzaW5nCj4+IDggYnl0
ZXMgZm9yIHN0ZXAgMCBhbmQgbm90aGluZyBmb3IgZnVydGhlciBzdGVwczoKPj4gWzhieXRlcyBV
U0VSX0RBVEFfU1RFUDBdIFtFQ0NfU1RFUDAgYnl0ZXNdIFtFQ0NfU1RFUDEgYnl0ZXNdLi4uCj4+
IChTdGlsbCB3aXRoIEJCTSBzdG9yZWQgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgVVNFUl9EQVRB
X1NURVAwKQo+IAo+IEkgd291bGQgcmF0aGVyIGJlIGluIGZhdm91ciBvZiBub3QgZm9sbG93aW5n
ICQocmFuZG9tIHZlbmRvcikgZmlybXdhcmUKPiBsYXlvdXQuIFVwc3RyZWFtLCBpdCBtYWtlcyBw
cm9iYWJseSBtb3JlIHNlbnNlIHRvIGp1c3QgYWxsb3cgYWNjZXNzIHRvCj4gdGhlIG1heGltdW0g
bnVtYmVyIG9mIGJ5dGVzIHRoYXQgY2FuIGJlIGNvdmVyZWQgYnkgdGhlIEVDQyBlbmdpbmUsIHNv
IEkKPiB3b3VsZCByYXRoZXIgYmUgaW4gZmF2b3VyIG9mIGNvbXB1dGluZyB0aGUgbWF4aW11bSBz
aXplIHRoYXQgeW91IGNhbiBzZXQKPiBmb3IgZWFjaCBzdGVwLCB3aXRob3V0IGdvaW5nIG92ZXIg
dGhlIE9PQiBzaXplLgpPaywgSSdsbCB3cml0ZSBhbiBpbXBsZW1lbnRhdGlvbiBmb3IgdGhhdC4K
ClRoYW5rcyAhCgo+IAo+IE9uY2UgdGhpcyBzZXQgdXAsIEkgYmVsaWV2ZSBhZGFwdGluZyB0aGUg
ZHJpdmVyIGxvY2FsbHkgKG91dCBvZiB0cmVlKSB0bwo+IG1hdGNoIGEgc3BlY2lmaWMgdmVuZG9y
IGxheW91dCB3b3VsZCBiZSByYXRoZXIgc3RyYWlnaHRmb3J3YXJkLCBhcyBhbGwKPiB0aGUgY29u
ZmlndXJhdGlvbiBwaWVjZXMgd291bGQgYWxyZWFkeSBiZSBpbiBwbGFjZS4KPiAKPiBUaGFua3Ms
Cj4gTWlxdcOobAoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
