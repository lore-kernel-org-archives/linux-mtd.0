Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9884CE95A8E
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Oct 2023 12:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fc9emZfkB96z9kywF4e4d1JnFnNuQjTk/4prwiBTn80=; b=LPRABOAYu1MVbF
	+GAs+AHtT9pX1Ub/CioSmArtsufG+TylE9Jz1l/5is4IsyUug+pVJy4V1DGaV2XeArlb5LFGVZt33
	4iumiS9wFdgR1qk/oRRMV0Ih0cAFKBa8VF8abOMr2YXXLoHDaQtUvxU26JOJ7uYkOmde/+ckgDWn0
	1sp1rN8JTpCQbYh2ah7UtQvgzPeRXZMrOKy3H/oe/hJLf3UPMu0jG4Kbflu7Bx+6JXLBWmaUVN2+W
	L+icV5sCBd2ZyQrIoX3Lt1iEmOrEj/nrRuk/TzM1uxywtFcpOUAutoH/ijF1cgdytOFBp7nnbMK+J
	wcKKFYK5vKP5q6ClTryg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qppeQ-00AibT-0h;
	Mon, 09 Oct 2023 12:46:22 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qppeM-00Aiai-2v
	for linux-mtd@lists.infradead.org;
	Mon, 09 Oct 2023 12:46:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 464A51C0003;
	Mon,  9 Oct 2023 12:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696855574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Q066ZPCeTQl4OjuzYK2I3npDxEu3BEi0dRV7tfy/7E=;
	b=mJJhnmBmUJ+qr4E/zJLlgC+ow2VGssAKIjSwLC57tAVfpQaLJ/2dTw2XrsMrFlhu9DrK98
	6/eBmQR/i+Aya0dfv5DeK4ZO4CmTQSCr3dsndhmPNuWirP3Ru4aiyU1xwCICZ6ofeBNBzo
	yorzlFgxgardXGff7OzlBCxdXKW/DSi41ue3NoNYSdpK6oiKe7YQ+aUbSzggYX1mq8fI3c
	KuUIlKnrqWqwjEMywJQywZ+DJNoreUK7M3AKOmjfMal2XZWwMkl5qa5CID8Zj7QmY1tqmM
	Plj6qgq7J7LJ6thGgrctBxMDqcV7vmb1j+BoFtvE53UtTHIf1MmiJ+QyPZ0XNw==
Date: Mon, 9 Oct 2023 14:46:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-kbuild@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mtd@lists.infradead.org, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 01/20] mtd: rawnand: txx9ndfmc: Mark driver struct with
 __refdata to prevent section mismatch warning
Message-ID: <20231009144610.4ff82afa@xps-13>
In-Reply-To: <20231009103037.j44gkzqv7cpn4zpu@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
	<20231008200143.196369-2-u.kleine-koenig@pengutronix.de>
	<CAK7LNASB2HhO6iWNnG-tAzs9wu9mV2PLRf-brnNGkSJj+W23Vw@mail.gmail.com>
	<e38b8a8e-5bd6-41e2-87a1-3b2d23b68bc0@app.fastmail.com>
	<20231009103037.j44gkzqv7cpn4zpu@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_054619_263489_AD9119B9 
X-CRM114-Status: GOOD (  33.54  )
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

