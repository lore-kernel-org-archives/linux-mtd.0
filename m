Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706BC606A31A
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2026 13:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iL67ZoVt;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HXMPqtaF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QM67lCOghuuPfha0aDW6nwt5RxQK37K7yus70h/Cruc=; b=iL67ZoVtIrl3DEH8OGY8Lp8WCx
	To1whaR5n7OLGv6L0bbWpujkE1LGaE/008AN0YM1iwubE4Vhige+U7LH8Xi5Y/KRvILhyyvlpKrjM
	i00fxrV3yXJRklUJoimT5Bf0yog/VuI6S0ceh1bJkAUXn/6B6vrZEt1cy9ouNuDQCYkbax3Dm/PbM
	QWy4lVDLbr0DZv8ZxMNpw8Q0RA1LV3SArdmJuVzZI2A4ZKy5KwhQJQsZB6eX8nvlHgYeM3E6ev+qp
	okpJWPMaDtSnWXmHKbXJbVenIVNxpFZI8QOYW70c8koZofPEl0WoK1Q88UgfBM4DhNKc1WpeVhsCi
	5YxevzHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3Uv-0000000720k-0ajL;
	Wed, 28 Oct 2026 13:15:21 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3Ur-00000007204-2A6h
	for linux-mtd@lists.infradead.org;
	Wed, 28 Oct 2026 13:15:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4EB1CC4FED3;
	Wed, 28 Oct 2026 13:16:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5765360769;
	Wed, 28 Oct 2026 13:15:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 60B931032904F;
	Wed, 28 Oct 2026 14:15:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793193309; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=X9Btf5XhOqdmeGG64jS4Slgjum0vmoxQYvsMqkyuAm0=;
	b=HXMPqtaFe6tOTgCdgNq63gOjGLoD81XTo0eU2xSORaqhJYxwUFPh1DuTFkrKOTl/bDr90D
	sZslTZoFozi9koBKKQ5/LjyLJrpC8KNB5hc055TsS/ZHXQG/GpyUEtqdOZCRmGdPS6mhZk
	xpKAka+Nkx1+rdLCmeIQzx71XcRzp08jpTgyLfoiY1a0MhBhU4V7ICiD0A8Re4mkUjyhgA
	NS2LFXXIFHaiYE2WIBYiiv2f2R0MC945QYx//nwxVgN5tqq2TTt74Aw1xBAkavdSYarpd+
	Hz1miIjW61CvLfUIaEdOaI4A4cbE9RDUkutMfmpqjj1jsm22qwHxi/0bOMotlg==
Message-ID: <cf96edf1cba37b775817d4df5f759b10e71c73da.camel@bootlin.com>
Subject: Re: [PATCH v4 0/7] spi: Add support for panic mem writes
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
  Takahiro Kuwano <takahiro.kuwano@infineon.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger	 <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Kees Cook	 <kees@kernel.org>, Tony Luck
 <tony.luck@intel.com>, "Guilherme G . Piccoli"	 <gpiccoli@igalia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, Bharat Bhushan <bbhushan2@marvell.com>, Sunil
 Kovvuri Goutham <sgoutham@marvell.com>, Tanmay Jagdale <tanmay@marvell.com>
Date: Wed, 28 Oct 2026 14:15:00 +0100
In-Reply-To: <8979e4ad-5209-4fb0-bd3e-95919849d2fa@sirena.org.uk>
References: <20261016102917.171095-1-paul.cercueil@bootlin.com>
	 <fdc79c99e3045635841f68c89fec3b9d9e2f7233.camel@bootlin.com>
	 <8979e4ad-5209-4fb0-bd3e-95919849d2fa@sirena.org.uk>
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_061517_747650_77FEF47D 
X-CRM114-Status: GOOD (  18.55  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TGUgbWVyY3JlZGkgMjggb2N0b2JyZSAyMDI2IMOgIDEyOjU5ICswMDAwLCBNYXJrIEJyb3duIGEg
w6ljcml0wqA6Cj4gT24gV2VkLCBPY3QgMjgsIDIwMjYgYXQgMTE6NDI6MzNBTSArMDEwMCwgUGF1
bCBDZXJjdWVpbCB3cm90ZToKPiA+IAo+ID4gSSBoYXZlIGEgc2Vjb25kIHBhdGNoc2V0IGZvciBz
cGktY2FkZW5jZS14c3BpIHBlbmRpbmcgKHVucmVsYXRlZCB0byB0aGlzCj4gPiBvbmUpCj4gPiB0
aGF0IGhhcHBlbnMgdG8gaGF2ZSBzb21lIEZpeGVzOiB0YWdzLCBhbmQgdGhvc2UgZml4ZXMgY29u
ZmxpY3Qgc2xpZ2h0bHkKPiA+IHdpdGgKPiA+IHRoZSBjaGFuZ2VzIGhlcmUuCj4gCj4gPiBJJ20g
dGhpbmtpbmcgdGhhdCBpbiBvcmRlciB0byBtYWtlIGl0IGVhc2llciB0byBiYWNrcG9ydCB0aG9z
ZSBmaXhlcyB0bwo+ID4gb2xkZXIKPiA+IGtlcm5lbHMsIG15IG90aGVyIHBhdGNoc2V0IHNob3Vs
ZCBiZSBtZXJnZWQgZmlyc3QuIFNvIEkgZ3Vlc3MgSSdsbCB2NSB0aGlzCj4gPiBvbmUKPiA+IHdp
dGggYSByZWJhc2Ugb25jZSB0aGUgb3RoZXIgb25lIGlzIGluLgo+IAo+IEkgaGF2ZSBubyBpZGVh
IHdoYXQgdGhhdCBvdGhlciBwYXRjaCBzZXQgaXMsIHNvcnJ5LgoKQmVjYXVzZSBJIGhhdmVuJ3Qg
c2VudCB0aGUgb3RoZXIgb25lIHlldC4gSSdtIGp1c3Qgc2F5aW5nIHRoYXQgc2luY2UgaXQgaGFz
CmZpeGVzIGl0IHNob3VsZCBwcm9iYWJseSBnbyBmaXJzdCB0byBtYWtlIGl0IGVhc2llciB0byBi
YWNrcG9ydCB0aG9zZS4gQmFzaWNhbGx5CkknbSBqdXN0IHNheWluZyAiZG9uJ3QgcGljayB0aGlz
IG9uZSBxdWl0ZSB5ZXQiLgoKPiA+IEBNYXJrLCBkbyB5b3Ugd2FudCBtZSB0byB3YWl0IGZvciAt
cmMxIHRvIHNlbmQgaXQgdG8geW91Pwo+IAo+IFBsZWFzZSByZXNlbmQgYW55IG5ldyBmZWF0dXJl
IHdvcmsgYWZ0ZXIgLXJjMS7CoCBQbGVhc2UgYWxzbyBkbyBub3QKPiBtaXNzcGVsbCBteSBuYW1l
LgoKWW91ciBuYW1lIGlzIG5vdCBNYXJrPyBPciB3aGVyZSBkaWQgSSBtaXNzcGVsbCBpdD8KCkNo
ZWVycywKLVBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
