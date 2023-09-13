Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE572EE020D
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Sep 2023 20:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=neUTbxS4kJp5g2rqA7OKybTNF38AJaqVikHOtR0CIUM=; b=xryXl4avKEuSFr
	SNuQEQIA/CkoroyJHgyBWG4Q1uidbA2c3OCyJLGhkI36KBDJ9xx6hmOQaJSwE3G1ohACIf2hQc/br
	nuGEeLRvX4wvFk3Y3aNxjXAYzkzsoJ+b62Vb3qfjuSTpILtCeGWVKMQnYCwqrxR3ugWNM3jaHQhfP
	Qn0rUqAVx3y8fOT9UqoPdxa82DDYOmVJrDMnjzbxqLHVQO8Q7GNCXEzk0D6FOp6uYGzIbWIoKg/IZ
	vuOdIg+LZ/redEqVsKFrEV14K2AlmD4m4Vf0GuTA9fu2KnMOK+Y0F9LIg+kY2EGcIDdgtTMTTcNMl
	tOerffGYBKEa90cqsnxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgWEe-006f14-08;
	Wed, 13 Sep 2023 20:13:16 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgWEZ-006eyF-1O
	for linux-mtd@lists.infradead.org;
	Wed, 13 Sep 2023 20:13:13 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d7f0048b042so227177276.2
        for <linux-mtd@lists.infradead.org>; Wed, 13 Sep 2023 13:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694635972; x=1695240772; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Su1HKHhLigyzqYlZO3Q6GiJPuDvWadoF+8eJgSHSJSM=;
        b=l2h0dXg0KOhR66osGrwZMAu1Q6J6Lsz4rJqbs5NVZ6y77+I6nHsxMtC1XYjqU40WHV
         sLqwBEyRrVYJ1WT+9UT4ki6CO5q34+IdRYOfRVvbnWtwXTrK0aHdbszR+LJEBpBKdOlX
         fi3DviKlhUlEmuqaq4f+w2yl6912Y8QjM8Gh7ijLWPi84Lagqp5vjLiHYBDXX2gwiXyI
         17b6+f5FLJ2VY18VfGqsgU/bqoeqPXJPgasuL71KtVyIQp6Ei81vPbuQ/qtU8OnokwO2
         R5TQysh+LGdgJNC277ybPvqG42vmPIoOSjuYMsR1Ln+263vhzL/SN1DHNlTmUl6eL+O5
         OWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694635972; x=1695240772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Su1HKHhLigyzqYlZO3Q6GiJPuDvWadoF+8eJgSHSJSM=;
        b=M0OiW1gkjbOyKmd6pARHX8C5pnMF1apNqq0xveI0TPmYmNqsaOUxeAZ3YYjFfkuJPu
         HbzDvUek1vwtSHTdwLgwV08QxvqFj1glxqaaQtyFP7kKLHDKCwEMs/Ut41CjRxEWDLQo
         HGUCETy1MKYGkouDb7A9hA3U6YqAQWYO8RnYMfuECFzqb9ZEs+PnUsqyzrADL0neal48
         xwNFlAyWgPtMMS9anNiLTE3xYL6W9UzIvwlokhEpLMiLJWsH7eeIPDWnuL0NcBI3mj4e
         iSRqd4rzTGdlrfieVQRw9ZaSe7A3mD+On8IjbKdV3Fi85PQ8dUWSvCsY2I6B8q9DZCpJ
         A6oQ==
X-Gm-Message-State: AOJu0YyCCFiO/Ojdo5NwslyZi5P7YukIY6H8AiLREhrVUn8Rx40WclNe
	WMT0c7AoySo5vtf9WnnpcJvqQvTwfkJUSxVWc/5Rug==
