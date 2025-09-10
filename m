Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC80CA0FED
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 08:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LbbBv6aavxqVm3XEljbdoS+4oZu8Uy9BbS15QaEDXUY=; b=kFQUPaUDuIMVHb
	f4w4qOWsYFfSQidpoo5n/98z6vUzWrs+lt09H6O9vidqryI1Cl9HbYurI1wWa25bQKZVXg78ZtcVT
	YNWRZyrURuS2fOsCcvbdWH1aoAFgTg919tavK+HmeUscJRRLlD9Q1jeVWRTcvZR/g9HhJpD6cuOkR
	Vo5i7JMahzZQBvF0LrESrCLXe4xRU/T/ZYi/EN1OC84lI7QhtEoUQVUM4JEaAAL3WhXpScW2Uam8X
	me44d2deaPG90boWRWO7bOnohXN0eH3Rt6Bq+A2djZHMHivPgaGf+gnNLFfvE023kzNrAFHnvcpVV
	QWRzYHDG6LTTuCtTJ1KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGSv-0000000D1sO-0IuF;
	Wed, 10 Sep 2025 08:46:09 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGSs-0000000D1r8-0Bh9
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 08:46:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 39C144E40B99;
	Wed, 10 Sep 2025 08:46:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0908E606D4;
	Wed, 10 Sep 2025 08:46:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31678102F1D2E;
	Wed, 10 Sep 2025 10:45:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757493962; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TPF1Bh4jbgWSz3Ya/QMY1CLpfbe8kFIPeV0OQ/ZQFPs=;
	b=1LUwjBGfthERBPEwQRZv1wyeH3VVBT/H0oaflADJOBabryaFTC9Dvi4CH2QtKFLGCp4JvU
	bWCgGfCQgpx5vjkro7hvy+X1A9NH6umQVVNXdpOXIW126F0N4KuBIz5lK2fWqfD1/piezr
	GjqGVAqmbGjVctV3cwJgpIoI/pm0qD1TQKdyFOmuILKAL3e24V4XL+TMKNKJ6e5lgDa8ra
	KD+Lc00GN+YR+fXWYXLQlqidVvPrjzPeJo4tQzu3vbvBcygW6TTJCkuFbVuTRS12hCMeU9
	pQE3JR5m2F+RADa6NOnbn4G8Z+s3nHQ6IMNo+7njjQwBOZqa7uf07lhym/f3VA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: richard@nod.at,  vigneshr@ti.com,  robh@kernel.org,  krzk+dt@kernel.org,
  conor+dt@kernel.org,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: Add realtek,rtl9301-ecc
In-Reply-To: <20250828143408.2511086-2-markus.stockhausen@gmx.de> (Markus
	Stockhausen's message of "Thu, 28 Aug 2025 10:34:07 -0400")
References: <20250828143408.2511086-1-markus.stockhausen@gmx.de>
	<20250828143408.2511086-2-markus.stockhausen@gmx.de>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 10 Sep 2025 10:45:56 +0200
Message-ID: <87h5xaelvf.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_014606_222009_3FBA6CB2 
X-CRM114-Status: GOOD (  13.99  )
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

SGVsbG8sCgpPbiAyOC8wOC8yMDI1IGF0IDEwOjM0OjA3IC0wNCwgTWFya3VzIFN0b2NraGF1c2Vu
IDxtYXJrdXMuc3RvY2toYXVzZW5AZ214LmRlPiB3cm90ZToKCj4gQWRkIGEgZHRzY2hlbWEgZm9y
IHRoZSBFQ0MgZW5naW5lIG9uIHRoZSBSZWFsdGVrIFJUTDkzeHggU29Dcy4KPiBUaGUgZW5naW5l
IHN1cHBvcnRzIEJDSDYgYW5kIEJDSDEyIHBhcml0eSBmb3IgNTEyIGJ5dGUgYmxvY2tzLgo+Cj4g
U2lnbmVkLW9mZi1ieTogTWFya3VzIFN0b2NraGF1c2VuIDxtYXJrdXMuc3RvY2toYXVzZW5AZ214
LmRlPgo+IC0tLQo+IENoYW5nZXMgaW4gdjI6Cj4gLSBjaGFuZ2UgY2VsbHMgZnJvbSAyIHRvIDEg
KG9ubHkgMzIgYml0IGhhcmR3YXJlKQo+IC0tLQo+ICAuLi4vYmluZGluZ3MvbXRkL3JlYWx0ZWss
cnRsOTMwMS1lY2MueWFtbCAgICAgfCAzNSArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3JlYWx0ZWsscnRsOTMwMS1lY2MueWFtbAo+Cj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcmVhbHRl
ayxydGw5MzAxLWVjYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9yZWFsdGVrLHJ0bDkzMDEtZWNjLnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAwMC4uMWIzNGQ3OTAwN2E0Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcmVhbHRlayxydGw5MzAxLWVjYy55YW1s
Cj4gQEAgLTAsMCArMSwzNSBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL210ZC9yZWFsdGVrLHJ0bDkzMDEtZWNjLnlhbWwjCj4g
KyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+
ICsKPiArdGl0bGU6IFJlYWx0ZWsgU29DcyBOQU5EIEVDQyBlbmdpbmUKPiArCj4gK21haW50YWlu
ZXJzOgo+ICsgIC0gTWFya3VzIFN0b2NraGF1c2VuIDxtYXJrdXMuc3RvY2toYXVzZW5AZ214LmRl
Pgo+ICsKPiArcHJvcGVydGllczoKPiArICBjb21wYXRpYmxlOgo+ICsgICAgY29uc3Q6IHJlYWx0
ZWsscnRsOTMwMS1lY2MKPiArCj4gKyAgcmVnOgo+ICsgICAgbWF4SXRlbXM6IDEKClRoaXMgY29u
dHJvbGxlciBoYXMgYW4gaW50ZXJydXB0IHdoaWNoIG11c3QgYmUgZGVzY3JpYmVkLiBJdCBkb2Vz
IG5vdAptYXR0ZXIgaWYgeW91IHVzZSBpdCBvciBub3QgZm9yIHBlcmZvcm1hbmNlIHJlYXNvbnMg
aW4gdGhlIGRyaXZlci4gSnVzdApkb24ndCBtYXJrIGl0IHJlcXVpcmVkIGJlbG93LgoKQWxzbywg
bm8gY2xvY2tzIHNlZW1zIHN1c3BpY2lvdXMuIEJ1dCBtYXliZSB0aGV5IGFyZSAiaGlkZGVuIi4K
Cj4gKwo+ICtyZXF1aXJlZDoKPiArICAtIGNvbXBhdGlibGUKPiArICAtIHJlZwo+ICsKPiArYWRk
aXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
