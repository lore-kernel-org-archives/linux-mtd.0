Return-Path: <SRS0=z9um=NK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E98C4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 08:04:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51AB56113A
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 08:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51AB56113A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kxx85mGLasjJmdXg9+7a55tAVvvCXRPj+C6X9ihZ4nw=; b=kZ2ReXM3W4K6Qx
	PtRyhBkB1pVZ/xrxROXVOfoSgW3ZpFM80/JoY3VdN2dJT5qK48eNjM0H9nCyzEhFBYLYIrrAZH22e
	gBgO3Qo0Hgj8BPMfLHbo0krX425WvhZMH1xCWx4CeawmH2Mxm3+73tLf2eTb9iDQAEbY8tEJxEMGV
	zO5C5PEPoigzn/KT09lMvI6NPdDE1eleCOKBb9lyElp97poq8In5CeRh31DXfKzFVHYrBS6HoIPxf
	OL5OzR0LUpnYmJ3QEMMf1VzkIzrwK+AOk4znKyxU2vBtqfiibYd9FXymRQSNE9bg//6uPAu9BqX7F
	t10oU56V2jejAMdVhMyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGd1g-007d0v-W0; Thu, 19 Aug 2021 08:03:49 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGd1d-007ctx-3G
 for linux-mtd@lists.infradead.org; Thu, 19 Aug 2021 08:03:46 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 05C2224000C;
 Thu, 19 Aug 2021 08:03:34 +0000 (UTC)
Date: Thu, 19 Aug 2021 10:03:34 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kestrel seventyfour <kestrelseventyfour@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: xway: No hardcoded ECC engine, use
 device tree setting
Message-ID: <20210819100334.6af2d86e@xps13>
In-Reply-To: <CAE9cyGQ+Bb3rQxiF4My9zXwg_+QYifaCckE=C6spAtN9_4dBFQ@mail.gmail.com>
References: <20210808072643.GA5084@ubuntu> <20210816093126.442f74a1@xps13>
 <CAE9cyGQ+Bb3rQxiF4My9zXwg_+QYifaCckE=C6spAtN9_4dBFQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_010345_437775_CDEAFA66 
X-CRM114-Status: GOOD (  36.26  )
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

