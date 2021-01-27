Return-Path: <SRS0=ZJz0=G6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760B8C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 19:44:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F49664D9E
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 19:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F49664D9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JZexrkIPViyJnKJJVw6ChfUJabBtP68VeDjAMZSUVmY=; b=fvhOK3I7YedATrPyjyJaMLuWx
	Ced0a3DwHThpTJMCdwy4PjmHuC383eu8HHHXAUSdqhNU8oWpDa8yCo0D2Gh7jA9+xleOI4wRqzzE7
	0cLGh+Fwz0QdfAgmDsY4Eh+fANOqjO9l2KLPuCW7B/rL41eqax/mVYAy9+JT3y8y+EaPEKqXe9CoM
	h19ChBO/ztnigFLgXNzpZ9OXcHwzwb5fex60K5s1vSiuTQBZqqsX9nFKVXEy9SwOW+IfFf5w9tTy0
	r4SPW7KNKXAUFPVa0C46exf7TKru1KRF1ZEOgQuaOxuQA18dktkJnZBPAHTwhznwIZ22z0/2f3isI
	3xFtA3fMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4qix-0003h8-J1; Wed, 27 Jan 2021 19:43:31 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4qiu-0003gZ-Rn
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2021 19:43:29 +0000
Received: by mail-wr1-x42f.google.com with SMTP id g10so3165049wrx.1
 for <linux-mtd@lists.infradead.org>; Wed, 27 Jan 2021 11:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5Bm6Dkim/Mc65C53TB5B2rmHx0wiqkyYdKY0Hj/Ja7I=;
 b=jvHWtuzmwR/LzgSBbsv+1xiO3HNSOlTITCOMkJvqj97lNh3hUiuKzz5jpFSnVVxaDo
 IBwDKOLFFBQGMnyeTp0I0E2YvqEICSMBcpLqMbRUjV1qQM5xbdiDiWBZRgOIQxORVY+w
 ynkKBTt4xa4xK+lx6i7ocBgSQxYaN8sgfhh24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5Bm6Dkim/Mc65C53TB5B2rmHx0wiqkyYdKY0Hj/Ja7I=;
 b=s5w1s3jIvMJz0XFRC230wBM/VE/S4smlVT6kaHN0HjNH6jgtfItaMj/M3U59HDh+V4
 RmWlwyhwau3l9W6PZSDx4fR3Mbrigsnb8GpKuywbX92c73/sz+N79V9m+QeKUPeCVNOP
 3e7x7/c3PSM1chgHJrVBWnDp1RyZ4K35+Wdj9+a3ObJoBiTo/14EpqtGiqSvj0k/3G5e
 bbYeZnnZ8jdmN8wEktyAUAZg+iYzUvm7+eu2AaOns958MOm/r+o2BxDoHmQ4t/ltlFN3
 KVcD0xZ3mr+YyorEyy/EXRxwv/BMZUZaCfBp8IB/q90KC/yVGdbgWYXsQDXzEHDJahmv
 Ie2w==
X-Gm-Message-State: AOAM533JhUEfh48xZAllkSsdKYatWZeViDJmRC65CncdKAAGDKNCZMKp
 VzsHBrFPkJmBGZqmGQBV8WZhX+INXb7wcwfY6Q5+Tw==
X-Google-Smtp-Source: ABdhPJwZYHO97aHoJpbr5gO+bcCSK1GbXiuToVA7M9VXnk6+4hMjpXWiTUDpwtl0Cm78jUUg3mgP+/XTgaSqWaawiPs=
X-Received: by 2002:a05:6000:1043:: with SMTP id
 c3mr12858360wrx.140.1611776607031; 
 Wed, 27 Jan 2021 11:43:27 -0800 (PST)
MIME-Version: 1.0
References: <CAOf5uwku9Nx5-5h77yCtYwNxKHfZSfD+Dk3Fe41Ry45Lf+MdNw@mail.gmail.com>
 <CAOf5uwmZkjF1Xp8vekBYnuBZZJhYk+n+=K7QW_8MAJJ6gw5xWw@mail.gmail.com>
 <CAOf5uwnPnh3ZP932BGJkb_u10-WHwmq5srKaLdKbcFqs4A6mXg@mail.gmail.com>
 <20181029104057.30428a2a@xps13>
 <CAOf5uwmETDH2wz9vGfmETi=as4VtidOPT34-C8ndJiP_sooAZw@mail.gmail.com>
 <20181029105312.1a62628c@xps13>
 <CAOf5uwnSyRF7zTjbsNbJAWu+iabMofthx+gTOL+4wVOPDURJRw@mail.gmail.com>
 <20210127201225.68209646@xps13>
