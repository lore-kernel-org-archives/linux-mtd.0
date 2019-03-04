Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D2EC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 11:24:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B4EA2070B
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 11:24:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GxigRNBz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B4EA2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lbpa782wSJOntbVUeQbnHEhyv+NeRrzOGq4l3cv9O3E=; b=GxigRNBzOaDZSX
	7kdbb9hUBPnjjeOLatIy4wzM3vjhS5+qLoZwRRx2yoRLe5NTfa4T1ns4AaL94D8evcvSPh9IRWECd
	MZwo5Xx4D76AdUt2yU7sCtsTx6Z68VTfoxh+qpoX0Kj69c7OMRauzovr/se4/ZhgOjT/pgsRyUZdh
	4F39fhorivGFYXicfWoVRyMsy3MUe2CxF4VUTHCKnQlGyfecTIsOBre40RaDzNnXJQ22rKoALvBt6
	oqdqKviAIV6xTtV9yJacB8lEqc0E8uw38So2lvdqLg7W+or7gS3fERL2KjWnENXN0Qd7utRWTPzy0
	d1jeNaUyAeXKNBAw0x0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0lhT-00007V-LK; Mon, 04 Mar 2019 11:24:03 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0lhQ-000078-BN
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2019 11:24:02 +0000
X-Originating-IP: 90.88.147.150
Received: from xps13 (aaubervilliers-681-1-27-150.w90-88.abo.wanadoo.fr
 [90.88.147.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 3DD9C60007;
 Mon,  4 Mar 2019 11:23:49 +0000 (UTC)
Date: Mon, 4 Mar 2019 12:23:48 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Emil Lenngren <emil.lenngren@gmail.com>
Subject: Re: [PATCH] mtd: spinand: Wait after erase in spinand_markbad
Message-ID: <20190304122348.3824447b@xps13>
In-Reply-To: <CAO1O6scHuaGJsS1wXtEpxi930K57yDBUZggb1Sik9XoZMJA+8A@mail.gmail.com>
References: <20181221115831.9595-1-emil.lenngren@gmail.com>
 <20190105145845.7a28d8f8@bbrezillon>
 <CAO1O6se_1oPv6SogDkkMaF1K9N7XxtTzeHAruibB8fph+mam=A@mail.gmail.com>
 <20190106091049.01e2e3d9@bbrezillon>
 <CAO1O6scHuaGJsS1wXtEpxi930K57yDBUZggb1Sik9XoZMJA+8A@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_032400_691598_BDC9AF6C 
X-CRM114-Status: GOOD (  29.42  )
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
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRW1pbCwKCkVtaWwgTGVubmdyZW4gPGVtaWwubGVubmdyZW5AZ21haWwuY29tPiB3cm90ZSBv
biBNb24sIDE4IEZlYiAyMDE5CjEyOjI3OjI1ICswMTAwOgoKPiBIaSwKPiAKPiBEZW4gc8O2biA2
IGphbi4gMjAxOSBrbCAwOToxMSBza3JldiBCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2Vy
bmVsLm9yZz46Cj4gPgo+ID4gT24gU2F0LCA1IEphbiAyMDE5IDIyOjAxOjQ0IC0wODAwCj4gPiBF
bWlsIExlbm5ncmVuIDxlbWlsLmxlbm5ncmVuQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiAgCj4gPiA+
IEhpLAo+ID4gPgo+ID4gPiBEZW4gbMO2ciA1IGphbi4gMjAxOSBrbCAwNTo1OSBza3JldiBCb3Jp
cyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2VybmVsLm9yZz46ICAKPiA+ID4gPgo+ID4gPiA+IE9u
IEZyaSwgMjEgRGVjIDIwMTggMTI6NTg6MTQgKzAxMDAKPiA+ID4gPiBFbWlsIExlbm5ncmVuIDxl
bWlsLmxlbm5ncmVuQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+ID4gIAo+ID4gPiA+ID4gU1BJIE5B
TkQgZmxhc2hlcyBkb24ndCBhY2NlcHQgbmV3IGNvbW1hbmRzIHdoaWxlIGFuIGVyYXNlIGlzIG9u
Z29pbmcuCj4gPiA+ID4gPiBNYWtlIHN1cmUgdG8gd2FpdCB1bnRpbCB0aGUgZGV2aWNlIGlzIHJl
YWR5IGJlZm9yZSB3cml0aW5nIHRoZSBtYXJrZXIuCj4gPiA+ID4gPgo+ID4gPiA+ID4gSnVzdCBh
cyB3aXRoIHRoZSBlcmFzZSBvcCwgbm8gZXJyb3IgY2hlY2sgaXMgcGVyZm9ybWVkIHNpbmNlIHdl
IHdhbnQKPiA+ID4gPiA+IHRvIGNvbnRpbnVlIHdyaXRpbmcgdGhlIG1hcmtlciBldmVuIGlmIHRo
ZSBlcmFzZSBmYWlscy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBFbWlsIExl
bm5ncmVuIDxlbWlsLmxlbm5ncmVuQGdtYWlsLmNvbT4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4g
IGRyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyB8IDIgKysKPiA+ID4gPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+
ID4gPiA+ID4gaW5kZXggNDc5YzJmMmNmMS4uYzI3MjRkMzRlNiAxMDA2NDQKPiA+ID4gPiA+IC0t
LSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9t
dGQvbmFuZC9zcGkvY29yZS5jCj4gPiA+ID4gPiBAQCAtNjg1LDYgKzY4NSw4IEBAIHN0YXRpYyBp
bnQgc3BpbmFuZF9tYXJrYmFkKHN0cnVjdCBuYW5kX2RldmljZSAqbmFuZCwgY29uc3Qgc3RydWN0
IG5hbmRfcG9zICpwb3MpCj4gPiA+ID4gPgo+ID4gPiA+ID4gICAgICAgc3BpbmFuZF9lcmFzZV9v
cChzcGluYW5kLCBwb3MpOwo+ID4gPiA+ID4KPiA+ID4gPiA+ICsgICAgIHNwaW5hbmRfd2FpdChz
cGluYW5kLCBOVUxMKTsKPiA+ID4gPiA+ICsgIAo+ID4gPiA+Cj4gPiA+ID4gQWZ0ZXIgdGhpbmtp
bmcgYSBiaXQgbW9yZSBhYm91dCBpdCwgSSB0aGluayB3ZSBzaG91bGQgc2ltcGx5IHdyaXRlIHRo
ZQo+ID4gPiA+IEJCTSBhbmQgc2tpcCB0aGUgZXJhc2Ugb3BlcmF0aW9uLiBNYXJraW5nIGEgYmxv
Y2sgYmFkIGlzIGp1c3QgYWJvdXQKPiA+ID4gPiB3cml0aW5nIDAgdG8gdGhlIGZpcnN0IDIgYnl0
ZXMgb2YgdGhlIE9PQiBhcmVhLCBhbmQgd2UgZG9uJ3QgbmVlZCB0aGUKPiA+ID4gPiBibG9jayB0
byBiZSBlcmFzZWQgdG8gZG8gdGhhdC4KPiA+ID4gPiAgCj4gPiA+Cj4gPiA+IEkgY29tcGFyZWQg
d2l0aCB0aGUgcmF3IGFuZCBpbXBsZW1lbnRhdGlvbiBpbgo+ID4gPiBuYW5kX2Jsb2NrX21hcmti
YWRfbG93bGV2ZWwsIGl0IGFsc28gZXJhc2VzIGZpcnN0LCBpZ25vcmluZyBhCj4gPiA+IHBvdGVu
dGlhbCBlcnJvci4gIAo+ID4KPiA+IFllcywgYW5kIEkgdGhpbmsgdGhpcyBpbXBsZW1lbnRhdGlv
biB3YXMgaW5zcGlyZWQgYnkgdGhlIHJhd25hbmQgb25lLAo+ID4gYnV0IEknbSBub3Qgc3VyZSB0
aGUgcmF3bmFuZCBpbXBsZW0gaXMgY29ycmVjdC4KPiA+ICAKPiA+ID4KPiA+ID4gT24gdGhlIG90
aGVyIGhhbmQsIGEgY29tbW9uIHNwaSBmbGFzaCBjaGlwIE1YMzVMRjFHRTRBQiBzdGF0ZXMgaW4g
dGhlCj4gPiA+IGRhdGFzaGVldCB0aGF0IGl0J3Mgbm90IHJlY29tbWVuZGVkIHRvIGVyYXNlIGEg
YmFkIGJsb2NrLCBidXQgbm8KPiA+ID4gcmVhc29uIHdoeS4gIAo+ID4KPiA+IEJlY2F1c2UgdGhl
IGVyYXNlIG1pZ2h0IHN1Y2NlZWQgYW5kIHJlc2V0IHRoZSBCQk0gdG8gMHhmZiwgdGh1cyBtYXJr
aW5nCj4gPiB0aGUgYmxvY2sgZ29vZCBldmVuIGlmIGl0J3MgdW5yZWxpYWJsZS4KPiA+ICAKPiA+
ID4gQXQgdGhlIHNhbWUgdGltZSwgaXQncyBnZW5lcmFsbHkgZGlzYWxsb3dlZCB0byB3cml0ZSB0
aGUKPiA+ID4gc2FtZSBwYWdlIHR3aWNlLi4uICAKPiA+Cj4gPiBUaGF0J3Mgb25seSBpZiB5b3Ug
Y2FyZSBhYm91dCB0aGUgZGF0YSB5b3Ugd3JpdGUgdG8gdGhlIHBhZ2UuIE1hcmtpbmcgYQo+ID4g
YmxvY2sgYmFkIGlzIGp1c3QgYWJvdXQgc2V0dGluZyB0aGUgQkJNIHRvIDB4MCwgd2hpY2ggc2hv
dWxkIGFsd2F5cyB3b3JrCj4gPiBldmVuIGlmIHRoZSBwYWdlIHlvdSdyZSB3cml0aW5nIHRvIGhh
cyBhbHJlYWR5IGJlZW4gd3JpdHRlbiwgc2ltcGx5Cj4gPiBiZWNhdXNlIGEgMSAtPiAwIGNlbGwg
dHJhbnNpdGlvbiBkb2VzIG5vdCByZXF1aXJlIGFuIGVyYXNlIChvbmx5IGEgMCAtPgo+ID4gMSB0
cmFuc2l0aW9uIGRvZXMpLiAgCj4gCj4gU2hvdWxkIHRoZSBCQk0gYmUgd3JpdHRlbiB3aXRoIG9y
IHdpdGhvdXQgRUNDPyBOb3cgaXQgdXNlcyB3aGF0ZXZlcgo+IG1vZGUgd2FzIHVzZWQgaW4gdGhl
IGxhc3Qgb3BlcmF0aW9uLiBBbHNvIGZvciByZWFkaW5nLCBJIHNlZSB0aGUKPiAic3BpbmFuZF9p
c2JhZCIgZnVuY3Rpb24gc2V0cyAubW9kZSB0byBNVERfT1BTX1JBVyBidXQgdGhhdCBmaWVsZAo+
IGRvZXNuJ3Qgc2VlbSB0byBiZSBpbnNwZWN0ZWQsIGFnYWluIHVzaW5nIHRoZSBzYW1lIEVDQyBt
b2RlIGFzIGluIHRoZQo+IGxhc3Qgb3BlcmF0aW9uLgo+IElzbid0IGl0IGJlc3QgdG8gdXNlIHRo
ZSBub24tRUNDIG1vZGUgZm9yIGJvdGggcmVhZGluZyBhbmQgd3JpdGluZyB0aGUKPiBCQk0/IElm
IHdlIHdvdWxkIHVzZSBFQ0MgbW9kZSBhbmQgb3ZlcndyaXRlIHRoZSBwYWdlIHdoZW4gd3JpdGlu
ZyB0aGUKPiBCQk0gbWFya2VyLCBJIGd1ZXNzIHRoZSBjb250cm9sbGVyIG5lZWRzIHRvIHN0b3Jl
IGEgc2Vjb25kIGVycm9yCj4gY29ycmVjdGlvbiBjb2RlIChvdmVyd3JpdGluZyB0aGUgcHJldmlv
dXMgb25lKSwgd2hpY2ggd2lsbCBwcm9iYWJseQo+IGxlYWQgdG8gRUNDIGZhaWx1cmUgaWYgbGF0
ZXIgcmVhZCBpbiBFQ0MtbW9kZSAoYW5kIHdobyBrbm93cyBpZiBpdAo+IHdpbGwgImNvcnJlY3Qi
IHRoZSB6ZXJvIGJpdHMgdG8gb25lcy4uLikuCj4gCgpJIHN1cHBvc2Ugd3JpdGluZyB0aGUgQkJN
IHdpdGhvdXQgY29ycmVjdGlvbiBpcyB3aGF0IHdlIHdhbnQuCgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
