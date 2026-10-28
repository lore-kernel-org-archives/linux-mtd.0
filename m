Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429EF606A331
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2026 13:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fysj5fB6;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=A5RsB8tT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/q/pvLwuROo/bddpPo2nmMWdm9Ry+P1cr/xS7xZgJyE=; b=fysj5fB6yUoxne186n28iKmiSa
	Dfi7NzHjAKsGdIVrRZMBCeZgw8che1e/FsvPauBCCx1bbkqo6k6ZDHfBllQQptFImaNtxePTBUVGX
	I5x2hcuUNSwvBt0wcK/1/rkYzX/4urkFX7fCMACp0qMRRm3+n3KCipDieLsF2cWp1IkenP0iT7k0M
	XWm7Sc8Md3QUO6srjc2MjgC06tFR2hpX5cpjgmemjPqrosBZAAPQ2oP8x7ZSLMdDEfYe+62PmkvgS
	c65eVkOZ+MWZam3zsPZvW31//WPaRHzR7wFZmqqEbAvfpeEZcnEV7qa0MFwccawt69uScay8rIp/2
	OsJdJp6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4BY-0000000790j-2w4b;
	Wed, 28 Oct 2026 13:59:24 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4BW-000000078z9-1C44
	for linux-mtd@lists.infradead.org;
	Wed, 28 Oct 2026 13:59:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5C9391A137B;
	Wed, 28 Oct 2026 13:59:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 27ADC60769;
	Wed, 28 Oct 2026 13:59:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 900DD10328A20;
	Wed, 28 Oct 2026 14:59:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793195954; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BB+XzUMxzQ0SnhM/sFJFKaRajnW0lj1598vyXvwnOP4=;
	b=A5RsB8tTyNgDLEDTiX203yTl+5N75gBBEYltuIcZa5k3tUz3xYuCJBkzGB/vp9WmGmJ9kg
	BWKiFART8WIKzuX1GvYFAoAu5xFeaypJT8Ur/GACFsjZheLVtj2z3z2vfYTyKTzvvEWEIC
	xU3/u1GeFy6jZh2BpzN8JkuAgTSOwbyYmj/1DvXXnh3466E25xLU5Fewj9jIde50Vu7q7D
	cfZvxFQg6DiMzi9QRVPYtg/YVk7n3CxRKH9bdaqiF9gSbA89h8+6SbikyTOhqbZG1VWylo
	9O1vnehH2gpXqormk2L9dcMw+oHUsjpvytees8+85DxGYqHT+jxszXiRftV6Jg==
Message-ID: <7f27a8b7624ddbd0f7d32c27fe3f58df48a08c0d.camel@bootlin.com>
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
Date: Wed, 28 Oct 2026 14:59:03 +0100
In-Reply-To: <8c8cf14d-954f-4b33-a0e7-8524b1596845@sirena.org.uk>
References: <20261016102917.171095-1-paul.cercueil@bootlin.com>
	 <fdc79c99e3045635841f68c89fec3b9d9e2f7233.camel@bootlin.com>
	 <8979e4ad-5209-4fb0-bd3e-95919849d2fa@sirena.org.uk>
	 <cf96edf1cba37b775817d4df5f759b10e71c73da.camel@bootlin.com>
	 <8c8cf14d-954f-4b33-a0e7-8524b1596845@sirena.org.uk>
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_065922_463320_01B6F703 
X-CRM114-Status: GOOD (  12.34  )
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

TGUgbWVyY3JlZGkgMjggb2N0b2JyZSAyMDI2IMOgIDEzOjI1ICswMDAwLCBNYXJrIEJyb3duIGEg
w6ljcml0wqA6Cj4gT24gV2VkLCBPY3QgMjgsIDIwMjYgYXQgMDI6MTU6MDBQTSArMDEwMCwgUGF1
bCBDZXJjdWVpbCB3cm90ZToKPiA+IExlIG1lcmNyZWRpIDI4IG9jdG9icmUgMjAyNiDDoCAxMjo1
OSArMDAwMCwgTWFyayBCcm93biBhIMOpY3JpdMKgOgo+ID4gPiBPbiBXZWQsIE9jdCAyOCwgMjAy
NiBhdCAxMTo0MjozM0FNICswMTAwLCBQYXVsIENlcmN1ZWlsIHdyb3RlOgo+IAo+ID4gPiA+IEBN
YXJrLCBkbyB5b3Ugd2FudCBtZSB0byB3YWl0IGZvciAtcmMxIHRvIHNlbmQgaXQgdG8geW91Pwo+
IAo+ID4gPiBQbGVhc2UgcmVzZW5kIGFueSBuZXcgZmVhdHVyZSB3b3JrIGFmdGVyIC1yYzEuwqAg
UGxlYXNlIGFsc28gZG8gbm90Cj4gPiA+IG1pc3NwZWxsIG15IG5hbWUuCj4gCj4gPiBZb3VyIG5h
bWUgaXMgbm90IE1hcms/IE9yIHdoZXJlIGRpZCBJIG1pc3NwZWxsIGl0Pwo+IAo+IFlvdSBhZGRl
ZCBhIHJhbmRvbSBAIHRvIGl0LgoKSSBkbyB0aGF0IHdoZW4gYWRkcmVzc2luZyBwZW9wbGUgaW4g
ZW1haWxzLCBJIHRob3VnaHQgaXQgd2FzIHVuaXZlcnNhbGx5CnVuZGVyc3Rvb2QuIEknbGwgcmVm
cmFpbiBmcm9tIGRvaW5nIHRoYXQgZnJvbSBub3cgb24uCgpDaGVlcnMsCi1QYXVsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
