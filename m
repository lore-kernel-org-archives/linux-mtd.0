Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB4ACF258C
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Nov 2025 09:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6IWMasulZVu/ewV6vP16CeUq44vdinpJLN7qhxcPj1s=; b=xxq2UL73ukk+09
	O5al5rW5A79HwWOY6e7xgKFtXUpf59NEz75BlxuRZT/aydKfXlCCgo0tIkUrS7MEVWntEynQSYTpb
	AiIl4q5lMtqWGnHW2HRy4PbBZ4Gs3tDfLkrD0AUcc3NHuvXP22O6WMOA69LrMVgzvZOBaArQlUQ0L
	E+MZamNjnmvZWGYZOydADGK2tSC6OuWBwCmjN6uGCYnur0dFi8h/BkKRAjcVMp8/MDtX9vQlpyN+E
	VzYGz7SOGu+LdKcYaB3+Gdsp0VB61cl/n+tbOr4Rt4xIjSGnhIFXtT+1EWvFmgRHUGB8WQIP2Acpb
	Le3Kkw1jVBJflPSFo60Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLeG8-00000002qXi-1vdv;
	Wed, 19 Nov 2025 09:13:52 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLeG3-00000002qX4-3UTP
	for linux-mtd@lists.infradead.org;
	Wed, 19 Nov 2025 09:13:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 042751A1BCC;
	Wed, 19 Nov 2025 09:13:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6C9460720;
	Wed, 19 Nov 2025 09:13:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3BD8810371970;
	Wed, 19 Nov 2025 10:13:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763543622; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vMMrY05Eqt0VUIufdiGTc8WpNMw7bbAM4JjsWqLutZI=;
	b=YORGXyt9XK/2WQhb33i0122+Dbh14Djvx2VbyxvxdSiZAAaNY0BvxK77iHRxaG3A46clT/
	rOD2vms2HCX0wia2ZRT6ft7fW+xbNJcrf1WDYvKcEr4bXQhMK0kF3B4zJdpyPuP1nDgmxZ
	UusgFtSAD4KOFZrUcHKpqmTPRmkKawMkjyKi1d2aSlBaWNKtuZjDqTGxH92qr8xXMszIVr
	I9+afPllRCFn8KXtfzWThSOVRzZpQ7Jg9sNWEDfRmCMcBezlWp6fuji1Lv3cOzrXEyLDdi
	xlinBHr15Tdc/yjVzKXfZ+NHHjTlDniQwBPtXn8NWlT1BHu2t893D5mEma+nig==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>,  "Pratyush Yadav"
 <pratyush@kernel.org>,  "Richard Weinberger" <richard@nod.at>,  "Vignesh
 Raghavendra" <vigneshr@ti.com>,  "Jonathan Corbet" <corbet@lwn.net>,
  "Sean Anderson" <sean.anderson@linux.dev>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 02/19] mtd: spi-nor: swp: Improve locking user experience
In-Reply-To: <DEBPI49KKW00.3MSWMX9HQL7JZ@kernel.org> (Michael Walle's message
	of "Tue, 18 Nov 2025 10:17:55 +0100")
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
	<20251114-winbond-v6-18-rc1-spi-nor-swp-v1-2-487bc7129931@bootlin.com>
	<DEBPI49KKW00.3MSWMX9HQL7JZ@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 19 Nov 2025 10:13:36 +0100
Message-ID: <87bjkye667.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_011348_015335_B6E4834B 
X-CRM114-Status: GOOD (  26.29  )
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

