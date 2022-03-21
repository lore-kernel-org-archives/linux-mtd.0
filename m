Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DD2C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Mar 2022 13:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fNr06SF1KWgRnJ6ytpI8KH38c903K5oexBqPclADA4s=; b=vBUZa9LqgSxd8G
	iwRhciTK+fLEwEFrQs+lFTC9G2xJ98ojL7cQTPlBxGdJzIIkzZ+PwFt5SIS1mhLYbN9Mp7bhoLOPl
	qIxOMg1sSsLFB07Yus0HtfgiS4mJIc+VejY14jRrMSNhhSDZ/xldyXGRdDoX4NiQObWL7N/2bRCwy
	gfhWPjB+vARME7G9nU9Utxd7p9GCanlOwtutVC6typS+5FcUZH8mdDOzWSMvjH/FqBY4eTAUMTZIg
	WGrAkgudGflNafz5qDxLTuqkV+vCQ6HUKtwhd3fZITj7Z6Y0DYQIv9ILrGB5J31EO28kTv7TZzLRp
	LiluZUqlUiS6jofCkkgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWII2-007tfg-A4; Mon, 21 Mar 2022 13:41:42 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWIHz-007tdu-1Y
 for linux-mtd@lists.infradead.org; Mon, 21 Mar 2022 13:41:41 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C30AEC000A;
 Mon, 21 Mar 2022 13:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647870096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GIxuyqU3ctJGiCBP+cbpAyeqP8N2xcPjN2SiYQ6vLN8=;
 b=BBjfOoMCjmQetnwVU70OFIwqXWm7DsCkndUr4172sno2nEVA19xhBE/58rIH4WDJkhrfgV
 d0qsyCmZNJGsNIrMjRWQPvu5mnPQAaoo6yAHO9rO5iJZ5fSMbgQh95x3TYOtxypPGTgoM3
 ZpVqb1NXeo/1NyReIw6ARZyCE+KiowJFpW0zZSJTgDk7OZa8EQaIl6YcY3ehi3qf9piFpP
 HTziz3pO58y7HTIouxr7jN40SdfYK8bhDSQZ5emP55qEZSDTbDuEf5oojqMzE0v5hLZ5JP
 dO0sDy2k5KTaMVM3jRikZw8Lq+WzWdFbNqRQUvf6UOjeYqUPpxA1oN4IkVXEDw==
Date: Mon, 21 Mar 2022 14:41:34 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Tokunori Ikegami <ikegami.t@gmail.com>, linux-mtd@lists.infradead.org,
 Ahmad Fatoum <a.fatoum@pengutronix.de>, stable@vger.kernel.org
Subject: Re: [PATCH v4 2/3] mtd: cfi_cmdset_0002: Use chip_ready() for write
 on S29GL064N
Message-ID: <20220321144134.3076a2ba@xps13>
In-Reply-To: <f950bfe4-9c8d-199d-120f-cc8c1ecca8e3@leemhuis.info>
References: <20220316155455.162362-1-ikegami.t@gmail.com>
 <20220316155455.162362-3-ikegami.t@gmail.com>
 <db755852-effe-c4ca-726c-200d28b0b8a5@leemhuis.info>
 <20220321133529.2d3addaf@xps13>
 <f950bfe4-9c8d-199d-120f-cc8c1ecca8e3@leemhuis.info>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_064139_468413_3A96B804 
X-CRM114-Status: GOOD (  26.35  )
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

