Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69B1E810CE
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Sep 2023 11:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z1bXIhU0/HT4u62nn+HaBsQ+CkwuHnV2q3VesDHnh7I=; b=T7cBLXw+FqvlyB
	krNrZKrFXGvbVKGa1Y+mScvSL/K8bi2F6QyLqWSSU1GPUuGzexGArvZejiG27GAHEREakD6u2hVrC
	Bja5Gqt7fnBe0vZdSlBaXhfCvc/zIUlScPmjsMARiFyuJpNXkHhmspXaBvqrUhJ2pLpOrTrdmaqJ9
	yqcy8sB+Sno0Bp4Sa4mQEmSDhe9sPVFSqvjB+4LchpCTYDZo8YLymaqQzp3degE8O4OcAwVu4dzJy
	VeaCu+i6osvhT/YpEycfobCqTyUeRzEd8p/9Pk/WiO2SQisE/pz15/kBUqABLqLhSjqryERBsNLSE
	lU84oOWeUqgbRxAxrd4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlSWN-000n6n-16;
	Wed, 27 Sep 2023 11:15:59 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlSWK-000n5J-1G
	for linux-mtd@lists.infradead.org;
	Wed, 27 Sep 2023 11:15:57 +0000
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-7a8b839fc0aso3340485241.3
        for <linux-mtd@lists.infradead.org>; Wed, 27 Sep 2023 04:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695813351; x=1696418151; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVfAkzwv7s6SJ5GID4gdrqme1d05OJyLXXoD6QHFoE8=;
        b=W1Rh8FWzrTRgTDz+7JSSCPt+Csd7uFZ8hcQbuQ+voqRT6mLxs68LCkzHIp1YmDBnA6
         K47va06jf3UbqUgq04P3+ZnnRELLyR6WCE3QuGD10jDXgc9v+hFTYrXllzXcuBzi9DOz
         QEFrqHzUl9w+TLC+UN3czntSj48mtlxZbk+/rARx0X+wtD4xQHuk83ddzXP2iUnLtD3e
         y95u2OuszuTix85Dc7rpV9JpL4ebCEFJdzWds9UI642BroYd4uittN9E6+IrrAXoGQ23
         bZAtEwy2PyE991kPbWH2X3+OMdzW8+HY2cXjUCJy0/xYh+NtBzpuG20aCW6IZYaP8Ojf
         vsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695813351; x=1696418151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qVfAkzwv7s6SJ5GID4gdrqme1d05OJyLXXoD6QHFoE8=;
        b=Aq7QyTE/cQKLyRk6tjZk8VrWvARz6J1DVYECOGpM1Y/XuqBbjU2NPB7DAnMJDvvZBl
         Bi6zH+i9I8WQrVGxNJzvclYQRjFutvmwjByoXrN2UZzbkT4GXpN6MHB5DQp+eeoHBGax
         M11n7KLELl4V8kThKHEkGOJowk1gUFvecJ0JLOfPOMWOmfmh80D4uvCkjvYkyna8bNHZ
         x9CZBha/3ec/Bzidhp7niHRMVtH1C8NlQ6PwqrSpzsTTNHLqlHDhei97RnTYpYoxgvll
         /v+1de2jS3z0AF4ld5XMKmsdhCUIOR7Tglc2wVVT1885wzkyrcHaTbgZWVSlE1w8tMUD
         i5WQ==
X-Gm-Message-State: AOJu0Yyw9UKEFjcVKigEXfKb1qArvdECpwJwz7wx0Ll0lpeEzjvBjTqR
	OVT8bcAeqpCWDCivS/m2N3jaSuIpLdobGbHJ1ntNpw==
X-Google-Smtp-Source: AGHT+IHymKUFP4V3u5zhIDCTbBIqfdNCPcdLUQ8dxI2lTBCq3GJGEzPmhnfIbSU1Z5436i/FSr8W7g7HAbyWn6VcKok=
X-Received: by 2002:a67:fa05:0:b0:44d:3d29:4940 with SMTP id
 i5-20020a67fa05000000b0044d3d294940mr1020879vsq.35.1695813351573; Wed, 27 Sep
 2023 04:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230926090623.35595-1-brgl@bgdev.pl>
