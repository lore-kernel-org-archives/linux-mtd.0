Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9C6C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jan 2022 09:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LIR4p+2/kYMEE5OmcSEXqi3RqMaMVC0Wn8ei/iMZbOY=; b=0g/WSpv/h6B+Ui
	m4IoPipObuPv9fArBWy5meEzjuYNT0OGykF6XTn4VkIQ7Zup6sTAQy0SbBrXj3FeMQ+u8nfzkcC4u
	TomuoZ6Ra12EeHO1oBeUXdNiLeU3dKQwQHHgwnYb9KESvA7VJKN2Yt0TszOFqqJk6U+LpWGkrp9B0
	DrhcDae37ufoG9JNWxsdOgufRHZry9kBaiwwgsSCciQUhIFsOMq/nR9cCP1Hkvi939XWNwLNpf1t3
	l7cwctmI8fN5kGk2XlMaYQ0REmZiCKyGYc7h3hmIn/dH3GJAIsdaqCmWer64uOXIWVD042XHfjW0I
	Jc0YpgF0rsdFQzwYd/KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4JTw-008eoP-B6; Mon, 03 Jan 2022 09:18:20 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4JTt-008eo0-B2
 for linux-mtd@lists.infradead.org; Mon, 03 Jan 2022 09:18:18 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id AF29C24000D;
 Mon,  3 Jan 2022 09:18:07 +0000 (UTC)
Date: Mon, 3 Jan 2022 10:18:06 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Pratyush Yadav <p.yadav@ti.com>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>, Julien
 Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v7 04/14] spi: cadence: Provide a capability structure
Message-ID: <20220103101806.581d1a4f@xps13>
In-Reply-To: <20220103093819.080e60fb@collabora.com>
References: <20211217161654.367782-1-miquel.raynal@bootlin.com>
 <20211217161654.367782-5-miquel.raynal@bootlin.com>
 <20211220185515.wujhgn66mnwns7bw@ti.com>
 <20211221111605.352285f5@xps13>
 <20211221104108.t563gg2hulfqt2uh@ti.com>
 <20211221121947.5c779bfd@xps13>
 <20211221120458.4l7expkdznnw6u3u@ti.com>
 <20220103093819.080e60fb@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_011817_561876_7BA88CF5 
X-CRM114-Status: GOOD (  17.93  )
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

SGVsbG8sCgpib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbSB3cm90ZSBvbiBNb24sIDMgSmFu
IDIwMjIgMDk6Mzg6MTkgKzAxMDA6Cgo+IE9uIFR1ZSwgMjEgRGVjIDIwMjEgMTc6MzU6MDAgKzA1
MzAKPiBQcmF0eXVzaCBZYWRhdiA8cC55YWRhdkB0aS5jb20+IHdyb3RlOgo+IAo+ID4gPiAKPiA+
ID4gQW55d2F5LCBkbyB5b3UgbWluZCBpZiB3ZSBtb3ZlIGZvcndhcmQgZmlyc3Q/IE5vdCB0aGF0
IEkgZG9uJ3QgdGhpbmsKPiA+ID4gdGhhdCB0aGlzIGNob2ljZSBzaG91bGQgYmUgZGlzY3Vzc2Vk
IGZ1cnRoZXIsIGJ1dCBJIHRoaW5rIHRoaXMgY2FuCj4gPiA+IGVhc2lseSBiZSBjaGFuZ2VkIGlu
IHRoZSBuZWFyIGZ1dHVyZSBpZiB0aGVyZSBpcyBhIGRlc2lyZSB0bwo+ID4gPiByZW9yZ2FuaXpl
IHNwaS1tZW0gb2JqZWN0cy4gSW4gZmFjdCwgdGhlc2UgY2FwYWJpbGl0aWVzIGFyZSBhY2Nlc3Nl
ZAo+ID4gPiB0aHJvdWdoIGEgaGVscGVyIHNvIHRoYXQgaHlwb3RoZXRpYyBjaGFuZ2Ugd291bGQg
YmUgYWxtb3N0IHRyYW5zcGFyZW50LiAgICAKPiA+IAo+ID4gT2theS4gSSB3b3VsZCBzdGlsbCBs
aWtlIHRvIGhlYXIgb3RoZXIgb3BpbmlvbnMgb24gdGhpcywgYnV0IGZpbmUgYnkgbWUgCj4gPiBp
ZiB5b3Ugd2FudCB0byB0YWtlIHRoaXMgaW4gYXMtaXMuICAKPiAKPiBJIHRoaW5rIHdlIGRpc2N1
c3NlZCB0aGF0IHdpdGggTWlxdWVsLCBhbmQgSSByZW1lbWJlciBjb21wbGFpbmluZyBhYm91dAo+
IG1peGluZyBmdW5jdGlvbiBwb2ludGVycyBhbmQgYWN0dWFsIGRhdGEgaW4gdGhlIHNwaV9tZW1f
b3BzIHN0cnVjdCwgYnV0Cj4gaG9uZXN0bHksIGl0J3MganVzdCBjb3NtZXRpYyBjb25jZXJuLCBh
bmQgSSBkb24ndCB0aGluayBpdCBtYXR0ZXJzIG11Y2gKPiBpbiBwcmFjdGljZS4gU28gSSdtIGZp
bmUgZWl0aGVyIHdheSwgbWFrZSBpdCBhIGZpZWxkIG9mIHNwaV9jb250cm9sbGVyCj4gb3Igc3Bp
X21lbV9vcHMsIHNwaV9tZW0gaXMgZGVmaW5pdGVseSBub3QgdGhlIHJpZ2h0IHBsYWNlIHRob3Vn
aC4KClllYWgsIEkgZG9uJ3QgbGlrZSB0aGUgaWRlYSBvZiBsZWFraW5nIHNwaS1tZW0gaW5mb3Jt
YXRpb24gaW50byB0aGUgc3BpCmNvbnRyb2xsZXIgc3RydWN0dXJlLCB3aGlsZSB0aGVyZSBpcyBh
IHN0cnVjdHVyZSAoc28gZmFyIG9ubHkKY29udGFpbmluZyBob29rcykgdGhhdCBpcyBkZWRpY2F0
ZWQgdG8gc3BpLW1lbSBvcGVyYXRpb25zLiBFeHRlbmRpbmcKdGhpcyBzdHJ1Y3R1cmUgdG8gY29u
dGFpbiBjYXBhYmlsaXRpZXMgYXBwZWFyZWQgdGhlIHJpZ2h0IGNob2ljZSB0byBtZS4KQnV0IG9u
IHRoZSBvdGhlciBoYW5kIHRoaXMgaXMgYSBjb250cm9sbGVyIGluZm9ybWF0aW9uIGFueXdheSBz
byBpZiB5b3UKYm90aCBwcmVmZXIgbW92aW5nIHRoaXMgZGF0YSBpbnRvIHRoZSBTUEkgY29udHJv
bGxlciBzdHJ1Y3R1cmUgSSdsbCBmaW5kCmEgd2F5IHRvIGRvIGl0LgoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
