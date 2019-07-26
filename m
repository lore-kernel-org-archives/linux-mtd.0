Return-Path: <SRS0=VmK4=VX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7D1C7618B
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jul 2019 13:26:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFDDA22BE8
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jul 2019 13:26:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qLw2tSdp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFDDA22BE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rnsiy+Z8UaeEIFVkxS0cK4rGsFWlMvvT3bQxy3ijDZ8=; b=qLw2tSdp5qtjog
	U9nyg68Zw2utdfCAjQLY0mewynq9+u9TwPHwG9MriwnascqiPzltAWLf/SvLGn5BvFFGtpzacFKzO
	+/0y4wgcfPCmEhCxaiAoYavp9ORDDrgLccN6A+O3ho3ZrviA1oUmJEHwNXdiu1iHAO0aIYneDPNbD
	d+IjSdssvjNu+gJ4ppiwUVnj0xPOdYY/ueDBSxATPLV3H+dvkOINwP2pweii0eOUc7Su9cmawTIZr
	VJWRECPbSavhxOM+EW0MCS0R7oYjKJrmwHrxRDQ7zgSyQzyumq4rXBZ1bdcSNkOT+oXMdNxaeViza
	y0c8263VZFrxEGpo/abA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hr0F6-0004bg-P0; Fri, 26 Jul 2019 13:26:40 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hr0F3-0004as-LC
 for linux-mtd@lists.infradead.org; Fri, 26 Jul 2019 13:26:39 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 422771BF213;
 Fri, 26 Jul 2019 13:26:29 +0000 (UTC)
Date: Fri, 26 Jul 2019 15:26:29 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH] mtd: rawnand: micron: handle "ecc off" devices correctly
Message-ID: <20190726152629.30575327@xps13>
In-Reply-To: <20190726094010.6sj4vrvco4hpjitu@pengutronix.de>
References: <20190726111716.591992c7@xps13> <20190726112001.4035f85f@xps13>
 <20190726094010.6sj4vrvco4hpjitu@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190726_062638_007740_14860459 
