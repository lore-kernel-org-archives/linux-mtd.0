Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FA7EDEC4D
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Sep 2023 12:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J68VHfGpoZrt7wQlfeS/rjdM/KvXgQ3nHdHkNhOKHN4=; b=lsNp86KQVWOh0O
	r0fl3x1Qgu+4VrIudgNuDsbDZPm67Rc4OPTq9+xPEhF2gpClm2X1/iO8BNc64oG4DTAvszfedwTy2
	ykbCVLZuhtQFz3f8WmJfPFCc+rZEDRp1YBN3y3Qkc7D94iT8/P89ew6gExurqoAFUFq02uG1FQN4u
	hTw/206YtGJM3Vu5XJWIR61I8W41733HTUZrGwiJ7HWbFVRoo2st1M54gKTrlfJ4QQJW1MJF9yig9
	QNruYatRaT8hos73hbqb8cdMrTZfkUNwM1hKeKwmNuOHm2DaRk8e9VemRCand1DTpjU4NJksTP9Rn
	D3oSAyKJPcTpwjkV22Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgP9d-005sjF-0V;
	Wed, 13 Sep 2023 12:39:37 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgP9a-005shb-1k
	for linux-mtd@lists.infradead.org;
	Wed, 13 Sep 2023 12:39:35 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-44e86f3e4b6so2243062137.0
        for <linux-mtd@lists.infradead.org>; Wed, 13 Sep 2023 05:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694608772; x=1695213572; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ofo7sSePT/jaZ7VhEZ8Xa5CLpX5xgx/ZwhBkOWdddew=;
        b=raTyuiIlYg+uF4agRn9wZ5EJrUfNzg1R81IHfZA+0Hl9aslcHBeCHP6Q0DiVGdiB2H
         3ORy7MePvgCFI8QQAvMnjEJ2URu1CF5riZXyjv9fLXI1DX08QvJBBOMh8YJ/MCRTtkAF
         RLPUsVtKqhScCB7LKGieofghuF3/QCDMqYxb1eqjrcpsZD6VRDjQxkiMsbmRK1g6La0O
         Q6V9Fx5cJvPMVo8Hx3eZuGpodNNB0Gt7WuyYYY+w/9eHwRkKIZ+FmXL1NI0lMFbg+vpw
         QtoijTtUp1iRXH2lK9EOIoEkVRlStu0GwLZz71DBfHHLMHelu3QlRSgtJVXzx5ZYBzoQ
         xfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694608772; x=1695213572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ofo7sSePT/jaZ7VhEZ8Xa5CLpX5xgx/ZwhBkOWdddew=;
        b=tI5gLuAjjtwuxwnwRIgkKBCSXcx44HaGiB3iElStkvbLHSv+XdoVBNsn1esrnlXRFJ
         cySVLmB5t7iYP/UxQNI7C+xojKd8P2o7MSZzIjMzqPa+L1zoHtP0FE5SgqZQdbC5jRl2
         QX1CHBbAyb+eeiwnrwFIHCg/L14K/DL9lYg+zzrkckCGSJtUgFX5Qhr/8GhhZ0wW4kzi
         7+rDliJ4QeHLSucVRngxbAQlSbQumDJAQlcCvZ7YNDNrlZU7jw6huLN1IIentMKsCGK7
         +gjdJgp35qcfYJzPk6tSNJJ5pUK/U+yVAZGHgCbgo5vO95tHa3hd6FzbciMgpyQRMKO7
         9vbQ==
X-Gm-Message-State: AOJu0YzYs+wShYBdARHxmIAeX4YJkde7RB/nl4Ze7Kcq3qEohkwTkzZ0
	X1WLHFS61tIyKIsTngAqTSmxmIavOEfKfuP6jyqbyw==
X-Google-Smtp-Source: AGHT+IGdKI7ktabjI9KwOzEcCjHAPyvQReZHZJXN4jgvOMDrMNawaWOJWq7y+jd93g3lR7Fo2HZ29IzhmronhGMfaDk=
X-Received: by 2002:a67:fa03:0:b0:447:779b:a357 with SMTP id
 i3-20020a67fa03000000b00447779ba357mr1865242vsq.32.1694608772217; Wed, 13 Sep
 2023 05:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230913115001.23183-1-brgl@bgdev.pl> <20230913115001.23183-4-brgl@bgdev.pl>
 <CACRpkdax-CrB42LeQ1bs3E7VqMncsgEwMs7b_v7J6R5AE+BjAg@mail.gmail.com>
In-Reply-To: <CACRpkdax-CrB42LeQ1bs3E7VqMncsgEwMs7b_v7J6R5AE+BjAg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 13 Sep 2023 14:39:21 +0200
Message-ID: <CAMRc=Mdt0wbjzbwBLK5m--VLV2WE5JybgrNYWXtbinPu_c=psw@mail.gmail.com>
Subject: Re: [PATCH 3/5] mmc: slot-gpio: use gpiod_set_active_[low|high]()
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andy@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Daniel Scally <djrscally@gmail.com>, 
	Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_053934_587003_C957D871 
X-CRM114-Status: GOOD (  21.84  )
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

