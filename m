Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F20C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Mar 2022 16:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0hbs8B5nn7Lc4Gv5VYx9c7Fq8tRpUMygGhUD/SBwhgk=; b=J91iNFzSTc7DVs
	1RF4q2xsn5jqHBg7Nyhj3n0nkrwujukcB0p5FfQzKM2SeeWl+mH41j2JeTXhca8RGLSRupsdInQp1
	gq8EpO6tWAVAe8YPmQrYSE8qd++XC5PwgQ2QYdN2qCRi++Z4xxh5ixwYHPHJ93PCUuBxn4hnwblns
	5V1pax0ftUurPTvaCxacIi3XdIL5Ik29Bm1ZicFNKGNag288QPJuqqYRKn92rPkRFtAn/+tpsnFQ6
	N4DdBJijw3HTYty2n9XQI6qcRYRWLrglx/MyKozKT+JmFoxtv0yEqRHZy4IGSb7kNZn8WO40hL5ku
	tFaoNAOvyWO/Nra54bew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRGK7-000r0p-Qw; Mon, 07 Mar 2022 16:35:03 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRGK3-000qz7-RF
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2022 16:35:02 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 55A3F6000B;
 Mon,  7 Mar 2022 16:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646670896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m70B0IH/7HmN66dahNn5qiOkRxfLpaUjjkTXUfTQcr0=;
 b=KC7PGef7tFC2T8yTNRAsmcz47gID67fAQs+MC8eJikmK04+t0Abzt4pZ/FFeQjnIm3lBis
 iNlclT7eXifvaCQJ8FiU8CQbO100C/WhTK6DfYU8UP4csN+P09Zw+o0UUTZHa3KTir1lGg
 WCryIte2NgVOfSlmwxkY4AflNCx+LUdE7Y2iBL1vjzqEEfELAD4bHNUhclS2oCWR25FxOZ
 5iPA7Jrrpb4Bplp4Irg8HakEAomNo8uDphun01hoXySpbQHgrc+NeXGXfUByQHAPmWGNyL
 wDQnf0mv1PCKnBpMY9Uhq+Z3SucMkF0yVVJZ5U3Zsy7rY8cDDzYSzUZtrviE7g==
Date: Mon, 7 Mar 2022 17:34:53 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael
 Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] mtd: Fixes for v5.17-rc5
Message-ID: <20220307173453.24a55573@xps13>
In-Reply-To: <CAHk-=wjweAonv54h4rxFPVReKS5qZkVCGfB80GUDPNKbo-uEqQ@mail.gmail.com>
References: <20220218153617.016a905a@xps13>
 <CAHk-=wjweAonv54h4rxFPVReKS5qZkVCGfB80GUDPNKbo-uEqQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_083500_261801_A17981C7 
X-CRM114-Status: GOOD (  24.47  )
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

