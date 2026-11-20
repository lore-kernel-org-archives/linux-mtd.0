Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D4E60A263F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 17:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u3huD0yt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ak10GoM2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fm79jXC2lesiKe0qAbFUIQLJaP4qaiAPhsXd2Fgm2CQ=; b=u3huD0ytOYAqE0awVhvOr3FdFL
	+AO2AEhuUbZXqN/sTGNXvaOaWjMZJPs+pfhHMKPNH8FAxKFu2PFsTu15htpxC34/J/Hz+Wejt9via
	qaPLzwze6p2VX503yT+d1g/4LvN03SuD6R5LRRkPjxID7aejggwU1zdPws8XhcZwLJKyhX1dYVI6f
	Zrl3V5KVZNl08cK/Q0CCTqBst8EIyG2HxcSghG2S1ty0Qao2mhK2yaQF5VL8kW/KgBt+Y4xvpMg4B
	NfWQk/hK1bYABqrpjEiCWiedgsTujNNctcwkA2h/CsluGo+xiPZLN/BEln/x3kNEXTu3dG9+7F0rq
	H5+gC/cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSRQ-0000000Fhmi-45I9;
	Fri, 20 Nov 2026 17:30:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSR7-0000000Fhd4-0T5e
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 17:30:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6372E62C73;
	Fri, 20 Nov 2026 17:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022061F000D1;
	Fri, 20 Nov 2026 17:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195807;
	bh=7bQnDQQGsXh/GfQqynI9Dm1mxtj1RYtKX42i3WjK0mc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ak10GoM21f09UMAhn9xS4VH3KYKUnQpdq4ly5HC3APsfU2fVM1lWOD9p10cFSqZLW
	 AIFEA2iqY8/8f0EbuMkbTU/nfHjeT0lOkETNHBWnrSCju9p14KinKw4cDNpB569+4x
	 9D774GkyoqFCw4z4G0Dl545f+dXZKOhmkRZ9Ci0HdQA9ROgnoI0fa669aoWetma5kk
	 Onlm74kHyq4n1tZKgmatH2HpN2U9PcYBKLOqV5QQOgQxL3kRVlQa2lVm/bb0/KbYHp
	 JzjOsZfh+0qAtIpYwPkVxdAkdKC0SF3YRv29kNhd+UpEL66VeabmcUCxrXJTgOSast
	 fEE+g7KOjKMHA==
Message-ID: <sashiko-outbox-225665@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 10/11] mtd: spi-nand: Set the DQS spi-mem capability
 if available
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Mark Brown" <broonie@kernel.org>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, praneeth@ti.com, u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20261120-winbond-nand-next-phy-tuning-v4-10-8c21e1f71f41@bootlin.com>
References: <20261120-winbond-nand-next-phy-tuning-v4-0-8c21e1f71f41@bootlin.com>
 <20261120-winbond-nand-next-phy-tuning-v4-10-8c21e1f71f41@bootlin.com>
Date: Fri, 20 Nov 2026 17:30:06 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiBzcGluYW5kOiBz
cGlfbWVtX3NldF9kcXNfcGluX2F2YWlsYWJsZSgpIGNhbGxlZCBhZnRlcgogIFNTRFIgbmVnb3Rp
YXRpb24KLS0KCmNvbW1pdCBkZWQxZjAxYjAwYTMzODM4M2VkNGU2MjIyOGY2YjQxNTg1NmM5ZGYz
CkF1dGhvcjogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCm10ZDog
c3BpLW5hbmQ6IFNldCB0aGUgRFFTIHNwaS1tZW0gY2FwYWJpbGl0eSBpZiBhdmFpbGFibGUKClRo
aXMgY29tbWl0IGFkZHMgdGhlIFNQSU5BTkRfSEFTX0RRUyBmbGFnIGFuZCBjYWxscwpzcGlfbWVt
X3NldF9kcXNfcGluX2F2YWlsYWJsZSgpIGluIHNwaW5hbmRfbWF0Y2hfYW5kX2luaXQoKSB3aGVu
IGEKbWF0Y2hlZCBTUEktTkFORCBjaGlwIHN1cHBvcnRzIERRUy4KCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+
IGluZGV4IGZlZTRhNDhiNGM3ZjMuLjZlMWI3OTc2ZDIzNzkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9tdGQvbmFuZC9zcGkvY29yZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5j
Cj4gQEAgLTE3OTcsNiArMTc5Nyw5IEBAIGludCBzcGluYW5kX21hdGNoX2FuZF9pbml0KHN0cnVj
dCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwKPiAgCQkJfQo+ICAJCX0KPiAgCj4gKwkJaWYgKHNw
aW5hbmQtPmZsYWdzICYgU1BJTkFORF9IQVNfRFFTKQo+ICsJCQlzcGlfbWVtX3NldF9kcXNfcGlu
X2F2YWlsYWJsZShzcGluYW5kLT5zcGltZW0pOwo+ICsKPiAgCQkvKiBJL08gdmFyaWFudHMgc2Vs
ZWN0aW9uIHdpdGggb2N0by1zcGkgRERSIGNvbW1hbmRzIChvcHRpb25hbCkgKi8KPiAgCj4gIAkJ
cmV0ID0gc3BpbmFuZF9pbml0X29kdHJfaW5zdHJ1Y3Rpb25fc2V0KHNwaW5hbmQpOwoKW1NldmVy
aXR5OiBNZWRpdW1dClNob3VsZCBzcGlfbWVtX3NldF9kcXNfcGluX2F2YWlsYWJsZSgpIGJlIGNh
bGxlZCByaWdodCBhZnRlcgpzcGluYW5kLT5mbGFncyBpcyBpbml0aWFsaXplZCwgYmVmb3JlIFNT
RFIgb3BlcmF0aW9uIHZhcmlhbnRzIGFyZQpzZWxlY3RlZD8KClBsYWNpbmcgaXQgaGVyZSBsZWF2
ZXMgc3BpbmFuZC0+c3BpbWVtLT5kcXNfcGluIGZhbHNlIHdoaWxlCnNwaW5hbmRfc2VsZWN0X29w
X3ZhcmlhbnQoc3BpbmFuZCwgU1NEUiwgLi4uKSBhbmQKc3BpbmFuZF9zdXBwb3J0X3ZlbmRvcl9v
cHMoc3BpbmFuZCwgaW5mbywgU1NEUikgcnVuLCB3aGljaCBhbHNvIGV2YWx1YXRlCjFTLWNvbW1h
bmQgRFRSIHJlYWQgdmFyaWFudHMgc3VjaCBhcwpTUElOQU5EX1BBR0VfUkVBRF9GUk9NX0NBQ0hF
XzFTXzFEXzhEX09QLgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5k
ZXYvIy9wYXRjaHNldC8yMDI2MTEyMC13aW5ib25kLW5hbmQtbmV4dC1waHktdHVuaW5nLXY0LTAt
OGMyMWUxZjcxZjQxQGJvb3RsaW4uY29tP3BhcnQ9MTAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
