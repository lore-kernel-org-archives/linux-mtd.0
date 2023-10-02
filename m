Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED5EE784AC
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Oct 2023 13:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=svvuzqKwvwmEFrT0gycENr9Xv1x4y2xoZHpzM21D76c=; b=Wg7kOjszmmzim8
	KyBgvVcXiq2xON1c25kIi4xklh2YzfkqphA1HrV6fg9HP/zjxTXIFevubACLI/fNSHtXNUXcF3V3r
	5/zePTwC9l3cgY77RedXdKYuzch89bhnCJnVh1ipbSMKJgHUBOGyA0Tw1MRRVNlBHPgSSoUDE5l1n
	tXdoc0/g0i4+cqlB3/N+dYyGbFB/VbJTJEpr4AH9IzBTT82FDUf4k6oH7YGzQlI1doomK71X3KBQS
	SAScPWICg7q1aq4S9STo731nMT0TmSW8W+/uID0yTrlR31ScOEKtcZWf77d/VBCJrOjQZXKkbatbN
	SVWilp5GP4xQteVUra5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnJJ6-00CoRY-05;
	Mon, 02 Oct 2023 13:49:56 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnJJ2-00CoQo-2L
	for linux-mtd@lists.infradead.org;
	Mon, 02 Oct 2023 13:49:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5AA4324000D;
	Mon,  2 Oct 2023 13:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696254587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4paVPeEF9ZLJzDxaKPdD/mR7tqf5kQ9/5kHc/DvHhlA=;
	b=UIU5d6aGGKL6D6KCkhLdPeAbU+VlRdNenyDOL4h5JCr7mdCK0cF81jnxFzn2VZAApdGu9V
	/TdCXnRvnYb0PQlvWdeLsivGVY7GG7UCQLl2ZcmHfnhYv3V6wB/nGglgx1pQ6blCu7HQzY
	HiI2Qbpr4JbVZHT8+ya6BWHZ5jeDlSECvN0w7u1m27DbmzULPWoRe+6+CnLGYeziNZyr8E
	LbJ5g/1+Clz/d/6ZE9GXNXScrYSSO1XtHVEPdamxnDHp5J/k87l8FIBvfFhYX4epsZOmvM
	6fGlpXEDsqBIWuL81FXIPBCaVJT2iRZGz/5xRKfdFx5x1Sw78gBfrkkAcqrDAw==
Date: Mon, 2 Oct 2023 15:49:43 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin =?UTF-8?B?SHVuZGViw7hsbA==?= <martin@geanix.com>
Cc: Rouven Czerwinski <r.czerwinski@pengutronix.de>, =?UTF-8?B?TcOlbnMg?=
 =?UTF-8?B?UnVsbGfDpXJk?= <mans@mansr.com>, Alexander Shiyan
 <eagle.alexander923@gmail.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, JaimeLiao <jaimeliao.tw@gmail.com>,
 kernel@pengutronix.de, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Sean
 =?UTF-8?B?Tnlla2rDpnI=?= <sean@geanix.com>, Domenico Punzo
 <dpunzo@micron.com>, Bean Huo <beanhuo@micron.com>
Subject: Re: [PATCH v2] mtd: rawnand: Ensure the nand chip supports cached
 reads
Message-ID: <20231002154943.361e31b0@xps-13>
In-Reply-To: <b8de26e243afa3e5920455a4d8e5a3451a06d074.camel@geanix.com>
References: <20230922141717.35977-1-r.czerwinski@pengutronix.de>
	<e911f5d9c7def8c80904a17ad3924ecba6625998.camel@geanix.com>
	<20230926132725.5d570e1b@xps-13>
	<20230927170516.2604e8f2@xps-13>
	<b8de26e243afa3e5920455a4d8e5a3451a06d074.camel@geanix.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_064953_058383_E427FFA5 
X-CRM114-Status: GOOD (  31.08  )
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

