Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4C0C79F82
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 15:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tBsaCcITCZmlJnYJDOMPZrQjYAfZSFiNFkLsojh4ND4=; b=uBeerP4AzpD5Ph
	IEWIJkox8kTaNk9ssrdiDo6a/NAeBqD17wrxvpdOaTMvnCN3rN/Ng0pS2ONPqRceqGnTfdxr+/SrG
	GEwMH2A0QnR5RWhRDPM6IQ8fwOUambwQ2gDKD2J+fV0Krmc8McOQzEqKIXvrpeB128FoL+ZzOMify
	IqKoYSS7aRPYUnRtl0Wy3GzwNNVjpHqODdcp8Rk6DSGQaL4RAJac9Y3YESsh+yei4X1/Qr8NKu0ug
	ptcI/Rhl1+Qo/u2ooNtPRaUz2ch42/xQKlR1boY+a5OxdvxNVW74GKIJMI5nqEZxwl2q+zO4u094E
	zvaCJyrsJqqwYL9+597A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Vg3-00000002VME-2V8R;
	Fri, 04 Sep 2026 15:18:03 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Vg0-00000002VLI-03BC
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 15:18:01 +0000
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-98076bb236eso605890241.0
        for <linux-mtd@lists.infradead.org>; Fri, 04 Sep 2026 08:17:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788535078; cv=none;
        d=google.com; s=arc-20260327;
        b=sEyNcJ4uNJyx1gDjCOB+Ne6+qTb5OynZHV/GTuw7McdaPg1RhGOkuvB8YgxUyKDZph
         WOJ6QQm+VuzBqMHni+PRYNcvsiwR+zJzpd6H9RXR86mB910xMlaYbV44EARCCn5C+aAC
         GMyyhCQzdleIMaCfc/dci24gRsExCTyel8WIJmPFnPk+AUvZEGO3hh+7sa8110VtltgK
         iMccQRRDqBqtaI2DTO/EtdG38ja4nA3cDxBu12Gyr+kcwedm1kP4oH/UUlku79lA8rPi
         Qjl7/67BSu+Gd15SmVzYi0Igrsz2GklsK3srr+BeE0Bqj/hXsVrPyYlaiIAE/J/+cfzB
         CP7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a8IcWix8i7C0DIMMGLJFWrwznvm95cLdWDVTqjuXB24=;
        fh=PKdxQMWJNFGMqkO3XjHIczXsXgyitxLbEhynKaebggs=;
        b=URKXrgiEP5BQ76LZmBnuuYqGa0e/hYbdh1vy7tH9cBk+wBwojm51pMrE7ojtPMPfJG
         7GEI8Ggr/zw8wom2OracSfzcSIZEXRKJMFWClQ1rnch9ZTaxhVYZQP75OHJ8EHzcL5HF
         LFj+BCnU3e4R9P8R737op/8BCfZNzFL/PyR4qywTuYvdewh+cW7S7CX16zNCKiSDJXJN
         x7RQzt9HTNbSm+EYVhCKDKojQUShcvUN4cp68BY3np6UvW+In2Dg+NMQvrQNu9L1uIA2
         6gr6VUPuJ4RS5h3nSpXtlMBJfaJaxJyQC5JysJJm3fuvwupyphKSOj92nE/1mNAKl/bN
         IEkA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788535078; x=1789139878; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a8IcWix8i7C0DIMMGLJFWrwznvm95cLdWDVTqjuXB24=;
        b=iIgWB9296UJagOFCdA4q2soNPOeMV3M/KOUIVStiSXn9Onn4xPs21zDUIetwtDQXt7
         SRQyn6zKxzK0/KfRzE65HTgPPIk49JycQhmQZMJAZN7wm7IVZpqL/EkPS1OPxc+3re0V
         xOUyRn9vyN9f5w2rxyI2ENqxWyqYKts1d0aI4+vu30EdwfcDe92UMyXvBjU9omLrTatp
         19Cb/8540MauI2gnpuZT4w95cFKHvHfAeMuz/lNUsHbLrRiWXBd9wH4EYVZYiXoA5p+K
         UXo5WhXQAIIsyUSxHGKrECNoKhsagELY64fZ7Y8z76ByXXDRxxqbUv5I4RkGKqgO5mgM
         x9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788535078; x=1789139878;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a8IcWix8i7C0DIMMGLJFWrwznvm95cLdWDVTqjuXB24=;
        b=kyTYTFh2ZUkscJJW8OTbEWn9kjXf/jXlCiIMu3FJkFDxcBp5Br9fDXIYnN3FAsjmhU
         NC4xcqyZ0FbKwL3QOezVi+1vwI1pGPA66JrTSs6HycOx5CsjqU2tGArQQd0RhSk47jpn
         Rq5rmbo1DUOBXlteG7mW1pYhRPOjFQ+hnqnPcdaoy6mnETynU1idHPSwXfpDvYL9mWOS
         h4cnLT514Ae4tuQhqp3JFkPChju1of6lvw+JNpIjiXjHUKOzvsjWZyTbSaj8cSRY6Lll
         TyiLtEot+Vvh8Io2w6jHd0yoTspQiYfve5AjljR00s2FzEARoCKvEP/lKzNCBVQ3nIoo
         QGnw==
