Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008B1C54EBD
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 08:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K2zkoGhsw0s7BpP9qjqxv2dZral/2LBdrB370r/Oeik=; b=OGkBLMsJnn/fDF
	YibJA2WB8Xok1qeAc7sAUeo6K5THBHnEJ3iDy7eg7GavBDwgHkGhuIer0qpB+Ma2LfeX96AOlOCT3
	pDRq44Ctdg6uBWIaRA9O6Ut9cUQ66EEtRvl1bIREMvLEfAPsjcIrlGfK6mR8yxmKhUs+o+ycDc76V
	0mF17Fp4nTRIRjz/dTFaPVUM1KdVRDEv+FZ20RknsHxtwIMKePQX5Dn2P3/NWWNY4tTNNX8PQNfqo
	Uko0imzH5GBNEQog9v1cm2tprz1oCy/mJYv/8Rp2N3p2UxtprZRtHToeF+38SLMpUwrQa9vJNFQ2g
	5fVrVXPY1/+OQuHEe+cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFpC-001KsR-9g; Fri, 13 Jan 2023 08:54:10 +0000
Received: from mail-qt1-f182.google.com ([209.85.160.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFp9-001Krl-Lf
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2023 08:54:08 +0000
Received: by mail-qt1-f182.google.com with SMTP id s5so14121744qtx.6
        for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2023 00:54:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iHH87Wz4eqdDYk3yPRdInSdOf4/Qu/uaLfX4LZwjHtY=;
        b=jq35Dpw1dmd6/vStvUSW7zr4BAL2v1K66dHG7ceqXe5ArktNNlQ+1v6lN7i45qkrFX
         K0qWq4rdcpeU7y8e2kXs0cz9CT0CGq4Fx5BBiPJoOSYAYNSMcCGQB5FU2iXLFIU12n6k
         5bKbypnkbCJ77OIdt8PEycu71RiL+IAt/WU1HciZi+DMvHCtPktqV8GCfMhUbpvch8lI
         EEIMYE+FcnZEbgTLDRLMBkinZUxjNOGzG/QgNHRpDBT+2AYvCNivNTUp+KhVM097VkGH
         xXjXddkAhsrifLulVMO1BkDIyikZE0Xk42ThwjTPQeuPiMWJU0cCstd0Re6xTZ6+PuUO
         M02w==
X-Gm-Message-State: AFqh2komgcI9uTT2WdZ6dtonZnz9HWQEtuomahmXIOLgd5gKCYfnRaWd
	iYXF+Xjpgn9rUVgAGeocTCjFY470iMBVww==
X-Google-Smtp-Source: AMrXdXt4U0p5/yv0pFNQQC+PEeH9Ozn4j3ApQmJpxxWKucP+q0Njpr6ZSZmXqatD3NFWEhJj8Nq7Zg==
X-Received: by 2002:a05:622a:4a0f:b0:3ab:5bbc:bbe3 with SMTP id fv15-20020a05622a4a0f00b003ab5bbcbbe3mr117654429qtb.19.1673600046665;
        Fri, 13 Jan 2023 00:54:06 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id f1-20020ac81341000000b003a6a19ee4f0sm10241300qtj.33.2023.01.13.00.54.05
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 00:54:06 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id a9so4939075ybb.3
        for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2023 00:54:05 -0800 (PST)
X-Received: by 2002:a25:d095:0:b0:7b6:daae:ad50 with SMTP id
 h143-20020a25d095000000b007b6daaead50mr3261996ybg.89.1673600045570; Fri, 13
 Jan 2023 00:54:05 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de> <20230113062339.1909087-20-hch@lst.de>
In-Reply-To: <20230113062339.1909087-20-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jan 2023 09:53:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWLZF3uF8+Bs8FL__x=MyZPPBUqX-Q6XVQS3B08re-vZw@mail.gmail.com>
Message-ID: <CAMuHMdWLZF3uF8+Bs8FL__x=MyZPPBUqX-Q6XVQS3B08re-vZw@mail.gmail.com>
Subject: Re: [PATCH 19/22] fbdev: remove sh7760fb
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
X-CRM114-CacheID: sfid-20230113_005407_726656_76E67E5C 
X-CRM114-Status: GOOD (  20.21  )
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

On Fri, Jan 13, 2023 at 7:25 AM Christoph Hellwig <hch@lst.de> wrote:
> Now that arch/sh is removed this driver is dead code.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks for your patch!

> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -1861,7 +1861,7 @@ config FB_W100
>  config FB_SH_MOBILE_LCDC
>         tristate "SuperH Mobile LCDC framebuffer support"
>         depends on FB && HAVE_CLK && HAS_IOMEM
> -       depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
> +       depends on ARCH_RENESAS || COMPILE_TEST

Nit: this part should be a separate patch.

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
