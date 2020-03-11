Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB6AC10F27
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 14:46:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66210206B1
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 14:46:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hqZzvW1g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66210206B1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t0AOHx1/BpFYntSiHxKr/BHeW7Mt/OA94lP2iblQycM=; b=hqZzvW1g0yyDNs
	ad/GjgRMPBGYQ4GWrAG6linSjZIE+NuSE9eShxH4HBaxK0mk71Jr4KnLxlL4sgxd2+sHOGGY5GOVe
	AXR2DFLmVCypjYFCIojwiAf68LvmyZGd90wOy2CLhAWDdB1jP2jXibo+IIfhaoLWiQpPjAmd9ZstU
	mbvqPQO4g+5M7/WhvuUOFOpfgYs2HW6FrEsIMFlSq34ezpXRhdnvJUSAGOwIGDFQD6BLGUgUlcuyy
	bagpO+dk50+Y8gUxApVs/4NN1au1Amg/4fp7SK2JkA2H7/3lMeNMt3JSBlnqZosDZjWwVyE1Y6L38
	3pOooR5vGqwVfrM+uWSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC2WP-0002dw-Fd; Wed, 11 Mar 2020 14:39:45 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC2WK-0002T4-KL
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 14:39:42 +0000
X-Originating-IP: 90.89.41.158
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id A4A8C1C0015;
 Wed, 11 Mar 2020 14:39:24 +0000 (UTC)
Date: Wed, 11 Mar 2020 15:39:23 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] Revert "mtd: rawnand: denali: get
 ->setup_data_interface() working again"
Message-ID: <20200311153923.443f3e64@xps13>
In-Reply-To: <aaec50bb-05da-8d4e-3e15-17fbfeb52f68@denx.de>
References: <20200205070834.3087104-1-marex@denx.de>
 <20200211170707.2183625e@xps13>
 <b1a10583-e110-9568-4007-aa2b3f38a7be@denx.de>
 <CAK7LNARqYDh4AJ+N-PTHui0H89-humECskJVUxW4cTf6edEBMQ@mail.gmail.com>
 <f4e2deeb-cc0e-fb06-46fa-d6cf4f2a73ad@denx.de>
 <CAK7LNAR4MU+Rfmpz99iwLuEbD4jMwUdh91uz3zyQdvjyLEQcMQ@mail.gmail.com>
 <29cce21c-2214-7238-0bc5-db2c1a54576f@denx.de>
 <CAK7LNASckTZO-9uVjtQH8iKhU0HH9WiMK-CzMxjESQOOUM0cKA@mail.gmail.com>
 <CAK7LNAT3EG0XocC0xT0f=6MBpXLga3FehOjEYbRyP6AJUbqb2Q@mail.gmail.com>
 <311cdc3c-59b5-a46b-62f0-e78fc970134a@denx.de>
 <CAK7LNAT1Bzs68X8PiWQHg4g2bpPGd-WM9D4vwf59XfwwLVuVQQ@mail.gmail.com>
 <e86925d0-805c-d364-57ca-6400b77cffd7@denx.de>
 <CAK7LNARDp1Zru3_XAQyBZHwsRov-QWOnrrwodS8pjszsKy2ysw@mail.gmail.com>
 <d4b4abf4-1af9-d57c-5b93-2d56a5dc456b@denx.de>
 <20200311140807.6f56baf3@xps13>
 <5fa809a3-cd2b-74de-3615-387232051ae2@denx.de>
 <20200311143302.309bf468@xps13>
 <aaec50bb-05da-8d4e-3e15-17fbfeb52f68@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_073940_950577_43B59155 
