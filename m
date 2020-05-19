Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 568C5C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 09:08:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EDD4206D4
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 09:08:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OrNby9Y1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EDD4206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aDTunUFLIkmhuBqCJMBe2yIt8S4XOCxOuUavcRgghkE=; b=OrNby9Y1eODKjL
	ywlBG10Dy9U2qurlCBJAR7k9kTHeCuEQTvwNTVDRokeM/qpRR+r5GKMErhtSTkZ9GAxfRv3xGVPyN
	s4jHzkQwqs14bL0c02dSkaYHt4FYBFFw3r1zmboxs/w8u/IjBKkpZNQ7pt3CeBvzcEJnrWRSPVy/f
	FAymg7IJdTrqugUBgK8enjDbHHCOM5tSm30OL2QHvgdJZ1Nf1UDtEbjOE64hVaza5RDZlQbyH4rOh
	GPwbdXy2wekn+FJ2DQLFrOoNEiaGhglp8U+DzlZMbNpB1NE9hzSLot8gp3uYon0jIkL3Jt19wIPg0
	AqUw21e/GxVC5I0fGZsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jayEz-0006SA-I1; Tue, 19 May 2020 09:08:49 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jayEv-0006RM-Fn
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 09:08:48 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id D2EBA20005;
 Tue, 19 May 2020 09:08:41 +0000 (UTC)
Date: Tue, 19 May 2020 11:08:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bean Huo <huobean@gmail.com>
Subject: Re: [PATCH v4 0/5] Micron SLC NAND filling block
Message-ID: <20200519110840.2302987f@xps13>
In-Reply-To: <8de0911281b4c03671841027ec165422789b63f2.camel@gmail.com>
References: <20200518135943.11749-1-huobean@gmail.com>
 <20200518172253.1c3b9d32@xps13>
 <8de0911281b4c03671841027ec165422789b63f2.camel@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_020847_364232_E8FA0F7B 
