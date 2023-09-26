Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CEBE7D26A
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Sep 2023 09:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0tmD51SViztVd6g5jGimQcFZ1XnWa3J3iRhnO9kDs34=; b=fU3uiroC3XTavZ
	3luiYdsElhGeMx/pd8+hsQMiynRBQZjWWrVEmObNs0fgyd+jroUlbAJzW5TkVI+sjbIlVb86ls4dw
	qFwlBdzfOIxFRDlFnrHF3FV+m4Vbas5tGuDRmntNgXTmv8tkDXY+NvsjMysvavFLzKtKowNQryecZ
	AMcIrPqsQuM7W6cdQeEn4T+Y3hAV4TFpqNva955rnDnKcWYJ5FyYUWY1ngWixiYpV4rtWJjrFFvWF
	ZOFsks/LehQzp3sLRSELm8gHshpWZVV9xo4ZAkkT8F2YlxLusrgSfkQpPd6Oit/yiiFbfUt75VG2v
	F0V4J+iuHlGvaCzUAs2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql46F-00FwAr-13;
	Tue, 26 Sep 2023 09:11:23 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql46C-00FwAN-1Y
	for linux-mtd@lists.infradead.org;
	Tue, 26 Sep 2023 09:11:21 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-59f57ad6126so61126367b3.3
        for <linux-mtd@lists.infradead.org>; Tue, 26 Sep 2023 02:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695719478; x=1696324278; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0PDhPpQtKfenHFIZYPJauktelsKWg7AKOZgGNnjJU8=;
        b=ic4GslHpcH7T4l8WgQekBb2IO5O7YatEvFNLKWdgxS9FcCWADWFDgzOxUVirz342yF
         Xl6rqtBoM5+hE5SteslMNv9DOufLOvPEgAVPW2JJ2bhv1SA9XQaggILdSDYoxP9ox0JJ
         qYGTPD1/f8NYeYlvqH3gBIChqOO1/4uu1qSGQjhAoViIufMtPUJAStH+G9vHFPFRoGj5
         0F2uYl99cz53QVbEDaKVWsbg8LptUo1pHeuQ7IraS+cBLQYYNWe6LyJ0G5kCDqB8SYQX
         F8fKkal0v0t0ZUHeMba6SsXwllRxUy/V4R5yoNd0mNcJUUl717UkPy5YgH8TdFOyI2OO
         f8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695719478; x=1696324278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0PDhPpQtKfenHFIZYPJauktelsKWg7AKOZgGNnjJU8=;
        b=f5wieVS6auakOKSZTea3xY4VXyrKYQBptouD50Sewq8qe1qtlqzTcm5fV7vRStVlT+
         2bNBMe9pEsLrhRCDOUADHYECgBOW71iNKQR9wEw4u23kQZ17wbegCv5JhrQTi3wifZhp
         7L3em2TOGvsDOFNeA8A5WzhIm+3pbLIBy4Fgz/Wz9s9WzCUroM7KeY1t6P5Hl9vcGNns
         GxZOMc/vcRYKW1VGPjAL+rzwDnG7iyEWY8Iwy8B2mgJhOU5aHGTOEWy985dpN80JWdR3
         fq7sHejANRL7brfd/upOuvlw/BON3adtJVKL7DykbGtWyY+6tNfju7z0bWTtm8AS8TtS
         xweA==
X-Gm-Message-State: AOJu0YxGBXb5HFe1GWXXH/MkRPx3aKVLGLh1bqlqYPzz0g7sty0w0N0T
	7bT3sEgb9DsoGNEuwSjCHZfyYwX6klh7jIsPgCTqww==
X-Google-Smtp-Source: AGHT+IEgKX3n5Olx0xH4y1czhKrXxa2Jqjj7SjkTTJVSRD2X5jBRYpc70wR8SkoYZ0fDx9gEksPsrC9fstLgwM+xMHA=
X-Received: by 2002:a0d:db4e:0:b0:59b:f18b:efa0 with SMTP id
 d75-20020a0ddb4e000000b0059bf18befa0mr7877471ywe.36.1695719478064; Tue, 26
 Sep 2023 02:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230926090623.35595-1-brgl@bgdev.pl>
In-Reply-To: <20230926090623.35595-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 26 Sep 2023 11:11:06 +0200
Message-ID: <CACRpkdaVaqooxjgLqxzrVrMp088-FjdwFH7XnuWL2J=BqX_5HA@mail.gmail.com>
Subject: Re: [RFT PATCH] mtd: rawnand: ingenic: move the GPIO quirk to gpiolib-of.c
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-mips@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_021120_526673_0098DB69 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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
cmdsQGJnZGV2LnBsPiB3cm90ZToKCj4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9z
ei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+Cj4gV2UgaGF2ZSBhIHNwZWNpYWwgcGxhY2UgZm9y
IE9GIHBvbGFyaXR5IHF1aXJrcyBpbiBncGlvbGliLW9mLmMuIExldCdzCj4gbW92ZSB0aGlzIG92
ZXIgdGhlcmUgc28gdGhhdCBpdCBkb2Vzbid0IHBvbGx1dGUgdGhlIGRyaXZlci4KPgo+IFNpZ25l
ZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJv
Lm9yZz4KClRoaXMgaXMgbmljZS4KUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndh
bGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
