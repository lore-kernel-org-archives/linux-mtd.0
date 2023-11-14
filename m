Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABF5C4167D
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Nov 2023 09:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1artU0ccAMnEsLbv482AZiUPIsM4conRbtTtX5ud3ew=; b=HIvUTZD+/ZoU2S
	iu889lZKmF6CEsx8XwdQnZjxZKeplieKgNvVT3ea2u0A1gngbjEhpF8tsg2MTyFWoROk1vjVhlquX
	HErMmHNOyQyYzL8AH98Dsgy2nnkWIdZAClyufm4v17IIzN1hQY7R8egGHj8gKauGIyUN0cn7TViva
	S6Ro+q7qyf3BJob6xkXFUw+xeQEKR2kiYjg9pD7bzG+ZWWoeVYlRCmdeR83PLa7/WQFTvezhETRMV
	M/kD+unEmwViLc6HVHz7hWi0Bgk0k+kcsD1ta4/l1GZoGGRmQ6tQsLKvn2DyXyaR8gkjDlBS4oC/g
	Cr19tVFmtlzDDmX5iOZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2pUI-00FTjv-2w;
	Tue, 14 Nov 2023 09:13:38 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2pUG-00FTiK-1L
	for linux-mtd@lists.infradead.org;
	Tue, 14 Nov 2023 09:13:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF65360006;
	Tue, 14 Nov 2023 09:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699953209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZXmsKLNlIkRZMpVqTBmk5kgsfULJhH/NpiCWOxqXxtY=;
	b=cnhAecl47Pph553zwzCpGbMzCwKPl4F+Aqw9i6T5ZgP9NEYIDf1z1phS/tErjuIK6MPb0H
	dOo15Y2zyGDmq66Y9BvE+eTm+3AesXDFfGevrIT6dLX8seutsVB9tOU/0UpyhTy62RE2tr
	cLdWlgZXg9rk0uGRB+DmEtv+sC4Orw9vfbAmeoESiaMhBsfJYL8slJArKgBuoLo4aPxCkA
	ASQ9/GvIGOzYqAA98R9hcbobLAecCFqxZaH5YqUN/ryCeGuJS+eW9nmZReTG9IvV/5yIsh
	2tBer13nDxMyqAkHcHHEGGF+HZqbeDo0c5Pl6xKePWaTa6VAnh/nOyMxt0lhHg==
Date: Tue, 14 Nov 2023 10:13:24 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Lubart, Vitaly" <vitaly.lubart@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Winkler, Tomas" <tomas.winkler@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, Michael Walle <michael@walle.cc>, Tudor Ambarus
 <tudor.ambarus@linaro.org>
Subject: Re: [PATCH 06/10] drm/i915/spi: spi register with mtd
Message-ID: <20231114101324.39569e96@xps-13>
In-Reply-To: <CY5PR11MB6366383C8C0DCA9B3D41BF63EDB2A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20230910123949.1251964-1-alexander.usyskin@intel.com>
	<20230910123949.1251964-7-alexander.usyskin@intel.com>
	<20231016103939.67445bee@xps-13>
	<CY5PR11MB6366850CCE851BCA05A9DC2BEDD6A@CY5PR11MB6366.namprd11.prod.outlook.com>
	<20231017155544.6cceb6a6@xps-13>
	<CY5PR11MB63663DB0C17321A1A0C46FF3EDD6A@CY5PR11MB6366.namprd11.prod.outlook.com>
	<20231017164615.5b58fcc6@xps-13>
	<CY5PR11MB6366383C8C0DCA9B3D41BF63EDB2A@CY5PR11MB6366.namprd11.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_011336_586396_CC5B0D1D 
X-CRM114-Status: GOOD (  20.68  )
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

