Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8787C47420
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 08:17:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E6BA2074A
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 08:17:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tV83HLcI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E6BA2074A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=al7EVtxGh6Sq/n+/Rfdi6agA95drOqQOAVF6bAJo7R0=; b=tV83HLcI1ZPyWrWHpnPk7ij35
	A+3eSXA1q6LY23RWiE6K0uD68XGgB914WAywrB30ofiajiunc2Ed2mL4xVlvFbhYCGnSSbhzo1rAF
	ReGymjmgbP+/FpR/LmD6U9EKQaRbTnTZoVKGGzP5i9C06cag3Fx3+iAQWdO2zHJ/x0uYbiUIOHm5N
	GxxKznz0tzjfeE3V1W+kOPzcr3+TXgqaD+gKTIF6t5YUwp6T8oKyvVdcD4NgGYwGiC5ihHuSpxQhq
	bn8zUDN9SdQe/lYv/99LQm5bMvhIZfxr7YF7RzRU1WOi+b5ysiLYo1rEXfDzAbOy4k1KftBqZbJ65
	s62AF1G3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNXIQ-0000aO-Gf; Wed, 30 Sep 2020 08:17:06 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNXIO-0000Zj-V5
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 08:17:05 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 2D619E0004;
 Wed, 30 Sep 2020 08:16:59 +0000 (UTC)
Date: Wed, 30 Sep 2020 10:16:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 01/20] mtd: nand: ecc: Add an I/O request tweaking
 mechanism
Message-ID: <20200930101658.024f21d8@xps13>
In-Reply-To: <20200930095308.57acb670@windsurf.home>
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
 <20200929230124.31491-2-miquel.raynal@bootlin.com>
 <20200930095308.57acb670@windsurf.home>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_041705_089079_E4C1094F 
X-CRM114-Status: GOOD (  15.80  )
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
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, ycllin@mxic.com.tw,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

ClRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlIG9u
IFdlZCwgMzAgU2VwCjIwMjAgMDk6NTM6MDggKzAyMDA6Cgo+IEhlbGxvLAo+IAo+IE9uIFdlZCwg
MzAgU2VwIDIwMjAgMDE6MDE6MDUgKzAyMDAKPiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tPiB3cm90ZToKPiAKPiA+ICsJLyogRW5zdXJlIHRoZSByZXF1ZXN0IGNvdmVy
cyB0aGUgZW50aXJlIHBhZ2UgKi8KPiA+ICsJaWYgKHRydWUpIHsvL3RvZG8gKG9yaWctPmRhdGFs
ZW4gPCBuYW5kZGV2X3BhZ2Vfc2l6ZShuYW5kKSkgeyAgCj4gCj4gVGhpcyBUT0RPIGFuZCAiaWYg
KHRydWUpIiBsb29rcyBvZGQuCgpPb3BzLCB0aGlzIGlzIGEgZGVidWdnaW5nIGxlZnRvdmVyOyBJ
IGRvbid0IHJlbWVtYmVyIGdldHRpbmcgYQpjaGVja3BhdGNoIGVycm9yIGZvciB0aGF0LiBTdXJl
bHkgaXQgZGlkIHRob3VnaC4KCj4gCj4gPiArCQljdHgtPmJvdW5jZV9kYXRhID0gdHJ1ZTsKPiA+
ICsJCXR3ZWFrLT5kYXRhb2ZmcyA9IDA7Cj4gPiArCQl0d2Vhay0+ZGF0YWxlbiA9IG5hbmRkZXZf
cGFnZV9zaXplKG5hbmQpOwo+ID4gKwkJdHdlYWstPmRhdGFidWYuaW4gPSBjdHgtPnNwYXJlX2Rh
dGFidWY7Cj4gPiArCQltZW1zZXQodHdlYWstPmRhdGFidWYuaW4sIDB4RkYsIGN0eC0+cGFnZV9i
dWZmZXJfc2l6ZSk7Cj4gPiArCX0KPiA+ICsKPiA+ICsJaWYgKHRydWUpIHsvL3RvZG8gKG9yaWct
Pm9vYmxlbiA8IG5hbmRkZXZfcGVyX3BhZ2Vfb29ic2l6ZShuYW5kKSkgeyAgCj4gCj4gRGl0dG8u
Cj4gCj4gQWxzbywgSSBmaW5kIHRoZSB3b3JkaW5nICJ0d2VhayIgYSBiaXQgdmFndWUsICJ0d2Vh
ayIgcmVhbGx5IG1lYW5zCj4gbm90aGluZyBzcGVjaWZpYy4gV2hhdCBhYm91dCBwcmVwYXJlL3Vu
cHJlcGFyZSBpbnN0ZWFkIG9mIHR3ZWFrL3Jlc3RvcmUgPwoKSSB1bmRlcnN0YW5kIHRoYXQgInR3
ZWFraW5nIiBtaWdodCBiZSBhIGJpdCB0b28gdmFndWUsIGJ1dAp3ZSBhbHJlYWR5IGhhdmUgYSAt
PnByZXBhcmVfaW9fcmVxKCkgaG9vaywgZnJvbSB3aGljaCB3ZSBjYWxsCm5hbmRfZWNjX3R3ZWFy
a19yZXEoKS4gU28gdGhpcyByZWFsbHkgaXMgYSBoZWxwZXIgdGhhdCBpcyBiZWluZyBjYWxsZWQK
dG8gaGlkZSB0aGUgcmVhbCB1c2VyIHJlcXVlc3QgKG1heWJlIGEgZmV3IGJ5dGVzKSwgaW4gZmF2
b3Igb2YgYQonYmlnZ2VyJyBvbmUgKGZ1bGwgcGFnZSkuCgpXaGF0IGFib3V0IG5hbmRfZWNjX2V4
dGVuZC9yZXN0b3JlX3JlcSgpPyBPdGhlciBpZGVhcyB3ZWxjb21lIQoKPiAKPiBBbHNvLCBzaG91
bGRuJ3QgbmFuZF9lY2NfaW5pdF9yZXFfdHdlYWtpbmcoKSBhbHNvIGFsbG9jYXRlIHRoZSBzdHJ1
Y3QKPiBuYW5kX2VjY19yZXFfdHdlYWtfY3R4IHNvIHRoYXQgdGhpcyBzdHJ1Y3R1cmUgcmVtYWlu
cyBpbnRlcm5hbCA/CgpUaGlzIG1lY2hhbmlzbSBpcyBwYXJ0IG9mIHRoZSBFQ0MgZW5naW5lIGxv
Z2ljLCBzbyBpZiB0aGUgc3RydWN0dXJlIGlzCmFsbG9jYXRlZCBieSBuYW5kX2VjY19pbml0X3Jl
cV90d2Vha2luZygpLCBpdCBtZWFucyB0aGF0IHRoZSBmdW5jdGlvbgptdXN0IHJldHVybiBhIHBv
aW50ZXIgdG8gdGhlIGFsbG9jYXRlZCBzdHJ1Y3R1cmUsIHdoaWNoIHNob3VsZCBiZSBzYXZlZApi
eSB0aGUgRUNDIGVuZ2luZSBkcml2ZXIuIEluc3RlYWQsIEkgZGVjaWRlZCB0byBkZWNsYXJlIHRo
ZSAicmVxdWVzdAp0d2Vha2luZyBjb250ZXh0IiB3aXRoaW4gdGhlIEVDQyBlbmdpbmUgY29uZmln
dXJhdGlvbiAod2hpY2ggbWFrZXMKc2Vuc2UgSU1ITykuIFRoaXMgaXMgbW9yZSBvciBsZXNzIHRo
ZSBzYW1lLCBpdCBqdXN0IHByZXZlbnRzIGFuCmV4dHJhICh1c2VsZXNzPykgYWxsb2NhdGlvbi4g
SSBndWVzcyBib3RoIHdvdWxkIHdvcmsgcHJldHR5IG11Y2ggdGhlCnNhbWUuCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
