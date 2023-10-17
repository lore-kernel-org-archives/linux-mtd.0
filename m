Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D826CCDB474
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Oct 2023 10:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oRCfu2DPhiMqykPtNhbT0rJaxbP2GDw74mYIKs1rn94=; b=UbY+1kMBL/ldZQ
	sxzDGMg8xVP6lFPXy9Il2xWvv6TQ9Xj+XAvSa5ZGsPZItkZvB52wN7pyGFgDlwU3lgffn6QpBezE3
	moHwOqFpEyUeNyjzgxGAEbL4YFtudbebBy/3DTZmxHtHLEqaKVAcHWe337A+vZpI+GXUgBtt1zct9
	1J324NsY8ARQNEj1AzmdjtclbKJ4e6ojjK9srcnzc78Pwx2A/+wlH79yrNsJyV4efWaorJufxT9RR
	NJMyndE8etg9StQ8V89VgeDoe26IFcZsCv8rjko7L63qbCXOfreagL6dNMwGs1JM0Ll/HJu6uqYPI
	RwAN/3vzw3R2SHoBaz/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qshCA-00C24P-0I;
	Tue, 17 Oct 2023 10:21:02 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qshC7-00C21t-28
	for linux-mtd@lists.infradead.org;
	Tue, 17 Oct 2023 10:21:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 68557CE1BC1
	for <linux-mtd@lists.infradead.org>; Tue, 17 Oct 2023 10:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2C5C433C7
	for <linux-mtd@lists.infradead.org>; Tue, 17 Oct 2023 10:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697538056;
	bh=s3ei31bLns3eZrhmZvMizV8gKlFQZLKQttQ5Pkr1EZI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rgDnj81X+znbG/PaJ28LA92m/uhZ19YdAh0+dFE4fzRbDxi3Rt8uux5wZx7S8n6FM
	 toDOz9yWVnkJr7V2xqIQjtNkLmvcaRIxso3Hfi/mIaczusyVlx/zfbf1fhzfRywLWE
	 zOwD3L1B6vXd1Omqu44T7iWlclHlR/TQ1lge8HQ9aakpH6gR22hnrgAhrKI//mfi8t
	 VeDPRDGEdWSEgz4GZfklDn/at+mzDhAfEfpO1v3XunNXGWYTVJocOrcZ004q+BnCS4
	 iHHAVc/hyF/Lr4ottw12u40xIZLa7ciJI3iboK8y9AhWxAbnY5C2Ua86xSG2T37dUg
	 48Xlj8hNJ3eBA==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1e59894d105so3220980fac.1
        for <linux-mtd@lists.infradead.org>; Tue, 17 Oct 2023 03:20:56 -0700 (PDT)
X-Gm-Message-State: AOJu0YzikypRSKq1kKf81W9W1BRCyfqz/3xy4W2Jo7e97p9Q2f1mVONA
	ds6dkVHKXV+pGAq4x3W7vyOY+I/a6IgLk91KAnE=
X-Google-Smtp-Source: AGHT+IFgOt6Dj/5n3JHKIf+od7/6gfrvlvgCZOWB83LIMlBeQcFiM3JJJF83K6R2kdngSFg/UscgOSg5/ChMpvqRNgk=
X-Received: by 2002:a05:6870:1605:b0:1e9:ab99:6b7 with SMTP id
 b5-20020a056870160500b001e9ab9906b7mr2048546oae.3.1697538056089; Tue, 17 Oct
 2023 03:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
 <20231008200143.196369-2-u.kleine-koenig@pengutronix.de> <CAK7LNASB2HhO6iWNnG-tAzs9wu9mV2PLRf-brnNGkSJj+W23Vw@mail.gmail.com>
 <e38b8a8e-5bd6-41e2-87a1-3b2d23b68bc0@app.fastmail.com> <20231009103037.j44gkzqv7cpn4zpu@pengutronix.de>
 <4c27130c-e924-4f24-b833-794e0acac858@app.fastmail.com> <20231016102134.q6k2jb5ewu3flg6j@pengutronix.de>
In-Reply-To: <20231016102134.q6k2jb5ewu3flg6j@pengutronix.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 17 Oct 2023 19:20:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNARSxEZeKGoFAdGp1uhQVBrdGByDD4cJNMc_HCkmTiFF+g@mail.gmail.com>
Message-ID: <CAK7LNARSxEZeKGoFAdGp1uhQVBrdGByDD4cJNMc_HCkmTiFF+g@mail.gmail.com>
Subject: Re: [PATCH 01/20] mtd: rawnand: txx9ndfmc: Mark driver struct with
 __refdata to prevent section mismatch warning
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kbuild@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	linux-mtd@lists.infradead.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Richard Weinberger <richard@nod.at>, 
	Andrew Morton <akpm@linux-foundation.org>, David Woodhouse <dwmw2@infradead.org>, 
	Atsushi Nemoto <anemo@mba.ocn.ne.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_032100_078646_39E140F7 
X-CRM114-Status: GOOD (  26.67  )
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