SGVsbG8sCgpLZXN0cmVsIHNldmVudHlmb3VyIDxrZXN0cmVsc2V2ZW50eWZvdXJAZ21haWwuY29t
PiB3cm90ZSBvbiBUaHUsIDE5IEF1ZwoyMDIxIDA5OjIxOjQyICswMjAwOgoKPiBIaSBNaXF1w6hs
Cj4gCj4gQW0gTW8uLCAxNi4gQXVnLiAyMDIxIHVtIDA5OjMxIFVociBzY2hyaWViIE1pcXVlbCBS
YXluYWwKPiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT46Cj4gPgo+ID4gSGkgRGFuaWVsLAo+
ID4KPiA+IERhbmllbCBLZXN0cmVsIDxrZXN0cmVsc2V2ZW50eWZvdXJAZ21haWwuY29tPiB3cm90
ZSBvbiBTdW4sIDggQXVnIDIwMjEKPiA+IDA5OjI2OjQzICswMjAwOgo+ID4gIAo+ID4gPiBTb21l
IGRldmljZXMgdXNlIE1pY3JvbiBOQU5EIGNoaXBzLCB3aGljaCB1c2Ugb24tZGllIEVDQy4gVGhl
IGhhcmRjb2RlZAo+ID4gPiBzZXR0aW5nIG9mIE5BTkRfRUNDX0VOR0lORV9UWVBFX1NPRlQgbWFr
ZXMgdGhlbSB1bnVzYWJsZSwgYmVjYXVzZSB0aGUKPiA+ID4gc29mdHdhcmUgRUNDIG9uIHRvcCBv
ZiB0aGUgaGFyZHdhcmUgRUNDIHByb2R1Y2VzIGVycm9ycyBmb3IgZXZlcnkgcmVhZAo+ID4gPiBh
bmQgd3JpdGUgYWNjZXNzLCBub3QgdG8gbWVudGlvbiB0aGF0IGJvb3RpbmcgZG9lcyBub3Qgd29y
aywgYmVjYXVzZQo+ID4gPiB0aGUgYm9vdCBsb2FkZXIgdXNlcyB0aGUgY29ycmVjdCBFQ0Mgd2hl
biB0cnlpbmcgdG8gbG9hZCB0aGUga2VybmVsCj4gPiA+IGFuZCBzdG9wcyBsb2FkaW5nIG9uIHNl
dmVyZSBFQ0MgZXJyb3JzLgo+ID4gPiBUaGlzIHBhdGNoIHJlcXVpcmVzIHRoZSBkZXZpY2VzIHRo
YXQgY3VycmVudGx5IHdvcmsgd2l0aCB0aGUgaGFyZCBjb2RlZAo+ID4gPiBzZXR0aW5nIHRvIHNl
dCB0aGUgbmFuZC1lY2MtbW9kZSBwcm9wZXJ0eSB0byBzb2Z0IGluIHRoZWlyIGRldmljZQo+ID4g
PiB0cmVlLgo+ID4gPiAgCj4gPgo+ID4gUGxlYXNlIGFkZCBhIEZpeGVzOiBhbmQgQ2M6IHN0YWJs
ZSB0YWdzLCB5b3Ugd2lsbCBhbHNvIG5lZWQgdG8gc2VuZCB0bwo+ID4gc3RhYmxlQHZnZXIua2Vy
bmVsLm9yZyBhIGRpZmZlcmVudCB2ZXJzaW9uIG9mIHRoZSBwYXRjaCBmb3IgdGhlIGtlcm5lbAo+
ID4gNS40IElJVUMuCj4gPiAgCj4gPiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBLZXN0cmVsIDxr
ZXN0cmVsc2V2ZW50eWZvdXJAZ21haWwuY29tPgo+ID4gPiBUZXN0ZWQtYnk6IEFsZWtzYW5kZXIg
SmFuIEJhamtvd3NraSA8b2xlazJAd3AucGw+ICMgdGVzdGVkIG9uIEJUIEhvbWUgSHViIDVBCj4g
PiA+IC0tLQo+ID4gPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcveHdheV9uYW5kLmMgfCAyIC0tCj4g
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3h3YXlfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9y
YXcveHdheV9uYW5kLmMKPiA+ID4gaW5kZXggMjY3NTE5NzZlNTAyLi4wYTRiMGFhN2RkNGMgMTAw
NjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3h3YXlfbmFuZC5jCj4gPiA+ICsr
KyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3h3YXlfbmFuZC5jCj4gPiA+IEBAIC0xNDgsOCArMTQ4
LDYgQEAgc3RhdGljIHZvaWQgeHdheV93cml0ZV9idWYoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwg
Y29uc3QgdV9jaGFyICpidWYsIGludCBsZW4pCj4gPiA+Cj4gPiA+ICBzdGF0aWMgaW50IHh3YXlf
YXR0YWNoX2NoaXAoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiA+ID4gIHsKPiA+ID4gLSAgICAg
Y2hpcC0+ZWNjLmVuZ2luZV90eXBlID0gTkFORF9FQ0NfRU5HSU5FX1RZUEVfU09GVDsKPiA+ID4g
LQo+ID4gPiAgICAgICBpZiAoY2hpcC0+ZWNjLmFsZ28gPT0gTkFORF9FQ0NfQUxHT19VTktOT1dO
KQo+ID4gPiAgICAgICAgICAgICAgIGNoaXAtPmVjYy5hbGdvID0gTkFORF9FQ0NfQUxHT19IQU1N
SU5HOyAgCj4gPgo+ID4gWW91IGFsc28gbmVlZCB0byBvbmx5IHNldCB0aGUgSGFtbWluZyBhbGdv
cml0aG0gd2hlbiBlbmdpbmVfdHlwZSBpcwo+ID4gVFlQRV9TT0ZULgo+ID4KPiA+IFRoYW5rcywK
PiA+IE1pcXXDqGwgIAo+IAo+IEkgYW0gcmVhbGx5IHN0cnVnZ2xpbmcgd2l0aCB3aGF0IHRvIGRv
LiBGb3Igb25lIG9mIHRoZSBhZmZlY3RlZAo+IGRldmljZXMsIHRoZXkgY3JlYXRlZCB0d28gZGV2
aWNlCj4gdHJlZXMsIG9uZSBmb3IgTWljcm9uIGFuZCBvbmUgZm9yIGFsbCBvdGhlcnMuIFdoaWNo
IG9idmlvdXNseSBoYWQgbm8KPiBlZmZlY3QgZHVlIHRvIHRoZQo+IGhhcmRjb2RlZCBzZXR0aW5n
cywgd2hpY2ggbGVkIG1lIHRvIFBhdGNoIDIgYW5kIEkgdGhvdWdodCwgc28gYmUgaXQuCj4gQnV0
IHRoZSBwcm9jZXNzIHRvIGZpZ3VyZQo+IG91dCBpZiBvbmVzIGRldmljZSBoYXMgTWljcm9uIENo
aXBzIGlzIGVzc2VudGlhbGx5IGZsYXNoaW5nIGFuIGltYWdlCj4gYW5kIGlmIGl0IGRvZXMgbm90
IHdvcmssCj4gdXNlIHRoZSBzdG9jayBPRU0gcmVjb3ZlcnkgYW5kIHRyeSB0aGUgb3RoZXIgaW1h
Z2UuCj4gSG93ZXZlciwgc2luY2UgTWljcm9uIGlzIHRoZSBvbmx5IGNoaXAgdGhhdCBpcyB0cmVh
dGVkIGRpZmZlcmVudGx5LCBJIHdvbmRlcgo+IGlmIHlvdXIgZmlyc3QgcHJvcG9zYWwsIGV2ZW4g
dGhvdWdoIGl0IGlzIGhhY2t5LCBpcyB0aGUgYmV0dGVyCj4gYXBwcm9hY2ggdG8gc29sdmUgdGhl
IGlzc3VlCj4gZm9yIHRoZSBNaWNyb24gZGV2aWNlcyBub3QgYm9vdGluZyBhbmQgdGhyb3dpbmcg
RUNDIGVycm9ycy4gV2hhdCBkbyB5b3UgdGhpbms/Cj4gRm9sbG93IHVwIGZpcnN0IHBhdGNoIG9y
IHRoaXMgb25lPwoKSSBhbSBub3Qgc3VyZSB3ZSB1bmRlcnN0b29kIGVhY2ggb3RoZXIsIHlvdXIg
cGF0Y2ggaXMgZmluZSwgYnV0IHlvdQpuZWVkIHRvIGRvIHNvbWV0aGluZyBsaWtlOgoKc3RhdGlj
IGludCB4d2F5X2F0dGFjaF9jaGlwKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCnsKICAgIGlmIChj
aGlwLT5lY2MuZW5naW5lX3R5cGUgPSBOQU5EX0VDQ19FTkdJTkVfVFlQRV9TT0ZUICYmCiAgICAg
ICAgY2hpcC0+ZWNjLmFsZ28gPT0gTkFORF9FQ0NfQUxHT19VTktOT1dOKQogICAgICAgICBjaGlw
LT5lY2MuYWxnbyA9IE5BTkRfRUNDX0FMR09fSEFNTUlORzsKCkluIHRoZSBEVCB5b3Ugc2hvdWxk
IG5vdCBmb3JjZSBhbnkgRUNDIGVuZ2luZSAoZHJvcCB0aGUgbmFuZC1lY2MteHh4CnByb3BlcnRp
ZXMpIGFuZCBsZXQgdGhlIGNvcmUgaGFuZGxlIGl0LiBJdCB3aWxsIHByb2JhYmx5IGNob29zZSB0
aGUKbW9zdCBzdWl0YWJsZSBlbmdpbmVzIGZvciB5b3UuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
