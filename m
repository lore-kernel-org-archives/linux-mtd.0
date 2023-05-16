Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E63C77B7F
	for <linux-mtd@archiver.kernel.org>; Tue, 16 May 2023 17:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9NbmJj3xGudz3fqRMFqC/1XV//YJ1LeVnSyEFZFlg4g=; b=PKVzYwyhn6SuhF
	wPtdWqAd94I6ECF1GHYV6LeSG4xVWJu/AcwXWQDMfuTLkm39dH4k2AgrKw2hX5B3NSDKikarUKZ0C
	j+4ug4OitLR2mNdOyJ0bWv0Gto3PNkwVoavbwTpEozElbNr0MQNh3sLy+ZCf8btxoBd3kAo6zVFgh
	rLgSGNeME0tuKcHCPoDhKsO/qiGunL0Gv93isTJAPM8KeLndWjXRf7vfIxPzIdkhxSc2XIdc/0AhV
	CZQH4KkGw/0A7cfKUkMZUaQwJpTdRYPEGqzW3S7YyPiRM1IM4vqHunlOteZNpj8874LqtX4dzzkZe
	oWyq6SSQkh5TJ+Kv+eWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyyQs-006cWL-2X;
	Tue, 16 May 2023 17:25:54 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyyQn-006cUf-0k
	for linux-mtd@lists.infradead.org;
	Tue, 16 May 2023 17:25:51 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C69CB1C0003;
	Tue, 16 May 2023 17:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684257941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aFevxj/rrkp09WHDPC8r1cjBszhyMx/0fchc8f659C8=;
	b=ah0R2drhxSyAsYICQwRvoJcC+ZAwy8OXWfWdXbNqkI7uilswu7AT4Ot1GJ/Ab2D11Owqhl
	ttM8vNs01fx7pam7U/I+/+hqueWpKfsCW+VXTUmx24gVOlYSSVpVElVYKLhXD0YttVol8d
	CkGYLe/Oisveabg+7id3ZwDEqbjsbBWcUs2aGiBsNTqvYZXPuPBvCgwXY/N3GbOqA5YSqX
	jfVWACoboMNH/sDI2sUXzSP5pH6+d1WMq0BlWk4ml4qWy5dq27+IGY+PCe6AbjCHaZZ4oL
	qt8JxscjZICxycfQmByooMkkTZkEfs0IXSkOEda9EaycprL0Bormxjc15jLzBw==
Date: Tue, 16 May 2023 19:25:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: Marvell NFC timings on CN9130
Message-ID: <20230516192538.45b35b6b@xps-13>
In-Reply-To: <17a9eee2-d84f-549d-a5ff-da88d43393c1@alliedtelesis.co.nz>
References: <17a9eee2-d84f-549d-a5ff-da88d43393c1@alliedtelesis.co.nz>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_102549_596759_B866E73A 
X-CRM114-Status: GOOD (  22.07  )
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

