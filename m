Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA4CC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jan 2022 08:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vZShBpihGcXBgayLvvJWzQiYZ59kXjc8npSuNqvHtHA=; b=aQTmE1HaKZGkea
	Hc10/l3qQLHQpYsTgPVPQpcJoqtpv8ng83FzgNGdNAQ44eU493ncqsCAiVcY52F01C8HfVyolUCkk
	fEFGLEko6nFf0lot/tgwF6RSY+Gsu+mU0uaMRsxp3L7gXb53yewnDgCw/XTRIHIvJc9whP76yatRb
	sBYqtaP98tBhmN0joCl0OpuP8Rv7AdJmqBr90g0jZFeV3lyqyNb9DPahmPc/8Z3nTnp8NF38Gzezf
	j5heVMXOGzU+6rv0Tvn8HAxfdxqKaiBKBXgxJ2CRGExnOVnRHgY+4Xkh6aaCwF+bNQMrv0vY6K4+B
	GNLailYuca+eIkpzR5hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDMIy-000xFX-NU; Fri, 28 Jan 2022 08:08:24 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDMIv-000xER-Fs
 for linux-mtd@lists.infradead.org; Fri, 28 Jan 2022 08:08:23 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6794E60010;
 Fri, 28 Jan 2022 08:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643357297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jPnJR32xLLkbiFVCd9L8Sm2uwU+IkeHFVLp2nHMmM2g=;
 b=ocm2jVYL8+4LeyO6T7WpjtSRUfHDZYytFmONdZpAzAEdkC2WIW8Y15xn++kov76fBDEGA4
 jSFnQVZrrgYVDzysc6fOlyKPxC/dXtfV0aosKNRxFEZMDNNK0VSqVi/DFmeVh1wbDRTHl7
 HZ7fRq4dVTv/HDmy0lS3ljP4RD7ibnECct85DIt3ntqw2l6k9OvlLmnuOClmlxdFc3VNzp
 9J29/fMi3AlXebEu1Js/mIlQ/JXj63vk8zqkGUV6h18IxsM+60We8pT8sVqqvxbkNQGADz
 aGQ2ZZKGuYNMtxtd52rYwNizxml7GD4z0S+Uc97bL49x5Hv1rC+iHqo6lGtRgg==
Date: Fri, 28 Jan 2022 09:08:12 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Boris Brezillon
 <boris.brezillon@collabora.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Julien Su <juliensu@mxic.com.tw>, Jaime
 Liao <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v10 00/13] External ECC engines & Macronix support
Message-ID: <20220128090812.5b7a5982@xps13>
In-Reply-To: <YfL5ApsG7c619+R0@sirena.org.uk>
References: <20220127091808.1043392-1-miquel.raynal@bootlin.com>
 <YfL5ApsG7c619+R0@sirena.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_000821_728888_80B547B1 
X-CRM114-Status: GOOD (  22.73  )
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

