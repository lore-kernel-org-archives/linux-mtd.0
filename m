Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86166E82CAE
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Sep 2023 16:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iZ4bBMuGnq3ehtlzvXdV56a3i14Ecs6WrY+TZskSPgg=; b=bS5JS01i92iqiy
	PNc2v2KhhwkA3ABQ2X1PXTBXs43gTnJW0Yf62txvm3ZugznJVkvfVhEq38Fqrob4+enzUxJd0g54m
	WN46DxVDKP16SGSD0E2XFgEMbPuuj/7ApRotpM/GnzWrOOULQFXWoIIVeNky7pNR1JSbAwOwLPCGO
	0zxFv3s/etD/jxWKaksVEiQOQ27ZvEuNTm8DmzQ1hMkjunRPsrg/5yRqfbSdUyVf8+NoAV+g5cCbq
	JBr9tt3K95USZn0pQizgP0fqhWV6E9NFyFcAaU3Edu7n4z8JsBdamgidloNZJwN7NeuocfS9U337r
	XQgYISRMUbAj4iq4v3LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlXe7-001RcA-1K;
	Wed, 27 Sep 2023 16:44:19 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlXe3-001Rad-10
	for linux-mtd@lists.infradead.org;
	Wed, 27 Sep 2023 16:44:16 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-532c3b4b55eso13941694a12.0
        for <linux-mtd@lists.infradead.org>; Wed, 27 Sep 2023 09:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695833044; x=1696437844; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OcujhrU25HQKsgbtffe4PcFl3+JaEKqz22NSzbLOb4g=;
        b=Oyd6hktGtzmNhZfwfTXuwIve6ExkwcZAKxlMglbK856Pg0hLj1z8posgl/cY/RW5zv
         T1fe+g4VyJ3LI6mw2M4a7mii+k664doYW7fWATHggdyVm2ovq7juyCkbSOgmfUUTgYA+
         bRWquZzmZlK8yv4hLOLslkWTdIF3yr7zEQsaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695833044; x=1696437844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OcujhrU25HQKsgbtffe4PcFl3+JaEKqz22NSzbLOb4g=;
        b=k+LAqF8qqCDJXPm/862GYA59s/isk71jslt0rLQHLx4ybR9ZMB2jWuhDqfpd7Ldw+G
         kqYxVTAWuA+ZizXTspM/9x4A8dj2SCt743rau9jLal4Z3RTZGpNzAWOaYeg9NODDUpfy
         F8USxQyQT9nQPn5RBBxGnHLon/wSiizHiDJuIIeKmSOcqHx9rJ0th2hT6ADWysSGz7vP
         qZjE6Q6lgfgpqWcJ59th5Go0NbATIR6LEI5MBazPmAnoV5D9iD0N/zv+hnSOK827ZBb9
         mjX/Tu8WBretxl1cZfhkUSN7Xwq14WO1Rt8EUZv5ALzEaNXl8PUdGanE8ZXdY6DRyqDu
         eZig==
X-Gm-Message-State: AOJu0YxYoa+Y2MSJLzDkk/+V3bvkPAZAgKKoS9tgrtqSaK9pWukIrApq
	bW5STSllIt0NrNGUvg7s0/kU5aGAy7IOnV4qHBnGtA==
