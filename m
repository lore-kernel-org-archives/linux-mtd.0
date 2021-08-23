Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 068B0C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 11:21:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C02F261206
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 11:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C02F261206
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E/CjSqGT/8+6QBgo3wtBp/3FcdhjZCr1shKutiTX6qs=; b=QpiTGug8SjE9FT
	F5UoAsNshTEw9y9N5fDN/OX57UDAJ1fueNIh4HeFLpAh/7pBaVXMw5O2Q+AteFJJWqt1g1TTYKod+
	qUqN4EDDIT+jSsU/yENL+4OjIQJNKmNi3IKh/Kj+PCfrJSOUn/9Az9PjpwAOgslB9JHm4COStZlza
	5Oc7tinZOYiXqE5GOqvGMm4F7YZB1EHsMrj0ZOXvK0CFuakVVMyesNRePSh19xVXg1yP8x8IlIMtu
	s8B3efY8ZM9CQOVD0oWnAmpPgdLb/S1Isg39+YiUhQRLLCI4ITslQAwdjRuv90NKeuGmPMsIt8Uw7
	7M3uvOY9og/OGoI8UKww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI803-00GXdB-5G; Mon, 23 Aug 2021 11:20:19 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI7zp-00GXWC-TP
 for linux-mtd@lists.infradead.org; Mon, 23 Aug 2021 11:20:09 +0000
Received: by mail-qt1-x834.google.com with SMTP id d9so13397410qty.12
 for <linux-mtd@lists.infradead.org>; Mon, 23 Aug 2021 04:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4PbfMieHLNy2oJjY0XJuBOyImh9wvo44rr+tmqHI2Ug=;
 b=L6DISO0PrFOv7mJZL1glU0wLACXUv/vMMn+QWZA+uKq24fu7BeUXsn/WMb3Ub95vv9
 kJfmVgvOZAhEeyk6Em0z6muRmB24rwGlC5em0HylG9ywNi7sLzF50mqx33UFs1nBjAQO
 6m2W9Oo7opSL4CKetgsK6eeh9eskTCsbmjX0VbJFjkubczdhhDijclGJU6WEwhnmuwga
 hGrMjAqcl5Xk14xeV0U2KyD1EB4W/tS4EgYjkFqCSKk7cLqw80W0WlaMdetSTOyTWfpn
 q+3ZpagUrW/E4oxsodqkYHPA/7YJMyWjsfKyTWaTF57VR5unswA9yVzFueT/uf36rSpX
 jwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4PbfMieHLNy2oJjY0XJuBOyImh9wvo44rr+tmqHI2Ug=;
 b=BlQJ4+IIqupRL/0kBucuSL1KzxfYe7pyDkcu+fLYPuELg5II9YAOIbEyqinT4yvUdj
 M5Sy2fMiWZNdIj/q/IxBcjfF7dz9zQg+sFxSByJ2Pb6jbAq9sGMhNWU++mT6plHOKpiE
 BMncn3cCfCpz2X/8oJHgdw8TceM2fJ5qE14kXnau4pPMoR9+Ic9ZktEEh4LbLbftDmIE
 9/JLLE+g88HzvIV+e6ULuBzybGYuD7pJV3S51eNa8lHUVCuXmqTNvHWxiCX8o3qig+3T
 csSQXL7G4kQpk5PXVHg2EzGGeVInykIN4LI9a7DixnwWQaCR3E6YbiMijlM3T1EzOuQC
 HTMA==
X-Gm-Message-State: AOAM533LAWBOERHSQfeE3u9v7P11KwGcC8cSPMndckip8ihy0YsI2hmK
 Ab2q5y2u6nlyAIEmvTYHAhqliKnfyhIU/9md9eU=
X-Google-Smtp-Source: ABdhPJxNOdiHFNFi2SBTgDO9cbaeKvTB2Al5uJpnNNsuc5Da1tSvh4BtxRuOrUMOaZSEkY2XjzI+nlaFm9emkn2qbRQ=
X-Received: by 2002:a05:622a:1387:: with SMTP id
 o7mr29468276qtk.19.1629717593780; 
 Mon, 23 Aug 2021 04:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210808072643.GA5084@ubuntu> <20210816093126.442f74a1@xps13>
 <CAE9cyGQ+Bb3rQxiF4My9zXwg_+QYifaCckE=C6spAtN9_4dBFQ@mail.gmail.com>
 <20210819100334.6af2d86e@xps13>
