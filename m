Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E09C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 11:29:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A6C961090
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 11:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A6C961090
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gBh7znycKe30NKYVi34SqyF+OMQBBq/LWXnnCqNReAM=; b=qKZ5a+eUu7cNYIn+1e0ETgwdQ
	/F26xYAlUUN1iYTj8ugkF1QQX9g2rGn2z7fnwRuE62AHAVqb/DzsbwpHzuX1BmPE2w8oWRtrhtalr
	Q7GFJ42dO1548++3RBDKHZtsoMBTDQB4Jt6NDW0m+rnN18fhvJGfPhZiN1lrM86IRc60BWccdP3kI
	TTP95uZrPg6nfFNIT0BWDs8jtGskmYrY7KKR80NQh+EY9vYZ5Yrr+QLzq1SvB2KG43Utk/IpESEfD
	gigCgrtq6A5Usbh6/8dsp91CGLDfHZlOgVW5EiRyUCi7AYMYUONHvfslC9SMrBuvIKqT35qcZ/wip
	emYyB8PXQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg44G-00E56X-K6; Mon, 10 May 2021 11:27:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3aC-00E17Y-DU
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:56:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=iWUeK2PqDSRFaktxZLICjM40m4zqCdHBJYeF9A6ntKE=; b=ky+ByrpylmUoHaJmYiE1i3EdPs
 +wd6PmaDgzUrWX5cM9QPpcLBvIBLJSH8vy1QQjjDzpmUJcX8Vzw1oVLuKdAIxRhA+IprgnzIZ+pxX
 zv1TdkapAA5J3WFqAOpVAqLgXGbVCVoYi6Hj1pXeCLwXGkwtOVA8Nz4DnuExEMxtDh5mVz8G94cCs
 4T58LHq63kafuPsCCmYCxhpADN1K1s+FejEqPjVoh+YKqhOrrRP7IDncJDakxms9V7CjtuGaIW3lt
 BnmC4/7ezLBSHTdTAE3jIi29wLew9fGdIBPHNWc/Og4sowWWeosIB88shFVJcFf8QE/ZtJ+PPd9ri
 GOcmjbJw==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3a9-008ZwW-FS
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:56:15 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id DF71822239;
 Mon, 10 May 2021 12:56:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1620644171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iWUeK2PqDSRFaktxZLICjM40m4zqCdHBJYeF9A6ntKE=;
 b=YeM6fRkHW74iwurDFGDfYcLlc0Y+YKODFZHiR6FpGVIucUNfMZXxn+yGkDEfzGWRCpv41q
 aI2xbP2v3i/F+C8iB423NskLl6FgSHfuav1CBZ1ofD8bdTBXk2oErGKz20CnjCANNcY+3B
 ULL3JWYRiMhABDiTl4ohtUb6g05M/V8=
MIME-Version: 1.0
Date: Mon, 10 May 2021 12:56:10 +0200
From: Michael Walle <michael@walle.cc>
To: David Bauer <mail@david-bauer.net>
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: Add support for BoHong bh25q128as
In-Reply-To: <0b8be4c9-4528-8cac-2067-4ad2b180df79@david-bauer.net>
References: <20210509144716.431650-1-mail@david-bauer.net>
 <752e8869acebdeeaf5dc775a5af35ffc@walle.cc>
 <796a15bd-66d9-b1a5-2258-b692f23364fe@david-bauer.net>
 <ef20e03c43d2eacff7133f74a118ea43@walle.cc>
 <0b8be4c9-4528-8cac-2067-4ad2b180df79@david-bauer.net>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <ee4c8e3ebbe0b4cf762bbcb3a4b0e6dc@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_035613_689119_B91EBE7B 