X-Google-Smtp-Source: AGHT+IGjSTTn0TUpQ1DCRB1+f6e4rbY/7N18XVnUUcFUhIo/5Tr3gMG3e0hk0zOQ7YAOaa3AfsMHDj5Vbcx4NnL4Z3k=
X-Received: by 2002:a50:ee0b:0:b0:52e:86b3:a4a6 with SMTP id
 g11-20020a50ee0b000000b0052e86b3a4a6mr2384623eds.29.1695833043736; Wed, 27
 Sep 2023 09:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230921124459.1.I91ddcfacf9b234af5cc3eabea4b62edb31153317@changeid>
 <CAL_Jsq+WuYDU+yY98opTHr1PT-J9mFYJQBjVMnk+FSWLDUO33w@mail.gmail.com>
 <CAPnjgZ1pfxaMG1n5yOBhiOhsNrRjck1K92U7Ga=+VTY_jjjrVg@mail.gmail.com>
 <20230922174649.GA3320366-robh@kernel.org> <CAPnjgZ3ojfAv=BHqOhM=-NnYqCm81Ny=PsGKiNphKTmw++fk9w@mail.gmail.com>
 <CAL_JsqJqvyP=c93DHDO8A5RXv7Lz_Z7eEHSbJQ=JCo+qPVhSfg@mail.gmail.com>
 <CAPnjgZ3BnD9aX3cNNPiGRKTOj+YeurHCLv6K0TRFhAtY21Qufw@mail.gmail.com>
 <20230925092122.0b615f25@xps-13> <CAPnjgZ0Z5J_33HuQF-5XgDFmZim0nHHzvZJOOZobWw_cOJd=9g@mail.gmail.com>
 <20230925164736.5efbf4c0@xps-13> <CAPnjgZ3YCQHJ-eXuX8rYx2Qb6QEL+XviFmXYTON6M-sGPWSBBg@mail.gmail.com>
 <20230925172447.43dcef88@xps-13> <CAPnjgZ20c9FsYVjSrQ9qbFy9Y67BqDP2zxMyATx===PFhO69Ew@mail.gmail.com>
 <CAL_JsqJfjHqtTB2qfLmNxmQtn1rZewNyNe+Knu_Z4UCdPoPhSQ@mail.gmail.com>
 <CAPnjgZ1npHPpwPmw2f4=E3U5=RH0m4R+W_MZ7+oXdmDF=EeUjg@mail.gmail.com>
 <20230926094815.5802e184@xps-13> <CAL_JsqL_8bhHkHOFL8a8=g1dYL4OY8hGuNDyc0Jz22rEuJzXtQ@mail.gmail.com>
In-Reply-To: <CAL_JsqL_8bhHkHOFL8a8=g1dYL4OY8hGuNDyc0Jz22rEuJzXtQ@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 27 Sep 2023 10:43:45 -0600
Message-ID: <CAPnjgZ3TJLaRzv_cXyLdpRBtc2-FBYQ=gk-_MhEDH47HvO71FQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: Add a schema for binman
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org, 
	U-Boot Mailing List <u-boot@lists.denx.de>, linux-mtd@lists.infradead.org, 
	Tom Rini <trini@konsulko.com>, Conor Dooley <conor+dt@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_094415_346762_E77AADC9 
X-CRM114-Status: GOOD (  57.20  )
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

