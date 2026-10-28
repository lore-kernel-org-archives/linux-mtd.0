Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F489606A333
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2026 10:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qQI0ASW7;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=f4gB9JfG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/UqLDlexcpamNU0cIGeH27sk+J0/VHV0LryR6wr7xQI=; b=qQI0ASW7tCY5AEHQkllMwGSPmm
	WBNTV07j6bAmFR58FimzFoDwpelhTMnwJzp1NAs3zoNQMvIcBitToFxU61ZRa5eTX755jl+rSONOP
	mm6AS2VeeGh7x1EgNAOxgCtRj0Qti7gIqBQrKTT1yrzru1HelCnw+UjeqZxS69iryE7956a0VEBI8
	6tN745v3hEtJnZ8juIZkSIiN6jrwk1o5SOP1HVWiplEB3oVjMReBjHU1SnsKmSCzmJpCr3HZ3svP2
	ip1z3nWwcD1fTvuNBW94j/NKjDhi2a9ir06h+VdmK9VGx1Aju9vC+kN1HyWDM8zKntpf3VKRb+CnJ
	PQ4ZdDfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM17L-00000006mkQ-20eX;
	Wed, 28 Oct 2026 10:42:52 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM17I-00000006mjO-1oOZ
	for linux-mtd@lists.infradead.org;
	Wed, 28 Oct 2026 10:42:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C3E49C4FECF;
	Wed, 28 Oct 2026 10:43:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D854560769;
	Wed, 28 Oct 2026 10:42:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4BB39103290AC;
	Wed, 28 Oct 2026 11:42:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793184162; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=G7SGsnjmO2AtGa1YhQju9ah0Ewiw5mAJClKeUYxhBsU=;
	b=f4gB9JfGl2MsxLy3brpGXg+G5YiC8friNAVRIR/pW0cXoVvzpMz9F+2Mx75zlxUblt3kwR
	RILbkCBaOb/DYo01a7OLZZXjoaFBgDpZhvhVAhwAcdF4lGFadI4Wcsg6VynphzAgQRYCE+
	52aiaEBTHrRUtFV3mA0CueMUb90PvOPX4Yt2Cm0rq0w9T6bx5RIe7zzPGyZ49rRK8laPJ5
	15ejyqmkRsTG0uLEKPqlNSRil6lZpLtF2kMzPfIX+Haj4Z7VKdPrKpQ89H1WJWVzCuHX2d
	aSDX8mxdhwJ0tjURlxDwH3CDLJv8UzO3SKgywCOdeOHrR9hJUXgv4KktJcFK0Q==
Message-ID: <fdc79c99e3045635841f68c89fec3b9d9e2f7233.camel@bootlin.com>
Subject: Re: [PATCH v4 0/7] spi: Add support for panic mem writes
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
  Takahiro Kuwano <takahiro.kuwano@infineon.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger	 <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Mark Brown	 <broonie@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme
 G . Piccoli" <gpiccoli@igalia.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, 	linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, 	linux-spi@vger.kernel.org, Bharat Bhushan
 <bbhushan2@marvell.com>, Sunil Kovvuri Goutham <sgoutham@marvell.com>,
 Tanmay Jagdale <tanmay@marvell.com>
