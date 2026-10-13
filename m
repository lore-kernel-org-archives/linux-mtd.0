Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9562CC6B12
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 15:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O2gV8zJnRxUPp/iO2SFIO2z3wZGIpONVmvIRBXXrPzs=; b=Xvnv2eTUE6ylNG
	p34gTNtFV+SbaShrTU6PT+/pgNWkne6A9weAcEqlToCgg05bfz0L6uQxamoYTt74Bwykaww1ZoWDg
	nUgRJq1gl7N06tpYFdXyh2HKaNW+sV1P9R7W2RNbMMtZ67b7gZAC9XyYai2K4Y/nksL9cHrzjWUgF
	cMDorH+vuIcX3ZouKPUNPfARTJ/GWrwAmglmWWYiLEs0Zce1IQmjUNiuJ520+P+WL7sBLwlgOztkB
	E0QOzHdFL1FvBGlUObfNjxiwTYeI10xYN6HnNh1BlUOYDt4LhmPYpyT8fRknqUaN8jds5pe5eOA5z
	c8qu/F2PgRB5/54scYqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeRy-0000000DLWr-3Dmi;
	Tue, 13 Oct 2026 15:29:58 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeRv-0000000DLVf-14gZ
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 15:29:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A7B654E4120D;
	Tue, 13 Oct 2026 15:29:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73E8E60362;
	Tue, 13 Oct 2026 15:29:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E5E411D716D0;
	Tue, 13 Oct 2026 17:29:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791905386; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=P/nWjSBdkKSblDwKpRFQB9IqO9R3gTyrpmyYCQVnZdE=;
	b=fpCWDA7GLpniLZmDeKe916+BkIHrnGUnPTvAbKqk5N2p/G5/78/2au5FbTfgd7zcmBfJHJ
	HxSRTjmEgeT6r1lpTZqEpH512OSVYYJYnn65yP+nHtcWbr2tCaggl8ybw0OANHVyv3zjjE
	S5lEqeSdsq/u48pzymNnNSUCyVnH+EAYKYHnhAHm6s/CruyL/NJJfo1T/Kq6wYI8j1p1cR
	mBD3dQ0KgksmghfORMdBTE96bOo/S9rPPtUv+mx3nLTNspsUWqO5FtadD/neSQrnnuzcdL
	ZdoTWPGAT555IknknlLgOBXuIOb0kK6DU+Jq8XGEjhI6UX8p5mT9Jw/4zJDgKQ==
Message-ID: <5ce5ffcd7c38e4fe9f972937954dd177fb631bce.camel@bootlin.com>
Subject: Re: [PATCH v2 2/7] mtd: spi-nor: Wait for NOR ready with
 poll_timeout_us()
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: sashiko-reviews@lists.linux.dev, Pratyush Yadav <pratyush@kernel.org>, 
 Michael Walle <mwalle@kernel.org>, Takahiro Kuwano
 <takahiro.kuwano@infineon.com>, Miquel Raynal	 <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, Thomas Petazzoni	
 <thomas.petazzoni@bootlin.com>
Cc: Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme
 G . Piccoli" <gpiccoli@igalia.com>, linux-mtd@lists.infradead.org, Bharat
 Bhushan <bbhushan2@marvell.com>,  Sunil Kovvuri Goutham	
 <sgoutham@marvell.com>, Tanmay Jagdale <tanmay@marvell.com>
Date: Tue, 13 Oct 2026 17:29:36 +0200
In-Reply-To: <sashiko-outbox-169912@kernel.org>
References: <20261013141350.189996-1-paul.cercueil@bootlin.com>
	 <20261013141350.189996-3-paul.cercueil@bootlin.com>
	 <sashiko-outbox-169912@kernel.org>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_082955_439488_7A802862 
X-CRM114-Status: GOOD (  17.02  )
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

