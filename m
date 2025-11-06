Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464EFCCFA05
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Nov 2025 15:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nSTXhrD6baf+6CntwWIdQpNJxvx+6K0HBfo6oUsDvrM=; b=nL221hl+eHmCwl
	qkiTq1knv21LITNCPswYhvk1Vs/GAHwWorzU/GAPDhZ6/uWYRNaLbqnOQxxKD6DK+t+XFtQV25J7Z
	GvajIGM3JFqjQc9VoXfypqia5KX1Eu3m4er+YmLODxBy9lSWKNanwTXOku/Ziir/5jLp9hIzNwzJs
	onnm/btHiyF3g7lz5LyJK3qz+o6XHjqvEIa4Z9ikDC3JkBoCDGfraZGEbPpV6wB2pXot6MFFub+Rv
	6Xbxa0tqxgtIEnlQkiOXIFHvK+fiHd4IW219uo5qNKkT39K90N1VWlZ8vLRQWz6Ew60Fkz8PAezWE
	JDjfNZE5xpEXyd5O9H4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH26E-0000000FppW-0fQs;
	Thu, 06 Nov 2025 15:40:34 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH26B-0000000FpoM-0yJB
	for linux-mtd@lists.infradead.org;
	Thu, 06 Nov 2025 15:40:32 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-429ce7e79f8so845527f8f.0
        for <linux-mtd@lists.infradead.org>; Thu, 06 Nov 2025 07:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762443629; x=1763048429; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q1Wk3Zb6iHABuxMtqYWJQhotr9eHGE3DttWEmz8jd9g=;
        b=jCQCIuryJ7aADvEJZpxXHfIVo0yYVEkp2rGq8TwBwihmt9fNbbUdWs10i0kIkUs+hp
         9CJ04daInp6Gha3MA54t1EizGgMm7mcxfLJSI6c1lGQzdz9TCoLbR3mxwE2gi2vFZX9B
         /uFuzCc67X7yYh0UwSqMvz3xaETWVSKDcCq9vATHmAzrg24lmIB+OY4dDsdH40u9N3dE
         Ywdw2AWnx5Z63aPgyCq1t49OliJLfQRp4RGkwKactJdDkVdysm+n4JemULTvVq7Ffsoq
         dGP0bZ2LPEIsX4VHJYTvo1vdDteCyTsNBfP9UHshSBJjXCggWhld2frJ2cWgvjntIhjr
         kZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762443629; x=1763048429;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1Wk3Zb6iHABuxMtqYWJQhotr9eHGE3DttWEmz8jd9g=;
        b=koe83Jhv68RRsf55gApRWvIhOf0Mqd/pg6UyMiVf7kZr5eCL3lrOrNWsmrfAVjci9C
         0ni9ospqf2a9GkKbNb/ryXwFg97i4jfi4CF7On7yhJf2o6/JyDiW3SEt2tzPkhpMqeol
         TFqpgjPpwm0I5jtNkuuf8cAhtXP188yl/BmfBhG2vC32yYvwcdS8XZjIhTggj5lXvpBs
         +H0GyithUqYmXqHvP33siaNTslimAQWcUo+FuHs6ikyLb7JixaMF1OCWvRKCX6DNqvP4
         5AERvdoF/78y5sNtZRvCCMTfRhH40HLMPCb4iKnqUK2lxjEuSz0wYwjntlc7+iLXvlZi
         7hTw==
X-Forwarded-Encrypted: i=1; AJvYcCUlcW+38yj9ncV8ZA7PHWNayDZ9o/CR/OhdkHhxCHhtwlvSWutu3FzqhX/Wl6845iwdEm3m/FcpB1E=@lists.infradead.org
X-Gm-Message-State: AOJu0YwAPi4fIPkfb1Ms06mekpdt3WOaLLklacqXuLvpmfONL8YTHkn4
	Q/Qac3MG6XSOQ6iNjVN0efOVUcbFnvMyQVbM5/5nhZBcSkhixTQok85/gNcJhsulEAM=
X-Gm-Gg: ASbGncumOkRaqPOtA7ERqHa5h8vHTsL2/l59fCCZSyfrrltE049FjCYUZN4eq9EkHz9
	OCbStAs+YIgA9aOxZzylTmj5h9LKz1pRF+nyxcwC9isVMO3zk95EXO+O4h/woElB3p51zRFT9Ir
	b3oz7D3Sl/xRuUPNzs/R27XKBRyZX6aJnDOjWqMhWEtCqYnNHdrbD94FkrPCG8qle6qS2JqKU7h
	7FTSucm03+jly4Qrcg5a0sSyRA6rsJzivqyrpgH9TaA7lKRWfvLrmGVFqRyxo7usXPDpGgYb8/9
	Qy5OlNIl6dnnS5DQFnqF3zBf0QxBEkxu9/bhamg7OgIUWIHt66ywwBJpLhCDoWw9BzvjYPmaepN
	kDQw41W3tGXRs4y2FmGRXV6rBlvUcJ+iEFfGJhr0v61g/OcswCksTGu6CKAtIGsDPKLe4k+nPD6
	p9AUnNJf0bB4ipdgWQvhA=
X-Google-Smtp-Source: AGHT+IFjpy8Et4z+rAreshTApQ1UnG8la7y5eDtsFm4fqVoBZudQUf3WRA0jtYYTZf5YlVXK7dWKmw==
X-Received: by 2002:a5d:5d0c:0:b0:3f7:b7ac:f3d2 with SMTP id ffacd0b85a97d-429e3309cc9mr7040773f8f.43.1762443629298;
        Thu, 06 Nov 2025 07:40:29 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429ec767edasm5003126f8f.43.2025.11.06.07.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 07:40:28 -0800 (PST)
Message-ID: <e0c8b161-3e08-48a0-89ef-8e0ea8b76672@tuxon.dev>
Date: Thu, 6 Nov 2025 17:40:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 21/26] soc: renesas: rz-sysc: Convert to common
 field_get() helper
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
 <ed045ec4db284ca8b4ec0c5b6ff334e459d14096.1762435376.git.geert+renesas@glider.be>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <ed045ec4db284ca8b4ec0c5b6ff334e459d14096.1762435376.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_074031_290189_F713BFCE 
X-CRM114-Status: UNSURE (   6.77  )
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
> Drop the driver-specific field_get() macro, in favor of the globally
> available variant from <linux/bitfield.h>.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
