Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49BAC982EE
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 13:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7dPu6ZYenWXZNVIZU8CAWw3jL26hhwO3BQ75xY9lUyU=; b=RXf7nQQi72f+Vt
	i4N8OnbEcvSBfGqTVoMGI78I6qmz9iJFlQ0C3E1axg8ClbxadUcT7wtF3KRutLLvlEIwYhdoMeQsP
	TrEzccExIKadJLrogG9YOyMCnjDpkxcXGB1WlaQICda8Qu5aMZs8oQd+6nxMb8tlrDaveUFYqrg5f
	9XhYNXo4VNGUqNeLri8AysQ/uqr/Wtl0Z1gOYtpBQVT9J8pCaDQyHAGN1zh4jEojqVeXwmNiNDPTy
	NIohKeNuhc9vHwJYlBKKraK/lvJjvEwqlk9QGs/OCu0OH/8GIljZQy+ZNJnucuR/vh4ifYmVysUjn
	4Gs9cNm75naMFohi7hSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8e7z-00000002FMD-1Krd;
	Mon, 21 Sep 2026 13:32:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8e7v-00000002FLt-3V4S
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 13:32:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C12D6600C8;
	Mon, 21 Sep 2026 13:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B751F0089A;
	Mon, 21 Sep 2026 13:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789997529;
	bh=2kT1ySt9JkJYQBPTTE0pBorw4nyIBwWt51Dmu6nau8w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XWoHylf7176FH+h0QPLJfEe71DQ21tZQ+MJuPSUFPzRvBI/aqO3MCOsiVuCr7dcVF
	 qmlTwpHNPhJ5lEhEDW95eIbqgWfmzDbtYzhZRRvHV9FgXcbLKXxqHHIpsxwZIusSAJ
	 FDSkmusiD6dSuL/peU361teDsi+yEJTqco0yUVtS/cEdDqeaUsWI3xeyFe4v1ygPG+
	 XFduhyY5rkYivlGHeiz16g0lGaaX4B3eJ0h+/Rw3yHY3RVfRVGZTeFh8I+IvMHkEoy
	 GIU6nTZzQY5M+vW+ERZHj2IuHth0jlyPHT7aERc3J0HCvSCCkH7/k74ghTI0I9A+Vd
	 9XuJobzroT35g==
From: Michael Walle <mwalle@kernel.org>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com>
References: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com>
Subject: Re: (subset) [PATCH v2 0/2] mtd: spi-nor: issi: add support for
 the IS25WX01G octal flash
Message-Id: <178999752766.3604280.10374097557984380720.b4-ty@b4>
Date: Mon, 21 Sep 2026 15:32:07 +0200
MIME-Version: 1.0
X-Mailer: b4 0.16.0
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

Ck9uIE1vbiwgMTQgU2VwIDIwMjYgMTQ6NDI6MDAgKzAxMDAsIE51bm8gU8OhIHdyb3RlOgo+IFRo
aXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIElTU0kgSVMyNVdYMDFHLCBhIDEgR2JpdCAo
MTI4IE1pQikgb2N0YWwKPiBOT1IgZmxhc2guCj4gCj4gVGhlIHBhcnQgaXMgZnVsbHkgZGVzY3Jp
YmVkIGJ5IFNGRFAsIHNvIHBhdGNoIDIgb25seSBuZWVkcyB0aGUgZmxhc2ggSUQKPiBwbHVzIGEg
c21hbGwgcG9zdF9iZnB0IGZpeHVwOgo+IAo+ICAtIFRoZSBmbGFzaCBoYXMgbm8gU3RhdHVzIFJl
Z2lzdGVyIDIgYW5kIGRvZXMgbm90IGltcGxlbWVudCB0aGUgMzVoIFJlYWQKPiAgICBDb25maWd1
cmF0aW9uIFJlZ2lzdGVyIGNvbW1hbmQsIHNvIHRoZSBjb3JlJ3MgZGVmYXVsdCBhc3N1bXB0aW9u
IG9mIGEKPiAgICAxNi1iaXQgV3JpdGUgU3RhdHVzIGNvbW1hbmQgZG9lcyBub3QgaG9sZCBhbmQg
U05PUl9GX0hBU18xNkJJVF9TUiBoYXMKPiAgICB0byBiZSBjbGVhcmVkLgo+IAo+IFsuLi5dCgpB
cHBsaWVkLCB0aGFua3MhCgpbMS8yXSBtdGQ6IHNwaS1ub3I6IHNmZHA6IGdldCB0aGUgMS0xLTgg
YW5kIDEtOC04IHBhZ2UgcHJvZ3JhbXMgZnJvbSA0QkFJVAogICAgICBjb21taXQ6IDY4ZDcxMTVk
NzdhODczYzI4ZDhjN2QyZjIzOWMzZDljYTgzYmYzOWYKCkJlc3QgcmVnYXJkcywKLS0gCk1pY2hh
ZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwub3JnPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
