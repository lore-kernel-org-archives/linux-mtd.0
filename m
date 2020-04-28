Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82AFCC83000
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 08:55:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BD79206D9
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 08:55:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WEDUTE+q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BD79206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hUbqYBp/wxaXFBkuwaLc3yuGdVa4aPISz8/YJdtrKDs=; b=WEDUTE+qf87ubw
	npp82J4uWtny5jfZ4F6SwaRPypvquX4DA05oqbF68/PDzuyfYQ8UmKGguuVvmKfJx6C8LM8/j0llY
	PYq/hjslusM9nz+Qkbz6S3fT0un4+VuJ0Vr72uEsqwOUIM73+vIygKZeAUAWBjuSBs0y3V2kVLJFc
	rkS1rvPWIruypgMe+A9v/G+G95BwuZgASYhT2WGAnYJlQY5HuUUDwlfMmlbeldNiMsGczYuCx2qxy
	60nq1/ev/rJgnLSpC8oQ3h6T0vkhBZEFbn6qRPs1q6st2E86SQgbgUO3oBE5C/1CHIIBcZSAUB0kD
	xfRRk1NSGorjs+1EXz3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTM13-0004D7-4s; Tue, 28 Apr 2020 08:54:57 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTM0z-0004BP-Mo
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 08:54:55 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 706A920000E;
 Tue, 28 Apr 2020 08:54:45 +0000 (UTC)
Date: Tue, 28 Apr 2020 10:54:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 3/9] mtd: rawnand: onfi: Fix redundancy detection check
Message-ID: <20200428105444.0778d750@xps13>
In-Reply-To: <20200425102225.002e740e@collabora.com>
References: <20200424164042.26572-1-miquel.raynal@bootlin.com>
 <20200424164042.26572-4-miquel.raynal@bootlin.com>
 <20200425102225.002e740e@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_015453_880072_403A8774 
X-CRM114-Status: GOOD (  18.35  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBTYXQsIDI1IEFwcgoyMDIwIDEwOjIyOjI1ICswMjAwOgoKPiBPbiBGcmksIDI0
IEFwciAyMDIwIDE4OjQwOjM2ICswMjAwCj4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4gd3JvdGU6Cj4gCj4gPiBEdXJpbmcgT05GSSBkZXRlY3Rpb24sIHRoZSBDUkMg
ZGVyaXZlZCBmcm9tIHRoZSBwYXJhbWV0ZXIgcGFnZSBhbmQgdGhlCj4gPiBDUkMgc3VwcG9zZWQg
dG8gYmUgYXQgdGhlIGVuZCBvZiB0aGUgcGFyYW1ldGVyIHBhZ2UgYXJlIGNvbXBhcmVkLiBJZgo+
ID4gdGhleSBkbyBub3QgbWF0Y2gsIHRoZSBzZWNvbmQgdGhlbiB0aGUgdGhpcmQgY29waWVzIG9m
IHRoZSBwYWdlIGFyZQo+ID4gdHJpZWQuCj4gPiAKPiA+IFRoZSBjdXJyZW50IGltcGxlbWVudGF0
aW9uIGNvbXBhcmVzIHRoZSBuZXdseSBkZXJpdmVkIENSQyB3aXRoIHRoZSBDUkMKPiA+IGNvbnRh
aW5lZCBpbiB0aGUgZmlyc3QgcGFnZSBvbmx5LiBTbyBpZiB0aGlzIHBhcnRpY3VsYXIgQ1JDIGFy
ZWEgaGFzCj4gPiBiZWVuIGNvcnJ1cHRlZCwgdGhlbiB0aGUgZGV0ZWN0aW9uIHdpbGwgZmFpbCBm
b3IgYSB3cm9uZyByZWFzb24uCj4gPiAKPiA+IEZpeCB0aGlzIGlzc3VlIGJ5IGNoZWNraW5nIHRo
ZSBkZXJpdmVkIENSQyBhZ2FpbnN0IHRoZSByaWdodCBvbmUuCj4gPiAgIAo+IAoKWWVzLCBidXQg
Z2l2ZW4gdGhlIGZhY3QgdGhhdCB3ZSBtb3ZlZCB0aGlzIGNvZGUgb3V0IG9mIG5hbmRfYmFzZS5j
CnNlbmRpbmcgaXQgdG8gc3RhYmxlIHdvdWxkIG5vdCBhcHBseSwgSSBkb24ndCBrbm93IHdoYXQn
cyBiZXN0IGluIHRoaXMKY2FzZT8KClRoZSBmYXVsdHkgY29tbWl0IGJlaW5nCjM5MTM4YzFmNGEz
MSBtdGQ6IHJhd25hbmQ6IHVzZSBiaXQtd2lzZSBtYWpvcml0eSB0byByZWNvdmVyIHRoZSBPTkZJ
IHBhcmFtIHBhZ2UKCj4gVGhpcyBvbmUgcHJvYmFibHkgZGVzZXJ2ZXMgRml4ZXMgYW5kIENjLXN0
YWJsZSB0YWdzLgo+IAo+ID4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlz
LmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9y
YXcvbmFuZF9vbmZpLmMgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9uYW5kX29uZmkuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfb25maS5jCj4gPiBpbmRl
eCAwYjg3OWJkMGE2OGMuLjhmZThkN2JkZDIwMyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L25hbmRfb25maS5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5k
X29uZmkuYwo+ID4gQEAgLTE3Myw3ICsxNzMsNyBAQCBpbnQgbmFuZF9vbmZpX2RldGVjdChzdHJ1
Y3QgbmFuZF9jaGlwICpjaGlwKQo+ID4gIAkJfQo+ID4gIAo+ID4gIAkJaWYgKG9uZmlfY3JjMTYo
T05GSV9DUkNfQkFTRSwgKHU4ICopJnBbaV0sIDI1NCkgPT0KPiA+IC0JCQkJbGUxNl90b19jcHUo
cC0+Y3JjKSkgewo+ID4gKwkJICAgIGxlMTZfdG9fY3B1KHBbaV0uY3JjKSkgewo+ID4gIAkJCWlm
IChpKQo+ID4gIAkJCQltZW1jcHkocCwgJnBbaV0sIHNpemVvZigqcCkpOwo+ID4gIAkJCWJyZWFr
OyAgCj4gCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