SGkgTGludXMsCgp0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZyB3cm90ZSBvbiBTdW4sIDYg
TWFyIDIwMjIgMTI6MDg6MDQgLTA4MDA6Cgo+IEknbSBhYm91dCB0byByZWxlYXNlIHJjNywgYW5k
IEkgc3RpbGwgZG9uJ3QgaGF2ZSB0aGUgYnVpbGQgZml4IGZvciBNVEQKPiB0aGF0IGhhcyBiZWVu
IHBlbmRpbmcgaW4gdGhlIG10ZCB0cmVlIHNpbmNlIEZlYiAxOS4KPiAKPiBJJ20gdGFsa2luZyBh
Ym91dCBjb21taXQgN2NmMWRlOTU3YTk4ICgibXRkOiByYXduYW5kOiBvbWFwMjogQWN0dWFsbHkK
PiBwcmV2ZW50IGludmFsaWQgY29uZmlndXJhdGlvbiBhbmQgYnVpbGQgZXJyb3IiKS4gVGhlIGxh
Y2sgb2Ygd2hpY2gKPiBzdGlsbCBjYXVzZXMgYnVpbGQgZXJyb3JzIG9uIGF0IGxlYXN0IHNwYXJj
NjQsIGFuZCBoYXMgc2luY2UgcmM0LgoKSSBoYXZlIHJlY2VpdmVkIGEgcm9ib3QgZXJyb3IgdHJp
Z2dlcmVkIGJlY2F1c2Ugb2YgQ09NUElMRV9URVNUIGJlaW5nCnNlbGVjdGVkIGluIGEgcmFuZG9t
IGNvbmZpZy4gWWVzIGl0IHNob3VsZCBub3QgaGFwcGVuLCBidXQgbm8gaXQgZG9lcwpub3QgYnJl
YWsgc3BhcmM2NCBBRkFJSy4gSWYgaXQgZWZmZWN0aXZlbHkgZG9lcywgdGhlbiBJIGRlZXBseQph
cG9sb2dpemUgYnV0IEkgZGlkbid0IHJlY2VpdmUgdGhpcyBpbmZvcm1hdGlvbiBteXNlbGYuCgpJ
IHByb3Bvc2VkIGEgZml4IGEgbW9udGggYWdvIGJ1dCBpdCBnb3QgcmVqZWN0ZWQgYmVjYXVzZSBw
ZW9wbGUgY2xhaW1lZAoibm9ib2R5IGVsc2UgdXNlZCB0aGF0IHNvbHV0aW9uIHVudGlsIG5vdyBz
byBsZXQncyBub3QgdHJ5IHRoYXQiLiBTbyB3ZQp3ZW50IGZvciBhbm90aGVyIGZpeCwgd2hpY2gg
bGVhZCB0byB0aGUgaXNzdWUgeW91IGNvbXBsYWluIGFib3V0LgoKSSB0aGVuIHJlY2VpdmVkIGFu
b3RoZXIgZml4IHRvIHF1ZXVlIG9uIHRvcCBvZiAtcmM0LCB3aGljaCBJIGRpZCwKaW4gYSByZWFz
b25hYmxlIHRpbWUgZnJhbWUuIEJ1dCB0aGVuIEkgaGFkIHRvIHdhaXQgZm9yIHJvYm90cyB0bwp0
ZWxsIG1lIGlmIHRoZXJlIGlzIHN0aWxsIGEgYnJlYWthZ2Ugd2l0aCBhbm90aGVyIHJhbmRvbSBj
b25maWd1cmF0aW9uLAphbmQgdGhpcyBtYXkgdGFrZSBhYm91dCBhIHdlZWsgdG8gaGFwcGVuLgoK
TGFzdCB3ZWVrIEkgd2FzIGZpbmUgd2l0aCB0aGUgcmVzdWx0IGFuZCBmaW5hbGx5IHRvb2sgdGhl
IHRpbWUgdG8gc2VuZAppdCB0byB5b3Ugb24gRnJpZGF5LiBZZXMsIGl0IGNvdWxkIGhhdmUgYmVl
biBlYXJsaWVyLiBUbyBiZSBzaG9ydCwgd2hlbgp3cml0aW5nIGEgc2hvcnQgZXhwbGFuYXRpb24g
Zm9yIHRoaXMgUFIsIEkgcmVhbGl6ZWQgdGhlIGZpeCB3b3VsZAppbmNyZWFzZSB0aGUga2VybmVs
IHNpemUgZm9yIG5vIHJlYXNvbiBvbiBzZXZlcmFsIGFyY2hpdGVjdHVyZXMgc28gSQphc2tlZCBp
ZiB3ZSBjb3VsZCBjb25zaWRlciBhbm90aGVyIHdheToKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtbXRkLzZjMDlkZTE1LTFhYjItNWNhOC03MDAzLTY5ZmYzZjdjNGRjNUBrZXJuZWwub3Jn
L1QvI21lYzdmMzgxMDhmMTg5ZjRhZjViODY1MDExZDc1OGEyYWZhNjAwOWM0CgpUaGFua3MgdG8g
dGhlIGRpc2N1c3Npb25zIHdlIGhhZCB0b2RheSwgdGhlcmUgd2FzIGFjdHVhbGx5IGEKbWlzdW5k
ZXJzdGFuZGluZyByZWdhcmRpbmcgdGhpcyBkZXBlbmRlbmN5IGFuZCB0aGUgZml4IGNhbiBnbyBp
biBhcy1pcy4KClNob3VsZCBJIGhhdmUgc2VudCB0aGlzIGZpeCBhbnl3YXk/IEkgc3RpbGwgdGhp
bmsgcmV0YWluaW5nIHRoZSBmaXgKd2FzIHRoZSBnb29kIHRoaW5nIHRvIGRvLiBTaG91bGQgSSBo
YXZlIGRvbmUgdGhhdCBlYXJsaWVyPyBZZXMsIEkgY291bGQKaGF2ZSBzYXZlZCBhIHdlZWsgaW4g
dGhlIGJlc3QgY2FzZS4gV2FzIHRoaXMgZml4IHVyZ2VudD8gSSBkb24ndCB0aGluawppdCB3YXMg
dG8gdGhlIHBvaW50IG9mIGdldHRpbmcgeW91IChhbmQgbm93IG15c2VsZiBhcyB3ZWxsKSBmcnVz
dHJhdGVkLgoKPiBUaGlzIGlzIGdldHRpbmcgcXVpdGUgZnJ1c3RyYXRpbmcuIFRoZXNlIGFyZSBi
YXNpYyBlcnJvcnMgdGhhdCBmYWlsCj4gc29tZSB2ZXJ5IGJhc2ljIGlzc3VlcywKCiJzZWxlY3Qi
IGRlcGVuZGVuY2llcyBhcmUgdGhlIHNvdXJjZSBvZiBtYW55IHByb2JsZW1zIGJlY2F1c2Ugb2Yg
dGhlCiJJIHdvbid0IHByb3BhZ2F0ZSB0aGUgZGVwZW5kZW5jeSBhbnkgZnVydGhlciIgY2hvaWNl
LiBZZXMgZm9yIG1hbnkKc2ltcGxlIHNpdHVhdGlvbnMgS2NvbmZpZyBpcyB3ZWxsIHNoYXBlZCBi
dXQgZm9yIGFueSBub24gdHJpdmlhbApzaXR1YXRpb24gaXQgaXMgbm90IHdoYXQgSSB3b3VsZCBj
YWxsIGEgInZlcnkgYmFzaWMgaXNzdWUiLgoKPiBoYXZlIGZpeGVzLAoKTm90IGZyb20gbXkgcG9p
bnQgb2YgdmlldywgYXQgbGVhc3Qgbm90IHdoaWxlIEkgd2FzIHN0aWxsIGluIHRpbWUgdG8Kc2Vu
ZCB0aGUgZml4LgoKPiBhbmQgdGhlIGZpeGVzIGZvciBzb21lIGluZXhwbGljYWJsZSByZWFzb24g
YXJlbid0IGFjdHVhbGx5IHByb3BhZ2F0ZWQgdXAuCgpUaGUgdHJ1dGggaXMsIHlvdSBwZXJzb25h
bGx5IGNhbm5vdCBmb2xsb3cgYWxsIHRoZSBwYXRjaGVzIG5vciByZWFkCmFsbCB0aGUgZGlzY3Vz
c2lvbnMuIEkgYW0gbm90IGJsYW1pbmcgYW55Ym9keSBmb3IgdGhhdC4gSSB1bmRlcnN0YW5kCnlv
dSBoYXZlIHRvIGFzay4gQnV0IEkgd291bGQgcGVyc29uYWxseSBhcHByZWNpYXRlIGlmIHlvdSBj
b3VsZCB1c2UgYQptb3JlIGZyaWVuZGx5IHRvbmU7ICJnZXR0aW5nIHF1aXRlIGZydXN0cmF0aW5n
IiwgImJhc2ljIGVycm9ycywgInZlcnkKYmFzaWMgaXNzdWVzIiwgImluZXhwbGljYWJsZSByZWFz
b24iIGFyZSBhbGwgc3VwZXJmbHVvdXMuCgpBbnl3YXksIEkgYW0gc29ycnkgZm9yIHRoZSBpbmNv
bnZlbmllbmNlLCBJIHdpbGwgcHJvdmlkZSB0aGlzIGZpeCBhc2FwLgoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