T24gV2VkLCBTZXAgMTMsIDIwMjMgYXQgMjoyNOKAr1BNIExpbnVzIFdhbGxlaWogPGxpbnVzLndh
bGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIFNlcCAxMywgMjAyMyBhdCAxOjUw
4oCvUE0gQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD4gd3JvdGU6Cj4KPiA+IEZy
b206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4K
PiA+Cj4gPiBXZSBoYXZlIG5ldywgbGVzcyBjdW1iZXJzb21lIGFuZCBjbGVhcmVyIGludGVyZmFj
ZXMgZm9yIGNvbnRyb2xsaW5nIEdQSU8KPiA+IHBvbGFyaXR5LiBVc2UgdGhlbSBpbiB0aGUgTU1D
IGNvZGUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9z
ei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+Cj4gSSBsaWtlIHRoZSBsb29rcyBvZiB0aGUgY29k
ZSBiZXR0ZXIsIG9idmlvdXNseSBidXQgdGhpcyBsb29rcyBsaWtlIHRoaXMgZm9yCj4gYSByZWFz
b24gdW5mb3J0dW5hdGVseS4KPgo+IFNlZSB0aGUgZm9sbG93aW5nIGZyb20KPiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL21tYy1jb250cm9sbGVyLnlhbWw6Cj4KPiAgICMg
Q0QgYW5kIFdQIGxpbmVzIGNhbiBiZSBpbXBsZW1lbnRlZCBvbiB0aGUgaGFyZHdhcmUgaW4gb25l
IG9mIHR3bwo+ICAgIyB3YXlzOiBhcyBHUElPcywgc3BlY2lmaWVkIGluIGNkLWdwaW9zIGFuZCB3
cC1ncGlvcyBwcm9wZXJ0aWVzLCBvcgo+ICAgIyBhcyBkZWRpY2F0ZWQgcGlucy4gUG9sYXJpdHkg
b2YgZGVkaWNhdGVkIHBpbnMgY2FuIGJlIHNwZWNpZmllZCwKPiAgICMgdXNpbmcgKi1pbnZlcnRl
ZCBwcm9wZXJ0aWVzLiBHUElPIHBvbGFyaXR5IGNhbiBhbHNvIGJlIHNwZWNpZmllZAo+ICAgIyB1
c2luZyB0aGUgR1BJT19BQ1RJVkVfTE9XIGZsYWcuIFRoaXMgY3JlYXRlcyBhbiBhbWJpZ3VpdHkg
aW4gdGhlCj4gICAjIGxhdHRlciBjYXNlLiBXZSBjaG9vc2UgdG8gdXNlIHRoZSBYT1IgbG9naWMg
Zm9yIEdQSU8gQ0QgYW5kIFdQCj4gICAjIGxpbmVzLiAgVGhpcyBtZWFucywgdGhlIHR3byBwcm9w
ZXJ0aWVzIGFyZSAic3VwZXJpbXBvc2VkLCIgZm9yCj4gICAjIGV4YW1wbGUgbGVhdmluZyB0aGUg
R1BJT19BQ1RJVkVfTE9XIGZsYWcgY2xlYXIgYW5kIHNwZWNpZnlpbmcgdGhlCj4gICAjIHJlc3Bl
Y3RpdmUgKi1pbnZlcnRlZCBwcm9wZXJ0eSBwcm9wZXJ0eSByZXN1bHRzIGluIGEKPiAgICMgZG91
YmxlLWludmVyc2lvbiBhbmQgYWN0dWFsbHkgbWVhbnMgdGhlICJub3JtYWwiIGxpbmUgcG9sYXJp
dHkgaXMKPiAgICMgaW4gZWZmZWN0Lgo+CgpJIGhhdGUgaXQsIHRoYW5rcy4gOikKCj4gV2lsbCB5
b3Ugc3RpbGwgcHJvdmlkZSB0aGUgZGVzaXJlZCAiZG91YmxlIGludmVyc2lvbiIgYWZ0ZXIgdGhp
cyBwYXRjaD8KPgoKTm90IGluIHRoZSBjdXJyZW50IGZvcm0uIFdvdWxkIGl0IHdvcmsgdG8gZ286
CgppZiAob3ZlcnJpZGVfYWN0aXZlX2xldmVsKSB7CiAgICBpZiAoIShob3N0LT5jYXBzMiAmIE1N
Q19DQVAyX0NEX0FDVElWRV9ISUdIKSkKICAgICAgICBncGlvZF9zZXRfYWN0aXZlX2hpZ2goZGVz
Yyk7CiAgICBlbHNlCiAgICAgICAgZ3Bpb2Rfc2V0X2FjdGl2ZV9sb3coZGVzYyk7Cn0gZWxzZSB7
CiAgICBpZiAoaG9zdC0+Y2FwczIgJiBNTUNfQ0FQMl9DRF9BQ1RJVkVfSElHSCkKICAgICAgICBn
cGlvZF9zZXRfYWN0aXZlX2hpZ2goZGVzYyk7CiAgICBlbHNlCiAgICAgICAgZ3Bpb2Rfc2V0X2Fj
dGl2ZV9sb3coZGVzYyk7Cn0KCj8KCkFsdGVybmF0aXZlbHkgd2UgY291bGQgcmVpbXBsZW1lbnQg
dGhlIHRvZ2dsZSBzZW1hbnRpY3MgbG9jYWxseSBpbiBhCmhlbHBlciBmdW5jdGlvbiBpbiBvcmRl
ciB0byBnZXQgcmlkIG9mIGl0IGZyb20gR1BJT0xJQi4KCkJhcnQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
