Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAEDC88E4A
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 10:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cTD4kAQX7onKxzXkt2+uojQvcUZ4xVxe6PYLfCxC/Dk=; b=NP1jxIwxe4W/eO
	pluLDcxZD5jYGvosFwPnUUhvUt+pUP9Q19V/L34cQf6Xt3xaeB9JnTSAu8GT/ee8mrChBT0B/iKyD
	/alqnBrp4bq0hHUqcMNCEcXH0qu4xuWN7CGcKspatTvERvaCUHaKHzKz2gpPwPfNcTHu6hq6JLv8I
	2+CDTVMy8IMaR9+qZz5L2My6xuo/xYmK/utcbkAQ4+I3Iin96cHyKzVW1X7h8/vBmpPfATsqzblo+
	St/ffAtbzQGYdges5ur4r4v5hqNgkmZKQCiaWz21tbFfVxxUqzbT3IskZmAGIHqPUIaOYpBFSMIgl
	fjkw2KgGf5BFfWl62fcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ysD-0000000GQvO-3XE9;
	Fri, 11 Sep 2026 10:52:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ysB-0000000GQvB-2Teq
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 10:52:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2707D60A57;
	Fri, 11 Sep 2026 10:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408171F00893;
	Fri, 11 Sep 2026 10:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789123965;
	bh=c6Cwwnk73gp5XSyU0doZGD+8vzCu7Q6LPoYV28cPnXw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oYsWDOMJ0l53BeGZelTynmCuUtj16bIGAuqh5RhUpbj7bzpwvUzL3Fbn+8EZVr/aW
	 pShpSifEYG0g8AHLHMFYQ5E0ecNBcDwOQgnT0+N2T5T0NvhDy22OF3hhUMrTv6Vtaf
	 7CGG8iwgCxZW25csAKC5LxwGkHbl6oaAvTeWwMWW3C2UsfqwqA+572ZDQCMOST8Wz+
	 h1hUeptKMSj1CptgM0QdQUMtmNU5jfglH3QlVxlqPiyL6dnzeXcOVsKxkrRjSrg4Ky
	 6l96I6Mk32XGjCzF6IiuPxyEmqNBuAV/okbkApdKI2OI98oxgKqRwD81iW2ccF6aYY
	 BZ2/AA182S9iw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: Fix quad-enable for flashes with QER
 bit in SR1
To: "Vignesh Raghavendra" <vigneshr@ti.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, "Richard Weinberger" <richard@nod.at>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, "Steam
 Lin" <STLin2@winbond.com>, linux-mtd@lists.infradead.org, "Jon Hunter" <jonathanh@nvidia.com>
