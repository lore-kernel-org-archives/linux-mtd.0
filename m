Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36062CCD1AB
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Oct 2025 07:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zx2TeGdeh8mTY6WN0DxXuRx8aTt2zZ/cPnrZoUsRrZ0=; b=FPbDeUMsIn1NK+
	4gDs0bmDKZaNUrGnBdsUJAc01S5Z8E2jbLk+faHPbEnqMKRwfBsVIni7ZYhvHiiN1I6z4/Ld3Wkzv
	WxBqYv30GzYPSKPH61WLKGJRH/kC5UUv19YnaLJGr+TpucHJ5TbZni+QLbq0zR5a62nPddo6ysJR0
	3iqBd9cKuOyaABU5OR8AUM+1Zbnd13/6fY/Tmfn0Qha49cPPB9NzS2u1hMGkfD2Dw+BKUIky+Lf+3
	TKvzg4VL7yxVwaFNQiT8d9jPLJIiFROIq6ZLy1I87n9ZRB7QnXjtYaq8qu9uucPqw8ZwKZM3VMD0x
	CrkjdJyxKVinSeyyLOSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCNL-00000008WxU-1H2t;
	Fri, 24 Oct 2025 07:38:15 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCNI-00000008Wwp-2ING
	for linux-mtd@lists.infradead.org;
	Fri, 24 Oct 2025 07:38:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C489A4E412D1;
	Fri, 24 Oct 2025 07:38:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99DD260703;
	Fri, 24 Oct 2025 07:38:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3F96102F2479;
	Fri, 24 Oct 2025 09:38:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761291490; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bSxkL8tqpmau1y40dLrlfJlYOSTGg2m4G4hoDQyfFxM=;
	b=NIdQ+BPcDwivkk6mu/Uj8PloSozMcblTIs22nAAXkgjjy/C0nngIwm+V6vDbCYdDY8sKFN
	4ra6t1bwXgb7PxcU+5xsTUpbTmIwDplzLcJl/27S2KeZI51XqdBMjrY8/2rIFLYKKhFlFD
	Udo4LQzYyeWxt868RXtkCDTkYl0JYLu296yZVM9G6hLNLo3Ii6l7TuHzuALcdK8c/qHWg0
	aQuf6hgFTbV7OlOS+atUeNOIsREUm0DGhd3iPSkZ2lu2SXrxirT8c9lDSy6fhsHLLb+Sql
	aLvGYbVtMT8JA2zuThiWVEFxU0wEH0V0S8QxqxPYgbmhRgJC3vOYXPjuB6warg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: niravkumarlaxmidas.rabara@altera.com
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: cadence: Add support for NV-DDR interface
 mode
