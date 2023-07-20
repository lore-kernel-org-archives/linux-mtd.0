Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A53EB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 06:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bwNecaGDSt4lMfAgFmGzq2O6TW63Qkzuj5VZ6cu2NQ0=; b=SpwYqc5sV0BrvU
	6fUDG1HloQn1neVj1KZ6GxEsYZkEF7oPgrESPBKlEu01bOfomYyUPaX8C0dX74f8lGrGpDILtzNUq
	0VxKuQS9h+vQGa5sRRFU2JZV2Q65sx/YjYEX0rmBez1e3bjjxuT4Ffmyc3YyR0ivdKfAFfBjv2lm9
	HlSndFV6AF8lB1iScQwPvfslEoy6hlzFGwN8EOlCBX8u/GrpVvLz/jNvMn0ctl1UGJX8yFiDP3gil
	1X2x/Sj+ovXC8ePdhi9Y5zyb1xT6CfGLWK0+Nm6dpHH36GVi5lkbSgQfYtYM7dV8kM+ylqn4/5xAH
	AGOC/y41i7QXSZV+5cQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMMq8-009tW9-05;
	Thu, 20 Jul 2023 06:08:40 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMMq4-009tV8-39
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jul 2023 06:08:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43C621BF206;
	Thu, 20 Jul 2023 06:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689833312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FpyJvrc3v7D30TlStINKAkO2JhR9mm6Shic3CU3Gt+g=;
	b=ejRFYxXJL3FMMvO3YT46tjSpEHECHM80XBa7DA5utINO1W+dLmqj/6f9VZ97m6S9TBOZE8
	4nyNr+oKg686Qj6JSAeM/P/3hTN6IaPDYSsFkreDPaAHQtYUbUCIXt2S00d47bO2tFirbI
	xf1m96yAnKsK5iMNKjZPoMQFVh2avlNiEwzsgWoFL76BykATSfuT532yvR3YOjl/dvHF1g
	y59qpissTkRdL1u0v/5aDNf64PgwsQb6uD+inIVbNxthREYX2nOLp2ZjYNZ2KIfLcUD0NS
	6/GlPb4MKkLojtccwo+wioQ8mlMk4OgwJOUvrRhHNqMesPJXhsfSnw9STp022Q==
Date: Thu, 20 Jul 2023 08:08:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christopher Cordahi <christophercordahi@nanometrics.ca>
Cc: linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: Question about Davinci NAND using 4 bit ECC
Message-ID: <20230720080828.1124586b@xps-13>
In-Reply-To: <CAF_O4Jt3MfYBwd0qF8vv1eHzApEZQOcGhthLCV4suetxYqVacA@mail.gmail.com>
References: <CAF_O4Js97E_MEK=jrFxUqd4yFOUk4wJg89-LhtDruA67=9_r1A@mail.gmail.com>
	<CAF_O4JuesBTVT806SfMirk2tFG28T7kt5HWSjx9LPEbC9K5zBg@mail.gmail.com>
	<CAF_O4JvYE8HPQDEmhesndwBsOTk134netTTSYNE-dc0o0ik59A@mail.gmail.com>
	<20230718100237.69545cde@xps-13>
	<CAF_O4Jt3MfYBwd0qF8vv1eHzApEZQOcGhthLCV4suetxYqVacA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_230837_161945_3F394A69 
X-CRM114-Status: GOOD (  20.91  )
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

