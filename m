Return-Path: <SRS0=OVP+=NQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A62DC4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Aug 2021 14:08:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC00661042
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Aug 2021 14:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC00661042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rMr6GyCQ8t8ILkhNWcyUlnxRUdoUk/nxImd4kVXXYj0=; b=DlN6UwxKc/KP41
	gqXfnFURfz1iUgLJLyD+wZ6B8MaZAr0aLCLF12KDPaXfAIrxLtvtG5rz0Q6UWQK779vE82uNt5Dv+
	zTTqlJ2MPM5PzMHPaw7vgeYpwDsUotvDlepD8jZJC4hSh/EjJl/zthD9/t35HaZ/U4WjQacvEEFXv
	gAPn/rk2VEspzBQLQI70TSLJmp2JrEcne+CbHL1dnwedaYZJK/srh1ocW24dTYi6cfmzu3c6kpr18
	6nKp4FTkJpsVq6sym6o8PdJJiehmhMPM6Q06zVFpCXdwxky0HAJh3S7Mqxuc0dyPbiSkhm0Rd7mNf
	Hoy9IuNtzFgCMhZAzMhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mItYp-007DVl-Fk; Wed, 25 Aug 2021 14:07:23 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mItYj-007DUq-UL
 for linux-mtd@lists.infradead.org; Wed, 25 Aug 2021 14:07:21 +0000
Received: by mail-qk1-x729.google.com with SMTP id 22so27214541qkg.2
 for <linux-mtd@lists.infradead.org>; Wed, 25 Aug 2021 07:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VQMLTVikzSuk1GWqoYKb9CQEhIEBrcrpp56ck4PkS3c=;
 b=ZA4HCaRMncysEcfJQD3bXKZ54crDRH4ogCec2N2BXl0QFL7VmEDnTUl6m+bx7zthnZ
 vSdeJrElfQtt4X0U/fzV1c9/3yh6DP/J1UCwSQ2iPLLOkLMle8ARpn0TSXhUqJVeT6S3
 mzNukF8bbANu4k1QD98P9+MppKEArtsXMzqiGi9UsR4Mpy/2mfRCeTkFyz3eoyPPOk0l
 WzofgZ+47mUeqVrzh/RB8xmCJAJd8xGL+/76F1Cgslc80NE7FkyF3wycO3wXKkXcrxY5
 5LVRCzQCGKQ37fAyrqBkU77HFgJSK5f1GtUMTLk1Y6bnjzLOA7V30ry39mrcOE2mEIq2
 iQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VQMLTVikzSuk1GWqoYKb9CQEhIEBrcrpp56ck4PkS3c=;
 b=H5EWDLc00edO6QZM7a2Dv9Kq3+4fudMsQCBvzNYhWbHHK3ES3eAJ4fMQds5gb1Xrlm
 WAXJRYaMqwkgQHXEllbdddrG055u32R3QYR/jn4DDwMObpv4djOS7kD7wygn9L/PxWrs
 ftQdC2scHVIrS9GiEPh5Q4pgosafWK9o6jDYKvYh7n/ZXOnxiO0E2gMF1K2YLFAG/JGe
 uOM1iNZDqYsR7pscWbak49TQK7KxNr3Zn8H3amoRAWersgV3xLXqVRQt0fWPpstsefL3
 eBlADQOju3DNnEkYjFosDOg5x8p4D6wlJMDXR/4/CI+vhmn/+1fnKCEgx9vWP2APsdW+
 C5eA==
X-Gm-Message-State: AOAM532bEJlsFdOusQ5dLHg1eqGDYVvn6UcThSxNzKtcFpmU3ngW5izm
 NBIM4d/rEb9fEm483/20vIBbOv/fqph5bZ/QWW8=
