Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB1DC43219
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 06:36:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D58F20873
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 06:36:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h8Ckl3EL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D58F20873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kwboXLKbHdEiUtrXLuEYtE3mvYy0XY85cEmVtdasU4c=; b=h8Ckl3ELAMJQBR
	CQtsxUV0pAsQJHSuG4NGSNkTPtau/o4aWUdHRIGIalylGS7//HRNEpQlv1xlwOEW3H2pgsQs9vRLP
	H0UtGCpPvvCVKyhIUyAY/G4M1myFhRpWHikbC67oVNj6y1DZuu1k8sCnLva5nfIxhAaHSY3EQuOGr
	tb7+bVOdB5ruxPCMZRPqY+V12XWnvaxNZRFaZ4lBdfup7cHWNzZDR7Htn/GFk5az6NaCmHyOOgR/P
	oWB4QCeWm43/Tpmi3zwUjJP8uBJwCqSch92eITpIURzH2DyoLOIpW4ygGSdrh2mj3rzoL8sUH1oMh
	SMR/3TqQW0ebduIBHuFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hM5Kk-0008Pi-Jy; Thu, 02 May 2019 06:36:42 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hM5Kg-0008Ot-Tn
 for linux-mtd@lists.infradead.org; Thu, 02 May 2019 06:36:40 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 604792607B5;
 Thu,  2 May 2019 07:36:35 +0100 (BST)
Date: Thu, 2 May 2019 08:36:32 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 4/5] dt-binding: mtd: onenand/samsung: Add device tree
 support
Message-ID: <20190502083632.0ec0fb4e@collabora.com>
In-Reply-To: <CA+Ln22HLqnbbY37FG6CwjZvZH7G35Z+0kNq7XFU4WtZyk_EqZQ@mail.gmail.com>
References: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
 <20190426164224.11327-5-pawel.mikolaj.chmiel@gmail.com>
 <20190502015408.GA11612@bogus>
 <CA+Ln22HLqnbbY37FG6CwjZvZH7G35Z+0kNq7XFU4WtZyk_EqZQ@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190501_233639_223165_285EC619 