X-CRM114-Status: GOOD (  29.24  )
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
Cc: Dinh Nguyen <dinguyen@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Tim Sander <tim@krieglstein.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFyZWssCgpNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4gd3JvdGUgb24gV2VkLCAxMSBN
YXIgMjAyMCAxNTowNzoyNyArMDEwMDoKCj4gT24gMy8xMS8yMCAyOjMzIFBNLCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOgo+ID4gSGkgTWFyZWssICAKPiAKPiBIaSwKPiAKPiBbLi4uXQo+IAo+ID4+Pj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9kZW5hbGkuYyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2RlbmFsaS5jCj4gPj4+Pj4gaW5kZXggYjA0ODIxMDhhMTI3Li5lYTM4YWE0Mjg3
M2UgMTAwNjQ0Cj4gPj4+Pj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvZGVuYWxpLmMKPiA+
Pj4+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9kZW5hbGkuYwo+ID4+Pj4+IEBAIC04NjAs
OSArODYwLDkgQEAgc3RhdGljIGludCBkZW5hbGlfc2V0dXBfZGF0YV9pbnRlcmZhY2Uoc3RydWN0
Cj4gPj4+Pj4gbmFuZF9jaGlwICpjaGlwLCBpbnQgY2hpcG5yLAo+ID4+Pj4+Cj4gPj4+Pj4gICAg
ICAgICAvKgo+ID4+Pj4+ICAgICAgICAgICogRGV0ZXJtaW5lIHRoZSBtaW5pbXVtIG9mIGFjY19j
bGtzIHRvIG1lZXQgdGhlIGRhdGEgc2V0dXAgdGltaW5nLgo+ID4+Pj4+IC0gICAgICAgICogKG9u
ZSBhZGRpdGlvbmFsIGNsb2NrIGN5Y2xlIGp1c3QgaW4gY2FzZSkKPiA+Pj4+PiArICAgICAgICAq
ICh0d28gYWRkaXRpb25hbCBjbG9jayBjeWNsZXMganVzdCBpbiBjYXNlKQo+ID4+Pj4+ICAgICAg
ICAgICovCj4gPj4+Pj4gLSAgICAgICBhY2NfY2xrcyA9IERJVl9ST1VORF9VUCh0aW1pbmdzLT50
UkVBX21heCwgdF94KSArIDE7Cj4gPj4+Pj4gKyAgICAgICBhY2NfY2xrcyA9IERJVl9ST1VORF9V
UCh0aW1pbmdzLT50UkVBX21heCwgdF94KSArIDI7Cj4gPj4+Pj4KPiA+Pj4+PiAgICAgICAgIC8q
IERldGVybWluZSB0aGUgbWluaW11bSBvZiByZHdyX2VuX2xvX2NudCBmcm9tIFJFIy9XRSMgcHVs
c2Ugd2lkdGggKi8KPiA+Pj4+PiAgICAgICAgIHJkd3JfZW5fbG8gPSBESVZfUk9VTkRfVVAobWF4
KHRpbWluZ3MtPnRSUF9taW4sIHRpbWluZ3MtPnRXUF9taW4pLCB0X3gpOyAgICAgIAo+ID4+Pj4K
PiA+Pj4+IExpa2UgdGhlIGF0dGFjaGVkIG9uZSA/Cj4gPj4+Pgo+ID4+Pj4gVGhhdCBzZWVtcyB0
byB3b3JrLCBidXQgLS0gdGhlIGNhbGN1bGF0ZWQgdGltaW5ncyBkaWZmZXIgZnJvbSB0aGUgb25l
cwo+ID4+Pj4gd2hpY2ggYXJlIGNhbGN1bGF0ZWQgYnkgVS1Cb290IGFuZCB3aGljaCB3ZXJlIHRl
c3RlZCB0byB3b3JrIHdlbGwuCj4gPj4+PiBUaGF0J3Mgbm90IGdvb2QsIEkgd291bGQgZXhwZWN0
IGJvdGggdGltaW5ncyB0byBiZSBpZGVudGljYWw6ICAgIAo+ID4+Pgo+ID4+PiBUaGVyZSBpcyBu
byBzdWNoICJ0aW1pbmdzIHRlc3RlZCB0byB3b3JrIHdlbGwiLiAgICAKPiA+Pgo+ID4+IEhtbW0s
IHRoZSBib2FyZCB3ZW50IHRocm91Z2ggZnVsbCB0ZW1wZXJhdHVyZSByYW5nZSB0ZXN0aW5nIGlu
IGEgY2hhbWJlcgo+ID4+IHdpdGggdGhvc2UgdGltaW5ncyBhbmQgcGFzc2VkLCBhbmQgdGhlcmUg
YXJlIGJvYXJkcyB3aXRoIHRob3NlIGV4YWN0Cj4gPj4gdGltaW5ncyBkZXBsb3llZCBmb3IgeWVh
cnMgbm93IHdpdGggb2xkZXIga2VybmVsIHZlcnNpb24sIHdoaWNoIHdvcmsKPiA+PiB0b28uIFNv
IEkgd291bGQgZXhwZWN0IHRoZXkgYXJlIGdvb2QgYW5kICJ0aW1pbmdzIHRlc3RlZCB0byB3b3Jr
IHdlbGwiLgo+ID4+ICAKPiA+Pj4gVGltaW5ncyByZXByZXNlbnQKPiA+Pj4gbWluaW11bSBhbmQg
bWF4aW11bSB2YWx1ZXMgZm9yIGNlcnRhaW4gb3BlcmF0aW9ucyBvbiB0aGUgTkFORCBidXMsIHlv
dQo+ID4+PiBjYW4gaGF2ZSB0d28gZGlmZmVyZW50IHZhbHVlcyB0aGF0IHdpbGwgYm90aCB3b3Jr
IGluIHRoZSBzYW1lCj4gPj4+IGNvbmRpdGlvbi4gQW5kIGl0IGlzIGV4cGVjdGVkIHRoYXQgTGlu
dXggaXMgbW9yZSBjbGV2ZXIgdGhhbiBVLUJvb3QgICAgCj4gPj4KPiA+PiBFcnJyLCB3aHkgPyAg
Cj4gPiAKPiA+IEJlY2F1c2Ugc29tZXRpbWVzIHBlb3BsZSB3cml0ZSBzaW1wbGVyIGRyaXZlciBp
biBVLUJvb3QsIG9yIGV2ZW4KPiA+IGhhcmRjb2RlZCB2YWx1ZXMuICAKPiAKPiBJIHNlZSwgdGhp
cyBpcyBub3QgdGhlIGNhc2Ugd2l0aCBkZW5hbGkgbmFuZCBkcml2ZXIgdGhvdWdoLgo+IAo+ID4g
SSBjaGVja2VkIHRoZSBkZW5hbGkgZHJpdmVyIGFuZCBpbmRlZWQgdS1ib290IHNob3VsZCBub3Qg
YmUgbXVjaCBjbGV2ZXIKPiA+IHRoYW4gTGludXguIEFyZSB0aGUgZGlmZmVyZW5jZXMgc2lnbmlm
aWNhbnQ/IFRoZSBjb2RlIGlzIHNvIGNsb3NlLCB5b3UKPiA+IGNhbiBwcm9iYWJseSBjaGVjayB3
aHkgeW91IGhhdmUgZGlmZmVyZW5jZXMuIEFsc28gdmVyaWZ5IHRoYXQgdGhlIHNhbWUKPiA+IE9O
RkkgbW9kZSBpcyB1c2VkLiAgCj4gCj4gSXQgbWlnaHQndmUgbWFkZSBzZW5zZSB0byBjaGVjayB0
aG9zZSBkcml2ZXIgZGlmZmVyZW5jZXMgYmVmb3JlIG1ha2luZwo+IHN1Y2ggYW4gc3RhdGVtZW50
IDstKQo+IFRoYXQgc2FpZCwgSSBkb24ndCB0aGluayBlaXRoZXIgVS1Cb290IG9yIExpbnV4IHVz
ZXMgdGhlIE9ORkkKPiBpbmZvcm1hdGlvbiBmb3IgdGhpcyBOQU5ELCBidXQgSSBtaWdodCBiZSB3
cm9uZy4KCkkgZG9uJ3Qga25vdyB3aGF0IGlzIHRoZSBleGFjdCBkZXZpY2UgYnV0IG1vc3Qgb2Yg
dGhlIHRpbWUsIGV2ZW4gZm9yCm5vbiBPTkZJLWNvbXBsaWFudCBjaGlwcywgdGhlIGNvcmUgc3Rh
cnRzIHRhbGtpbmcgYXQgdGhlIGxvd2VzdCBPTkZJCnNwZWVkIChtb2RlIDApIGFuZCB0aGVuIG5l
Z290aWF0ZSB3aXRoIHRoZSBOQU5EIGNoaXAgdGhlIGFjdHVhbCB0aW1pbmdzCnRvIHVzZS4gVGhp
cyB3b3JrcyBpZiBnZXQvc2V0X2ZlYXR1cmVzIGlzIHN1cHBvcnRlZCwgb3RoZXJ3aXNlIHlvdQpt
aWdodCBoYXZlIGEgZGVmYXVsdCBtb2RlIHNvbWV3aGVyZS4gSXMgaXQgdGhlIHNhbWUgaW4gYm90
aCBjYXNlcz8gRG9lcwp0aGUgY29yZSB0cmllcyB0byBhcHBseSB0aGUgc2FtZSB0aW1pbmdzPyBJ
cyB0aGUgY2FsY3VsYXRpb24gdGhlIHNhbWU/CgpUaGVzZSBhcmUgcG9pbnRlcnMgYnV0IEkgYW0g
c3VyZSB5b3UgY2FuIGZpZ3VyZSBhbGwgdGhhdCBvdXQuCgo+ID4+PiBhbmQKPiA+Pj4gbWF5IG9w
dGltaXplIGJldHRlciB0aGUgdGltaW5ncyBkZXBlbmRpbmcgb24gdGhlIHNlbGVjdGVkIG1vZGUg
KFswLTVdKQo+ID4+PiAoaGVuY2UgdGhlIGRpZmZlcmVudCBjYWxscyB0byAtPnNldHVwX2RhdGFf
aW50ZXJmYWNlKCkuICAgIAo+ID4+Cj4gPj4gSSB3b3VsZCBleHBlY3QgdGhvc2UgdHdvIHNob3Vs
ZCBwcm9kdWNlIGlkZW50aWNhbCB0aW1pbmcgcGFyYW1ldGVycywKPiA+PiBwZXJpb2QsIG90aGVy
d2lzZSBvbmUgb3IgdGhlIG90aGVyIGlzIHdyb25nLiBUaHVzIGZhciwgaXQgd2FzIExpbnV4IHRo
YXQKPiA+PiBwcm9kdWNlZCBub24td29ya2luZyByZXN1bHRzLiAgCj4gPiAKPiA+IEFnYWluLCB3
ZSBkZWZpbmUgbWluaW11bSBhbmQgbWF4aW11bSBkZWxheXMuIElmIHRoZSByaWdodCB0aGluZyBp
cyB0bwo+ID4gbm90IHdhaXQgbW9yZSB0aGFuIDV1cyBhbmQgeW91IHdhaXQgdXAgdG8gNiwgaXQg
ZG9lcyBub3QgbWVhbiB5b3UKPiA+IHdyb3RlICJiYWQgdGltaW5ncyIuIDR1cyB3b3VsZCBiZSBh
IGJhZCB0aW1pbmcgdGhvdWdoLiBJdCBkZXBlbmRzIG9uCj4gPiB3aGF0IHlvdSBhcmUgbG9va2lu
ZyBhdC4gIAo+IAo+IEkgYW0gbG9vayBhdCBmb3IgZXhhbXBsZQo+IAo+ICBkZW5hbGktPnJlZyAr
IFRDV0FXX0FORF9BRERSXzJfREFUQSA9IDB4MDAwMDE0M2YgLT4gMHgwMDAwMTQzMgo+IAo+IFJl
Z2lzdGVyIHdhcyAweDE0M2YgYmVmb3JlLCBub3cgaXMgMHgxNDMyICwgd2hpY2ggaXMgbGVzcy4K
PiBJIGd1ZXNzIHRoYXQgd291bGQgYmUgdGhlICJiYWQgdGltaW5nIiB0aGVuID8KCldlbGwsIGlz
IGl0IGEgbWluaW11bSBvciBhIG1heGltdW0gPyBIb3cgZG8geW91IGtub3cgVS1Cb290IHZhbHVl
IGlzCnN0cmFpZ2h0IG9uIHRoZSBlZGdlPyBJZiB5b3Ugd2FudCB0byBrbm93IGlmIHRpbWluZ3Mg
YXJlIHZhbGlkLCBvcGVuCnRoZSBwYXJ0IGRhdGFzaGVldCwgZG8gdGhlIG1hdGggd2l0aCBhIHBh
cGVyIGFuZCBjb21wYXJlLiBUaGlzIGlzIHRoZQpzY2llbnRpZmljIHdheSB0byBkZWNsYXJlIHRp
bWluZ3MgdmFsaWQgb3IgaW52YWxpZC4KCj4gPj4+IFJ1biBhIHN0cmVzcyB0ZXN0LCBpZiBpdCBw
YXNzZXMsIHlvdSBzaG91bGQgYmUgZ29vZCA6KSAgICAKPiA+Pgo+ID4+IFRoYW5rIHlvdSBmb3Ig
dGhlIGhpbnQsIEkgdGhpbmsgdGhlIHN0cmVzcyB0ZXN0IHRodXMgZmFyIGNvdWxkIGJlCj4gPj4g
Y29uc2lkZXJlZCBzdWZmaWNpZW50LiBJIGd1ZXNzIHdlIGNhbiBhZ3JlZSBvbiB0aGF0ID8gIAo+
ID4gCj4gPiBPaCB5ZWFoIGFic29sdXRlbHkgOikgIAoKSnVzdCB0byBiZSBzdXJlLCB3ZSBhcmUg
dGFsa2luZyBhYm91dCB0aGUgbmV3IHRpbWluZ3MgZGVyaXZlZCB3aXRoCk1hc2FoaXJvJ3MgcGF0
Y2ggaW4gTGludXggaGVyZSwgcmlnaHQ/CgpCZWNhdXNlICJwZXJmZWN0IHRpbWluZ3MiID0+ICJ3
b3JrIGluIHRoZSBvdmVuIiBidXQgbGV0IGJlIGNsZWFyIG9uCnRoZSBmYWN0IHRoYXQgIndvcmsg
aW4gdGhlIG92ZW4iIGRvZXMgbm90IGltcGx5ICJwZXJmZWN0IHRpbWluZ3MiLgoKClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