T24gMTgvMTEvMjAyNSBhdCAxMDoxNzo1NSArMDEsICJNaWNoYWVsIFdhbGxlIiA8bXdhbGxlQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBGcmkgTm92IDE0LCAyMDI1IGF0IDY6NTMgUE0gQ0VULCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBJbiB0aGUgY2FzZSBvZiBhIHNpbmdsZSBibG9jayBiZWlu
ZyBsb2NrZWQsIGlmIHRoZSB1c2VyIHdhbnQgdG8gZnVsbHkKPj4gdW5sb2NrIHRoZSBkZXZpY2Ug
aXQgaGFzIHR3byBwb3NzaWJpbGl0aWVzOgo+PiAtIGVpdGhlciBpdCBhc2tzIHRvIHVubG9jayB0
aGUgZW50aXJlIGRldmljZSwgYW5kIHRoaXMgd29ya3M7Cj4+IC0gb3IgaXQgYXNrcyB0byB1bmxv
Y2sganVzdCB0aGUgYmxvY2tzIHRoYXQgYXJlIGN1cnJlbnRseSBsb2NrZWQsIHdoaWNoCj4+IGZh
aWxzLgo+Pgo+PiBJdCBmYWlscyBiZWNhdXNlIHRoZSBjb25kaXRpb25zICJjYW5fYmVfdG9wIiBh
bmQgImNhbl9iZV9ib3R0b20iIGFyZQo+PiB0cnVlLiBJbmRlZWQsIGluIHRoaXMgY2FzZSwgd2Ug
dW5sb2NrIGV2ZXJ5dGhpbmcsIHRvIHRoZSBUQiBiaXQgZG9lcyBub3QKPj4gbWF0dGVyLiBIb3dl
dmVyIGluIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLCB1c2VfdG9wIHdvdWxkIGJlIHRydWUg
KGFzCj4+IHRoaXMgaXMgdGhlIGZhdm91cml0ZSBvcHRpb24pIGFuZCBsb2NrX2xlbiwgd2hpY2gg
aW4gcHJhY3RpY2Ugc2hvdWxkIGJlCj4+IHJlZHVjZWQgZG93biB0byAwLCBpcyBzZXQgdG8gIm5v
ci0+cGFyYW1zLT5zaXplIC0gKG9mcyArIGxlbikiIHdoaWNoIGlzCj4+IGEgcG9zaXRpdmUgbnVt
YmVyLiBUaGlzIGlzIHdyb25nLgo+Cj4gVGhpcyBvbmx5IGhhcHBlbnMgaWYgeW91IHRyeSB0byB1
bmxvY2sgdGhlIGZpcnN0IHNlY3RvciwgY29ycmVjdD8gSWYKPiBteSBtYXRocyBhcmUgY29ycmVj
dCwgdHJ5aW5nIGl0IG9uIHRoZSBsYXN0IHNlY3RvciwgbG9ja19sZW4gc2hvdWxkCj4gYmUgMCwg
aS5lIGluIHRoYXQgY2FzZSAib2ZzICsgbGVuID09IHNpemUiLgo+Cj4gSWYgaXQncyB0aGUgZmly
c3Qgc2VjdG9yIChvciBzZWN0b3JzKSwgbG9ja19sZW4gd2lsbCBlbmQgdXAgd2l0aAo+ICJzaXpl
IC0gTiAqIDY0ayIsIHdoaWNoIGlzIGNsZWFybHkgd3JvbmcuCgpUaGF0J3MgaXQuIEFjdHVhbGx5
IEkgZm9yZ290IHRvIG1lbnRpb24gaXQgd2FzIGhhcHBlbmluZyBvbmx5IHdpdGggdGhlCmZpcnN0
IHNlY3RvcnMsIG5vdCB0aGUgbGFzdCBvbmVzLCBzbyB5ZXMgeW91IGFyZSBjb3JyZWN0LCBpdCBt
YXRjaGVzIG15Cm1hdGhzIGFuZCBleHBlcmltZW50cy4KCj4+IEFuIGVhc3kgd2F5IGlzIHRvIHNp
bXBseSBhZGQgYW4gZXh0cmEgY29uZGl0aW9uLiBJbiB0aGUgdW5sb2NrKCkgcGF0aCwKPj4gaWYg
d2UgY2FuIGFjaGlldmUgdGhlIHJlc3VsdHMgZnJvbSBib3RoIHNpZGVzLCBpdCBtZWFucyB3ZSB1
bmxvY2sKPj4gZXZlcnl0aGluZyBhbmQgbG9ja19sZW4gbXVzdCBzaW1wbHkgYmUgMC4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4K
Pj4gLS0tCj4+IEZvciBtZSwgdGhpcyByZXN1bHQgd2FzIGNsZWFybHkgdW5leHBlY3RlZCwgYnV0
IEkgYW0gbm90IHN1cmUgdGhpcwo+PiBxdWFsaWZpZXMgYXMgYSBmaXguCj4KPiBUaGF0J3MgZGVm
aW5ldGx5IGEgYnVnLCBlc3AuIGJlY2F1c2UgaXQgd2lsbCBsb2NrIGFuIGVudGlyZQo+IHVucmVs
YXRlZCByZWdpb24uIEFuZCBpdCBzZWVtcyB0byBnbyBiYWNrIGFsbCB0aGUgdG8gY29tbWl0Cj4g
M2RkODAxMmE4ZWViICJtdGQ6IHNwaS1ub3I6IGFkZCBUQiAoVG9wL0JvdHRvbSkgcHJvdGVjdCBz
dXBwb3J0IikuCj4KPj4gLS0tCj4+ICBkcml2ZXJzL210ZC9zcGktbm9yL3N3cC5jIHwgNCArKyst
Cj4+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL3N3cC5jIGIvZHJpdmVycy9tdGQvc3Bp
LW5vci9zd3AuYwo+PiBpbmRleCA5YjA3ZjgzYWVhYzc2ZGNlMjEwOWY5MGRmYTE1MzRjOWJkOTMz
MzBkLi45YmM1YTM1NjQ0NDY2NWFkODgyNGU5ZTEyZDY3OWZkNTUxYjNlNjdkIDEwMDY0NAo+PiAt
LS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL3N3cC5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1u
b3Ivc3dwLmMKPj4gQEAgLTI4MSw3ICsyODEsOSBAQCBzdGF0aWMgaW50IHNwaV9ub3Jfc3JfdW5s
b2NrKHN0cnVjdCBzcGlfbm9yICpub3IsIGxvZmZfdCBvZnMsIHU2NCBsZW4pCj4+ICAJdXNlX3Rv
cCA9IGNhbl9iZV90b3A7Cj4+ICAKPj4gIAkvKiBsb2NrX2xlbjogbGVuZ3RoIG9mIHJlZ2lvbiB0
aGF0IHNob3VsZCByZW1haW4gbG9ja2VkICovCj4+IC0JaWYgKHVzZV90b3ApCj4+ICsJaWYgKGNh
bl9iZV90b3AgJiYgY2FuX2JlX2JvdHRvbSkKPj4gKwkJbG9ja19sZW4gPSAwOwo+Cj4gQ291bGQg
eW91IHBsZWFzZSBhZGQgYSBjb21tZW50IHN0YXRpbmcgdGhhdCBpZiBib3RoIGFyZSB0cnVlLCBp
dAo+IG1lYW5zIHRoYXQgYm90aCBhZGphY2VudCByZWdpb25zIGFyZSB1bmxvY2tlZCBhbmQgdGh1
cyB0aGUgZW50aXJlCj4gZmxhc2ggd2lsbCBiZSB1bmxvY2tlZC4KCk9mYy4KClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
