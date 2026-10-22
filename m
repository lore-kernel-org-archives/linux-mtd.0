Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8682C606A321
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Oct 2026 10:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uaQ3L6AL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QArawM2v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Kxq49t0YnVoySMRqzEdkOQXYrQrN3XVJDbymrsEzYy8=; b=uaQ3L6ALvcly5Mngr7lOjUPeSb
	AWskFCz7/vis8zo/RWQ67h86s4523dAnfE50/QfOyje2Pe4FqRlzZiINEkIQwLVtSqqbYR8+AgBbF
	kGhCvBDUV1iQiD9E1dOK9FQoSwSRnC34yy94SuIaFm4yBvZn13fIRq9ZrfyMTERRJnKWVCFvoMFal
	nbPIA1lcJ20bs+sDpK3Ipc/76oEHKidDnEPDNARUPVLm/TCkZIFSbfPIkZLxzarySrSy92am2b49X
	gEUwD9P8D5sd8Dsq96vbtV4Q5nAIb2FqMGqpcTD7X2JqBpgAvenGnMTMhU+v4wCZ7WtFIW/XuMh7g
	QU+P5VQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqL0-0000000Dxfy-39pL;
	Thu, 22 Oct 2026 10:47:58 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqKx-0000000Dxf9-1ulE
	for linux-mtd@lists.infradead.org;
	Thu, 22 Oct 2026 10:47:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ABFD34E4125B;
	Thu, 22 Oct 2026 10:47:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 62E1060360;
	Thu, 22 Oct 2026 10:47:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 760F110328D6E;
	Thu, 22 Oct 2026 12:47:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792666072; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gvdAk8PUxpYgSiS/h7dzJZtjfb09gWIuT4zPW30I1Fc=;
	b=QArawM2vEriQuM5fvOOjuZ0qXrN0OQ/7B1ExbBQX5m97I75QAOaVU7998qvsxTolWnLV2+
	o8UqVfqhjWNLVr18Qglx2xQ9wAVNxW5HZfW1tl7j0ZGb/LZYWAqUAuCs10NvZpSazi2/nu
	WqAepilraqT8lEyh4IT3vIPoMMlXxJFpKE00yrfn/X7RIj5iyoN4bBFY/tuh0EakFJkEf+
	N60uf7CWzw97Rm2tn77AYei+UXZCFCMN5ZRy/e3lmt3EhwLujISZ8ltTHzi4nsHe58O7uI
	vcpnxupji6uCkfMToVU7eIV2EpzB5tWWfXo6Ec1ePLH5giPphlgbSqWHNOi08A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Mark Brown <broonie@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-spi@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v1 4/4] mtd: spi-nor: macronix: Add 1-4-4 DTR read
 support for MX66L1G45G
