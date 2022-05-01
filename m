Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197BCC433F5
	for <linux-mtd@archiver.kernel.org>; Sun,  1 May 2022 21:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/OEefp/sTam5MxuWLB6scmS9/xxmSA8FgaXLDz0QYg=; b=qM5CZDQrv/dm4U
	P6FIsCYudBNyQEUgdKf7RPHHoJveq8A/FAE94p0eogyv2dohS0IzCfJtu3+ij2r2MoM5t0/fb5qPm
	m6a4OZ3SdvIS34QRyZNYtDzTvd1qTalElu0x9toBGuRHNISlAD/+qcZvmUghnCEnwZvELO5peMO3V
	pdXJLfujzlPJo6cW/GO0odoYHbaNOy6Lq6RJIDDPeFNXcktsP0Be2mGJQvIcl75JMy69PaWPcXJ94
	Gs2ARjZqkXn3gxmwicE57DBX948Oa/+4TnZ6s0MrfNbLoyvv/YhjjN0enFEUZqv5Pias3hckaSP5H
	j7xM9LhOTRkxUrUhRf/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlHOJ-00Gy4S-NI; Sun, 01 May 2022 21:46:08 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlHO2-00Gxu3-8r
 for linux-mtd@lists.infradead.org; Sun, 01 May 2022 21:45:52 +0000
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2f7b815ac06so131771527b3.3
 for <linux-mtd@lists.infradead.org>; Sun, 01 May 2022 14:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o3VTjpYc9+BjQELkkDsO6dDpNInM+ADeLzZMH34mpi4=;
 b=IlP4JxWiKPX4bdEFyXCD3r8ZIjy820mwzPJu5QBfX6JOIDpKbziHZBpvkLwS1biul5
 Vimbnc6q3YqDRk8Lv5gWl87dhWqMWENdviVtYTsAxbIk9GG8htKIqqRPSBp/+9HtETZK
 b/t8bZ+U1wIG7y6zWRcffdetv4BAhU7UA2QEHAQwMXONuSvmCO2rY+CtjgbI5/Ma6YlU
 kWAGtHNrt343kNKsGD+I2Y/6PvJNoiyDTUg4ZMBuoELLk6FST+Q8DrxXYDX/Mansop6f
 o3Bzc8R/DTDYkzc4Hc1n9ke1F4dA09COrrypaspfm37rYZnvy7T/tJTY1N+SNxQtplpo
 NoAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o3VTjpYc9+BjQELkkDsO6dDpNInM+ADeLzZMH34mpi4=;
 b=QpwPzHSQvvNzEIbOx8Mcww12jz1QzdK1J2D421bKcKO4HFQlW+JwE2U+SDxalJqUOH
 OL9rwSdWHg7xGe+3yOOuzOXcZsFyK5DfRw9YquNIW1DsY20Tnzeh4MZPP0yX1rDmu+yx
 rMZFHAy0KPUPcdZuNg64EpI0WEyVXd7XkPMFLBhQ6cVJntOHrTjitXh4suQYtrjTly3q
 mTow1adQ6iXZigPKzBj0eYGam2gFD2Y5WZXSO6dPShyN6qYNl9TGLNQ9fd7yML0jKFkn
 NPuPTTO+s+dVPPzgCFe0Rtp9ZYmxUpscmQlHjbNmrgyQohbj2+GJ/y3K9yiIURv27on9
 IzFw==
X-Gm-Message-State: AOAM53294dovoPVnDZ6kyZLuyGgOElq5grrOzVMIGkcpUMupm0esZ26c
 wYQg5QCCeZMuvXqS5twttNC8QRDa5Ao7fSDdBkWRaw==
X-Google-Smtp-Source: ABdhPJwxWmrDPa3pAAvzVAJiLkxc6AUbWqJKUhGlchnr506qlQhemC8j8o9s5HTpW2MMnSqOK1sjRziG/+tL7yd80+w=
X-Received: by 2002:a0d:e5c6:0:b0:2f8:c866:7af9 with SMTP id
 o189-20020a0de5c6000000b002f8c8667af9mr9171844ywe.268.1651441549128; Sun, 01
 May 2022 14:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-23-arnd@kernel.org>
In-Reply-To: <20220419163810.2118169-23-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 1 May 2022 23:45:37 +0200
Message-ID: <CACRpkdbHyjJ+nbaU0=JSs6yDzFfNnqCJqGiKG_LW4HyAJBw8aw@mail.gmail.com>
Subject: Re: [PATCH 22/48] ARM: pxa: z2: use gpio lookup for audio device
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
X-CRM114-CacheID: sfid-20220501_144550_567327_B9BF6573 
X-CRM114-Status: GOOD (  15.75  )
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
> The audio device is allocated by the audio driver, and it uses a gpio
> number from the mach/z2.h header file.
>
> Change it to use a gpio lookup table for the device allocated by the
> driver to keep the header file local to the machine.
>
> Acked-by: Mark Brown <broonie@kernel.org>
> Cc: alsa-devel@alsa-project.org
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