SGkgUm9iLAoKT24gVHVlLCAyNiBTZXB0IDIwMjMgYXQgMTE6MjksIFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBTZXAgMjYsIDIwMjMgYXQgMjo0OOKAr0FN
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4KPiA+
IEhlbGxvLAo+ID4KPiA+ID4gPiA+ID4gPiBUaGVzZSBhcmUgZmlybXdhcmUgYmluZGluZ3MsIGFz
IGluZGljYXRlZCwgYnV0IEkKPiA+ID4gPiA+ID4gPiB0b29rIHRoZW0gb3V0IG9mIHRoZSAvZmly
bXdhcmUgbm9kZSBzaW5jZSB0aGF0IGlzIGZvciBhIGRpZmZlcmVudAo+ID4gPiA+ID4gPiA+IHB1
cnBvc2UuIFJvYiBzdWdnZXN0ZWQgdGhhdCBwYXJ0aXRpb25zIHdhcyBhIGdvb2QgcGxhY2UuIFdl
IGhhdmUgZnd1cGQKPiA+ID4gPiA+ID4gPiB1c2luZyBEVCB0byBob2xkIHRoZSBmaXJtd2FyZS11
cGRhdGUgaW5mb3JtYXRpb24sIHNvIEkgZXhwZWN0IGl0IHdpbGwKPiA+ID4gPiA+ID4gPiBtb3Zl
IHRvIHVzZSB0aGVzZSBiaW5kaW5ncyB0b28uCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEkgd291
bGQgZGVmaW5pdGVseSB1c2UgZml4ZWQgcGFydGl0aW9ucyBhcyB0aGF0J3Mgd2hhdCB5b3UgbmVl
ZCB0aGVuOgo+ID4gPiA+ID4gPiByZWdpc3RlcmluZyB3aGVyZSBldmVyeXRoaW5nIHN0YXJ0cyBh
bmQgZW5kcy4gSWYgeW91IGhhdmUgImluLWJhbmQiCj4gPiA+ID4gPiA+IG1ldGEgZGF0YSB5b3Ug
bWlnaHQgcmVxdWlyZSBhIGNvbXBhdGlibGUsIGJ1dCBJIGRvbid0IHRoaW5rIHlvdQo+ID4gPiA+
ID4gPiBkbywgaW4gdGhpcyBjYXNlIHlvdSBzaG91bGQgcHJvYmFibHkgY2FycnkgdGhlIGNvbnRl
bnQgdGhyb3VnaCBhIGxhYmVsCj4gPiA+ID4gPiA+ICh3aGljaCB3aWxsIGJlY29tZSB0aGUgcGFy
dGl0aW9uIG5hbWUpIGFuZCB3ZSBjYW4gZGlzY3VzcyBhZGRpdGlvbmFsCj4gPiA+ID4gPiA+IHBy
b3BlcnRpZXMgaWYgbmVlZGVkLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEkgYmVsaWV2ZSBJIGFtIGdv
aW5nIHRvIG5lZWQgYSBjb21wYXRpYmxlIHN0cmluZyBhdCB0aGUgJ3BhcnRpdGlvbnMnCj4gPiA+
ID4gPiBsZXZlbCB0byBpbmRpY2F0ZSB0aGF0IHRoaXMgaXMgdGhlIGJpbm1hbiBzY2hlbWUuIEJ1
dCB3ZSBjYW4gbGVhdmUKPiA+ID4gPiA+IHRoYXQgdW50aWwgbGF0ZXIuCj4gPiA+ID4KPiA+ID4g
PiBQZXJoYXBzOgo+ID4gPiA+Cj4gPiA+ID4gY29tcGF0aWJsZSA9ICJiaW5tYW4iLCAiZml4ZWQt
cGFydGl0aW9ucyI7Cj4gPiA+ID4KPiA+ID4gPiBUaG91Z2ggSSBkb24ndCB1bmRlcnN0YW5kIHdo
eSBiaW5tYW4gY291bGRuJ3QganVzdCB1bmRlcnN0YW5kIHdoYXQKPiA+ID4gPiAiZml4ZWQtcGFy
dGl0aW9ucyIgbWVhbnMgcmF0aGVyIHRoYW4gImJpbm1hbiIuCj4gPiA+Cj4gPiA+IFdlbGwgc28g
bG9uZyBhcyB3ZSBkb24ndCBhZGQgYW55IGJpbm1hbiB0aGluZ3MgaW4gaGVyZSwgeW91IGFyZSBy
aWdodC4KPiA+ID4KPiA+ID4gQnV0IHRoZSBldmVudHVhbCBnb2FsIGlzIHBhcml0eSB3aXRoIGN1
cnJlbnQgQmlubWFuIGZ1bmN0aW9uYWxpdHksCj4gPiA+IHdoaWNoIHdyaXRlcyB0aGUgZW50aXJl
IChhdWdtZW50ZWQpIGRlc2NyaXB0aW9uIHRvIHRoZSBEVCwgYWxsb3dpbmcKPiA+ID4gdG9vbHMg
dG8gcmVidWlsZCAvIHJlcGFjayAvIHJlcGxhY2UgcGllY2VzIGxhdGVyLCBtYWludGFpbmluZyB0
aGUgc2FtZQo+ID4gPiBhbGlnbm1lbnQgY29uc3RyYWludHMsIGV0Yy4gSSBhbSBhc3N1bWluZyB0
aGF0IHByb3BlcnRpZXMgbGlrZSAnYWxpZ24KPiA+ID4gPSA8MTY+JyB3b3VsZCBub3QgZml0IHdp
dGggZml4ZWQtcGFydGl0aW9ucy4KPiA+Cj4gPiBJIGFtIHBlcnNvbmFsbHkgbm90IGJvdGhlcmVk
IGJ5IHRoaXMga2luZCBvZiBwcm9wZXJ0aWVzLiBCdXQgaWYgd2UgcGxhbgo+ID4gb24gYWRkaW5n
IHRvbyBtdWNoIHByb3BlcnRpZXMsIEkgd2lsbCBhZHZpc2UgdG8gaW5kZWVkIHVzZSBhbm90aGVy
IG5hbWUKPiA+IHRoYW4gZml4ZWQtcGFydGl0aW9ucyAob3IgYWRkIHRoZSAiYmlubWFuIiBzZWNv
bmRhcnkgY29tcGF0aWJsZSkKPiA+IG90aGVyd2lzZSBpdCdzIGdvbm5hIGJlIGhhcmQgdG8gc3Vw
cG9ydCBpbiB0aGUgY29kZSB3aGlsZSBzdGlsbAo+ID4gcmVzdHJhaW5pbmcgYXMgbXVjaCBhcyB3
ZSBjYW4gdGhlIG90aGVyIHBhcnRpdGlvbiBzY2hlbWEuCj4KPiBBZ3JlZWQuIEl0J3MgYSB0cmFk
ZSBvZmYuIEkgdGhpbmsgd2UgbmVlZCBlbm91Z2ggdG8gdW5kZXJzdGFuZCB0aGUKPiBwcm9ibGVt
IChub3QganVzdCBwcmVzZW50ZWQgd2l0aCBhIHNvbHV0aW9uKSwgYWdyZWUgb24gdGhlIGdlbmVy
YWwKPiBzb2x1dGlvbi9kaXJlY3Rpb24sIGFuZCB0aGVuIGRpc2N1c3Mgc3BlY2lmaWMgYWRkaXRp
b25zLgo+Cj4gPiA+IEJ1dCBpZiB3ZSBkb24ndCBwcmVzZXJ2ZQo+ID4gPiB0aGVzZSBwcm9wZXJ0
aWVzIHRoZW4gQmlubWFuIGNhbm5vdCBkbyByZXBhY2tpbmcgcmVsaWFibHkuIFBlcmhhcHMgZm9y
Cj4gPiA+IG5vdyBJIGNvdWxkIHB1dCB0aGUgYXVnbWVudGVkIERUIGluIGl0cyBvd24gc2VjdGlv
biBzb21ld2hlcmUsIGJ1dCBJCj4gPiA+IGFtIGp1c3Qgbm90IHN1cmUgaWYgdGhhdCB3aWxsIHdv
cmsgaW4gYSByZWFsIHN5c3RlbS4gRS5nLiB3aXRoIFZCRSB0aGUKPiA+ID4gZ29hbCBpcyB0byB1
c2UgdGhlIERUIHRvIGZpZ3VyZSBvdXQgaG93IHRvIGFjY2VzcyB0aGUgZmlybXdhcmUsIHVwZGF0
ZQo+ID4gPiBpdCwgZXRjLgo+Cj4gVkJFPwo+Cj4gPiA+IElzIGl0IG5vdCBwb3NzaWJsZSB0byBo
YXZlIG15IG93biBub2RlIHdpdGggd2hhdGV2ZXIgdGhpbmdzIEJpbm1hbgo+ID4gPiBuZWVkcyBp
biBpdCAoc3ViamVjdCB0byByZXZpZXcgb2YgY291cnNlKT8gaS5lLiBjb3VsZCB3ZSBkaXNjdXNz
IGhvdwo+ID4gPiB0byBlbmNvZGUgaXQsIGJ1dCBhcmd1ZSBsZXNzIGFib3V0IHdoZXRoZXIgdGhp
bmdzIGFyZSBuZWVkZWQ/IEkKPiA+ID4ga2luZC1vZiBmZWVsIEkga25vdyB3aGF0IGlzIG5lZWRl
ZCwgc2luY2UgSSB3cm90ZSB0aGUgdG9vbC4KPgo+IFdoYXQgd2UgZG9uJ3QgbmVlZCBpcyB0aGUg
c2FtZSBpbmZvcm1hdGlvbiBpbiAyIHBsYWNlcyBmb3IgdGhlIERUQgo+IHVzZWQgYXQgcnVudGlt
ZS4gSWYgdGhlIGJpbm1hbiBub2RlIGlzIHJlbW92ZWQsIGRvIHdoYXRldmVyIHlvdSB3YW50Lgo+
IElmIHlvdSB3YW50IHRvIGtlZXAgaXQgYXQgcnVudGltZSwgdGhlbiBpdCdzIGdvdCB0byBleHRl
bmQgd2hhdCB3ZQo+IGFscmVhZHkgaGF2ZS4KPgo+IEkgZG9uJ3QgdGhpbmsgYW55b25lIGlzIGRp
c2FncmVlaW5nIGFib3V0IHdoZXRoZXIgc3BlY2lmaWMgaW5mb3JtYXRpb24KPiBpcyBuZWVkZWQg
b3Igbm90Lgo+Cj4gPiA+ID4gPiBTbyB5b3UgYXJlIHN1Z2dlc3RpbmcgJ2xhYmVsJyBmb3IgdGhl
IGNvbnRlbnRzLiBSb2Igc3VnZ2VzdGVkCj4gPiA+ID4gPiAnY29tcGF0aWJsZScgWzFdLCBzbyB3
aGF0IHNob3VsZCBJIGRvPwo+ID4gPiA+Cj4gPiA+ID4gImxhYmVsIiBpcyBmb3IgY29uc3VtcHRp
b24gYnkgaHVtYW5zLCBub3QgdG9vbHMvc29mdHdhcmUuIENvbXBhdGlibGUKPiA+ID4gPiB2YWx1
ZXMgYXJlIGRvY3VtZW50ZWQsIGxhYmVsIHZhbHVlcyBhcmUgbm90LiBUaG91Z2ggdGhlIHBhcnRp
dGlvbgo+ID4gPiA+IHN0dWZmIHN0YXJ0ZWQgb3V0IHVzaW5nIGxhYmVsIGxvbmcgYWdvIGFuZCBp
dCdzIGV2b2x2ZWQgdG8gcHJlZmVycmluZwo+ID4gPiA+IGNvbXBhdGlibGUuCj4gPiA+Cj4gPiA+
IE9LIHNvIHdlIGFyZSBhZ3JlZWQgdGhhdCB3ZSBhcmUgZ29pbmcgd2l0aCAnY29tcGF0aWJsZScu
Cj4gPgo+ID4gU3RpbGwgc3Ryb25nbHkgZGlzYWdyZWUgaGVyZS4KPgo+IE1pcXVlbCBpcyByaWdo
dC4gSSB3YXMgY29uZnVzZWQgaGVyZS4gImxhYmVsIiBpcyBzdGlsbCBwcmV0dHkgbXVjaAo+IHVz
ZWQgZm9yIHdoYXQgdGhlIGltYWdlIGlzLiBUaG91Z2ggd2UgZG8gaGF2ZSAidS1ib290LGVudiIg
Zm9yIGJvdGggaXQKPiBzZWVtcy4KPgo+IE15IHBvc2l0aW9uIG9uICJsYWJlbCIgc3RhbmRzLiBU
byB0aGUgZXh0ZW50IHdlIGhhdmUgaW1hZ2VzIGZvciBjb21tb24KPiBjb21wb25lbnRzLCBJIHRo
aW5rIHdlIHNob3VsZCBzdGFuZGFyZGl6ZSB0aGUgbmFtZXMuIENlcnRhaW5seSBpZgo+IHRvb2xz
IHJlbHkgb24gdGhlIG5hbWVzLCB0aGVuIHRoZXkgc2hvdWxkIGJlIGRvY3VtZW50ZWQuCgpPSyB0
aGFua3MgZm9yIGNsZWFyaW5nIHRoYXQgdXAuCgpCdXQgYXQgcHJlc2VudCAnbGFiZWwnIGlzIGZy
ZWUtZm9ybSB0ZXh0LiBJZiBJIGNoYW5nZSBpdCB0byBhbiBlbnVtLAp3b24ndCB0aGF0IGJyZWFr
IHRoaW5ncz8gSWYgbm90LCBob3cgZG8gSSBhY3R1YWxseSBkbyBpdD8KClRoZXJlIGlzIGEgdS1i
b290LnlhbWwgYnV0IGl0IGRvZXNuJ3QgYWN0dWFsbHkgaGF2ZSBhICJ1LWJvb3QiIGxhYmVsCmlu
IHRoZSBzY2hlbWEuIEluIGZhY3QgaXQgc2VlbXMgdGhhdCB0aGUgbGFiZWwgaXMgbm90IHZhbGlk
YXRlZCBhdAphbGw/Cgo+Cj4KPiA+IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBhIGNvbXBhdGli
bGUgY2FycmllcyBob3cgdGhlIGNvbnRlbnQgaXMKPiA+IG9yZ2FuaXplZCwgYW5kIGhvdyB0aGlz
IG1heWJlIHNwZWNpZmljIChsaWtlIHlvdSBoYXZlIGluLWJhbmQgbWV0YSBkYXRhCj4gPiBkYXRh
IHRoYXQgbmVlZHMgdG8gYmUgcGFyc2VkIGluIGEgc3BlY2lmaWMgd2F5IG9yIGluIHlvdXIgY2Fz
ZQo+ID4gYWRkaXRpb25hbCBzcGVjaWZpYyBwcm9wZXJ0aWVzIGluIHRoZSBEVCB3aGljaCBnaXZl
IG1vcmUgY29udGV4dCBhYm91dAo+ID4gaG93IHRoZSBkYXRhIGlzIHN0b3JlZCkuIEJ1dCB0aGUg
cmVhbCBjb250ZW50IG9mIHRoZSBwYXJ0aXRpb24sIGllLiBpZgo+ID4gaXQgY29udGFpbnMgYSBm
aXJtd2FyZSwgdGhlIGtlcm5lbCBvciBzb21lIHVzZXIgZGF0YSBkb2VzIG5vdCBiZWxvbmcgdG8K
PiA+IHRoZSBjb21wYXRpYmxlLgo+ID4KPiA+IEkuZToKPiA+IC0gVGhlIGZpcnN0IGJ5dGUgb2Yg
bXkgcGFydGl0aW9uIGdpdmVzIHRoZSBjb21wcmVzc2lvbiBhbGdvcml0aG06Cj4gPiAgIC0+IGNv
bXBhdGlibGUgPSAiY29tcHJlc3NlZC1wYXJ0aXRpb24tZm9vIjsKPiA+ICAgICAgb3IKPiA+ICAg
LT4gY29tcGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25zIiArIGNvbXByZXNzaW9uLWFsZ29yaXRo
bSA9ICJmb28iOwo+ID4gLSBUaGUgcGFydGl0aW9uIGNvbnRhaW5zIGEgcGljdHVyZSBvZiBteSBk
b2c6Cj4gPiAgIC0+IGxhYmVsID0gIm15IGRvZyBpcyBiZWF1dGlmdWwiCj4gPiAgIGJ1dCBjZXJ0
YWlubHkgbm90Cj4gPiAgIC0+IGNvbXBhdGlibGUgPSAibXktZG9nIjsKPgo+IElNTywgY29tcGF0
aWJsZSBpbiB0aGlzIGNhc2Ugc2hvdWxkIGNvbnZleSAiSlBFRyBpbWFnZSIgb3Igc2ltaWxhci4K
Pgo+ID4gSSBkb24ndCBzZWUgd2h5LCBmb3IgdGhlIGJpbm1hbiBzY2hlbWEsIHdlIGNvdWxkIG5v
dCBjb25zdHJhaW4gdGhlCj4gPiBsYWJlbHM/Cj4KPiBZZXMsIGJ1dCB0aG9zZSBzaG91bGQgZm9s
bG93IHdoYXQgd2UgYWxyZWFkeSBoYXZlLiAidS1ib290IiBmb3IKPiBleGFtcGxlIHJhdGhlciB0
aGFuICJkYXRhLHUtYm9vdCIgd2hpY2ggSSB0aGluayBTaW1vbiBoYWQgaW4gc29tZQo+IHZlcnNp
b24gb2YgdGhpcy4KClllcywgZG9uJ3Qgd29ycnksIEkgaGFkIHNvbWUgZmVlZGJhY2sgZnJvbSBB
bHBlciBidXQgaGF2ZSBnaXZlbiB1cCBvbgp0aGF0IGFwcHJvYWNoLgoKUmVnYXJkcywKU2ltb24K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
