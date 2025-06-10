Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2988C61DB2
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Jun 2025 07:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=67+xiUbFJu6hYeGy3SVnPfsuHvUkD5+kUOiBillkZik=; b=MwsHeTaaduNnIW
	qX4pZUsQpBjUh0axFquR9e5z06FzGqY1AVjIQtiMg7ger8tts732gsupIvyjRRC2I36oruwdYQFdF
	7MxK2Sb2xp3e07sw/n0sD2+hx31NDkaHg5UZdKCtHOoJCa/2IIxgU/IOZ1QPOnxXjIw1t6BEShuXP
	DFg3yqZgvcB+ukNhvbVZOhV+BptBMqLwqmrtoqzSaSMZTty7mBdJcn9VsY7oIwfulPuaQHlKMMn4c
	CXt1tfS2yMAgNVE5iiDOd0zT3pz1zjQeOKsGeui+iRKdo8I1CeFsS01ND+NNGk0PLhMhz8c8kruhH
	koXjccZOq2iyfKsMKj5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOtQh-000000061iX-3Lpg;
	Tue, 10 Jun 2025 07:29:55 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOtQf-000000061i0-2ROT
	for linux-mtd@lists.infradead.org;
	Tue, 10 Jun 2025 07:29:54 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b2f11866376so3347256a12.3
        for <linux-mtd@lists.infradead.org>; Tue, 10 Jun 2025 00:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749540592; x=1750145392; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/c/nvFBTk1rF9mbHMZr8X1pL6twdsG/UeweRIdwNzck=;
        b=CbdkT4i4vvKe5VxGJdPzGQkWxDwWnREsnALGb6ORwdgmDtlylOjjNCsE5NbXscq3SL
         hlJFdgnH8n/M94kGddcDHvFz3Z0yB/BZRbA2tLcOa6Lj/C1W4/z6zPQ++yllj6GkJyUp
         QU0dHCSGJxCLhGC45SR2OQLRbVPrIoGjaxGBqbik96ueSB8eMOw5DHBMPvPbUa9CB1x1
         dwxqz9FW+ygXutrGtkcsNcigQlytxgFDo4YQEmBQJkb8fZVG8qBAFKFUoX9yl/wOY8M9
         on2TExdp+1NNCHEH+qAtizYY9Fyvqj+jAGu5hJlTHHslYd/dQwPx1H4/QaYzg/5Aa/Hc
         gJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749540592; x=1750145392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/c/nvFBTk1rF9mbHMZr8X1pL6twdsG/UeweRIdwNzck=;
        b=aTtOL5rL+OWKTVs0fKX59ngBtqHKNyMgp3qJD15hG9zBl4epVmpKjXdrFkLL5rMgCF
         4Ag/HkZRYbuh09LjoSJ+i7TT5KaVoZJt3mdPJ970u6BIZAU3hAaNjyUKSg1OMcCwMSr5
         ygDpoCM4GobzYR4XLqH/cfS5nF8u+vg5LREYxVPHHpX/944GUUHQLHVuBNWoXashm8vi
         lcmIP9qWhojeVqQsHTLiAQ1SdfbuE2SwAGZaLR0SuC2osGm6PhV+INxhS1z2pKTC3I7H
         pxuKa7gt3VMsGdJxUzl1i2p8U7hQgGB8z7f5shNFiBe0h0Mtyx3oo/K4AK9BhtVcWJL+
         npuA==
X-Forwarded-Encrypted: i=1; AJvYcCXaAeaFKSsQaL7454e42NZatGyKAFJAT3vrM56sQGK+CXsT61X1vg+pm3WVLajZVhuZITgjvd9NlrM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyjfPwwnG3C5hsSHZMy9+Ot+iJKI61iPbnYw4I3ONMvTUFAQLuG
	W5ZF+SlFKN3y6w5xfo5ktecLN1HfXA7v1ipIBg4QeTtgi0TqF793SskLlbRnjrXhmnxdw5Pn25e
	F0mqzTy8waW6KHFwq9n0tq2dMy3J+ggY=
