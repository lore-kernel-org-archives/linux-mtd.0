Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F0CC83007
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 09:05:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E42552072A
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 09:05:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XHIW/qTl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E42552072A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Re/XlvsyjssRNPt/vFsF5Bu0kgP3qkrfK12yBnIdA1c=; b=XHIW/qTlUSFgUo
	fDaJiP2YT4i3FVgud4xQ4tE/D02Nj3q7G3qD44behxAcaUAalztnzAjSrZ7fGWtJd/gT0cUvuDWL0
	5NfrP3VUn/kartjudiRB+NYkWDZxBVGpZ4TYSg2at2e7OjFGxlnIMzSE2IZPss6aJ9Sm7N7e34wcC
	mephJCtz3hY+WeDdbJh7sBK6UOH5/LxAxnXXz+9p7IY59yrd9Fo+0HKah8MCgR/rBdkU8D8tOj7a3
	bBOB23i8rzxRkIKh1bdA4SUbKc01SBmaDtQzEeW2DIiyK5cmFmCqkjNKXYqGdbJ55geekQ1CHudoF
	YqRhLtOZKbXK/249812A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTMAy-0003O6-01; Tue, 28 Apr 2020 09:05:12 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTMAu-0003NY-Dd
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 09:05:09 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 3826520001E;
 Tue, 28 Apr 2020 09:05:02 +0000 (UTC)
Date: Tue, 28 Apr 2020 11:05:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 05/10] mtd: rawnand: Rename the use_bufpoi variables
Message-ID: <20200428110501.2caafbd9@xps13>
In-Reply-To: <20200425104440.5a3144fe@collabora.com>
References: <20200424173631.14311-1-miquel.raynal@bootlin.com>
 <20200424173631.14311-6-miquel.raynal@bootlin.com>
 <20200425104440.5a3144fe@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_020508_594955_740D63D7 
X-CRM114-Status: GOOD (  13.99  )
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
Cc: Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBTYXQsIDI1IEFwcgoyMDIwIDEwOjQ0OjQwICswMjAwOgoKPiBPbiBGcmksIDI0
IEFwciAyMDIwIDE5OjM2OjI2ICswMjAwCj4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4gd3JvdGU6Cj4gCj4gPiBCb3RoIGluIG5hbmRfZG9fcmVhZF9vcHMoKSBhbmQg
bmFuZF9kb193cml0ZV9vcHMoKSB0aGVyZSBpcyBhIGJvb2xlYW4KPiA+IGNhbGxlZCB1c2VfYnVm
cG9pIHdoaWNoIGlzIHNldCB0byB0cnVlIGluIGNhc2Ugb2YgdW5hbGlnbmVkIHJlcXVlc3Qgb3IK
PiA+IHdoZW4gdGhlcmUgaXMgYSBuZWVkIGZvciBhIERNQS1hYmxlIGJ1ZmZlci4gSXQgYmFzaWNh
bGx5IG1lYW5zICJ1c2UgYQo+ID4gYm91bmNlIGJ1ZmZlciIuCj4gPiAKPiA+IERlcGVuZGluZyBv
biB0aGUgdmFsdWUgb2YgdXNlX2J1ZnBvaSwgdGhlIGJ1ZnBvaSB2YXJpYWJsZSBpcyBhbHdheXMK
PiA+IHVzZWQgYW5kIHdpbGwgZWl0aGVyIHBvaW50IHRvIHRoZSBvcmlnaW5hbCBidWZmZXIgb3Ig
dG8gdGhlIG5hbmRfY2hpcAo+ID4gc3RydWN0dXJlICJpbnRlcm5hbCBkYXRhIGJ1ZmZlciIgKHRo
aXMgYnVmZmVyIGlzIGFsbG9jYXRlZCB3aXRoCj4gPiBrbWFsbG9jKCkgb24gcHVycG9zZSBzbyB0
aGF0IGl0IHdpbGwgYmUgRE1BLWNvbXBsaWFudCkuCj4gPiAKPiA+IEluIGFsbCBjYXNlcyBidWZw
b2kgaXMgdXNlZCBzbyB0aGUgYm9vbGVhbiBuYW1lIGlzIG1pc2xlYWRpbmcuIFJlbmFtZQo+ID4g
dXNlX2J1ZnBvaSB0byBiZSB1c2VfYm91Y2VfYnVmIHRvIGJlIG1vcmUgYWNjdXJhdGUuCj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+ICAKPiAKPiBSZXZpZXdlZC1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25A
Y29sbGFib3JhLmNvbT4KPiAKPiBJIHdvbmRlciBpZiB3ZSBzaG91bGRuJ3QgZmluZCBhIGJldHRl
ciBuYW1lIGZvciBidWZwb2kgdG9vLiBOb3Qgc3VyZQo+IHdoYXQgdGhlIHBvaSBtZWFucyBoZXJl
IChwb2ludGVyPykuIFNvIG1heWJlIGp1c3QgcmVuYW1lIHRob3NlIGludG8KPiByZWFkX2J1Ziwg
d3JpdGVfYnVmIChzaW5jZSBidWYgc2VlbXMgdG8gYmUgZGVjbGFyZWQgYWxyZWFkeSkuCgpNeSBm
aXJzdCBwYXRjaCBhbHNvIHJlbmFtZWQgYnVmcG9pLgoKQWN0dWFsbHkgSSByZWFkIGl0IGxpa2Ug
ImJ1ZiBwb2ludGVyIiBhbmQgaXQgbWFrZXMgc2Vuc2UgYW5kIGlzIHVzZWQKYWxsIGFjcm9zcyBu
YW5kX2Jhc2UuYyBzbyBJIGRlY2lkZWQgdG8gbGV0IGl0IGFzLWlzIGZvciBub3cuCgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
