Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAFD606A31A
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 14:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ej5bDHJM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PEVEkdtw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=26uoh0bjqKmUzdjyTbxGJNlL+gTi0YioYqdpc/FH6yM=; b=Ej5bDHJMEBMUl+xbULAgFaWy+u
	2+Zb/RocAVtlkRAy3QJNcN7ZGGLTbr5kI/slYqBNkp//KOzloEDLvBR84Umq9S5OhpCYTqwUwzs12
	DsejQ71B4I0YSkOCUZq6kgtV38Fj2zPAhK1LvwqswM+J1THpR/KXVrLhe/tRabjQfDX9D+mveUOj/
	9+QMNeU+COcBw+xC4zOIIIoBc4nESgFP2iqmtkJTIsrRYIXk/KfOm1UHYWxJhME8Fm3IBw94999Ve
	pomk4+G0C0z6FnGlp41mrJuoIhEMWsZddnBPKYPZwAv0U3SZIGx++CthihOrokz9USAINHEJ7nt0/
	MyRokcGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUoU-00000003hCR-3zd6;
	Mon, 23 Nov 2026 14:14:34 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUoR-00000003hBo-1wwb
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 14:14:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DFDCA1A1799;
	Mon, 23 Nov 2026 14:14:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B5FC3601E1;
	Mon, 23 Nov 2026 14:14:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BCC3E11E6A4E0;
	Mon, 23 Nov 2026 15:14:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795443268; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YFuuXMnMJsjCk7IZEU6QZfVyQzHNOrTyxoyMyX8RSv4=;
	b=PEVEkdtwJ3ypvl2uVYdoLWPkC7VS8oVuBbq+e5nfvuYY3hNkl6Nv+x0wezwbYtwIOyw+mb
	Oteg8KFs5zKYzRMc77Go5nbInAbCL4r2VE8HvpudxzQjLnUzF4GLsjnZX2no2HmCOEkNRV
	G6k+xXLkkBlQTLN8SEGQsR1JGlqreIEl5jewc+92j8mBUcfmoW2Jxalfu0TDEny8SS1aUr
	mTWVCdP14qBSW69oddfAuV2LAlTdD1E7s1aZ8u2y+nVprzrEiW2uUs2pQ4RJX6zOqDqzx1
	YbJGL52HoVJvjCecE6NEwLZiScqUxWdsKMvXRJ5g1TfimfHUuYnjyy3KlWsZLA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul.cercueil@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Mark Brown <broonie@kernel.org>,  Kees Cook
 <kees@kernel.org>,  Tony Luck <tony.luck@intel.com>,  "Guilherme G .
 Piccoli" <gpiccoli@igalia.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-spi@vger.kernel.org,  Bharat Bhushan
 <bbhushan2@marvell.com>,  Sunil Kovvuri Goutham <sgoutham@marvell.com>,
  Tanmay Jagdale <tanmay@marvell.com>
Subject: Re: [PATCH v4 3/7] mtd: spi-nor: Add support for panic writes
In-Reply-To: <20261016102917.171095-4-paul.cercueil@bootlin.com> (Paul
	Cercueil's message of "Fri, 16 Oct 2026 12:29:13 +0200")
References: <20261016102917.171095-1-paul.cercueil@bootlin.com>
	<20261016102917.171095-4-paul.cercueil@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 23 Nov 2026 15:14:25 +0100
Message-ID: <87y0ajtz26.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_061432_120831_5CC35051 
X-CRM114-Status: GOOD (  12.12  )
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTYvMTAvMjAyNiBhdCAxMjoyOToxMyArMDIsIFBhdWwgQ2VyY3VlaWwgPHBhdWwuY2VyY3Vl
aWxAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBGcm9tOiBUYW5tYXkgSmFnZGFsZSA8dGFubWF5QG1h
cnZlbGwuY29tPgo+Cj4gSWYgdGhlIFNQSSBjb250cm9sbGVyIHN1cHBvcnRzIGl0LCBwcm92aWRl
IHRoZSBmdW5jdGlvbmFsaXR5IG9mIGRvaW5nIGEKPiBwYW5pYyB3cml0ZS4KPgo+IFVwZGF0ZSB0
aGUgc3BpLW5vciBjb3JlIGNvZGUgYW5kIGNvbnRyb2xsZXJzIHRvIG1ha2Ugc3VyZSB0aGV5IHdv
bid0IHRyeQo+IHRvIGdyYWIgbG9ja2VkIG11dGV4ZXMgb3Igc2xlZXAgd2hlbiBkb2luZyBhIHBh
bmljIHdyaXRlLCBhcyBwcmVlbXB0aW9uCj4gYW5kIElSUXMgYXJlIGRpc2FibGVkLgo+Cj4gVGhl
IGluZm9ybWF0aW9uIGlzIGNhcnJpZWQgZG93biB0byB0aGUgU1BJIGNvbnRyb2xsZXIgZHJpdmVy
IHRocm91Z2ggdGhlCj4gc3BpX21lbV9vcCBzdHJ1Y3R1cmUuIElmIHRoZSBjb3JyZXNwb25kaW5n
IGZsYWcgaXMgc2V0IHRoZXJlLCBhbmQgdGhlCj4gU1BJIGRyaXZlciBkb2VzIHN1cHBvcnQgcGFu
aWMgd3JpdGVzLCBpdCB0aGVuIGhhcyB0byByZXNwZWN0IHRoZSBzYW1lCj4gcnVsZXMuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBUYW5tYXkgSmFnZGFsZSA8dGFubWF5QG1hcnZlbGwuY29tPgo+IENvLWRl
dmVsb3BlZC1ieTogUGF1bCBDZXJjdWVpbCA8cGF1bC5jZXJjdWVpbEBib290bGluLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsLmNlcmN1ZWlsQGJvb3RsaW4uY29tPgoK
VGhhdCdzIHJlYXNvbmFibHkgY2xvc2UgdG8gdGhlIE5BTkQgdmVyc2lvbi4KClJldmlld2VkLWJ5
OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
