Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA79EDE987
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Sep 2023 07:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uEK1DUdUjUBiVyGJL0VYjASRdX7YRPJttML1jAWz5qQ=; b=D+PpmTP9BVEKx1
	tyb3U46IkHpfRbydfgvgyFrsrOw75xpgW7MlPTAvETMJE3900MVHv9VictuP6JVaX18ziXGLA4XhZ
	XGLx7VJLic416CL5cqvh/xJfakS4o3NXc51BurdhHGYaFyXVhkn30WaOcaV88BowP0WkBKVpgUbfK
	GQCnslPaV0Tjm5fzcRP67zcYDMWWpzCwQjD+NrThZgTRnOXv4dc+Y9RFD3ru/sPDJ3kOsBsk0YKPU
	K3GX082U8QQy+Ol85EmxL+LaLy5pyMzr2tOjd4vetLJGr+K+4cttW/0kzCF+eAVWVIEAEeJA3odAj
	YxOV16xq8z81i30g28Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qggNZ-007ZTs-31;
	Thu, 14 Sep 2023 07:03:09 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qggNW-007ZRA-2Y
	for linux-mtd@lists.infradead.org;
	Thu, 14 Sep 2023 07:03:07 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6befdb1f545so383354a34.3
        for <linux-mtd@lists.infradead.org>; Thu, 14 Sep 2023 00:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694674983; x=1695279783; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30YvJco7VTNawIeVj2mQFLvYk/DMezr2VBhiarmaxjs=;
        b=pUJxX5MaGLmwkBJJM/wlKBRTXx4nT62sM7ql1+LmmpSa8voQgjlaNp8hke3DXJJ+21
         pEcFwKi2237ewtNNN4SJyRDTer6yebxv36/6V5VGaHJLl3B5URZkfHxm4Kqab2la0Rol
         QPj5jLuL6gPYSaatjWA/jQwt9e+7b1PSwYlJBly1qzxYnlqfjxLzJrcg/RBuPmkQVc/j
         mlgz3YX8yrEjL5MG1Bx3ZU9r9NBoFB5u476WlKSq1BJ0vuL5H8PM5t/GYoTEreXo454U
         eIijk2slYsMqdZrkdZF7dzp+HdNiBa0PAFK2NMrskkP9E1vvTWaM8IuXvbU+fxZu7GAr
         9jOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694674983; x=1695279783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30YvJco7VTNawIeVj2mQFLvYk/DMezr2VBhiarmaxjs=;
        b=RFx4YQgDWjtvdJ79ZzXruqYuKRnwl5fhP1C6tlbxPYKRmfAp6rAlfEKpxclkQkmCdm
         9SKZ3Fd6lYHR8EIHrKK05+kaNdVUpGGVqtOVUK/jM8jYfGcltWD2VGngLa/x8KRl4oM/
         KRexUjKv6/o7zCif7MizkptYUBKxRmsqd//e0MZygqpHTg/7pEmtXbgeecgN+VPuASkF
         t3Qnq8A3dC2LUqYy01smvTPFUAOPAsEWFEzMnFlfzjT7TXQwdSDuRsJQC4DngtsN6rhK
         ++X7SOebxxskUIEVZLf2jnyUeyw4l/9TpyXLoRAF8viNF7VsDVNJGoX+abNv43t86BgX
         R+xg==
X-Gm-Message-State: AOJu0YwFSJj3Lq4t4vVhmCcAFIa/5nDoJqzc6w7A7WfZfWO7+7rEa5vG
	EodZL069nmPerUYni6J5YlKnJJaG188TYo7xSrs=
X-Google-Smtp-Source: AGHT+IFwN7KC0MP+yRN7HXC+8WIaA9T071jv684OsNuFmbXU0T8YGXPQiTees4sH/CN6Q5P9OE3eUQ43ejp33Zd91jw=
X-Received: by 2002:a05:6871:5ca:b0:1d5:a85a:13b6 with SMTP id
 v10-20020a05687105ca00b001d5a85a13b6mr5395171oan.45.1694674982809; Thu, 14
 Sep 2023 00:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230913115001.23183-1-brgl@bgdev.pl> <20230913115001.23183-3-brgl@bgdev.pl>
 <CAHp75Ve8aK4Pfid1JYWH86mKy-Zb-G2QDPrJYmRzPCYOsn1TqQ@mail.gmail.com>
 <CACRpkdYtYDJa6fo6RnizHNzUsyazBQxEaNMznaij8rBF4ie+ew@mail.gmail.com> <20230913222338.07d1625b@xps-13>
In-Reply-To: <20230913222338.07d1625b@xps-13>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 14 Sep 2023 10:02:26 +0300
Message-ID: <CAHp75Vd2a06rnGCEiJW0reN00amso0RyvgLT516nZiYLYZ-xcQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] mtd: rawnand: ingenic: use gpiod_set_active_high()
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Daniel Scally <djrscally@gmail.com>, 
	Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_000306_828576_FAC10F42 
X-CRM114-Status: GOOD (  14.37  )
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

T24gV2VkLCBTZXAgMTMsIDIwMjMgYXQgMTE6MjPigK9QTSBNaXF1ZWwgUmF5bmFsCjxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiBsaW51cy53YWxsZWlqQGxpbmFyby5vcmcgd3Jv
dGUgb24gV2VkLCAxMyBTZXAgMjAyMyAyMjoxMjo0MCArMDIwMDoKPiA+IE9uIFdlZCwgU2VwIDEz
LCAyMDIzIGF0IDEwOjA14oCvUE0gQW5keSBTaGV2Y2hlbmtvCj4gPiA8YW5keS5zaGV2Y2hlbmtv
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+IE9uIFdlZCwgU2VwIDEzLCAyMDIzIGF0IDI6NTDigK9Q
TSBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPiB3cm90ZToKCi4uLgoKPiA+ID4g
V2h5IG5vdCBtb3ZpbmcgdGhpcyBxdWlyayB0byBncGlvbGliLW9mLmM/Cj4gPgo+ID4gVGhhdCdz
IGEgYmV0dGVyIGlkZWEgaGVyZSBJIHRoaW5rLCBpdCdzIGNsZWFybHkgYSBxdWlyayBmb3IgYQo+
ID4gYnVnZ3kgZGV2aWNlIHRyZWUuCj4KPiBBZ3JlZWQsIGl0J3MganVzdCBmb3IgYmFja3dhcmQg
Y29tcGF0aWJpbGl0eSBwdXJwb3NlcyBpbiBhIHNpbmdsZQo+IGRyaXZlci4gSSBiZWxpZXZlIGl0
IHNob3VsZCBzdGF5IGhlcmUuCgpJIGJlbGlldmUgTGludXMgd2FzIGZvciBtb3ZpbmcuCgpncGlv
bGliLW9mLmMgY29udGFpbnMgYSBsb3Qgb2YgcXVpcmtzLCBpbmNsdWRpbmcgdGhpcyBvbmUuIENh
bGxpbmcKdGhlc2UgbmV3IChvciBvbGQpIEFQSXMgZm9yIG92ZXJyaWRpbmcgcG9sYXJpdHkgaW4g
bWFueSBjYXNlcwpzaG91bGRuJ3QgYmUgbmVlZGVkIGlmIHdlcmUgbm8gaXNzdWVzIHdpdGggRFQg
b3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KCi0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2
Y2hlbmtvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