X-CRM114-Status: GOOD (  24.16  )
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
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFyY28sCgpNYXJjbyBGZWxzY2ggPG0uZmVsc2NoQHBlbmd1dHJvbml4LmRlPiB3cm90ZSBv
biBGcmksIDI2IEp1bCAyMDE5CjExOjQwOjEwICswMjAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24g
MTktMDctMjYgMTE6MjAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBXcm9uZyBhZGRyZXNzIGZv
ciBCb3JpcyBhZ2Fpbiwgc29ycnkgZm9yIHRoZSBub2lzZS4KPiA+ICAgCj4gPiA+IEhpIEx1Y2Fz
LCBNYXJjbywKPiA+ID4gCj4gPiA+IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRl
PiB3cm90ZSBvbiBGcmksIDI2IEp1bCAyMDE5IDEwOjU0OjExCj4gPiA+ICswMjAwOgo+ID4gPiAg
IAo+ID4gPiA+IEhpIE1pZ3VlbCwKPiA+ID4gPiAKPiA+ID4gPiBBbSBGcmVpdGFnLCBkZW4gMjYu
MDcuMjAxOSwgMTA6MjggKzAyMDAgc2NocmllYiBNaXF1ZWwgUmF5bmFsOiAgICAKPiA+ID4gPiA+
IEhpIE1hcmNvLAo+ID4gPiA+ID4gCj4gPiA+ID4gPiArIFJpY2hhcmQKPiA+ID4gPiA+ICsgV29y
a2luZyBlLW1haWwgYWRkcmVzcyBmb3IgQm9yaXMKPiA+ID4gPiA+ICAgICAgIAo+ID4gPiA+ID4g
PiBNYXJjbyBGZWxzY2ggPG0uZmVsc2NoQHBlbmd1dHJvbml4LmRlPiB3cm90ZSBvbiBGcmksIDI2
IEp1bCAyMDE5ICAgICAgCj4gPiA+ID4gPiAwOTo0NDozNCArMDIwMDoKPiA+ID4gPiA+ICAgICAg
IAo+ID4gPiA+ID4gPiBTb21lIGRldmljZXMgZG9uJ3Qgc3VwcG9ydCBlY2MgIm9mZmljaWFsIi4g
QnkgIm9mZmljaWFsIiBJIG1lYW4gdGhhdCB0aGUgICAgCj4gPiA+IAo+ID4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBeIHVwcGVyY2FzZSBFQ0MKPiA+ID4gICAKPiA+ID4gPiA+
ID4gZmVhdHVyZSBjYW4gYmUgc2V0IHRyb3VnaCB0aGUgIlNFVCBGRUFUVVJFIChFRmgpIiBjb21t
YW5kIGJ1dCBpc24ndAo+ID4gPiA+ID4gPiByZXBvcnRlZCB0byB0aGUgIlJFQUQgSUQgUGFyYW1l
dGVyIFRhYmxlcyIuIEJlY2F1c2UgdGhlICJFQ0MgRmllbGQiCj4gPiA+ID4gPiA+IHN0aWxsIHNh
eXMgdGhhdCBpdCBpcyBkaXNhYmxlZC4gVGhpcyBpcyBhcHBsaWNhYmxlIGF0IGxlYXN0Cj4gPiA+
ID4gPiA+IGZvciB0aGUgTVQyOUYyRzA4QUJBR0EgYW5kIE1UMjlGMkcwOEFCQkdBIGRldmljZXMu
IEV2ZW4gd29yc2UgdGhlCj4gPiA+ID4gPiA+IGRhdGFzaGVldCBkZXNjcmliZXMgdGhlIEVDQyBm
ZWF0dXJlIGluIGNoYXB0ZXIgIkVDQyBQcm90ZWN0aW9uIi4gICAgCj4gPiA+IAo+ID4gPiBXaGF0
IGFib3V0Ogo+ID4gPiAKPiA+ID4gIlNvbWUgZGV2aWNlcyBhcmUgc3VwcG9zZWQgdG8gZG8gbm90
IHN1cHBvcnQgb24tZGllIEVDQyBidXQKPiA+ID4gZXhwZXJpZW5jZSBzaG93cyB0aGF0IGludGVy
bmFsIEVDQyBtYWNoaW5lcnkgY2FuIGFjdHVhbGx5IGJlIGVuYWJsZWQKPiA+ID4gdGhyb3VnaCB0
aGUgIlNFVCBGRUFUVVJFIChFRmgpIiBjb21tYW5kLCBldmVuIGlmIGEgcmVhZCBvZiB0aGUgIlJF
QUQgSUQKPiA+ID4gUGFyYW1ldGVyIFRhYmxlcyIgcmV0dXJucyB0aGF0IGl0IGlzIG5vdC4iCj4g
PiA+ICAgCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBDdXJyZW50bHkgdGhlIGRyaXZlciBjaGVj
a3MgdGhlICJSRUFEIElEIFBhcmFtZXRlciIgZmllbGQgZGlyZWN0bHkgYWZ0ZXIKPiA+ID4gPiA+
ID4gd2UgZW5hYmxlZCB0aGUgZmVhdHVyZS4gSWYgdGhlIGNoZWNrIGZhaWxzIHdlIHJldHVybiBp
bW1lZGlhdGVseSBidXQKPiA+ID4gPiA+ID4gbGVhdmUgdGhlIEVDQyBvbi4gTm93IGFsbCBmdXR1
cmUgcmVhZC9wcm9ncmFtIGN5Y2xlcyBnb2VzIHRyb3VnaCB0aGUgZWNjCj4gPiA+ID4gPiA+IGFu
ZCB0aGUgaG9zdCBuZmMgZ2V0cyBjb25mdXNlZCBhbmQgcmVwb3J0cyBFQ0MgZXJyb3JzLiAgICAK
PiA+ID4gCj4gPiA+IEFuZCBoZXJlOgo+ID4gPiAKPiA+ID4gIkN1cnJlbnRseSwgdGhlIGRyaXZl
ciBjaGVja3MgdGhlICJSRUFEIElEIFBhcmFtZXRlciIgZmllbGQKPiA+ID4gZGlyZWN0bHkgYWZ0
ZXIgaGF2aW5nIGVuYWJsZWQgdGhlIGZlYXR1cmUuIElmIHRoZSBjaGVjayBmYWlscyBpdCByZXR1
cm5zCj4gPiA+IGltbWVkaWF0ZWx5IGJ1dCBsZWF2ZXMgdGhlIEVDQyBvbi4gV2hlbiB1c2luZyBi
dWdneSBjaGlwcyBsaWtlCj4gPiA+IE1UMjlGMkcwOEFCQUdBIGFuZCBNVDI5RjJHMDhBQkJHQSwg
YWxsIGZ1dHVyZSByZWFkL3Byb2dyYW0gY3ljbGVzIHdpbGwKPiA+ID4gZ28gdGhyb3VnaCB0aGUg
b24tZGllIEVDQywgY29uZnVzaW5nIHRoZSBob3N0IGNvbnRyb2xsZXIgd2hpY2ggaXMKPiA+ID4g
c3VwcG9zZWQgdG8gYmUgdGhlIG9uZSBoYW5kbGluZyBjb3JyZWN0aW9uLiIKPiA+ID4gICAKPiA+
ID4gPiA+ID4gVG8gYWRkcmVzcyB0aGlzIGluIGEgY29tbW9uIHdheSB3ZSBuZWVkIHRvIHR1cm4g
b2ZmIHRoZSBFQ0MgZGlyZWN0bHkKPiA+ID4gPiA+ID4gYWZ0ZXIgcmVhZGluZyB0aGUgIlJFQUQg
SUQgUGFyYW1ldGVyIiBhbmQgYmVmb3JlIGNoZWNraW5nIHRoZQo+ID4gPiA+ID4gPiAiRUNDIHN0
YXR1cyIuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJjbyBGZWxz
Y2ggPG0uZmVsc2NoQHBlbmd1dHJvbml4LmRlPiAgICAgIAo+ID4gPiA+ID4gCj4gPiA+ID4gPiBH
b29kIGNhdGNoISBIb3dldmVyIHlvdSByZXBvcnQgdGhhdCBvbi1kaWUgRUNDIGNvcnJlY3Rpb24g
aXMgd29ya2luZwo+ID4gPiA+ID4gYnV0IHlvdSBzdGlsbCBkaXNhYmxlIGl0OyBhbnkgcmVhc29u
IHRvIGRvIHNvID8gV291bGQgaXQgYmUgYmV0dGVyIHRvCj4gPiA+ID4gPiBhY3R1YWxseSBlbmFi
bGUgb24tZGllIEVDQyBhbmQgZXhwbGljaXRseSBtYXJrIHRoZXNlIHR3byBjaGlwcyBhcwo+ID4g
PiA+ID4gYnVnZ3kgKHNlZSBbMV0gZm9yIGNoZWNraW5nIHRoZSBjaGlwIElEcyk/ICAgICAgCj4g
PiA+ID4gCj4gPiA+ID4gSXQncyB0aGUgb3RoZXIgd2F5IGFyb3VuZC4gVGhlIGNoaXAgaXMgbm90
IHN1cHBvc2VkIHRvIGhhdmUgb24tZGllIEVDQwo+ID4gPiA+IGFjY29yZGluZyB0byB0aGUgZGF0
YXNoZWV0IGFuZCBjb3JyZWN0bHkgcmVmbGVjdHMgdGhpcyBmYWN0IGluIHRoZQo+ID4gPiA+IFJF
QURfSUQsIHNvIExpbnV4IHNob3VsZCBub3QgdHJ5IHRvIHVzZSB0aGUgb24tZGllIEVDQy4gICAg
Cj4gPiA+IAo+ID4gPiBPayBJIHVuZGVyc3Rvb2QgdGhlIG9wcG9zaXRlIGJlY2F1c2Ugb2YgdGhl
ICJFdmVuIHdvcnNlIHRoZSBkYXRhc2hlZXQKPiA+ID4gZGVzY3JpYmVzIHRoZSBFQ0MgZmVhdHVy
ZSBbLi4uXSIgd2hpY2ggaW1wbGllZCB0byBtZSB0aGF0IHRoZSBvbi1kaWUgRUNDCj4gPiA+IGZl
YXR1cmUgd2FzIGFjdHVhbGx5IGV4cGVjdGVkIGRlc3BpdGUgdGhlIHN0YXR1cyBiaXQgbm90IGJl
aW5nIHNldC4KPiA+ID4gCj4gPiA+IE1hcmNvLCBjYW4geW91IHJlcGhyYXNlIGEgYml0IHRoZSBj
b21taXQgbG9nPyBJIHByb3Bvc2VkIHNvbWV0aGluZywKPiA+ID4gZmVlbCBmcmVlIHRvIGFkYXB0
LiAgCj4gCj4gVGhhbmtzIGZvciB0aGUgZmFzdCByZXBseSA6KSBPZiBjb3Vyc2UgSSBjYW4gYWRh
cHQgaXQgYW5kIGFkZGluZyBCb3JpcyByYi10YWcuCgpJIHN1cHBvc2UgeW91IGNhbiBhbHNvIGFk
ZCBGaXhlcyBhbmQgU3RhYmxlIHRhZ3MuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