SGkgTWFyaywKCmJyb29uaWVAa2VybmVsLm9yZyB3cm90ZSBvbiBUaHUsIDI3IEphbiAyMDIyIDE5
OjU2OjUwICswMDAwOgoKPiBPbiBUaHUsIEphbiAyNywgMjAyMiBhdCAxMDoxNzo1NUFNICswMTAw
LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGVsbG8gYWxsLAo+ID4gCj4gPiBJJ3ZlIGFwcGxp
ZWQgdGhlIGJlZ2lubmluZyBvZiB0aGUgc2VyaWVzIChiaW5kaW5ncyArIEVDQyBwYXJ0KSBpbiBh
Cj4gPiBicmFuY2ggbmFtZWQgc3BpLW1lbS1lY2Mgb24gdGhlIE1URCBrb3JnIHJlcG9zaXRvcnku
IEkgYWxyZWFkeSBhcHBsaWVkCj4gPiB0aGlzIHNlY29uZCBoYWx2ZSBvbiB0b3Agb2YgdGhlIHNw
aS1tZW0tZWNjIGJyYW5jaCBidXQgdGhlcmUgd2FzIGEKPiA+IG1pc3VuZGVyc3RhbmRpbmcgYW5k
IHRoZXkgZW5kZWQgdXAgbm90IGJlaW5nIGZ1bGx5IHJldmlld2VkLiBIZW5jZSBoZXJlCj4gPiB0
aGVyZSBhcmUgb25jZSBhZ2FpbiwgdGhlcmUgYXJlIG5vIGNoYW5nZXMgc2luY2UgdjkgYmVzaWRl
IHRoZSByZWJhc2UuICAKPiAKPiBUaGlzIGxvb2tzIGdvb2QsIHBsZWFzZSBzZW5kIGEgcHVsbCBy
ZXF1ZXN0LgoKR3JlYXQgdGhhbmtzIQoKPiBJbiBnZW5lcmFsIGZvciBmdXR1cmUgcmVmZXJlbmNl
IGlmIHRoZXJlJ3MgcGF0Y2hlcyBmb3Igb25lIG9mIG15Cj4gc3Vic3lzdGVtcyB0aGF0IEkndmUg
bm90IGV4cGxpY2l0bHkgY29tbWVudGVkIG9uIEknbSBwcm9iYWJseSBleHBlY3RpbmcKPiB0byBh
cHBseSB0aGVtLgoKT2ggeWVhaCB0aGlzIGlzIHZlcnkgY2xlYXIsIGJ1dCBhcyB0aGlzIHNlcmll
cyBoZWF2aWx5IGRlcGVuZHMgb24gc29tZQpjb3JlIE1URCBjaGFuZ2VzIGFzIHdlbGwsIGl0IHdh
cyBkZWNpZGVkIHRoYXQgZXZlcnl0aGluZyB3b3VsZCBiZSBtZXJnZWQKaW4gb25lIG9wZXJhdGlv
biBhbmQgdGhhdCdzIHdoeSBJIHN0YXJ0ZWQgY29uc3RydWN0aW5nIHRoZSBzcGktbWVtLWVjYwpi
cmFuY2gsIHdoaWNoIHRvdWNoZXMgZm91ciBkaWZmZXJlbnQgJ2NvcmVzJzogbmFuZCwgc3BpLW5h
bmQsIHNwaSwKc3BpLW1lbS4KCkJlY2F1c2Ugb2YgdGhlIGxhc3QgbWludXRlIHJldmlld3Mgcmln
aHQgYmVmb3JlIHRoZSBiZWdpbm5pbmcKb2YgdGhlIG1lcmdlIHdpbmRvdyBJIGRlY2lkZWQgbm90
IHRvIGFwcGx5IHRoZSBzZWNvbmQgaGFsdmUgb2YgdGhlCnNlcmllcyB0b28gcXVpY2tseSBhbmQg
ZGVsYXllZCB0aGUgd2hvbGUgcGF0Y2hzZXQgaW5jbHVkaW5nIHRoZQpwcmV2aW91cyBwYXRjaGVz
IHdoaWNoIGhhZCBubyBpbnRlcmVzdCBvbiB0aGVpciBvd24uCgo+IE9uIEZyaSwgTm92IDI2LCAy
MDIxIGF0IDAzOjEwOjU5UE0gKzAxMDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gCj4gPiBJZiB5
b3UgYWNrbm93bGVkZ2UgdGhlIFNQSSBiaXRzIEkgYmVsaWV2ZSBJIGNhbiBjYXJyeSB0aGUgZW50
aXJlIHNlcmllcwo+ID4gdGhyb3VnaCB0aGUgTVREIHRyZWUuIElmIHlvdSBmZWFyIGNvbmZsaWN0
cyBhbmQgbmVlZCBhbiBpbW11dGFibGUgdGFnIEkKPiA+IGNhbiBhbHNvIGRvIHRoYXQuICAKPiAK
PiBJdCdkIGJlIGdvb2QgdG8gaGF2ZSB0aGUgdGFnIGp1c3QgaW4gY2FzZSwgdGhlcmUncyBnZW5l
cmFsbHkgYSBsb3Qgb2YKPiB3b3JrIGluIHRoaXMgYXJlYS4KPiAKPiBSZXZpZXdlZC1ieTogTWFy
ayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPgoKQXMgdGhyZWUgcGF0Y2hlcyBpbiB0aGlzIHNl
cmllcyB3ZXJlIG5ldy9yZXdvcmtlZCBJIGRyb3BwZWQgeW91ciB0YWcKdGhlcmUuIEkgc2hvdWxk
IGhhdmUgYXNrZWQgeW91IGFnYWluLiBTaGFsbCBJIGFkZCB0aGVtIChiYWNrKSB0byB0aGUKZm9s
bG93aW5nIHBhdGNoZXM/CgoJc3BpOiBjYWRlbmNlLXF1YWRzcGk6IFByb3ZpZGUgYSBjYXBhYmls
aXR5IHN0cnVjdHVyZQoJc3BpOiBteGljOiBQcm92aWRlIGEgY2FwYWJpbGl0eSBzdHJ1Y3R1cmUK
CXNwaTogc3BpLW1lbTogSW50cm9kdWNlIGEgY2FwYWJpbGl0eSBzdHJ1Y3R1cmUKClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
