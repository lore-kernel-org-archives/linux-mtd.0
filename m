Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74994C4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Nov 2022 13:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xF4Ls9oOnA6ROKHkoJgdx0D1JT/8XC9o8NqXy42ZuW4=; b=CcDlG7IZ7SNP/B
	9z1+gzzDnxx4LfkwDjGn77LXrX5nzW7fqD/oTwhblCG2OneEHGn4Pd6vW5hjkd9UqfH9YVjxz1AMh
	qzsFYdLax8cLPeKc2y+pjSCW6U0dtENBFwJi61E+OqQ8LINN+qyjsc2X5LLxMlLibHpgOwVrHFzsT
	5Mnor5/Cj+66GBwW5yMR/9pxGVCDFOUq7vYw261RwFdfBUEiyEwfdVh6BMsPTC9ioiLP3j1VcXgdn
	KpF7I7tkYOgfWK7o3AXmWMLykhOEqw3VztKRCgLa8G/kMmKJa5OmC+mSibNejwQByn0WyhH5fCWYl
	m9EJVLSwdBh1GeUVViEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqDa7-00BCI8-EK; Wed, 02 Nov 2022 13:14:59 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqDZK-00BBjQ-6z
	for linux-mtd@lists.infradead.org; Wed, 02 Nov 2022 13:14:12 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0C7ED60006;
	Wed,  2 Nov 2022 13:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667394843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SWrjuLHxDOvHyRY+U2MUirlxhgSugyGnR6jFnCK6J/g=;
	b=EfOmzAaN1DB3s2DQVMtv9NHt0sLwwUN6mz10ZWzs6Rb1vVz/2VRgUKHyR/pjktiK3nETXw
	hzbNkbqx1QWnYRsC48nk4Y7EEFnm9ZztrVgf1egOSibQEmf0t7OpqT+nhd3VuE5wz/FXFI
	UgV9/LFUsIqZ4Qbz9XHgWMa5xMSRb+SKUFboGubWGbmBpaqw/OWLL/HbtbNUqAbq13Rg+I
	8MjghpnA5Jhu2MXl8/bIO4HNALnS+GLw2/Ha4N1pqUEwPhqodwitU88mpNvaYLwlSZ72Kk
	7qk6yJfbX7lUpxwxQgghAO9A2PKb9IjzaaaHPwgNTLM7R2G1m4Oftny4+N8U2Q==
Date: Wed, 2 Nov 2022 14:14:00 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Roger Quadros <rogerq@kernel.org>
Cc: Colin Foster <colin.foster@in-advantage.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Pratyush Yadav
 <p.yadav@ti.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@pengutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>
Subject: Re: Barebox / Kernel Omap ECC inconsistency?
Message-ID: <20221102141400.31125365@xps-13>
In-Reply-To: <ec160658-e251-bfdc-05ac-631bd4c716dc@kernel.org>
References: <Y2FvB5D0K4MBii8N@COLIN-DESKTOP1.localdomain>
	<ec160658-e251-bfdc-05ac-631bd4c716dc@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_061410_747309_3AC0E86A 
X-CRM114-Status: GOOD (  26.61  )
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