In-Reply-To: <20260911-perso-fix-spi-nor-qe-mxic-v2-1-70c324e9f30e@bootlin.com>
References: <20260911-perso-fix-spi-nor-qe-mxic-v2-1-70c324e9f30e@bootlin.com>
Date: Fri, 11 Sep 2026 10:52:44 +0000
Message-Id: <20260911105245.408171F00893@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHNwaV9ub3JfcmVhZF9z
cjFfYW5kX3NyMigpIGxlYXZlcyBzclsxXSB1bmluaXRpYWxpemVkIHdoZW4gcmVhZF9zcjIgaXMg
dW5zdXBwb3J0ZWQsIGxlYWRpbmcgdG8gdW5pbml0aWFsaXplZCBzdGFjayBtZW1vcnkgdXNlIGlu
IGNhbGxlcnMgYW5kIHNwdXJpb3VzIC1FSU8gZXJyb3JzLgotLQoKY29tbWl0IGQ1NTdlNmQ1ZTQ0
MmRiZTRlZTRkOTk3YmMwZjNiYjYxOTBkNWJhMmMKQXV0aG9yOiBNaXF1ZWwgUmF5bmFsIDxtaXF1
ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKbXRkOiBzcGktbm9yOiBGaXggcXVhZC1lbmFibGUgZm9y
IGZsYXNoZXMgd2l0aCBRRVIgYml0IGluIFNSMQoKU29tZSBmbGFzaGVzIGRvIHNldCBCRlBUX0RX
T1JEMTVfUUVSX1NSMV9CSVQ2LCB3aGljaCBtZWFucyB0aGV5IGRvIG5vdApoYXZlIGFuIFNSMiB0
byByZWFkIGZyb20vd3JpdGUgdG8uIFRoZSBnZW5lcmljIFFFIGhlbHBlciBoYXMgZm9yZ290dGVu
CmFib3V0IHRoZSBNYWNyb25peCBjYXNlLCB3aGljaCBjYXVzZXMgYm9vdGluZyB0byBmYWlsLiBU
aGlzIGZpeCBtYWtlcwpzdXJlIFNSMiByZWFkcyBqdXN0IHJldHVybiAwIGlmIHVuc3VwcG9ydGVk
IHRvIGFjY29tbW9kYXRlIHRoaXMgc2l0dWF0aW9uLgoKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtbXRkLzE3ODg3NjcxOTIzMi4zNTQzOTAyLjE0NDUxNjI1MDM3Njc2NDIxMjU0
LmI0LXR5QGI0L1QvI201YmM0YmE2Nzc2NDM2ZjI4NzBjZWQwZWI1Nzg5ZDIyOTAzN2FkODQwCgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyBiL2RyaXZlcnMvbXRkL3Nw
aS1ub3IvY29yZS5jCj4gaW5kZXggZTJiNmVmYWZkZDhkMC4uN2JiMTk3ZGY1NTg1YiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3Nw
aS1ub3IvY29yZS5jCj4gQEAgLTg2NCw3ICs4NjUsMTAgQEAgaW50IHNwaV9ub3JfcmVhZF9zcjFf
YW5kX3NyMihzdHJ1Y3Qgc3BpX25vciAqbm9yLCB1OCAqc3IpCj4gIAlpZiAocmV0KQo+ICAJCXJl
dHVybiByZXQ7Cj4gIAo+IC0JcmV0dXJuIHNwaV9ub3JfcmVhZF9zcjIobm9yLCAmc3JbMV0pOwo+
ICsJaWYgKG5vci0+cGFyYW1zLT5vcGNvZGVzLnJlYWRfc3IyKQo+ICsJCXJldCA9IHNwaV9ub3Jf
cmVhZF9zcjIobm9yLCAmc3JbMV0pOwo+ICsKPiArCXJldHVybiByZXQ7Cj4gIH0KCltTZXZlcml0
eTogSGlnaF0KRG9lcyB0aGlzIGNvZGUgbGVhdmUgc3JbMV0gdW5pbml0aWFsaXplZCB3aGVuIHJl
YWRfc3IyIGlzIHVuc3VwcG9ydGVkPwoKSW4gc3BpX25vcl93cml0ZV9zcjFfYW5kX3NyMl9hbmRf
Y2hlY2soKSwgYW4gdW5pbml0aWFsaXplZCB1OCB0bXBbMl0gaXMKcGFzc2VkIHRvIHNwaV9ub3Jf
cmVhZF9zcjFfYW5kX3NyMigpOgoKZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmM6c3BpX25vcl93
cml0ZV9zcjFfYW5kX3NyMl9hbmRfY2hlY2soKSB7Cgl1OCB0bXBbMl07CgkuLi4KCXJldCA9IHNw
aV9ub3JfcmVhZF9zcjFfYW5kX3NyMihub3IsIHRtcCk7CglpZiAocmV0KQoJCXJldHVybiByZXQ7
CgoJaWYgKHNyWzBdICE9IHRtcFswXSB8fCBzclsxXSAhPSB0bXBbMV0pCgkJcmV0dXJuIC1FSU87
CgkuLi4KfQoKRm9yIGNoaXBzIHdpdGhvdXQgU1IyLCB0bXBbMV0gcmVtYWlucyB1bmluaXRpYWxp
emVkIHN0YWNrIGdhcmJhZ2UgYW5kIHRoZQpjb21wYXJpc29uIHNyWzFdICE9IHRtcFsxXSBjYW4g
ZXZhbHVhdGUgdG8gdHJ1ZSwgcmV0dXJuaW5nIGEgc3B1cmlvdXMgLUVJTwplcnJvci4gVGhpcyBj
YXVzZXMgcXVhZC1lbmFibGUgYW5kIGRldmljZSBwcm9iaW5nIHRvIGZhaWwgZm9yIHRoZSBleGFj
dApmbGFzaGVzIHRoZSBwYXRjaCBpcyBhdHRlbXB0aW5nIHRvIGZpeC4KCkFsc28sIGRvZXMgdGhp
cyBhZmZlY3Qgc3BpX25vcl9vdHBfbG9ja19zcjIoKT8KCmRyaXZlcnMvbXRkL3NwaS1ub3Ivb3Rw
LmM6c3BpX25vcl9vdHBfbG9ja19zcjIoKSB7Cgl1OCBzclsyXTsKCS4uLgoJcmV0ID0gc3BpX25v
cl9yZWFkX3NyMV9hbmRfc3IyKG5vciwgc3IpOwoJaWYgKHJldCkKCQlyZXR1cm4gcmV0OwoKCS8q
IG5vIG5lZWQgdG8gd3JpdGUgdGhlIHJlZ2lzdGVyIGlmIHJlZ2lvbiBpcyBhbHJlYWR5IGxvY2tl
ZCAqLwoJaWYgKHNyWzFdICYgbG9ja19iaXQpCgkJLi4uCn0KCkhlcmUsIHNyWzFdIGNvbnRhaW5z
IGdhcmJhZ2UsIHdoaWNoIGlzIGV2YWx1YXRlZCBpbiB0aGUgbG9jayBjb25kaXRpb24KY2hlY2sg
YW5kIHBvdGVudGlhbGx5IG1vZGlmaWVkIGFuZCB3cml0dGVuIGJhY2sgdG8gdGhlIGRldmljZS4K
Ci0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQv
MjAyNjA5MTEtcGVyc28tZml4LXNwaS1ub3ItcWUtbXhpYy12Mi0xLTcwYzMyNGU5ZjMwZUBib290
bGluLmNvbT9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