SGVsbG8sCgp1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGUgd3JvdGUgb24gTW9uLCA5IE9j
dCAyMDIzIDEyOjMwOjM3ICswMjAwOgoKPiBIZWxsbywKPiAKPiBbQ2hhbmdlZCBlbWFpbCBhZGRy
ZXNzIGZvciBEYXZpZCBXb29kaG91c2UgZnJvbSBpbnRlbCB0byBpbmZyYWRlYWRdCj4gCj4gT24g
TW9uLCBPY3QgMDksIDIwMjMgYXQgMTA6NDM6NDZBTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3cm90
ZToKPiA+IE9uIE1vbiwgT2N0IDksIDIwMjMsIGF0IDA5OjIyLCBNYXNhaGlybyBZYW1hZGEgd3Jv
dGU6ICAKPiA+ID4gT24gTW9uLCBPY3QgOSwgMjAyMyBhdCA1OjAy4oCvQU0gVXdlIEtsZWluZS1L
w7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6ICAKPiA+ID4+Cj4g
PiA+PiBBcyBkZXNjcmliZWQgaW4gdGhlIGFkZGVkIGNvZGUgY29tbWVudCwgYSByZWZlcmVuY2Ug
dG8gLmV4aXQudGV4dCBpcyBvawo+ID4gPj4gZm9yIGRyaXZlcnMgcmVnaXN0ZXJlZCB2aWEgbW9k
dWxlX3BsYXRmb3JtX2RyaXZlcl9wcm9iZSgpLiBNYWtlIHRoaXMKPiA+ID4+IGV4cGxpY2l0IHRv
IHByZXZlbnQgYSBzZWN0aW9uIG1pc21hdGNoIHdhcm5pbmcgd2l0aCAgCj4gPiAgIAo+ID4gPgo+
ID4gPiBXZSBoYXZlIHRob3VzYW5kcyBvZiBtb2R1bGVfcGxhdGZvcm1fZHJpdmVycy4KPiA+ID4g
SSB3b3VsZCBiZSBzY2FyZWQgaWYgdGhleSBzdGFydGVkIHRvIGFkZCBfX3JlZmRhdGEuCj4gPiA+
Cj4gPiA+IEkgYW0gbm90IHN1cmUgaWYgdGhpcyBpcyB0aGUgcmlnaHQgZGlyZWN0aW9uLiAgCj4g
PiAKPiA+IEZvciBhIG5vcm1hbCBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKCksIHRoaXMgd291bGQg
aW5kZWVkIGJlCj4gPiB3cm9uZywgYnV0IGFzIFV3ZSBzYWlkIGFib3ZlIHRoZXJlIGlzIGEgc3Bl
Y2lhbCBjYXNlIGZvcgo+ID4gbW9kdWxlX3BsYXRmb3JtX2RyaXZlcl9wcm9iZSgpLCB3aGljaCBp
bXBsaWNpdGx5IHNldHMgdGhlCj4gPiBkcnYtPmRyaXZlci5zdXBwcmVzc19iaW5kX2F0dHJzPXRy
dWUgZmxhZy4KPiA+ICAgCj4gPiA+IEluIG15IHVuZGVyc3RhbmRpbmcgb2YgdGhlIGN1cnJlbnQg
RFQgb3ZlcmxheSwKPiA+ID4gdGhlcmUgaXMgbm8gd2F5IHRvIGNyZWF0ZS9yZW1vdmUgYSBwbGF0
Zm9ybSBkZXZpY2UgZHluYW1pY2FsbHkuCj4gPiA+IEkgZG8gbm90IGtub3cgaWYgdGhhdCB3aWxs
IGhhcHBlbiBpbiB0aGUgZnV0dXJlLiAgCj4gPiAKPiA+IEZvciBkcml2ZXJzIHdpdGhvdXQgc3Vw
cHJlc3NfYmluZF9hdHRycywgeW91IGNhbiBtYW51YWxseQo+ID4gdW5iaW5kIHRoZSBkZXZpY2Ug
ZnJvbSBhIGRyaXZlciwgd2hpY2ggaW4gY2FzZSBvZiBhIGxvYWRhYmxlCj4gPiBtb2R1bGUgZW5k
cyB1cCBjYWxsaW5nIHRoZSAucmVtb3ZlIGNhbGxiYWNrICh0aGlzIGlzIGZpbmUpLAo+ID4gYnV0
IGluIGEgYnVpbHQtaW4gZHJpdmVyIHRoaXMgd291bGQgdXNlIGEgTlVMTCBwb2ludGVyIGZvcgo+
ID4gLnJlbW92ZSBhbmQgY2F1c2UgdW5leHBlY3RlZCBiZWhhdmlvci4gIAo+IAo+IG9ubHkgYSBz
bGlnaHQgY29ycmVjdGlvbjogQXMgbm90IGhhdmluZyBhIHJlbW92ZSBjYWxsYmFjayBjYW4gYmUg
ZmluZQo+IGFuZCBwbGF0Zm9ybV9yZW1vdmUoKSBvbmx5IGNhbGxzIC5yZW1vdmUgKG9yIC5yZW1v
dmVfbmV3KSB3aGVuIG5vbi1OVUxMCj4gd2UncmUgbm90IGhpdHRpbmcgYSBOVUxMIHBvaW50ZXIg
ZGVyZWZlcmVuY2UgaW4gdGhlIHByZXNlbmNlIG9mCj4gCj4gCS5yZW1vdmUgPSBfX2V4aXRfcChz
b21lZnVuYyksCj4gCj4gQnV0IGEgcHJvYmxlbSBjYW4gYXJpc2UgbGF0ZXIgaWYgc29tZSByZXNv
dXJjZSBpc24ndCBwcm9wZXJseSBmcmVlZCBhbmQKPiBzbyBpdCBtaWdodCBiZSB1c2VkIGF0IGEg
bGF0ZXIgcG9pbnQgaW4gdGltZSB3aGljaCB0aGVuIG1vc3QgbGlrZWx5Cj4gb29wc2VzLgo+IAo+
IEkgZGlkbid0IGRvdWJsZSBjaGVjayBBcm5kJ3MgbGlzdCwgYnV0IG90aGVyd2lzZSBJIGFncmVl
IHRvIGhpcwo+IGFuYWx5c2lzLgoKQ2FuIHdlIGluc3RlYWQgcXVlc3Rpb24gdGhlIHVzZSBvZiBt
b2R1bGVfcGxhdGZvcm1fZHJpdmVyX3Byb2JlKCk/CkkgZG9uJ3QgaGF2ZSB0aGUgaGlzdG9yeSBp
biBtaW5kLCBidXQgd2h5IG5vdCBqdXN0IHN3aXRjaCB0byByZWd1bGFyCm1vZHVsZV9wbGF0Zm9y
bV9kcml2ZXIoKSByZWdpc3RyYXRpb24gaW5zdGVhZD8gSXQgc2VlbXMgbGlrZSB0aGUKb3JpZ2lu
YWwgYXV0aG9ycyBqdXN0IGRpZCBub3QgY2FyZSBhYm91dCB0aGUgcmVtb3ZlIHBhdGggYW5kIHdl
cmUKaGFwcHkgdG8gc2tpcCBpdHMgaW1wbGVtZW50YXRpb24uCgpPbiBtdGQgZGV2aWNlcyBvbmUg
Y2FuIGFyZ3VlIHRoYXQgdGhlIGZsYXNoIHVuZGVybHlpbmcgc3RvcmVzIHRoZQpyb290ZnMgYW5k
IHRodXMgY2Fubm90IGJlIHJlbW92ZWQsIGJ1dCBJIGJlbGlldmUgdG9kYXkgdGhpcyBpcyBhCnF1
ZXN0aW9uYWJsZSAoc29mdHdhcmUpIGRlc2lnbi4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
