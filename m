Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE44C433EF
	for <linux-mtd@archiver.kernel.org>; Sun,  1 May 2022 21:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zoL5MgoXW99GahezpcATJXBB8AHJlsVFe+xLkzmb+Wc=; b=k0D4utKRFtdVXy
	T1IHbXVxuo3tUcxV9r8ArmKnAfsIMxb0nA0Aj2+LxM0m4bUKfEI3wG2T+lri7yuUt9Cxf6qg8HpNM
	wAaugubbKI8N/4/oGkmzWn/4EqpvHVRnCzAmpL8kvAi8dwZho/f1oaIHZTDESpDOcNqAvK1L7taVB
	5Szp7ziQBBKjOmmv2pAbGBYm2c7treIk1c4Frvt58/DCb8bqVTohUEx4GqgEMGrc2GGY2h2yEj+zC
	IKVrOBikKp7o6g25KxVkGfeeaQcOHxqPXUqJjJ12UYMLvqbWPs8mmlqycxxWXCQUx7uScuAJ9uaU5
	Ngma8PQBYcF2GBXwfjzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlHKo-00Gx4L-FO; Sun, 01 May 2022 21:42:30 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlHKc-00Gwz1-Ff
 for linux-mtd@lists.infradead.org; Sun, 01 May 2022 21:42:19 +0000
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2f83983782fso131683557b3.6
 for <linux-mtd@lists.infradead.org>; Sun, 01 May 2022 14:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MwcGhzUMzuQB5fGeykDG23vjACySyYiqBWBdUcZ2GFk=;
 b=GsyTsXTnDN4CY7AA1wrUQT+Y1CVIulHFr4oTp0Tg20CKmvaI7383RxQl+UgGOv+N+2
 7ou2YNXArVG+yi2/xmhm3RwrSr3D5kp2Qgn4DGjh7X2FOJT6wCnWESaCleX/OA9RyV1j
 bwVae0byfjRjtxi5dpkNZn4RfOZ4A1Dd5ugrXFBMXK6tcItRBG80t8J5dKLVZDkoSscm
 wLvaYka4x9i1J8J19EMXqtisuJV8Y/+IS/CbNSohuvWMsp4QiDVXj73xIQP7ss5xnIhF
 n2lEDjG6braJDzS8nQh1+rl3rM6D4gPTo91/XI5EArn82a4AseinskiVs5gU1UTGg9+F
 pAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MwcGhzUMzuQB5fGeykDG23vjACySyYiqBWBdUcZ2GFk=;
 b=0tuYRanEUHhbCvJFSOX5itj6djNiZp8CcL2Frdts6B0ScXAEODO6jBTzBtBlY14mZK
 oT4i7oXitqUlLOYk4HoGvMMNF7l3yzj43+Sm4ZJPmYMN5m3AlLmrALP7gmFH0RyF6Wdr
 L3tiphRlU+WeZUqRr+q/Ypm0kT6zSBsj8u2x4YHUyJ1Jw8BvQ0vqEnRKc2rqJdU46hVD
 5YIoZ7bbJ/5mILDyc/HrwVHYy619aMJP5e1X7XXxX40xrb7kARKholTh8BDX4oN6+Q5s
 TtVNGGDwaDfTeHdP94Lq+dq7J5vMlkgdrKP8InyVrDG4XkvyerFiV91QgpbIRa/CTuB/
 8qCg==
X-Gm-Message-State: AOAM532bYa7THLdVF69xKbfMw9W6obx7H8DZdv2XI7stdkVCVP/Vq00/
 ntZ9hKVGRYaRWhPDKxYzomLijgPExue4+KPIrg5HLQ==
X-Google-Smtp-Source: ABdhPJweSDfNcHOc9BYhAdVgxvU92j70ljyyRr/zhBZuYvLYJv5UF4MYF8uqkqj6NhL3p2ezG4XOpBAT8/G/pJAvCNA=
X-Received: by 2002:a81:2108:0:b0:2f5:6938:b2b8 with SMTP id
 h8-20020a812108000000b002f56938b2b8mr9549829ywh.151.1651441337159; Sun, 01
 May 2022 14:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-21-arnd@kernel.org>
In-Reply-To: <20220419163810.2118169-21-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 1 May 2022 23:42:05 +0200
Message-ID: <CACRpkdY3krNDWcGznSB5fNGM9NXw6xA2qWduDidS1KNM-hbynQ@mail.gmail.com>
Subject: Re: [PATCH 20/48] ARM: pxa: spitz: use gpio descriptors for audio
To: Arnd Bergmann <arnd@kernel.org>
Cc: robert.jarzmik@free.fr, linux-arm-kernel@lists.infradead.org, 
 Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Philipp Zabel <philipp.zabel@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>, 
 Paul Parsons <lost.distance@yahoo.com>, Tomas Cech <sleep_walker@suse.com>, 
 Sergey Lapin <slapin@ossfans.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Dominik Brodowski <linux@dominikbrodowski.net>, Helge Deller <deller@gmx.de>, 
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-ide@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-input@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-leds@vger.kernel.org, linux-mmc@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_144218_587284_27CF903D 
X-CRM114-Status: GOOD (  12.36  )
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

On Tue, Apr 19, 2022 at 6:41 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The audio driver should not use a hardwired gpio number
> from the header. Change it to use a lookup table.
>
> Acked-by: Mark Brown <broonie@kernel.org>
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