In-Reply-To: <20261022102614.75696-5-changhuang.liang@starfivetech.com>
	(Changhuang Liang's message of "Thu, 22 Oct 2026 03:26:14 -0700")
References: <20261022102614.75696-1-changhuang.liang@starfivetech.com>
	<20261022102614.75696-5-changhuang.liang@starfivetech.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 22 Oct 2026 12:47:45 +0200
Message-ID: <87tsmeovu6.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_034755_635246_8E9DAFD4 
X-CRM114-Status: GOOD (  11.72  )
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

T24gMjIvMTAvMjAyNiBhdCAwMzoyNjoxNCAtMDcsIENoYW5naHVhbmcgTGlhbmcgPGNoYW5naHVh
bmcubGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4gd3JvdGU6Cgo+IFRoZSBNWDY2TDFHNDVHIHN1cHBv
cnRzIHRoZSAxLTQtNCBEVFIgcmVhZCBtb2RlLiBUaGlzIGZsYXNoIHVzZXMgNgo+IGR1bW15IGN5
Y2xlcyBieSBkZWZhdWx0IGluIDEtNC00IERUUiBtb2RlLCBidXQgdGhlIGtlcm5lbCdzIFNGRFAK
PiBwYXJzZXIgZG9lcyBub3QgZGVyaXZlIGFueSBTTk9SX0hXQ0FQU19SRUFEXzFfNF80X0RUUiBj
YXBhYmlsaXR5IGZyb20KPiB0aGUgQkZQVCB0YWJsZSwgYW5kIDRCQUlUIG9ubHkgZmlsdGVycyBh
bHJlYWR5LWtub3duIGNhcGFiaWxpdGllcy4KPiBUaGUgZXhhY3QgbnVtYmVyIG9mIGR1bW15IGN5
Y2xlcyBpcyBhbHNvIG5vdCBkaXJlY3RseSBnaXZlbiBpbiB0aGUKPiBTRkRQIHRhYmxlcy4KPgo+
IFRoZXJlZm9yZSwgaW1wbGVtZW50IGxhdGVfaW5pdCB0byBpbml0aWFsaXplIHN1cHBvcnQgZm9y
IHRoaXMgb3Bjb2RlLAo+IGNvbmZpZ3VyaW5nIHRoZSByZWFkIHNldHRpbmdzIHdpdGggdGhlIGRl
ZmF1bHQgNiBkdW1teSBjeWNsZXMuIFdoZW4gYQo+IDRCQUlUIHRhYmxlIGlzIHByZXNlbnQsIFNG
RFAgcGFyc2luZyBoYXMgYWxyZWFkeSBjb252ZXJ0ZWQgYWxsIHJlYWQKPiBvcGNvZGVzIHRvIHRo
ZWlyIDQtYnl0ZSB2YXJpYW50cyBhbmQgc3BpX25vcl9zZXRfNGJ5dGVfb3Bjb2RlcygpIGlzCj4g
c2tpcHBlZCBsYXRlciBvbiwgc28gc2VsZWN0IHRoZSA0LWJ5dGUgb3Bjb2RlIGluIHRoYXQgY2Fz
ZS4KPgo+IFRoZSBwYXJ0IGFsc28gc3VwcG9ydHMgdGhlIDQtYnl0ZSBvcGNvZGUgc2V0IGJ1dCBp
dHMgU0ZEUCBkb2VzIG5vdAo+IGV4cG9zZSBhIDRCQUlUIHRhYmxlLCBzbyBzZXQgU1BJX05PUl80
Ql9PUENPREVTIGxpa2UgTVg2Nkw1MTIzNUYKPiAoMHhjMiAweDIwIDB4MWEpIHRvIGxldCBzcGlf
bm9yX3NldF80Ynl0ZV9vcGNvZGVzKCkgcGljayB0aGUgNC1ieXRlCj4gdmFyaWFudHMsIGluY2x1
ZGluZyAweEVFIGZvciAxLTQtNCBEVFIuCj4KPiBBZGQgYSBkZWRpY2F0ZWQgZml4dXAgZm9yIHRo
ZSBwYXJ0IChTTk9SX0lEIDB4YzIsIDB4MjAsIDB4MWIpIHRoYXQKPiBrZWVwcyB0aGUgZXhpc3Rp
bmcgUVBQIDQtYnl0ZSBwb3N0LVNGRFAgZml4dXAgYW5kIGFkZGl0aW9uYWxseQo+IGFkdmVydGlz
ZXMgdGhlIDEtNC00IERUUiByZWFkIGNhcGFiaWxpdHkgaW4gbGF0ZV9pbml0Lgo+Cj4gU2lnbmVk
LW9mZi1ieTogQ2hhbmdodWFuZyBMaWFuZyA8Y2hhbmdodWFuZy5saWFuZ0BzdGFyZml2ZXRlY2gu
Y29tPgoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+CgpNYXliZSBpbiB5b3VyIHYyIHlvdSBjYW4gYWRkIChhcyBoaW50ZWQgaW4gdGhlIGRvY3Vt
ZW50YXRpb24pIHRyYWNlcyBvZgphIHRlc3QgcnVuIHdpdGggdGhlIFNGRFAgdGFibGVzLCBwcm9v
ZiB0aGF0IGl0IHdvcmtzIGluIHRoaXMgbW9kZSwgZXRjLgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
