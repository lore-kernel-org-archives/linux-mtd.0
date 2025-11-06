Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1523BCCFA05
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Nov 2025 15:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TyI+yL2cwu4BlGXATPl9xd0pK1qvq79KZ0vK2c3tEAQ=; b=zXB4evlN0qioin
	Aavf5z9Jy2YamFZwAy9+TIhY1WxaR27VD88euiMVvy2YsnFaUj0d3rfD+F4joPspJTF6pI7mmjTXg
	V+ekXZJX18Gs7q78Mg/RbHoAsf3Bk99OrejaD/7+W6X4+Sau7hiAocp+Z7hjm6eu5vt+4bfI+4U/3
	LUm27w9d4I1i4uvtvG1twAxPH0CN9CWb0hWYyAB+LLz4TDORDdIxojPGk5hOP5x4iMrnoo4x/gVzQ
	F64cRFA0sbXDaTg+3AjGo+Scfq0Un+1gNQ4j/pLIlMRzTUfzA3pq6YtX+j0SiW762tzT0imFbiwLs
	ryzT14BECDZlGnkQKg7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH22d-0000000FpWN-1l9w;
	Thu, 06 Nov 2025 15:36:51 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH22Y-0000000FpVf-0r3u
	for linux-mtd@lists.infradead.org;
	Thu, 06 Nov 2025 15:36:49 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-477632b0621so6988005e9.2
        for <linux-mtd@lists.infradead.org>; Thu, 06 Nov 2025 07:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762443404; x=1763048204; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NoiFfWZaW31Ma9mD3WuZZQSDOEMD5VY8nTTYH6Ca1fs=;
        b=BPaR5nZPkMy90pcievuc1nCa+XP6byENra9j3YQ7DGSDgbmNFfT00r7al9ykI/PBvQ
         9X05ewL6oqQrV8sPfRTTDJdZd6nnXp31RkNgwUqXqOQuZyStqC5Y+OhBbh2oHhVMMZD5
         a2TL8fbaiL/lseMp/iiLresiWDlaMW7nGNFc48yxayXDzUoLnnDv5J5/GqsTEyO2394S
         WzgRyU6zmg/EfF+KDbdIHMM1vjYNfCWj3AWMDQc+GeIVDqEFMY1y6RhaJZ6lhU0N5aLm
         o+xjGblMZfzFwArB1R9Irv4Ahr3mgzsSGRVRSgrMffLzOiu5ft+vdpnU3zH2Bt3OFZSU
         KCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762443404; x=1763048204;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NoiFfWZaW31Ma9mD3WuZZQSDOEMD5VY8nTTYH6Ca1fs=;
        b=LrWCxT+IAIvlD+G7yPpR5DL1qFnldgpl+GJNnzZMPkVptxNsWJAsXAYEoXoJazMC37
         Uaj9t9NARqR21jjhKvx00b4y5xeMpsLQPic8MxXkdXsfnZMrmzd0umNewWdiDryDWd/r
         YxmNDeFQkGPi1A2KjevngTMA8o9nfrghr08RPz7w1pzBVZ58gsq8ebPb3/qUR2Tj7eK1
         fGkaWrFGZfqyCZplgvYPw6XZgpc7X75d3zFBHPruHE8z0YypYuvidXCED5cez0VW/IvJ
         F1BJV36LXlnU1ayPVPCZf0/cKx9aUC2E/r3x5OxxzV0UBJyW+xWlGiFkT9XL03cgeP8q
         kY2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAJwVH5JA1ssFqXygQEu7y83m6xS3kv8GphYcRMydUhoh1LbRT9l9AQ+/p4y7V+gRoVgrFLrgTB8M=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPDl77MyoqjNJRRbElD3R5Yan7L1FvPByWG7W1FCqjsmTL7i2y
	jpd2QFCpNJsxwC9JuheTA/SUpwEwwIWZWtZlPhuSscLKmuIWMJ4wrs29WU484+i7SkU=
X-Gm-Gg: ASbGncud3Afg04hRFDKm4FOra56SkOINaRgkLjGQDLMO8zuHrTN40ZBEkIkhlA+ID16
	i/aCcEq8glXSXqZ4BUGFt6Q8+fKZJN3pD/tY5x++m6kzTvuu9aO1PzaD+grFwjdl3wZMlc3eODO
	a/+YS4hYZDcrVpnMn6PJqZ9gJ/zCq4Jg/WqI1VMG9K5XBn1kcO/Nwgl3/l5Cmkb1Zhg0fpwbAoZ
	8G3ABJjXTmuzu1cH/vp3sBX1v4o4nT39njvw0/3g4o1WaUkfjxkrQcmPoMJoTTwfXHfy6dcFSJW
	tb4TO7m+ToD9k2OouGDM4T/ohWtuU9WBd9Eouhml0Xgbv9RZABC3iPgS7rgiQfvBzWPinPzB10o
	dig7/6jDk6vFv8pGOi+vPcypFtx9N/XYhL5ldX5rwzbVhxdabtM6/qCcvaxalNg0BqGVL+Ebxth
	ItiLZKWkdPIdWd7nKTKy8=
X-Google-Smtp-Source: AGHT+IHm/6/RnHvUQpqjyEKIYZGBSjHuPRp5b3DBLGbL1GoDEzCDZheRRGUhzX2BHAHpgilQLx/Q7g==
X-Received: by 2002:a05:600c:621a:b0:471:14f5:126f with SMTP id 5b1f17b1804b1-4775ce206f3mr59734595e9.33.1762443404278;
        Thu, 06 Nov 2025 07:36:44 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477622f42a5sm98437525e9.1.2025.11.06.07.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 07:36:43 -0800 (PST)
Message-ID: <d1b02488-7722-4b39-bb8e-f7e5c8e11b1e@tuxon.dev>
Date: Thu, 6 Nov 2025 17:36:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/26] clk: at91: pmc: #undef field_{get,prep}() before
 definition
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
 <939d8c6da1f468026b1bb201413ba08b1d0751fd.1762435376.git.geert+renesas@glider.be>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <939d8c6da1f468026b1bb201413ba08b1d0751fd.1762435376.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_073646_286780_C383B211 
X-CRM114-Status: UNSURE (   7.40  )
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
> Prepare for the advent of globally available common field_get() and
> field_prep() macros by undefining the symbols before defining local
> variants.  This prevents redefinition warnings from the C preprocessor
> when introducing the common macros later.
> 
> Suggested-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Acked-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
