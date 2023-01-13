Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49665C54EBE
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 08:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHMkfQft+M0Xjiu12g9TmjtKdrJ5bhckVrVtabZon7I=; b=ld7Cp7N5axkG4d
	zUMhRWrA7LRVhVXVnktW7U1NIQLghkVstSPr4OvF54sNoD+wvUHiQ1zs5LwvvyJpxe8Un5yemC7Xk
	mC0iXfGVD/32HT7yudTJtHRF3ulbJSigbiQMBrDoiZqVpsEAzpmg7e8mi0eweX3Mts1OebA01c1C/
	Bfv7jZByA69d8hEGYd+3BD2L6er2Sr1sZSUjSz29kgvomUzXYnBdToAmiBy5239A6zbplyDi8U00s
	qCs0pyV+XGnegDdko1zDZ17SABVg0QFse9afx4tUIbOyM9+3KD+eV19lLb3yUUMq5lzCLRcxy9i/y
	STsxTc0P6DBCDpKkfokQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFSp-001Etc-VT; Fri, 13 Jan 2023 08:31:04 +0000
Received: from mail-qt1-f181.google.com ([209.85.160.181])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFSm-001Esx-Ju
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2023 08:31:02 +0000
Received: by mail-qt1-f181.google.com with SMTP id bp44so18653846qtb.0
        for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2023 00:31:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5kunZU7S+tV+EkJ89PAjAGhUsATazsdxcPmCZjz3Piw=;
        b=7z0JbdwO5X/poU0TUj9WSel4qspLrnfNxUvC5D7jRtsvw0qDO6J5NvA8n1KG/qfHXO
         XIBoe/mjqVRy3fl1lX+YsZAc9gGhFd0K2VUuUBtra1wM0M1vsJ50V5AoN5IsdD2kJvht
         KMPUHXrztLet9V2AyH4n/JMdC/4v4RN+nV+nMd0Y/IJAKQCzHnhOgCxZXg8x5qLTpP3r
         Kx4ToLi6W0RX2EgUB+19lK+6i5JJKtGUswD4M2uEy6zXad9T2VnoQvRZp1mGu4arbihg
         Tvxuk8/Jt0ZIKGKRqFQjQ2oAbtTpwPMaMlGYwWk5TcTRgxRPEPUVx4CO58LjJ3YwsUyY
         dbEQ==
X-Gm-Message-State: AFqh2kodiBi3sup7jj1MhTc6PxAIZUX88TkmjUACK/ppRjaojFG3hxva
	B4c8uBiEh3jziTdJB1K+jhttZPWOe1aubg==
X-Google-Smtp-Source: AMrXdXveB3Q6Qc4oBsHfvA5xCSLjdR6haB1FYAdUQV+23WKF4pJT1n6jS9zpwc2XyH7lA4Fiqth3iw==
X-Received: by 2002:a05:622a:5094:b0:3a8:30c9:ba8f with SMTP id fp20-20020a05622a509400b003a830c9ba8fmr121675170qtb.28.1673598659486;
        Fri, 13 Jan 2023 00:30:59 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id u12-20020a05620a430c00b006ee949b8051sm12208056qko.51.2023.01.13.00.30.58
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 00:30:59 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-4b6255ce5baso274177787b3.11
        for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2023 00:30:58 -0800 (PST)
X-Received: by 2002:a05:690c:313:b0:37e:6806:a5f9 with SMTP id
 bg19-20020a05690c031300b0037e6806a5f9mr3492728ywb.47.1673598658639; Fri, 13
 Jan 2023 00:30:58 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de> <20230113062339.1909087-12-hch@lst.de>
In-Reply-To: <20230113062339.1909087-12-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jan 2023 09:30:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXYt4dNHUDsTnPa-RP+sdK=35nNa9xQzMChwK54qO44mA@mail.gmail.com>
Message-ID: <CAMuHMdXYt4dNHUDsTnPa-RP+sdK=35nNa9xQzMChwK54qO44mA@mail.gmail.com>
Subject: Re: [PATCH 11/22] mtd/nand: remove sh_flctl
To: Christoph Hellwig <hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, dmaengine@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-sh@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_003100_800042_15B74C94 
X-CRM114-Status: GOOD (  26.50  )
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

On Fri, Jan 13, 2023 at 7:24 AM Christoph Hellwig <hch@lst.de> wrote:
> Now that arch/sh is removed this driver is dead code.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/mtd/nand/raw/Kconfig    |    8 -
>  drivers/mtd/nand/raw/Makefile   |    1 -
>  drivers/mtd/nand/raw/sh_flctl.c | 1234 -------------------------------
>  include/linux/mtd/sh_flctl.h    |  180 -----
>  4 files changed, 1423 deletions(-)
>  delete mode 100644 drivers/mtd/nand/raw/sh_flctl.c
>  delete mode 100644 include/linux/mtd/sh_flctl.h
>
> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
> index 98ea1c9e65c8ef..20a4988ea418d5 100644
> --- a/drivers/mtd/nand/raw/Kconfig
> +++ b/drivers/mtd/nand/raw/Kconfig
> @@ -284,14 +284,6 @@ config MTD_NAND_MXC
>           This enables the driver for the NAND flash controller on the
>           MXC processors.
>
> -config MTD_NAND_SH_FLCTL
> -       tristate "Renesas SuperH FLCTL NAND controller"
> -       depends on SUPERH || COMPILE_TEST
> -       depends on HAS_IOMEM
> -       help
> -         Several Renesas SuperH CPU has FLCTL. This option enables support
> -         for NAND Flash using FLCTL.

FTR, this hardware block is also present on the ARM-based
SH-Mobile AG5 and R-Mobile A1 SoCs.
Again, no DT support.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
