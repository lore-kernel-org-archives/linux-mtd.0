Return-Path: <SRS0=ASOq=UF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A27C04AB5
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2019 09:05:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 652E620693
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2019 09:05:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UD0mX/7q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 652E620693
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P6pCrJH21N36IJLk9fVPbciP7EZXa1Pq/ZcELt3V3cw=; b=UD0mX/7qnzUJ78
	0w2pzBLmB6dlaLDYffFvqy4RJpYp4OyAL3THlWxj8Tq1Qt13U1VVyYF+5SIzRsTJl25fHlVC30DWi
	ORBA78qujfdPYYzz3ChdnE1e8m4YKywQBRKMtiolEWqKx3E0dbghA1WbOkDgNLEdBSTpZiOI3hUwW
	ULwBm8Cb4wKe4wknAPbtP3LBvlXXVS9jwrZYALlDaZ+hB81lDVzZ0gC8NpmQrtzCRxGP/GBUYYYRI
	VaXENGhSNJwNzMX0a54rhRVGoOAmxXL8GS76ooZNquG+3oUlZ4D/8awK3yJbI6GPj3Ca8nJYb4+tY
	5d/HUMw2Dtp7qGo9lX5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYoKl-0005LJ-D3; Thu, 06 Jun 2019 09:05:19 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYoKc-0005Eu-Qv; Thu, 06 Jun 2019 09:05:13 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CF5C1260E01;
 Thu,  6 Jun 2019 10:05:08 +0100 (BST)
Date: Thu, 6 Jun 2019 11:05:05 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v2 01/15] mtd: nand: Add max_bad_eraseblocks_per_lun
 info to memorg
Message-ID: <20190606110505.68a56c4c@collabora.com>
In-Reply-To: <e8131767-fce8-0041-5c23-7b8ed71857c3@kontron.de>
References: <20190304201522.11323-1-miquel.raynal@bootlin.com>
 <20190304201522.11323-2-miquel.raynal@bootlin.com>
 <CAO1O6se5=FDf2YTEEzmFJ4K6HQp_2ayU=WubxGAQJdMA4V4m-Q@mail.gmail.com>
 <5e5d473b-2f08-4230-0920-247c2c463c55@kontron.de>
 <20190606103951.1d774b9a@collabora.com>
 <0e04c73d-13cd-4416-569b-ee9e7c19ea4d@kontron.de>
 <e8131767-fce8-0041-5c23-7b8ed71857c3@kontron.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_020511_135274_44B82978 
