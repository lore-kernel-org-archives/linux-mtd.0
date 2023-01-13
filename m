Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E95C54EBD
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 08:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pjMUmq0FYqi95/v+E7nDGje64J4Z8IuIp+IT9kmGD74=; b=VUVzqOb+RqWHTW
	H2tnVhnvg3nKxQlEYtBriguFfxEBS0TZ5ZAYDzNdKQjMq4CvqL3LABjBVIgz92NKXU6uZxaucjTSV
	Dn0GAb0hi7yb3FP5RYJUEXiNjk/8hTnuw8wzUS1tE1hTgq2rMlDYW8tKPtT5Avuin4fUfxj2lzqMm
	r5W+3afdgEJTKlFwfXPekF0tT/+Tqt0ZJ6WcGGP6IXvLkuIbgtMnPQDUczykHF3laydVAAtM2V0GK
	rFpA2LRujeyX/zt2x3e0XZTFoshiev7myhPrDGxTStHbdU9TmyYRATpDLxIsIdjBZY0gZPTXJOUlO
	31bUwWs5bmqJDDDRXuyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFQI-001EM0-DH; Fri, 13 Jan 2023 08:28:26 +0000
Received: from mail-qt1-f173.google.com ([209.85.160.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFQE-001EKF-NY
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2023 08:28:24 +0000
Received: by mail-qt1-f173.google.com with SMTP id d16so5584874qtw.8
        for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2023 00:28:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXxq4tFDMaQ+gaSI4+XgAKyMbRpnWTuq4SxaohX01OI=;
        b=2FGEQ12ZO702SOiY4aHgXjBxdE8jzhuXYs7BeQnI6kdYWHHGCZdEIreRsfPCYdyRWM
         mEYeDl1R9yT+v7NaSEU0sVY7MV3fQBUcAYfJ4O4FUeVdMDBXZr7fK2aIJ3CEm+J5qOR+
         s76W3h7IxPyh+0dFFf0qnPqyG8la6elhygrBuOmygtOKX9cLwmQWWwB9iFa/HHu+II4z
         cPAKPjnVnJ2mj6lg1RbPNBxYqUm/stTRTmKtUYrAjbcMsyeW5EgzkoZk1qtk6ydLTZLS
         4GO24ihC9zQjxE7VugBtLrQrfR4tuwHoM63ixdDrVN2HjtFgBS7H/gCgvuLDH76Rc9+I
         Yyyw==
X-Gm-Message-State: AFqh2krh89LU0E3TJTDxY1TbSKqZFYbx9rJEiQAkfr0LbV9NOpX92iO4
	7iqKXJ9xzxmBBxflY/blay8UDCOLD715lw==
X-Google-Smtp-Source: AMrXdXuRwde/vxUI/MMxq0KuhpXIJyxumlfGz3m9k+kTEQy2YDTN24yZiujeqq+FcGahbJp/zGcHdQ==
X-Received: by 2002:ac8:4d99:0:b0:3a8:1f85:3ab5 with SMTP id a25-20020ac84d99000000b003a81f853ab5mr101792724qtw.11.1673598500484;
        Fri, 13 Jan 2023 00:28:20 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id em8-20020a05622a438800b003a82ca4e81csm4131492qtb.80.2023.01.13.00.28.19
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 00:28:19 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-4d0f843c417so160933407b3.7
        for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2023 00:28:19 -0800 (PST)
X-Received: by 2002:a0d:fb81:0:b0:480:fa10:459e with SMTP id
 l123-20020a0dfb81000000b00480fa10459emr889474ywf.283.1673598499239; Fri, 13
 Jan 2023 00:28:19 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de> <20230113062339.1909087-11-hch@lst.de>
In-Reply-To: <20230113062339.1909087-11-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jan 2023 09:28:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVLT5G7spdbkB=sx6ZZraXzNFgENxLwg1PMrFnVERn_Tw@mail.gmail.com>
Message-ID: <CAMuHMdVLT5G7spdbkB=sx6ZZraXzNFgENxLwg1PMrFnVERn_Tw@mail.gmail.com>
Subject: Re: [PATCH 10/22] input: remove sh_keysc
To: Christoph Hellwig <hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-kernel@vger.kernel.org, 
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
X-CRM114-CacheID: sfid-20230113_002822_793927_B196E602 
X-CRM114-Status: GOOD (  26.44  )
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
>  drivers/input/keyboard/Kconfig    |  10 -
>  drivers/input/keyboard/Makefile   |   1 -
>  drivers/input/keyboard/sh_keysc.c | 334 ------------------------------
>  3 files changed, 345 deletions(-)
>  delete mode 100644 drivers/input/keyboard/sh_keysc.c
>
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index 84490915ae4d5a..882ec5fef214ac 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -625,16 +625,6 @@ config KEYBOARD_SUNKBD
>           To compile this driver as a module, choose M here: the
>           module will be called sunkbd.
>
> -config KEYBOARD_SH_KEYSC
> -       tristate "SuperH KEYSC keypad support"
> -       depends on ARCH_SHMOBILE || COMPILE_TEST
> -       help
> -         Say Y here if you want to use a keypad attached to the KEYSC block
> -         on SuperH processors such as sh7722 and sh7343.

FTR, this hardware block is also present on the ARM-based
SH-Mobile AG5, and R-Mobile A1 and APE6 SoCs.
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
