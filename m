Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59226CC6B1F
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 09:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0Se26Mg1ZSo9tYsQs6bwDixmjo64QalhMnYQFJ6kz8=; b=uZnG/hw4xVmQV0
	CK3eoyesaPbrn0z8pdaI3oZ4nrOZET4R+GtSotU3F9JID5yZHtbH8uRYCrUaOdKaJksyD4uMOBnfr
	p1qMHRsHk8Z4/6woOYUUVXAj6Dp8NidBExLxdOMi24esHhw7vxbBpWB7cAioEY9I/S04zIXSsR+Mh
	iy9uf19WnZ6w+3KeIKc0Mc/2AA7Z1lUL4d4q/+GI1G3gDCKwiY14kJxOvVAP+Suz65VLGUaANyNpY
	5ektrWXbn3yCnXMT0mtctgJiTRn14HdQd/wYGS8ddPlf8WPqvu2wjkXvkvqKy9jjmQ8m/SKU9zibc
	BsZFYxp0miLdNQb7suvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGv7z-0000000F0NV-2tNz;
	Wed, 14 Oct 2026 09:18:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGv7t-0000000F0MP-1abD
	for linux-mtd@bombadil.infradead.org;
	Wed, 14 Oct 2026 09:18:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gVDJVVXGkBzfUYwNqBZ6DDXQIvFOWpJRrMRJFdS3O14=; b=jwJ5JVSqAaNloxpCZf0fhQ6Ve1
	K2L5Of+5zSnyAMsPvvDSLrGJi/oJsvyYDh2itcdGgZMCKHNNeaGG+4Dz9O83akCReo+kGPrO7I/BK
	WDEZk/VW2eUljnTxRaHpV0jMaOxN9dxLIWcv6lOdgLzaLcByRe8tzj/d+fVXx1+lOz+jTCc4Eesqn
	5iSMG9rBi+NH8MVkoB+jLZPcMszNsKC8A2AqnTDxU4joOKCsx+qcWkJw97+LP42w/CVVFcQtyZ190
	uwgsuZNEEeclklJWR+v3V7KS6E4KFIZWq8YVQSlfSqVTRk0y7eO3R2lODT7n/Q/tEVxwq7UBUu8yu
	1hJTC5lg==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGv7q-0000000GYDj-24Kl
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 09:18:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AA3221A1214;
	Wed, 14 Oct 2026 09:18:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7691960368;
	Wed, 14 Oct 2026 09:18:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 29B2D10328AE5;
	Wed, 14 Oct 2026 11:18:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791969494; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gVDJVVXGkBzfUYwNqBZ6DDXQIvFOWpJRrMRJFdS3O14=;
	b=kznN615HBHUoJcKTfKUOqEXUzm5Voxkg2DYv5tG2A3ZoGv+fSnn97G0xBKwio+5eGqs4yw
	ioVFIEmUKLf9kYqHKRZNT9c6TQ2pACmb7iXZ9DaHEoOk3PzSBtV1cvl/15JUnG92A0ySJ8
	IOq6auu/Tb94W2PkJ4UfVZbzOGFPdzmXGTno+OzrPuuxercv3wdPe+spJnnz/lgv9BlF8W
	ioIFakZqAUeium0M7P0B+neRxR+4gjxLjK6PDhCY109QyZJ0ByWcRldN7QohCZnkK6iTfP
	Fu5YZQ2zdKhcZjN7KJXuW56Cmt/tbaot1FYQpjlfA1FOoOIipu91wbvhSuv/Fg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul.cercueil@bootlin.com>
Cc: sashiko-reviews@lists.linux.dev,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Mark Brown <broonie@kernel.org>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Kees Cook
 <kees@kernel.org>,  Tony Luck <tony.luck@intel.com>,  "Guilherme G .
 Piccoli" <gpiccoli@igalia.com>,  linux-mtd@lists.infradead.org,  Bharat
 Bhushan <bbhushan2@marvell.com>,  Sunil Kovvuri Goutham
 <sgoutham@marvell.com>,  Tanmay Jagdale <tanmay@marvell.com>
