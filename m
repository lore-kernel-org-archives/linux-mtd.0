Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891B3C02180
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2025 19:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jUzY1qJiXGth2V4SYDXavLBKrLPgDJI5l+YJCSkKy/U=; b=Rutw0xabdq5dVH
	SUw4jAb6AA0NWE8/jaItgbVIHPWMHkZahmHLkvOX3npytkvCebrNcFIfs+Z2zmoq7GntlAVH93jDx
	OHqc6bFK8h0KZDPD9Z5777td7qqNniFeVmkPlvVSN3Eif+2wB3PFFrvEBr453GgQTVFIXee/tj6wL
	NztGy3Xb4G+n4imyA8Kjxcb3NxQ7QDnDunVfamTR3DgjgsYyA6uxPPPaRuauGOPRTJvULLKn7Cqpu
	v5Dh8NOuJ/OLxIMtueATJ2kFiGXdmJN/bpMNnFMToImKuM6ADGpYv2ZdjPQf2aM9obgqtEaJfswPf
	0pRN/aq2dzuSzyOiGgkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8yF-0000000Ctal-40PR;
	Wed, 15 Jan 2025 19:22:31 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8yD-0000000CtaC-1lrf
	for linux-mtd@lists.infradead.org;
	Wed, 15 Jan 2025 19:22:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72E1720003;
	Wed, 15 Jan 2025 19:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736968947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uvlL0mfj44cUCiwG8WLJrEnhaM51ApZOW7dKY/vuFiA=;
	b=Ip1BlMl93pKCALrSZKHRK3E2cThEoM684DtxClKerUnAHE+XALAA4E2QB0oMKrk/srchnw
	SJACqMQ8SlerS5Kd+G3O5/P45LVKnwrNDo1y0dGnMb+LEMnqepEj9cNaqlHat/BXjDU/tP
	wDExJThqs0CvG1AoQXpOb0CDhjX+RyXeoAEFcHqL7xUtC5Bh/X1rfPZ3SqnXmD9BC9Ah6r
	ap8ZH1MoMHQXnwlAB0GScmJZaG66htE4tpUppAUx/nrlA022aIhLqJPRxwrBodwjIzaiKC
	72MBi2xsYuISHHTtsIMZSsPNPbyG7C+vTGixVFj08ptr7fvShIjyoRcooioWfg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  "De Marchi, Lucas" <lucas.demarchi@intel.com>,  Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,  "Vivi,
 Rodrigo"
 <rodrigo.vivi@intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>,
  "Poosa, Karthik" <karthik.poosa@intel.com>,  "Abliyev, Reuven"
 <reuven.abliyev@intel.com>,  "Weil, Oren jer" <oren.jer.weil@intel.com>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
  "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 01/11] mtd: core: always create master device
In-Reply-To: <CY5PR11MB63663795A6C4DC83CB89602AED182@CY5PR11MB6366.namprd11.prod.outlook.com>
	(Alexander Usyskin's message of "Tue, 14 Jan 2025 14:05:40 +0000")
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
	<20250101153925.865703-2-alexander.usyskin@intel.com>
	<87sepwp6d9.fsf@bootlin.com>
	<IA1PR11MB6370A551FC8AEF0F9F404B42ED102@IA1PR11MB6370.namprd11.prod.outlook.com>
	<CY5PR11MB63663795A6C4DC83CB89602AED182@CY5PR11MB6366.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 15 Jan 2025 20:22:25 +0100
Message-ID: <871px3lw5q.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_112229_754645_52961F48 
X-CRM114-Status: GOOD (  15.70  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgoKT24gMTQvMDEvMjAyNSBhdCAxNDowNTo0MCBHTVQsICJVc3lza2luLCBBbGV4YW5kZXIi
IDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+IHdyb3RlOgoKPj4gPiA+IENyZWF0ZSBtYXN0
ZXIgZGV2aWNlIHdpdGhvdXQgcGFydGl0aW9uIHdoZW4KPj4gPiA+IENPTkZJR19NVERfUEFSVElU
SU9ORURfTUFTVEVSIGZsYWcgaXMgdW5zZXQuCj4+ID4KPj4gPiBJIGRvbid0IHRoaW5rIHlvdSB0
b29rIGludG8gY29uc2lkZXJhdGlvbiBteSByZW1hcmtzIHJlZ2FyZGluZyB0aGUgZmFjdAo+PiA+
IHRoYXQgeW91IHdvdWxkIGJyZWFrIHVzZXJzcGFjZS4gSWYgeW91IGVuYWJsZSB0aGUgbWFzdGVy
LCB5b3Ugbm8gbG9uZ2VyCj4+ID4gaGF2ZSB0aGUgc2FtZSBkZXZpY2UgbnVtYmVyaW5nIGluIHVz
ZXJzcGFjZS4gSSBrbm93IHBlb3BsZSBzaG91bGQgbm90Cj4+ID4gY2FyZSBhYm91dCB0aGVzZSBu
dW1iZXJzLCBidXQgaW4gcHJhY3RpY2UgdGhleSBkby4KPj4gPgo+PiA+IElmIEknbSB3cm9uZywg
cGxlYXNlIGJlIGEgbGl0dGxlIG1vcmUgdmVyYm9zZSBhYm91dCB3aHkgOikKPj4gPgo+PiA+IFRo
YW5rcywKPj4gPiBNaXF1w6hsCj4+IAo+PiBIaSBNaXF1ZWwKPj4gCj4+IEkndmUgY3JlYXRlZCBz
ZXBhcmF0ZSBjbGFzcyAobXRkX21hc3RlcikgZm9yIHN1Y2ggZGV2aWNlcy4KPj4gVXNlcy1zcGFj
ZSBsb29raW5nIGZvciBtdGQgZGV2aWNlIGNvbnRpbnVlcyB0byByZWNlaXZlIHNhbWUgbnVtYmVy
IG9mCj4+IC9kZXYvbXRkWCBkZXZpY2VzLgo+PiBUaGVyZSB3aWxsIGJlIGFkZGl0aW9uYWwgL2Rl
di9tdGRfbWFzdGVyWCBkZXZpY2VzLCBidXQgdGhpcyBpcyB1bmF2b2lkYWJsZSwgSQo+PiBzdXBw
b3NlLgo+PiBNYXliZSB3ZSBjYW4gcmVuYW1lIGl0IHRvIHNvbWV0aGluZyB0aGF0IG5vdCBpbiAv
ZGV2L210ZCogZXhwcmVzc2lvbiAoZS5nLgo+PiBtYXN0ZXJtdGRYKSwKPj4gaWYgaXQgaGVscHMu
Cj4+IAo+Cj4gTWlxdWVsLCBpcyB0aGlzIGdvb2QgZW5vdWdoIG9yIHJlcXVpcmVzIHJld3JpdGU/
CgpUaGlzIGlzIGFuIGltcG9ydGFudCBjaGFuZ2UgdGhhdCByZXF1aXJlcyBhdHRlbnRpb24sIGFu
ZCBhdCB0aGUgdGltZSBJCmhhdmUgbm90IGJlZW4gYWJsZSB0byBkZWRpY2F0ZSBlbm91Z2ggdG8g
dGhpcyBwYXRjaC4KCkFsc28sIGlmIHRoZSBvdGhlciBtdGQgbWFpbnRhaW5lcnMgd2FudCB0byBo
ZWxwLCBJJ2xsIGJlIGVudGhvdXNpYXN0aWMKYWJvdXQgaXQgOikKClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