In-Reply-To: <20210819100334.6af2d86e@xps13>
From: Kestrel seventyfour <kestrelseventyfour@gmail.com>
Date: Mon, 23 Aug 2021 13:19:43 +0200
Message-ID: <CAE9cyGSF2vTCptSZd3uMFaZPD=as=PwZY14S+zDhzjWCmsfmpQ@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: xway: No hardcoded ECC engine, use
 device tree setting
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_042005_999571_EB12D427 
X-CRM114-Status: GOOD (  42.87  )
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

SGkgTWlxdcOobCwKCkFtIERvLiwgMTkuIEF1Zy4gMjAyMSB1bSAxMDowMyBVaHIgc2NocmllYiBN
aXF1ZWwgUmF5bmFsCjxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPjoKPgo+IEhlbGxvLAo+Cj4g
S2VzdHJlbCBzZXZlbnR5Zm91ciA8a2VzdHJlbHNldmVudHlmb3VyQGdtYWlsLmNvbT4gd3JvdGUg
b24gVGh1LCAxOSBBdWcKPiAyMDIxIDA5OjIxOjQyICswMjAwOgo+Cj4gPiBIaSBNaXF1w6hsCj4g
Pgo+ID4gQW0gTW8uLCAxNi4gQXVnLiAyMDIxIHVtIDA5OjMxIFVociBzY2hyaWViIE1pcXVlbCBS
YXluYWwKPiA+IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPjoKPiA+ID4KPiA+ID4gSGkgRGFu
aWVsLAo+ID4gPgo+ID4gPiBEYW5pZWwgS2VzdHJlbCA8a2VzdHJlbHNldmVudHlmb3VyQGdtYWls
LmNvbT4gd3JvdGUgb24gU3VuLCA4IEF1ZyAyMDIxCj4gPiA+IDA5OjI2OjQzICswMjAwOgo+ID4g
Pgo+ID4gPiA+IFNvbWUgZGV2aWNlcyB1c2UgTWljcm9uIE5BTkQgY2hpcHMsIHdoaWNoIHVzZSBv
bi1kaWUgRUNDLiBUaGUgaGFyZGNvZGVkCj4gPiA+ID4gc2V0dGluZyBvZiBOQU5EX0VDQ19FTkdJ
TkVfVFlQRV9TT0ZUIG1ha2VzIHRoZW0gdW51c2FibGUsIGJlY2F1c2UgdGhlCj4gPiA+ID4gc29m
dHdhcmUgRUNDIG9uIHRvcCBvZiB0aGUgaGFyZHdhcmUgRUNDIHByb2R1Y2VzIGVycm9ycyBmb3Ig
ZXZlcnkgcmVhZAo+ID4gPiA+IGFuZCB3cml0ZSBhY2Nlc3MsIG5vdCB0byBtZW50aW9uIHRoYXQg
Ym9vdGluZyBkb2VzIG5vdCB3b3JrLCBiZWNhdXNlCj4gPiA+ID4gdGhlIGJvb3QgbG9hZGVyIHVz
ZXMgdGhlIGNvcnJlY3QgRUNDIHdoZW4gdHJ5aW5nIHRvIGxvYWQgdGhlIGtlcm5lbAo+ID4gPiA+
IGFuZCBzdG9wcyBsb2FkaW5nIG9uIHNldmVyZSBFQ0MgZXJyb3JzLgo+ID4gPiA+IFRoaXMgcGF0
Y2ggcmVxdWlyZXMgdGhlIGRldmljZXMgdGhhdCBjdXJyZW50bHkgd29yayB3aXRoIHRoZSBoYXJk
IGNvZGVkCj4gPiA+ID4gc2V0dGluZyB0byBzZXQgdGhlIG5hbmQtZWNjLW1vZGUgcHJvcGVydHkg
dG8gc29mdCBpbiB0aGVpciBkZXZpY2UKPiA+ID4gPiB0cmVlLgo+ID4gPiA+Cj4gPiA+Cj4gPiA+
IFBsZWFzZSBhZGQgYSBGaXhlczogYW5kIENjOiBzdGFibGUgdGFncywgeW91IHdpbGwgYWxzbyBu
ZWVkIHRvIHNlbmQgdG8KPiA+ID4gc3RhYmxlQHZnZXIua2VybmVsLm9yZyBhIGRpZmZlcmVudCB2
ZXJzaW9uIG9mIHRoZSBwYXRjaCBmb3IgdGhlIGtlcm5lbAo+ID4gPiA1LjQgSUlVQy4KPiA+ID4K
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgS2VzdHJlbCA8a2VzdHJlbHNldmVudHlmb3Vy
QGdtYWlsLmNvbT4KPiA+ID4gPiBUZXN0ZWQtYnk6IEFsZWtzYW5kZXIgSmFuIEJhamtvd3NraSA8
b2xlazJAd3AucGw+ICMgdGVzdGVkIG9uIEJUIEhvbWUgSHViIDVBCj4gPiA+ID4gLS0tCj4gPiA+
ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3h3YXlfbmFuZC5jIHwgMiAtLQo+ID4gPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy94d2F5X25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3h3
YXlfbmFuZC5jCj4gPiA+ID4gaW5kZXggMjY3NTE5NzZlNTAyLi4wYTRiMGFhN2RkNGMgMTAwNjQ0
Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcveHdheV9uYW5kLmMKPiA+ID4gPiAr
KysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy94d2F5X25hbmQuYwo+ID4gPiA+IEBAIC0xNDgsOCAr
MTQ4LDYgQEAgc3RhdGljIHZvaWQgeHdheV93cml0ZV9idWYoc3RydWN0IG5hbmRfY2hpcCAqY2hp
cCwgY29uc3QgdV9jaGFyICpidWYsIGludCBsZW4pCj4gPiA+ID4KPiA+ID4gPiAgc3RhdGljIGlu
dCB4d2F5X2F0dGFjaF9jaGlwKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gPiA+ID4gIHsKPiA+
ID4gPiAtICAgICBjaGlwLT5lY2MuZW5naW5lX3R5cGUgPSBOQU5EX0VDQ19FTkdJTkVfVFlQRV9T
T0ZUOwo+ID4gPiA+IC0KPiA+ID4gPiAgICAgICBpZiAoY2hpcC0+ZWNjLmFsZ28gPT0gTkFORF9F
Q0NfQUxHT19VTktOT1dOKQo+ID4gPiA+ICAgICAgICAgICAgICAgY2hpcC0+ZWNjLmFsZ28gPSBO
QU5EX0VDQ19BTEdPX0hBTU1JTkc7Cj4gPiA+Cj4gPiA+IFlvdSBhbHNvIG5lZWQgdG8gb25seSBz
ZXQgdGhlIEhhbW1pbmcgYWxnb3JpdGhtIHdoZW4gZW5naW5lX3R5cGUgaXMKPiA+ID4gVFlQRV9T
T0ZULgo+ID4gPgo+ID4gPiBUaGFua3MsCj4gPiA+IE1pcXXDqGwKPiA+Cj4gPiBJIGFtIHJlYWxs
eSBzdHJ1Z2dsaW5nIHdpdGggd2hhdCB0byBkby4gRm9yIG9uZSBvZiB0aGUgYWZmZWN0ZWQKPiA+
IGRldmljZXMsIHRoZXkgY3JlYXRlZCB0d28gZGV2aWNlCj4gPiB0cmVlcywgb25lIGZvciBNaWNy
b24gYW5kIG9uZSBmb3IgYWxsIG90aGVycy4gV2hpY2ggb2J2aW91c2x5IGhhZCBubwo+ID4gZWZm
ZWN0IGR1ZSB0byB0aGUKPiA+IGhhcmRjb2RlZCBzZXR0aW5ncywgd2hpY2ggbGVkIG1lIHRvIFBh
dGNoIDIgYW5kIEkgdGhvdWdodCwgc28gYmUgaXQuCj4gPiBCdXQgdGhlIHByb2Nlc3MgdG8gZmln
dXJlCj4gPiBvdXQgaWYgb25lcyBkZXZpY2UgaGFzIE1pY3JvbiBDaGlwcyBpcyBlc3NlbnRpYWxs
eSBmbGFzaGluZyBhbiBpbWFnZQo+ID4gYW5kIGlmIGl0IGRvZXMgbm90IHdvcmssCj4gPiB1c2Ug
dGhlIHN0b2NrIE9FTSByZWNvdmVyeSBhbmQgdHJ5IHRoZSBvdGhlciBpbWFnZS4KPiA+IEhvd2V2
ZXIsIHNpbmNlIE1pY3JvbiBpcyB0aGUgb25seSBjaGlwIHRoYXQgaXMgdHJlYXRlZCBkaWZmZXJl
bnRseSwgSSB3b25kZXIKPiA+IGlmIHlvdXIgZmlyc3QgcHJvcG9zYWwsIGV2ZW4gdGhvdWdoIGl0
IGlzIGhhY2t5LCBpcyB0aGUgYmV0dGVyCj4gPiBhcHByb2FjaCB0byBzb2x2ZSB0aGUgaXNzdWUK
PiA+IGZvciB0aGUgTWljcm9uIGRldmljZXMgbm90IGJvb3RpbmcgYW5kIHRocm93aW5nIEVDQyBl
cnJvcnMuIFdoYXQgZG8geW91IHRoaW5rPwo+ID4gRm9sbG93IHVwIGZpcnN0IHBhdGNoIG9yIHRo
aXMgb25lPwo+Cj4gSSBhbSBub3Qgc3VyZSB3ZSB1bmRlcnN0b29kIGVhY2ggb3RoZXIsIHlvdXIg
cGF0Y2ggaXMgZmluZSwgYnV0IHlvdQo+IG5lZWQgdG8gZG8gc29tZXRoaW5nIGxpa2U6Cj4KPiBz
dGF0aWMgaW50IHh3YXlfYXR0YWNoX2NoaXAoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiB7Cj4g
ICAgIGlmIChjaGlwLT5lY2MuZW5naW5lX3R5cGUgPSBOQU5EX0VDQ19FTkdJTkVfVFlQRV9TT0ZU
ICYmCj4gICAgICAgICBjaGlwLT5lY2MuYWxnbyA9PSBOQU5EX0VDQ19BTEdPX1VOS05PV04pCj4g
ICAgICAgICAgY2hpcC0+ZWNjLmFsZ28gPSBOQU5EX0VDQ19BTEdPX0hBTU1JTkc7Cj4KPiBJbiB0
aGUgRFQgeW91IHNob3VsZCBub3QgZm9yY2UgYW55IEVDQyBlbmdpbmUgKGRyb3AgdGhlIG5hbmQt
ZWNjLXh4eAo+IHByb3BlcnRpZXMpIGFuZCBsZXQgdGhlIGNvcmUgaGFuZGxlIGl0LiBJdCB3aWxs
IHByb2JhYmx5IGNob29zZSB0aGUKPiBtb3N0IHN1aXRhYmxlIGVuZ2luZXMgZm9yIHlvdS4KPgo+
IFRoYW5rcywKPiBNaXF1w6hsCgp0aGFuayB5b3UgZm9yIHlvdXIgcmVzcG9uc2UuCklmIEkgcmVt
b3ZlIHRoZSBuYW5kLWVjYy14eHggcHJvcGVydGllcyBpbiB0aGUgZGV2aWNlIHRyZWUsIHRoZSBk
ZXZpY2Ugd2l0aAp0aGUgVG9zaGliYSBOQU5EIGNoaXAgaXMgd29ya2luZy4gSG93ZXZlciwgdGhl
IGRldmljZSB3aXRoIHRoZSBNaWNyb24KTkFORCBmYWlscyB3aXRoIE5PIEVDQyBmdW5jdGlvbnMg
c3VwcGxpZWQ7IGhhcmR3YXJlIEVDQyBub3QgcG9zc2libGUsCnNlZW1zIHRvIGJlIGF0IGxpbmUg
NTM2NyBvciBlcXVpdmFsZW50LgpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRl
c3Qvc291cmNlL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jI0w1MzY3CgpJdCBsb29r
cyBsaWtlIHRoZSBtaWNyb24gbmFuZCBkcml2ZXIgc3VwcG9ydHMgb24gZGllIG9ubHkgaWYgaXRz
CnNwZWNpZmllZCBpbnQgdGhlCkRldmljZSB0cmVlOgpodHRwczovL2VsaXhpci5ib290bGluLmNv
bS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWljcm9uLmMj
TDUxMQpUaGUgTWljcm9uIE5BTkQgZHJpdmVyIHByb2JhYmx5IG5lZWRzIHRvIHNldCB0aGUgRUND
IHR5cGUgdG8gT04gRElFIGlmIHRoZQp2YXJpYWJsZSBvbmRpZSBjb250YWlucyB0aGUgc3VwcG9y
dGVkIGF0dHJpYnV0ZT8hCgpBbnkgaWRlYXM/IFNlY29uZCBwYXRjaD8KClRoYW5rcywgRGFuaWVs
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