In-Reply-To: <20210127201225.68209646@xps13>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 27 Jan 2021 20:43:15 +0100
Message-ID: <CAOf5uwmbfwghXe25FxX+6Z6fu9KKkMrZi58c1vR79Pjmr0fTfA@mail.gmail.com>
Subject: Re: FIX Re: GPMI IMX6ull timeout on dma
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_144328_999757_CB521BE4 
X-CRM114-Status: GOOD (  28.16  )
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

SGkKCk9uIFdlZCwgSmFuIDI3LCAyMDIxIGF0IDg6MTIgUE0gTWlxdWVsIFJheW5hbCA8bWlxdWVs
LnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIaSBNaWNoYWVsLAo+Cj4gTWljaGFlbCBO
YXp6YXJlbm8gVHJpbWFyY2hpIDxtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZSBv
bgo+IFdlZCwgMjcgSmFuIDIwMjEgMTg6MDE6MDEgKzAxMDA6Cj4KPiA+IEhpIGFsbAo+ID4KPiA+
IE9uIE1vbiwgT2N0IDI5LCAyMDE4IGF0IDEwOjUzIEFNIE1pcXVlbCBSYXluYWwKPiA+IDxtaXF1
ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgTWljaGFlbCwKPiA+
ID4KPiA+ID4gTWljaGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hpIDxtaWNoYWVsQGFtYXJ1bGFzb2x1
dGlvbnMuY29tPiB3cm90ZSBvbgo+ID4gPiBNb24sIDI5IE9jdCAyMDE4IDEwOjQzOjA1ICswMTAw
Ogo+ID4gPgo+ID4gPiA+IEhpCj4gPiA+ID4KPiA+ID4gPiBPbiBNb24sIE9jdCAyOSwgMjAxOCBh
dCAxMDo0MSBBTSBNaXF1ZWwgUmF5bmFsCj4gPiA+ID4gPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IEhpIE1pY2hhZWwsCj4gPiA+ID4gPgo+ID4g
PiA+ID4gTWljaGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hpIDxtaWNoYWVsQGFtYXJ1bGFzb2x1dGlv
bnMuY29tPiB3cm90ZSBvbgo+ID4gPiA+ID4gRnJpLCA1IE9jdCAyMDE4IDEyOjMyOjE4ICswMjAw
Ogo+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSGkgQm9yaXMKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
SSBoYXZlIHJldmVydGVkIGZvciBub3cKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gUmV2ZXJ0ICJt
dGQ6IHJhd25hbmQ6IGdwbWk6IHN1cHBvcnQgLT5zZXR1cF9kYXRhX2ludGVyZmFjZSgpIgo+ID4g
PiA+ID4gPiBUaGlzIHJldmVydHMgY29tbWl0IDc2ZTFhMDA4NmEwYzMyNzZiMzg0Zjc3OTA1MzQ1
ZTBmY2M4ODZmZGQuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFJldmVydCAibXRkOiByYXduYW5k
OiBncG1pOiB1c2UgY29yZSB0aW1pbmdzIGluc3RlYWQgb2YgYW4gZW1waXJpY2FsCj4gPiA+ID4g
PiA+IGRlcml2YXRpb24iCj4gPiA+ID4gPiA+IFRoaXMgcmV2ZXJ0cyBjb21taXQgYjEyMDYxMjIw
NjlhYWRhYmUxYThjNTA3ODkyNzdhOTc4YWFhNGRmNy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBTb3Jy
eSBmb3IgdGhlIGRlbGF5LCBJJ3ZlIGJlZW4gdmVyeSBidXN5IGxhdGVseS4KPiA+ID4gPiA+Cj4g
PiA+ID4gPiBQbGVhc2UgYWxzbyBDYzogbWUgaW4geW91ciBlLW1haWxzIHRvIHRoZSBNVEQgTUwu
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gQUZBSVIgSSdtIHRoZSBhdXRob3Igb2YgdGhlc2UgcGF0Y2hl
cyBzbyBJIHdvdWxkIGxpa2UgdG8gdW5kZXJzdGFuZCBhbmQKPiA+ID4gPiA+IGZpeCB3aGF0J3Mg
d3JvbmcgdGhlcmUuIEFzIGEgc3RhcnQsIGNhbiB5b3UgZGlzY3JpbWluYXRlIHdoaWNoIHBhdGNo
Cj4gPiA+ID4gPiBhY3R1YWxseSBtYWtlcyB0aGUgdGltaW5ncyBpbmNvbnNpc3RlbnQ/IEFyZSB5
b3UgcmVhZHkgdG8gZG8gbW9yZQo+ID4gPiA+ID4gdGVzdGluZyB0byBmaW5kIHdoYXQncyB3cm9u
Zz8KPiA+ID4gPgo+ID4gPiA+IFllcyBpdCdzIG9uIG15IHBsYW4uIE5vdyBmb3IgZmllbGQgSSBu
ZWVkIHRvIHJldmVydCB0aGVtIGJ1dCBJIGhhdmUKPiA+ID4gPiB0aGVtIGluIHJvYWRtYXAuCj4g
PiA+ID4gV2UgYXJlIHRlc3Rpbmcgbm93IGFuIGlteDZkbC4gSXQgY2FuIGJlIGEgY29tYmluYXRp
b24gd2l0aCB0aGUgbWljcm9uCj4gPiA+ID4gcGFydCBudW1iZXIgdG9vLgo+ID4gPgo+ID4gPiBT
dXJlLCBsZXQgdXMga25vdyBhYm91dCB5b3VyIGRpc2NvdmVyaWVzLCBJIHJlYWxseSB3YW50IHRo
ZSBHUE1JIGRyaXZlcgo+ID4gPiB0byB1c2UgY29yZSB0aW1pbmdzIGFuZCAtPnNldHVwX2RhdGFf
aW50ZXJmYWNlKCkgc28gaWYgdGhlcmUgaXMKPiA+ID4gc29tZXRoaW5nIHdyb25nIHRoZXJlIGl0
IHNob3VsZCBiZSBmaXhlZC4KPiA+ID4KPiA+Cj4gPiBOZWVkIHRvIG1vdmUgb24gbHRzIGtlcm5l
bCBhbmQgIEkgaGF2ZSB0aW1lIHRvIHdvcmsgYW5kIEkgbXVzdCB3b3JrIG9uCj4gPiB0aGlzIHRv
cGljLiBJIGRvbid0IHNlZSBhbnkgdXBkYXRlIGJ1dAo+ID4gYW5vdGhlciByZXBvcnQuIElzIHRo
aXMgc3VwcG9zZWQgdG8gYmUgZml4ZWQ/Cj4KPiBOb3QgYXQgYWxsLCB0aGlzIGhhc24ndCBtb3Zl
ZCBmb3J3YXJkLgo+CgpUcnkgdG8gcmVwcm9kdWNlIG9uIGEgNC4xOS55IHZlcnNpb24gc3RhYmxl
IGJyYW5jaC4KVGhlcmUgd2FzIHNvbWUgZGlmZmVyZW5jZSBvbiByZWdpc3RlciB2YWx1ZXMgSSBo
YXZlIHNlZW4gbGFzdCB0aW1lLCBkaWQgeW91CmdldCB0aW1lIHRvIGNoZWNrIHRoZW0/CgpNaWNo
YWVsCgo+IFRoYW5rcywKPiBNaXF1w6hsCgoKCi0tIApNaWNoYWVsIE5henphcmVubyBUcmltYXJj
aGkKQW1hcnVsYSBTb2x1dGlvbnMgQlYKQ09PIENvLUZvdW5kZXIKQ3J1cXVpdXNrYWRlIDQ3IEFt
c3RlcmRhbSAxMDE4IEFNIE5MClQuICszMSgwKTg1MTExOTE3MgpNLiArMzkoMCkzNDc5MTMyMTcw
CltgYXNdIGh0dHBzOi8vd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
