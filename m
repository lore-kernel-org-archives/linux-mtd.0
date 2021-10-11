Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 622F1C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 06:47:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2631C60E90
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 06:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2631C60E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B1iNYtKuFXE3Y/akmSZTP4+TYoYhgPvu4DA0xTNtVBM=; b=KKCBhTqUnKdE3G
	b3zRWLmzjEswL9DwoN5h/lfix/P4vmw4P6dLBo2IAzQmXMZ5Dt4ze/3AK62r6rjMNqN9MQvJWz/jr
	HwTqb8gKphnPUTte7g7ysyUtY1DS4rdjmoQavSryMd4QV6E/wzv0vP6L2mnywpLtmKd8B6WjQ20j/
	KalIjHUUZO+A9vUIzvfqRNd7ifzZOh61PkrscwCc3cW0KnzenuWlYgsOb8BVMkh0e2BwHvr2Rig8I
	MGBGcRvL//F9vJh124ceRjNC8R7HxegyBlORAWKeCxoAUAbYXDGBuH6appTLLz2nrcAFysR1/jm4+
	MWsZZ4Hd73jG1cd3NDNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZp4u-007xpW-79; Mon, 11 Oct 2021 06:46:28 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZp4i-007xkq-66
 for linux-mtd@lists.infradead.org; Mon, 11 Oct 2021 06:46:18 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 72383100003;
 Mon, 11 Oct 2021 06:46:08 +0000 (UTC)
Date: Mon, 11 Oct 2021 08:46:07 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Cc: Christian Eggers <ceggers@arri.de>, Stefan =?UTF-8?B?UmllZG3DvGxsZXI=?=
 <S.Riedmueller@phytec.de>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "han.xu@nxp.com" <han.xu@nxp.com>, Christian Hemp
 <C.Hemp@phytec.de>, "gerg@kernel.org" <gerg@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: GPMI iMX6ull timeout on DMA
Message-ID: <20211011084607.27a840e0@xps13>
In-Reply-To: <CAOf5uwkTzPtqjO0XQ7otzNKLugUzS+9MJg0GkdtvV2JY4=n5mw@mail.gmail.com>
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <20211008152905.2fbdcce9@xps13> <20211008153631.3f1a09aa@xps13>
 <6364938.4vTCxPXJkl@n95hx1g2> <20211008180752.09f33896@xps13>
 <CAOf5uwkTzPtqjO0XQ7otzNKLugUzS+9MJg0GkdtvV2JY4=n5mw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211010_234616_404647_9756E093 
X-CRM114-Status: GOOD (  25.98  )
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