SGkgTWFydGluLAoKbWFydGluQGdlYW5peC5jb20gd3JvdGUgb24gVGh1LCAyOCBTZXAgMjAyMyAw
OToxOTo1NiArMDIwMDoKCj4gSGkgTWlxdWVsLAo+IAo+IE9uIFdlZCwgMjAyMy0wOS0yNyBhdCAx
NzowNSArMDIwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIE1hcnRpbiwKPiA+IAo+ID4g
bWlxdWVsLnJheW5hbEBib290bGluLmNvbcKgd3JvdGUgb24gVHVlLCAyNiBTZXAgMjAyMyAxMzoy
NzoyNSArMDIwMDoKPiA+ICAgCj4gPiA+IEhpIE1hcnRpbiwKPiA+ID4gCj4gPiA+ICsgQmVhbiBh
bmQgRG9tZW5pY28sIHRoZXJlIGlzIGEgcXVlc3Rpb24gZm9yIHlvdSBiZWxvdy4KPiA+ID4gCj4g
PiA+IG1hcnRpbkBnZWFuaXguY29twqB3cm90ZSBvbiBNb24sIDI1IFNlcCAyMDIzIDEzOjAxOjA2
ICswMjAwOgo+ID4gPiAgIAo+ID4gPiA+IEhpIFJvdXZlbiwKPiA+ID4gPiAKPiA+ID4gPiBPbiBG
cmksIDIwMjMtMDktMjIgYXQgMTY6MTcgKzAyMDAsIFJvdXZlbiBDemVyd2luc2tpIHdyb3RlOsKg
ICAgCj4gPiA+ID4gPiBCb3RoIHRoZSBKRURFQyBhbmQgT05GSSBzcGVjaWZpY2F0aW9uIHNheSB0
aGF0IHJlYWQgY2FjaGUKPiA+ID4gPiA+IHNlcXVlbnRpYWwKPiA+ID4gPiA+IHN1cHBvcnQgaXMg
YW4gb3B0aW9uYWwgY29tbWFuZC4gVGhpcyBtZWFucyB0aGF0IHdlIG5vdCBvbmx5Cj4gPiA+ID4g
PiBuZWVkIHRvCj4gPiA+ID4gPiBjaGVjayB3aGV0aGVyIHRoZSBpbmRpdmlkdWFsIGNvbnRyb2xs
ZXIgc3VwcG9ydHMgdGhlIGNvbW1hbmQsCj4gPiA+ID4gPiB3ZSBhbHNvCj4gPiA+ID4gPiBuZWVk
IHRvIGNoZWNrIHRoZSBwYXJhbWV0ZXIgcGFnZXMgZm9yIGJvdGggT05GSSBhbmQgSkVERUMgTkFO
RAo+ID4gPiA+ID4gZmxhc2hlcwo+ID4gPiA+ID4gYmVmb3JlIGVuYWJsaW5nIHNlcXVlbnRpYWwg
Y2FjaGUgcmVhZHMuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRoaXMgZml4ZXMgc3VwcG9ydCBmb3Ig
TkFORCBmbGFzaGVzIHdoaWNoIGRvbid0IHN1cHBvcnQKPiA+ID4gPiA+IGVuYWJsaW5nCj4gPiA+
ID4gPiBjYWNoZQo+ID4gPiA+ID4gcmVhZHMsIGkuZS4gU2Ftc3VuZyBLOUY0RzA4VTBGIG9yIFRv
c2hpYmEgVEM1OE5WRzBTM0hUQTAwLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBTZXF1ZW50aWFsIGNh
Y2hlIHJlYWRzIGFyZSBub3cgb25seSBhdmFpbGFibGUgZm9yIE9ORkkgYW5kCj4gPiA+ID4gPiBK
RURFQwo+ID4gPiA+ID4gZGV2aWNlcywgaWYgaW5kaXZpZHVhbCB2ZW5kb3JzIGltcGxlbWVudCB0
aGlzLCBpdCBuZWVkcyB0byBiZQo+ID4gPiA+ID4gZW5hYmxlZAo+ID4gPiA+ID4gcGVyIHZlbmRv
ci4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGVzdGVkIG9uIGkuTVg2USB3aXRoIGEgU2Ftc3VuZyBO
QU5EIGZsYXNoIGNoaXAgdGhhdCBkb2Vzbid0Cj4gPiA+ID4gPiBzdXBwb3J0Cj4gPiA+ID4gPiBz
ZXF1ZW50aWFsIHJlYWRzLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBGaXhlczogMDAzZmU0Yjk1NDVi
ICgibXRkOiByYXduYW5kOiBTdXBwb3J0IGZvciBzZXF1ZW50aWFsCj4gPiA+ID4gPiBjYWNoZQo+
ID4gPiA+ID4gcmVhZHMiKQo+ID4gPiA+ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiA+
ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFJvdXZlbiBDemVyd2luc2tpCj4gPiA+ID4gPiA8ci5jemVy
d2luc2tpQHBlbmd1dHJvbml4LmRlPsKgwqDCoCAgIAo+ID4gPiA+IAo+ID4gPiA+IFRoYW5rcyBm
b3IgdGhpcy4gSXQgd29ya3MgYXMgZXhwZWN0ZWQgZm9yIG15IFRvc2hpYmEgY2hpcCwKPiA+ID4g
PiBvYnZpb3VzbHkKPiA+ID4gPiBiZWNhdXNlIGl0IGRvZXNuJ3QgdXNlIE9ORkkgb3IgSkVERUMu
Cj4gPiA+ID4gCj4gPiA+ID4gVW5mb3J0dW5hdGVseSwgbXkgTWljcm9uIGNoaXAgZG9lcyB1c2Ug
T05GSSwgYW5kIGl0IHNldHMgdGhlCj4gPiA+ID4gY2FjaGVkLQo+ID4gPiA+IHJlYWQtc3VwcG9y
dGVkIGJpdC4gSXQgdGhlbiBmYWlscyB3aGVuIHJlYWRpbmcgYWZ0ZXJ3b3JkczogIAo+ID4gCj4g
PiBJIG1pZ2h0IGhhdmUgb3ZlciByZWFjdGVkIHJlZ2FyZGluZyBteSBmaW5kaW5ncyBpbiBNaWNy
b24ncwo+ID4gZGF0YXNoZWV0LAo+ID4gSSBuZWVkIHRvIGtub3cgaWYgeW91IHVzZSB0aGUgb24t
ZGllIEVDQyBlbmdpbmUgb3IgaWYgeW91IHVzZSB0aGUgb25lCj4gPiBvbiB0aGUgY29udHJvbGxl
ci4gSW4gdGhlIGZvcm1lciBjYXNlIHRoZSBmYWlsdXJlIGlzIGV4cGVjdGVkLiBJbiB0aGUKPiA+
IGxhdHRlciBjYXNlLCBpdCdzIG5vdC4gIAo+IAo+IEkgdXNlIHRoZSBkZWZhdWx0LCB3aGljaCBz
ZWVtcyB0byBiZSB0aGUgY29udHJvbGxlciBlbmdpbmU/CgpZZWFoLCB5b3UncmUgdXNpbmcgdGhl
IGdwbWkgTkFORCBjb250cm9sbGVyIHJpZ2h0PyBJZiB0aGF0J3MgdGhlIGNhc2UsCml0IHNlZW1z
IHRoYXQgb25seSBFQ0MgY29ycmVjdGlvbiBpcyBzdXBwb3J0ZWQuCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
