Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9D6C54EBE
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 08:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qv6Wr9r05VoB3fu2An11BnEFbsws9rxAnU8nNOQrZbc=; b=UVfXWl8+rmJGdc
	7fDut8j3h8mmYKzc+x+9TJxzOPhy2YAEu1Clq1Kp4uZ5upvRULpgUp18R5D8588siUm1TpEw3CZ8P
	teiQFnMIiMEAS3L7GciKXfXzlU9jT8qvUVsks5MaXOkEaQy+mFcng9GQE2v6y63LXTyccby92KjCU
	p2/88ur19/cWMfJ+7aWUuFvpXIC/JK6eRaY6iSmdulsfSh6ouZGte8w4QNUNOXMnui6ZOIOBVmOnj
	tXTcEOFvRjSssDS2+gkaYxPd54mryHgmwUsIJ/PcFBxpqmBzbuirBx0bBgwh06uqiZuDe1tsas1W/
	5By9adt8dhwsNf/NoOFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFuC-001Lz1-89; Fri, 13 Jan 2023 08:59:20 +0000
Received: from mail-qt1-f170.google.com ([209.85.160.170])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFu9-001Ly6-35
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2023 08:59:18 +0000
Received: by mail-qt1-f170.google.com with SMTP id d16so5627365qtw.8
        for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2023 00:59:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HIx/98EgJxXRPw6eabRyCtMqFo85a6og6EquEgJiRDY=;
        b=kA5HZSwrBR2N8l+HO90tDGETUavN/aEcdWw3YCI8DWwtTjkMOIayeVx4sbCuWA5zju
         jzdKJDT8TH9d9Y1ka3Iseji0P3xo75plXjwip/V2iUlg3HMxgkIrVia/xDd2GO2BcFAS
         8/AHJaDvaHAUdgrhUySUn12Gw1VATezDZ9JUIlb4TZJR+ceNjHDwLXfH5hfay3U71ejm
         6rCwkzz/FVy5GJDSO84Yr+p+MTXZApe4l/DOsZgdaL1FeiMbqojoqYwyA0WgjTkVe8m4
         v5rhzsdZtdRdAiv99LGd/q0HxkVeuOToe6+N8cdEvrDBYWFJXbSqJS7qV8kBBJywhDXd
         pUQw==
X-Gm-Message-State: AFqh2kqf+nLbJc9tBILBsaBU1Hwm7EqRLlPiXz7+345k4Tt06zTCnfP5
	ZxRIRUvMPjWwgM12g0UQrdrccHw5TPXH/Q==
X-Google-Smtp-Source: AMrXdXvmSz1iRP99nQ/lCJ2Q9dfhls+pySSdbN+kwboZAnTUwlsbqVeYk1ezZ2CUiUMELR+Vk/ANDg==
X-Received: by 2002:ac8:6e8c:0:b0:3a5:fbfc:e3dd with SMTP id c12-20020ac86e8c000000b003a5fbfce3ddmr19340666qtv.18.1673600354509;
        Fri, 13 Jan 2023 00:59:14 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id a19-20020ac81093000000b0039a610a04b1sm10243391qtj.37.2023.01.13.00.59.13
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 00:59:13 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id o75so21655266yba.2
        for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2023 00:59:13 -0800 (PST)
X-Received: by 2002:a25:7:0:b0:7c1:b2e9:7e71 with SMTP id 7-20020a250007000000b007c1b2e97e71mr838217yba.604.1673600353257;
 Fri, 13 Jan 2023 00:59:13 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de> <20230113062339.1909087-3-hch@lst.de>
In-Reply-To: <20230113062339.1909087-3-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jan 2023 09:59:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVM3BpvVD3c4gp1OidnwF5zFd4MJecij7zWBnahzNaSNw@mail.gmail.com>
Message-ID: <CAMuHMdVM3BpvVD3c4gp1OidnwF5zFd4MJecij7zWBnahzNaSNw@mail.gmail.com>
Subject: Re: [PATCH 02/22] usb: remove the dead USB_OHCI_SH option
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
X-CRM114-CacheID: sfid-20230113_005917_156279_A4F7923B 
X-CRM114-Status: GOOD (  26.65  )
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

Hi Christoph,

On Fri, Jan 13, 2023 at 7:23 AM Christoph Hellwig <hch@lst.de> wrote:
> USB_OHCI_SH is a dummy option that never builds any code, remove it.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks for your patch!
Nice catch!

> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -548,17 +548,6 @@ config USB_OHCI_HCD_SSB
>
>           If unsure, say N.
>
> -config USB_OHCI_SH
> -       bool "OHCI support for SuperH USB controller (DEPRECATED)"
> -       depends on SUPERH || COMPILE_TEST
> -       select USB_OHCI_HCD_PLATFORM
> -       help
> -         This option is deprecated now and the driver was removed, use
> -         USB_OHCI_HCD_PLATFORM instead.
> -
> -         Enables support for the on-chip OHCI controller on the SuperH.
> -         If you use the PCI OHCI controller, this option is not necessary.
> -

At this point in the series, there are still selects and enablements of
USB_OHCI_SH in arch/sh/Kconfig and arch/sh/configs/sh7757lcr_defconfig.
I think it would be good to replace them by USB_OHCI_HCD_PLATFORM first,
to decouple the fate of this patch from the rest of the series.

>  config USB_OHCI_EXYNOS
>         tristate "OHCI support for Samsung S5P/Exynos SoC Series"
>         depends on ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST

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