X-Google-Smtp-Source: ABdhPJwaN2pLLTePCmVXfcyEDS+qal4eL3U42VcQIOeYiM+/+mb5AJ60+dQGirb8+woEc0eiFM8C1abBMQla2WrtFb0=
X-Received: by 2002:ae9:e915:: with SMTP id x21mr31917263qkf.183.1629900436612; 
 Wed, 25 Aug 2021 07:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210808072643.GA5084@ubuntu> <20210816093126.442f74a1@xps13>
 <CAE9cyGQ+Bb3rQxiF4My9zXwg_+QYifaCckE=C6spAtN9_4dBFQ@mail.gmail.com>
 <20210819100334.6af2d86e@xps13>
 <CAE9cyGSF2vTCptSZd3uMFaZPD=as=PwZY14S+zDhzjWCmsfmpQ@mail.gmail.com>
 <20210823172413.0bc4ab3a@xps13>
 <CAE9cyGTKFcMuxePo2SgxkBe_cWvP5nZ_SDcnuUtwaE5o9oVq3g@mail.gmail.com>
 <20210824192203.076df55e@xps13>
 <CAE9cyGQ9_--=+MGc4_vTV1BkR6jv2RZcixyfLtCozXo349+6KA@mail.gmail.com>
 <20210825105126.4c1c15cb@xps13>
In-Reply-To: <20210825105126.4c1c15cb@xps13>
From: Kestrel seventyfour <kestrelseventyfour@gmail.com>
Date: Wed, 25 Aug 2021 16:07:05 +0200
Message-ID: <CAE9cyGRuoaiTu40Yu0po3dykk1fTq_VkqwNfrQkJq8DR6FPRpw@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: xway: No hardcoded ECC engine, use
 device tree setting
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_070718_027138_4BFEBC5A 
X-CRM114-Status: GOOD (  44.63  )
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