In-Reply-To: <20230926090623.35595-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 27 Sep 2023 13:15:40 +0200
Message-ID: <CAMRc=MdAZEGWDK5O5siAsub3qjhx0-MAgzrt6E_eR1rFdBfAFg@mail.gmail.com>
Subject: Re: [RFT PATCH] mtd: rawnand: ingenic: move the GPIO quirk to gpiolib-of.c
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-mips@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_041556_429388_B59A7575 
X-CRM114-Status: GOOD (  24.02  )
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

T24gVHVlLCBTZXAgMjYsIDIwMjMgYXQgMTE6MDbigK9BTSBCYXJ0b3N6IEdvbGFzemV3c2tpIDxi
cmdsQGJnZGV2LnBsPiB3cm90ZToKPgo+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRv
c3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4KPgo+IFdlIGhhdmUgYSBzcGVjaWFsIHBsYWNlIGZv
ciBPRiBwb2xhcml0eSBxdWlya3MgaW4gZ3Bpb2xpYi1vZi5jLiBMZXQncwo+IG1vdmUgdGhpcyBv
dmVyIHRoZXJlIHNvIHRoYXQgaXQgZG9lc24ndCBwb2xsdXRlIHRoZSBkcml2ZXIuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFy
by5vcmc+Cj4gLS0tCj4gVGhpcyBpcyBhbiBhbHRlcm5hdGl2ZSB0byB0aGUgcHJldmlvdXMgcGF0
Y2ggdGhhdCBpbnN0ZWFkIG9mIHJlcGxhY2luZwo+IG9uZSBhY3RpdmUtbG93IHNldHRlciB3aXRo
IGFub3RoZXIsIGp1c3QgbW92ZXMgdGhlIHF1aXJrIG92ZXIgdG8KPiBncGlvbGliLW9mLmMKPgo+
ICBkcml2ZXJzL2dwaW8vZ3Bpb2xpYi1vZi5jICAgICAgICAgICAgICAgICAgICAgICB8ICA5ICsr
KysrKysrKwo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfbmFuZF9kcnYu
YyB8IDEyIC0tLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwg
MTIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncGlvL2dwaW9saWItb2Yu
YyBiL2RyaXZlcnMvZ3Bpby9ncGlvbGliLW9mLmMKPiBpbmRleCA1NTE1ZjMyY2YxOWIuLjU4YzBi
YmU5ZDU2OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpb2xpYi1vZi5jCj4gKysrIGIv
ZHJpdmVycy9ncGlvL2dwaW9saWItb2YuYwo+IEBAIC0xOTIsNiArMTkyLDE1IEBAIHN0YXRpYyB2
b2lkIG9mX2dwaW9fdHJ5X2ZpeHVwX3BvbGFyaXR5KGNvbnN0IHN0cnVjdCBkZXZpY2Vfbm9kZSAq
bnAsCj4gICAgICAgICAgICAgICAgICAqLwo+ICAgICAgICAgICAgICAgICB7ICJoaW1heCxoeDgz
NTciLCAgICAgICAiZ3Bpb3MtcmVzZXQiLCAgZmFsc2UgfSwKPiAgICAgICAgICAgICAgICAgeyAi
aGltYXgsaHg4MzY5IiwgICAgICAgImdwaW9zLXJlc2V0IiwgIGZhbHNlIH0sCj4gKyAgICAgICAg
ICAgICAgIC8qCj4gKyAgICAgICAgICAgICAgICAqIFRoZSByYi1ncGlvcyBzZW1hbnRpY3Mgd2Fz
IHVuZG9jdW1lbnRlZCBhbmQgcWksbGI2MCAoYWxvbmcgd2l0aAo+ICsgICAgICAgICAgICAgICAg
KiB0aGUgaW5nZW5pYyBkcml2ZXIpIGdvdCBpdCB3cm9uZy4gVGhlIGFjdGl2ZSBzdGF0ZSBlbmNv
ZGVzIHRoZQo+ICsgICAgICAgICAgICAgICAgKiBOQU5EIHJlYWR5IHN0YXRlLCB3aGljaCBpcyBo
aWdoIGxldmVsLiBTaW5jZSB0aGVyZSdzIG5vIHNpZ25hbAo+ICsgICAgICAgICAgICAgICAgKiBp
bnZlcnRlciBvbiB0aGlzIGJvYXJkLCBpdCBzaG91bGQgYmUgYWN0aXZlLWhpZ2guIExldCdzIGZp
eCB0aGF0Cj4gKyAgICAgICAgICAgICAgICAqIGhlcmUgZm9yIG9sZGVyIERUcyBzbyB3ZSBjYW4g
cmUtdXNlIHRoZSBnZW5lcmljIG5hbmRfZ3Bpb193YWl0cmR5KCkKPiArICAgICAgICAgICAgICAg
ICogaGVscGVyLCBhbmQgYmUgY29uc2lzdGVudCB3aXRoIHdoYXQgb3RoZXIgZHJpdmVycyBkby4K
PiArICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAgIHsgInFpLGxiNjAiLCAgICAg
ICAgICAgICJyYi1ncGlvcyIsICAgICB0cnVlIH0sCj4gICNlbmRpZgo+ICAgICAgICAgfTsKPiAg
ICAgICAgIHVuc2lnbmVkIGludCBpOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9pbmdlbmljL2luZ2VuaWNfbmFuZF9kcnYuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2luZ2Vu
aWMvaW5nZW5pY19uYW5kX2Rydi5jCj4gaW5kZXggNjc0ODIyNmI4YmQxLi5jODE2ZGMxMzcyNDUg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9pbmdlbmljX25hbmRf
ZHJ2LmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfbmFuZF9k
cnYuYwo+IEBAIC0zODAsMTggKzM4MCw2IEBAIHN0YXRpYyBpbnQgaW5nZW5pY19uYW5kX2luaXRf
Y2hpcChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAo+ICAgICAgICAgICAgICAgICByZXR1
cm4gcmV0Owo+ICAgICAgICAgfQo+Cj4gLSAgICAgICAvKgo+IC0gICAgICAgICogVGhlIHJiLWdw
aW9zIHNlbWFudGljcyB3YXMgdW5kb2N1bWVudGVkIGFuZCBxaSxsYjYwIChhbG9uZyB3aXRoCj4g
LSAgICAgICAgKiB0aGUgaW5nZW5pYyBkcml2ZXIpIGdvdCBpdCB3cm9uZy4gVGhlIGFjdGl2ZSBz
dGF0ZSBlbmNvZGVzIHRoZQo+IC0gICAgICAgICogTkFORCByZWFkeSBzdGF0ZSwgd2hpY2ggaXMg
aGlnaCBsZXZlbC4gU2luY2UgdGhlcmUncyBubyBzaWduYWwKPiAtICAgICAgICAqIGludmVydGVy
IG9uIHRoaXMgYm9hcmQsIGl0IHNob3VsZCBiZSBhY3RpdmUtaGlnaC4gTGV0J3MgZml4IHRoYXQK
PiAtICAgICAgICAqIGhlcmUgZm9yIG9sZGVyIERUcyBzbyB3ZSBjYW4gcmUtdXNlIHRoZSBnZW5l
cmljIG5hbmRfZ3Bpb193YWl0cmR5KCkKPiAtICAgICAgICAqIGhlbHBlciwgYW5kIGJlIGNvbnNp
c3RlbnQgd2l0aCB3aGF0IG90aGVyIGRyaXZlcnMgZG8uCj4gLSAgICAgICAgKi8KPiAtICAgICAg
IGlmIChvZl9tYWNoaW5lX2lzX2NvbXBhdGlibGUoInFpLGxiNjAiKSAmJgo+IC0gICAgICAgICAg
IGdwaW9kX2lzX2FjdGl2ZV9sb3cobmFuZC0+YnVzeV9ncGlvKSkKPiAtICAgICAgICAgICAgICAg
Z3Bpb2RfdG9nZ2xlX2FjdGl2ZV9sb3cobmFuZC0+YnVzeV9ncGlvKTsKPiAtCj4gICAgICAgICBu
YW5kLT53cF9ncGlvID0gZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwoZGV2LCAid3AiLCBHUElPRF9P
VVRfTE9XKTsKPgo+ICAgICAgICAgaWYgKElTX0VSUihuYW5kLT53cF9ncGlvKSkgewo+IC0tCj4g
Mi4zOS4yCj4KClF1ZXVlZCBmb3IgdjYuNy4KCkJhcnRvc3oKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
