Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96215C3DA6E
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jan 2024 15:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ljsqCzvvOIvn/DrWtuZKrtDJHa6ta+ezhOlICyzkZyY=; b=EvAVUrZ78aNRPs
	89qpXJs6vsFXuP8mmQ0TSI3i1cyCmIw31oZ3BCc+Ie66LQwEUKbNMVUzxA2B76jlJF7WJF/6xWYWY
	oaxkQdVGo6rzqP5lgvQ3AwNSKTJXZJwOavxG7IUSDukDy8vJET1bojur/66Ax1S8ujAH+2K0/7zB1
	A10SOtx+Feqemj/H0sjphv3vhFAuq9zrokLxeFlSofUkPLDhpzrhrcG8uTIQ7OhmlzRJ4Si8CBCNJ
	pvnMcLo9vrjlgGw1bQ/GZZI8ZBFGg93lzzGLtsPF0n8aAFrsP3hW6bPNezIxpqi5s34Wk8IpMf+Yd
	LBpQ3um4GLr1mQAB/zvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL3X8-00BIv4-23;
	Wed, 03 Jan 2024 15:51:54 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL3X5-00BIuY-0h
	for linux-mtd@lists.infradead.org;
	Wed, 03 Jan 2024 15:51:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE02DC000D;
	Wed,  3 Jan 2024 15:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704297107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sxUhl/Dr5ImBBlpefiPCsA9yLfz3cJIM8jbujPYKIOM=;
	b=lYRgsz91bICUvfq/6viHs6VwiUmEATUfaPKKvymZCgUAgzJCv95NkrsBzzaKMqRm/koi75
	UW+IbjqX4JTAHwMx6WsPAJSriArJkH85s50y3vnwcupMvsz4yawWNXpdaO0uQLMIELzq6Q
	SHRKlvjW9E/62RNVZd60bsNJNLS2PLccNaBP6WtSsluYmiIHF3VFNl5jGElAGPZl3eJFbp
	nYQSHnfVVPEq9+mJVNemAgqCEArr8AzuycrhK5/b5LByGZw2vR9eozhLW1hxoQoOUc+ZqC
	+s2mCNKL4o3m5WTjmw79rKGP7ap/R6C/Fsfos1WIxt4gotog/pFU1wB79C3mwQ==
Date: Wed, 3 Jan 2024 16:51:43 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: kernel test robot <lkp@intel.com>, Julia Lawall <julia.lawall@inria.fr>,
 Christian Marangi <ansuelsmth@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Subject: Re: [PATCH] mtd: Fix possible refcounting issue when going through
 partition nodes
Message-ID: <20240103165143.448cb071@xps-13>
In-Reply-To: <20240103153549.106681-1-miquel.raynal@bootlin.com>
References: <20240103153549.106681-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_075151_416001_867E3289 
X-CRM114-Status: GOOD (  20.43  )
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

