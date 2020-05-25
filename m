Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1931EC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 08:29:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE8B02068D
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 08:29:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vAy4l69g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE8B02068D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ijz10+FxccppdhIt4qInc5SAz5p+qsZWLoHifsNetI=; b=vAy4l69gvR8yQu
	5U5Ztw9VSBpJpRiY2aFXUobD0486HMFnqw09I5TLleaqGWTLJyV9LGHj8BHLpiNm++05fv2lSPrj0
	DG270nnUL/ps02IBoNB+S7Ozgx1DAZX6pG61pIPchSmnxnaewc+PtTHIQ6jA4hBTg9DpzzRBggwmr
	4x+O9sF3DA2KG7FSk8V3OD5uV9Z0NTt4I1Bil+EMh6YT1cExtDEEKgLt17YJgfrAEKWXP6VkBwgko
	8ulkGlsJkV+3knO2O/2n6XygyJ/XdudNz+GipC7ulzTEWaF0aA9J4132Hgb5x8mjr2FXl2+Cc3z5Z
	ARkogTuoaWsp91+uDUAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jd8To-0005UF-06; Mon, 25 May 2020 08:29:04 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd8Tk-0005Tj-Gt
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 08:29:02 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 49CEE20000E;
 Mon, 25 May 2020 08:28:54 +0000 (UTC)
Date: Mon, 25 May 2020 10:28:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 17/17] mtd: rawnand: nandsim: Reorganize
 ns_cleanup_module()
Message-ID: <20200525102852.068349d8@xps13>
In-Reply-To: <20200525092315.5f950554@xps13>
References: <20200509191431.15862-1-miquel.raynal@bootlin.com>
 <20200509191431.15862-18-miquel.raynal@bootlin.com>
 <CAFLxGvzU2ESxZ74cve9w=CLBY2v95MMMJqzOFEmCAhVHYF5VvA@mail.gmail.com>
 <20200525001328.6b52da1f@xps13>
 <20200525084637.328d2872@collabora.com>
 <20200525084735.0ca0dad3@collabora.com>
 <20200525092315.5f950554@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_012900_693497_8F1B63BA 
