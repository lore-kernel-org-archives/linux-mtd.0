Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DACC10F16
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2024 15:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rcJy9DNzjCJvB+ApRem6p5ObPanr5fM6cLMib8UzfHw=; b=xmrNmb0g//Gkmm
	i71um6sWODh7/R94IXB93EfGsfznjdo6wy/KmSXce+Vf3ONN7TP40kcegTdxVECjqu40QhG46GZAs
	dWOfUkuy5CwJbj/3Ma710HS0FbgVF4S3Vs7mAUaKs5xDuDtwsGKJsjoaHx0hBSYSlLHzwMe9MuHh4
	LIUYgfYCOgs+OYp5O2YKroe0dUOthF1p2SQgB1HpIslARN4wVInR6N0TPlFc8ucfrvKqygGMQ5lba
	bNT3awgAzJMkLXFCO83Y7QqOzqOh3ztTE6sMHGuMi+v5JtSHXaY3QphHl8G2GLNRL3GxjbUp35Q0H
	GFx62FV3dyH2lVFO2FHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s40cV-00000007vUH-3AHD;
	Mon, 06 May 2024 15:51:15 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s40cS-00000007vTM-0cS7
	for linux-mtd@lists.infradead.org;
	Mon, 06 May 2024 15:51:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67238240004;
	Mon,  6 May 2024 15:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715010668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d+wTVg9eOKsGtIWDYqk4CtYV7Tl016exC8KiZRLJoqE=;
	b=DMxsEuxPJV+g6UtG+YRF085ccKcoCV9LqOJQaiQdVRIkEPTFaqNFe0kyDd4bPCdSSFtchG
	vNb0dC8m1UQ1A5AzO7NZoLVL4hQFIo66foSZkBiHS4oDip3EiSgcoDpifv5bhaXO5PWjQd
	3/fwWeOSR6/uksRPEgXMgyThettoGd8FsbcZR/2vouiGB55LwfJPmsQCROa7pxbeNTEnPq
	L0jxv2kdIQSiZ+20vIb9pxjyI4wf2eiharJlf3lJjWD9DB4qcTGtc5uEL2zOokUwGorKKX
	baE/tGQwBL1xKdnrRXyIbuPajYd/1y8ZdLkx56k6FoP/0qmvuIeS/+xPpT/ycg==
Date: Mon, 6 May 2024 17:51:06 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] mtd: nand: mxc_nand: support software ECC
Message-ID: <20240506175106.2ab7c844@xps-13>
In-Reply-To: <20240506160508.6c60d50f@xps-13>
References: <20240417-mtd-nand-mxc-nand-exec-op-v1-0-d12564fe54e9@pengutronix.de>
	<20240417-mtd-nand-mxc-nand-exec-op-v1-3-d12564fe54e9@pengutronix.de>
	<20240506160508.6c60d50f@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_085112_637581_6EF3E58B 
X-CRM114-Status: GOOD (  26.32  )
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

