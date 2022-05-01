Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFD3C433F5
	for <linux-mtd@archiver.kernel.org>; Sun,  1 May 2022 21:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wHs7k39YdQNiOFxaF1EwqY0Z4f26NuO/hpqh+XgORBw=; b=tI7PL1NGw3DnrI
	BjbZA9j3wZXdp3Bf0bTFMOnPyDBBmu933GpyxViGMAgjmZ8GWnMN3g7Efw+7ztTxdWigfBNZMTtj8
	z+tTmxRgwqYW5HNyHMVtaZGwENpvtLKgvkWVWodRkCQ6YPi+0YwYCxbp5XP7WZkBwTvQjNr8+8+35
	h8/J3sIBEY28ElyECuGdGdkJelVsArWLZopuhRtAcRE1YCDNXNkdcefT62Bl2pETYs4zC7G4IhhoX
	9JuKDgcgaVDpM4o+cCpnlaInyfP1JqMsBbXgUCJr+KOYd6EYmKGrG3Q+ZUrfbzD5JLfI6f1FC+Ybu
	tNamblNFvLR1WloZKzIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlHED-00GvnX-MF; Sun, 01 May 2022 21:35:41 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlHEA-00GvmC-Id
 for linux-mtd@lists.infradead.org; Sun, 01 May 2022 21:35:39 +0000
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2f7c57ee6feso131686907b3.2
 for <linux-mtd@lists.infradead.org>; Sun, 01 May 2022 14:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T254pOQ0OrSDi8zN/59MRP0JPU9NfQ5B5Rmbgtdrkko=;
 b=wlpA+CfyvX91ALnfVCMPP166Rc0Mpatt42DsMvCkWJmeZUVRfB6mnUYecnMGRNYbhI
 ld8YsssomjW9oCtQmr15blAmBLS+t4KouSWHxbIZVjnsq1DnJlp8Fx6XNCVuGUF0GS/N
 6klXRU6dGXOQupaFrwlX9Yah5rEs29v06x/UCbuJ/f0GQoJQPiBvrEccSjVf/VH42K7p
 RwLGlqfP5o3h1uwBR8xQuBvPKaAX5Sq4RHEUwFvP/y5fx9owfyl5p9sMhmOT/ahPJUD6
 7q+tV1u5MOsspWP4YhNR748kjKGgc9lX4NNszXKAVeEM0jxtUxFRG3LYR6gGsd4NYws0
 Yv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T254pOQ0OrSDi8zN/59MRP0JPU9NfQ5B5Rmbgtdrkko=;
 b=p6ta5189eSoJMgySgjOhOsbQ6CYqIn9cQzAZFGWIC4BSg8n3kpSdz/5JcvksBgNngA
 tDqDeAo04iaE0vsoD5IfuSxR9FuXWS4nLiTrqnzrMmCftNVPN1zCcPDZ2ADwacqMiyWa
 NyFiSe0CsHnnTv90bXxdz0ccRIyluklQcem8FxFFMBgUeSg0S38Fd+eWJBV47j/0lRZc
 qHSCvgXETKlizP13vjlJEfOYkVijNMtMsXwrtL8QxD58VBKMgrS4G+VsQltl8eS2eZq/
 lnV69fQx7KyHUwXAhCxmTB20HwDZON355NLHrbsaVyNtq62FfS0zEDFkWa4sLTPOUbCq
 zqaw==
X-Gm-Message-State: AOAM533vBAVYfJewUZkOP84VQirJc07e2tpQa5n28GXmW2Gw5m47i3wE
 FqpNhOdHdDXTpQLlK5eOk1YhIYZpOgS4Eo2VIjnamg==
X-Google-Smtp-Source: ABdhPJyiNIf7FX2G9hbcHdCnWtNprAICIXfmTZ2O7M9XljL3Duwj1WbWX/AgvgI1z1Nmh9oOd4l1d7OyIUiw7QC5qEY=
X-Received: by 2002:a0d:ddc6:0:b0:2f8:a506:a5c0 with SMTP id
 g189-20020a0dddc6000000b002f8a506a5c0mr9543818ywe.140.1651440937377; Sun, 01
 May 2022 14:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-18-arnd@kernel.org>
In-Reply-To: <20220419163810.2118169-18-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 1 May 2022 23:35:26 +0200
Message-ID: <CACRpkda10Cv9W07FjO4Ww58V_cgP05Thz-7cv6aF=QC8iW2vDA@mail.gmail.com>
Subject: Re: [PATCH 17/48] ARM: pxa: corgi: use gpio descriptors for audio
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
X-CRM114-CacheID: sfid-20220501_143538_665446_39274C49 
X-CRM114-Status: GOOD (  12.87  )
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
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
