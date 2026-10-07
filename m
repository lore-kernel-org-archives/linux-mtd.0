Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8946CA5FFC
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2026 12:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6y9uDQ6HLTOpPuOvLn3l9xY4ek7mw8QdrBZLljHoKs=; b=Fojl3Ksbcsq6Hg
	fbfLi1dDTwJ+Z1x54l4isMPeWJ46tyKdLx2OjJzSPnX+qzKUvJfGdZ48j+nWW62FjmMPsHfQfhL4G
	BV1KsqLgxTkirA/Rp+bxCZe51NfGgnCkZgJf7EY2XAUQCDUXLY3QNpMnKQjoVc3B9FheNa37jiaMN
	AdedpU2MD3YG23OO+cv6vrSmFaEgo7DL3uHweRLwXZS2nyJuN1qCgr6HiroOyrR9XI3OrOuunZfuG
	9x2S17ZlRcbYwvIQlsS8M7EkEDQslWhLO3qK5EGb38qmIJSdpiy18mo2ziZkzkQoPWBxu1rGsC58N
	SJ8UBBQCie8YVnZZJ16A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQwx-00000002StL-1VJA;
	Wed, 07 Oct 2026 12:40:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQwv-00000002Ssr-3XFQ
	for linux-mtd@lists.infradead.org;
	Wed, 07 Oct 2026 12:40:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B1004034F;
	Wed,  7 Oct 2026 12:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C4071F0089B;
	Wed,  7 Oct 2026 12:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791376844;
	bh=jIkFVhyv0seV4VIwfW6XrxasNT2GVBoZd5clQcXfs6I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HurpNYvgBSIdeJ79pQlAFmrohbaU43qkDbo6oIb5lOThAWqf3Sv7uoNKhKZu4XTfA
	 Xq/4XPhYS7nQzJtva2KutdBWTKpZInXCx4mDu2ueEOcWkPs2Lu5Q/A3OmtjHACWzjL
	 XhAEK6K/SUjkO1x5X8e+ZmW10D/WPvK13SukSMyKFwAN5yNdixctWOmhljBZbzi7zT
	 RXAuHRAjaBt0iojLCE6Pyy159Sg/N3UrDWKeFGyS8farWBKNuoD/MY2z7uhZSs2h59
	 uY5RdTQPL+BAujiByvwbetyrw5hiIknwPbywm2MtPAKI8EKSHVNbFEqwOn4Id5wqGB
	 8DLXB2lDqir0g==
Message-ID: <sashiko-outbox-163006@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: spinand: Do not re-enable continuous reads vetoed
 during variant selection