SGkgQ2hyaXN0b3BoZXIsCgpjaHJpc3RvcGhlcmNvcmRhaGlAbmFub21ldHJpY3MuY2Egd3JvdGUg
b24gV2VkLCAxOSBKdWwgMjAyMyAxMjozNDozNgotMDQwMDoKCj4gT24gVHVlLCAxOCBKdWwgMjAy
MyBhdCAwNDowMiwgTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3Jv
dGU6Cj4gCj4gVGhhbmtzIE1pcXVlbCBmb3IgdGhlIHF1aWNrIHJlc3BvbnNlCj4gCj4gQW5kIGFw
b2xvZ2llcyBmb3Igc2VuZGluZyB5b3UgdGhlIHF1ZXN0aW9uIDMgdGltZXMuICBNeSBmaXJzdCBh
dHRlbXB0IGluY2x1ZGVkCj4gYW4gSFRNTCBjb3B5IHdoaWNoIHdhcyByZWplY3RlZCBieSB0aGUg
bWFpbGluZyBsaXN0LCBhbmQgaXQgdG9vayBtZSBhbiBleHRyYQo+IGF0dGVtcHQgdG8gZm9yY2Ug
bXkgZW1haWwgY2xpZW50IHRvIHVzZSBwbGFpbiB0ZXh0LiAgQW5kIHRoZSB0aGlyZCBlbWFpbCBp
cwo+IHN0aWxsIGF3YWl0aW5nIGFwcHJvdmFsIGJ5IHRoZSBtYWlsaW5nIGxpc3QgbW9kZXJhdG9y
LCBJIHN1c3BlY3QgZHVlIHRvIGhvdyBJCj4gZm9yd2FyZGVkIGFuZCByZWZvcm1hdHRlZCB0aGUg
b3JpZ2luYWwgZW1haWwgYmFjayB0byB0aGUgbWFpbGluZyBsaXN0LgoKTm8gcHJvYmxlbSA6KQoK
PiA+IEl0IGlzIGhhcmQgdG8gdGVsbCB3aGV0aGVyIHRoZXNlIGNoYW5nZXMgYXJlIGxlZ2l0aW1h
dGUgb3Igbm90IHdpdGhvdXQKPiA+IHByb3Blcmx5IHRlc3RpbmcuIElmIHlvdSBiZW5jaG1hcmsg
eW91ciBjaGFuZ2VzIGFuZCBuZXZlciBzZWUgYW55Cj4gPiBlcnJvciwgaXQgZG9lcyBub3QgbWVh
biB5b3UgZmFsbCBpbnRvIHRoZSBwaXRzIGR1cmluZyB5b3VyIHRlc3RzLiAgCj4gCj4gT0ssIEkg
d2FzIGhvcGluZyB0byBhdm9pZCBteSBvd24gdGVzdGluZyBiZWNhdXNlIGFzIHlvdSB3cml0ZSwg
bm8gZXJyb3JzCj4gZG9lc24ndCBtZWFuIGl0J3MgYmV0dGVyLiAgQW5kIEkgd2FzIG92ZXJseSBv
cHRpbWlzdGljIGluIGhvcGluZyBmb3IgYW4KPiBleHBsYW5hdGlvbiBhcyB0byB3aHkgdGhpcyBk
cml2ZXIgbW9zdGx5IHdyaXR0ZW4gYnkgVEkgMTUgeWVhcnMgYWdvIGRvZXNuJ3QKPiBtYXRjaCB0
aGVpciBkb2N1bWVudGVkIHByb2NlZHVyZS4KClByb2JhYmx5IDotKQoKPiA+IE9ic2VydmluZyBi
aXRmbGlwcyBpbiB1c2Vyc3BhY2UgYW5kIGRldGVjdGluZyB0aGVtIGNhbiBiZSBhY2hpZXZlZAo+
ID4gZWFzaWx5IHdpdGggdGhlIG5hbmRiaXRlcnJzIC1pIHRvb2wgZnJvbSB0aGUgbXRkLXV0aWxz
IHRlc3Qgc3VpdGUuICAKPiAKPiBUaGFua3MgZm9yIHRoaXMgdGlwLCBJJ2xsIGxvb2sgaW50byBl
eHRlbmRpbmcgdGhlIFlvY3RvIG10ZC11dGlscyByZWNpcGUgWzFdCj4gdG8gaW5zdGFsbCBpdC4g
IEkgc2VlIHRoZSBrZXJuZWwgYWxzbyBoYXMgYSBuYW5kYml0ZXJycyBtdGQgdGVzdCBkcml2ZXJb
Ml0uCj4gQ2FuIGl0IGJlIHVzZWQ/IElzIHRoZXJlIGFueSBkb2N1bWVudGF0aW9uIG9uIGhvdyB0
byB1c2UgdGhpcyBrZXJuZWwgdGVzdD8KClRoZSBrZXJuZWwgdGVzdHMgYXJlIGRlcHJlY2F0ZWQu
IFlvdSBjYW4gcGxheSB3aXRoIHRoZW0sIGp1c3QgaW5zbW9kCnRoZW0gaW4geW91ciBrZXJuZWwu
IFRoZXkgaGF2ZSBiZWVuIHJlaW1wbGVtZW50ZWQgaW4gdXNlcnNwYWNlIHRvIGNoZWNrCnRoZSB3
aG9sZSBtdGQgc3RhY2ssIGFuZCB0aGF0J3MgdGhlIG10ZC11dGlscyB0ZXN0IHN1aXRlLiBQcmVm
ZXIgdXNpbmcKdGhlc2UuCgpZZXMsIGFkZGluZyB0aGUgZGVidWcgdG9vbHMgaW4gWW9jdG8gbWln
aHQgYmUgYSBnb29kIGlkZWEuIEkgYWxyZWFkeQpkaWQgaXQgZm9yIHRoZSBwYWNrYWdlIGluIEJ1
aWxkcm9vdC4KCj4gWzFdIGh0dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvcG9reS9wbGFpbi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRkL210ZC11dGlsc19naXQuYmIKPiBbMl0gaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC90
cmVlL2RyaXZlcnMvbXRkL3Rlc3RzL25hbmRiaXRlcnJzLmMKClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