SGkgU2FzaGlrbywKCkxlIG1hcmRpIDEzIG9jdG9icmUgMjAyNiDDoCAxNDozMCArMDAwMCwgc2Fz
aGlrby1ib3RAa2VybmVsLm9yZyBhIMOpY3JpdMKgOgo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250
cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDEgcG90ZW50aWFsIGlzc3VlKHMpCj4g
dG8gY29uc2lkZXI6Cj4gLSBbSGlnaF0gbXRkOiBzcGktbm9yOiAzMi1iaXQgaW50ZWdlciBvdmVy
ZmxvdyBpbiB0aW1lb3V0X21zICogMTAwMAo+IC0tCj4gCj4gY29tbWl0IGQ4OGYzMjlhY2E0YjU3
ZGI1ZTRiYTBhMGZjNzQ4ZWU0ZDc0NDBhYmEKPiBBdXRob3I6IFRhbm1heSBKYWdkYWxlIDx0YW5t
YXlAbWFydmVsbC5jb20+Cj4gCj4gbXRkOiBzcGktbm9yOiBXYWl0IGZvciBOT1IgcmVhZHkgd2l0
aCBwb2xsX3RpbWVvdXRfdXMoKQo+IAo+IEluc3RlYWQgb2YgcG9sbGluZyBmb3IgdGhlIHNwaV9u
b3JfcmVhZHkoKSB3aXRoIGEgY3VzdG9tIGxvb3AsIHVzZQo+IHBvbGxfdGltZW91dF91cygpLiBU
aGUgc2xlZXAgcGVyaW9kIGJldHdlZW4gdHdvIHBvbGxzIGlzIHNldCB0byAxMDAgdXMKPiB3aGlj
aCBJIHRoaW5rIHNob3VsZCBiZSBmaW5lLgo+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L3NwaS1ub3IvY29yZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiA+IGluZGV4IDhi
YzExN2I0NmUwMjguLjI1MDlmYjk4M2Q0ZjIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9z
cGktbm9yL2NvcmUuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiBbIC4u
LiBdCj4gPiBAQCAtNzEyLDI5ICs3MTMsMjEgQEAgc3RhdGljIGludCBzcGlfbm9yX3JlYWR5KHN0
cnVjdCBzcGlfbm9yICpub3IpCj4gPiDCoCAqIFJldHVybjogMCBvbiBzdWNjZXNzLCAtZXJybm8g
b3RoZXJ3aXNlLgo+ID4gwqAgKi8KPiA+IMKgc3RhdGljIGludCBzcGlfbm9yX3dhaXRfdGlsbF9y
ZWFkeV93aXRoX3RpbWVvdXQoc3RydWN0IHNwaV9ub3IgKm5vciwKPiA+IC0JCQkJCQl1bnNpZ25l
ZCBsb25nCj4gPiB0aW1lb3V0X2ppZmZpZXMpCj4gPiArCQkJCQkJdW5zaWduZWQgbG9uZyB0aW1l
b3V0X21zKQo+ID4gwqB7Cj4gPiAtCXVuc2lnbmVkIGxvbmcgZGVhZGxpbmU7Cj4gPiAtCWludCB0
aW1lb3V0ID0gMCwgcmV0Owo+ID4gKwlpbnQgcmV0LCBzdGF0dXM7Cj4gPiDCoAo+ID4gLQlkZWFk
bGluZSA9IGppZmZpZXMgKyB0aW1lb3V0X2ppZmZpZXM7Cj4gPiAtCj4gPiAtCXdoaWxlICghdGlt
ZW91dCkgewo+ID4gLQkJaWYgKHRpbWVfYWZ0ZXJfZXEoamlmZmllcywgZGVhZGxpbmUpKQo+ID4g
LQkJCXRpbWVvdXQgPSAxOwo+ID4gLQo+ID4gLQkJcmV0ID0gc3BpX25vcl9yZWFkeShub3IpOwo+
ID4gLQkJaWYgKHJldCA8IDApCj4gPiAtCQkJcmV0dXJuIHJldDsKPiA+IC0JCWlmIChyZXQpCj4g
PiAtCQkJcmV0dXJuIDA7Cj4gPiAtCj4gPiAtCQljb25kX3Jlc2NoZWQoKTsKPiA+ICsJcmV0ID0g
cG9sbF90aW1lb3V0X3VzKHN0YXR1cyA9IHNwaV9ub3JfcmVhZHkobm9yKSwgc3RhdHVzLAo+ID4g
KwkJCcKgwqDCoMKgwqAgMTAwLCB0aW1lb3V0X21zICogMTAwMCwgZmFsc2UpOwo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIF5eXl5eXl5eXl5eXl5eXl5eXl4KPiBbU2V2ZXJpdHk6IEhpZ2hdCj4gQ2FuIHRoaXMgbXVs
dGlwbGljYXRpb24gb3ZlcmZsb3cgb24gMzItYml0IHN5c3RlbXM/Cj4gCj4gSW4gc3BpX25vcl9l
cmFzZV9kaWNlKCksIHRoZSB0aW1lb3V0IHNjYWxlcyB3aXRoIHRoZSBmbGFzaCBzaXplLiBGb3Ig
YSAyNTZNQgo+IGZsYXNoLCB0aW1lb3V0X21zIGV2YWx1YXRlcyB0byA0MDAwMFVMICogMTI4ID0g
NSwxMjAsMDAwLgo+IAo+IEJlY2F1c2UgYm90aCBvcGVyYW5kcyBhcmUgMzItYml0IHR5cGVzIG9u
IDMyLWJpdCBwbGF0Zm9ybXMsIHRoZSBhcml0aG1ldGljCj4gY291bGQgb3ZlcmZsb3cgVUxPTkdf
TUFYICg0LDI5NCw5NjcsMjk1KSwgd3JhcHBpbmcgdG8gODI1LDAzMiw3MDQgYmVmb3JlIGJlaW5n
Cj4gaW1wbGljaXRseSBwcm9tb3RlZCB0byB1NjQgaW5zaWRlIHRoZSBwb2xsX3RpbWVvdXRfdXMg
bWFjcm8uCj4gCj4gVGhpcyB0cnVuY2F0ZXMgdGhlIHdhaXQgdGltZW91dCBmcm9tIH44NSBtaW51
dGVzIHRvIH4xMy43IG1pbnV0ZXMsIHdoaWNoIGNvdWxkCj4gY2F1c2UgbGVnaXRpbWF0ZWx5IHNs
b3cgZXJhc2Ugb3BlcmF0aW9ucyBvbiBsYXJnZSBmbGFzaGVzIHRvIHByZW1hdHVyZWx5IGFib3J0
Cj4gd2l0aCAtRVRJTUVET1VULgo+IAo+ID4gKwlpZiAocmV0IDwgMCkgewo+ID4gLQlkZXZfZGJn
KG5vci0+ZGV2LCAiZmxhc2ggb3BlcmF0aW9uIHRpbWVkIG91dFxuIik7Cj4gPiArCQlkZXZfZGJn
KG5vci0+ZGV2LCAiZmxhc2ggb3BlcmF0aW9uIHRpbWVkIG91dFxuIik7Cj4gPiArCQlyZXR1cm4g
cmV0Owo+ID4gKwl9CgpUZWNobmljYWxseSB5b3UncmUgbm90IHdyb25nLCBidXQgdG8gb3ZlcmZs
b3cgdGhlIG11bHRpcGxpY2F0aW9uIGhlcmUsIHlvdSdkCm5lZWQgYSBOT1Igc2l6ZSBvZiBhdCBs
ZWFzdCAoVUlOVDMyX01BWCAvIDQwMDAwICogMk1pQikgfj0gMjEwIEdpQiwgZ29vZCBsdWNrCmZp
bmRpbmcgb25lIG9mIHRoZXNlLgoKSSBndWVzcyBJIG5lZWQgYSB2MyBhbnl3YXksIHNvIEknbGwg
c3dpdGNoICd0aW1lb3V0X21zJyB0byBhIHU2NCB0aGVyZS4KCkNoZWVycywKLVBhdWwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
