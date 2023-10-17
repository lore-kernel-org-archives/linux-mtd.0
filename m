Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6ECCDB482
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Oct 2023 13:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JYy4vOkaC7VYdgOZRQ1eExRL1tRwzqfViuTH6dyeU7Q=; b=NmB8jJp0POZpez
	KzhMXrAYvOKNDW8kCcngx6zuNQuuD4fYaUTBBENrMf975YpoTodOV1G9j6Ero3lAbyjVxzsoiObEH
	CenfrO95eRkxHGSd4DI0dpHKkS/rEppp3FdL9u2/Nk0S7CjJR1b4atGobTir1ojcvPAZlJ21Lb8Oe
	/E0cJ/e68ZlHsPtaAaVZgusYmj4qJ/W0Un7eSQJ1y+m7fHzMlFL09B15uteicdHE8NEuVY35hWiTo
	drSd2tIFO9Q8tmiiyppsUHHyoc4Oqu2deUpEsY81Qr9OOzYQJ3waFzwK3HyAJOV5wAY0GDtibuB6M
	BJb/sb/DsjO2mbzUX4AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qskYB-00CT5i-1X;
	Tue, 17 Oct 2023 13:55:59 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qskY7-00CT4m-2w
	for linux-mtd@lists.infradead.org;
	Tue, 17 Oct 2023 13:55:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D77461BF20C;
	Tue, 17 Oct 2023 13:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697550951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Z6gVCFPuEuJIFunX0VOelwyUIXfBj0PBvgXhm0ZGQQ=;
	b=Wgds58OkXOn8H5VPDGztH7JkI+hlB5VsgKWSl8e9uMvWgKbC9XOOXpR6lzLGY/HrhLu0MW
	r6+8zj+p6OnfePnwdPAt8lPirYYgGlk5er4MbgplmdwoacJpd3lrP0Q2x6C2UTW3sBmkGA
	xajpZ01MaV7XC2hzCtBvWmrWBDNnLTuIm9W4JUaA48R/kp0uXtGPnaJjP+dO55yHHNbxHU
	fH1cblDDL81jl3Xx4eqtotvJt6l9bUilLIC1Tpws3+yQCbgD80MzjUtgXUBXGS9aaBADju
	IBLXLbCv5iy5P7hmaeSsREu7q2gRRODj0+iQoFkrunFEG/x/iYX6jjjmRL+3Iw==
Date: Tue, 17 Oct 2023 15:55:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Lubart, Vitaly" <vitaly.lubart@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Winkler, Tomas" <tomas.winkler@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 06/10] drm/i915/spi: spi register with mtd
Message-ID: <20231017155544.6cceb6a6@xps-13>
In-Reply-To: <CY5PR11MB6366850CCE851BCA05A9DC2BEDD6A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20230910123949.1251964-1-alexander.usyskin@intel.com>
	<20230910123949.1251964-7-alexander.usyskin@intel.com>
	<20231016103939.67445bee@xps-13>
	<CY5PR11MB6366850CCE851BCA05A9DC2BEDD6A@CY5PR11MB6366.namprd11.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_065556_258950_B91F0E69 
X-CRM114-Status: GOOD (  13.98  )
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

SGkgQWxleGFuZGVyLAoKYWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29tIHdyb3RlIG9uIFR1ZSwg
MTcgT2N0IDIwMjMgMTE6NTQ6NDEgKzAwMDA6Cgo+IEhpIE1pcXVlbCwgCj4gCj4gPiA+ICtzdGF0
aWMgaW50IGk5MTVfc3BpX2luaXRfbXRkKHN0cnVjdCBpOTE1X3NwaSAqc3BpLCBzdHJ1Y3QgZGV2
aWNlICpkZXZpY2UsCj4gPiA+ICsJCQkgICAgIHVuc2lnbmVkIGludCBucGFydHMpCj4gPiA+ICt7
Cj4gPiA+ICsJdW5zaWduZWQgaW50IGk7Cj4gPiA+ICsJdW5zaWduZWQgaW50IG47Cj4gPiA+ICsJ
c3RydWN0IG10ZF9wYXJ0aXRpb24gKnBhcnRzID0gTlVMTDsKPiA+ID4gKwlpbnQgcmV0Owo+ID4g
PiArCj4gPiA+ICsJZGV2X2RiZyhkZXZpY2UsICJyZWdpc3RlcmluZyB3aXRoIG10ZFxuIik7Cj4g
PiA+ICsKPiA+ID4gKwlzcGktPm10ZC5vd25lciA9IFRISVNfTU9EVUxFOwo+ID4gPiArCXNwaS0+
bXRkLmRldi5wYXJlbnQgPSBkZXZpY2U7Cj4gPiA+ICsJc3BpLT5tdGQuZmxhZ3MgPSBNVERfQ0FQ
X05PUkZMQVNIIHwgTVREX1dSSVRFQUJMRTsKPiA+ID4gKwlzcGktPm10ZC50eXBlID0gTVREX0RB
VEFGTEFTSDsKPiA+ID4gKwlzcGktPm10ZC5wcml2ID0gc3BpOwo+ID4gPiArCXNwaS0+bXRkLl93
cml0ZSA9IGk5MTVfc3BpX3dyaXRlOwo+ID4gPiArCXNwaS0+bXRkLl9yZWFkID0gaTkxNV9zcGlf
cmVhZDsKPiA+ID4gKwlzcGktPm10ZC5fZXJhc2UgPSBpOTE1X3NwaV9lcmFzZTsKPiA+ID4gKwlz
cGktPm10ZC5fZ2V0X2RldmljZSA9IGk5MTVfc3BpX2dldF9kZXZpY2U7Cj4gPiA+ICsJc3BpLT5t
dGQuX3B1dF9kZXZpY2UgPSBpOTE1X3NwaV9wdXRfZGV2aWNlOwo+ID4gPiArCXNwaS0+bXRkLndy
aXRlc2l6ZSA9IFNaXzE7IC8qIDEgYnl0ZSBncmFudWxhcml0eSAqLyAgCj4gPiAKPiA+IFlvdSBz
YXkgd3JpdGVzaXplIHNob3VsZCBiZSBhbGlnbmVkIHdpdGggNCBpbiB5b3VyIG5leHQgcGF0Y2g/
ICAKPiAKPiBXZSBzdXBwb3J0IHVuYWxpZ25lZCB3cml0ZSBieSByZWFkaW5nIGFsaWduZWQgNGJ5
dGVzLAo+IHJlcGxhY2luZyBjaGFuZ2VkIGJ5dGVzIHRoZXJlIGFuZCB3cml0aW5nIHdob2xlIDRi
eXRlcyBiYWNrLgo+IElzIHRoZXJlIGFueSBwcm9ibGVtIHdpdGggdGhpcyBhcHByb2FjaD8KCklz
IHRoZXJlIGEgcmVhc29uIHRvIGRvIHRoYXQgbWFudWFsbHkgcmF0aGVyIHRoYW4gbGV0dGluZyB0
aGUgY29yZQpoYW5kbGUgdGhlIGNvbXBsZXhpdHk/Cgo+IAo+ID4gICAKPiA+ID4gKwlzcGktPm10
ZC5lcmFzZXNpemUgPSBTWl80SzsgLyogNEsgYnl0ZXMgZ3JhbnVsYXJpdHkgKi8KPiA+ID4gKwlz
cGktPm10ZC5zaXplID0gc3BpLT5zaXplOwo+ID4gPiArICAKPiAKCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
