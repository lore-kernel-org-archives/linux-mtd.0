Return-Path: <SRS0=ZJz0=G6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2F3C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 17:02:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDD7664DA1
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 17:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDD7664DA1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZYbL5ncQL0KIO61qTMLr+zJ4ecFSCksh3hhef5/TMaI=; b=f4Xkl5XleeN/GzNbpQvuzMeHb
	QClGPOtxv1eV7ZzIa3qhXOQHwT2+J2XDQkUwiy/fxn8f/ZrklGLAATRWrjRy+W6PWWgxuZdmgtXnE
	B5Fc4120dGJ0od/kbjuREqGXzw+EE/eAgrb6B0KiU2rGspJ73Rhv4vV4tJz47Vl78nrROXBg+r4gT
	uPftdoEu0ECK7mR9/h6W9eM+EG7kLHa6PaQ7VdvqdnU9XFii33okRULT4f7IN1jjQqEJw63OlscPg
	yqKD1HeYg5PPHSZByxlT38w/lD4Xo+4KSzyY6Eki0bkLxqqrHKYOTCx3MC9Q+R71aCeMD1RvszJIs
	Hzd9ja57A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4oC2-0000Uw-E1; Wed, 27 Jan 2021 17:01:22 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4oBz-0000Ry-9G
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2021 17:01:20 +0000
Received: by mail-wm1-x32f.google.com with SMTP id u14so2120016wml.4
 for <linux-mtd@lists.infradead.org>; Wed, 27 Jan 2021 09:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6PRTSnJ7WGSU/R2buHZDvGNfH1X1lDgsbuGF74Ef7dI=;
 b=p2ncqfsl4olc5RZ3UKsAm5UmAkibbWABj4+zEgRMoaGXHEPAt1nTHjSEVGcRIlHsNT
 dox3P+NwJfJeggBY3VDCLpWnDN7HDXdhTcf1i0Mfn6fhdJ6WV/OqNfQKZPUJ6w4GsP7F
 EMN+Pf7FclACBVbZixCuat5HhVyFIWQeeiEjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6PRTSnJ7WGSU/R2buHZDvGNfH1X1lDgsbuGF74Ef7dI=;
 b=HLrRTZV0Li8oe5xBxy0ij3Ai0b7rD7CTImNjGrRGWNH5mVj4kBPE3tkvEWmkci5GSq
 i4ptE3wp/r+ah+Lc2JYvncEx28/v55H3R4x7HMtVL8UQ3H7nfF6pwermMwwpCcUVOId/
 hLxNgO+2qGImE8j9wvfkVyttpsXtE8bB39K6ooAxLR1rxap4NX2hEhKBSPsdOYQ+lcAr
 LwSNZ2KrKwEqF9lHboS1Ogq5MZH+oMLhqiv8kcmf20kI5y/5lycsgmVg+Az0Cjzuouex
 aT03ug3F+8H1KUliGjRQea2kIubyNco3b+NP44po6/uahskfsppNMWtkVqNtwE0i9jAC
 BlUw==
X-Gm-Message-State: AOAM531NdtQ+GSfnGWPgk9ywTX2jHKWRwTJadM0ea+OaMhMT46SgLpHX
 Tf2BjwylAf6knjQpsxkzMRQJir89Wr+7jvZdmI//0PRhHgA=
X-Google-Smtp-Source: ABdhPJz82HVUzuxO9Ug2zn+Wmcz7GEBBZ8bMyEULE2Lh/tp6Tw0Sjq/Uk5THDRkr6fFybXAIEft5h4D9a1fDO2tx8p8=
X-Received: by 2002:a1c:545d:: with SMTP id p29mr5076540wmi.2.1611766873859;
 Wed, 27 Jan 2021 09:01:13 -0800 (PST)
MIME-Version: 1.0
References: <CAOf5uwku9Nx5-5h77yCtYwNxKHfZSfD+Dk3Fe41Ry45Lf+MdNw@mail.gmail.com>
 <CAOf5uwmZkjF1Xp8vekBYnuBZZJhYk+n+=K7QW_8MAJJ6gw5xWw@mail.gmail.com>
 <CAOf5uwnPnh3ZP932BGJkb_u10-WHwmq5srKaLdKbcFqs4A6mXg@mail.gmail.com>
 <20181029104057.30428a2a@xps13>
 <CAOf5uwmETDH2wz9vGfmETi=as4VtidOPT34-C8ndJiP_sooAZw@mail.gmail.com>
 <20181029105312.1a62628c@xps13>
