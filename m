Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D02FCA0FED
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 14:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C+Cgn29jdEi31BBdIxKMPgpASJ1cornrlXYVNnWEgGk=; b=r7CfFA7+fBaFyD
	d+lruhyw7k/WpHC+sduvCzYAInkEtrtc+RCjtSnlEBTAKTCI3XhscYn7X7kKmobcOad0r7egjZwqc
	EX2Q5bnxQrOiA146/V66l2gu7F1LYoXcgJ/gSqY+ZqOh9NDWi8KyvUGb0nmhEpEojwPxV4QnJu9vS
	HtlEQaihyCbwvydQ8eTvSF+CLrISLi8oZbfpQrGc50l0+yr/nrUwIh9dtbN7Z+Z17x5q0PAzVqFNO
	3/Fk58nGdqEg+I/CtUDC0IhcrX4b/B2aw/DVoKYbTRHWJ1C51slPSVMV/g/lZJa3jyYlyFFPkGu+4
	iALz6c2IgtYndV9CU4Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwM4w-0000000EpeN-085C;
	Wed, 10 Sep 2025 14:45:46 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwM4r-0000000EpaH-2Bi2
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 14:45:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9E37A4E40B9A;
	Wed, 10 Sep 2025 14:45:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 86590606D4;
	Wed, 10 Sep 2025 14:45:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9AB50102F2884;
	Wed, 10 Sep 2025 16:45:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757515537; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yot0d5/bHGrsIZR1cYh+Nq5eBvh863Ov45/WQoG5A+I=;
	b=WohuC0LWq+fsvqCaFfYbPMIUZjdkl4ni6kJn+6pymnaxBeI8a3Wm3fdE5xcBwBgCKrDc4g
	q4m9BGEFQVGBQ2ODCBNgJ9YfJvpNgigl2B3BEazFHA9brmWrq9mV1lDf16pN/WTrAM1oR2
	LbvcT3fGgoYGEW0864QEFu/LMR8/Yx1qCB+oFZveftQRSmBfHF+VbrrP0Sm3xp/nOEudO7
	FrdQQ8tyf6eoWwTQryCx1Wkl2y9U0UoTMIRmBr2EQKK0GZ80hjoMyODQipkiJbwx8FWSlS
	LgbWm9zDdRZc9hPncaxqCwAWLb5lCnlAA0RCyOkCkoz88WAsWpE14XnR0g7luQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Jakub \"Kuba\" Czapiga" <czapiga@google.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,  Konrad
 Adamczyk <konrada@google.com>,  Adeel Arshad <adeel.arshad@intel.com>,
  Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] mtd: spi-nor: core: Check read CR support