X-Gm-Gg: ASbGncuiK5ypwKY5vVWJq0dufyU1+tcQihuPMDY/F3927Ji4nJtfJA1N/t7xrYE3S+/
	A+0bOtQrR+JbX/hEdFvnZK2z+W1au7z6p01apb1bNF1EHzn7CsRTbntBzri8hgE0Qmzzouhbo4s
	eUJsMupx2VqS9FPz0VOg61/aHY5Q+mC0caEbpKWewshAs=
X-Google-Smtp-Source: AGHT+IG61dYIWcqcw0OE8hs09XYLIpm7c0zzcURHFCO/KWRCm6ZbvMCefIG4bpV9Cf2AP1XG2hyRnFdosznPUxqh0OI=
X-Received: by 2002:a17:90b:3c04:b0:312:f2ee:a895 with SMTP id
 98e67ed59e1d1-3134706fbebmr22686005a91.31.1749540592421; Tue, 10 Jun 2025
 00:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250407075400.1113177-1-linchengming884@gmail.com>
 <20250407075400.1113177-2-linchengming884@gmail.com> <d98f6eee-d5f7-43b7-bbc8-d6e7e274723a@roeck-us.net>
 <mafs05xh6pf7s.fsf@kernel.org> <da58fc81-3c99-4951-85bc-e3c139283b5a@roeck-us.net>
 <a2a0c40e-69d7-4408-add2-88616c92b0ca@roeck-us.net> <aa2a4480-9b78-4ed9-8f9d-b18a87eb01e9@linaro.org>
In-Reply-To: <aa2a4480-9b78-4ed9-8f9d-b18a87eb01e9@linaro.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Tue, 10 Jun 2025 15:29:24 +0800
X-Gm-Features: AX0GCFuAD83STnCHvnaOnAf33LKrtH_sKdhEdIlLIkxv-j2z0CHQ59q_ioyCu2A
Message-ID: <CAAyq3SYybDgBvkTKh2ZB4UdKq1XV_nnzx3Tj1P915W5x_7_nNA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: macronix: Drop the redundant flash
 info fields
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Pratyush Yadav <pratyush@kernel.org>, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>, mwalle@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_002953_637055_8A8C3E89 
X-CRM114-Status: GOOD (  27.94  )
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

VHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPiDmlrwgMjAyNeW5tDbmnIgx
MOaXpSDpgLHkuowg5LiL5Y2IMjo0NuWvq+mBk++8mgo+Cj4KPgo+IE9uIDYvMTAvMjUgMToxNCBB
TSwgR3VlbnRlciBSb2VjayB3cm90ZToKPiA+IE9uIDYvOC8yNSAxODoxMywgR3VlbnRlciBSb2Vj
ayB3cm90ZToKPiA+PiBPbiA2LzgvMjUgMDU6NTMsIFByYXR5dXNoIFlhZGF2IHdyb3RlOgo+ID4+
PiBPbiBTYXQsIEp1biAwNyAyMDI1LCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+ID4+Pgo+ID4+Pj4g
SGksCj4gPj4+Pgo+ID4+Pj4gT24gTW9uLCBBcHIgMDcsIDIwMjUgYXQgMDM6NTM6NThQTSArMDgw
MCwgQ2hlbmcgTWluZyBMaW4gd3JvdGU6Cj4gPj4+Pj4gRnJvbTogQ2hlbmcgTWluZyBMaW4gPGNo
ZW5nbWluZ2xpbkBteGljLmNvbS50dz4KPiA+Pj4+Pgo+ID4+Pj4+IE1hbnkgZmxhc2ggZGV2aWNl
cyBzaGFyZSB0aGUgc2FtZSBJRCBidXQgaGF2ZSBkaWZmZXJlbnQgcGFydCBudW1iZXJzLgo+ID4+
Pj4+IFRvIGF2b2lkIGNvbmZ1c2lvbiwgdGhlIHBhcnQgbnVtYmVyIGZpZWxkIGlzIHJlbW92ZWQu
Cj4gPj4+Pj4KPiA+Pj4+PiBBZGRpdGlvbmFsbHksIHNpbmNlIFNGRFAgYWxyZWFkeSBwcm92aWRl
cyBzaXplIGluZm9ybWF0aW9uIGFuZAo+ID4+Pj4+IGZ1bmN0aW9uYWxpdHkgY292ZXJlZCBieSBu
b19zZmRwX2ZsYWdzLCB0aGVzZSBmaWVsZHMgYXJlIGFsc28gcmVtb3ZlZC4KPiA+Pj4+Pgo+ID4+
Pj4+IEZ1cnRoZXJtb3JlLCB3aGVuIDQtYnl0ZSBhZGRyZXNzIGluc3RydWN0aW9uIHRhYmxlIGlz
IGF2YWlsYWJsZSwKPiA+Pj4+PiB0aGUgU1BJX05PUl80Ql9PUENPREVTIGZsYWcgaXMgbm8gbG9u
Z2VyIG5lZWRlZCBhbmQgaXMgcmVtb3ZlZC4KPiA+Pj4+Pgo+ID4+Pj4+IFNpZ25lZC1vZmYtYnk6
IENoZW5nIE1pbmcgTGluIDxjaGVuZ21pbmdsaW5AbXhpYy5jb20udHc+Cj4gPj4+Pj4gQWNrZWQt
Ynk6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZz4KPiA+Pj4+Cj4gPj4+
PiBXaXRoIHRoaXMgcGF0Y2ggaW4gcGxhY2UsIHNvbWUgb2YgbXkgcWVtdSB0ZXN0cyBubyBsb25n
ZXIgcmVjb2duaXplIHRoZQo+ID4+Pj4gZmxhc2ggY2hpcHMgKE1YMjVMMjU2MzVFL0YpLiBEbyB5
b3UgaGF2ZSBhIHN1Z2dlc3Rpb24gb24gaG93IHRvIGhhbmRsZQo+ID4+Pj4gdGhpcyBvdGhlciB0
aGFuIGF2b2lkaW5nIE1hY3Jvbml4IGZsYXNoIGNoaXBzIHdoZW4gd29ya2luZyB3aXRoIHFlbXUg
Pwo+ID4+Pgo+ID4+PiBDb3VsZCB5b3Ugc2hhcmUgc29tZSBsb2dzPyBEb2VzIHRoZSBmbGFzaCBm
YWlsIHRvIGRldGVjdCwgb3IgZG9lcyB0aGUKPiA+Pj4gU0ZEUC1iYXNlZCBwcm9iaW5nIGZhaWw/
IFNpbmNlIHRoaXMgaXMgcWVtdSwgaXQgd291bGQgYmUgZXZlbiBiZXR0ZXIgaWYKPiA+Pj4geW91
IGNhbiBzaGFyZSBhIHNldHVwL3JlcHJvZHVjdGlvbiBndWlkZS4gSSBoYXZlIGJlZW4gbWVhbmlu
ZyB0byBzZXQgdXAKPiA+Pj4gcWVtdSBmb3IgU1BJIE5PUiB0ZXN0aW5nIGZvciBzb21lIHRpbWUg
bm93LCBidXQgbmV2ZXIgZ290IGFyb3VuZCB0bwo+ID4+PiBmaWd1cmluZyBpdCBvdXQuCj4gPj4+
Cj4gPj4KPiA+PiBJIHN1c3BlY3QgdGhhdCB0aGUgU0ZEUCBkYXRhIGZvciB0aGUgYWZmZWN0ZWQg
Zmxhc2hlcyBpcyBpbmNvcnJlY3QgaW4KPiA+PiBxZW11Lgo+ID4+IFNpbmNlIHRoaXMgaXMgdmVy
eSBsaWtlbHkgYSBxZW11IHByb2JsZW0sIEknbGwganVzdCBjb25maWd1cmUKPiA+PiBkaWZmZXJl
bnQgZmxhc2gKPiA+PiBjaGlwcyB3aGVuIHJ1bm5pbmcgYWZmZWN0ZWQgdGVzdHMuCj4gPj4KPiA+
Cj4gPiBJIHdhcyBhYmxlIHRvIGNvbmZpcm0gdGhlIGFib3ZlLiBUaGlzIGlzIGZyb20gdGhlIGtl
cm5lbCBsb2c6Cj4gPgo+ID4gWyAgICA0LjUwMDAwMF0gc3BpLW5vciBzcGkwLjA6IEJGUFQgcGFy
c2luZyBmYWlsZWQuIFBsZWFzZSBjb25zaWRlcgo+ID4gdXNpbmcgU1BJX05PUl9TS0lQX1NGRFAg
d2hlbiBkZWNsYXJpbmcgdGhlIGZsYXNoCj4gPiBbICAgIDQuNTAwMDAwXSBzcGktbm9yIHNwaTAu
MDogcHJvYmUgd2l0aCBkcml2ZXIgc3BpLW5vciBmYWlsZWQgd2l0aAo+ID4gZXJyb3IgLTIyCj4g
Pgo+Cj4gSXQncyBsaWtlbHkgdGhlIHByb2JsZW0gd2hlcmUgdGhlIHNhbWUgZmxhc2ggSUQgaXMg
dXNlZCBmb3IgZGlmZmVyZW50Cj4gZmxhdm9ycyBvZiBmbGFzaGVzLiBUeXBpY2FsbHkgd2UgZGlm
ZmVyZW50aWF0ZSB0aGUgZmxhdm9ycyBieSBjb21wYXJpbmcKPiB0aGVpciBTRkRQIGRhdGEgYW5k
IHVzZSBwb3N0IFNGRFAgaG9va3MgdG8gYW1lbmQgd2hlcmUgbmVlZGVkLiBJZiBubyBvbmUKPiBj
YXJlcyBhYm91dCBmaXhpbmcgaXQsIHdlIGNhbiB1bmRvIHRoZSBjaGFuZ2UgZm9yIHRoZSBhZmZl
Y3RlZCBmbGFzaCBvcgo+IHJldmVydCB0aGUgcGF0Y2ggZW50aXJlbHkuIENoZW5nPwo+CgpTaW5j
ZSB0aGlzIHBhdGNoIHJlbW92ZWQgdGhlIHNpemUgZmllbGQsIHRoZSBpc3N1ZSBvY2N1cnMgYmVj
YXVzZSB0aGUKInNwaV9ub3JfaW5pdF9wYXJhbXMiIGZ1bmN0aW9uIG5vdyBwcm9jZXNzZXMgdGhl
ICJzcGlfbm9yX3BhcnNlX3NmZHAiCmZ1bmN0aW9uLiBBcyBhIHJlc3VsdCwgdGhlIGVycm9yIGlz
IGxpa2VseSBjYXVzZWQgYnkgYSBwcm9ibGVtIGR1cmluZyB0aGUKU0ZEUCBwYXJzaW5nLCB3aGlj
aCBsZWFkcyB0byB0aGUgZmFpbHVyZSBvZiAic3BpX25vcl9pbml0X3BhcmFtcyIuCgpUaGUgaXNz
dWUgY2FuIGJlIHJlc29sdmVkIGJ5IGFkZGluZyAuc2l6ZSA9IFNaXzMyTSB0byB0aGUgZmxhc2hf
aW5mbyBmb3IKTVgyNUwyNTYzNUUgdG8gcHJldmVudCBmYWlsdXJlcyBjYXVzZWQgYnkgU0ZEUCBw
YXJzaW5nLgoKVGhlIHJvb3QgY2F1c2Ugb2YgdGhpcyBwcm9ibGVtIGxpZXMgaW4gdGhlIGZhaWx1
cmUgb2YgcGFyc2luZyB0aGUgU0ZEUApkYXRhIGZvciB0aGUgZmxhc2gsIHJhdGhlciB0aGFuIGFu
IGlzc3VlIHdpdGggdGhlIHBhdGNoIGl0c2VsZi4gSSBiZWxpZXZlCndlIHNob3VsZCBub3QgcmV2
ZXJ0IHRoaXMgcGF0Y2guCgpUaGFua3MsCkNoZW5nIE1pbmcgTGluCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
