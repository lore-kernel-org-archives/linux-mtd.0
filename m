Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485BDEE0207
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Sep 2023 20:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oLSUuvX4DusSwUQe9jjmveS9gXiU3uJwasT12ad489w=; b=RCxx+CqJ0823x1
	DNCj7f4ZNjKgllEym2/Hrqhxov1fhLUxkv3irH7xtLopovD9rEguj41mUmEHru65WIx5VTnHVLknc
	ud7KRzB4utlqcrQj9Tj6DE5u8eVmbnoXNsBprt0vhYsTS+YNReG8Znc9eJtGIrn+kvg/9nLPW84rI
	GfG1XUmc4/67rfC6m9aByv+tFuHcUFzJrWlGzLqVkaXjoJ2SnEKgeY5IW1cZ+4Xsx9J1NmmJ0SRT0
	eXhnD0YefqnR1UMZ+ehsEwduLP98aSrSkjDI5uezSFVPb0FLeC36cF4XqpkCNYEDyQeK+pq+AHp0A
	tjJr2z1fwn9auKzLBdXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgW7a-006eey-18;
	Wed, 13 Sep 2023 20:05:58 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgW7X-006eeM-2A
	for linux-mtd@lists.infradead.org;
	Wed, 13 Sep 2023 20:05:56 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-573429f5874so157459eaf.0
        for <linux-mtd@lists.infradead.org>; Wed, 13 Sep 2023 13:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694635553; x=1695240353; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgnusj9WNYseansm6Kr1sUnhgtykfnbfz9TfjOoUKuQ=;
        b=csBiOTKuswq1OBB1dW3Lo6zhCc2x5ct+6qM9EH+55c1vkf4gkw2nQrs5hTcEOhZCY9
         IRKJiKUW1EIRNlpuR2pAeR5U0YAHLP7mX9JDY0c9sRsDUsce0Oao8w/iteKYsYOVKHa4
         yorLc3NbEaPk/Y+J6KWFcG59pewhnblQNh+bFEDGsRruo4ez8GFVEtagnlpMdrAUXyWT
         c5vkcX+vRvzhrXfR++zs/rigeLZxP5eOQSPhlJFfPTq8OPoZFiUVwBNjQoWVgiAD7uv5
         Rg7UsEobbLh0QW1oREZTSZg0HDQmZ4mjJ5j4jpUbp6JIoHSZPHL1Iaibsxew4KZpQPIi
         Wfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694635553; x=1695240353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mgnusj9WNYseansm6Kr1sUnhgtykfnbfz9TfjOoUKuQ=;
        b=CeCxqHDOYt5WkDxCIeTwWsen0QnuFkDCX3NWHmZy86LH21BzZyJAhLCAURqt6QzJqG
         byD94u7Xr2S/o/BheXoFWzkftNYdGitY1yQOdDhqpD3QpqH1LSpM0LhU/Q5Nszmv/8wJ
         kUdkKVU3A73q+UG94i2ENmkbznuJu9uYeMjxswvjvg7zja7rtdnddaC/aTnutjtTOrOg
         vZ874mAorp8YUUvutJx/3A8UZjrAwkhXSfqXL1jiSYYH4+m3NT+TkBSwEzSWT1u4aINj
         xoGBeFyQMX7xHs6aH6WgOlCGUO3KLiXeblik8aQlcxkOT8BMWgDdvCMbHskqTrXVONxp
         KK4g==
X-Gm-Message-State: AOJu0YwRWw7/h49B9RzamAoDNKmGQf4XSFeXxx8MDUfz0b80GTa/awYK
	jUsaUOXjbTVAK+JGAMtPbxDwSuImNlpHzWkWD0o=
X-Google-Smtp-Source: AGHT+IHLm6apn4O09uKTNNT9VekVtTLxkHf0LthInAJoGoVn7WoUR/7/0i7XlogpEbA/UKANyFR7+IGCoBQWnFUT1bg=
X-Received: by 2002:a05:6870:90d5:b0:1c1:e6da:f88d with SMTP id
 s21-20020a05687090d500b001c1e6daf88dmr3607766oab.56.1694635553050; Wed, 13
 Sep 2023 13:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230913115001.23183-1-brgl@bgdev.pl> <20230913115001.23183-3-brgl@bgdev.pl>
In-Reply-To: <20230913115001.23183-3-brgl@bgdev.pl>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 13 Sep 2023 23:05:16 +0300
Message-ID: <CAHp75Ve8aK4Pfid1JYWH86mKy-Zb-G2QDPrJYmRzPCYOsn1TqQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] mtd: rawnand: ingenic: use gpiod_set_active_high()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Paul Cercueil <paul@crapouillou.net>, 
	Harvey Hunt <harveyhuntnexus@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Daniel Scally <djrscally@gmail.com>, 
	Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_130555_710250_D600DF3B 
X-CRM114-Status: GOOD (  11.25  )
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

T24gV2VkLCBTZXAgMTMsIDIwMjMgYXQgMjo1MOKAr1BNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAYmdkZXYucGw+IHdyb3RlOgo+Cj4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9z
ei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+Cj4gVXNlIHRoZSBuZXcsIGxlc3MgY3VtYmVyc29t
ZSBpbnRlcmZhY2UgZm9yIHNldHRpbmcgdGhlIEdQSU8gYXMKPiBhY3RpdmUtaGlnaCB0aGF0IGRv
ZXNuJ3QgcmVxdWlyZSBmaXJzdCBjaGVja2luZyB0aGUgY3VycmVudCBzdGF0ZS4KCi4uLgoKPiAg
ICAgICAgICAqIGhlcmUgZm9yIG9sZGVyIERUcyBzbyB3ZSBjYW4gcmUtdXNlIHRoZSBnZW5lcmlj
IG5hbmRfZ3Bpb193YWl0cmR5KCkKPiAgICAgICAgICAqIGhlbHBlciwgYW5kIGJlIGNvbnNpc3Rl
bnQgd2l0aCB3aGF0IG90aGVyIGRyaXZlcnMgZG8uCj4gICAgICAgICAgKi8KPiAtICAgICAgIGlm
IChvZl9tYWNoaW5lX2lzX2NvbXBhdGlibGUoInFpLGxiNjAiKSAmJgo+IC0gICAgICAgICAgIGdw
aW9kX2lzX2FjdGl2ZV9sb3cobmFuZC0+YnVzeV9ncGlvKSkKPiAtICAgICAgICAgICAgICAgZ3Bp
b2RfdG9nZ2xlX2FjdGl2ZV9sb3cobmFuZC0+YnVzeV9ncGlvKTsKPiArICAgICAgIGlmIChvZl9t
YWNoaW5lX2lzX2NvbXBhdGlibGUoInFpLGxiNjAiKSkKPiArICAgICAgICAgICAgICAgZ3Bpb2Rf
c2V0X2FjdGl2ZV9oaWdoKG5hbmQtPmJ1c3lfZ3Bpbyk7CgpXaHkgbm90IG1vdmluZyB0aGlzIHF1
aXJrIHRvIGdwaW9saWItb2YuYz8KCi0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hl
bmtvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