In-Reply-To: <20251024071306.242227-1-niravkumarlaxmidas.rabara@altera.com>
	(niravkumarlaxmidas rabara's message of "Fri, 24 Oct 2025 15:13:06
	+0800")
References: <20251024071306.242227-1-niravkumarlaxmidas.rabara@altera.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 24 Oct 2025 09:38:02 +0200
Message-ID: <87bjlwrbqd.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_003812_718050_C7B101A5 
X-CRM114-Status: GOOD (  12.71  )
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

SGkgTmlyYXZrdW1hciwKCk9uIDI0LzEwLzIwMjUgYXQgMTU6MTM6MDYgKzA4LCBuaXJhdmt1bWFy
bGF4bWlkYXMucmFiYXJhQGFsdGVyYS5jb20gd3JvdGU6Cgo+IEZyb206IE5pcmF2a3VtYXIgTCBS
YWJhcmEgPG5pcmF2a3VtYXJsYXhtaWRhcy5yYWJhcmFAYWx0ZXJhLmNvbT4KPgo+IEFkZCBzdXBw
b3J0IGZvciBOVi1ERFIgbW9kZSBpbiB0aGUgQ2FkZW5jZSBOQU5EIGNvbnRyb2xsZXIgZHJpdmVy
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogTmlyYXZrdW1hciBMIFJhYmFyYSA8bmlyYXZrdW1hcmxheG1p
ZGFzLnJhYmFyYUBhbHRlcmEuY29tPgo+IC0tLQoKVGhhbmtzIGZvciB0aGUgcGF0Y2gsIHZlcnkg
aGFwcHkgdG8gc2VlIHBlb3BsZSBpbXBsZW1lbnRpbmcgdGhpcwppbnRlcmZhY2UhCgpbLi4uXQoK
PiArCWlmIChkbGxfcGh5X2dhdGVfb3Blbl9kZWxheSA+IE5WRERSX0dBVEVfQ0ZHX01JTikKPiAr
CQlpZV9zdGFydCA9IE5WRERSX0dBVEVfQ0ZHX01JTjsKCkNhbiB5b3UgZG91YmxlIGNoZWNrIGhl
cmU/IEkgd291bGQgZXhwZWN0IDwgaW5zdGVhZCBvZiA+IGdpdmVuIHRoYXQgeW91CmNvbXBhcmUg
d2l0aCBzb21ldGhpbmcgeW91IG5hbWVkICJtaW5pbXVtIi4gTWF5YmUgaXQgaXMgbGVnaXRpbWF0
ZSwganVzdAp3YXJuaW5nLgoKPiArCWVsc2UKPiArCQlpZV9zdGFydCA9IGRsbF9waHlfZ2F0ZV9v
cGVuX2RlbGF5Owo+ICsKPiArCWRsbF9waHlfcmRfZGVsYXkgPSAoKG52ZGRyLT50RFFTQ0tfbWF4
ICsgYm9hcmRfZGVsYXkpICsKPiArCQkJCShjbGtfcGVyaW9kIC8gMikpIC8gY2xrX3BlcmlvZDsK
PiArCWlmIChkbGxfcGh5X3JkX2RlbGF5IDw9IE5WRERSX1BIWV9SRF9ERUxBWSkKPiArCQlyZF9k
ZWxfc2VsID0gZGxsX3BoeV9yZF9kZWxheSArIDI7Cj4gKwllbHNlCj4gKwkJcmRfZGVsX3NlbCA9
IE5WRERSX1BIWV9SRF9ERUxBWV9NQVg7Cj4gKwoKWy4uLl0KCj4gK3N0YXRpYyBpbnQKPiArY2Fk
ZW5jZV9uYW5kX3NldHVwX2ludGVyZmFjZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgY2hp
cG5yLAo+ICsJCQkgICAgIGNvbnN0IHN0cnVjdCBuYW5kX2ludGVyZmFjZV9jb25maWcgKmNvbmYp
Cj4gK3sKPiArCWludCByZXQgPSAwOwo+ICsKPiArCWlmIChuYW5kX2ludGVyZmFjZV9pc19zZHIo
Y29uZikpIHsKPiArCQljb25zdCBzdHJ1Y3QgbmFuZF9zZHJfdGltaW5ncyAqc2RyID0gbmFuZF9n
ZXRfc2RyX3RpbWluZ3MoY29uZik7Cj4gKwo+ICsJCWlmIChJU19FUlIoc2RyKSkKPiArCQkJcmV0
dXJuIFBUUl9FUlIoc2RyKTsKPiArCj4gKwkJcmV0ID0gY2FkZW5jZV9uYW5kX3NldHVwX3Nkcl9p
bnRlcmZhY2UoY2hpcCwgc2RyKTsKPiArCX0gZWxzZSBpZiAoY2hpcG5yID49IDApIHsKClRoaXMg
aXNuJ3QgdmVyeSBjbGVhci4gUGxlYXNlIG1ha2UgaXQgYSBzZXBhcmF0ZSBjb25kaXRpb24gaWYg
eW91IHRoaW5rCnlvdSBtdXN0IGhhbmRsZSB0aGlzIGNhc2UuIE90aGVyd2lzZSB5b3UncmUgbWl4
aW5nIGl0IHdpdGggdGhlIFNEUgp2cy4gTlZERFIgY2hvaWNlLCBhbmQgdGhhdCdzIG1pc2xlYWRp
bmcuCgo+ICsJCWNvbnN0IHN0cnVjdCBuYW5kX252ZGRyX3RpbWluZ3MgKm52ZGRyID0gbmFuZF9n
ZXRfbnZkZHJfdGltaW5ncyhjb25mKTsKPiArCj4gKwkJaWYgKElTX0VSUihudmRkcikpCj4gKwkJ
CXJldHVybiBQVFJfRVJSKG52ZGRyKTsKPiArCj4gKwkJcmV0ID0gY2FkZW5jZV9uYW5kX3NldHVw
X252ZGRyX2ludGVyZmFjZShjaGlwLCBudmRkcik7Cj4gKwl9Cj4gKwlyZXR1cm4gcmV0Owo+ICt9
Cj4gKwo+ICBzdGF0aWMgaW50IGNhZGVuY2VfbmFuZF9hdHRhY2hfY2hpcChzdHJ1Y3QgbmFuZF9j
aGlwICpjaGlwKQo+ICB7Cj4gIAlzdHJ1Y3QgY2Ruc19uYW5kX2N0cmwgKmNkbnNfY3RybCA9IHRv
X2NkbnNfbmFuZF9jdHJsKGNoaXAtPmNvbnRyb2xsZXIpOwoKT3RoZXJ3aXNlIGxvb2tzIGdvb2Qg
dG8gbWUhCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
