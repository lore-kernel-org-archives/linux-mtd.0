Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB222C433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  7 May 2022 12:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HK/9IHOa9OQ3AlaT73zFFVDCZvlQ3P0zaKqW3/AAt6w=; b=VAdPFR1CDNDHSk
	/3eh1jOn9mKuq670tLHjgxkQg3IHGlw5UflPfr/3pVwu2QXohm32kVu/w81YJvBKiETyREybpH7HE
	OW9QWwYF1XN2oLxPJFIDWuQSGF/L7zG5VF18CS1MiBugrocont5A4oh1C775+Dy9Eqp/+bA/2nOss
	6C0mVd7Czog8Tqhci27dBuMWp077Yz3mXPlls0DXtNcrNgI7sBdhyX6vtyOupjnaNhwHgGetXDlcH
	SLMYAa6D73LyDIwd1UMrgvkGz927olVNarU7TywMumt7gPVZn4YB3LRmM1r81jt2+mStvlv5PSc/x
	l642XEb5+emAXieZTqHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnJgl-0079XC-KM; Sat, 07 May 2022 12:37:35 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnJgj-0079WD-9q
 for linux-mtd@lists.infradead.org; Sat, 07 May 2022 12:37:34 +0000
Received: by mail-yb1-xb29.google.com with SMTP id i38so17165843ybj.13
 for <linux-mtd@lists.infradead.org>; Sat, 07 May 2022 05:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JUhgclDR3XBkbKooh+LIAZ5rgGQDmCxwnx2kPnqoYMA=;
 b=KCyiITVKgMi69PaUxMUe8kgt1g0I/YT1BNqXQ8g8jDYzoI10RIuW4XJdIAw+WABgPz
 sIoqAXB0wg2Fv4K4xa+UIk01I93aMUAh5zwWez9Y9woJgUGlFSInLIx46fZ5Gg1s601e
 a5i4HOw7TQkJg5Maw+WvNt0vTtgrsC6dMYDUfidiIqwE2Susa4bkzpuGE1IWxOsZTINs
 CB1T7vFcyxbamcJuoqj4cYj6aPJPj79FjZ60m16yN0qOI1to8EcKMqSlW8ohYQOIT3XX
 Y47JhHbhAM6byKlmpEHLlDWi3VANQBbeKYdvgbjI2HE4GR8wATeJNEQhXZFHSEQQgNal
 1RtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JUhgclDR3XBkbKooh+LIAZ5rgGQDmCxwnx2kPnqoYMA=;
 b=1EqTE0NdCWf1keHlhiZaupC5Sy98XOu2KyUtuqp/myisJtxKHi0RGxDTxWpTYVrAPk
 4euBegOSDFc6xTfbjS6qPyESEx1dWEJ6dAOLUjEnsxiKvc//tbv+fp0IJpXoUwJm1dRr
 BpNFuD5/3x0bkKqyOOERAesz/szOndv2LkYJpTfjsWjlEfaLYF7UVGv+5PK/VgTE8IL2
 S0DFDwshfwrKXzPA/4FCuc4Jb3J6TYWEjaasHLnOOusU2XV0adKCCtOWhfo12nxenWbZ
 8SMlgnFg4dhULn+8EbCz/Viss/rTLxqavjC8ICaiQnWFPLWZazxqz/nb+Jtx84QlsZDk
 MrMg==
X-Gm-Message-State: AOAM53033FG2Hrn0KEwd7mlN2Aptun7LAp5nwb9Kmu6ZBQhh0WnF3zWM
 m7/mnkw+D1CkRhdyfD3cCGMQKiPK0nrDyFx9Ym7+rQ==
X-Google-Smtp-Source: ABdhPJzwJpXEUtAZEUc6bZUPoenoZ5sebSG72if0MOZ/TMe4dt5l953VkaeLr4GysoaOw6EpMxKFJUOEIy1GTdxXArc=
X-Received: by 2002:a25:e684:0:b0:645:d429:78e9 with SMTP id
 d126-20020a25e684000000b00645d42978e9mr6256768ybh.369.1651927052069; Sat, 07
 May 2022 05:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-41-arnd@kernel.org>
In-Reply-To: <20220419163810.2118169-41-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 7 May 2022 14:37:20 +0200
Message-ID: <CACRpkdbHGXfAKiN1sNTrLzRd5Qk-jerhcfvDo8FG=Zq94Dv19g@mail.gmail.com>
Subject: Re: [PATCH 40/48] ARM: pxa: tosa: use gpio lookup for battery
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
 dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org, 
 Sebastian Reichel <sre@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220507_053733_388567_490B4EE1 
X-CRM114-Status: GOOD (  14.66  )
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

On Tue, Apr 19, 2022 at 6:44 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The battery driver uses a lot of GPIO lines, hardcoded from a
> machine header file.
>
> Change it to use a gpiod lookup table instead.
>
> Reviewed-by: Sebastian Reichel <sre@kernel.org>
> Acked-by: Sebastian Reichel <sre@kernel.org>
> Cc: linux-pm@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Oh, I've been iterating a patch for the Tosa charging code
going down in MFD ans ASoC and all:
https://lore.kernel.org/linux-arm-kernel/20220125003741.492954-1-linus.walleij@linaro.org/

I just rebased this on v5.18-rc1 and resent with collected ACKs.

Please take a look at it, and see if you rather take that patch,
at some point I realized I had to go pretty deep around the
legacy code in different subsystems because the MFD device
us spawning a GPIO chip...

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