SGkgQWxleGFuZGVyLAoKKyBNaWNoYWVsIGFuZCBUdWRvcgoKRm9sa3MsIGFueSBpbnRlcmVzdGlu
ZyB0aG91Z2h0IGFib3V0IHRoZSBiZWxvdyBkaXNjdXNzaW9uPwoKYWxleGFuZGVyLnVzeXNraW5A
aW50ZWwuY29tIHdyb3RlIG9uIFR1ZSwgMTQgTm92IDIwMjMgMDg6NDc6MzQgKzAwMDA6Cgo+ID4g
ICAKPiA+ID4gPiA+ID4gPiArCXNwaS0+bXRkLndyaXRlc2l6ZSA9IFNaXzE7IC8qIDEgYnl0ZSBn
cmFudWxhcml0eSAqLyAgCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFlvdSBzYXkgd3JpdGVzaXpl
IHNob3VsZCBiZSBhbGlnbmVkIHdpdGggNCBpbiB5b3VyIG5leHQgcGF0Y2g/ICAKPiA+ID4gPiA+
Cj4gPiA+ID4gPiBXZSBzdXBwb3J0IHVuYWxpZ25lZCB3cml0ZSBieSByZWFkaW5nIGFsaWduZWQg
NGJ5dGVzLAo+ID4gPiA+ID4gcmVwbGFjaW5nIGNoYW5nZWQgYnl0ZXMgdGhlcmUgYW5kIHdyaXRp
bmcgd2hvbGUgNGJ5dGVzIGJhY2suCj4gPiA+ID4gPiBJcyB0aGVyZSBhbnkgcHJvYmxlbSB3aXRo
IHRoaXMgYXBwcm9hY2g/ICAKPiA+ID4gPgo+ID4gPiA+IElzIHRoZXJlIGEgcmVhc29uIHRvIGRv
IHRoYXQgbWFudWFsbHkgcmF0aGVyIHRoYW4gbGV0dGluZyB0aGUgY29yZQo+ID4gPiA+IGhhbmRs
ZSB0aGUgY29tcGxleGl0eT8KPiA+ID4gPiAgCj4gPiA+IEkgd2FzIG5vdCBhd2FyZSB0aGF0IGNv
cmUgY2FuIGRvIHRoaXMuIFRoZSBjb3JlIGltcGxlbWVudHMgYWJvdmUgbG9naWMKPiA+ID4gaWYg
SSBwdXQgU1pfNCBoZXJlIGFuZCBjYWxsZXIgdHJ5IHRvIHdyaXRlLCBzYXksIG9uZSBieXRlPwo+
ID4gPiBBbmQgc3luYyBtdWx0aXBsZSB3cml0ZXJzPwo+ID4gPiBJZiBzbywgSSBjYW4gcmVtb3Zl
IG1hbnVhbCB3b3JrLCBJIHRoaW5rLCBhbmQgbWFrZSB0aGUgcGF0Y2hlcyBzbWFsbGVyLiAgCj4g
PiAKPiA+IEkgaGF2ZW4ndCBjaGVja2VkIGluIGRldGFpbCBidXQgSSB3b3VsZCBleHBlY3QgdGhp
cyB5ZXMuIFBsZWFzZSBoYXZlIGEKPiA+IHJvdW5kIG9mIHRlc3RzIGFuZCBpZiBpdCB3b3Jrcywg
cGxlYXNlIHNpbXBsaWZ5IHRoaXMgcGFydC4KPiA+IAo+ID4gVGhhbmtzLAo+ID4gTWlxdcOobCAg
Cj4gCj4gV2hlbiBJIHB1dCBTWl80IGhlcmUgdGhlICJtdGRfZGVidWcgaW5mbyAvZGV2L210ZDAi
IHByaW50cyAibXRkLndyaXRlc2l6ZSA9IDQiLAo+IGJ1dCAibXRkX2RlYnVnIHdyaXRlIC9kZXYv
bXRkMCAxMjggMSBjIiBwYXNzZXMgb25lIGJ5dGUgdG8KPiBpOTE1X3NwaV93cml0ZSAobXRkLl93
cml0ZSBjYWxsYmFjaykuCj4gSSBzdXBwb3NlIHRoYXQgbXRkIHN1YnN5c3RlbSBkbyBub3Qgc3Vw
cG9ydCB0aGlzLgo+IE9yIEkgZGlkIHNvbWV0aGluZyB3cm9uZz8KPiAKCgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