In-Reply-To: <20181029105312.1a62628c@xps13>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 27 Jan 2021 18:01:01 +0100
Message-ID: <CAOf5uwnSyRF7zTjbsNbJAWu+iabMofthx+gTOL+4wVOPDURJRw@mail.gmail.com>
Subject: Re: FIX Re: GPMI IMX6ull timeout on dma
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_120119_553332_7C74959A 
X-CRM114-Status: GOOD (  23.06  )
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
Cc: Han Xu <han.xu@nxp.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgYWxsCgpPbiBNb24sIE9jdCAyOSwgMjAxOCBhdCAxMDo1MyBBTSBNaXF1ZWwgUmF5bmFsCjxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIE1pY2hhZWwsCj4KPiBNaWNo
YWVsIE5henphcmVubyBUcmltYXJjaGkgPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+IHdy
b3RlIG9uCj4gTW9uLCAyOSBPY3QgMjAxOCAxMDo0MzowNSArMDEwMDoKPgo+ID4gSGkKPiA+Cj4g
PiBPbiBNb24sIE9jdCAyOSwgMjAxOCBhdCAxMDo0MSBBTSBNaXF1ZWwgUmF5bmFsCj4gPiA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEhpIE1pY2hhZWwsCj4g
PiA+Cj4gPiA+IE1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxhc29s
dXRpb25zLmNvbT4gd3JvdGUgb24KPiA+ID4gRnJpLCA1IE9jdCAyMDE4IDEyOjMyOjE4ICswMjAw
Ogo+ID4gPgo+ID4gPiA+IEhpIEJvcmlzCj4gPiA+ID4KPiA+ID4gPiBJIGhhdmUgcmV2ZXJ0ZWQg
Zm9yIG5vdwo+ID4gPiA+Cj4gPiA+ID4gUmV2ZXJ0ICJtdGQ6IHJhd25hbmQ6IGdwbWk6IHN1cHBv
cnQgLT5zZXR1cF9kYXRhX2ludGVyZmFjZSgpIgo+ID4gPiA+IFRoaXMgcmV2ZXJ0cyBjb21taXQg
NzZlMWEwMDg2YTBjMzI3NmIzODRmNzc5MDUzNDVlMGZjYzg4NmZkZC4KPiA+ID4gPgo+ID4gPiA+
IFJldmVydCAibXRkOiByYXduYW5kOiBncG1pOiB1c2UgY29yZSB0aW1pbmdzIGluc3RlYWQgb2Yg
YW4gZW1waXJpY2FsCj4gPiA+ID4gZGVyaXZhdGlvbiIKPiA+ID4gPiBUaGlzIHJldmVydHMgY29t
bWl0IGIxMjA2MTIyMDY5YWFkYWJlMWE4YzUwNzg5Mjc3YTk3OGFhYTRkZjcuCj4gPiA+Cj4gPiA+
IFNvcnJ5IGZvciB0aGUgZGVsYXksIEkndmUgYmVlbiB2ZXJ5IGJ1c3kgbGF0ZWx5Lgo+ID4gPgo+
ID4gPiBQbGVhc2UgYWxzbyBDYzogbWUgaW4geW91ciBlLW1haWxzIHRvIHRoZSBNVEQgTUwuCj4g
PiA+Cj4gPiA+IEFGQUlSIEknbSB0aGUgYXV0aG9yIG9mIHRoZXNlIHBhdGNoZXMgc28gSSB3b3Vs
ZCBsaWtlIHRvIHVuZGVyc3RhbmQgYW5kCj4gPiA+IGZpeCB3aGF0J3Mgd3JvbmcgdGhlcmUuIEFz
IGEgc3RhcnQsIGNhbiB5b3UgZGlzY3JpbWluYXRlIHdoaWNoIHBhdGNoCj4gPiA+IGFjdHVhbGx5
IG1ha2VzIHRoZSB0aW1pbmdzIGluY29uc2lzdGVudD8gQXJlIHlvdSByZWFkeSB0byBkbyBtb3Jl
Cj4gPiA+IHRlc3RpbmcgdG8gZmluZCB3aGF0J3Mgd3Jvbmc/Cj4gPgo+ID4gWWVzIGl0J3Mgb24g
bXkgcGxhbi4gTm93IGZvciBmaWVsZCBJIG5lZWQgdG8gcmV2ZXJ0IHRoZW0gYnV0IEkgaGF2ZQo+
ID4gdGhlbSBpbiByb2FkbWFwLgo+ID4gV2UgYXJlIHRlc3Rpbmcgbm93IGFuIGlteDZkbC4gSXQg
Y2FuIGJlIGEgY29tYmluYXRpb24gd2l0aCB0aGUgbWljcm9uCj4gPiBwYXJ0IG51bWJlciB0b28u
Cj4KPiBTdXJlLCBsZXQgdXMga25vdyBhYm91dCB5b3VyIGRpc2NvdmVyaWVzLCBJIHJlYWxseSB3
YW50IHRoZSBHUE1JIGRyaXZlcgo+IHRvIHVzZSBjb3JlIHRpbWluZ3MgYW5kIC0+c2V0dXBfZGF0
YV9pbnRlcmZhY2UoKSBzbyBpZiB0aGVyZSBpcwo+IHNvbWV0aGluZyB3cm9uZyB0aGVyZSBpdCBz
aG91bGQgYmUgZml4ZWQuCj4KCk5lZWQgdG8gbW92ZSBvbiBsdHMga2VybmVsIGFuZCAgSSBoYXZl
IHRpbWUgdG8gd29yayBhbmQgSSBtdXN0IHdvcmsgb24KdGhpcyB0b3BpYy4gSSBkb24ndCBzZWUg
YW55IHVwZGF0ZSBidXQKYW5vdGhlciByZXBvcnQuIElzIHRoaXMgc3VwcG9zZWQgdG8gYmUgZml4
ZWQ/CgpNaWNoYWVsCgo+IFRoYW5rcywKPiBNaXF1w6hsCgoKCi0tIApNaWNoYWVsIE5henphcmVu
byBUcmltYXJjaGkKQW1hcnVsYSBTb2x1dGlvbnMgQlYKQ09PIENvLUZvdW5kZXIKQ3J1cXVpdXNr
YWRlIDQ3IEFtc3RlcmRhbSAxMDE4IEFNIE5MClQuICszMSgwKTg1MTExOTE3MgpNLiArMzkoMCkz
NDc5MTMyMTcwCltgYXNdIGh0dHBzOi8vd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
