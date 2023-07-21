Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95428C04FE2
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jul 2023 14:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S9rCLFR+ottCdMse3coO8X7bo+DRJM1fNz0cJCyJxhs=; b=fAv+kSGo4yB4bR
	NHBaZCycuH/zL38hc/6qQhxtiefiB2Y7Z5rORB/2NpHtFFDwZQ8X6eFu3ZKFy9gWr8PdyO5f+TmTf
	5qjh9+6TAJ8V2vjI8pniYJTDHRyOZxmh1qnDxs7z4HeD3J6kfOO+TPHTo5slHudqXNp9Uj3lXWSxg
	56PwOZ6/ebmVNzZ1MD87/7zfNjo+1crkUTJu/VD9ZAZaYifKbjwx1eUQ7kgUjCzOVWQ+T02hm4Rki
	+HFARoKRpytyLIk4Ge0dZgPfRzQ5oJyTWTJcfkjGKDN8PC4AS6hlx/zvUCvSA6z3dKy52DwJ3yXw/
	99RznVCIUSQjccXLJeKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMr4G-00EHSr-2c;
	Fri, 21 Jul 2023 14:25:16 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMr4E-00EHQr-1d
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jul 2023 14:25:15 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fbef8ad9bbso17815605e9.0
        for <linux-mtd@lists.infradead.org>; Fri, 21 Jul 2023 07:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689949510; x=1690554310;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nsB9IpIa7yRoJhopQrOjvBc0s3b3yy++co3a2B1PcYw=;
        b=qIJ3m7pumTVMjEg+kn7UzsmtHcvDLZMe1tywd8h4kIEFsV1IUMrLWSP7L1Gefi6ja3
         JBnA+rcRqypgsH7goHOUSHZMKZ550EJ6VKVD5dUqYgKEkPNc0iL/P3ucMWjqHbEFD/T0
         wpz6/3MqeieB5gRPCUiu4XZk3Zcu+o+NiGcka0anh/l9hHDrOL+VgYR/KE3ZF2zZOnUD
         MAb1XtMCn/3lpC4gapmNe+wJJXmYQVNJ5+2pOFPrvODAU/4zuO7v13RiM6wLSxsILcjv
         9HuP4O5p+Mpx4YbyqytkaZCphFp9jaYoEi2g4JOc8CmYsngHzwdRUEDe9eA+ql9xnfQE
         Ybww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689949510; x=1690554310;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nsB9IpIa7yRoJhopQrOjvBc0s3b3yy++co3a2B1PcYw=;
        b=I4AOEzKrCigzZ6zQKC8GLS2tE/cQvoApoDbaNUHw0WgFpByhl5jrNXIKVotQ72Oe5n
         cHj1JhwDXkUA9Ps0KwMNGpY1UxOiMmDOmsyvyeUjz7Q5aD90+hit3AYyE43eUVdjHbhJ
         mcFyoyhYjRtgsC90l1ty4BfBkBHNITUdgS+mIzuYt2VhsCXhnjJGy9kM7S0wAdp7V5Jr
         GIp7zsxfQrHIsExeQyg1vGXlCbVFiWQdnnyqkkxxAXKkeR2DqL5j6mM8I5CoYCKIgeFP
         eFo8sACV30Q6eES9Mf/RUMJlc3H3r/7y1SlHkN+nyc0rMQ/9WWMzcIjCR8Ae2J1cUVR0
         48DA==
X-Gm-Message-State: ABy/qLZpjbXEXSj9JGiOH+WLotNIw832Tq3y0rFDZZRwKFpGQZnvcthE
	MEXNy3gTMiXEniWMo0iXuIZszg==
X-Google-Smtp-Source: APBJJlHgaQ/Hte4XJbr1gx4ukptPaEvJZwQtCDry0efXozCJTjG5+/5hX3FKNFwXVDpSO/L62wwYsQ==
X-Received: by 2002:a1c:4b0e:0:b0:3fb:a576:3212 with SMTP id y14-20020a1c4b0e000000b003fba5763212mr1443887wma.39.1689949509998;
        Fri, 21 Jul 2023 07:25:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id q9-20020adff789000000b003142439c7bcsm4349281wrp.80.2023.07.21.07.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 07:25:09 -0700 (PDT)
Message-ID: <4313820e-9ddf-0a34-0cca-e356a4314c61@linaro.org>
Date: Fri, 21 Jul 2023 16:25:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 00/42] ep93xx device tree conversion
Content-Language: en-US
To: nikita.shubin@maquefel.me, Hartley Sweeten
 <hsweeten@visionengravers.com>, Lennert Buytenhek <kernel@wantstofly.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Lukasz Majewski <lukma@denx.de>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Sebastian Reichel <sre@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Damien Le Moal <dlemoal@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andy Shevchenko <andy@kernel.org>,
 Michael Peters <mpeters@embeddedTS.com>, Kris Bahnsen <kris@embeddedTS.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
 linux-input@vger.kernel.org, alsa-devel@alsa-project.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Andrew Lunn <andrew@lunn.ch>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_072514_546217_6442966B 
X-CRM114-Status: GOOD (  14.70  )
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

On 20/07/2023 13:29, Nikita Shubin via B4 Relay wrote:
> This series aims to convert ep93xx from platform to full device tree support.
> 
> The main goal is to receive ACK's to take it via Arnd's arm-soc branch.
> 

This approach makes patchset trickier to review with absolutely huge
Cc-list and inter-dependencies. I don't think this is correct approach.
This should be split per subsystem whenever possible.

Expect more grunts and complains from 50-other people you Cc-ed.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