In-Reply-To: <CABkukdpRxHFg9FbaV1GnS5UG3-ZxdxPbjKYdUpdmvOcLs5phKA@mail.gmail.com>
	(Jakub Czapiga's message of "Wed, 10 Sep 2025 16:30:43 +0200")
References: <20250910103355.629421-1-czapiga@google.com>
	<87frcucy3p.fsf@bootlin.com>
	<CABkukdpRxHFg9FbaV1GnS5UG3-ZxdxPbjKYdUpdmvOcLs5phKA@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 10 Sep 2025 16:45:28 +0200
Message-ID: <87a532cqnr.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_074541_700174_FCAA3A5B 
X-CRM114-Status: GOOD (  15.97  )
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

SGVsbG8sCgpPbiAxMC8wOS8yMDI1IGF0IDE2OjMwOjQzICswMiwgIkpha3ViIFwiS3ViYVwiIEN6
YXBpZ2EiIDxjemFwaWdhQGdvb2dsZS5jb20+IHdyb3RlOgoKPiBIaSBNaXF1w6hsLAo+Cj4gT24g
V2VkLCBTZXAgMTAsIDIwMjUgYXQgMjowNeKAr1BNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXlu
YWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Pgo+PiBIaSBKYWt1YiwKPj4KPj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUu
Ywo+PiA+IGluZGV4IGFjNGI5NjAxMDFjYy4uNzlkZWVlM2E1MGQzIDEwMDY0NAo+PiA+IC0tLSBh
L2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4+ID4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5v
ci9jb3JlLmMKPj4gPiBAQCAtMjYwOCw2ICsyNjA4LDEwIEBAIHN0YXRpYyBpbnQgc3BpX25vcl9z
ZXR1cChzdHJ1Y3Qgc3BpX25vciAqbm9yLAo+PiA+ICAgICAgICAgICAgICAgfQo+PiA+ICAgICAg
IH0KPj4gPgo+PiA+ICsgICAgIC8qIFNvbWUgU1BJIGNvbnRyb2xsZXJzIG1pZ2h0IG5vdCBzdXBw
b3J0IENSIHJlYWQgb3Bjb2RlLiAqLwo+PiA+ICsgICAgIGlmIChzcGlfbm9yX3JlYWRfY3Iobm9y
LCBub3ItPmJvdW5jZWJ1ZikgPT0gLUVPUE5PVFNVUFApCj4+Cj4+IFRoZXJlIGlzIGEgc3BpX25v
cl9zcGltZW1fY2hlY2tfb3AoKSBoZWxwZXIgd2hpY2ggbWlnaHQgYmUgYmV0dGVyIHN1aXRlZAo+
PiBmb3IgdGhpcyBwdXJwb3NlPwo+Cj4gc3BpX25vcl9zcGltZW1fY2hlY2tfb3AoKSB3b3JrcyBv
bmx5IGZvciBzcGktbWVtIGRldmljZXMuIHNwaV9ub3JfcmVhZF9jcigpCj4gaGFuZGxlcyBib3Ro
IHNwaS1tZW0gYW5kIHNwaS1ub3IgY29udHJvbGxlci4gVXNpbmcgc3BpX25vcl9zcGltZW1fY2hl
Y2tfb3AoKQo+IHdvdWxkIHJlcXVpcmUgYWRkaW5nIGEgdmFyaWF0aW9uIG9mIHNwaV9ub3JfcmVh
ZF9jcigpIHRoYXQgd291bGQgdXNlCj4gc3BpX25vcl9zcGltZW1fY2hlY2tfb3AoKSBmb3Igc3Bp
LW1lbSBhbmQgc3BpX25vcl9jb250cm9sbGVyX29wc19yZWFkX3JlZygpCj4gZm9yIHNwaS1ub3Ig
Y29udHJvbGxlci4KPiBBbm90aGVyIHdheSB3b3VsZCBiZSB0byBkbyB0aGlzIGNoZWNrIG9ubHkg
Zm9yIHRoZSBzcGktbWVtIGFzIHNwaS1ub3IKPiBjb250cm9sbGVycyBzZWVtIHRvIGJlIGRlcHJl
Y2F0ZWQgaW4gZmF2b3VyIG9mIHNwaS1tZW0uCgpJJ2xsIGxldCB0aGF0IGNob2ljZSB0byBTUEkg
Tk9SIG1haW50YWluZXJzIGJ1dCB3ZSd2ZSBjb2xsZWN0aXZlbHkgYXNrZWQKdG8gc3dpdGNoIGlu
IGZhdm9yIG9mIHRoZSBzcGkgbWVtb3J5IEFQSSBmb3IgcXVpdGUgc29tZSB0aW1lLCBJIHdvdWxk
Cm5vdCBjYXJlIHRvbyBtdWNoIGFib3V0IGNvbXBhdGliaWxpdHkgd2l0aCB0aGUgdHdvIHJlbWFp
bmluZyBjb250cm9sbGVycwp0aGF0IGhhdmUgbm90IHlldCBiZWVuIGNvbnZlcnRlZC4KCkJ1dCBo
ZXJlIGlzIGEgcHJvcGVyIGlsbHVzdHJhdGlvbiB3aHkgc3BpLW1lbSByb2NrcyBhbmQgd2h5IFNQ
SSBOT1IKY29udHJvbGxlcnMsIGJlc2lkZXMgbWFraW5nIG5vIHNlbnNlIChiZWNhdXNlIHdlIGFs
c28gaGF2ZSBTUEkgTkFORHMKbm93KSBoYXZlIGEgZmxhY2t5IEFQSSBhcyBvZiB0b2RheSdzIHN0
YW5kYXJkcy4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