Subject: Re: [PATCH v2 1/7] spi: spi-mem: Add support for panic mem writes
In-Reply-To: <73139fed463dc3c32ccccfddb84d0f500066401f.camel@bootlin.com>
	(Paul Cercueil's message of "Wed, 14 Oct 2026 10:24:45 +0200")
References: <20261013141350.189996-1-paul.cercueil@bootlin.com>
	<20261013141350.189996-2-paul.cercueil@bootlin.com>
	<sashiko-outbox-169898@kernel.org>
	<4a8f6d2bff13967288cbff72d1c3e8fcb4ca9f8d.camel@bootlin.com>
	<87wlrlvbix.fsf@bootlin.com>
	<73139fed463dc3c32ccccfddb84d0f500066401f.camel@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 14 Oct 2026 11:18:08 +0200
Message-ID: <87se28y71r.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_101818_682908_76A45BB7 
X-CRM114-Status: GOOD (  17.89  )
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

T24gMTQvMTAvMjAyNiBhdCAxMDoyNDo0NSArMDIsIFBhdWwgQ2VyY3VlaWwgPHBhdWwuY2VyY3Vl
aWxAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBIaSBNaXF1w6hsLAo+Cj4gTGUgbWFyZGkgMTMgb2N0
b2JyZSAyMDI2IMOgIDE3OjU3ICswMjAwLCBNaXF1ZWwgUmF5bmFsIGEgw6ljcml0wqA6Cj4+IEhp
IFBhdWwsCj4+IAo+PiBPbiAxMy8xMC8yMDI2IGF0IDE3OjMzOjMyICswMiwgUGF1bCBDZXJjdWVp
bCA8cGF1bC5jZXJjdWVpbEBib290bGluLmNvbT4KPj4gd3JvdGU6Cj4+IAo+PiA+IEhpIFNhc2hp
a28sCj4+IAo+PiA6LSkKPj4gCj4+ID4gPiA+IC0JCXJldCA9IHNwaV9tZW1fYWNjZXNzX3N0YXJ0
KG1lbSk7Cj4+ID4gPiA+ICsJCWlmICghb3AtPnBhbmljX3dyaXRlKQo+PiA+ID4gPiArCQkJcmV0
ID0gc3BpX21lbV9hY2Nlc3Nfc3RhcnQobWVtKTsKPj4gPiA+ID4gKwkJZWxzZSBpZiAoY3Rsci0+
YXV0b19ydW50aW1lX3BtKQo+PiA+ID4gPiArCQkJcmV0ID0gcG1fcnVudGltZV9nZXRfaWZfYWN0
aXZlKGN0bHItCj4+ID4gPiA+ID5kZXYucGFyZW50KTsKPj4gPiA+ID4gwqAJCWlmIChyZXQpCj4+
ID4gPiA+IMKgCQkJcmV0dXJuIHJldDsKPj4gPiA+IAo+PiA+ID4gW1NldmVyaXR5OiBIaWdoXQo+
PiA+ID4gSXMgaXQgc2FmZSB0byBjYWxsIHBtX3J1bnRpbWVfZ2V0X2lmX2FjdGl2ZSgpIGhlcmUg
ZHVyaW5nIGEga2VybmVsIHBhbmljPwo+PiA+ID4gCj4+ID4gPiBwbV9ydW50aW1lX2dldF9pZl9h
Y3RpdmUoKSByZWxpZXMgb24gcG1fcnVudGltZV9nZXRfY29uZGl0aW9uYWwoKSwgd2hpY2gKPj4g
PiA+IHVuY29uZGl0aW9uYWxseSBhY3F1aXJlcyBkZXYtPnBvd2VyLmxvY2sgdmlhIHNwaW5fbG9j
a19pcnFzYXZlKCkuIEluIGEKPj4gPiA+IHBhbmljCj4+ID4gPiBjb250ZXh0IHdpdGggTk1JcyBv
ciBJUlFzIGRpc2FibGVkLCB0cnlpbmcgdG8gYWNxdWlyZSBhIHNwaW5sb2NrIHRoYXQgbWF5Cj4+
ID4gPiBiZQo+PiA+ID4gaGVsZCBieSBhIGhhbHRlZCBDUFUgY2F1c2VzIGFuIGluZmluaXRlIHNw
aW4uIE9uIFBSRUVNUFRfUlQsCj4+ID4gPiBzcGluX2xvY2tfaXJxc2F2ZSgpCj4+ID4gPiBtYXBz
IHRvIGEgc2xlZXBpbmcgcnRfbXV0ZXgsIHdoaWNoIGlzIHN0cmljdGx5IGZvcmJpZGRlbiBpbiBh
dG9taWMKPj4gPiA+IGNvbnRleHQuCj4+ID4gCj4+ID4gQUNLLCBJJ2xsIGp1c3QgZHJvcCBwbV9y
dW50aW1lX2dldF9pZl9hY3RpdmUoKSBoZXJlLCBhbmQgcmVzdG9yZSB0aGUgcmV0dXJuCj4+ID4g
LQo+PiA+IEVPUE5PVFNVUFAgdGhhdCB3YXMgaW4gdjEgd2hlbiBjdGxyLT5hdXRvX3J1bnRpbWVf
cG0gaXMgc2V0Lgo+PiAKPj4gVGhpcyBpcyB0cmlja3kgYnV0IGF1dG9tYXRpY2FsbHkgcnVsZXMg
b3V0IGFib3V0IDEvNnRoIG9mIHRoZQo+PiBjb250cm9sbGVycyAoNDUgY29udHJvbGxlcnMgc2V0
IHRoaXMgYm9vbGVhbiBvdXQgb2YgKzMwMCkuIEkgZG9uJ3QgbGlrZQo+PiBpdCBtdWNoLiBJIGd1
ZXNzIGl0IGRlc2VydmVzIGEgY29tbWVudCBpbiBjYXNlIHNvbWVvbmUgZXZlciB3YW50cyB0bwo+
PiBlbmFibGUgdGhpcyBmZWF0dXJlIG9uIHRoZWlyIGF1dG8tUlBNLWVuYWJsZWQgY29udHJvbGxl
ciwgdG8gdW5kZXJzdGFuZAo+PiB3aHkgdGhpcyBpcyBub3QgcG9zc2libGUuIE15IGd1dCBmZWVs
aW5nIGlzIHRoYXQgdGhlIHJ1bnRpbWUgUE0gbGF5ZXIKPj4gbGFja3MgaXRzIG93biB1bmRlcnN0
YW5kaW5nIG9mIHdoYXQgYSBwYW5pYyBpcy4gV2Ugc2hvdWxkLCBJIGJlbGlldmUsIGJlCj4+IGFi
bGUgdG8gcXVlcnkgdGhlIHVzYWdlX2NvdW50IG9mIGEgY29udHJvbGxlciB3aXRob3V0IHRha2lu
ZyB0aGUgbG9jawo+PiBkdXJpbmcgYSBwYW5pYyB3cml0ZS4KPj4gCj4+IE5ldmVydGhlbGVzcywg
bGV0J3MgbW92ZSBmb3J3YXJkIGFuZCByZXR1cm4gYW4gZXJyb3IgZm9yIG5vdy4KPgo+IEkgZ3Vl
c3MgSSBjYW4gdXNlIHBtX3J1bnRpbWVfYWN0aXZlKCkgdGhlbj8KCkFoLCB5ZXMhCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
