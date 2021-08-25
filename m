Return-Path: <SRS0=OVP+=NQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A69EAC4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Aug 2021 08:52:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A36D61139
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Aug 2021 08:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A36D61139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7NLwcb7P+86tEUr2qkPaxhcqBUeaArWKvh4fJZlBhrk=; b=leKgpNJ+ZzApDm
	rNS5avFFBr4WUrFWIha9C0teoYRJ9kgoo1VJ3bkkg+0BQpIFUSEcgz58PNi7t3TsMZx8dfW0MfOoX
	Iek4JUFiNkc/OqxbyFsp929zw9dHiv7dI9ks6w6f5BaAC1+K0NLTKQ/Ccc3ILfQblmxoQKLFpghXo
	gjDRTkqiJY551B7OHc2SIYQ+J7dUVsJyWNtQCYDrTOvihsMiXSDWeWZuzQLpXvRMoQNNWMCe+X+h0
	EWbpzautvUCoolZ89IhBmOiWOEsXZL7yVlugKOhzlIowuwnVwlRqyCHm/6KcnEZ8AtyeyZg7tEosC
	gqR0MqOrMndkiPlrbKIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIodG-00604U-1T; Wed, 25 Aug 2021 08:51:38 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIod9-00603N-Dg
 for linux-mtd@lists.infradead.org; Wed, 25 Aug 2021 08:51:35 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id BFFB1240012;
 Wed, 25 Aug 2021 08:51:27 +0000 (UTC)
Date: Wed, 25 Aug 2021 10:51:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kestrel seventyfour <kestrelseventyfour@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: xway: No hardcoded ECC engine, use
 device tree setting
Message-ID: <20210825105126.4c1c15cb@xps13>
In-Reply-To: <CAE9cyGQ9_--=+MGc4_vTV1BkR6jv2RZcixyfLtCozXo349+6KA@mail.gmail.com>
References: <20210808072643.GA5084@ubuntu> <20210816093126.442f74a1@xps13>
 <CAE9cyGQ+Bb3rQxiF4My9zXwg_+QYifaCckE=C6spAtN9_4dBFQ@mail.gmail.com>
 <20210819100334.6af2d86e@xps13>
 <CAE9cyGSF2vTCptSZd3uMFaZPD=as=PwZY14S+zDhzjWCmsfmpQ@mail.gmail.com>
 <20210823172413.0bc4ab3a@xps13>
 <CAE9cyGTKFcMuxePo2SgxkBe_cWvP5nZ_SDcnuUtwaE5o9oVq3g@mail.gmail.com>
 <20210824192203.076df55e@xps13>
 <CAE9cyGQ9_--=+MGc4_vTV1BkR6jv2RZcixyfLtCozXo349+6KA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_015131_790698_17D44C2D 
X-CRM114-Status: GOOD (  37.05  )
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

