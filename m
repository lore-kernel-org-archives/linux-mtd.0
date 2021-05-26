Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2251C47089
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 17:51:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52EEE6139A
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 17:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52EEE6139A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BzqRX1GsrTCIWEg+8gP8WJEF1W+52AvZHWnMdRMPUq0=; b=yfsSvm9XWdhUiW
	y681IFRXEXYKifqMaF1IohAeKd6qPOz3zO/pAj0PLhF5YqeSN2Dd/NimJyqQB3KsBsw/WQPFRkAUb
	LKCKc4AuqD0wqObJ+sZ6sULbF4cN/X0Us/lXN4ZGTp+u9OXyD5RLiohEzkzCQmJRaJWmNa3wiztcz
	nD5TpAuekKbVZBWXE5TuqNC4aS1ZpdEUU8C+0UvwiSc9ru+4GJClf9viQQ4MT2KTfIrveMTlRqkWt
	RszaowvsJaQWbwtJ+zxs4ZTngKW8UzJkXv438sb8Dxj1GZXqjEuVh2lP0sOxF7/dRKW1kqbMzjlZy
	DerbpC+pRVvgm6O5EQIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llxfM-00GG32-6U; Wed, 26 May 2021 17:50:00 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llwfi-00FqcB-0K
 for linux-mtd@lists.infradead.org; Wed, 26 May 2021 16:46:19 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B2DD620002;
 Wed, 26 May 2021 16:46:13 +0000 (UTC)
Date: Wed, 26 May 2021 18:46:12 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Richard Weinberger
 <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vignesh
 Raghavendra <vigneshr@ti.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] mtd: Changes for v5.13-rc4
Message-ID: <20210526184612.751e7e5c@xps13>
In-Reply-To: <CAHk-=wh_ZHF685Fni8V9is17mj=pFisUaZ_0=gq6nbK+ZcyQmg@mail.gmail.com>
References: <20210526175924.4f9ab124@xps13>
 <CAHk-=wh_ZHF685Fni8V9is17mj=pFisUaZ_0=gq6nbK+ZcyQmg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_094618_222096_A3878271 
X-CRM114-Status: GOOD (  20.33  )
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

SGkgTGludXMsCgpMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGludXgtZm91bmRhdGlvbi5vcmc+
IHdyb3RlIG9uIFdlZCwgMjYgTWF5CjIwMjEgMDY6MjA6MzUgLTEwMDA6Cgo+IE9uIFdlZCwgTWF5
IDI2LCAyMDIxIGF0IDU6NTkgQU0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGlu
LmNvbT4gd3JvdGU6Cj4gPgo+ID4gUmF3IE5BTkQ6Cj4gPiAqIHR4eDluZGZtYywgdG1pbywgc2hh
cnBzbCwgbmRmYywgbHBjMzJ4eF9zbGMsIGZzbWMsIGNzNTUzeDoKPiA+ICAgLSBGaXggZXh0ZXJu
YWwgdXNlIG9mIFNXIEhhbW1pbmcgRUNDIGhlbHBlciAgCj4gCj4gV2h5IGFyZSB0aGVzZSBndXlz
IGFsbCBwb2ludGxlc3NseSBkdXBsaWNhdGluZyB0aGUgZWNjIHdyYXBwZXIKPiBmdW5jdGlvbnMg
Zm9yIHRoZWlyIGVjYyAnY29ycmVjdCcgZnVuY3Rpb25zPwo+IAo+IFRoZSB3aG9sZSAidGhlIEhh
bW1pbmcgc29mdHdhcmUgRUNDIGVuZ2luZSBoYXMgYmVlbiB1cGRhdGVkIHRvIGJlY29tZQo+IGEg
cHJvcGVyIGFuZCBpbmRlcGVuZGVudCBFQ0MgZW5naW5lIiBleGN1c2UgbWFrZXMgbm8gc2Vuc2Uu
IElmCj4gbXVsdGlwbGUgY2hpcHMganVzdCB3YW50IGEgYmFzaWMgc3cgaGFtbWluZyBoZWxwZXIs
IHRoZW4gdGhleSBzaG91bGQKPiBoYXZlIG9uZS4gTm90IGhhdmUgdG8gYmUgZm9yY2VkIHRvIGVh
Y2ggd3JpdGUgdGhlaXIgb3duIHBvaW50bGVzcwo+IHdyYXBwZXIgbGlrZSB0aGlzLgo+IAo+IFRo
ZXNlIGNoaXAgZHJpdmVycyBqdXN0IHdhbnQgJ2VjY19zd19oYW1taW5nX2NvcnJlY3QoKScgd2l0
aCB0aGUKPiBwcm9wZXIgYXJndW1lbnRzLCBhbmQgaXQgc2VlbXMgZW50aXJlbHkgd3JvbmcgdG8g
ZHVwbGljYXRlIHRoZSBoZWxwZXIKPiBmaXZlIHRpbWVzIG9yIHdoYXRldmVyLiBUaGVyZSBzaG91
bGQganVzdCBiZSBhIGdlbmVyaWMgaGVscGVyIC0gdGhlCj4gd2F5IHRoZXJlIHVzZWQgdG8gYmUu
Cj4gCj4gSW4gZmFjdCwgSSB3b3VsZCBnZW5lcmFsbHkgc3Ryb25nbHkgcmVjb21tZW5kIHRoYXQg
aWYgdGhlcmUgdXNlZCB0byBiZQo+IGEgZ2VuZXJpYyBoZWxwZXIgdGhhdCBkaWZmZXJlbnQgY2hp
cCBkcml2ZXJzIHVzZWQgKGllIHRoZSBvbGQKPiByYXduYW5kX3N3X2hhbW1pbmdfY29ycmVjdCgp
KSwgdGhlbiBzdWNoIGEgaGVscGVyIHNob3VsZCBiZSBsZWZ0IGFsb25lCj4gYW5kIG5vdCBjaGFu
Z2UgdGhlIHNlbWFudGljcyBvZiBpdC4KCkkgYW0gbm90IGhhcHB5IG5laXRoZXIgd2l0aCB0aGUg
Zml4ICh3aGljaCBJIHdyb3RlIG15c2VsZikgYXMgbXkgZmlyc3QKZ29hbCB3YXMgdG8gdW5pZm9y
bWl6ZSB0aGUgd2F5IHRoZSBIYW1taW5nIGhlbHBlcnMgYXJlIGJlaW5nIGNhbGxlZCAoYXMKcGFy
dCBvZiBhIG11Y2ggYmlnZ2VyIHdvcmspLiBJIGFzc3VtZWQgdGhhdCBhbGwgZHJpdmVycyBlaXRo
ZXIgdXNlZCB0aGUKSGFtbWluZyBzb2Z0d2FyZSBlbmdpbmUgb3Igc2ltcGx5IGRpZG4ndCwgd2l0
aG91dCB0aGlua2luZyBhYm91dCB0aGUKImludGVybWVkaWF0ZSIgc2l0dWF0aW9ucyB3aGVyZSBh
IHBhcnRpY3VsYXIgZHJpdmVyIHdvdWxkIGp1c3Qgd2FudCB0bwpjYWxsIGEgcGFydGljdWxhciBI
YW1taW5nIGhlbHBlciB0byB3b3JrYXJvdW5kIGl0cyAibWlzc2luZyIgaGFyZHdhcmUKY2FwYWJp
bGl0aWVzLgoKVW5mb3J0dW5hdGVseSB3aGVuIEkgc3BvdHRlZCB0aGF0IG1hbnkgZHJpdmVycyB3
ZXJlIGJyb2tlbiBieSBteSByZXdvcmsKSSBkZWNpZGVkIHRvIHByb3ZpZGUgcGVyLWRyaXZlciBm
aXhlcywgd2hpbGUsIGFzIHlvdSBzdWdnZXN0LCBJIHNob3VsZApwcm9iYWJseSBoYXZlIGRlY2xh
cmVkIGEgZ2VuZXJpYyAnaGFtbWluZyBjb3JyZWN0JyBjb3JlIGhlbHBlciBhbmQgdXNlCnRoYXQg
ZGlyZWN0bHkgaW5zdGVhZCBvZiBkdXBsaWNhdGluZyB0aGUgbG9naWMgaW4gZWFjaCBicm9rZW4g
ZHJpdmVyLgoKPiBUaGUgbmV3ICJwcm9wZXIgaW5kZXBlbmRlbnQgRUNDIGVuZ2luZSIgdGhhdCBo
YWQgbmV3IHNlbWFudGljcyBzaG91bGQKPiBoYXZlIGJlZW4gdGhlIG9uZSB0aGF0IGdvdCBhIG5l
dyBuYW1lLCByYXRoZXIgdGhhbiBicmVha2luZyBhbiBvbGQgYW5kCj4gZXhpc3RpbmcgaGVscGVy
IGZ1bmN0aW9uIGFuZCB0aGVuIG1ha2luZyB0aGUgY2hpcCBkcml2ZXJzIHBvaW50bGVzc2x5Cj4g
d3JpdGUgdGhlaXIgb3duIG5ldyBoZWxwZXIgZnVuY3Rpb25zLgo+IAo+IEkndmUgcHVsbGVkIHRo
aXMsIGJ1dCB1bmRlciBwcm90ZXN0LiBUaGUgcGF0Y2ggaG9uZXN0bHkganVzdCBsb29rcwo+IGxp
a2UgbWluZGxlc3MgZHVwbGljYXRpb24uCgpUaGFua3MuCgpNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