X-Forwarded-Encrypted: i=1; AKwUvByEgvghZBuNZeB5T5HRudfeXPFX3uQ/gRaYskjP4kzf/DBb8mIC41lLCXnISNis7qhmaYtdal8R248=@lists.infradead.org
X-Gm-Message-State: AFuF++mTWjf+EMz4ksmh3NQ6rf0hoZ6nCpi6yro/P+K6AE8u/3wII8Fz
	MZebk3FQgAx1BxNA2zE5ZHPZQ3KRPFzmOXJfN1pqKQc3WkXAq0r4ODxzUVRprHLMPyKdJhBcIAB
	D4YhSOQbD18rZNLXTlPuR8TtdRaGzTB4=
X-Gm-Gg: AYBFou0g/4ovdJ+44MfnUZj6UaPYD0YZL0bB04OtaE0eTohMgMax5tNq5byLW4aiCJY
	MC4NShiOxsomn7XR6uvjZ2IpVvdDDCN8rZvgv8o3LYqhkwTXuGOnkw5mWB/oskI20CxKc+bG8MF
	6k5QKC3neXN3StQzaNb4vYKnXsQHIa848VLKYdj/lLaw15GTs2hV1OpudK3L8TQYYWMyG1zylDb
	t7uI00eLkCRmJShbm8+a9f6AyctnKIj0cvWtQh1GMKjWnYdRNdEnwtz7KFu/fcfI2YqBN4MP7au
	Lp4U/qFQiLNAmcDQr+nmphBzjRC/owr1eXyZZ+ZGFrKXdjzpmp7RGlhKVUp1aKZ7uH6LQ5+8eMA
	J1Hx+dRS7sDOIJNMvPRni2WVoub23dQIGnVf0pU9EAmSladEjAuq1RDM8y/irG8F/LzyENOrhS+
	MJ3ZY1t8GOBaHT9AFQna5G3IAm642llyEuL2tqV079bwzNysRqBQ==
X-Received: by 2002:a05:6102:80a9:b0:786:4822:308f with SMTP id
 ada2fe7eead31-78a4a9aea5fmr2343885137.13.1788535077663; Fri, 04 Sep 2026
 08:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
 <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-2-463853a14ad9@gmail.com> <87se3p13jy.fsf@bootlin.com>
In-Reply-To: <87se3p13jy.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 4 Sep 2026 11:17:46 -0400
X-Gm-Features: AcwNN1UP0lhDRhRnmSbud-UU5EERiros9_WN1FPXC7f3fDYdM3_vq5pk0G9NwE0
Message-ID: <CADvTj4oW8Hxv_b5vWM5pbeB3wEO-WoqhLwyinCTFPNR6wTHYmQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: sunxi: support randomized OOB formats
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_081800_053111_193A345A 
X-CRM114-Status: GOOD (  20.05  )
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