To: "Richard Weinberger" <richard@nod.at>, "Frieder Schrempf" <frieder@fris.de>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: "Frieder Schrempf" <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
In-Reply-To: <20261007-spinand-cont-read-supported-v1-1-411facc04d99@kontron.de>
References: <20261007-spinand-cont-read-supported-v1-1-411facc04d99@kontron.de>
Date: Wed, 07 Oct 2026 12:40:43 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiBzcGluYW5k
OiBjb250X3JlYWRfdW5zdXBwb3J0ZWQgZmxhZyBjcm9zcy1jb250YW1pbmF0ZXMgU1NEUiBhbmQg
T0RUUiBzdGF0ZXMKLS0KCmNvbW1pdCBiMzgzZDFjZmQyNjAwNDc3ZjAyMGJjMzk2ZDMxMWQ5MjNj
NDhmZjg2CkF1dGhvcjogRnJpZWRlciBTY2hyZW1wZiA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9u
LmRlPgoKbXRkOiBzcGluYW5kOiBEbyBub3QgcmUtZW5hYmxlIGNvbnRpbnVvdXMgcmVhZHMgdmV0
b2VkIGR1cmluZyB2YXJpYW50IHNlbGVjdGlvbgoKc3BpbmFuZF9tYXRjaF9hbmRfaW5pdCgpIGNs
ZWFycyBjb250X3JlYWRfcG9zc2libGUgd2hlbiB0aGUgZmFzdGVzdApjb250aW51b3VzIHJlYWQg
dmFyaWFudCBpcyBzbG93ZXIgdGhhbiB0aGUgZmFzdGVzdCByZWFkIGZyb20gY2FjaGUKdmFyaWFu
dCwgb3Igd2hlbiBubyBTU0RSL09EVFIgY29udGludW91cyByZWFkIHZhcmlhbnQgaXMgc3VwcG9y
dGVkIGJ5CnRoZSBjb250cm9sbGVyLiBIb3dldmVyLCBhdCB0aGF0IHBvaW50IGNvbnRfcmVhZF9w
b3NzaWJsZSBoYXMgbm90IGJlZW4Kc2V0IHlldCwgYW5kIHNwaW5hbmRfY29udF9yZWFkX2luaXQo
KSwgd2hpY2ggcnVucyBsYXRlciBkdXJpbmcKc3BpbmFuZF9pbml0KCksIHVuY29uZGl0aW9uYWxs
eSBzZXRzIGl0IHRvIHRydWUgZm9yIGFueSBjaGlwCmltcGxlbWVudGluZyAtPnNldF9jb250X3Jl
YWQoKS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyBiL2RyaXZl
cnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+IGluZGV4IDk1MzUzNzc3ZDdmNzQuLmU4MzM0MTI5MGVj
MzIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4gKysrIGIvZHJp
dmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4gQEAgLTk5NSw3ICs5OTUsOCBAQCBzdGF0aWMgdm9p
ZCBzcGluYW5kX2NvbnRfcmVhZF9pbml0KHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCkK
PiAgCj4gIAkJaWYgKChlbmdpbmVfdHlwZSA9PSBOQU5EX0VDQ19FTkdJTkVfVFlQRV9PTl9ESUUg
fHwKPiAgCQkgICAgIGVuZ2luZV90eXBlID09IE5BTkRfRUNDX0VOR0lORV9UWVBFX05PTkUpICYm
Cj4gLQkJICAgICFzcGlfbWVtX2NvbnRyb2xsZXJfaXNfY2FwYWJsZShjdGxyLCBub19jc19hc3Nl
cnRpb24pKQo+ICsJCSAgICAhc3BpX21lbV9jb250cm9sbGVyX2lzX2NhcGFibGUoY3Rsciwgbm9f
Y3NfYXNzZXJ0aW9uKSAmJgo+ICsJCSAgICAhc3BpbmFuZC0+Y29udF9yZWFkX3Vuc3VwcG9ydGVk
KQoKW1NldmVyaXR5OiBNZWRpdW1dCldpbGwgdGhpcyBlcnJvbmVvdXNseSBkaXNhYmxlIGNvbnRp
bnVvdXMgcmVhZHMgZm9yIHZhbGlkIGJ1cyBpbnRlcmZhY2UKY29uZmlndXJhdGlvbnM/CgpQcmlv
ciB0byB0aGlzIHBhdGNoLCBzcGluYW5kX2NvbnRfcmVhZF9pbml0KCkgdW5jb25kaXRpb25hbGx5
IHNldApjb250X3JlYWRfcG9zc2libGUgdG8gdHJ1ZSwgbWFza2luZyB0aGUgZmFjdCB0aGF0IHRo
ZSBvbGQgZmxhZyB3YXMgYmVpbmcKc2hhcmVkIGFjcm9zcyBTU0RSIGFuZCBPRFRSIGV2YWx1YXRp
b25zLiBCeSBjaGVja2luZyB0aGUgc2hhcmVkIGZsYWcgaGVyZSwKaXQgYXBwZWFycyBjb250aW51
b3VzIHJlYWQgaXMgZGlzYWJsZWQgaWYgZWl0aGVyIGludGVyZmFjZSBmYWlsZWQgdGhlIGNoZWNr
LApldmVuIGlmIHRoZSBkcml2ZXIgc3VjY2Vzc2Z1bGx5IGNvbmZpZ3VyZXMgYW5kIHVzZXMgYW4g
aW50ZXJmYWNlIHRoYXQKc3VwcG9ydHMgaXQuCgo+ICAJCQlzcGluYW5kLT5jb250X3JlYWRfcG9z
c2libGUgPSB0cnVlOwo+ICAJfQo+ICB9CgpbIC4uLiBdCgo+IEBAIC0xNzAwLDExICsxNzAxLDEx
IEBAIGludCBzcGluYW5kX21hdGNoX2FuZF9pbml0KHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3Bp
bmFuZCwKPiAgCQkJCSAgICAocmVhZF9vcC0+YWRkci5kdHIgJiYgIW9wLT5hZGRyLmR0cikgfHwK
PiAgCQkJCSAgICByZWFkX29wLT5kYXRhLmJ1c3dpZHRoID4gb3AtPmRhdGEuYnVzd2lkdGggfHwK
PiAgCQkJCSAgICAocmVhZF9vcC0+ZGF0YS5kdHIgJiYgIW9wLT5kYXRhLmR0cikpCj4gLQkJCQkJ
c3BpbmFuZC0+Y29udF9yZWFkX3Bvc3NpYmxlID0gZmFsc2U7Cj4gKwkJCQkJc3BpbmFuZC0+Y29u
dF9yZWFkX3Vuc3VwcG9ydGVkID0gdHJ1ZTsKCltTZXZlcml0eTogTWVkaXVtXQpJZiB0aGUgU1NE
UiBjb250aW51b3VzIHJlYWQgaXMgdW5zdXBwb3J0ZWQgb3Igc2xvd2VyLCB0aGlzIHNldHMgdGhl
IGdsb2JhbApzcGluYW5kLT5jb250X3JlYWRfdW5zdXBwb3J0ZWQgdG8gdHJ1ZS4KCkxhdGVyLCBp
ZiBPRFRSIHN1cHBvcnRzIGNvbnRpbnVvdXMgcmVhZCwgaXQgcG9wdWxhdGVzIHRoZSBPRFRSIHRl
bXBsYXRlIGJ1dApkb2VzIG5vdCBjbGVhciB0aGlzIGZsYWcuIENvdWxkIHRoaXMgaW5jb3JyZWN0
bHkgcHJldmVudCBPRFRSIGZyb20gdXNpbmcKY29udGludW91cyByZWFkPwoKPiAgCQkJCWVsc2UK
PiAgCQkJCQlzcGluYW5kLT5zc2RyX29wX3RlbXBsYXRlcy5jb250X3JlYWRfY2FjaGUgPSBvcDsK
PiAgCQkJfSBlbHNlIHsKPiAtCQkJCXNwaW5hbmQtPmNvbnRfcmVhZF9wb3NzaWJsZSA9IGZhbHNl
Owo+ICsJCQkJc3BpbmFuZC0+Y29udF9yZWFkX3Vuc3VwcG9ydGVkID0gdHJ1ZTsKPiAgCQkJfQo+
ICAJCX0KPiAgCj4gQEAgLTE3MzYsNyArMTczNyw3IEBAIGludCBzcGluYW5kX21hdGNoX2FuZF9p
bml0KHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwKPiAgCQkJaWYgKG9wKQo+ICAJCQkJ
c3BpbmFuZC0+b2R0cl9vcF90ZW1wbGF0ZXMuY29udF9yZWFkX2NhY2hlID0gb3A7Cj4gIAkJCWVs
c2UKPiAtCQkJCXNwaW5hbmQtPmNvbnRfcmVhZF9wb3NzaWJsZSA9IGZhbHNlOwo+ICsJCQkJc3Bp
bmFuZC0+Y29udF9yZWFkX3Vuc3VwcG9ydGVkID0gdHJ1ZTsKCltTZXZlcml0eTogTWVkaXVtXQpJ
ZiBTU0RSIHN1cHBvcnRzIGNvbnRpbnVvdXMgcmVhZCBidXQgT0RUUiBkb2VzIG5vdCwgdGhpcyB1
bmNvbmRpdGlvbmFsbHkgc2V0cwp0aGUgZ2xvYmFsIGZsYWcgdG8gdHJ1ZSwgb3ZlcndyaXRpbmcg
YW55IHN1Y2Nlc3NmdWwgU1NEUiBzdGF0ZS4KCkRvZXMgdGhpcyBjcm9zcy1jb250YW1pbmF0ZSB0
aGUgc3RhdGUgYW5kIGluY29ycmVjdGx5IGRpc2FibGUgY29udGludW91cyByZWFkcwpmb3IgYSBm
bGFzaCBjaGlwIHRoYXQgc3VwcG9ydHMgY29udGludW91cyByZWFkcyBvbiBTU0RSPwoKPiAgCQl9
Cj4gIAo+ICAJCXJldHVybiAwOwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2Fz
aGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTAwNy1zcGluYW5kLWNvbnQtcmVhZC1zdXBwb3J0ZWQt
djEtMS00MTFmYWNjMDRkOTlAa29udHJvbi5kZT9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
