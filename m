Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDBCC25B77
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2024 14:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7pBkQmOCRf1PjTcOavwSXBB+WGC4xSmuXKDBZLg6jDU=; b=MPGtNpLXTx1eiS
	Vxqsaucv8SZrpg9xRYeAacGhpsUGwzm3aFIINKLR/oTDmvvFo2WFhvwTkfL8P6hXWEmDka00kQy4h
	o02LGJViOPh9lw4PczDEhniyyJJfMjD2BxRahQFrLywfF5B3jTwBzhwj8DEGIG8iPdND1+g4hcU7Z
	OoP2DUIDK1rGsQpQZnxLiTQtVhTeGU25CU/fGtuNulTxDOBoOxNhLjSYHu30zHwvmA39PFlSO+Nud
	SDBhjV18DywMrf8eCi6TZwjRBlWiHoCfHPak4y1cTmFPYMSqV4B8md4B5qKg/5T+H6qauJme3W3E8
	LyaYyjZdLoVscThKuYuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7cMF-00000005CCb-3WJ3;
	Thu, 16 May 2024 14:45:23 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7cMC-00000005CAv-2zpd
	for linux-mtd@lists.infradead.org;
	Thu, 16 May 2024 14:45:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0017C40007;
	Thu, 16 May 2024 14:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715870717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oOs7/bHKgR222SIQmU7FD9JdgLv1BgNw+gxLOsxdL6Q=;
	b=px1o2/fBTXGA0HZ8ztj5KZTH6f4cco/C/bfjn0P0/rwHCinhOqsPFe8G00Dd0V4GszYr46
	O7kAzC30lwNjzVYN8VyIA8gtfxZ1VcuTM1zT/8kWZgWPFSeUtYFTcOxH6FV9mxz22xiryP
	1lVQo1ZzYEGRPiKXAVvuOZrUx1jVbb8xnjbzLD2nDEJSFQ8ylI4JAjWGhVjjGkDYwicr6b
	EMhsWF6RG2VGOFaBCkNEB4VL0nLhMq2ZHw+sC1aBh3QXSBHW9j744Isnn/MDvvJWVyKcb3
	VgisAhh6PIM08QFo/YyDQbAAeOfIqkNTT+LDSrlonyrun9ozXP5u6LI3YWvlwg==
Date: Thu, 16 May 2024 16:45:16 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Alexander Dahl <ada@thorsis.com>, Steven
 Seeger <steven.seeger@flightsystems.net>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mtd: rawnand: Bypass a couple of sanity checks
 during NAND identification
Message-ID: <20240516164516.4e5ad1cb@xps-13>
In-Reply-To: <ZkYPdbspX5tc0WRf@pengutronix.de>
References: <20240516131320.579822-1-miquel.raynal@bootlin.com>
	<20240516131320.579822-3-miquel.raynal@bootlin.com>
	<ZkYPdbspX5tc0WRf@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_074520_917452_7E65454C 
X-CRM114-Status: GOOD (  18.09  )
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

