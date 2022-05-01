Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B125C433F5
	for <linux-mtd@archiver.kernel.org>; Sun,  1 May 2022 21:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GgRIlYuw94ZFbdBImy79fSKFTgdhXTuLto1Cn/Ce+JE=; b=DxOEQnaH+x5bpi
	rbibsQRVC1bjwcZr3nb27xM3g9zg02keIAGsvizYAD+/uDd1vYmOlnqOfTVh13AZQBLrCrnAPE9fP
	lulqaDwDXYZS2/btW7eN1h+oVkBrzIvSfNar/B9R5JTSe0SLisJI5JvKdI9T+Qcez3CMr1siQ+Zs7
	jSa1p9+ribj2JPOsWKH1N/dtOS+tEF3aRBSW48bRp/38EMFNLm1tlwLKQyXkPJINAUXxeW94770iR
	nOWIHxwJhb7gDhheoc+A4MMulAQHFTUYDQKnCjw4OZ95Jok1HYPABXBJz0budfO6mW0dEL/8FIew9
	zNRwuox77uVoxzWYkULQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlHQx-00Gz9s-Q2; Sun, 01 May 2022 21:48:51 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlHQh-00Gz11-IH
 for linux-mtd@lists.infradead.org; Sun, 01 May 2022 21:48:36 +0000
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2ef5380669cso131603897b3.9
 for <linux-mtd@lists.infradead.org>; Sun, 01 May 2022 14:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IF3vEg3+jPF9cVJcI8jPci4JS9DP0GVP7RD7934mEjE=;
 b=zwY5ZnqN7kNhGK99pE/WVaiRJMMJk1J46UwT4pwImXGX6UOmFH90vIl3pqBFOiefpf
 XGDauOFPVnr0N+wehwWqxGedJrPEnCfA7QYfI1Ud6pUqjR0VJCUMCPCgmokVJfJlO5J3
 9fgUKiXoKaLiNlZ2lnMOc8odLW1cWM39J6DifJp1VzhPP3yFCswh3y7kpJGPLRycUKkx
 MOm6n0oCCKvOF9FQQTqGTr1+Nj0qDNWhyJnFD6sUHzDc8vvEHbsUWHtvJVGJUVLO7jGU
 zEl/kVv1ENb3aFDPeJIshWrcYr3gbS2Bho2vG2ESmIY+jYGxLU0tAEUviHdRTMa60iKl
 bN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IF3vEg3+jPF9cVJcI8jPci4JS9DP0GVP7RD7934mEjE=;
 b=08dPSz74kUJ0cwN6eB3nhnUC1Jni2rQAK9cNZUCJqQN6ymolOmBm3vaHLEjc1/ppZg
 G+tKRMzx3HXnm29VxMCvJwtWRZnf49THqdXV8/o51x4ZMM5YcJXGtoarOhNWCpsNheKq
 41vSk8p7an1+CvpE9ff1u9rUeyaPfMDa/SIocvQdyqXkKoCHIXyxU7jQAeAESJ2ea0wz
 f445Kg7a6fCwWWWGYMvmTnDByqiEsv1vHgB8zrf8gU5HjzhluCIFWELwEW9mYQBnnNfC
 fu18wi00O3mF2IeiicjdBT5bEBf8N/MYcoLFrJHA/FxipNHFyIGGD6SA5CVp2oP+tnqi
 Uucw==
X-Gm-Message-State: AOAM533h2emeq9mJaE3zAONxrYQkEPosGwEPsjvVVEstG0vYx7lN4sZ/
 A3w2KnX9XvEWT8wV305qkk0k4rrp/gjCHFj9Yyu83A==
X-Google-Smtp-Source: ABdhPJyC4yrP3wkFWKCa3+OUAbpp0OAp6QL2ydyOZCULhsvaONngjc+9/s4GocTjYt3qkP0LOVwZrKfaB6+LtqaJLgI=
X-Received: by 2002:a0d:f0c3:0:b0:2f4:d291:9dde with SMTP id
 z186-20020a0df0c3000000b002f4d2919ddemr9084184ywe.437.1651441714674; Sun, 01
 May 2022 14:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-25-arnd@kernel.org>
In-Reply-To: <20220419163810.2118169-25-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 1 May 2022 23:48:23 +0200
Message-ID: <CACRpkdb8kDuia5udsUSF0f2rvPeyYGoxeUVV_ppAvEaA7cRxiQ@mail.gmail.com>
Subject: Re: [PATCH 24/48] ARM: pxa: mainstone-wm97xx: use gpio lookup table
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
X-CRM114-CacheID: sfid-20220501_144835_676083_D716F729 
X-CRM114-Status: GOOD (  12.17  )
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

On Tue, Apr 19, 2022 at 6:42 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> This driver hardcodes gpio numbers without a header file.
> Use lookup tables instead.
>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
