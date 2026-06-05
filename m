Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCEFCD6E5D
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jun 2026 06:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c4lVPqZsoSipXBUP19peXfQ5UiZLtDnptalKcBB7a4g=; b=FtmAiMF83QaSGZ
	rpATN3noq6vXfwgCmtrZHL+6I1irSrAaJzw+p0P63x7jqcBgaQOeSR6mDVgGk74ysgbnWfGPUv2qt
	QmKBKf4uv1IOfyWzjTetgaWoYOPpKDn2x2fMrF1MCHbEqMBXHljiOtwPh2g1RKtfYJfD5qeKqXEmO
	6eGXCGg06AojiGkr8Ym5zJWXW6dKWMYQg9DfMaURe5HCP4ZxvQaPqIEpZ8jW1K8c3j3su6PwZMjtr
	wL7DroidjBmUpctIZObWES646NgjBk448M3bG27BulwKhuBcin0be8gZTxi+Jq83wfStxhhRHpW5l
	gkw1Dg5+heFCWwMMPCGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVNql-000000008y9-2Tty;
	Fri, 05 Jun 2026 06:16:11 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVNqi-000000008xi-0zNU
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jun 2026 06:16:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 071F91A0904;
	Fri,  5 Jun 2026 06:16:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B77BA5FED1;
	Fri,  5 Jun 2026 06:16:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E923106A1EE4;
	Fri,  5 Jun 2026 08:15:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780640163; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=deiuXUFDNSX7cfC+kx+/zdue7rrj2MqboxTE2cMg8zE=;
	b=cHzlsZS2hSySMxs5YUSmcxkzm4CHL4ifkBgF3iZ+s0sxiTlqKSFgF3Ygfz6DjgQr2eS/N6
	dQdX/HnAaJ6AuiDDIRsOpRXSdkppcayDYo0Bv9zJ6dUAS5xT9DRhyX6hmupWwkr5oiZXIS
	aLvyCQdark05GVxMuc5TdJm9W5NfjBTcYsfnxbZiDysCviCZwSVWrpoW1LX95R63CLrTk+
	Juo/BjZ5OutF7onvPh5K1UEOuyskhoaGcqrS9EdYXll1ThE6jYJ3jKDotEIzWwOWhqXw9D
	RNmF+7TlRBdVFRZXG4XCvNnBGZ/yftz4c+MbbEh8eAQt1EWy6xLbSjHkQ9OLog==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,  <u-kumar1@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [PATCH v3 04/13] spi: spi-mem: add spi_mem_apply_base_freq_cap()
