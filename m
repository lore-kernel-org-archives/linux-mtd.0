Return-Path: <SRS0=Dlpg=BJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E908AC433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jul 2020 14:22:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7F0120829
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jul 2020 14:22:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lfvPkudE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=eclypsium.com header.i=@eclypsium.com header.b="Nj1mCKyv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7F0120829
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GOFtBjeegDr3KR4A0i0/2oejLofUIFdCsEXGansBe8A=; b=lfvPkudE8HraVDJ2tW14GAfXx
	f/yk42ul8FpbNwbilJ89P6nbyYDGdz8rzvIgGn3/SFBc5cT9FlnqNoYGIYP8y8bW93yNRcs3C6kjc
	9Z8uVOienDg1h/QveLqsSq1Y3rQLNOfq5AR6faF0cN/3Yq6Ub6MPejyoUrXtyMUhxUuuIIgitaJLf
	e4spdART3JrDLjS//zx3auqyO9AoVC7faHMw70ZiK8x2Em+3f2MKYMH1uMGLtbge3gtPPZ+LhTrjr
	FatuGsVtb7GyxOZmSj2Kqk0FVcAzvvze/wByqgf6CdtNd63YezFQwePY9WPcDVv3TjUo3C2Da7f5z
	iq6QmiJOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k19Qf-0002ws-C0; Thu, 30 Jul 2020 14:21:05 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k19Qd-0002vw-3x
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2020 14:21:04 +0000
Received: by mail-qk1-x741.google.com with SMTP id 2so21592791qkf.10
 for <linux-mtd@lists.infradead.org>; Thu, 30 Jul 2020 07:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=F/jomJ6uLuwf7Rw57RY5/Ap0B+MxWKyeViCBM/4WQzw=;
 b=Nj1mCKyvWXQ5WMAXKRNDk1pZNoJQX9fEIaJ63VFKTqrfKPJhxiM/Nml+21topTFOy4
 G0TNK2Lz76W+LEenbSDrvqkaNJJxtL6L8J4wb4XkkwRmnFrEAh7u6babGn2OmNid7r7e
 djWhNr8OkPrZ071irRX2XiZCW0QB2JU4bSb6VyuTkfSY7Tb3vng6EQ1Nc5T5jgnYQ41n
 WlULoSZF6vgp8GYCcXSHCdXlUU1CXvs3gYtVhc/82lVnMlWSGs3IqR/TIZO5aRHc32pQ
 w0j7uEZIT1BIxkpYu0JelNwyCBxw5xSJ77BWWKPhlwSBzA/INGmz839oOgc+MSMXFU5e
 rn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F/jomJ6uLuwf7Rw57RY5/Ap0B+MxWKyeViCBM/4WQzw=;
 b=aaRO/6WNE886w57jJNuB0aAdWlKpD+8Kh6bdYjufmRXBn4FB0D6EMXLVcIxh99G3Ci
 qXJhdT351U6dViadFg4MIKb1gfxbWFOCAFfhyW9KmGTWWp/aTjr/QbU/9VNjnWyU1UMr
 OhKz39qAppvDjJZ4wo7Pqko1vNl2R48+tTm0l3dDNaCmA9tjYG+8F/yfZH+v9rq54pm/
 Dxez79I7UE1vX8XpQOeaw3mKFUbnYtBAg3C2CdssggNUialvKZMRtMQeGTqkjRpQSLeU
 t4nNZdjOL6Fl2nGnwvtt6PdGPiy/u/oD0h7jgfQaDtXTtoIpryNQTH1m+QquhDNIcQbA
 rFdw==
X-Gm-Message-State: AOAM532AGi318RsJ/1DSGrKiEknvy5gs3NCQdVDvbVinxKh9CUsXgjCj
 c+0ND+jNOwLp9eEz5v4cCFToCGJ5QPWgisfXvO2pPw==
X-Google-Smtp-Source: ABdhPJxY8vBzd8PV7ZptzGOU4HwrJqwhHLac85B6YDcDX282dEOhwvgNuUaHLjh4D+n6fwlJFNl4ifNbnQwyMbXcODk=
X-Received: by 2002:ae9:eb81:: with SMTP id
 b123mr38265818qkg.288.1596118860878; 
 Thu, 30 Jul 2020 07:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200724212853.11601-1-daniel.gutson@eclypsium.com>
 <20200725055649.GA1047853@kroah.com>
 <CAFmMkTE_dT9+WJYyb19uQ_HmgJWZSARBy6PveheQJk++NuGbkQ@mail.gmail.com>
 <20200726071723.GB441916@kroah.com>
 <CAFmMkTFzGfFDrJrdgHztzLK2K-zBWy6T2Tv+G4-rrbVpbahkgg@mail.gmail.com>
 <CAK8P3a1nA7K15Cxz84Q8Grw3tKfgkUmsfURcytJEWb_0Wjqm5w@mail.gmail.com>
 <CAFmMkTExBY3V_Ghej7Bzjatg+vFtWq3UZmKzjAiEoR9EqnFN9Q@mail.gmail.com>
 <CAFmMkTEO7VNKJeYz2uoHsS-yN_aY8UuiQ2GcCq9NyAD5481ZGA@mail.gmail.com>
 <20200730053108.GA3861609@kroah.com>
 <CAFmMkTHXjfG7zMr0i_h65PvjAe4opPgvzdABH8W1EUGOmcA4Zg@mail.gmail.com>
 <CAK8P3a2SN3pdXV8=0jXfrsz8L64yV46fEM4zrSXfA25QK0GNuA@mail.gmail.com>
 <CAFmMkTFiqDtTw2v8RJktzY--WxGd7Fdz2fKA3YxXzA8ZiDS1XQ@mail.gmail.com>