Cktlc3RyZWwgc2V2ZW50eWZvdXIgPGtlc3RyZWxzZXZlbnR5Zm91ckBnbWFpbC5jb20+IHdyb3Rl
IG9uIFdlZCwgMjUgQXVnCjIwMjEgMTA6NDc6NDAgKzAyMDA6Cgo+IEhpIE1pcXXDqGwsCj4gCj4g
QW0gRGkuLCAyNC4gQXVnLiAyMDIxIHVtIDE5OjIyIFVociBzY2hyaWViIE1pcXVlbCBSYXluYWwK
PiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT46Cj4gPgo+ID4gSGVsbG8sCj4gPgo+ID4gS2Vz
dHJlbCBzZXZlbnR5Zm91ciA8a2VzdHJlbHNldmVudHlmb3VyQGdtYWlsLmNvbT4gd3JvdGUgb24g
VHVlLCAyNCBBdWcKPiA+IDIwMjEgMDk6MTU6NDkgKzAyMDA6Cj4gPiAgCj4gPiA+IEhpIE1pcXXD
qGwsCj4gPiA+Cj4gPiA+IEFtIE1vLiwgMjMuIEF1Zy4gMjAyMSB1bSAxNzoyNCBVaHIgc2Nocmll
YiBNaXF1ZWwgUmF5bmFsCj4gPiA+IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPjogIAo+ID4g
PiA+Cj4gPiA+ID4gSGkgS2VzdHJlbCwKPiA+ID4gPgo+ID4gPiA+IEtlc3RyZWwgc2V2ZW50eWZv
dXIgPGtlc3RyZWxzZXZlbnR5Zm91ckBnbWFpbC5jb20+IHdyb3RlIG9uIE1vbiwgMjMgQXVnCj4g
PiA+ID4gMjAyMSAxMzoxOTo0MyArMDIwMDoKPiA+ID4gPiAgCj4gPiA+ID4gPiBIaSBNaXF1w6hs
LAo+ID4gPiA+ID4KPiA+ID4gPiA+IEFtIERvLiwgMTkuIEF1Zy4gMjAyMSB1bSAxMDowMyBVaHIg
c2NocmllYiBNaXF1ZWwgUmF5bmFsCj4gPiA+ID4gPiA8bWlxdWVsLnJheW5hbEBib290bGluLmNv
bT46ICAKPiA+ID4gLi4uICAKPiA+ID4gPiA+Cj4gPiA+ID4gPiB0aGFuayB5b3UgZm9yIHlvdXIg
cmVzcG9uc2UuCj4gPiA+ID4gPiBJZiBJIHJlbW92ZSB0aGUgbmFuZC1lY2MteHh4IHByb3BlcnRp
ZXMgaW4gdGhlIGRldmljZSB0cmVlLCB0aGUgZGV2aWNlIHdpdGgKPiA+ID4gPiA+IHRoZSBUb3No
aWJhIE5BTkQgY2hpcCBpcyB3b3JraW5nLiBIb3dldmVyLCB0aGUgZGV2aWNlIHdpdGggdGhlIE1p
Y3Jvbgo+ID4gPiA+ID4gTkFORCBmYWlscyB3aXRoIE5PIEVDQyBmdW5jdGlvbnMgc3VwcGxpZWQ7
IGhhcmR3YXJlIEVDQyBub3QgcG9zc2libGUsCj4gPiA+ID4gPiBzZWVtcyB0byBiZSBhdCBsaW5l
IDUzNjcgb3IgZXF1aXZhbGVudC4KPiA+ID4gPiA+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29t
L2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMjTDUz
NjcKPiA+ID4gPiA+Cj4gPiA+ID4gPiBJdCBsb29rcyBsaWtlIHRoZSBtaWNyb24gbmFuZCBkcml2
ZXIgc3VwcG9ydHMgb24gZGllIG9ubHkgaWYgaXRzCj4gPiA+ID4gPiBzcGVjaWZpZWQgaW50IHRo
ZQo+ID4gPiA+ID4gRGV2aWNlIHRyZWU6Cj4gPiA+ID4gPiBodHRwczovL2VsaXhpci5ib290bGlu
LmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWljcm9u
LmMjTDUxMQo+ID4gPiA+ID4gVGhlIE1pY3JvbiBOQU5EIGRyaXZlciBwcm9iYWJseSBuZWVkcyB0
byBzZXQgdGhlIEVDQyB0eXBlIHRvIE9OIERJRSBpZiB0aGUKPiA+ID4gPiA+IHZhcmlhYmxlIG9u
ZGllIGNvbnRhaW5zIHRoZSBzdXBwb3J0ZWQgYXR0cmlidXRlPyEgIAo+ID4gPiA+Cj4gPiA+ID4g
WW91J3JlIHJpZ2h0IGJ1dCBJIGRvbid0IHNlZSBhbnkgZWFzeSB1cHN0cmVhbS1hYmxlIHNvbHV0
aW9uIGhlcmUuCj4gPiA+ID4gQ2hhbmdpbmcgdGhlIGJlaGF2aW9yIGluIHRoZSBYd2F5IGRyaXZl
ciB3b3VsZCBjZXJ0YWlubHkgYnJlYWsgdXNlcnMsCj4gPiA+ID4gY2hhbmdpbmcgdGhlIGJlaGF2
aW9yIGluIHRoZSBNaWNyb24gZHJpdmVyIHdvdWxkIGNlcnRhaW5seSBicmVhayBldmVuCj4gPiA+
ID4gbW9yZSB1c2Vycy4gVGhlIHJvb3QgY2F1c2UgYmVpbmcgYW4gYWJzZW5jZSBvZiBwcm9wZXIg
ZGVzY3JpcHRpb24gKHRoZQo+ID4gPiA+IGludGVncmF0aW9uIGNoYW5nZWQpLiBIb25lc3RseSBJ
IGZlZWwgc3R1Y2ssIG1heWJlIHlvdSBjYW4gdHJ5IHRvCj4gPiA+ID4gcmVnaXN0ZXIgeW91ciBk
ZXZpY2UsIGlmIGl0IGZhaWxzLCBjaGFuZ2UgdGhlIGludGVncmF0aW9uIGluIHRoZSBkcml2ZXIK
PiA+ID4gPiAodG8gYW4gb25kaWUgZWNjIGVuZ2luZSkgdGhlbiByZXRyeT8KPiA+ID4gPgo+ID4g
PiA+IFRoYW5rcywKPiA+ID4gPiBNaXF1w6hsICAKPiA+ID4KPiA+ID4gRG8geW91IHRoaW5rIGFk
ZGluZyBzb21ldGhpbmcgbGlrZSBiZWxvdyBhdCB0aGUgZm9sbG93aW5nIGxvY2F0aW9uCj4gPiA+
IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9t
dGQvbmFuZC9yYXcveHdheV9uYW5kLmMjTDIyMwo+ID4gPiB3b3VsZCBiZSB1cHN0cmVhbWFibGUg
KHdpdGggb3Igd2l0aG91dCBkZXZpY2UgdHJlZSBwcm9wZXJ0eT8pPwo+ID4gPgo+ID4gPiAgICAg
ICAgIGVyciA9IG5hbmRfc2NhbigmZGF0YS0+Y2hpcCwgMSk7Cj4gPiA+ICAgICAgICAgaWYgKGVy
ciAvKiAmJiBvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wobnAsICJsYW50aXEscmV0cnktb24tZGllIikg
Ki8pIHsKPiA+ID4gICAgICAgICAgICAgICAgIGRhdGEtPmNoaXAuZWNjLmVuZ2luZV90eXBlID0g
TkFORF9FQ0NfRU5HSU5FX1RZUEVfT05fRElFOwo+ID4gPiAgICAgICAgICAgICAgICAgZXJyID0g
bmFuZF9zY2FuKCZkYXRhLT5jaGlwLCAxKTsKPiA+ID4gICAgICAgICAgICAgICAgIGlmIChlcnIp
IHJldHVybiBlcnI7Cj4gPiA+ICAgICAgICAgfQo+ID4gPgo+ID4gPiBJdCBzdGlsbCB0aHJvd3Mg
dGhlIGtlcm5lbCB3YXJuaW5nIG9uIGZpcnN0IHRyeSwgYnV0IHRoZSBzZWNvbmQgdHJ5IHRoZW4g
d29ya3MuICAKPiA+Cj4gPiBDYW4geW91IHBsZWFzZSByZW1pbmQgbWUgd2hhdCBpcyB4d2F5L2xh
bnRpcS95b3VyIHNldHVwL2hvdyBwdWJsaWMgaXQKPiA+IGlzL3dobydzIHVzaW5nIHRoaXMgZHJp
dmVyPwo+ID4KPiA+IFRoYW5rcywKPiA+IE1pcXXDqGwgIAo+IAo+IEl0cyBmb3IgT3BlbndydCwg
SSB3b3VsZCBsaWtlIHRvIGFkZCBzdXBwb3J0IGZvciAzIG1vcmUgZGV2aWNlcwo+IEFWTSBmcml0
emJveCAzNDkwLzU0OTAgYW5kIDc0OTAuIFRoZXkgYWxsIGhhdmUgdmFyeWluZyBOQU5EIGNoaXBz
Lgo+IEkgaGF2ZSBpbml0aWFsbHkgY3JlYXRlZCBhIFBSIHRvIGhhdmUgbXkgaW5pdGlhbCBwYXRj
aCB0ZXN0ZWQ6Cj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW53cnQvb3BlbndydC9wdWxsLzQ0MjYK
PiBUaGVyZSBpcyBhbHJlYWR5IG9uZSBkZXZpY2Ugc3VwcG9ydGVkIHdoaWNoIGhhcyB0d28gRFRC
cyBvbmUgZm9yCj4gTWljcm9uIGFuZCBvbmUgZm9yIG5vbiBNaWNyb24gKDMzNzApLCBidXQgaXRz
IG5vdCB2ZXJ5IHN0cmFpZ2h0IGZvcndhcmQuCj4gV2l0aG91dCBoYXZpbmcgdGhpcyBpc3N1ZSBz
b2x2ZWQsIGZsYXNoaW5nIHRob3NlIGRldmljZXMgd291bGQgYmUKPiBwb3NzaWJseSBoYXZpbmcg
aXNzdWVzIGRlcGVuZGluZyBvbiBOQU5EIGNoaXAgb3IgdGhlIGF3a3dhcmQKPiB3b3JrYXJvdW5k
IG9mIGZsYXNoaW5nIG9uZSBpbWFnZSBhbmQgaWYgaXQgZG9lcyBub3QgYm9vdCwgYm9vdCB0aGUK
PiBvdGhlciBvbmUuIFdpdGhvdXQgc2VsZiBzb2xkZXJlZCBzZXJpYWwgY29uc29sZSwgaXQgd291
bGQgbm90IHZlcnkKPiBlYXN5IHRvIGZpZ3VyZSBvdXQgdGhlIE5BTkQgbWFudWZhY3R1cmVyLgo+
IFRoZSBBVk0gc3RvY2sgZmlybXdhcmUgaXMgb2xkIGtlcm5lbCBhbmQgZG9lcyBub3QgdXNlIGRl
dmljZQo+IHRyZWUgZm9yIE5BTkQsIHRoZXkganVzdCBxdWVyeSBhbGwgcG9zc2libGUgbWFudWZh
Y3R1cmVycyBhbmQgc2V0Cj4gdXAgTkFORCBiYXNlZCBvbiBtYW51ZmFjdHVyZXIgcXVlcnkuCgpC
dXQgaW4gdGhpcyBjYXNlIGNhbid0IHlvdSBjaGVjayB0aGUgJ3Jvb3QnIGNvbXBhdGlibGUgYWdh
aW5zdCBjZXJ0YWluCnZhbHVlcyBhbmQgYW5kIHNvbWUga2luZCBvZiBxdWlyayBpbiB0aGUgLT5h
dHRhY2goKSBob29rIHRvIHVwZGF0ZSB0aGUKRUNDIGVuZ2luZSB0byB0aGUgcmlnaHQgb25lPwoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