SGkgQ29saW4sCgpyb2dlcnFAa2VybmVsLm9yZyB3cm90ZSBvbiBXZWQsIDIgTm92IDIwMjIgMDk6
MTI6MjcgKzAyMDA6Cgo+IEhpIENvbGluLAo+IAo+IE9uIDAxLzExLzIwMjIgMjE6MDksIENvbGlu
IEZvc3RlciB3cm90ZToKPiA+IEhlbGxvLAo+ID4gCj4gPiBJJ20gdHJ5aW5nIHRvIHJldml2ZSBh
IHByb2R1Y3QgdGhhdCBydW5zIG9uIGEgUGh5dGVjIE9NQVAgNDQ2MCBTT00uIEkKPiA+IHN1Ym1p
dHRlZCBhIC5kdHMgUkZDIGEgbW9udGggb3Igc28gYWdvLCBhbmQgcGxhbiB0byBwZXJmb3JtIHRo
ZQo+ID4gc3VnZ2VzdGlvbnMgYW5kIHJlc3VibWl0LCBidXQgSSdtIHVwIGFnYWluc3Qgb25lIG1h
aW4gaHVyZGxlIHRoYXQgc2VlbXMKPiA+IHRvIGJlIHJlbGF0ZWQgdG8gZmxhc2ggT09CL0VDQy4g
KGdldF9tYWludGFpbmVycyBvbgo+ID4gZHJpdmVycy9tdGQvbmFuZC9yYXcvb21hcDIuYyBpcyBo
b3cgSSBnb3QgdGhpcyBlbWFpbCBsaXN0KQo+ID4gCj4gPiBCYXJlYm94IGhhcyAibmF0aXZlIiBz
dXBwb3J0IGZvciB0aGUgUGh5dGVjIFNPTToKPiA+IGh0dHBzOi8vZ2l0LnBlbmd1dHJvbml4LmRl
L2NnaXQvYmFyZWJveC90cmVlL2FyY2gvYXJtL2JvYXJkcy9waHl0ZWMtcGh5Y29yZS1vbWFwNDQ2
MAo+ID4gCj4gPiBJdCBzZWVtcyBsaWtlIEJhcmVib3ggaXMgd3JpdGluZyBhbmQgZXhwZWN0aW5n
IEVDQyBiaXRzIHRvIHN0YXJ0IGF0IGFuCj4gPiBvZmZzZXQgb2YgMTIgYnl0ZXMsIHdoaWxlIHRo
ZSBrZXJuZWwgKGFuZCBCYXJlYm94IGNvbW1lbnRzIHN1Z2dlc3QpIHRoZQo+ID4gRUNDIGJ5dGVz
IHNob3VsZCBzdGFydCBhdCAyLiBJJ20gc2VlaW5nIHRoaXMgd2l0aAo+ID4gYG5hbmRkdW1wIC1u
IC1vIC1sIDB4NDEwMDAgLWYgbXRkeG5hbmRkdW1wIC9kZXYvbXRkeGAKPiA+IAo+ID4gQmFyZWJv
eCBjcmVhdGVkIHBhcnRpdGlvbiB3aXRoIFVCSSAobXRkMykKPiA+IC4uLgo+ID4gMDAwMDA4MDAg
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmICBmZiBmZiBmZiBmZiA1NiA0OSBmZCAxNwo+ID4gMDAw
MDA4MTAgIGIyIDI1IDYwIDFhIDQyIDFkIGViIDU2ICA1ZCBmZiBmZiBmZiBmZiBmZiBmZiBmZgo+
ID4gLi4uCj4gPiAKPiA+IEtlcm5lbCBjcmVhdGVkIHBhcnRpdGlvbiB3aXRoIFVCSSAobXRkNCkK
PiA+IC4uLgo+ID4gMDAwMDA4MDAgIGZmIGZmIDA3IDczIDA0IGFjIDU3IDZiICA5YiAxZiA5MiA0
OSBhYiBlMCBiOSBmZgo+ID4gMDAwMDA4MTAgIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmICBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZgo+ID4gLi4uCj4gPiAKPiA+IAo+ID4gTXkgcXVlc3Rpb246IAo+
ID4gCj4gPiBBbSBJIHJpZ2h0IHRvIGFzc3VtZSB0aGlzIGlzIGFuIGlzc3VlIGluIEJhcmVib3g/
IFBlcmhhcHMgdGhpcyBpcyBqdXN0IGEgIAo+IAo+IEknbSBndWVzc2luZyBzby4gQm90aCB1LWJv
b3QgYW5kIExpbnV4IGZvciBPTUFQIHB1dCB0aGUgRUNDIGJ5dGVzIHJpZ2h0Cj4gYWZ0ZXIgdGhl
IEJhZCBibG9jayBtYXJrZXIgd2hpY2ggaXMgMiBieXRlcy4KClllcC4gSSBjaGVja2VkLCB0aGlz
IGhhcyBiZWVuIGxpa2UgdGhhdCBzaW5jZSBhdCBsZWFzdCAyMDE0LCBJIGRvbid0CnRoaW5rIHdl
IGNoYW5nZWQgdGhlIGxheW91dCBpbiBVLUJvb3QvTGludXggInJlY2VudGx5Ii4uLiAoSSBoYXZl
bid0CmNoZWNrZWQgZWFybGllciwgYnkgbGF6aW5lc3MpLgoKPiBodHRwczovL2VsaXhpci5ib290
bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvbXRkL25hbmQvcmF3L29tYXAyLmMj
TDE3MjkKPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L29tYXAyLmMjTDEzNAo+IAo+ID4gYnVnIHRoYXQgaGFzIGJlZW4g
ZmFpcmx5IGRvcm1hbnQgZm9yIDE1IHllYXJzLiBJZiB0aGF0IGlzIHRoZSBjYXNlLCBJCj4gPiBh
c3N1bWUgdGhlcmUncyBwcm9iYWJseSBubyBob3BlIGluIGdldHRpbmcgdGhpcyBtYWlubGluZWQs
IGFuZCAibmF0aXZlIgo+ID4gYmFyZWJveCBzdXBwb3J0IGlzIGp1c3QgYSBydXNlLgo+ID4gCj4g
PiBJZiB0aGF0IGlzbid0IHRoZSBjYXNlLCBpcyB0aGVyZSBhIGhpZGRlbiAic2hpZnQgT09CIGJ5
IDEwIiBjb25maWcKPiA+IG9wdGlvbiB0aGF0IEknbSBtaXNzaW5nPyBPciBhbSBJIGludGVycHJl
dGluZyB0aGlzIGRhdGEgaW5jb3JyZWN0bHk/Cj4gPiAKPiA+IAo+ID4gQW55IHN1Z2dlc3Rpb25z
IHdvdWxkIGJlIGdyZWF0bHkgYXBwcmVjaWF0ZWQuICAKPiAKPiBZb3Ugc2hvdWxkIGZpeCB0aGUg
T01BUCBOQU5EIGRyaXZlci9jb25maWcgaW4gQmFyZWJveCB0byBtYXRjaCB0aGF0Cj4gd2l0aCBM
aW51eCBPTUFQIE5BTkQgZHJpdmVyIGlmIHlvdSB3YW50IHRoZW0gdG8gcnVuIG9uIHRoZSBzYW1l
IHN5c3RlbS4KCkFncmVlZC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