In-Reply-To: <CAFmMkTFiqDtTw2v8RJktzY--WxGd7Fdz2fKA3YxXzA8ZiDS1XQ@mail.gmail.com>
From: Daniel Gutson <daniel@eclypsium.com>
Date: Thu, 30 Jul 2020 11:20:48 -0300
Message-ID: <CAFmMkTFyKSUWYgKeTBGh9wkB4dajhdJ3xZ9CUvQwk8hS1LGU-Q@mail.gmail.com>
Subject: Re: [PATCH] Module argument to control whether intel-spi-pci attempts
 to turn the SPI flash chip writeable
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_102103_223334_39580C8B 
X-CRM114-Status: GOOD (  25.97  )
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
Cc: Richard Hughes <hughsient@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdWwgMzAsIDIwMjAgYXQgMTE6MTggQU0gRGFuaWVsIEd1dHNvbiA8ZGFuaWVsQGVj
bHlwc2l1bS5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBKdWwgMzAsIDIwMjAgYXQgMTE6MDkgQU0g
QXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBKdWwg
MzAsIDIwMjAgYXQgMjoyMSBQTSBEYW5pZWwgR3V0c29uIDxkYW5pZWxAZWNseXBzaXVtLmNvbT4g
d3JvdGU6Cj4gPiA+IEVsIGp1ZS4sIDMwIGp1bC4gMjAyMCAyOjMxIGEuIG0uLCBHcmVnIEtyb2Fo
LUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiBlc2NyaWJpw7M6Cj4gPiA+Pgo+
ID4gPj4gQWdhaW4sIG1vZHVsZSBwYXJhbWV0ZXJzIGFyZSB3b3JraW5nIG9uIGEgcGVyLWNodW5r
LW9mLWNvZGUgYmFzaXMsIHdoaWxlCj4gPiA+PiB5b3Ugd2FudCB0byB3b3JrIG9uIGEgcGVyLWRl
dmljZSBiYXNpcywKPiA+ID4KPiA+ID4KPiA+ID4gSSB0aGluayB0aGVyZSBpcyBhIG1pc3VuZGVy
c3RhbmRpbmcuICBXaGF0IEkgd2FudCBpcyB0byBjb250cm9sICh0dXJuIG9uIG9yIG9mZikgaXMg
YSB2ZXJ5IHNwZWNpZmljIGNvZGUgc25pcHBldCB0aGF0IHByb3ZpZGVzIHRoZSAiZnVuY3Rpb25h
bGl0eSIgb2YgdHJ5aW5nIHRvIHR1cm4gdGhlIGNoaXAgd3JpdGFibGUuIFRoZSByZXN0IG9mIHRo
ZSBkZXZpY2UgZHJpdmVyIGlzIGZpbmUuCj4gPiA+IEkgYXNzdW1lIHRoYXQgdGhlIG9uZSB0aGF0
IGRvZXNuJ3QgdW5kZXJzdGFuZCBpcyBtZS4KPiA+ID4KPiA+Cj4gPiBJIGxvb2tlZCBhdCB0aGUg
c291cmNlIGNvZGUgYWdhaW4gYW5kIGZvdW5kIHRoYXQgdGhlIGV4aXN0aW5nIG1vZHVsZQo+ID4g
cGFyYW1ldGVyIGFwcGxpZXMgdG8gYm90aCB0aGUgcGxhdGZvcm0gYW5kIHBjaSBkZXZpY2UgZnJv
bnQtZW5kcywgYm90aAo+ID4gb2Ygd2hpY2ggZ28gdGhyb3VnaAo+ID4KPiA+ICAgICAgICAgLyog
UHJldmVudCB3cml0ZXMgaWYgbm90IGV4cGxpY2l0bHkgZW5hYmxlZCAqLwo+ID4gICAgICAgICBp
ZiAoIWlzcGktPndyaXRlYWJsZSB8fCAhd3JpdGVhYmxlKQo+ID4gICAgICAgICAgICAgICAgIGlz
cGktPm5vci5tdGQuZmxhZ3MgJj0gfk1URF9XUklURUFCTEU7Cj4gPgo+Cj4gSSB0aGluayB5b3Ug
bWlzc2VkCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9k
cml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL2ludGVsLXNwaS1wY2kuYyNMNDQKPgo+ICAg
ICAvKiBUcnkgdG8gbWFrZSB0aGUgY2hpcCByZWFkL3dyaXRlICovCj4gICAgIHBjaV9yZWFkX2Nv
bmZpZ19kd29yZChwZGV2LCBCQ1IsICZiY3IpOwo+ICAgICBpZiAoIShiY3IgJiBCQ1JfV1BEKSkg
ewo+ICAgICAgICAgYmNyIHw9IEJDUl9XUEQ7Cj4gICAgICAgICBwY2lfd3JpdGVfY29uZmlnX2R3
b3JkKHBkZXYsIEJDUiwgYmNyKTsKPiAgICAgICAgIHBjaV9yZWFkX2NvbmZpZ19kd29yZChwZGV2
LCBCQ1IsICZiY3IpOwo+ICAgICB9Cj4KPiBpbiB0aGUgcHJvYmUgZnVuY3Rpb24sIGFuZCBpcyBl
eGVjdXRlZCBhbHdheXMgYW5kIHVuY29uZGl0aW9uYWxseS4KClRvIGNsYXJpZnksIHRoaXMgaXMg
ZXhlY3V0ZWQgYmVmb3JlIGludGVsLXNwaSBjb2RlLgoKPgo+IC8qIFRyeSB0byBtYWtlIHRoZSBj
aGlwIHJlYWQvd3JpdGUgKi8KPiBwY2lfcmVhZF9jb25maWdfZHdvcmQocGRldiwgQkNSLCAmYmNy
KTsKPiBpZiAoIShiY3IgJiBCQ1JfV1BEKSkgewo+IGJjciB8PSBCQ1JfV1BEOwo+IHBjaV93cml0
ZV9jb25maWdfZHdvcmQocGRldiwgQkNSLCBiY3IpOwo+IHBjaV9yZWFkX2NvbmZpZ19kd29yZChw
ZGV2LCBCQ1IsICZiY3IpOwo+IH0KPgo+ID4gU2V0dGluZyB0aGUgUENJIGRldmljZSB3cml0YWJs
ZSBpbiBoYXJkd2FyZSBtYWtlcyBpdCBwb3NzaWJsZSB0bwo+ID4gYWN0dWFsbHkgd3JpdGUgdG8g
aXQgKm9ubHkqIGlmIHRoZSBtb2R1bGUgcGFyYW1ldGVyIGlzIGFsc28gc2V0IHRvICcxJy4KPiA+
IE9uZSBtaWdodCBkaXNhZ3JlZSB3aXRoIHRoYXQgZGVzaWduLCBidXQgSSBkb24ndCB0aGluayB5
b3VyIHBhdGNoCj4gPiB3b3VsZCBtYWtlIGl0IGFueSBiZXR0ZXIsIGl0IGp1c3QgbWVhbnMgb25l
IHdvdWxkIGhhdmUgdG8gc2V0Cj4gPiB0d28gbW9kdWxlIHBhcmFtZXRlcnMgaW5zdGVhZCBvZiBv
bmUuCj4gPgo+ID4gICAgICBBcm5kCj4KPgo+Cj4gLS0KPiBEYW5pZWwgR3V0c29uCj4gQXJnZW50
aW5hIFNpdGUgRGlyZWN0b3IKPiBFbmdpbmllZXJpbmcgRGlyZWN0b3IKPiBFY2x5cHNpdW0KPgo+
IEJlbG93IFRoZSBTdXJmYWNlOiBHZXQgdGhlIGxhdGVzdCB0aHJlYXQgcmVzZWFyY2ggYW5kIGlu
c2lnaHRzIG9uCj4gZmlybXdhcmUgYW5kIHN1cHBseSBjaGFpbiB0aHJlYXRzIGZyb20gdGhlIHJl
c2VhcmNoIHRlYW0gYXQgRWNseXBzaXVtLgo+IGh0dHBzOi8vZWNseXBzaXVtLmNvbS9yZXNlYXJj
aC8jdGhyZWF0cmVwb3J0CgoKCi0tIApEYW5pZWwgR3V0c29uCkFyZ2VudGluYSBTaXRlIERpcmVj
dG9yCkVuZ2luaWVlcmluZyBEaXJlY3RvcgpFY2x5cHNpdW0KCkJlbG93IFRoZSBTdXJmYWNlOiBH
ZXQgdGhlIGxhdGVzdCB0aHJlYXQgcmVzZWFyY2ggYW5kIGluc2lnaHRzIG9uCmZpcm13YXJlIGFu
ZCBzdXBwbHkgY2hhaW4gdGhyZWF0cyBmcm9tIHRoZSByZXNlYXJjaCB0ZWFtIGF0IEVjbHlwc2l1
bS4KaHR0cHM6Ly9lY2x5cHNpdW0uY29tL3Jlc2VhcmNoLyN0aHJlYXRyZXBvcnQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