Date: Wed, 28 Oct 2026 11:42:33 +0100
In-Reply-To: <20261016102917.171095-1-paul.cercueil@bootlin.com>
References: <20261016102917.171095-1-paul.cercueil@bootlin.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_034248_630598_E09CA544 
X-CRM114-Status: GOOD (  15.19  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksCgpJIGhhdmUgYSBzZWNvbmQgcGF0Y2hzZXQgZm9yIHNwaS1jYWRlbmNlLXhzcGkgcGVuZGlu
ZyAodW5yZWxhdGVkIHRvIHRoaXMgb25lKQp0aGF0IGhhcHBlbnMgdG8gaGF2ZSBzb21lIEZpeGVz
OiB0YWdzLCBhbmQgdGhvc2UgZml4ZXMgY29uZmxpY3Qgc2xpZ2h0bHkgd2l0aAp0aGUgY2hhbmdl
cyBoZXJlLgoKSSdtIHRoaW5raW5nIHRoYXQgaW4gb3JkZXIgdG8gbWFrZSBpdCBlYXNpZXIgdG8g
YmFja3BvcnQgdGhvc2UgZml4ZXMgdG8gb2xkZXIKa2VybmVscywgbXkgb3RoZXIgcGF0Y2hzZXQg
c2hvdWxkIGJlIG1lcmdlZCBmaXJzdC4gU28gSSBndWVzcyBJJ2xsIHY1IHRoaXMgb25lCndpdGgg
YSByZWJhc2Ugb25jZSB0aGUgb3RoZXIgb25lIGlzIGluLgoKQE1hcmssIGRvIHlvdSB3YW50IG1l
IHRvIHdhaXQgZm9yIC1yYzEgdG8gc2VuZCBpdCB0byB5b3U/CgpDaGVlcnMsCi1QYXVsCgpMZSB2
ZW5kcmVkaSAxNiBvY3RvYnJlIDIwMjYgw6AgMTI6MjkgKzAyMDAsIFBhdWwgQ2VyY3VlaWwgYSDD
qWNyaXTCoDoKPiBIaSwKPiAKPiBIZXJlIGlzIHRoZSB2NCBvZiBteSBwYXRjaHNldCB0aGF0IHVw
ZGF0ZXMgdGhlIE1URCBzcGktbm9yIGNvZGUgYXMgd2VsbAo+IGFzIHRoZSBzcGktbWVtIGNvZGUs
IHRvIGFkZCBzdXBwb3J0IGZvciBwYW5pYyBtZW0gd3JpdGVzIHRvIGEgbWVtb3J5Cj4gcGFydGl0
aW9uIGNvbmZpZ3VyZWQgYXMgcHN0b3JlLgo+IAo+IFRoaXMgcmV2aXNpb24gYWRkcyBhIHdvcmth
cm91bmQgaW4gbXRkL3NwaS1ub3IgdG8gYXZvaWQgYSBjYWxsIHRvCj4ga21hbGxvYygpLCBhbmQg
Zml4ZXMgYSBrZXJuZWwgZG9jIG1pc21hdGNoLgo+IAo+IENoYW5nZWxvZzoKPiAKPiDCoC0gWzIv
N106Cj4gwqDCoMKgwqDCoMKgwqAgLSBBbHNvIHVwZGF0ZSBrZXJuZWwgZG9jIGZvciBuZXcgJ3Rp
bWVvdXRfbXMnIHBhcmFtZXRlcgo+IAo+IMKgLSBbMy83XToKPiDCoMKgwqDCoMKgwqDCoCAtIGtt
YWxsb2MoKSBpcyBub3Qgc2FmZSBpbiBwYW5pYyBjb250ZXh0OyByZXVzZSBib3VjZWJ1ZiBpbnN0
ZWFkCj4gCj4gwqAtIFBhdGNoIFsxLzddIGFuZCA0LT43IHVuY2hhbmdlZCBzaW5jZSB2My4KPiAK
PiBDaGVlcnMsCj4gLVBhdWwKPiAKPiBUYW5tYXkgSmFnZGFsZSAoNyk6Cj4gwqAgc3BpOiBzcGkt
bWVtOiBBZGQgc3VwcG9ydCBmb3IgcGFuaWMgbWVtIHdyaXRlcwo+IMKgIG10ZDogc3BpLW5vcjog
V2FpdCBmb3IgTk9SIHJlYWR5IHdpdGggcG9sbF90aW1lb3V0X3VzKCkKPiDCoCBtdGQ6IHNwaS1u
b3I6IEFkZCBzdXBwb3J0IGZvciBwYW5pYyB3cml0ZXMKPiDCoCBzcGk6IGNhZGVuY2UteHNwaTog
Q2xlYXIgIlNETUEgcmVhZHkiIElSUSBmbGFnIGFmdGVyIHBvbGxpbmcKPiDCoCBzcGk6IGNhZGVu
Y2UteHNwaTogQWRkIGlycS1sZXNzIHN1cHBvcnQKPiDCoCBzcGk6IGNhZGVuY2UteHNwaTogQWRk
IHN1cHBvcnQgZm9yIHBhbmljIHdyaXRlcwo+IMKgIHNwaTogZHQtYmluZGluZ3M6IGNhZGVuY2U6
IE1ha2UgWFNQSSdzIElSUSBsaW5lIG9wdGlvbmFsCj4gCj4gwqAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy9zcGkvY2Rucyx4c3BpLnlhbWzCoMKgwqAgfMKgwqAgMSAtCj4gwqBkcml2ZXJzL210ZC9z
cGktbm9yL2NvcmUuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTI4
ICsrKysrKysrKysrKysrLS0tLQo+IMKgZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UteHNwaS5jwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTE0ICsrKysrKysrKy0tLS0tLS0KPiDCoGRy
aXZlcnMvc3BpL3NwaS1tZW0uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqAgNDIgKysrKystCj4gwqBpbmNsdWRlL2xpbnV4L3NwaS9zcGktbWVtLmjC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNSArCj4gwqA1IGZpbGVz
IGNoYW5nZWQsIDIwOSBpbnNlcnRpb25zKCspLCA4MSBkZWxldGlvbnMoLSkKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
