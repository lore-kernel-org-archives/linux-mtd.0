Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB602CCF9F8
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Nov 2025 15:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aS1aQ7jNrxsoKCdx4tO7CTng+MzJupkZG7Y3IE0OJWs=; b=fEIAs90GDEefAY
	K0QkV5X7N1KmEl2MdtC1qNGN2HT3+Oz+LlxTyyINa++K/1ZVtRXhuf0hVhozAd31lBhEKiO0F6Um+
	GTa8sb1PMpHS6A+nh7kT+lcuSL/gtvL8UMH7kw8Uxnhd5DDnJcYZEKqOlGHyZmmfLPpLbgOr/Ai0P
	h8iTad0jsnXZ72UNPbA1k2GWmDau0nHU8s1Zl5Zbnpc3SRCRFUrlFfCQx/dZNWA6y69FvT1+escOu
	jtLp9Dj24tawXxva+gKFpqUfZVWNhbobJHjt38NAdPSX28NgJVPvP75+yeo1QJQna7xi7WqWM6cmT
	PPO2Fv1e7EzURVywAG+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH25n-0000000Fpko-0mF4;
	Thu, 06 Nov 2025 15:40:07 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH25h-0000000FpjY-3y8x
	for linux-mtd@lists.infradead.org;
	Thu, 06 Nov 2025 15:40:05 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-429b9b6ce96so844913f8f.3
        for <linux-mtd@lists.infradead.org>; Thu, 06 Nov 2025 07:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762443599; x=1763048399; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NCImS8vAPGN6LTIAPQAR8IZZ+CU8X+89zO49Z6Ixv/M=;
        b=JUGiVqzI5Upkwz2JUbKp1QZFBmhUzl3QuTgJXJUVs3e1CV/rIzrweEnsTzpGxd6VGY
         s5Nud3k8Ky+YqG/TIc/8v+drd4O85+BahZk8RfmpxMwF9ts/5a+9gE7FfLVLprbxWXkw
         kjHcw90aUQok1cuT3LcVTZB8LIUzHcsDLUcikzmfGOZUpW5esz/+yY1DAWIo+hYKIITP
         2YEUWb0fBzA7knzLUx5gHp2f/uVN9eEc5/ya157LoHrK81yjMYtLMtdkciiqGVYcD/yI
         CKSXqR5vzZO6l1DeVrlVT85qUSJ0F3G1WE3HDrNaa4HZDUU9fGjiQQjJ6SAuB50OF+6K
         8/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762443599; x=1763048399;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NCImS8vAPGN6LTIAPQAR8IZZ+CU8X+89zO49Z6Ixv/M=;
        b=EckJR2EKNHTNlcSpYlOVjMw2u0HwS+bDpAfVYE6mG6QvBYCmFYxlmr4mSlFzsWe61E
         G5WtwIKN9xGxRQFPUP3/emjbK+OsRNCpnUNGCBIRC2aIafcS6mfikJuqe3Xm83Wrs95z
         1Y3zuaa0WX2zfHx9/+fX15N0GKXC0cpBGfKEtKnT3dOq4A7CwEnXmo6Xqmbw+dauZt5C
         mbWX6/DOCAaOJ9SWfUwTEK4LzrJUV5CcwdG5d8WBAsARz9B8oeK8/SfD6ul5S6wN+KBY
         b9Zl7eItBTbvnX3WH8famUTz0uqM60n4+S6X7Q+ml+qeURDxgXSK7Te1vvNwEJ+cciz/
         aYTw==
X-Forwarded-Encrypted: i=1; AJvYcCXq7ISJf+NCORzEIXTlX8y9yaJYf1BieXDZ2OvBuLkVnG0vY3y1HYU3aqlBzWyYVVkFhUdc0T9VRbc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw95E7PWRlOzdGUHwifyJuGInHEYpOrfPw8osp3pIdwIDuLxttV
	XQtrTMZ9jaYnIIjvP4xh9aZdhtlGmODGlcothhCf/AcI7QMjsk0KeRQAa5EUyqynZAQ=
X-Gm-Gg: ASbGncvcOVu2dALyikSzYmpKpwGLOyMU0V5cMpCgiRE2xivJHZU9zi2OrXn3sRhfCS+
	V5XtP6fFZHCJhx63jp+mX1I1Fb8DGgGKpuUH0+1XF0vaVJWskzUqZi7XrnltgQraELtWw0IZXRU
	U3qVaWD9BQXge1AmgQrJdwmDinbWCj64WTdOnV1Exd5dT+RFKaNAFiKSeoUSUFvEP5n3CDzuwgO
	QctOGbKQdZUtP68VRtjZ9lZ65Hz0U7WdBnHx/ba60UxcjctQ84dCMh8BQOYo+2GYpO6Kk1PJQBg
	xVAMm3JfqcUUQ2fQ/g0v8RFw3Zdf/zFG5g8qRyGmUkU7fuZFmdXf3XIozC47IrRDWXWhlbuQhKn
	c1GZnMZZtW4dATma+kEcxkb8RQJXTBXPilo9xPaw9S/WEcrjqDrrnZuo3Fk4iiD4yRMYGAvc2wK
	zaCsMhvo+e
X-Google-Smtp-Source: AGHT+IEnd90RJHx7ZuzW87zs5Q4EEB4nWgY3Vtjy9fpk248/BemBXzC7fRUumPfx0M4xpvI1GCS0qw==
X-Received: by 2002:a05:6000:2510:b0:429:d0b8:3850 with SMTP id ffacd0b85a97d-429e330b68dmr6675168f8f.48.1762443599342;
        Thu, 06 Nov 2025 07:39:59 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb4772basm6489913f8f.26.2025.11.06.07.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 07:39:58 -0800 (PST)
Message-ID: <181cb561-4fdf-49c0-aeb0-85844411a6ad@tuxon.dev>
Date: Thu, 6 Nov 2025 17:39:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/26] soc: renesas: rz-sysc: #undef field_get() before
 local definition
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Yury Norov <yury.norov@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Miller
 <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Johannes Berg <johannes@sipsolutions.net>, Jakub Kicinski <kuba@kernel.org>,
 Alex Elder <elder@ieee.org>, David Laight <david.laight.linux@gmail.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Jason Baron
 <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Kim Seer Paller <kimseer.paller@analog.com>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Richard Genoud <richard.genoud@bootlin.com>,
 Cosmin Tanislav <demonsingur@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Jianping Shen <Jianping.Shen@de.bosch.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-edac@vger.kernel.org, qat-linux@intel.com, linux-gpio@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1762435376.git.geert+renesas@glider.be>
 <7feec8e9cf823dd365d6e0f21004f943964e52a0.1762435376.git.geert+renesas@glider.be>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <7feec8e9cf823dd365d6e0f21004f943964e52a0.1762435376.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_074002_047149_DF128A6C 
X-CRM114-Status: UNSURE (   7.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 11/6/25 15:33, Geert Uytterhoeven wrote:
> Prepare for the advent of a globally available common field_get() macro
> by undefining the symbol before defining a local variant.  This prevents
> redefinition warnings from the C preprocessor when introducing the common
> macro later.
> 
> Suggested-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