T24gTW9uLCBPY3QgMTYsIDIwMjMgYXQgNzoyMeKAr1BNIFV3ZSBLbGVpbmUtS8O2bmlnCjx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gT24gTW9uLCBPY3QgMTYsIDIw
MjMgYXQgMTE6MjU6NDRBTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiA+IE9uIE1vbiwg
T2N0IDksIDIwMjMsIGF0IDEyOjMwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiA+ID4gT24g
TW9uLCBPY3QgMDksIDIwMjMgYXQgMTA6NDM6NDZBTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3cm90
ZToKPiA+ID4KPiA+ID4gb25seSBhIHNsaWdodCBjb3JyZWN0aW9uOiBBcyBub3QgaGF2aW5nIGEg
cmVtb3ZlIGNhbGxiYWNrIGNhbiBiZSBmaW5lCj4gPiA+IGFuZCBwbGF0Zm9ybV9yZW1vdmUoKSBv
bmx5IGNhbGxzIC5yZW1vdmUgKG9yIC5yZW1vdmVfbmV3KSB3aGVuIG5vbi1OVUxMCj4gPiA+IHdl
J3JlIG5vdCBoaXR0aW5nIGEgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGluIHRoZSBwcmVzZW5j
ZSBvZgo+ID4gPgo+ID4gPiAgICAgLnJlbW92ZSA9IF9fZXhpdF9wKHNvbWVmdW5jKSwKPiA+ID4K
PiA+ID4gQnV0IGEgcHJvYmxlbSBjYW4gYXJpc2UgbGF0ZXIgaWYgc29tZSByZXNvdXJjZSBpc24n
dCBwcm9wZXJseSBmcmVlZCBhbmQKPiA+ID4gc28gaXQgbWlnaHQgYmUgdXNlZCBhdCBhIGxhdGVy
IHBvaW50IGluIHRpbWUgd2hpY2ggdGhlbiBtb3N0IGxpa2VseQo+ID4gPiBvb3BzZXMuCj4gPiA+
Cj4gPiA+IEkgZGlkbid0IGRvdWJsZSBjaGVjayBBcm5kJ3MgbGlzdCwgYnV0IG90aGVyd2lzZSBJ
IGFncmVlIHRvIGhpcwo+ID4gPiBhbmFseXNpcy4KPiA+Cj4gPiBIaSBVd2UsCj4gPgo+ID4gQmFz
ZWQgb24gYSBmZXcgZGF5cyBvZiByYW5kY29uZmlnIGJ1aWxkIHRlc3RpbmcsIHRoZSBwYXRjaAo+
ID4gYmVsb3cgYWRkcmVzc2VzIHRoZSByZW1haW5pbmcgd2FybmluZ3MgSSBnZXQgZm9yIGFybSwg
YXJtNjQgYW5kCj4gPiB4ODYgb24gbGludXgtbmV4dC4gVGhpcyBpcyBhIHNob3J0ZXIgbGlzdCB0
aGFuIHRoZSBvbmVzIHRoYXQKPiA+IEkgZm91bmQgaW4gdGhlb3J5LCBwb3NzaWJseSBiZWNhdXNl
IHNvbWUgb2YgdGhlIG90aGVyIG9uZXMKPiA+IGFyZSBvbmx5IHVzZWQgaW4gYnVpbHQtaW4gY29k
ZSwgb3IgYmVjYXVzZSB0aGV5IGFyZSBuZXZlciB1c2VkCj4gPiBvbiB0aGVzZSB0aHJlZSBhcmNo
aXRlY3R1cmVzLgo+ID4KPiA+IEhhdmUgeW91IGFscmVhZHkgc2VudCBwYXRjaGVzIGZvciAoc29t
ZSBvZikgdGhlc2U/Cj4gPgo+ID4gICAgICAgQXJuZAo+ID4KPiA+ICBkcml2ZXJzL2NoYXIvaHdf
cmFuZG9tL214Yy1ybmdhLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0K
PiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRwZDEyczAxNS5jICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDQgKystLQo+ID4gIGRyaXZlcnMvaHdtb24vc21zYzQ3bTEuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ID4gIGRyaXZlcnMv
aHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtZXRtNHgtY29yZS5jICAgICAgICAgICAgICAg
IHwgOCArKysrLS0tLQo+ID4gIGRyaXZlcnMvbWVkaWEvaTJjL2V0OGVrOC9ldDhlazhfZHJpdmVy
LmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArKy0tCj4gPiAgZHJpdmVycy9tZW1vcnkv
ZW1pZi5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICst
Cj4gPiAgZHJpdmVycy9tbWMvaG9zdC9kYXZpbmNpX21tYy5jICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAyICstCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvdHh4OW5kZm1j
LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCj4KPiBUaGUgdHh4OW5k
Zm1jIGRyaXZlciB3YXMgZml4ZWQgYXMgcGFydCBvZiB0aGlzIHNlcmllcywgYnV0IE1pcXXDqGwg
ZGlkbid0Cj4gdGFrZSB0aGUgcGF0Y2gsIEkgZ3Vlc3MgYmVjYXVzZSBoZSB3YW50cyBpdCB0byBi
ZSBjb252ZXJ0ZWQgdG8KPiBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKCkuCgoKU28sIHRoZXJlIGFy
ZSB0d28gd2F5cyBmb3IgZml4aW5nLCBhbmQgaXQgaXMKdXAgdG8gc3Vic3lzdGVtIG1haW50YWlu
ZXJzPwoKCgoKQSBxdWVzdGlvbiBpcywgaXMgbW9kdWxlX3BsYXRmb3JtX2RyaXZlcl9wcm9iZSgp
CnN0aWxsIHdvcnRoIHN1cHBvcnRpbmc/CgoKCgoKCi0tIApCZXN0IFJlZ2FyZHMKTWFzYWhpcm8g
WWFtYWRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