X-CRM114-Status: GOOD (  27.43  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjAyMS0wNS0xMCAxMjoyNywgc2NocmllYiBEYXZpZCBCYXVlcjoKPiBPbiA1LzEwLzIxIDEx
OjM1IEFNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+PiBBbSAyMDIxLTA1LTEwIDExOjI4LCBzY2hy
aWViIERhdmlkIEJhdWVyOgo+Pj4gT24gNS8xMC8yMSAxMDowMCBBTSwgTWljaGFlbCBXYWxsZSB3
cm90ZQo+Pj4gCj4+PiBbLi4uXQo+Pj4gCj4+Pj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNo
X2luZm8gYm9ob25nX3BhcnRzW10gPSB7Cj4+Pj4+ICvCoMKgwqAgLyogQm9Ib25nIE1pY3JvZWxl
Y3Ryb25pY3MgKi8KPj4+Pj4gK8KgwqDCoCB7ICJiaDI1cTEyOGFzIiwgSU5GTygweDY4NDAxOCwg
MCwgNjQgKiAxMDI0LCAyNTYsCj4+Pj4gCj4+Pj4gSSBjb3VsZG4ndCBmaW5kICJCb0hvbmciIGlu
IEpFUDEwNkJDLiAweDY4ICh3aXRob3V0IGNvbnRpbnVhdGlvbiAKPj4+PiBjb2RlcykKPj4+PiBp
cyAiQ29udmV4IENvbXB1dGVyIi4gU28gdGhpcyBpcyB3cm9uZy4gT1RPSCBJJ20gbm90IHN1cmUs
IGhvdyBtYW55Cj4+Pj4gU1BJIGZsYXNoZXMgImNvbnZleCBjb21wdXRlciIgaGF2ZSwgaWYgYW55
IDspIFRoaXMgY29tcGFueSB3YXMgCj4+Pj4gYnJvdWdodAo+Pj4+IGJ5IEhQIGluIHRoZSBlbmQu
Cj4+Pj4gCj4+Pj4gSW4gYW55IGNhc2UsIHRoaXMgcGF0Y2ggZGVwZW5kcyBvbiBob3cgd2UgaGFu
ZGxlIGNvbnRpbnVhdGlvbiBjb2RlcyAKPj4+PiBvcgo+Pj4+IGlmIHdlIGNhbiBoYW5kbGUgdGhl
bSBhdCBhbGwuIE9yIGlmIHRoaXMgZmxhc2gganVzdCBsaWUgYWJvdXQgaXRzCj4+Pj4gbWFudWZh
Y3R1cmVyIGlkIGFuZCBkb24ndCBhbmQgQ0MuCj4+PiAKPj4+IEZpcnN0IG9mIGFsbCwgQm9Ib25n
IGFuZCBCb3lhIG1pY3JvZWxlY3Ryb25pY3Mgc2VlbXMgdG8gYmUgdGhlIHNhbWUKPj4+IGNvbXBh
bnksIGFzIHRoZWlyIGRhdGFzaGVldHMgc2VlbSB0byBjb3B5IGVhY2ggb3RoZXIuIFRoZXJlJ3Mg
bm90IAo+Pj4gbXVjaAo+Pj4gaW5mb3JtYXRpb24gYWJvdXQgZWl0aGVyIG9mIGJvdGgsIHNvIEkn
ZCBzYXkgdGhhdCdzIGEgZmFpciAKPj4+IGFzc3VtcHRpb24uCj4+PiAKPj4+IFJlZ2FyZGluZyB0
aGUgY29udGludWF0aW9uIGNvZGVzLCBCb3lhIGlzIGxpc3RlZCBpbiBiYW5rIG5pbmUsIAo+Pj4g
aG93ZXZlcgo+Pj4gaW4gdGhpcyBjYXNlIEkgc2hvdWxkIGN1cnJlbnRseSByZWFkIGFuIGFsbCAw
eDdmIElEIHNob3VsZG4ndCBJPwo+PiAKPj4gSSdkIGd1ZXNzIHNvLCB5ZXMuCj4+IAo+Pj4gVGhl
IGRhdGFzaGVldCBhbHNvIG9ubHkgc3BlY2lmaWVzIDMgYnl0ZXMgYXMgYSByZXR1cm4gdmFsdWUg
Zm9yCj4+PiByZWdpc3RlciAweDlmaCA6KAo+PiAKPj4gWWVhaC4gU28sIHRoaXMgZmxhc2ggZmFs
bHMgaW50byB0aGUgc2FtZSBjYXRlZ29yeSAic2ltcGx5IGhpamFja3MKPj4gYSBtYW51ZiBpZCIg
YXMgYWxsIHRoZSBvdGhlciBmbGFzaGVzLgo+IAo+IEZyb20gYSBxdWljayBjaGVjaywgdGhpcyBp
cyBhbHNvIGJlIHRoZSBjYXNlIGZvciBHaWdhRGV2aWNlcyBhbmQgWE1DLgo+IAo+IE15IHNwb250
YW5lb3VzIGlkZWEgd291bGQgYmUgdG8gZXh0ZW5kIHN1cHBvcnQgZm9yIEpFREVDIElEcyB0byBy
ZWFkCj4gdGhlIHVwIHRvIDkgYmFua3Mgb2YgdGhlIHZlbmRvciBJRCBhbmQgZml4IHVwIHRoZSBl
eGlzdGluZyBvZmZlbmRlcnMuCgp5b3UgbWVhbiBnaWdhZGV2aWNlcyBhbmQgeG1jPyBJJ2QgcHJl
c3VtZSB0aGV5IGFyZSBhbHNvIGxhY2tpbmcgdGhlCmNvbnRpbnVhdGlvbiBieXRlcy4KCj4gVG8g
bm90IGJyZWFrIGV4aXN0aW5nIGJvYXJkcywgd2UgY291bGQgZWl0aGVyIHNraXAgdGhlIGNvbnRp
bnVhdGlvbgo+IGJ5dGVzIG9mIHRoZSBrZXJuZWwgSUQgZGVmaW5pdGlvbnMgZm9yIGFsbCBmbGFz
aCBjaGlwcyBvciBmbGFnIHRoZQo+IGFscmVhZHkgZXhpc3Rpbmcgb25lcyBhbmQgb25seSBwZXJm
b3JtIHRoaXMgb24gc3VjaCBmbGFnZ2VkIGNoaXBzLgo+IAo+IFBlcnNvbmFsbHksIEknZCBzYXkg
dGhhdCBvbmx5IHBlcmZvcm1pbmcgdGhpcyBvbiBleGlzdGluZyBjaGlwcyB3b3VsZAo+IGJlIGJl
dHRlciwgYXMgbmV3IHZlbmRvcnMgd2l0aCB0aGlzIHZpb2xhdGlvbiBzY2hlbWUgbWlnaHQgcHJv
YmFibHkKPiBhcHBlYXIgYW5kIGNhdXNlIGNvbmZsaWN0cy4KPiAKPiBBcyB3ZSBzdGlsbCBsYWNr
IGF1dG8gZGV0ZWN0aW9uIGZvciBuZXcgY2hpcHMgd2l0aCB0aGF0LCBjb25maWd1cmluZwo+IHRo
ZSBmbGFzaCBjaGlwIHVzZWQgd2l0aCB0aGUgY2hpcCBuYW1lIHZpYSBEVCB3b3VsZCBhbGxvdyB0
byBzZXQgdGhlCj4gZXhhY3QgY2hpcCB1c2VkIGFuZCBhbHNvIHZhbGlkYXRlIGlmIHRoZSBtYW51
ZmFjdHVyZXIgLyBwcm9kdWN0IGFmdGVyCj4gdGhlIGNvbnRpbnVhdGlvbiBiaXRzIG1hdGNoZXMg
dGhlIG9uZSByZWFkIGZyb20gdGhlIGNoaXAuCj4gCj4gV2hhdCBkbyB5b3UgdGhpbms/CgpJZiB5
b3UnZCBhc2sgbWUsIHVubGVzcyB0aGVyZSBpcyBhIHJlYWwgd29ybGQgY29uZmxpY3QsIEknZCBq
dXN0IGdvCmFoZWFkIGFuZCBhZGQgdGhlbSBhcyBpcy4gSWYgdGhlcmUgaXMgYSBjb25mbGljdCB3
ZSdkIG5lZWQgdG8gZmluZAphIHBlciBkZXZpY2UgcmVzb2x1dGlvbiBmb3IgaXQuCgpUaGVyZSBp
cyBhbm90aGVyIHByb2JsZW06IHNoYXJlZCBkZXZpY2UgaWRzIHBlciB2ZW5kb3IuIFNvbWUgKG1v
c3Q/KQpmbGFzaCB2ZW5kb3Igc2hhcmUgZGV2aWNlIGlkcyBvbiAic2ltaWxhciIgZmxhc2hlcywg
d2hpY2ggd2Ugc3RpbGwKbmVlZCB0ZWxsIGFwYXJ0IGluIHRoZSBrZXJuZWwuIFNvIHRlY2huaWNh
bGx5LCB0aGlzIGlzIHRoZSBzYW1lIHByb2JsZW0KYXMgd2l0aCBub24tZXhpc3RpbmcgY29udGlu
dWF0aW9uIGJ5dGVzLiBUd28gZGlmZmVyZW50IGZsYXNoZXMgc2hhcmluZwp0aGUgc2FtZSBpZC4g
Rm9yIG5vdywgd2UgbG9vayBmb3IgZGlmZmVyZW5jZXMgaW4gdGhlIFNGRFAuCgpSaWdodCBub3cs
IHRoZSBmbGFzaCBpcyBwcm9iZWQgZmlyc3QgYnkgaXRzIGlkIGFuZCB0aGUgdGhlIFNGRFAgaXMK
cmVhZCBhbmQgcGFyc2VkLiBUaGVyZSBhcmUgaWRlYXMgdG8gZmlyc3QgcmVhZCB0aGUgU0ZEUC4g
SGF2aW5nIHRoaXMKbWlnaHQgY29tZSBpbiBoYW5keSBoZXJlLCB0b28uIEVnLiB3ZSBjb3VsZCBm
aW5nZXJwcmludCB0aGUgZmxhc2gKYnkgaXRzIFNGRFAuCgpJIGtub3cgVmluZ2VzaCBpcyB3b3Jr
aW5nIG9uIHRoZSBjb250aW51YXRpb24gYnl0ZXMgc3R1ZmYuIFNvIEkgbWlnaHQKYmUgbGF0ZSB0
byB0aGUgcGFydHkgOykKClJlZ2FyZGluZyB0aGUgZGV2aWNlIHRyZWUgY29tcGF0aWJsZXMsIHRo
ZSBtYWludGFpbmVycyBkb2Vzbid0IGxpa2UKdGhhdCB2ZXJ5IG11Y2guIE1heWJlIGFzIGEgbGFz
dCByZXNvcnQgbWV0aG9kLgoKLW1pY2hhZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