X-CRM114-Status: GOOD (  15.67  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Richard Weinberger <richard@nod.at>, dedekind@infradead.org,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ck1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlIG9uIE1vbiwg
MjUgTWF5IDIwMjAKMDk6MjM6MTUgKzAyMDA6Cgo+IEhpIEJvcmlzLAo+IAo+IEJvcmlzIEJyZXpp
bGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+IHdyb3RlIG9uIE1vbiwgMjUgTWF5
Cj4gMjAyMCAwODo0NzozNSArMDIwMDoKPiAKPiA+IE9uIE1vbiwgMjUgTWF5IDIwMjAgMDg6NDY6
MzcgKzAyMDAKPiA+IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5j
b20+IHdyb3RlOgo+ID4gICAKPiA+ID4gT24gTW9uLCAyNSBNYXkgMjAyMCAwMDoxMzoyOCArMDIw
MAo+ID4gPiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToK
PiA+ID4gICAgIAo+ID4gPiA+IEhpIFJpY2hhcmQsCj4gPiA+ID4gCj4gPiA+ID4gUmljaGFyZCBX
ZWluYmVyZ2VyIDxyaWNoYXJkLndlaW5iZXJnZXJAZ21haWwuY29tPiB3cm90ZSBvbiBTdW4sIDI0
IE1heQo+ID4gPiA+IDIwMjAgMjM6Mzc6MTMgKzAyMDA6Cj4gPiA+ID4gICAgICAgCj4gPiA+ID4g
PiBPbiBTYXQsIE1heSA5LCAyMDIwIGF0IDk6MTkgUE0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4gd3JvdGU6ICAgICAgICAKPiA+ID4gPiA+ID4gICAgICAgICBuc19k
ZWJ1Z2ZzX3JlbW92ZShucyk7Cj4gPiA+ID4gPiA+IC0gICAgICAgbnNfZnJlZShucyk7ICAgIC8q
IEZyZWUgbmFuZHNpbSBwcml2YXRlIHJlc291cmNlcyAqLwo+ID4gPiA+ID4gPiAtICAgICAgIG5h
bmRfcmVsZWFzZShjaGlwKTsgLyogVW5yZWdpc3RlciBkcml2ZXIgKi8KPiA+ID4gPiA+ID4gLSAg
ICAgICBrZnJlZShucyk7ICAgICAgICAvKiBGcmVlIG90aGVyIHN0cnVjdHVyZXMgKi8KPiA+ID4g
PiA+ID4gLSAgICAgICBuc19mcmVlX2xpc3RzKCk7Cj4gPiA+ID4gPiA+ICsgICAgICAgV0FSTl9P
TihtdGRfZGV2aWNlX3VucmVnaXN0ZXIobnNtdGQpKTsKPiA+ID4gPiA+ID4gKyAgICAgICBuc19m
cmVlKG5zKTsKPiA+ID4gPiA+ID4gKyAgICAgICBrZnJlZShlcmFzZV9ibG9ja193ZWFyKTsKPiA+
ID4gPiA+ID4gKyAgICAgICBuYW5kX2NsZWFudXAoY2hpcCk7Cj4gPiA+ID4gPiA+ICsgICAgICAg
bGlzdF9mb3JfZWFjaF9zYWZlKHBvcywgbiwgJmdyYXZlX3BhZ2VzKSB7Cj4gPiA+ID4gPiA+ICsg
ICAgICAgICAgICAgICBrZnJlZShsaXN0X2VudHJ5KHBvcywgc3RydWN0IGdyYXZlX3BhZ2UsIGxp
c3QpKTsKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGxpc3RfZGVsKHBvcyk7ICAgICAgICAg
IAo+ID4gPiA+ID4gCj4gPiA+ID4gPiBBcmUgeW91IHN1cmUgeW91IGNhbiB1c2UgcG9zIGFmdGVy
IGZyZWVpbmcgdGhlIGVudHJ5Pwo+ID4gPiA+ID4gU21lbGxzIGxpa2UgdXNlIGFmdGVyIGZyZWUu
Cj4gPiA+ID4gPiAgICAgICAgIAo+ID4gPiA+IAo+ID4gPiA+IE1tbW1oLCBJIHNob3VsZCBwcm9i
YWJseSBpbnZlcnQgdGhvc2UgdHdvIGxpbmVzLCBmaXJzdCBjYWxsIGxpc3RfZGVsKCkKPiA+ID4g
PiBhbmQgdGhlbiBjYWxsIGtmcmVlKCkgb24gbGlzdF9lbnRyeSgpLiAgICAgIAo+ID4gPiAKPiA+
ID4gWW91IGNhbiBhbHNvIHVzZSAgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKCk6ICAKPiAKPiBJ
IHVzdWFsbHkgdXNlIHRoaXMgaGVscGVyLCBidXQgSSBndWVzcyBJIGNvcHkvcGFzdGVkIHRoZSBi
ZWxvdyBsaW5lcwo+IGZyb20gc29tZXdoZXJlIGVsc2UgaW4gdGhpcyBmaWxlLi4uIEknbGwgdXNl
IGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZSgpLgoKQWN0dWFsbHksIGdyYXZlX3BhZ2VzLCB3ZWFr
X3BhZ2VzIGFuZCB3ZWFrX2Jsb2NrcyBhcmUgdGhyZWUgc3RydWN0dXJlcwpvZiBkaWZmZXJlbnQg
dHlwZXMsIHRoYXQncyB3aHkgdGhleSBjYWxsZWQga2ZyZWUoKSBkaXJlY3RseSBvbgpsaXN0X2Vu
dHJ5KCkgLT4gdG8gYXZvaWQgaGF2aW5nIHRvIGRlY2xhcmUgNiBkaWZmZXJlbnQgcG9pbnRlcnMu
IEknbGwKc3RpY2sgdG8gdGhlIHNhbWUgcHJlc2VudGF0aW9uIHRoYW4gbnNfZnJlZV9saXN0cyB0
aGVuLgoKPiAKPiA+ID4gCj4gPiA+IAlzdHJ1Y3QgZ3JhdmVfcGFnZSAqcG9zLCAqbjsKPiA+ID4g
Cj4gPiA+IAkuLi4KPiA+ID4gCj4gPiA+IAlsaXN0X2Zvcl9lYWNoX3NhZmUocG9zLCBuLCAmZ3Jh
dmVfcGFnZXMsIGxpc3QpIHsgICAgCj4gPiAKPiA+IAlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUo
cG9zLCBuLCAmZ3JhdmVfcGFnZXMsIGxpc3QpIHsKPiA+ICAgCj4gPiA+IAkJbGlzdF9kZWwoJnBv
cy0+bGlzdCk7Cj4gPiA+IAkJa2ZyZWUocG9zKTsKPiA+ID4gCX0KPiA+ID4gICAgIAo+ID4gPiA+
IAo+ID4gPiA+IFRoYW5rcyBmb3Igbm90aWNpbmchCj4gPiA+ID4gTWlxdcOobCAgICAgIAo+ID4g
PiAgICAgCj4gPiAgIAo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
