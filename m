Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC11C433F5
	for <linux-mtd@archiver.kernel.org>; Sun,  1 May 2022 21:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2QHJkGd9apPk5rfQgXOif3W+sz3soeUvbYb5l3AW+Rs=; b=uk47/DN4ok98AI
	mxDL64wrJDVZfmmhkUg2aQRduW5ARxOWmR585eNrKItT2Wjliqceov3vjhPuE8H80L2RJKrKDWFMq
	GvFHGdQD9jX0vC8dsM0Qt0caP8VaJUgisU9mf4FEexvleB8dNcR/ADI/2mBb9HEySSj2wy7gDJWP6
	QdnEXZTbuos1sWBI/q3iDvc+4n6ca2v7t1jCdpOBdZDnmNW9o7g3U577HFXzmMH30TyQ/mPFDAU6Z
	dgFkczrW4ieRieCExcIMP7MznCWZ59KZQjJzTgHcj3PQ269h3mBdXKB9pgQLCPW9+UPrb0p5WbCqv
	LDoRNVdhBexrMDUz7+6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlHP8-00GyPv-4p; Sun, 01 May 2022 21:46:58 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlHP3-00GyNN-Se
 for linux-mtd@lists.infradead.org; Sun, 01 May 2022 21:46:55 +0000
Received: by mail-yb1-xb34.google.com with SMTP id y2so23314255ybi.7
 for <linux-mtd@lists.infradead.org>; Sun, 01 May 2022 14:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zq6K9saDLXhP7BxFMvj2X0QgCPUGvX8QgZ62vdX2sZo=;
 b=b56QSIAKajlp3SMBgHss1IzdehuBQLfOOUe4Tfk2wceg5aZOjhyzaAraZSsRsxoepB
 T8YTKh87idYcNsip2eky0LkWSFfYqfwW21PmXYM1S2L9+no2J2ueA//PZMIBEo+aPJtN
 1HuPxtMchjnz1+D/wg35eGRHOIgXhYznfLxLdDusr7/th/+x0czHh2iIS/fDbKmDbc3Q
 dobiOYYNRhRmCfl2HdzBFzUiAbktvGtKUiWDjWg7LMESnVhrwKPd5lAj0RCS85mNJsLv
 KuXCagsd5iWRaUpEEL7oM08GkKdfGS32T8WUWK4KU2O3dMa62pyQCJ13DoPOuiHI9xnu
 Os7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zq6K9saDLXhP7BxFMvj2X0QgCPUGvX8QgZ62vdX2sZo=;
 b=jVRrlWmOxOvwvwfzNNePARxJ2cBD0fU043ffxT8/gqglMzbSvM7tZrO1ixueJXKcnk
 u7TA059dKh0HNNB+/E0LOmEaBQEwzWOrBqiB5M0wp3i95nZ0MSlWvaE4neYuJDqGXiLB
 H3ptzSyVju7LH4hL4CDbzEW39HISI7YGZWBYBtEN998X1jPWOj7ZgDK5J8Wsoa8qnOci
 NlVwXYQFYawel9XNqmS4fX2HdUAO2do4ahNOyYWp5SnrxOeBnSwT4YJXzmika+wfr9nx
 Qe8VcHyYvApmmVn86aZxA2/n4EnfuWyFvcA2/Ws/CvYYK3FYmk310/wKHbSIBanlGXNW
 a1gw==
X-Gm-Message-State: AOAM532ciYDbPP0QKFlkCgy8n+T09xowmdw3YhlGFGsRFVvfTg65fnk5
 xmlmLeHlTu4Va3HjtDI0twz3fZEdirVKD3D5VASC1A==
X-Google-Smtp-Source: ABdhPJy2G1jdmYo0heXLaVkR+a7vuNFN5u4CZrDYPU1PhfEKz0BCtaze6Mx718uPeKKIvck5ypqKaqItjLfZ41hpEHc=
X-Received: by 2002:a5b:451:0:b0:648:2a28:973f with SMTP id
 s17-20020a5b0451000000b006482a28973fmr8652903ybp.291.1651441612710; Sun, 01
 May 2022 14:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-24-arnd@kernel.org>
In-Reply-To: <20220419163810.2118169-24-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 1 May 2022 23:46:41 +0200
Message-ID: <CACRpkdZPgobmsrAggERHw9f0VJV__Q6TL+DdU6sFd-io8feYLQ@mail.gmail.com>
Subject: Re: [PATCH 23/48] ARM: pxa: magician: use platform driver for audio
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
X-CRM114-CacheID: sfid-20220501_144653_988056_5FD4EBFA 
X-CRM114-Status: GOOD (  13.72  )
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
> The magician audio driver creates a codec device and gets
> data from a board specific header file, both of which is
> a bit suspicious. Move these into the board file itself,
> using a gpio lookup table.
>
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