X-CRM114-Status: GOOD (  28.12  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 bbrezillon@kernel.org, richard@nod.at,
 linux-kernel <linux-kernel@vger.kernel.org>, marek.vasut@gmail.com,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com,
 David Woodhouse <dwmw2@infradead.org>, devicetree <devicetree@vger.kernel.org>,
 =?UTF-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVG9tYXN6LAoKT24gVGh1LCAyIE1heSAyMDE5IDE1OjIzOjMzICswOTAwClRvbWFzeiBGaWdh
IDx0b21hc3ouZmlnYUBnbWFpbC5jb20+IHdyb3RlOgoKPiAyMDE55bm0NeaciDLml6Uo5pyoKSAx
MDo1NCBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPjoKPiA+Cj4gPiBPbiBGcmksIEFwciAy
NiwgMjAxOSBhdCAwNjo0MjoyM1BNICswMjAwLCBQYXdlxYIgQ2htaWVsIHdyb3RlOiAgCj4gPiA+
IEZyb206IFRvbWFzeiBGaWdhIDx0b21hc3ouZmlnYUBnbWFpbC5jb20+Cj4gPiA+Cj4gPiA+IFRo
aXMgcGF0Y2ggYWRkcyBkdC1iaW5kaW5ncyBmb3IgU2Ftc3VuZyBPbmVOQU5EIGRyaXZlci4KPiA+
ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogVG9tYXN6IEZpZ2EgPHRvbWFzei5maWdhQGdtYWlsLmNv
bT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogUGF3ZcWCIENobWllbCA8cGF3ZWwubWlrb2xhai5jaG1p
ZWxAZ21haWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gIC4uLi9iaW5kaW5ncy9tdGQvc2Ftc3VuZy1v
bmVuYW5kLnR4dCAgICAgICAgICB8IDQ2ICsrKysrKysrKysrKysrKysrKysKPiA+ID4gIDEgZmls
ZSBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspCj4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9zYW1zdW5nLW9uZW5hbmQudHh0Cj4g
PiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL3NhbXN1bmctb25lbmFuZC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL3NhbXN1bmctb25lbmFuZC50eHQKPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+
ID4gaW5kZXggMDAwMDAwMDAwMDAwLi4zNDFkOTdjYzE1MTMKPiA+ID4gLS0tIC9kZXYvbnVsbAo+
ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3NhbXN1bmct
b25lbmFuZC50eHQKPiA+ID4gQEAgLTAsMCArMSw0NiBAQAo+ID4gPiArRGV2aWNlIHRyZWUgYmlu
ZGluZ3MgZm9yIFNhbXN1bmcgU29DIE9uZU5BTkQgY29udHJvbGxlcgo+ID4gPiArCj4gPiA+ICtS
ZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ID4gPiArIC0gY29tcGF0aWJsZSA6IHZhbHVlIHNob3VsZCBi
ZSBlaXRoZXIgb2YgdGhlIGZvbGxvd2luZy4KPiA+ID4gKyAgIChhKSAic2Ftc3VuZyxzM2M2NDAw
LW9uZW5hbmQiIC0gZm9yIG9uZW5hbmQgY29udHJvbGxlciBjb21wYXRpYmxlIHdpdGgKPiA+ID4g
KyAgICAgICBTM0M2NDAwIFNvQywKPiA+ID4gKyAgIChiKSAic2Ftc3VuZyxzM2M2NDEwLW9uZW5h
bmQiIC0gZm9yIG9uZW5hbmQgY29udHJvbGxlciBjb21wYXRpYmxlIHdpdGgKPiA+ID4gKyAgICAg
ICBTM0M2NDEwIFNvQywKPiA+ID4gKyAgIChjKSAic2Ftc3VuZyxzNXBjMTAwLW9uZW5hbmQiIC0g
Zm9yIG9uZW5hbmQgY29udHJvbGxlciBjb21wYXRpYmxlIHdpdGgKPiA+ID4gKyAgICAgICBTNVBD
MTAwIFNvQywKPiA+ID4gKyAgIChkKSAic2Ftc3VuZyxzNXB2MjEwLW9uZW5hbmQiIC0gZm9yIG9u
ZW5hbmQgY29udHJvbGxlciBjb21wYXRpYmxlIHdpdGgKPiA+ID4gKyAgICAgICBTNVBDMTEwL1M1
UFYyMTAgU29Dcy4KPiA+ID4gKwo+ID4gPiArIC0gcmVnIDogdHdvIG1lbW9yeSBtYXBwZWQgcmVn
aXN0ZXIgcmVnaW9uczoKPiA+ID4gKyAgIC0gZmlyc3QgZW50cnk6IGNvbnRyb2wgcmVnaXN0ZXJz
Lgo+ID4gPiArICAgLSBzZWNvbmQgYW5kIG5leHQgZW50cmllczogbWVtb3J5IHdpbmRvd3Mgb2Yg
cGFydGljdWxhciBPbmVOQU5EIGNoaXBzOwo+ID4gPiArICAgICBmb3IgdmFyaWFudHMgYSksIGIp
IGFuZCBjKSBvbmx5IG9uZSBpcyBhbGxvd2VkLCBpbiBjYXNlIG9mIGQpIHVwIHRvCj4gPiA+ICsg
ICAgIHR3byBjaGlwcyBjYW4gYmUgc3VwcG9ydGVkLgo+ID4gPiArCj4gPiA+ICsgLSBpbnRlcnJ1
cHQtcGFyZW50IDogcGhhbmRsZSBvZiBpbnRlcnJ1cHQgY29udHJvbGxlciB0byB3aGljaCB0aGUg
T25lTkFORAo+ID4gPiArICAgY29udHJvbGxlciBpcyB3aXJlZCwgIAo+ID4KPiA+IFRoaXMgaXMg
aW1wbGllZCBhbmQgY2FuIGJlIHJlbW92ZWQuCj4gPiAgCj4gPiA+ICsgLSBpbnRlcnJ1cHRzIDog
c3BlY2lmaWVyIG9mIGludGVycnVwdCBzaWduYWwgdG8gd2hpY2ggdGhlIE9uZU5BTkQgY29udHJv
bGxlcgo+ID4gPiArICAgaXMgd2lyZWQ7IHNob3VsZCBjb250YWluIGp1c3Qgb25lIGVudHJ5Lgo+
ID4gPiArIC0gY2xvY2stbmFtZXMgOiBzaG91bGQgY29udGFpbiB0d28gZW50cmllczoKPiA+ID4g
KyAgIC0gImJ1cyIgLSBidXMgY2xvY2sgb2YgdGhlIGNvbnRyb2xsZXIsCj4gPiA+ICsgICAtICJv
bmVuYW5kIiAtIGNsb2NrIHN1cHBsaWVkIHRvIE9uZU5BTkQgbWVtb3J5LiAgCj4gPgo+ID4gSWYg
dGhlIGNsb2NrIGp1c3QgZ29lcyB0byB0aGUgT25lTkFORCBkZXZpY2UsIHRoZW4gaXQgc2hvdWxk
IGJlIGluIHRoZQo+ID4gbmFuZCBkZXZpY2Ugbm9kZSByYXRoZXIgdGhhbiB0aGUgY29udHJvbGxl
ciBub2RlLgo+ID4gIAo+IAo+IChUcnlpbmcgaGFyZCB0byByZWNhbGwgdGhlIGRldGFpbHMgYWJv
dXQgdGhpcyBoYXJkd2FyZS4pCj4gQUZBSVIgdGhlIGNsb2NrIGdvZXMgdG8gdGhlIGNvbnRyb2xs
ZXIgYW5kIHRoZSBjb250cm9sbGVyIHRoZW4gZmVlZHMKPiBpdCB0byB0aGUgbWVtb3J5IGNoaXBz
Lgo+IAo+IEFsc28gSSBkb24ndCB0aGluayB3ZSBzaG91bGQgaGF2ZSBhbnkgbmFuZCBkZXZpY2Ug
bm9kZXMgaGVyZSwgc2luY2UKPiB0aGUgbWVtb3J5IGl0c2VsZiBpcyBvbmx5IGV4cG9zZWQgdmlh
IHRoZSBjb250cm9sbGVyLCB3aGljaCBvZmZlcnMKPiB2YXJpb3VzIHF1ZXJpZXMgdG8gcHJvYmUg
dGhlIG1lbW9yeSBhdCBydW50aW1lLCBzbyB0aGVyZSBpcyBubyBuZWVkIHRvCj4gZGVzY3JpYmUg
aXQgaW4gRFQuCgpJdCdzIHByb2JhYmx5IHRydWUsIHRob3VnaCBub3QgcHJvdmlkaW5nIHRoaXMg
Y29udHJvbGxlci9kZXZpY2UKc2VwYXJhdGlvbiBmb3IgTkFORCBjb250cm9sbGVyL2RldmljZXMg
aGFzIHByb3ZlbiB0byBiZSBhIG1pc3Rha2UgZm9yCnJhdyBOQU5EIGNvbnRyb2xsZXJzIChzb21l
IHByb3BzIGFwcGx5IHRvIHRoZSBjb250cm9sbGVycyBhbmQgb3RoZXJzIHRvCnRoZSBOQU5EIGRl
dmljZSwgbm90IHRvIG1lbnRpb24gdGhhdCBzb21lIGNvbnRyb2xsZXJzIHN1cHBvcnQKaW50ZXJh
Y3Rpbmcgd2l0aCBzZXZlcmFsIGNoaXBzKSwgc28sIGlmIHRoYXQncyBhIG5ldyBiaW5kaW5nLCBJ
J2QKcmVjb21tZW5kIGhhdmluZyB0aGlzIHNlcGFyYXRpb24gZXZlbiBpZiBpdCdzIG5vdCBzdHJp
Y3RseSByZXF1aXJlZC4KCj4gCj4gPiA+ICsgLSBjbG9jazogc2hvdWxkIGNvbnRhaW4gbGlzdCBv
ZiBwaGFuZGxlcyBhbmQgc3BlY2lmaWVycyBmb3IgYWxsIGNsb2NrcyBsaXN0ZWQKPiA+ID4gKyAg
IGluIGNsb2NrLW5hbWVzIHByb3BlcnR5Lgo+ID4gPiArIC0gI2FkZHJlc3MtY2VsbHMgOiBtdXN0
IGJlIDEsCj4gPiA+ICsgLSAjc2l6ZS1jZWxscyA6IG11c3QgYmUgMS4gIAo+ID4KPiA+IFRoaXMg
aW1wbGllcyBzb21lIGNoaWxkIG5vZGVzLiBXaGF0IGFyZSB0aGUgY2hpbGQgbm9kZXM/Cj4gPiAg
Cj4gCj4gSSBjYW4ndCByZWNhbGwgdGhlIHJlYXNvbiBmb3IgdGhpcyB1bmZvcnR1bmF0ZWx5LgoK
RGVmaW5pbmcgcGFydGl0aW9ucyBJIGd1ZXNzLCBidXQgd2UgYXNrIHBlb3BsZSB0byB1c2UgdGhl
IG5ldwpyZXByZXNlbnRhdGlvbiB3aXRoIGEgJ3BhcnRpdGlvbnMnIHN1Yi1ub2RlIG5vdywgc28g
dGhpcyBzaG91bGQKcHJvYmFibHkgYmUgZHJvcHBlZC4KClJlZ2FyZHMsCgpCb3JpcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