In-Reply-To: <354e81b1-3070-439b-b404-20a2c30bd774@ti.com> (Santhosh Kumar
	K.'s message of "Thu, 4 Jun 2026 17:40:26 +0530")
References: <20260527175527.2247679-1-s-k6@ti.com>
	<20260527175527.2247679-5-s-k6@ti.com> <87fr3bhqkk.fsf@bootlin.com>
	<354e81b1-3070-439b-b404-20a2c30bd774@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 05 Jun 2026 08:15:57 +0200
Message-ID: <87fr31wm02.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_231608_432918_671773FE 
X-CRM114-Status: GOOD (  11.94  )
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

SGkgU2FudGhvc2gsCgpPbiAwNC8wNi8yMDI2IGF0IDE3OjQwOjI2ICswNTMwLCBTYW50aG9zaCBL
dW1hciBLIDxzLWs2QHRpLmNvbT4gd3JvdGU6Cgo+IEhlbGxvIE1pcXVlbCwKPgo+IE9uIDI4LzA1
LzI2IDE0OjEzLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBIaSBTYW50aG9zaCwKPj4gCj4+PiAt
LS0gYS9kcml2ZXJzL3NwaS9zcGktbWVtLmMKPj4+ICsrKyBiL2RyaXZlcnMvc3BpL3NwaS1tZW0u
Ywo+Pj4gQEAgLTM5OCw3ICszOTgsMTEgQEAgaW50IHNwaV9tZW1fZXhlY19vcChzdHJ1Y3Qgc3Bp
X21lbSAqbWVtLCBjb25zdCBzdHJ1Y3Qgc3BpX21lbV9vcCAqb3ApCj4+PiAgIAl1OCAqdG1wYnVm
Owo+Pj4gICAJaW50IHJldDsKPj4+ICAgLQkvKiBNYWtlIHN1cmUgdGhlIG9wZXJhdGlvbiBmcmVx
dWVuY3kgaXMgY29ycmVjdCBiZWZvcmUgZ29pbmcKPj4+IGZ1dGhlciAqLwo+Pj4gKwkvKgo+Pj4g
KwkgKiBPcHMgbm90IGNvbmZpZ3VyZWQgZm9yIG1heGltdW0gc3BlZWQgYXJlIGxpbWl0ZWQgdG8g
dGhlIGNvbnNlcnZhdGl2ZQo+Pj4gKwkgKiBiYXNlIHNwZWVkOyBzcGlfbWVtX2FkanVzdF9vcF9m
cmVxKCkgdGhlbiBjYXBzIHRvIHRoZSBkZXZpY2UgbWF4aW11bS4KPj4+ICsJICovCj4+PiArCXNw
aV9tZW1fYXBwbHlfYmFzZV9mcmVxX2NhcChtZW0sIChzdHJ1Y3Qgc3BpX21lbV9vcCAqKW9wKTsK
Pj4+ICAgCXNwaV9tZW1fYWRqdXN0X29wX2ZyZXEobWVtLCAoc3RydWN0IHNwaV9tZW1fb3AgKilv
cCk7Cj4+IFRoZXJlIGFyZSBtYW55IG1vcmUgc3BpX21lbV9hZGp1c3Rfb3BfZnJlcSgpIGNhbGxz
IGluIHRoZSBjb3JlIHdoZXJlCj4+IHdlIHdvdWxkCj4+IG5vdCBhcHBseSB0aGUgYmFzZSBmcmVx
dWVuY3kuIEFyZW4ndCB3ZSBtaXNzaW5nIHRoZXNlIHBsYWNlcz8gV291bGRuJ3QgaXQKPj4gYmUg
bW9yZSBhcHByb3ByaWF0ZSB0byBjYWxsIHNwaV9tZW1fYXBwbHlfYmFzZV9mcmVxX2NhcCgpIGF0
IHRoZSBiZWdpbm5pbmcKPj4gb2Ygc3BpX21lbV9hZGp1c3Rfb3BfZnJlcSgpID8KPgo+IE1vdmlu
ZyBzcGlfbWVtX2FwcGx5X2Jhc2VfZnJlcSgpIGludG8gc3BpX21lbV9hZGp1c3Rfb3BfZnJlcSgp
IHdvdWxkCj4gYWZmZWN0IG9wZXJhdGlvbiBzZWxlY3Rpb24uCgpZZXMsIGFuZCB0aGF0IGlzIHBy
ZWNpc2VseSB3aGF0IHdlIHdhbnQuCgo+IHNwaV9tZW1fYWRqdXN0X29wX2ZyZXEoKSBpcyB1c2Vk
IGR1cmluZyB2YXJpYW50IGV2YWx1YXRpb24gdGhyb3VnaAo+IHNwaW5hbmRfc2VsZWN0X29wX3Zh
cmlhbnQoKSBhbmQgc3BpX21lbV9jYWxjX29wX2R1cmF0aW9uKCkuCgpBbmQgdGhpcyBpcyBhIG9u
ZSB0aW1lIHNwZWNpZmljIGluaXRpYWxpemF0aW9uIHBhdGguIFRoZXJlIHdlIG5lZWQgbW9yZQps
b2dpYywgcHJvYmFibHkuCgo+IEFwcGx5aW5nIHRoZQo+IGNhcCB0aGVyZSB3b3VsZCBjYXVzZSBh
bGwgY2FuZGlkYXRlcyB0byBiZSBldmFsdWF0ZWQgYXQgYmFzZV9zcGVlZF9oego+IHJhdGhlciB0
aGFuIHRoZSBhY3R1YWwgbWF4X3NwZWVkX2h6LiBBcyBhIHJlc3VsdCwgdmFyaWFudCBzZWxlY3Rp
b24KPiBjb3VsZCBjb252ZXJnZSBvbiBhIGRpZmZlcmVudCBvcGVyYXRpb24gdGhhbiB0aGUgb25l
IHRoYXQgd291bGQgYmUKPiBvcHRpbWFsLgoKQnV0IHRoaXMgaXMgb25seSBhIHNpbmdsZSBwbGFj
ZS4gV2hlcmVhcyBpbiB5b3VyIGltcGxlbWVudGF0aW9uIHlvdSBwdXNoCnRoZSBjb21wbGV4aXR5
IGluIGV2ZXJ5IHBsYWNlIHVzaW5nIHRoZSBzcGkgbWVtIGludGVyZmFjZSwgSSBkb24ndCB0aGlu
awp0aGlzIGlzIHdpc2UgYXMgeW91IHdpbGwgbGlrZWx5IGVuZCB1cCB3aXRoIG1hbnkgdW5zZWVu
IGNvcm5lciBjYXNlcy4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