X-CRM114-Status: GOOD (  18.31  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mason Yang <masonccyang@mxic.com.tw>, Vignesh R <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, Emil Lenngren <emil.lenngren@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCA2IEp1biAyMDE5IDA4OjU3OjMyICswMDAwClNjaHJlbXBmIEZyaWVkZXIgPGZyaWVk
ZXIuc2NocmVtcGZAa29udHJvbi5kZT4gd3JvdGU6Cgo+IE9uIDA2LjA2LjE5IDEwOjUyLCBGcmll
ZGVyIFNjaHJlbXBmIHdyb3RlOgo+ID4gT24gMDYuMDYuMTkgMTA6MzksIEJvcmlzIEJyZXppbGxv
biB3cm90ZTogIAo+ID4+IE9uIFRodSwgNiBKdW4gMjAxOSAwODoyNzoxMSArMDAwMAo+ID4+IFNj
aHJlbXBmIEZyaWVkZXIgPGZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5kZT4gd3JvdGU6Cj4gPj4g
IAo+ID4+PiBIaSBFbWlsLAo+ID4+Pgo+ID4+PiBPbiAwNC4wNi4xOSAxMDowMSwgRW1pbCBMZW5u
Z3JlbiB3cm90ZTogIAo+ID4+Pj4gSGkgTWlxdWVsLCAgCj4gPj4+Pj4gwqDCoCBzdGF0aWMgY29u
c3Qgc3RydWN0IHNwaW5hbmRfaW5mbyBtYWNyb25peF9zcGluYW5kX3RhYmxlW10gPSB7Cj4gPj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIFNQSU5BTkRfSU5GTygiTVgzNUxGMUdFNEFCIiwgMHgxMiwK
PiA+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTkFORF9NRU1P
UkcoMSwgMjA0OCwgNjQsIDY0LCAxMDI0LCAxLCAxLCAxKSwKPiA+Pj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTkFORF9NRU1PUkcoMSwgMjA0OCwgNjQsIDY0LCAx
MDI0LCA0MCwgMSwgMSwgMSksCj4gPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgTkFORF9FQ0NSRVEoNCwgNTEyKSwKPiA+Pj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTUElOQU5EX0lORk9fT1BfVkFSSUFOVFMo
JnJlYWRfY2FjaGVfdmFyaWFudHMsCj4gPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAmd3JpdGVfY2FjaGVfdmFyaWFudHMsCj4gPj4+Pj4gQEAgLTEwMyw3ICsxMDMs
NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNwaW5hbmRfaW5mbyAKPiA+Pj4+PiBtYWNyb25peF9z
cGluYW5kX3RhYmxlW10gPSB7Cj4gPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgU1BJTkFORF9FQ0NJTkZPKCZteDM1bGZ4Z2U0YWJfb29ibGF5b3V0LAo+
ID4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbXgzNWxmMWdlNGFiX2VjY19nZXRfc3RhdHVzKSks
Cj4gPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIFNQSU5BTkRfSU5GTygiTVgzNUxGMkdFNEFCIiwg
MHgyMiwKPiA+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTkFO
RF9NRU1PUkcoMSwgMjA0OCwgNjQsIDY0LCAyMDQ4LCAyLCAxLCAxKSwKPiA+Pj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTkFORF9NRU1PUkcoMSwgMjA0OCwgNjQs
IDY0LCAyMDQ4LCAyMCwgMiwgMSwgMSksCj4gPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgTkFORF9FQ0NSRVEoNCwgNTEyKSwgIAo+ID4+Pj4KPiA+Pj4+
IE1heWJlIGEgYml0IGxhdGUgdG8gdGhlIGRpc2N1c3Npb24sIGJ1dCBzaG91bGRuJ3QgMjAgYW5k
IDQwIGJlIHN3YXBwZWQKPiA+Pj4+IGhlcmUsIGkuZS4gaXNuJ3QgaXQgdGhlIGxhcmdlciBmbGFz
aCB0aGF0IGhhcyBtb3JlIG1heCBiYWQgYmxvY2tzIHRoYW4KPiA+Pj4+IHRoZSBzbWFsbGVyIG9u
ZT8gIAo+ID4+Pgo+ID4+PiBJIHRoaW5rIE1pcXVlbCBpcyBvdXQgb2Ygb2ZmaWNlIGZvciBzb21l
IGRheXMsIHNvIEkganVzdCBjaGVja2VkIGFuZCB5b3UKPiA+Pj4gYXJlIHJpZ2h0LCB0aGUgbWF4
aW11bSBudW1iZXIgb2YgYmFkIGJsb2NrcyBzaG91bGQgYmUgc3dhcHBlZC4KPiA+Pj4KPiA+Pj4g
QWN0dWFsbHkgdGhlcmUgaXMgYWxzbyBhIHdyb25nIHZhbHVlIGluIHRoZSBHaWdhRGV2aWNlIGRy
aXZlcjogRm9yIHRoZQo+ID4+PiBHRDVGNEdRNHhBIGl0IHNob3VsZCBiZSA4MCBpbnN0ZWFkIG9m
IDQwLiAgCj4gPj4KPiA+PiBIYXZlbid0IGNoZWNrZWQgdGhlIGRhdGFzaGVldCwgYnV0IGtlZXAg
aW4gbWluZCB0aGF0IHRoaXMgaXMgdGhlIG1heAo+ID4+IG51bWJlciBvZiBlcmFzZWJsb2NrIHBl
ciBMVU4uICAKPiA+IAo+ID4gVGhlIGRhdGFzaGVldCBnaXZlcyAyMCBmb3IgdGhlIDFHIHR5cGUg
YW5kIDQwIGZvciB0aGUgMkcgdHlwZS4gQm90aCAKPiA+IHR5cGVzIGhhdmUgb25seSBvbmUgTFVO
LiBPbmx5IHRoZSAyRyB0eXBlIGhhcyAyIHBsYW5lcywgYnV0IHRoYXQgCj4gPiBzaG91bGRuJ3Qg
bWFrZSBhIGRpZmZlcmVuY2UsIHJpZ2h0PyAgCj4gCj4gU29ycnksIEkgd2FzIHJlZmVycmluZyB0
byB0aGUgTWFjcm9uaXggY2hpcHMuIFlvdSB3ZXJlIHByb2JhYmx5IHRhbGtpbmcgCj4gYWJvdXQg
dGhlIEdpZ2FEZXZpY2UuIEJ1dCB0aGV5IGFsbCBoYXZlIG9ubHkgb25lIExVTiwgdG9vLiBTbyBJ
IHRoaW5rIEkgCj4gZ290IGl0IHJpZ2h0LgoKR29vZCwganVzdCB3YW50ZWQgdG8gbWFrZSBzdXJl
IHlvdSB3ZXJlIGF3YXJlIG9mIHRoYXQgZmFjdC4gQXMgSSBzYWlkLApJIGRpZG4ndCBjaGVjayB0
aGUgZGF0YXNoZWV0LCBzbyBJIHRydXN0IHlvdSBvbiB0aGlzIG9uZS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
