Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13366D11718
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2024 07:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nkL9yK7FdqF2i6uHXrdRmmb+mx878ElG7UQU4Ano+Gg=; b=QzycmpxDyZVuxl
	OzXCLxJWSNf7F+quT4qtzYF9Ja6iz3sDJwHG9K8ctYeDfwsxZ6n+6idmI3fKOTltZ9Kchg7+ENH3E
	94+JXSLEKmqwkRzQ8AZNGB7Zv6VpgmJ+UF+KH7YUK3wWBPpMLMFsWpQr//Ke+0GUgbD/RQIL4yRFc
	DaRKCeOt7ZjT1ua1WzDZ7nbiB3OxWZnH2732SP548wvsre7FMD9Upv+f+hBjNjgAmS16ddhVFNpRE
	MmPbVf1u2dhKjqF8giapNbRzpkruJjOWsWIx1q/q0T0a9Hfycxwli41u/gIyHeyGz/4lWA32IhPgc
	+ctm1ZV+JlqdAkNskrGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4F3l-00000002qpQ-3DeT;
	Fri, 25 Oct 2024 07:48:37 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4F3i-00000002qoS-2Hrb
	for linux-mtd@lists.infradead.org;
	Fri, 25 Oct 2024 07:48:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C70EE000E;
	Fri, 25 Oct 2024 07:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729842509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NAG+QMDqLiDHqQLqGLWIReQrBYnJu8pHDQ37wRmTSD8=;
	b=VmxWyjqqZd9zicLKRBQDCQe2zDPTgl/CUce9nDNZvlVptE+lMZS8X7p75W8z74k3X3gCGi
	3MhJ90CZxbxFFrSyx9V5pXREQs99eftLDCKxJAFA/da2RIrRM5+GI743mXxM5slw5W5cEv
	vUbOPZb6BbuNxQvy8/2af7hxw3ERs3WjaLziz+fO3IZzC9ns5HIYB0WIuz+ECtOUFrAHrq
	+5t2lgjN/eb75jzW+pp1DwS3kp7gsOYJQ1e7W/j4Htamta03MuXG/dAo6prR/BWKGWYxY8
	zBca7LF6jQ5mJrUG2JkpPWtueaIhp03bAMKKN7tQjXwdnBcgKP5sz7ty7flRLw==
Date: Fri, 25 Oct 2024 09:48:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Kurbanov <mmkurbanov@salutedevices.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Michael Walle" <michael@walle.cc>, Mark Brown <broonie@kernel.org>,
 Chia-Lin Kao <acelan.kao@canonical.com>, Md Sadre Alam
 <quic_mdalam@quicinc.com>, "Ezra Buehler"
 <ezra.buehler@husqvarnagroup.com>, Sridharan S N <quic_sridsn@quicinc.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, Alexey Romanov
 <avromanov@salutedevices.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <kernel@salutedevices.com>
Subject: Re: [PATCH v2 2/5] mtd: spinand: add OTP support
Message-ID: <20241025094825.767c84c7@xps-13>
In-Reply-To: <4ddd0588-0ff5-4c31-94b0-c9f0e453d98f@salutedevices.com>
References: <20240827174920.316756-1-mmkurbanov@salutedevices.com>
	<20240827174920.316756-3-mmkurbanov@salutedevices.com>
	<20241001111225.36cb9701@xps-13>
	<4ddd0588-0ff5-4c31-94b0-c9f0e453d98f@salutedevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_004834_897085_EBA0B240 
X-CRM114-Status: GOOD (  15.63  )
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

SGkgTWFydGluLAoKU29ycnkgZm9yIHRoZSBzbG93IGZlZWRiYWNrLgoKPiA+PiArLyoqCj4gPj4g
KyAqIHNwaW5hbmRfc2V0X210ZF9vdHBfb3BzKCkgLSBTZXQgdXAgT1RQIG1ldGhvZHMKPiA+PiAr
ICogQHNwaW5hbmQ6IHRoZSBzcGluYW5kIGRldmljZQo+ID4+ICsgKgo+ID4+ICsgKiBTZXQgdXAg
T1RQIG1ldGhvZHMuCj4gPj4gKyAqLwo+ID4+ICt2b2lkIHNwaW5hbmRfc2V0X210ZF9vdHBfb3Bz
KHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCkKPiA+PiArewo+ID4+ICsJc3RydWN0IG10
ZF9pbmZvICptdGQgPSBzcGluYW5kX3RvX210ZChzcGluYW5kKTsKPiA+PiArCj4gPj4gKwlpZiAo
IXNwaW5hbmQtPm90cC0+b3BzKSAgCj4gPiAKPiA+IENvdWxkIHdlIHVzZSBzb21ldGhpbmcgZWxz
ZSBhcyBjaGVjaz8gSXQgZmVlbHMgb2RkIHRvIGNoZWNrIGZvciBvdHAgb3BzCj4gPiBhbmQgdGhl
biBqdXN0IGlnbm9yZSB0aGUgZmFjdCB0aGF0IHRoZXkgYXJlIGhlcmUuIE1heWJlIGNoZWNrIG5w
YWdlcyBvcgo+ID4gb3RwX3NpemUoKSA/ICAKPiAKPiBBIGRldmVsb3BlciBtYXkgbm90IHNwZWNp
ZnkgT1RQIGNhbGxiYWNrczoKPiBTUElOQU5EX09UUF9JTkZPKG90cF9wYWdlcywgTlVMTCAvKiBP
VFAgb3BzICovKQoKSXMgdGhpcyByZWFsbHkgYSB2YWxpZCBzaXR1YXRpb24/CgpJbiBzZXRfbXRk
X290cF9vcHMoKSB5b3Ugc2V0IHNwaW5hbmQgZnVuY3Rpb25zIG9ubHkgaWYgdGhlcmUgYXJlIG90
cApvcGVyYXRpb25zLiBGaXJzdCwgaXMgaXQgcmVsZXZhbnQgdG8gY29uc2lkZXIgdGhlIGZhY3Qg
dGhhdCBhIGRldmljZQp3b3VsZCBoYXZlIGFuIG90cCBhbmQgbm90IHByb3ZpZGUgb3BlcmF0aW9u
cz8gT3RoZXJ3aXNlLCBteSBpbml0aWFsCmNvbW1lbnQgd2FzIGFib3V0IHRoZSBmYWN0IHRoYXQg
dGhlIGNoZWNrIHNlZW1zIHVuY29ycmVsYXRlZCB3aXRoIHRoZQpzZWNvbmQgcGFydCBvZiB0aGUg
ZnVuY3Rpb24uCgpNYXliZSBzZXR0aW5nIHRoZXNlIGZ1bmN0aW9ucyBvbmx5IGlmIHJlbGV2YW50
IGlzIHRoZSBiZXN0IGNob2ljZSwgc28KeW91IG5vIGxvbmdlciBoYXZlIHRvIG1ha2UgdGhlIGNo
ZWNrcyBhZnRlciB0aGUgaW5pdC4KCglpZiAob3BzICYmIG9wcy0+ZXJhc2UpCgkJbXRkLT5fb3Rw
X2VyYXNlID0gc3BpbmFuZF9vdHBfZXJhc2U7CgkuLi4KCj8KClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