VGhvcnN0ZW4sCgpyZWdyZXNzaW9uc0BsZWVtaHVpcy5pbmZvIHdyb3RlIG9uIE1vbiwgMjEgTWFy
IDIwMjIgMTM6NTE6MTAgKzAxMDA6Cgo+IE9uIDIxLjAzLjIyIDEzOjM1LCBNaXF1ZWwgUmF5bmFs
IHdyb3RlOgo+ID4KPiA+IHJlZ3Jlc3Npb25zQGxlZW1odWlzLmluZm8gd3JvdGUgb24gTW9uLCAy
MSBNYXIgMjAyMiAxMjo0ODoxMSArMDEwMDoKPiA+IAo+ID4+IE9uIDE2LjAzLjIyIDE2OjU0LCBU
b2t1bm9yaSBJa2VnYW1pIHdyb3RlOgo+ID4+PiBBcyBwb2ludGVkIG91dCBieSB0aGlzIGJ1ZyBy
ZXBvcnQgWzFdLCBidWZmZXJlZCB3cml0ZXMgYXJlIG5vdyBicm9rZW4gb24KPiA+Pj4gUzI5R0ww
NjROLiBUaGlzIGlzc3VlIGNvbWVzIGZyb20gYSByZXdvcmsgd2hpY2ggc3dpdGNoZWQgZnJvbSB1
c2luZyBjaGlwX2dvb2QoKQo+ID4+PiB0byBjaGlwX3JlYWR5KCksIGJlY2F1c2UgRFEgdHJ1ZSBk
YXRhIDB4RkYgaXMgcmVhZCBvbiBTMjlHTDA2NE4gYW5kIGFuIGVycm9yCj4gPj4+IHJldHVybmVk
IGJ5IGNoaXBfZ29vZCgpLiBPbmUgd2F5IHRvIHNvbHZlIHRoZSBpc3N1ZSBpcyB0byByZXZlcnQg
dGhlIGNoYW5nZQo+ID4+PiBwYXJ0aWFsbHkgdG8gdXNlIGNoaXBfcmVhZHkgZm9yIFMyOUdMMDY0
Ti4KPiA+Pj4KPiA+Pj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvYjY4N2MyNTktNjQx
My0yNmM5LWQ0YzktYjNhZmE2OWVhMTI0QHBlbmd1dHJvbml4LmRlLyAgCj4gPj4KPiA+PiBXaHkg
ZGlkIHlvdSBzd2l0Y2ggZnJvbSB0aGUgZG9jdW1lbnRlZCBmb3JtYXQgZm9yIGxpbmtzIHlvdSBh
ZGRlZCBvbiBteQo+ID4+IHJlcXVlc3QgKHNlZQo+ID4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3N0YWJsZS9mMWI0NGU4Ny1lNDU3LTc3ODMtZDQ2ZS0wZDU3N2NlYTNiNzJAbGVlbWh1aXMuaW5m
by8KPiA+Pgo+ID4+ICkgdG8gdjIgdG8gc29tZXRoaW5nIGVsc2UgdGhhdCBpcyBub3QgcmVjb2du
aXplZCBieSB0b29scyBhbmQgc2NyaXB0cwo+ID4+IHRoYXQgcmVseSBvbiBwcm9wZXIgbGluayB0
YWdzPyBZb3UgYXJlIG1ha2luZyBteSBhbmQgbWF5YmUgb3RoZXIgcGVvcGxlcwo+ID4+IGxpZmUg
dW5uZWNlc3NhcnkgaGFyZC4gOi0oKAo+ID4+Cj4gPj4gRldJVywgdGhlIHByb3BlciBzdHlsZSBz
aG91bGQgc3VwcG9ydCBmb290bm90ZSBzdHlsZSBsaWtlIHRoaXM6Cj4gPj4KPiA+PiBMaW5rOgo+
ID4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvYjY4N2MyNTktNjQxMy0yNmM5LWQ0YzktYjNh
ZmE2OWVhMTI0QHBlbmd1dHJvbml4LmRlLwo+ID4+ICBbMV0KPiA+Pgo+ID4+IENpYW8sIFRob3Jz
dGVuCj4gPj4KPiA+PiAjcmVnemJvdCBeYmFja21vbml0b3I6Cj4gPj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci9iNjg3YzI1OS02NDEzLTI2YzktZDRjOS1iM2FmYTY5ZWExMjRAcGVuZ3V0cm9u
aXguZGUvCj4gPj4KPiA+IAo+ID4gQmVjYXVzZSB0b2RheSdzIHJlcXVpcmVtZW50IGZyb20gbWFp
bnRhaW5lcnMgaXMgdG8gcHJvdmlkZSBhIExpbmsKPiA+IHRhZyB0aGF0IHBvaW50cyB0byB0aGUg
bWFpbCBkaXNjdXNzaW9uIG9mIHRoZSBwYXRjaCBiZWluZyBhcHBsaWVkLgo+IAo+IFRoYXQgY2Fu
IGJlIGFuIGFkZGl0aW9uYWwgTGluayB0YWcsIHRoYXQgaXMgZG9uZSBhbGwgdGhlIHRpbWUuCj4g
Cj4gPiBJCj4gPiB0aGVuIGFza2VkIHRvIHVzZSB0aGUgYWJvdmUgZm9ybSBpbnN0ZWFkIHRvIHBv
aW50IHRvIHRoZSBidWcgcmVwb3J0Cj4gPiBiZWNhdXNlIEkgZG9uJ3Qgc2VlIHRoZSBwb2ludCBv
ZiBoYXZpbmcgYSAiTGluayIgdGFnIGZvciBpdD8KClBlcmhhcHMgSSBzaG91bGQgZW1waGFzaXpl
IHRoYXQgSSBkb24ndCByZW1lbWJlciB5b3VyIGluaXRpYWwgcmVxdWVzdApyZWdhcmRpbmcgdGhl
IHVzZSBvZiBhIExpbmsgdGFnIGFuZCBteSBvcmlnaW5hbCBpZGVhIHdhcyB0byBoZWxwIHRoaXMK
Y29udHJpYnV0b3IsIG5vdCBraWxsIHlvdXIgdG9vbHMgd2hpY2ggSSBhY3R1YWxseSBrbm93IHZl
cnkgbGl0dGxlCmFib3V0LgoKPiBCdXQgaXQncyBub3QgeW91ciBvd24gcHJvamVjdCwgd2UgYXJl
IGFsbCB3b3JraW5nIHdpdGggdGhvdXNhbmRzIG9mCj4gcGVvcGxlIHRvZ2V0aGVyIG9uIHRoaXMg
cHJvamVjdCBvbiB2YXJpb3VzIGRpZmZlcmVudCBmcm9udHMuIFRoYXQgbmVlZHMKPiBjb29yZGlu
YXRpb24sIGFzIHNvbWUgdGhpbmdzIG90aGVyd2lzZSBiZWNvbWUgaGFyZCBvciBpbXBvc3NpYmxl
LiBUaGF0J3MKPiB3aHkgd2UgaGF2ZSBkb2N1bWVudGF0aW9uIHRoYXQgZXhwbGFpbnMgaG93IHRv
IGRvIHNvbWUgdGhpbmdzLiBOb3QKPiBmb2xsb3dpbmcgaXQganVzdCBiZWNhdXNlIHlvdSBkb24n
dCBsaWtlIGl0IGlzIG5vdCBoZWxwZnVsIGFuZCBpbiB0aGlzCj4gY2FzZSBtYWtlcyBteSBsaWZl
IGFzIGEgdm9sdW50ZWVyIGEgbG90IGhhcmRlci4KCkxldCdzIGJlIGhvbmVzdCwgeW91IGFyZSBy
ZWZlcnJpbmcgdG8gYSBEb2N1bWVudGF0aW9uIHBhdGNoIHRoYXQgKnlvdSoKd3JvdGUgYW5kIHdh
cyBtZXJnZWQgaW50byBMaW51cycgdHJlZSBtaWQgSmFudWFyeS4gSG93IG9mdGVuIGRvIHlvdQp0
aGluayBwZW9wbGUgdXNlZCB0byB0aGUgY29udHJpYnV0aW9uIHdvcmtmbG93IG1vbml0b3IgdGhl
c2UgZmlsZXM/CgpJIGFtIHRvdGFsbHkgZmluZSBlbmZvcmNpbmcgdGhlIHVzZSBvZiBMaW5rOiB0
YWdzIGlmIHRoaXMgaXMgd2hhdCBoYXMKYmVlbiBkZWNpZGVkLCBqdXN0IGRvbid0IGV4cGVjdCBl
dmVyeWJvZHkgdG8gc3dpdGNoIHRvIGEgc3R5bGUgcmF0aGVyCnRoYW4gYW5vdGhlciBvdmVyIGEg
bmlnaHQuCgo+IElmIHlvdSBkb24ndCBsaWtlIHRoZSBhcHByb2FjaCBleHBsYWluZWQgYnkgdGhl
IGRvY3VtZW50YXRpb24sIHN1Ym1pdCBhCj4gcGF0Y2ggYWRqdXN0aW5nIHRoZSBkb2N1bWVudGF0
aW9uIGFuZCB0aGVuIHdlIGNhbiB0YWxrIGFib3V0IHRoaXMuIEJ1dAo+IHVudGlsIHRoYXQgaXMg
YXBwbGllZCBwbGVhc2Ugc3RpY2sgdG8gdGhlIGZvcm1hdCBleHBsYWluZWQgYnkgdGhlCj4gZG9j
dW1lbnRhdGlvbi4KClRoaXMgaXMgdXNlbGVzc2x5IGNvbmRlc2NlbmRpbmcuCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