T24gRnJpLCBTZXAgNCwgMjAyNiBhdCA4OjQy4oCvQU0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBPbiAxMC8wOC8yMDI2IGF0IDE3OjA0OjUwIC0w
NiwgSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4g
PiBUaGUgY29udHJvbGxlciByYW5kb21pemVyIGNvdmVycyB0aGUgYmFkIGJsb2NrIG1hcmtlciBh
bG9uZyB3aXRoIHRoZQo+ID4gcmVzdCBvZiB0aGUgT09CIGRhdGEuIFRoZSBkcml2ZXIgY3VycmVu
dGx5IGNvbXBlbnNhdGVzIHRoZSBtYXJrZXIgYnl0ZXMKPiA+IGJlZm9yZSB3cml0ZXMgYW5kIGFm
dGVyIHJlYWRzIHNvIHRoYXQgdGhleSByZW1haW4gcGxhaW4gb24gZmxhc2guCj4gPgo+ID4gQWxs
d2lubmVyIE5BTkQgZmlybXdhcmUgaW5zdGVhZCBzdG9yZXMgdGhlIG1hcmtlciB0aHJvdWdoIHRo
ZQo+ID4gcmFuZG9taXplci4gTWVkaWEgdXNpbmcgdGhhdCBmb3JtYXQgYXBwZWFycyB0byBjb250
YWluIGJhZCBibG9ja3MgdW5sZXNzCj4gPiB0aGUgcmFuZG9taXplciBpcyBlbmFibGVkIHdoaWxl
IHJlYWRpbmcgdGhlIG1hcmtlci4KPiA+Cj4gPiBIb25vciB0aGUgYWxsd2lubmVyLHJhbmRvbWl6
ZWQtb29iIHByb3BlcnR5IGJ5IHVuY29uZGl0aW9uYWxseSBlbmFibGluZwo+ID4gcGFnZSBzY3Jh
bWJsaW5nIGFuZCBsZWF2aW5nIHRoZSBtYXJrZXIgaW4gdGhlIHJhbmRvbWl6ZXIgZGF0YSBzdHJl
YW0uCj4gPiBLZWVwIHRoZSBleGlzdGluZyBwbGFpbiBtYXJrZXIgYmVoYXZpb3Igd2hlbiB0aGUg
cHJvcGVydHkgaXMgYWJzZW50Lgo+ID4gVGhpcyBjaGFuZ2VzIG1hcmtlciBoYW5kbGluZyBvbiBh
bGwgc3VwcG9ydGVkIGNvbnRyb2xsZXJzOyB0aGUgSDYvSDYxNgo+ID4gcHJvdGVjdGVkIHVzZXIt
ZGF0YSBwbGFjZW1lbnQgaXMgaGFuZGxlZCBzZXBhcmF0ZWx5Lgo+Cj4gQnV0IEkgdGhpbmsgdGhl
IHJlYXNvbiB3aHkgdGhpcyBoYXMgbmV2ZXIgYmVlbiBkb25lIGlzIGJlY2F1c2UgaXQganVzdAo+
IGJyZWFrcyByYXcgYWNjZXNzZXMsIGluY2x1ZGluZyB0aGUgQkJUIHJlYWRzLiBJIGRvbid0IHRo
aW5rIHRoaXMgaXMKPiBoYW5kbGVkLCBpcyBpdD8KCkZyb20gbXkgdW5kZXJzdGFuZGluZyByYXcg
YWNjZXNzIGJ5cGFzc2VzIHJhbmRvbWl6YXRpb24gZW50aXJlbHkuCgpXaGVuIHdyaXRpbmcgdGhl
IFNQTCh3aGljaCBkb2VzIG5vdCB1c2UgdGhlIHNhbWUgbGF5b3V0KSB3ZSB1c2UgYQpwcmUtcmFu
ZG9taXplZCBpbWFnZS4KCj4KPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
