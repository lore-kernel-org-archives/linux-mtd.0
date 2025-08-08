Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B00C87FD3
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Aug 2025 13:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RkDpsrHCKpKG4PQSOv8ligeC7zkpdKvedXEXbfpVS50=; b=S/s/v4izA4UEC8
	8cH/NRj4Il08EjgNcRgaKVRryQfSTec6ySVvVfhri3jxPyF2xzF0OimBVxAQIwZZmYZtvMJ1Vt7FS
	2Rjx9G6/CczKUjbSTNBBzp1YshEp35T5eB2GQa+aP91nPPFFY9hA+VPeF4K7CvXuew+dp7o3XU/7o
	gkjHo5LuVhRiUpMrpwwo5XTloHcu6c1zGdK3ldtlfjlu22zA3DKDBNcoAnWXkzQd4ncwKulcmqpdV
	RewRYHIbEdTnJekuGX1eE45JdlfshLlQFgVKmIJvQ7yXDCR0Yk4CYTLT4PnvWEIGqWzwp2CJMItZF
	b9tcAEAopUl4CVHz5bwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukNCN-00000002vpF-0AZW;
	Fri, 08 Aug 2025 13:31:55 +0000
Received: from relay15.mail.gandi.net ([217.70.178.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukNCJ-00000002vot-2rT9
	for linux-mtd@lists.infradead.org;
	Fri, 08 Aug 2025 13:31:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E83A944231;
	Fri,  8 Aug 2025 13:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754659908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1YlEfO5SdadZ5b6bX2HxSPMXRGjLeaqLb+pw14u9LMQ=;
	b=IRSbPqUUM2DmUwWDbMAKCO3MeMb7+8hAd4mh+TV+hFAl394ceYjkKmc0qHfRr37hHY+tGf
	s0F9b0FdfHy4eYFi5cfZEPPVJ8JS7iYIYl5UzUnjWD8H0/hvANwypTS9JLozKpw5hT9Nmu
	n7nZLuohjXP6Qfdexpf0ZgMjCNlBR+vvxM3FZZpmfpEDEaqqNBWyC4JosmV85/XB3xU8rC
	Le5kSq6uJpn7hbfEq3jLRF8NNvzYRsk82mHCg+4TrVaEdzLdQIj8lOW6scj44n5fOwx7rV
	zBz9m/2uVQHreIe1pOz511ZK6pa1sEfoVifAd5JhzFBtdDfM63L2H+oLxaxhtA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <markus.stockhausen@gmx.de>
Cc: <vigneshr@ti.com>,  <richard@nod.at>,  <tudor.ambarus@linaro.org>,
  <linux-mtd@lists.infradead.org>,  "'Chris Packham'"
 <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: AW: AW: AW: NAND ECC errors
In-Reply-To: <05e301dc0867$6195e760$24c1b620$@gmx.de> (markus stockhausen's
	message of "Fri, 8 Aug 2025 15:21:40 +0200")
References: <118501dc07ae$3f6379a0$be2a6ce0$@gmx.de>
	<2537e2a1-f958-4e9c-b346-b4fac2152a47@alliedtelesis.co.nz>
	<034f01dc07e1$8dd75dd0$a9861970$@gmx.de>
	<a1794cf8-ed93-45db-8ac1-7e5d2ccd9fe9@alliedtelesis.co.nz>
	<87pld6b3y8.fsf@bootlin.com> <052001dc085f$81e731c0$85b59540$@gmx.de>
	<87ikiy9e9n.fsf@bootlin.com> <05e301dc0867$6195e760$24c1b620$@gmx.de>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Fri, 08 Aug 2025 15:31:46 +0200
Message-ID: <87a54a9by5.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdefleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetheekledvvdehhedtfeektdejueettdfhgedukeegfeelteektedtkeeiffdtieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledvrddukeegrddutdekrdeiheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrieehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepmhgrrhhkuhhsrdhsthhotghkhhgruhhsvghnsehgmhigrdguvgdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhis
 hhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeevhhhrihhsrdfrrggtkhhhrghmsegrlhhlihgvughtvghlvghsihhsrdgtohdrnhii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_063151_854621_3DC77C33 
X-CRM114-Status: GOOD (  12.63  )
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

T24gMDgvMDgvMjAyNSBhdCAxNToyMTo0MCArMDIsIDxtYXJrdXMuc3RvY2toYXVzZW5AZ214LmRl
PiB3cm90ZToKCj4+IFZvbjogbGludXgtbXRkIDxsaW51eC1tdGQtYm91bmNlc0BsaXN0cy5pbmZy
YWRlYWQub3JnPiBJbSBBdWZ0cmFnIHZvbiBNaXF1ZWwgUmF5bmFsCj4+IEdlc2VuZGV0OiBGcmVp
dGFnLCA4LiBBdWd1c3QgMjAyNSAxNDo0Mgo+PiAKPj4gT24gMDgvMDgvMjAyNSBhdCAxNDoyNTox
OCArMDIsIDxtYXJrdXMuc3RvY2toYXVzZW5AZ214LmRlPiB3cm90ZToKPj4gSnVzdCB0byBmdWxs
eSB1bmRlcnN0YW5kLCB5b3UgYXJlIHRyeWluZyB0byByZXBsaWNhdGUgd2hhdCB0aGUgc29mdHdh
cmUKPj4gQkNIIGVuZ2luZSBvZiB5b3VyIHJlYWx0ZWsgU1BJIGNvbnRyb2xsZXIgZG9lcz8KPj4K
Pj4gSWYgc28sIHdoeSBub3QganVzdCBjb25maWd1cmluZyB0aGUgZW5naW5lIGRpcmVjdGx5IGFu
ZCB1c2UgaXQ/IEl0IHdpbGwKPj4gYmUgbXVjaCBmYXN0ZXIgYW5kIGVhc2llciB0byBkby4KPj4K
Pj4gT3RoZXJ3aXNlLCBpZiB5b3UncmUgdHJ5aW5nIHRvIGRvIGluIHNvZnR3YXJlIHdoYXQgdGhl
IGhhcmR3YXJlIGRvZXMsCj4+IHlvdSBtdXN0IGJlIHByZXBhcmVkIHRvIG1vcmUgbWF0aHM6Cj4+
IGh0dHBzOi8vYm9vdGxpbi5jb20vYmxvZy9zdXBwb3J0aW5nLWEtbWlzYmVoYXZpbmctbmFuZC1l
Y2MtZW5naW5lLwo+Cj4gSWRlYSB3YXMgdG8gc3RhcnQgd2l0aCBzb21ldGhpbmcgSSBoYXZlIGZ1
bGx5IHVuZGVyc3Rvb2QuIFdhbnRldCB0bwo+IGxlYXZlIEhhcmR3YXJlIGZvciBsYXRlciBhcyBF
Q0MgaXMgYSB0b3RhbCBuZXcgYXJlYSBub3cgKGFzIGl0IHdhcyB3aXRoIAo+IE5BTkQgdGhlIGxh
c3Qgd2VlaykuIEhhZCBhIHNob3J0IGxvb2sgYXQgdGhlIGhhcmR3YXJlIGVuZ2luZSBHUEwgCj4g
Y29kZS4gVGhlIG1vc3QgYmFzaWMgcGFydHMgbG9vayBzdHJhaWdodCBmb3J3YXJkIHdpdGggdGhy
ZWUgZnVuY3Rpb25zCj4KPiAtIFByZXBhcmUgdG8gdG8gZW5jb2RlZCBkYXRhCj4gLSBQcmVwYXJl
IHRvIGJlIGRlY29kZWQgZGF0YQo+IC0gS2ljayBlbmdpbmUKPgo+IGVjYy1tdGsgc2VlbXMgdGln
aHRseSBpbnRlZ3JhdGVkIGludG8gdGhlIG5hbmQgY29udG9sbGVyIHdoaWxlIAo+IGVjYy1teGlj
IHNlZW1zIHRvIGJlIHNvbWUgcGFzc3Rocm91Z2gvcGlwZWxpbmUgaW50ZWdyYXRpb24uCj4KPiBX
aGF0IHdvdWxkIGJlIHlvdXIgYWR2aXNlIGZvciB0aGUgbW9zdCBzaW1wbGUgZW5oYW5jZW1lbnQg
Cj4gZm9yIG91ciBleGlzdGluZyBSZWFsdGVrIHNwaS1tZW0gY29udHJvbGxlcj8KCkZyb20gbXkg
Y3VycmVudCB1bmRlcnN0YW5kaW5nLCBpbXBsZW1lbnRpbmcgdGhlIGV4dGVybmFsIGFwcHJvYWNo
IChzZWUKTWFyb25peCBleHRlcm5hbCBFQ0MgZW5naW5lIGNhc2UpIHNob3VsZCBiZSB0aGUgZWFz
aWVzdCBwYXRoIGZvcndhcmQuCgpJZiB0aGUgZW5naW5lIGlzIHRpZ2h0bHkgaW50ZWdyYXRlZCB0
byB0aGUgY29udHJvbGxlciAoSSBoYXZlIG5vIGlkZWEpLAp0aGVuIHVzZSB0aGUgcGlwZWxpbmVk
IGV4YW1wbGUgb3IgTVRLJ3MgZXhhbXBsZS4KCllvdSBuZWVkIHRvIGltcGxlbWVudCB2ZXJ5IGZl
dyBjYWxsYmFja3MgZm9yIGdldHRpbmcgaXQgdG8gd29yaywgYW5kCmV4Y2VwdCB0aGUgaW5pdCB3
aGljaCBtaWdodCBiZSBhIGJpdCBwYWluZnVsIHRoZXkgd2lsbCBhbGwgYmUgc2ltcGxlCihsaWtl
IHNldC9jbGVhciBhIGJpdCwgcmV0dXJuIHRoZSB2YWx1ZSBvZiBhIHJlZ2lzdGVyLi4uKS4KCkdv
b2QgbHVjayEKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