SGkgTWlxdcOobCwKCkFtIE1pLiwgMjUuIEF1Zy4gMjAyMSB1bSAxMDo1MSBVaHIgc2NocmllYiBN
aXF1ZWwgUmF5bmFsCjxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPjoKPgo+Cj4gS2VzdHJlbCBz
ZXZlbnR5Zm91ciA8a2VzdHJlbHNldmVudHlmb3VyQGdtYWlsLmNvbT4gd3JvdGUgb24gV2VkLCAy
NSBBdWcKPiAyMDIxIDEwOjQ3OjQwICswMjAwOgo+Cj4gPiBIaSBNaXF1w6hsLAo+ID4KPiA+IEFt
IERpLiwgMjQuIEF1Zy4gMjAyMSB1bSAxOToyMiBVaHIgc2NocmllYiBNaXF1ZWwgUmF5bmFsCj4g
PiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT46Cj4gPiA+Cj4gPiA+IEhlbGxvLAo+ID4gPgo+
ID4gPiBLZXN0cmVsIHNldmVudHlmb3VyIDxrZXN0cmVsc2V2ZW50eWZvdXJAZ21haWwuY29tPiB3
cm90ZSBvbiBUdWUsIDI0IEF1Zwo+ID4gPiAyMDIxIDA5OjE1OjQ5ICswMjAwOgo+ID4gPgo+ID4g
PiA+IEhpIE1pcXXDqGwsCj4gPiA+ID4KPiA+ID4gPiBBbSBNby4sIDIzLiBBdWcuIDIwMjEgdW0g
MTc6MjQgVWhyIHNjaHJpZWIgTWlxdWVsIFJheW5hbAo+ID4gPiA+IDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPjoKPiA+ID4gPiA+Cj4gPiA+ID4gPiBIaSBLZXN0cmVsLAo+ID4gPiA+ID4KPiA+
ID4gPiA+IEtlc3RyZWwgc2V2ZW50eWZvdXIgPGtlc3RyZWxzZXZlbnR5Zm91ckBnbWFpbC5jb20+
IHdyb3RlIG9uIE1vbiwgMjMgQXVnCj4gPiA+ID4gPiAyMDIxIDEzOjE5OjQzICswMjAwOgo+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gSGkgTWlxdcOobCwKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gQW0g
RG8uLCAxOS4gQXVnLiAyMDIxIHVtIDEwOjAzIFVociBzY2hyaWViIE1pcXVlbCBSYXluYWwKPiA+
ID4gPiA+ID4gPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Ogo+ID4gPiA+IC4uLgo+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiB0aGFuayB5b3UgZm9yIHlvdXIgcmVzcG9uc2UuCj4gPiA+ID4gPiA+
IElmIEkgcmVtb3ZlIHRoZSBuYW5kLWVjYy14eHggcHJvcGVydGllcyBpbiB0aGUgZGV2aWNlIHRy
ZWUsIHRoZSBkZXZpY2Ugd2l0aAo+ID4gPiA+ID4gPiB0aGUgVG9zaGliYSBOQU5EIGNoaXAgaXMg
d29ya2luZy4gSG93ZXZlciwgdGhlIGRldmljZSB3aXRoIHRoZSBNaWNyb24KPiA+ID4gPiA+ID4g
TkFORCBmYWlscyB3aXRoIE5PIEVDQyBmdW5jdGlvbnMgc3VwcGxpZWQ7IGhhcmR3YXJlIEVDQyBu
b3QgcG9zc2libGUsCj4gPiA+ID4gPiA+IHNlZW1zIHRvIGJlIGF0IGxpbmUgNTM2NyBvciBlcXVp
dmFsZW50Lgo+ID4gPiA+ID4gPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRl
c3Qvc291cmNlL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jI0w1MzY3Cj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IEl0IGxvb2tzIGxpa2UgdGhlIG1pY3JvbiBuYW5kIGRyaXZlciBzdXBw
b3J0cyBvbiBkaWUgb25seSBpZiBpdHMKPiA+ID4gPiA+ID4gc3BlY2lmaWVkIGludCB0aGUKPiA+
ID4gPiA+ID4gRGV2aWNlIHRyZWU6Cj4gPiA+ID4gPiA+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4u
Y29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9taWNyb24u
YyNMNTExCj4gPiA+ID4gPiA+IFRoZSBNaWNyb24gTkFORCBkcml2ZXIgcHJvYmFibHkgbmVlZHMg
dG8gc2V0IHRoZSBFQ0MgdHlwZSB0byBPTiBESUUgaWYgdGhlCj4gPiA+ID4gPiA+IHZhcmlhYmxl
IG9uZGllIGNvbnRhaW5zIHRoZSBzdXBwb3J0ZWQgYXR0cmlidXRlPyEKPiA+ID4gPiA+Cj4gPiA+
ID4gPiBZb3UncmUgcmlnaHQgYnV0IEkgZG9uJ3Qgc2VlIGFueSBlYXN5IHVwc3RyZWFtLWFibGUg
c29sdXRpb24gaGVyZS4KPiA+ID4gPiA+IENoYW5naW5nIHRoZSBiZWhhdmlvciBpbiB0aGUgWHdh
eSBkcml2ZXIgd291bGQgY2VydGFpbmx5IGJyZWFrIHVzZXJzLAo+ID4gPiA+ID4gY2hhbmdpbmcg
dGhlIGJlaGF2aW9yIGluIHRoZSBNaWNyb24gZHJpdmVyIHdvdWxkIGNlcnRhaW5seSBicmVhayBl
dmVuCj4gPiA+ID4gPiBtb3JlIHVzZXJzLiBUaGUgcm9vdCBjYXVzZSBiZWluZyBhbiBhYnNlbmNl
IG9mIHByb3BlciBkZXNjcmlwdGlvbiAodGhlCj4gPiA+ID4gPiBpbnRlZ3JhdGlvbiBjaGFuZ2Vk
KS4gSG9uZXN0bHkgSSBmZWVsIHN0dWNrLCBtYXliZSB5b3UgY2FuIHRyeSB0bwo+ID4gPiA+ID4g
cmVnaXN0ZXIgeW91ciBkZXZpY2UsIGlmIGl0IGZhaWxzLCBjaGFuZ2UgdGhlIGludGVncmF0aW9u
IGluIHRoZSBkcml2ZXIKPiA+ID4gPiA+ICh0byBhbiBvbmRpZSBlY2MgZW5naW5lKSB0aGVuIHJl
dHJ5Pwo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoYW5rcywKPiA+ID4gPiA+IE1pcXXDqGwKPiA+ID4g
Pgo+ID4gPiA+IERvIHlvdSB0aGluayBhZGRpbmcgc29tZXRoaW5nIGxpa2UgYmVsb3cgYXQgdGhl
IGZvbGxvd2luZyBsb2NhdGlvbgo+ID4gPiA+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xp
bnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9tdGQvbmFuZC9yYXcveHdheV9uYW5kLmMjTDIyMwo+
ID4gPiA+IHdvdWxkIGJlIHVwc3RyZWFtYWJsZSAod2l0aCBvciB3aXRob3V0IGRldmljZSB0cmVl
IHByb3BlcnR5Pyk/Cj4gPiA+ID4KPiA+ID4gPiAgICAgICAgIGVyciA9IG5hbmRfc2NhbigmZGF0
YS0+Y2hpcCwgMSk7Cj4gPiA+ID4gICAgICAgICBpZiAoZXJyIC8qICYmIG9mX3Byb3BlcnR5X3Jl
YWRfYm9vbChucCwgImxhbnRpcSxyZXRyeS1vbi1kaWUiKSAqLykgewo+ID4gPiA+ICAgICAgICAg
ICAgICAgICBkYXRhLT5jaGlwLmVjYy5lbmdpbmVfdHlwZSA9IE5BTkRfRUNDX0VOR0lORV9UWVBF
X09OX0RJRTsKPiA+ID4gPiAgICAgICAgICAgICAgICAgZXJyID0gbmFuZF9zY2FuKCZkYXRhLT5j
aGlwLCAxKTsKPiA+ID4gPiAgICAgICAgICAgICAgICAgaWYgKGVycikgcmV0dXJuIGVycjsKPiA+
ID4gPiAgICAgICAgIH0KPiA+ID4gPgo+ID4gPiA+IEl0IHN0aWxsIHRocm93cyB0aGUga2VybmVs
IHdhcm5pbmcgb24gZmlyc3QgdHJ5LCBidXQgdGhlIHNlY29uZCB0cnkgdGhlbiB3b3Jrcy4KPiA+
ID4KPiA+ID4gQ2FuIHlvdSBwbGVhc2UgcmVtaW5kIG1lIHdoYXQgaXMgeHdheS9sYW50aXEveW91
ciBzZXR1cC9ob3cgcHVibGljIGl0Cj4gPiA+IGlzL3dobydzIHVzaW5nIHRoaXMgZHJpdmVyPwo+
ID4gPgo+ID4gPiBUaGFua3MsCj4gPiA+IE1pcXXDqGwKPiA+Cj4gPiBJdHMgZm9yIE9wZW53cnQs
IEkgd291bGQgbGlrZSB0byBhZGQgc3VwcG9ydCBmb3IgMyBtb3JlIGRldmljZXMKPiA+IEFWTSBm
cml0emJveCAzNDkwLzU0OTAgYW5kIDc0OTAuIFRoZXkgYWxsIGhhdmUgdmFyeWluZyBOQU5EIGNo
aXBzLgo+ID4gSSBoYXZlIGluaXRpYWxseSBjcmVhdGVkIGEgUFIgdG8gaGF2ZSBteSBpbml0aWFs
IHBhdGNoIHRlc3RlZDoKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVud3J0L29wZW53cnQvcHVs
bC80NDI2Cj4gPiBUaGVyZSBpcyBhbHJlYWR5IG9uZSBkZXZpY2Ugc3VwcG9ydGVkIHdoaWNoIGhh
cyB0d28gRFRCcyBvbmUgZm9yCj4gPiBNaWNyb24gYW5kIG9uZSBmb3Igbm9uIE1pY3JvbiAoMzM3
MCksIGJ1dCBpdHMgbm90IHZlcnkgc3RyYWlnaHQgZm9yd2FyZC4KPiA+IFdpdGhvdXQgaGF2aW5n
IHRoaXMgaXNzdWUgc29sdmVkLCBmbGFzaGluZyB0aG9zZSBkZXZpY2VzIHdvdWxkIGJlCj4gPiBw
b3NzaWJseSBoYXZpbmcgaXNzdWVzIGRlcGVuZGluZyBvbiBOQU5EIGNoaXAgb3IgdGhlIGF3a3dh
cmQKPiA+IHdvcmthcm91bmQgb2YgZmxhc2hpbmcgb25lIGltYWdlIGFuZCBpZiBpdCBkb2VzIG5v
dCBib290LCBib290IHRoZQo+ID4gb3RoZXIgb25lLiBXaXRob3V0IHNlbGYgc29sZGVyZWQgc2Vy
aWFsIGNvbnNvbGUsIGl0IHdvdWxkIG5vdCB2ZXJ5Cj4gPiBlYXN5IHRvIGZpZ3VyZSBvdXQgdGhl
IE5BTkQgbWFudWZhY3R1cmVyLgo+ID4gVGhlIEFWTSBzdG9jayBmaXJtd2FyZSBpcyBvbGQga2Vy
bmVsIGFuZCBkb2VzIG5vdCB1c2UgZGV2aWNlCj4gPiB0cmVlIGZvciBOQU5ELCB0aGV5IGp1c3Qg
cXVlcnkgYWxsIHBvc3NpYmxlIG1hbnVmYWN0dXJlcnMgYW5kIHNldAo+ID4gdXAgTkFORCBiYXNl
ZCBvbiBtYW51ZmFjdHVyZXIgcXVlcnkuCj4KPiBCdXQgaW4gdGhpcyBjYXNlIGNhbid0IHlvdSBj
aGVjayB0aGUgJ3Jvb3QnIGNvbXBhdGlibGUgYWdhaW5zdCBjZXJ0YWluCj4gdmFsdWVzIGFuZCBh
bmQgc29tZSBraW5kIG9mIHF1aXJrIGluIHRoZSAtPmF0dGFjaCgpIGhvb2sgdG8gdXBkYXRlIHRo
ZQo+IEVDQyBlbmdpbmUgdG8gdGhlIHJpZ2h0IG9uZT8KPgo+IFRoYW5rcywKPiBNaXF1w6hsCgpt
YXliZSBJIHdyb3RlIHRoZSB3cm9uZyB0aGluZywgYnV0IHdoYXQgZG8geW91IG1lYW4gd2l0aCBy
b290IGNvbXBhdGlibGUuClRoZSBjb250cm9sbGVyIGlzIGFsd2F5cyBOQU5EIHh3YXkgYW5kIEkg
dGhpbmsgdGhlcmUgYXJlIDQgZGlmZmVyZW50Ck5BTkQgY2hpcCB0eXBlcy4gQnV0IHRoZSBzdG9j
ayBmaXJtd2FyZSBqdXN0IHF1ZXJpZXMgdGhlIE5BTkQKbWFudWZhY3R1cmVyIG5hbWUsIG5vdCBh
IGRhdGUgb3IgdHlwZS9tb2RlbCBvZiB0aGUgZGV2aWNlcy4gRS5nLiA3NDkwIGNhbgpoYXZlIE1p
Y3JvbiBvciBNYWNyb25peCBOQU5ELCBidXQgcXVlcnlpbmcgdGhlIE1pY3JvbiBpZCBvciBNYWNy
b25peAppZCByZXF1aXJlcyBhIGNoYW5nZSB0byB0aGUgeHdheSBkcml2ZXI/CkRvIHlvdSBtZWFu
IHNvbWV0aGluZyBsaWtlIGluIHRoZSBmaXJzdCBwYXRjaCBkbyBxdWVyeSB0aGUgbWFudWZhY3R1
cmVyCmJ1dCBqdXN0IGZvciBhbGwgdGhlIDQ/CgpUaGFua3MsIERhbmllbC4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