SGkgU2FzY2hhLAoKcy5oYXVlckBwZW5ndXRyb25peC5kZSB3cm90ZSBvbiBUaHUsIDE2IE1heSAy
MDI0IDE1OjUxOjQ5ICswMjAwOgoKPiBPbiBUaHUsIE1heSAxNiwgMjAyNCBhdCAwMzoxMzoyMFBN
ICswMjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gRWFybHkgZHVyaW5nIE5BTkQgaWRlbnRp
ZmljYXRpb24sIG10ZF9pbmZvIGZpZWxkcyBoYXZlIG5vdCB5ZXQgYmVlbgo+ID4gaW5pdGlhbGl6
ZWQgKG5hbWVseSwgd3JpdGVzaXplIGFuZCBvb2JzaXplKSBhbmQgdGh1cyBjYW5ub3QgYmUgdXNl
ZCBmb3IKPiA+IHNhbml0eSBjaGVja3MgeWV0LiBPZiBjb3Vyc2UgaWYgdGhlcmUgaXMgYSBtaXN1
c2Ugb2YKPiA+IG5hbmRfY2hhbmdlX3JlYWRfY29sdW1uX29wKCkgc28gZWFybHkgd2Ugd29uJ3Qg
YmUgd2FybmVkLCBidXQgdGhlcmUgaXMKPiA+IGFueXdheSBubyBhY3R1YWwgY2hlY2sgdG8gcGVy
Zm9ybSBhdCB0aGlzIHN0YWdlIGFzIHdlIGRvIG5vdCB5ZXQga25vdwo+ID4gdGhlIE5BTkQgZ2Vv
bWV0cnkuCj4gPiAKPiA+IFNvLCBpZiB0aGUgZmllbGRzIGFyZSBlbXB0eSwgZXNwZWNpYWxseSBt
dGQtPndyaXRlc2l6ZSB3aGljaCBpcyAqYWx3YXlzKgo+ID4gc2V0IHF1aXRlIHJhcGlkbHkgYWZ0
ZXIgaWRlbnRpZmljYXRpb24sIGxldCdzIHNraXAgdGhlIHNhbml0eSBjaGVja3MuCj4gPiAKPiA+
IG5hbmRfY2hhbmdlX3JlYWRfY29sdW1uX29wKCkgaXMgc3ViamVjdCB0byBiZSB1c2VkIGVhcmx5
IGZvciBPTkZJL0pFREVDCj4gPiBpZGVudGlmaWNhdGlvbiBpbiB0aGUgdmVyeSB1bmxpa2VseSBj
YXNlIG9mOgo+ID4gLSBiaXRmbGlwcyBhcHBlYXJpbmcgaW4gdGhlIHBhcmFtZXRlciBwYWdlLAo+
ID4gLSB0aGUgY29udHJvbGxlciBkcml2ZXIgbm90IHN1cHBvcnRpbmcgc2ltcGxlIERBVEFfSU4g
Y3ljbGVzLgo+ID4gCj4gPiBBcyBuYW5kX2NoYW5nZV9yZWFkX2NvbHVtbl9vcCgpIHVzZXMgbmFu
ZF9maWxsX2NvbHVtbl9jeWNsZXMoKSB0aGUgbG9naWMKPiA+IGV4cGxhaW5kIGFib3ZlIGFsc28g
YXBwbGllcyBpbiB0aGlzIHNlY29uZGFyeSBoZWxwZXIuCj4gPiAKPiA+IEZpeGVzOiBjMjc4NDJl
N2UxMWYgKCJtdGQ6IHJhd25hbmQ6IG9uZmk6IEFkYXB0IHRoZSBwYXJhbWV0ZXIgcGFnZSByZWFk
IHRvIGNvbnN0cmFpbnQgY29udHJvbGxlcnMiKQo+ID4gRml4ZXM6IGRhY2EzMTc2NWU4YiAoIm10
ZDogcmF3bmFuZDogamVkZWM6IEFkYXB0IHRoZSBwYXJhbWV0ZXIgcGFnZSByZWFkIHRvIGNvbnN0
cmFpbnQgY29udHJvbGxlcnMiKQo+ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiA+IFJl
cG9ydGVkLWJ5OiBBbGV4YW5kZXIgRGFobCA8YWRhQHRob3JzaXMuY29tPgo+ID4gQ2xvc2VzOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAyNDAzMDYtc2hha3ktYnVuaW9uLWQy
OGI2NWVhOTdkN0B0aG9yc2lzLmNvbS8KPiA+IFJlcG9ydGVkLWJ5OiBTdGV2ZW4gU2VlZ2VyIDxz
dGV2ZW4uc2VlZ2VyQGZsaWdodHN5c3RlbXMubmV0Pgo+ID4gQ2xvc2VzOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1tdGQvRE02UFIwNU1CNDUwNjU1NDQ1N0NGOTUxOTFBNjcwQkRFRjcw
NjJARE02UFIwNU1CNDUwNi5uYW1wcmQwNS5wcm9kLm91dGxvb2suY29tLwo+ID4gU2lnbmVkLW9m
Zi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gIAo+IAo+IFdp
dGggdGhlIGF0dGFjaGVkIGRlYnVnIHBhdGNoIGFwcGxpZWQgSSBjYW4gY29uZmlybSB0aGF0IEkg
Y2FuIG5vdyByZWFkCj4gYWxsIHRocmVlIE9ORkkgcGFyYW1ldGVyIHBhZ2VzIHN1Y2Nlc3NmdWxs
eSB1c2luZwo+IG5hbmRfY2hhbmdlX3JlYWRfY29sdW1uX29wKCksIHNvOgo+IAo+IFRlc3RlZC1i
eTogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPgoKRXhjZWxsZW50IQoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