SGkgTWlxdWVsLAoKbWlxdWVsLnJheW5hbEBib290bGluLmNvbSB3cm90ZSBvbiBNb24sIDYgTWF5
IDIwMjQgMTY6MDU6MDggKzAyMDA6Cgo+IEhpIFNhc2NoYSwKPiAKPiBzLmhhdWVyQHBlbmd1dHJv
bml4LmRlIHdyb3RlIG9uIFdlZCwgMTcgQXByIDIwMjQgMDk6MTM6MzAgKzAyMDA6Cj4gCj4gPiBU
byBzdXBwb3J0IHNvZnR3YXJlIEVDQyB3ZSBzdGlsbCBuZWVkIHRoZSBkcml2ZXIgcHJvdmlkZWQg
cmVhZF9vb2IsCj4gPiByZWFkX3BhZ2VfcmF3IGFuZCB3cml0ZV9wYWdlX3JhdyBvcHMsIHNvIHNl
dCB0aGVtIHVuY29uZGl0aW9uYWxseQo+ID4gbm8gbWF0dGVyIHdoaWNoIGVuZ2luZV90eXBlIHdl
IHVzZS4gVGhlIE9PQiBsYXlvdXQgb24gdGhlIG90aGVyIGhhbmQKPiA+IHJlcHJlc2VudHMgdGhl
IGxheW91dCB0aGUgaS5NWCBFQ0MgaGFyZHdhcmUgdXNlcywgc28gc2V0IHRoaXMgb25seQo+ID4g
d2hlbiBOQU5EX0VDQ19FTkdJTkVfVFlQRV9PTl9IT1NUIGlzIGluIHVzZS4KPiA+IAo+ID4gV2l0
aCB0aGVzZSBjaGFuZ2VzIHRoZSBkcml2ZXIgY2FuIGJlIHVzZWQgd2l0aCBzb2Z0d2FyZSBCQ0gg
RUNDIHdoaWNoCj4gPiBpcyB1c2VmdWwgZm9yIE5BTkQgY2hpcHMgdGhhdCByZXF1aXJlIGEgc3Ry
b25nZXIgRUNDIHRoYW4gdGhlIGkuTVgKPiA+IGhhcmR3YXJlIHN1cHBvcnRzLgo+ID4gCj4gPiBT
aWduZWQtb2ZmLWJ5OiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+Cj4gPiAt
LS0KPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9teGNfbmFuZC5jIHwgOSArKysrKy0tLS0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4gCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXhjX25hbmQuYyBiL2RyaXZlcnMv
bXRkL25hbmQvcmF3L214Y19uYW5kLmMKPiA+IGluZGV4IGZjNzBjNjVkZWEyNjguLmY0NGMxMzBk
Y2ExOGQgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9teGNfbmFuZC5jCj4g
PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9teGNfbmFuZC5jCj4gPiBAQCAtMTM5NCwxNSAr
MTM5NCwxNiBAQCBzdGF0aWMgaW50IG14Y25kX2F0dGFjaF9jaGlwKHN0cnVjdCBuYW5kX2NoaXAg
KmNoaXApCj4gPiAgCWNoaXAtPmVjYy5ieXRlcyA9IGhvc3QtPmRldnR5cGVfZGF0YS0+ZWNjYnl0
ZXM7Cj4gPiAgCWhvc3QtPmVjY3NpemUgPSBob3N0LT5kZXZ0eXBlX2RhdGEtPmVjY3NpemU7Cj4g
PiAgCWNoaXAtPmVjYy5zaXplID0gNTEyOwo+ID4gLQltdGRfc2V0X29vYmxheW91dChtdGQsIGhv
c3QtPmRldnR5cGVfZGF0YS0+b29ibGF5b3V0KTsKPiA+ICsKPiA+ICsJY2hpcC0+ZWNjLnJlYWRf
b29iID0gbXhjX25hbmRfcmVhZF9vb2I7Cj4gPiArCWNoaXAtPmVjYy5yZWFkX3BhZ2VfcmF3ID0g
bXhjX25hbmRfcmVhZF9wYWdlX3JhdzsKPiA+ICsJY2hpcC0+ZWNjLndyaXRlX3BhZ2VfcmF3ID0g
bXhjX25hbmRfd3JpdGVfcGFnZV9yYXc7CgpBIHNlY29uZCB0aG91Z2h0IG9uIHRoaXMuIE1heWJl
IHlvdSBzaG91bGQgY29uc2lkZXIga2VlcGluZyB0aGVzZSBmb3IKb24taG9zdCBvcGVyYXRpb25z
IG9ubHkuCgpUaGUgcmVhZC93cml0ZV9wYWdlX3JhdyBvcGVyYXRpb25zIGFyZSBzdXBwb3NlZCB0
byBkZXRhbmdsZSB0aGUgZGF0YQpvcmdhbml6YXRpb24gdG8gc2hvdyBhIHByb3BlciBbYWxsIGRh
dGFdW2FsbCBvb2JdIG9yZ2FuaXphdGlvbiB0byB0aGUKdXNlci4gQnV0IG9mIGNvdXJzZSBpZiB0
aGUgZGF0YSBpcyBzdG9yZWQgZGlmZmVyZW50bHkgd2hlbiB1c2luZwpzb2Z0d2FyZSBFQ0MsIHlv
dSdsbCBleHBlY3QgdGhlIGltcGxlbWVudGF0aW9uIHRvIGJlIGRpZmZlcmVudCAoYW5kIHRoZQpj
b3JlIHByb3ZpZGVzIHN1Y2ggaGVscGVycywgZXZlbiB0aG91Z2ggaW4geW91ciBjYXNlIHRoZXkg
dXNlIFJORE9VVAp3aGljaCBpcyBub3QgeWV0IHN1cHBvcnRlZCkuCgo+ID4gIAo+ID4gIAlzd2l0
Y2ggKGNoaXAtPmVjYy5lbmdpbmVfdHlwZSkgewo+ID4gIAljYXNlIE5BTkRfRUNDX0VOR0lORV9U
WVBFX09OX0hPU1Q6Cj4gPiArCQltdGRfc2V0X29vYmxheW91dChtdGQsIGhvc3QtPmRldnR5cGVf
ZGF0YS0+b29ibGF5b3V0KTsKPiA+ICAJCWNoaXAtPmVjYy5yZWFkX3BhZ2UgPSBteGNfbmFuZF9y
ZWFkX3BhZ2U7Cj4gPiAtCQljaGlwLT5lY2MucmVhZF9wYWdlX3JhdyA9IG14Y19uYW5kX3JlYWRf
cGFnZV9yYXc7Cj4gPiAtCQljaGlwLT5lY2MucmVhZF9vb2IgPSBteGNfbmFuZF9yZWFkX29vYjsK
PiA+ICAJCWNoaXAtPmVjYy53cml0ZV9wYWdlID0gbXhjX25hbmRfd3JpdGVfcGFnZV9lY2M7Cj4g
PiAtCQljaGlwLT5lY2Mud3JpdGVfcGFnZV9yYXcgPSBteGNfbmFuZF93cml0ZV9wYWdlX3JhdzsK
PiA+ICAJCWNoaXAtPmVjYy53cml0ZV9vb2IgPSBteGNfbmFuZF93cml0ZV9vb2I7Cj4gPiAgCQli
cmVhazsgIAo+IAo+IFlvdSBhbHNvIG5lZWQgdG8gZGlzYWJsZSB0aGUgRUNDIGVuZ2luZSBieSBk
ZWZhdWx0IChhbmQgdGhlbiB5b3UncmUKPiBmcmVlIHRvIHVzZSB0aGUgcmF3IHBhZ2UgaGVscGVy
cykuCj4gCj4gSSB0aG91Z2h0IHBhdGNoIDQgd2FzIG5lZWRlZCBmb3IgdGhpcyBwYXRjaCB0byB3
b3JrLCBkbyB5b3UgY29uZmlybT8KPiBPdGhlcndpc2Ugd2l0aCB0aGUgbGl0dGxlIGNoYW5nZSBy
ZXF1ZXN0ZWQgSSBtaWdodCBhbHNvIG1lcmdlIHRoaXMgb25lLgo+IAo+IFRoYW5rcywgTWlxdcOo
bAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