SGkgTWljaGFlbCwKCm1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20gd3JvdGUgb24gU2F0LCA5
IE9jdCAyMDIxIDA3OjUzOjI2ICswMjAwOgoKPiBIaQo+IAo+IE9uIEZyaSwgT2N0IDgsIDIwMjEg
YXQgNjowNyBQTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90
ZToKPiA+Cj4gPiBIaSBDaHJpc3RpYW4sCj4gPgo+ID4gY2VnZ2Vyc0BhcnJpLmRlIHdyb3RlIG9u
IEZyaSwgOCBPY3QgMjAyMSAxNTo0OToyMSArMDIwMDoKPiA+ICAKPiA+ID4gT24gRnJpZGF5LCA4
IE9jdG9iZXIgMjAyMSwgMTU6MzY6MzEgQ0VTVCwgTWlxdWVsIFJheW5hbCB3cm90ZTogIAo+ID4g
PiA+Cj4gPiA+ID4gbWlxdWVsLnJheW5hbEBib290bGluLmNvbSB3cm90ZSBvbiBGcmksIDggT2N0
IDIwMjEgMTU6Mjk6MDUgKzAyMDA6Cj4gPiA+ID4gIAo+ID4gPiA+ID4KPiA+ID4gPiA+IElmIHRo
aXMgY2xvY2sgKGFzIEkgdW5kZXJzdGFuZCkgZG9lcyBub3QgcHJldmVudCB1cyB0byBhY2Nlc3Mg
dGhlCj4gPiA+ID4gPiByZWdpc3RlcnMgYnV0IG9ubHkgZmVlZHMgdGhlIGV4dGVybmFsIE5BTkQg
YnVzIHBhcnQsIHRoZW4gdGhlcmUgaXMgbm8KPiA+ID4gPiA+IG5lZWQgdG8gZW5hYmxlIGl0IGlu
IHRoZSBwcm9iZSwganVzdCBhY3F1aXJpbmcgaXQgd2lsbCBiZSBlbm91Z2guICAKPiA+ID4KPiA+
ID4gY2xvY2tzWzBdIGlzICJncG1pX2lvIiB3aGljaCBzb3VuZHMgbW9yZSBsaWtlIGkvbyB0aGFu
IHJlZ2lzdGVycy4gU28gbGV0cwo+ID4gPiB0cnkgdG8gcmVtb3ZlIHRoZSBpbml0aWFsIGNhbGwg
dG8gY2xrX3NldF9yYXRlKCkuCj4gPiA+ICAKPiA+ID4gPiA+IFRoZW4sIHRoZSBmaXJzdCBjYWxs
IGZvciBhbiBJTyBvcGVyYXRpb24gd2l0aCAtPm11c3RfYXBwbHlfdGltaW5ncwo+ID4gPiA+ID4g
c2hvdWxkOgo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgaWYgKGlteDYpCj4gPiA+ID4gPiAgICAgICAg
ICAgZGlzYWJsZV9jbGsoKTsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgIGNsa19zZXRfcmF0ZSgpOwo+
ID4gPiA+ID4KPiA+ID4gPiA+ICAgaWYgKGlteDYpCj4gPiA+ID4gPiAgICAgICAgICAgZW5hYmxl
X2NsaygpOyAgCj4gPiA+Cj4gPiA+IERvIHlvdSB0aGluayB0aGF0IHRoZSBuZWVkIGZvciBhdm9p
ZGluZyBjbG9jayBnbGl0Y2hlcyBpcyBpLk1YNiBzcGVjaWZpYz8KPiA+ID4gVGhlIGVycmF0YSBJ
IG1lbnRpb25lZCBpcyBzcGVjaWZpYyBmb3IgdGhlIGJvb3Rsb2FkZXIgc29mdHdhcmUsIGJ1dCAo
SSB0aGluaykKPiA+ID4gdGhlIHJlcXVpcmVtZW50IGZvciBzd2l0Y2hpbmcgb2ZmIHRoZSBjbG9j
a3MgZ2F0ZXMgcHJpb3IgY2hhbmdpbmcgdGhlIGRpdmlkZXJzCj4gPiA+IG1heSBhcHBseSBhbHNv
IGZvciBvdGhlciBzZXJpZXMuICAKPiA+Cj4gPiBJIGhvbmVzdGx5IGRvbid0IGtub3csIHBlcmhh
cHMgSGFuIGhhdmUgbW9yZSBkZXRhaWxzIGFib3V0IGl0LiBJZiB5b3UKPiA+IHRoaW5rIGl0J3Mg
YSB3aWRlciBpc3N1ZSwgdGhlbiB3ZSBjYW4ganVzdCBkbyB0aGUgZGlzYWJsZS9lbmFibGUgc3Rl
cAo+ID4gd2l0aG91dCBhbnkgZnVydGhlciBjaGVja3MuCj4gPiAgCj4gCj4gU3RpbGwgZG9uJ3Qg
ZXhwbGFpbiB3aHkgaXQgd2FzIHdvcmtpbmcgb24gdGhlIG9sZCBkcml2ZXIuIFRoZSBnbGl0Y2gK
PiB3YXMgYWxyZWFkeSB0aGVyZSwKPiBzbyBqdXN0IGEgZGVsYXkgY2FuIGRvIHRoZSB0cmljay4g
Rm9yIGlteDI4IHdlIG5lZWQgdG8gcmVwYXJlbnQgdG8gYQo+IGRpZmZlcmVudCBjbG9jayB0aGUK
PiBuYW5kIGRyaXZlciBpbiBvcmRlciB0byBnZXQgdGhlIGZyZXF1ZW5jeSB3ZSB3YW50IGluIEVE
TyBtb2RlLiBJJ20KPiBzdGlsbCB0aGlua2luZyB0aGF0Cj4gc2V0IHRoZSBmcmVxdWVuY3kgd2l0
aG91dCB3aXRob3V0IGdldCBiYWNrIGFuZCB1bmRlcnN0YW5kIGlmIGluIHRoYXQKPiBlZG8gbW9k
ZSBpcyB2YWxpZAo+IGlzIHN0aWxsIGEgYnVnLgoKVGhlcmUgYXJlIHBvc3NpYmx5IHR3byBidWdz
IGhlcmUsIEkgYW0gYWxzbyBpbiBmYXZvciBvZiBjaGVja2luZwp0aGF0IHRoZSByZWNlaXZlZCBm
cmVxdWVuY2llcyBtYXRjaCB3aGF0IHdlIGV4cGVjdCwgc28gcGxlYXNlIHByb3ZpZGUgYQpwYXRj
aCB0byBhbHNvIGNvdmVyIHRoYXQgc2l0dWF0aW9uLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