SGVsbG8sCgptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tIHdyb3RlIG9uIFdlZCwgIDMgSmFuIDIw
MjQgMTY6MzU6NDkgKzAxMDA6Cgo+IFVuZGVyICJub3JtYWwiIGNvbmRpdGlvbnMsIHRoZSBsb29w
IGdvZXMgb3ZlciBhbGwgdGhlIHBhcnRpdGlvbnMsIGFuZAo+ICdicmVha3MnIHdoZW4gdGhlIHJl
bGV2YW50IHBhcnRpdGlvbiBpcyBmb3VuZC4gQWZ0ZXIgdGhlIGJyZWFrIGFuZAo+IG91dHNpZGUg
dGhlIGxvb3AsIG9mX25vZGVfcHV0KCkgaXMgY2FsbGVkIHRvIHJlbGVhc2UgdGhlICdwYXJ0aXRp
b25zJwo+IG9mX25vZGUuIEhvd2V2ZXIgaWYgbm8gcGFydGl0aW9uIG1hdGNoZXMgKEknbSBub3Qg
c3VyZSB0aGlzIGlzIGEKPiByZWFsLXdvcmxkIHVzZSBjYXNlKSwgdGhlIGxvb3AgdGVybWluYXRl
cyBub3JtYWxseSBhbmQgb2Zfbm9kZV9wdXQoKQo+IGdldHMgY2FsbGVkIG9uIHRoZSBoZWFkIG9m
IHRoZSBsaXN0LCBtZWFuaW5nIG9mX25vZGVfcHV0KCkgd2lsbCBiZQo+IGNhbGxlZCB0d2ljZSBv
biB0aGUgbG9vcCBoZWFkZXIsIHdoaWNoIGlzIG5vdCBhcHByb3ByaWF0ZS4KCk5vLCB0aGlzIGlz
IHdyb25nLiBJIGdvdCBtaXNsZWFkIGJ5IHRoZSByZXBvcnQgd2hpY2ggZG9lcyBub3Qgc3BlY2lm
eQp3aGVyZSB0aGUgbGVhayBpcy4gVGhlIHByb2JsZW0gaXMgbGlrZWx5IG92ZXIgJ210ZF9kbicg
cmF0aGVyIHRoYW4KJ3BhcnRpdGlvbnMnLiBCdXQgd2UgaW5kZWVkIG5lZWQgdG8gcHV0IHRoZSAn
bXRkX2RuJyBub2RlIGJlZm9yZSB0aGUKYnJlYWsuIEluIHByYWN0aWNlIHRoZSBjb3JlIGNhbGxz
IG9mX25vZGVfZ2V0KCkgcmlnaHQgYWZ0ZXIKbXRkX2NoZWNrX29mX25vZGUoKSByZXR1cm5zLCBz
byB0aGUgcmVmY291bnRlciBvZiB0aGUgbm9kZSB3aWxsIGJlCmluY3JlbWVudGVkIGJhY2ssIGJ1
dCBpdCBpcyBwcm9iYWJseSBtb3JlIGZ1dHVyZS1wcm9vZiB0byBkbyBpdCB0aGlzCndheS4KCj4g
UmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+IFJlcG9ydGVk
LWJ5OiBKdWxpYSBMYXdhbGwgPGp1bGlhLmxhd2FsbEBpbnJpYS5mcj4KPiBDbG9zZXM6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMzEyMjUwNTQ2LklTemdsdk0yLWxrcEBpbnRlbC5jb20v
Cj4gQ2M6IENocmlzdGlhbiBNYXJhbmdpIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4KPiBDYzogUmFm
YcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBS
YXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gLS0tCj4gVGhpcyBpcyBjb21waWxl
LXRlc3RlZCBvbmx5Lgo+IC0tLQo+ICBkcml2ZXJzL210ZC9tdGRjb3JlLmMgfCAyICstCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPiBpbmRl
eCBiYjA3NTljYTEyZjEuLjEwNDlkODIyMzg5OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9t
dGRjb3JlLmMKPiArKysgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPiBAQCAtNjIwLDExICs2MjAs
MTEgQEAgc3RhdGljIHZvaWQgbXRkX2NoZWNrX29mX25vZGUoc3RydWN0IG10ZF9pbmZvICptdGQp
Cj4gIAkJaWYgKHBsZW4gPT0gbXRkX25hbWVfbGVuICYmCj4gIAkJICAgICFzdHJuY21wKG10ZC0+
bmFtZSwgcG5hbWUgKyBvZmZzZXQsIHBsZW4pKSB7Cj4gIAkJCW10ZF9zZXRfb2Zfbm9kZShtdGQs
IG10ZF9kbik7Cj4gKwkJCW9mX25vZGVfcHV0KHBhcnRpdGlvbnMpOwo+ICAJCQlicmVhazsKPiAg
CQl9Cj4gIAl9Cj4gIAo+IC0Jb2Zfbm9kZV9wdXQocGFydGl0aW9ucyk7Cj4gIGV4aXRfcGFyZW50
Ogo+ICAJb2Zfbm9kZV9wdXQocGFyZW50X2RuKTsKPiAgfQoKClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