X-Google-Smtp-Source: AGHT+IGNdHiKi9h+VMupJWAnl7lkQjZz2lyGhzlQ4y/m/GOS5wCeU4E04eoE42Ydser353023glv4MnCjnMPMHjH7ys=
X-Received: by 2002:a25:d246:0:b0:d81:6a54:48f0 with SMTP id
 j67-20020a25d246000000b00d816a5448f0mr2205331ybg.22.1694635972595; Wed, 13
 Sep 2023 13:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230913115001.23183-1-brgl@bgdev.pl> <20230913115001.23183-3-brgl@bgdev.pl>
 <CAHp75Ve8aK4Pfid1JYWH86mKy-Zb-G2QDPrJYmRzPCYOsn1TqQ@mail.gmail.com>
In-Reply-To: <CAHp75Ve8aK4Pfid1JYWH86mKy-Zb-G2QDPrJYmRzPCYOsn1TqQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Sep 2023 22:12:40 +0200
Message-ID: <CACRpkdYtYDJa6fo6RnizHNzUsyazBQxEaNMznaij8rBF4ie+ew@mail.gmail.com>
Subject: Re: [PATCH 2/5] mtd: rawnand: ingenic: use gpiod_set_active_high()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
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
X-CRM114-CacheID: sfid-20230913_131311_467221_A05C79EA 
X-CRM114-Status: GOOD (  14.24  )
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

T24gV2VkLCBTZXAgMTMsIDIwMjMgYXQgMTA6MDXigK9QTSBBbmR5IFNoZXZjaGVua28KPGFuZHku
c2hldmNoZW5rb0BnbWFpbC5jb20+IHdyb3RlOgo+IE9uIFdlZCwgU2VwIDEzLCAyMDIzIGF0IDI6
NTDigK9QTSBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPiB3cm90ZToKPiA+Cj4g
PiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5v
cmc+Cj4gPgo+ID4gVXNlIHRoZSBuZXcsIGxlc3MgY3VtYmVyc29tZSBpbnRlcmZhY2UgZm9yIHNl
dHRpbmcgdGhlIEdQSU8gYXMKPiA+IGFjdGl2ZS1oaWdoIHRoYXQgZG9lc24ndCByZXF1aXJlIGZp
cnN0IGNoZWNraW5nIHRoZSBjdXJyZW50IHN0YXRlLgo+Cj4gLi4uCj4KPiA+ICAgICAgICAgICog
aGVyZSBmb3Igb2xkZXIgRFRzIHNvIHdlIGNhbiByZS11c2UgdGhlIGdlbmVyaWMgbmFuZF9ncGlv
X3dhaXRyZHkoKQo+ID4gICAgICAgICAgKiBoZWxwZXIsIGFuZCBiZSBjb25zaXN0ZW50IHdpdGgg
d2hhdCBvdGhlciBkcml2ZXJzIGRvLgo+ID4gICAgICAgICAgKi8KPiA+IC0gICAgICAgaWYgKG9m
X21hY2hpbmVfaXNfY29tcGF0aWJsZSgicWksbGI2MCIpICYmCj4gPiAtICAgICAgICAgICBncGlv
ZF9pc19hY3RpdmVfbG93KG5hbmQtPmJ1c3lfZ3BpbykpCj4gPiAtICAgICAgICAgICAgICAgZ3Bp
b2RfdG9nZ2xlX2FjdGl2ZV9sb3cobmFuZC0+YnVzeV9ncGlvKTsKPiA+ICsgICAgICAgaWYgKG9m
X21hY2hpbmVfaXNfY29tcGF0aWJsZSgicWksbGI2MCIpKQo+ID4gKyAgICAgICAgICAgICAgIGdw
aW9kX3NldF9hY3RpdmVfaGlnaChuYW5kLT5idXN5X2dwaW8pOwo+Cj4gV2h5IG5vdCBtb3Zpbmcg
dGhpcyBxdWlyayB0byBncGlvbGliLW9mLmM/CgpUaGF0J3MgYSBiZXR0ZXIgaWRlYSBoZXJlIEkg
dGhpbmssIGl0J3MgY2xlYXJseSBhIHF1aXJrIGZvciBhCmJ1Z2d5IGRldmljZSB0cmVlLgoKWW91
cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
