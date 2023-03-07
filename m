Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E20C678D4
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Mar 2023 10:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rQlghbxH1aogOj7gbsCEsQYXLiiPwLa4w/5FANoEoVc=; b=iFS1L4+hY9uBJV
	PWXrXKmdB9SGYTGx+fK7kausgRNq3ArfD9NV5EOtBKgidheynR00B8CovfWKvuudSes1mvxWbMJ8S
	4vRSY3NgoOWXUaJ7IsNAsIJhITRoNilaGjmRzmEtQz/uafvEAGo5uAFlXjI97WlGMqOpSTU0lI3kE
	wHqqXV8lXxm0MYl1wcgBz2xPevA1C2HOUnOaQTI94DDHS5pmQfjzmmcmxl5eX5frmVjJjFPc9OjQE
	ESpyp6nMGN06c98WV5mXsvXh+TAx0rfgLeqPRu7OBMZrifsiid0/VVtzce+4WkydQVHIXeqslupyv
	lBwb3+tKpw1k6QOnc6Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUid-00HKR3-Ml; Tue, 07 Mar 2023 10:38:55 +0000
Received: from relay10.mail.gandi.net ([2001:4b98:dc4:8::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUia-00HKPy-9u
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2023 10:38:53 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CDFA7240014;
	Tue,  7 Mar 2023 10:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678185529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VglUMIXrPqjJ8c4O9VES4XFcHo1sdweKGqq4J4kTLIM=;
	b=JyVXXBDpnWD59CtM5qyfPqwq1g31JD32Fl7zyqZHdZccSVKXihZO+6lUgdm99HSu64V3hw
	X/5rfAmEhn89kGsyDb+TfbLUw0C7oV35wHyfyaFGEc6asGF2z3vQDWvTV2i3hr+OcAhger
	9sObtS36zyUZjiBXPU7/T1va0aeysICfSc6IGRQpcH8ETcOZV6xopsdysRZnLSqppfWSgv
	DFwIbM2r79h1V2YiOi2yDwk6xQjuMSkoYl22lKF17x6jM3z5v1UKz6nFTvIv1MAxdSevad
	MwpxYCOtSTlrD0sD0Reaac9lcS9bUhhclJgsHIEfBlHLzpe01xL1X68cJFFMUQ==
Date: Tue, 7 Mar 2023 11:38:46 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>, "Richard Weinberger"
 <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: parsers: remove reference to config MTD_NAND_TMIO
Message-ID: <20230307113846.5dab6e66@xps-13>
In-Reply-To: <1e321754-5bdd-4019-8524-2222ee369502@app.fastmail.com>
References: <20230307074038.17391-1-lukas.bulwahn@gmail.com>
	<20230307100350.1c0af7b9@xps-13>
	<1e321754-5bdd-4019-8524-2222ee369502@app.fastmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_023852_532460_803A1BCB 
X-CRM114-Status: GOOD (  15.58  )
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

SGkgQXJuZCwKCmFybmRAYXJuZGIuZGUgd3JvdGUgb24gVHVlLCAwNyBNYXIgMjAyMyAxMToyNjo0
OCArMDEwMDoKCj4gT24gVHVlLCBNYXIgNywgMjAyMywgYXQgMTA6MDMsIE1pcXVlbCBSYXluYWwg
d3JvdGU6Cj4gPiBIaSBMdWthcywKPiA+Cj4gPiBsdWthcy5idWx3YWhuQGdtYWlsLmNvbSB3cm90
ZSBvbiBUdWUsICA3IE1hciAyMDIzIDA4OjQwOjM4ICswMTAwOgo+ID4KPiA+PiBDb21taXQgNTY4
NDk0ZGI2ODA5ICgibXRkOiByZW1vdmUgdG1pb19uYW5kIGRyaXZlciIpIHJlbW92ZXMgdGhlIGNv
bmZpZwo+ID4+IE1URF9OQU5EX1RNSU8gYW5kIGl0cyBjb3JyZXNwb25kaW5nIGRyaXZlci4KPiA+
PiAKPiA+PiBSZW1vdmUgdGhlIHJlZmVyZW5jZSBpbiBNVERfU0hBUlBTTF9QQVJUUyB0byB0aGF0
IHJlbW92ZWQgY29uZmlnLgo+ID4+IAo+ID4+IFNpZ25lZC1vZmYtYnk6IEx1a2FzIEJ1bHdhaG4g
PGx1a2FzLmJ1bHdhaG5AZ21haWwuY29tPgo+ID4+IC0tLQo+ID4+IEFybmQsIHBsZWFzZSBhY2su
Cj4gPj4gTWlxdWVsLCBwbGVhc2UgcGljayB0aGlzIG1pbm9yIG5vbi11cmdlbnQgcGF0Y2ggb24g
dG9wIG9mIHRoZSBjb21taXQgYWJvdmUuCj4gPgo+ID4gQWN0dWFsbHkgSSBndWVzcyB0aGUgU0hB
UlBTTCBkcml2ZXIgaXMgbm90IHNlbGVjdGFibGUgcmlnaHQgbm93LCBzbwo+ID4gdGhpcyBzaG91
bGQgYmUgc2VudCBhcyBwYXJ0IG9mIG15IG5leHQgZml4ZXMgUFIuCj4gCj4gSSBkb24ndCBzZWUg
d2h5IG5vdCwgaXQganVzdCBkZXBlbmRzIG9uICdBUkNIX1BYQXx8Q09NUElMRV9URVNUJyBhbmQK
PiBzaG91bGQgd29yayBmaW5lIHdpdGggQ09ORklHX01BQ0hfU1BJVFogUERBcy4KClNvcnJ5LCBJ
IG92ZXJsb29rZWQgdGhlIGRpZmYsIGluZGVlZCB0aGVyZSBpcyBub3RoaW5nIGJyb2tlbiwgc28g
SSdsbApxdWV1ZSBpdCB0byBuYW5kL25leHQuIEkgdGhvdWdodCBNVERfU0hBUlBTTF9QQVJUUyB3
YXMgbm90IHNlbGVjdGFibGUKYW55bW9yZSB3aXRob3V0IENPTVBJTEVfVEVTVCwgd2hpY2ggd291
bGQgaGF2ZSBiZWVuIHByb2JsZW1hdGljLgoKRml4ZXMgdGFnIHN0aWxsIHdlbGNvbWUgdGhvdWdo
IDopCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