X-CRM114-Status: GOOD (  28.40  )
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
Cc: vigneshr@ti.com, richard@nod.at, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, derosier@gmail.com,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQmVhbiwKCkJlYW4gSHVvIDxodW9iZWFuQGdtYWlsLmNvbT4gd3JvdGUgb24gVHVlLCAxOSBN
YXkgMjAyMCAxMTowNDoxNSArMDIwMDoKCj4gaGksICBNaXF1ZWwKPiAKPiBPbiBNb24sIDIwMjAt
MDUtMTggYXQgMTc6MjIgKzAyMDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBCZWFuLAo+
ID4gCj4gPiBCZWFuIEh1byA8aHVvYmVhbkBnbWFpbC5jb20+IHdyb3RlIG9uIE1vbiwgMTggTWF5
IDIwMjAgMTU6NTk6MzgKPiA+ICswMjAwOgo+ID4gICAKPiA+ID4gRnJvbTogQmVhbiBIdW8gPGJl
YW5odW9AbWljcm9uLmNvbT4KPiA+ID4gCj4gPiA+IEFmdGVyIHN1Ym1pc3Npb24gb2YgcGF0Y2gg
VjEgWzFdIGFuZCBWMiBbMl0sIHdlIHN0b3BwZWQgaXRzIHVwZGF0ZQo+ID4gPiBzaW5jZSB3ZSBn
ZXQKPiA+ID4gc3R1Y2sgaW4gdGhlIHNvbHV0aW9uIG9uIGhvdyB0byBhdm9pZCB0aGUgcG93ZXIt
bG9zcyBpc3N1ZSBpbiBjYXNlCj4gPiA+IHBvd2VyLWN1dAo+ID4gPiBoaXRzIHRoZSBibG9jayBm
aWxsaW5nLiBJbiB0aGUgdjEgYW5kIHYyLCB0byBhdm9pZCB0aGlzIGlzc3VlLCB3ZQo+ID4gPiBh
bHdheXMgZGFtYWdlZAo+ID4gPiBwYWdlMCwgcGFnZTEsIHRoaXMncyBiYXNlZCBvbiB0aGUgaHlw
b3RoZXNpcyB0aGF0IE5BTkQgRlMgaXMgVUJJRlMuCj4gPiA+IFRoaXMKPiA+ID4gRlMtc3BlY2lm
aWNhbCBjb2RlIGlzIHVuYWNjZXB0YWJsZSBpbiB0aGUgTVREIGxheWVyLiBBbHNvLCBpdAo+ID4g
PiBjYW5ub3QgY292ZXIgYWxsCj4gPiA+IE5BTkQgYmFzZWQgZmlsZSBzeXN0ZW0uIEJhc2VkIG9u
IHRoZSBjdXJyZW50IGRpc2N1c3Npb24sIHNlZW1zIHRoYXQKPiA+ID4gcmUtd3JpdGUgYWxsCj4g
PiA+IGZpcnN0IDE1IHBhZ2UgZnJvbSBwYWdlMCBpcyBhIHNhdGlzZmFjdG9yeSBzb2x1dGlvbi4g
IAo+ID4gCj4gPiBXZSBoYXZlIGEgbGF5ZXJpbmcgcHJvYmxlbSBub3cuIE1heWJlIHdlIHNob3Vs
ZCBqdXN0IGhhdmUgYW4gTVRECj4gPiBpbnRlcm5hbCB2YXJpYWJsZSBsaWtlIG1pbl93cml0dGVu
X3BhZ2VzX2JlZm9yZV9lcmFzZSB0aGF0IHRoZSBNaWNyb24KPiA+IGRyaXZlciBjb3VsZCBzZXQg
dG8gYSAhMCB2YWx1ZS4KPiA+IAo+ID4gVGhlbiwgdGhlIGhhbmRsaW5nIGNvdWxkIGJlIGRvbmUg
YnkgdGhlIHVzZXIgKFVCSS9VQklGUywgSkZGUzIsIE1URAo+ID4gdXNlciBpZiBleHBvcnRlZCku
Cj4gPiAgIAo+IAo+IFRoaXMgaXMgTkFORCBpdHMgb3duIHByb2JsZW0sIGlmIG5vIHNpZ25pZmlj
YW50IGFkYW50YWdlLCBJIGRvbid0IHRoaW5rCj4gaXQncyBhIGdvb2Qgc29sdXRpb24gdG8gZXh0
ZW5kIHRoZSBwcm9ibGVtIHRvIHRoZSB1cHBlciBGUyBsYXllci4KPiBhbHNvLCBpbiB0aGUgRlMg
ZXJhc2UgcGF0aCwgZG9lc24ndCBoYXZlIHRoZSBwcm9ncmFtbWVkIHBhZ2VzIGNvdW50ZXIuCj4g
d2Ugc2hvdWxkIHJlcGVhdCB0aGUgc2FtZSBhcHByb2FjaCBhcyB3ZSBkaWQgaW4gTVREIGxheWVy
LgoKVGhlIHByb2JsZW0gaXMgdGhhdCBpZiB0aGUgZmlsZXN5c3RlbSBpcyBub3QgYXdhcmUsIGl0
IGJyZWFrcyB0aGUKInBvd2VyIGN1dCBzYWZlIiBhc3NlcnRpb24uCgpUaGVyZSBpcyBhIHByb2Js
ZW0gd2l0aCBKRkZTMiBhbmQgYSBwcm9ibGVtIHdpdGggVUJJRlMgYmVjYXVzZSBvZiB0aGF0LgpX
ZSBjYW4gY2VydGFpbmx5IGtlZXAgYSBkZWZhdWx0IGltcGxlbWVudGF0aW9uIGxpa2UgdGhpcyBv
bmUgZm9yIG90aGVyCnVzZXJzIHRob3VnaC4KCj4gCj4gPiA+IAo+ID4gPiBNZWFud2hpbGUsIEkg
Ym9ycm93ZWQgb25lIGlkZWEgZnJvbSBNaXF1ZWwgUmF5bmFsIHBhdGNoc2V0IFszXSwgaW4KPiA+
ID4gd2hpY2gga2VlcHMKPiA+ID4gYSByZWNvZGUgb2YgcHJvZ3JhbW1lZCBwYWdlcywgYmFzZSBv
biBpdCwgZm9yIG1vc3Qgb2YgdGhlIGNhc2VzLCB3ZQo+ID4gPiBkb24ndCBuZWVkCj4gPiA+IHRv
IHJlYWQgZXZlcnkgcGFnZSB0byBzZWUgaWYgY3VycmVudCBlcmFzaW5nIGJsb2NrIGlzIGEgcGFy
dGlhbGx5Cj4gPiA+IHByb2dyYW1tZWQKPiA+ID4gYmxvY2suCj4gPiA+IAo+ID4gPiBDaGFuZ2Vs
b2c6Cj4gPiA+IAo+ID4gPiB2MyAtIHY0Ogo+ID4gPiAgICAgMS4gSW4gdGhlIHBhdGNoIDQvNSwg
Y2hhbmdlIHRvIGRpcmVjdGx5IHVzZSBlY2Muc3RyZW5ndGggdG8KPiA+ID4ganVkZ2UgdGhlIHBh
Z2UKPiA+ID4gICAgICAgIGlzIGEgZW1wdHkgcGFnZSBvciBub3QsIHJhdGhlciB0aGFuIG1heF9i
aXRmbGlwcyA8IG10ZC0gIAo+ID4gPiA+Yml0ZmxpcF90aHJlc2hvbGQgIAo+ID4gPiAgICAgMi4g
SW4gdGhlIHBhdGNoIDUvNSwgZm9yIHRoZSBwb3dlcmxvc3MgY2FzZSwgZnJvbSB0aGUgbmV4dCB0
aW1lCj4gPiA+IGJvb3QgdXAsCj4gPiA+ICAgICAgICBsb3RzIG9mIHBhZ2Ugd2lsbCBiZSBwcm9n
cmFtbWVkIGZyb20gPnBhZ2UxNSBhZGRyZXNzLCBpZgo+ID4gPiBzdGlsbCB1c2luZwo+ID4gPiAg
ICAgICAgZmlyc3RfcCBhcyBHRU5NQVNLKCkgYml0bWFzayBzdGFydGluZyBwb3NpdGlvbiwgd3Jp
dHRlbnAKPiA+ID4gd2lsbCBiZSBhbHdheXMgMCwKPiA+ID4gICAgICAgIGZpeCBpdCBieSBjaGFu
Z2luZyBpdHMgYml0bWFzayBzdGFydGluZyBhdCBiaXQgcG9zaXRpb24gMC4KPiA+ID4gCj4gPiA+
IHYyIC0gdjM6Cj4gPiA+ICAgICAxLiBSZWJhc2UgcGF0Y2ggdG8gdGhlIGxhdGVzdCBNVEQgZ2l0
IHRyZWUKPiA+ID4gICAgIDIuIEFkZCBhIHJlY29yZCB0aGF0IGtlZXBzIHRyYWNraW5nIHRoZSBw
cm9ncmFtbWVkIHBhZ2VzIGluIHRoZQo+ID4gPiBmaXJzdCAxNgo+ID4gPiAgICAgICAgcGFnZXMK
PiA+ID4gICAgIDMuIENoYW5nZSBmcm9tIHByb2dyYW0gb2RkIHBhZ2VzLCBkYW1hZ2UgcGFnZSAw
IGFuZCBwYWdlIDEsIHRvCj4gPiA+IHByb2dyYW0gYWxsCj4gPiA+ICAgICAgICBmaXJzdCAxNSBw
YWdlcwo+ID4gPiAgICAgNC4gQWRkcmVzcyBpc3N1ZXMgd2hpY2ggZXhpc3QgaW4gdGhlIFYyLgo+
ID4gPiAKPiA+ID4gdjEgLSB2MjoKPiA+ID4gICAgIDEuIFJlYmFzZWQgVjEgdG8gbGF0ZXN0IExp
bnV4IGtlcm5lbC4KPiA+ID4gICAgIDIuIEFkZCBlcmFzZSBwcmVwYXJhdGlvbiBmdW5jdGlvbiBw
b2ludGVyIGluCj4gPiA+IG5hbmRfbWFudWZhY3R1cmVyX29wcy4KPiA+ID4gCj4gPiA+IAo+ID4g
PiBbMV0gaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvbGludXgtbXRkL21zZzA0MTEyLmh0
bWwKPiA+ID4gWzJdIGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2xpbnV4LW10ZC9tc2cw
NDQ1MC5odG1sCj4gPiA+IFszXSBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9saW51eC1t
dGQvbXNnMTMwODMuaHRtbAo+ID4gPiAKPiA+ID4gCj4gPiA+IEJlYW4gSHVvICg1KToKPiA+ID4g
ICBtdGQ6IHJhd25hbmQ6IGdyb3VwIGFsbCBOQU5EIHNwZWNpZmljIG9wcyBpbnRvIG5ldyBuYW5k
X2NoaXBfb3BzCj4gPiA+ICAgbXRkOiByYXduYW5kOiBBZGQge3ByZSxwb3N0fV9lcmFzZSBob29r
cyBpbiBuYW5kX2NoaXBfb3BzCj4gPiA+ICAgbXRkOiByYXduYW5kOiBBZGQgd3JpdGVfb29iIGhv
b2sgaW4gbmFuZF9jaGlwX29wcwo+ID4gPiAgIG10ZDogcmF3bmFuZDogSW50cm9kdWNlIGEgbmV3
IGZ1bmN0aW9uCj4gPiA+IG5hbmRfY2hlY2tfaXNfZXJhc2VkX3BhZ2UoKQo+ID4gPiAgIG10ZDog
cmF3bmFuZDogbWljcm9uOiBNaWNyb24gU0xDIE5BTkQgZmlsbGluZyBibG9jayAgCj4gPiAKPiA+
IFdoZW4geW91IHRha2UgbXkgcGF0Y2hlcyBpbiB5b3VyIHNlcmllcywgZXNwZWNpYWxseSB3aGVu
IG5vdCB0b3VjaGluZwo+ID4gdGhlbSBhdCBhbGwsIHlvdSBzaG91bGQga2VlcCBteSBBdXRob3Jz
aGlwIGFuZCBTb0IgZmlyc3QsIHRoZW4gYWRkCj4gPiB5b3VyCj4gPiBTb0IuCj4gPiAgIAo+IAo+
IHNvcnJ5IGZvciBteSBmYXVsdCwgSSB0aG91Z2h0IGFkZGluZyB5b3VyIFNpZ25lZC1vZmYtYnkg
aW4gMy81IGlzCj4gc3VmZmllbnQuIHlvdSBtZWFuIEkgc2hvdWxkIGFkZCB5b3VyIHNpZ25lZC1v
ZmYtYnkgaW4gNS81IGFzIHdlbGw/Cj4gSSB3aWxsIGRvIHRoYXQgaW4gbmV4dCB2ZXJzaW9uLgoK
WW91IHNob3VsZCBrZWVwIG15IEF1dGhvcnNoaXAgYW5kIFNvQiBmb3IgYm90aCBwYXRjaGVzICsg
YWRkIHlvdXIgU29CCmFmdGVyIG1pbmUuCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
