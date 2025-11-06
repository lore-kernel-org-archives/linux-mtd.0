Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D25ECCFA1A
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Nov 2025 15:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PVgkdSJd5aaJkqq49mNnvKmnFfS8PzxT0REv0leajwQ=; b=xN6y+/uDDVS1G7
	iLwAZXiC+qxkjTNC7u0IIximoewdUL72U+bWu4K7NEAGcLEPkuU657x8TwBp3Lo/hZk/9271Oa7Az
	AeJaON5OsW+W44w+HIW4Gcr+IP04vkncnJo3KK2Hq2VFDhpsecco20fn9WOwahBR13VgvxpWY/Hs2
	oDDUXERk9Vc/gL3sMXmov32chiqkYfVk2XAZZIobXmwzvjMrN/15nPx9qKZ++RPySEFS+pa/nfnJ3
	BV5Byw4zCNkfkVYcxbakyr/Eqg8v2dGlTST6cG+JQbMta7bbIxmz4rJLAvS7P8mEiWTmgz3s1mgaG
	U1sGYpwpd5cNs/87P20w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2AY-0000000FqEG-17wU;
	Thu, 06 Nov 2025 15:45:02 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2AU-0000000FqDG-490p
	for linux-mtd@lists.infradead.org;
	Thu, 06 Nov 2025 15:45:00 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4775ae77516so13327955e9.1
        for <linux-mtd@lists.infradead.org>; Thu, 06 Nov 2025 07:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762443897; x=1763048697; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FDBfIt+d555CHw458VAbNG3bfHQEwmpPFewi9LatYFE=;
        b=jYwwZQoIyKYD3vHD326mOJP4drRkc65/2n8xlokQGr6pJT+7yOhR7fDEkTJQkGObZf
         vY1rmva1o5X8ZBNvmWJMg3n7bE+GJE32SSmyMULAK1qqghmSHiB8t6WMy1waIbD5dBcC
         ivOtPIBCuoqY4645yj9wTa2JM8HJAGwXHuFOYNQQ0njLoSKhQYzcSLkqEz7SMu7UU2WZ
         +4Fhc9PfLekY7iqzov43NrsRhZ24ylwdXbqtp/IGn3wnOiPZoy0JCiwFGG1PRV5tAeFz
         iaihaZ9TSt7q5bQqrhD51W+dHnR45lXZCKrAocZqpDvksYeHIn72A4jJjXggizZZ3DrU
         P+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762443897; x=1763048697;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FDBfIt+d555CHw458VAbNG3bfHQEwmpPFewi9LatYFE=;
        b=bcV68X3DKaJ5Zk4jIAf26mrLfhwLjqKLsTbZesL2ZyCGJdLnnOXeyBcbPELpwXGTuk
         ZwOp7q6y/hKPcXT7FKAgjcQrjLqZyr5CwDI3rBsJiDfg64PxfVRmboXjW6RPQxwqdvF5
         j8vVlrKnGC+01U/n9VEYQD5Pi/a5B+L8/SShoKWSOM1kncRJPDL7ZUrD0MP+0Kg1RcB+
         7gLx4F9TjwevWybOl4Y+Uiror6T+Z1s0TOoZyrdY2qkIZoIWPQA3lJVvxoDcg9pasPa9
         mZUG4XxjRDgVcViVS7+yz/iJSq4tgxBgCebTd0JfDtRwTPCcZkijgKBKLRMTqAK0zFJR
         erJA==
X-Forwarded-Encrypted: i=1; AJvYcCXiprNqaOEN+l+PodjMKCpA4SV578bTUNqcWqhNN2Dxny8/uBiF1ZVf+MbNuv4nOgRkxgnUa+usTFA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyxiaeY/h2854hxaoh55LCL29NddH9amYflxb3MF0PIbtUKk6bo
	fBG8tP6m2Udr/B5viDkV+l9PsCh36T2DOlCLmk5LWJvoIzOCR6UYd6JrsbBf22wxcWY=
X-Gm-Gg: ASbGncsH2fSGPjwWASlFgY4jvU475lOZa1oa8xle4nNKKHr7PiZt3LwetnpbCWIItyC
	Ql4y/zPGQuDWqWd+4h7UT2ifT+5kDxCSVw3s6vwh2P3fZhpqgHqKxcyG+DLqHOE3QWKv3MDwvWg
	DJ5mECzUOl5ca2+5rQLeRK+ABAeKy30EYAqvgfHfWgqDNpuq0V5KaYU8ThOhAW6VzuEjyO4moTF
	FPUFyBoIdSIC2buYIwVJ7U9PmqTb98qc0t6OVGlg9kvj3+/60f1pyglspE7hL2JYkW9gGJg3SsP
	pW/BReJZOGHr4MHf2DrahtJW70PNUBhYvlPnNQaU6uxvqxvuTvqfl+3An4ttvX0/rY71g6RU4sB
	4xI6k/JEyn0ft6hOvlt0zxwRGd5kp5Qds0JF0DyJaGcADKmbLcFObNrbhy0F4wBR5F/GAaKx3rW
	h2cI1K06HR
X-Google-Smtp-Source: AGHT+IEAc10N1RtkN4NVSk1Zu24SSpZFPG8gHp4xc27V6x28O5IWRTQBVQkr2p/iYh6QAS/I0T8A6w==
X-Received: by 2002:a05:6000:310a:b0:429:c8f6:5873 with SMTP id ffacd0b85a97d-429e32edf7bmr7715744f8f.22.1762443896966;
        Thu, 06 Nov 2025 07:44:56 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb40375bsm5553906f8f.8.2025.11.06.07.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 07:44:56 -0800 (PST)
Message-ID: <509b427c-5586-4c92-88ad-16bbde7c3f92@tuxon.dev>
Date: Thu, 6 Nov 2025 17:44:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/26] clk: at91: Convert to common field_{get,prep}()
 helpers
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
 <7414c080bbacc3c5be00c0eec4f5cbca386acaf3.1762435376.git.geert+renesas@glider.be>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <7414c080bbacc3c5be00c0eec4f5cbca386acaf3.1762435376.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_074459_339043_8DCB66E2 
X-CRM114-Status: UNSURE (   6.95  )
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



On 11/6/25 15:34, Geert Uytterhoeven wrote:
> Drop the driver-specific field_get() and field_prep() macros, in favor
> of the globally available variants from <linux/bitfield.h>.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>


Acked-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