SGkgQ2hyaXMhCgpDaHJpcy5QYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubnogd3JvdGUgb24gVHVl
LCAxNiBNYXkgMjAyMyAwNDo0NjozOAorMDAwMDoKCj4gSGkgTWlxdWVsLCBUaG9tYXMsCj4gCj4g
QSBoYXJkd2FyZSBjb2xsZWFndWUgcmVwb3J0ZWQgYSBjb25jZXJuIHRvIG1lIGFib3V0IGEgbmV3
IGRlc2lnbiB3ZSBoYXZlIAo+IHVzaW5nIHRoZSBNYXJ2ZWxsIENOOTEzMCBTb0MgKHdoaWNoIEkg
dGhpbmsgd2FzIGNhbGxlZCBBcm1hZGEtOEsgYmVmb3JlIAo+IHRoZXkgcmVicmFuZGVkKS4KPiAK
PiBCYXNpY2FsbHkgdGhlaXIgY29uY2VybiBpcyB0aGF0IHRoZSB0V0MgdGltaW5nIHRoZXkgb2Jz
ZXJ2ZSBpcyBmYXN0ZXIgCj4gKH4xOG5zKSB0aGFuIHRoZSBkb2N1bWVudGVkIG1pbmltdW0gaW4g
dGhlIGhhcmR3YXJlIGRhdGFzaGVldCBmb3IgdGhlIAo+IENOOTEzMCAoMjVucykuIEFzaWRlIGZy
b20gbm90IG1lZXRpbmcgdGhlIGRhdGFzaGVldCBzcGVjIHdlJ3ZlIG5vdCAKPiBvYnNlcnZlZCBh
bnkgb3RoZXIgaXNzdWUgKHlldCkuCgpJIHdvdWxkIGhhdmUgZXhwZWN0ZWQgdGhlIGNvbnRyb2xs
ZXIgdG8gc3VwcG9ydCBhbG1vc3QgYW55IGtpbmQgb2YKdGltaW5ncywgaW5jbHVkaW5nIFNEUiBF
RE8gbW9kZSA1LiB0V0MgaXMgMjVucyB3aXRoIG1vZGUgNCwgYnV0IDIwIG9uCm1vZGUgNSAoT05G
SSkuIFNvIEkgYmVsaWV2ZSB5b3UncmUgcnVubmluZyBhIHN5c3RlbSB3aXRoIGEgY2hpcCB0aGF0
IGlzCm5vdCBjb21wYXRpYmxlIHdpdGggdGhlIGZhc3Rlc3QgbW9kZS4gSWYgdGhhdCBpcyB0aGUg
Y2FzZSwgaXQgbWF5CmV4cGxhaW4gd2h5IHlvdSBkb24ndCBzZWUgZXJyb3JzIHdpdGggdGhpcyBj
aGlwOiBpdCBtYXkgc3VwcG9ydApzbGlnaHRseSBmYXN0ZXIgdGltaW5ncyB0aGFuIGl0IGFkdmVy
dGlzZXMuCgpBbnl3YXksIGlmIHlvdXIgZmluZGluZ3MgYXJlIHRydWUsIGl0IG1lYW5zIHRoZSBj
dXJyZW50IGltcGxlbWVudGF0aW9uCmlzIHNsaWdodGx5IG91dCBvZiBzcGVjIGFuZCB0aGUgdGlt
aW5nIGNhbGN1bGF0aW9uIG1pZ2h0IHJlcXVpcmUgdG8gYmUKdHdlYWtlZCBhIGxpdHRsZSBiaXQg
dG8gcmVkdWNlIHRXQy4KCj4gSSBub3RpY2UgaW4gdGhlIG1hcnZlbGxfbmFuZC5jIGRyaXZlciB0
aGF0IG1hcnZlbGxfbmZjX2luaXQoKSBzZXRzIHRoZSAKPiBOQU5EIENsb2NrIEZyZXF1ZW5jeSBT
ZWxlY3QgYml0ICgweEYyNDQwNzAwOjApIHRvIDEgd2hpY2ggcnVucyBhY2NvcmRpbmcgCj4gdG8g
dGhlIGRhdGFzaGVldCB0aGUgTkFORCBmbGFzaCBhdCA0MDBNSHogLiBCdXQgdGhlIGNhbGN1bGF0
aW9ucyBpbiAKPiBtYXJ2ZWxsX25mY19zZXR1cF9pbnRlcmZhY2UoKSB1c2UgdGhlIHZhbHVlIGZy
b20gCj4gY2xrX2dldF9yYXRlKG5mYy0+Y29yZV9jbGspIHdoaWNoIGlzIHN0aWxsIDI1ME1IeiBz
byBJJ20gd29uZGVyaW5nIGlmIAo+IG1heWJlIHRoZSBmYWN0IHRoYXQgdGhlIE5BTkQgZmxhc2gg
aXMgYmVpbmcgcnVuIGZhc3RlciBpcyBoYXZpbmcgYW4gCj4gaW1wYWN0IG9uIHRpbWluZ3MgdGhh
dCBhcmUgY2FsY3VsYXRlZCBhcm91bmQgdGhlIGNvcmVfY2xrIGZyZXF1ZW5jeS4KCldoYXQgaWYg
eW91IHJlc2V0IHRoaXMgYml0PyBEbyB5b3Ugb2JzZXJ2ZSBkaWZmZXJlbnQgdGltaW5ncz8gSSBo
b3BlCnlvdSBkbywgb3RoZXJ3aXNlIHRoaXMgaXMgYSBkZWFkLWVuZC4KClRoZSB0aW1pbmdzIGFy
ZSBkZXJpdmVkIGZyb20gdGhpcyBjbG9jayBidXQgSSByZW1lbWJlciBzZWVpbmcgZGlmZmVyZW50
CnJhdGVzIHRoYW4gdGhlIG9uZXMgSSBleHBlY3RlZCB3aXRoIG5vIG9idmlvdXMgZXhwbGFuYXRp
b24gKHNlZSB0aGUgIioKMiIgaW4gdGhlIGNhbGN1bGF0aW9uIG9mIHBlcmlvZF9ucyBhbmQgdGhl
IGNvbW1lbnQgcmlnaHQgYmVsb3cpLiBTbwptYXliZSB0aGlzIGlzIGR1ZSB0byB0aGUgNDAwTUh6
IHZzLiAyNTBNSHogaXNzdWUgeW91IGFyZSByZXBvcnRpbmcsIG9yCnRoZXJlIGlzIGFuIHVuZG9j
dW1lbnRlZCBwcmUtc2NhbGVyIGluLWJldHdlZW4gKHRoaXMgaXMgbXkgb3JpZ2luYWwKZ3Vlc3Mp
LgoKPiBEbyB5b3UgdGhpbmsgdGhhdCB0aGUgdGltaW5ncyBjYWxjdWxhdGlvbnMgc2hvdWxkIHRh
a2UgdGhlIE5BTkQgQ2xvY2sgCj4gRnJlcXVlbmN5IFNlbGVjdCBzZXR0aW5nIGludG8gYWNjb3Vu
dD8KClRoZXJlIGlzIG5vdCBtdWNoIGFib3V0IHRoaXMgY2xvY2sgaW4gdGhlIG1hbnVhbCwgc28g
aWYgdGhlIGNsb2NrIGlzCmZlZWRpbmcgdGhlIGxvZ2ljIG9mIHRoZSBjb250cm9sbGVyIGdlbmVy
YXRpbmcgdGhlIHNpZ25hbHMgb24gdGhlIGJ1cywKdGhlbiB5ZXMuIFlvdSBjYW4gdmVyaWZ5IHRo
aXMgd2l0aCB0aGUgdGVzdCBtZW50aW9uZWQgYWJvdmUuCgpDb3VsZCB5b3UgY2hlY2sgdGhlIHZh
bHVlcyBzZXQgdG8gdFdQIGFuZCB0V0ggd2l0aCBhbmQgd2l0aG91dCB0aGUgYml0CmFuZCBwcm9i
ZSB0aGUgc2lnbmFscyBpbiBib3RoIGNhc2VzPyBNYXliZSB0aGUgIiogMiIgaW4gdGhlCnBlcmlv
ZF9ucyBjYWxjdWxhdGlvbiB3aWxsIHZhbmlzaCBpZiB3ZSB1c2UgNDAwTUh6IGFzIGlucHV0IGNs
b2NrIHJhdGhlcgp0aGFuIGNsa19nZXRfcmF0ZSgpIChvciBiZXR0ZXIsIGV4cG9zZSB0aGUgYml0
IGFzIGEgbXV4LWNsb2NrIGFuZCB1c2UKaXQgdG8gdGVsbCB0aGUgQ0NGIHRoZSByaWdodCBmcmVx
dWVuY3kpIGFuZCB5b3UnbGwgZ2V0IGEgc2hhcnBlciB0V0MgaW4KdGhlIGVuZCwgd2hpY2ggaG9w
ZWZ1bGx5IHNob3VsZCBtYXRjaCB0aGUgc3BlYyB0aGlzIHRpbWUuCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
