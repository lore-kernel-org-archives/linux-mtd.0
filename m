Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB69C54EBD
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 08:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W6UqOWpMC1I+XIhv74JE+I8oyHqQQEGiEv1h5i76X4Q=; b=uVkTj6Y97X+NYl
	7qUBgra/FKpiWMhIFxqx9aHQcGK7Gxmt9BGtppo09H6sYYcJH+3h3o/oC4wfS0ZuGTtMkGWLmQtIs
	6SpwSSV0dUF5yEB+V66y4O0IaIpqyyweS5B2KllPMJORp604Sb9kI9Eze+3hYMjJzCSiJfV4nRHY5
	J3X4mVtXQHyRdtwmJoLwB40VPdz+3im4xzR+AQzYgiek2p+PbWJzTRLT0XM8wU9+WtFk8IomtjGUV
	NeS8pqBAe0R6zPccQQgzxFD2GF5LU2mu8piVZhmP8b0a7m8tToIqDD2oVziJ8cE8l5TCrhlxGyEuY
	ncnoCfbuAobCK3kUahsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFI2-001BTu-CB; Fri, 13 Jan 2023 08:19:54 +0000
Received: from mail-qt1-f182.google.com ([209.85.160.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFHy-001BQn-6Y
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2023 08:19:52 +0000
Received: by mail-qt1-f182.google.com with SMTP id h21so18398034qta.12
        for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2023 00:19:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MowQaQp0G9uX2jhG1rQLtIGSPC7S+MJhKLN+g9WmpVM=;
        b=f+H+NSXR/HGQBvxmtfryq/uQYXhIqOxjl9ovYwe1fx29ql31M3vwFu6XRT0PuyiYrg
         lmLEIkTj1kZKfZYI2mVvZ7YKVZQVIMvyLfjzoXhDZTJGkkwOKZ4TWcAefa4obM84UCAt
         kG3Lui1X2YAtHQGSnMyWHd6J/UtJBs5TiKimUp0byVt1e23JOywHLA7fGpAcKGQNqxb+
         KkyGJZ9o02Eh4d31vIJ/dp2aNGW/NGshuKk7jOyoutJyrJYVRgikWjjcU6X8ycAKjIb4
         dSRHA1DvNq6hf20j3/Lyph1D8qR0p27ciNKr28QcmSag70/IrcLThEV2YmwVj0R39zsB
         fOFg==
X-Gm-Message-State: AFqh2kp3GMeii57vPGiyOyyRE8Du6/Az9soKpVFn0w8vb2qiS8BgIu2U
	q9r81LkxG0iefmcSVET3guzXKV0QXdMvLA==
X-Google-Smtp-Source: AMrXdXvCDj7RoUR9y2mP1CTNzJ3BvctwhYF3QOrfJvyoygm7Z1mzooNxv8huIwaQqq6oU0HSjIPSxA==
X-Received: by 2002:a05:622a:18a8:b0:3b1:4a8:4665 with SMTP id v40-20020a05622a18a800b003b104a84665mr14803509qtc.62.1673597986971;
        Fri, 13 Jan 2023 00:19:46 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id s15-20020a05620a254f00b007056237b41bsm12245699qko.67.2023.01.13.00.19.46
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 00:19:46 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-4d0f843c417so160699787b3.7
        for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2023 00:19:46 -0800 (PST)
X-Received: by 2002:a05:690c:313:b0:37e:6806:a5f9 with SMTP id
 bg19-20020a05690c031300b0037e6806a5f9mr3489142ywb.47.1673597985912; Fri, 13
 Jan 2023 00:19:45 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de> <20230113062339.1909087-2-hch@lst.de>
 <Y8EMZ0GI5rtor9xr@pendragon.ideasonboard.com> <Y8EOWGVmwEElKGE4@pendragon.ideasonboard.com>
In-Reply-To: <Y8EOWGVmwEElKGE4@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jan 2023 09:19:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXRkUu3AuLs7X30ki1votAQfBU3HWvWB6qMQJBSUEr6WA@mail.gmail.com>
Message-ID: <CAMuHMdXRkUu3AuLs7X30ki1votAQfBU3HWvWB6qMQJBSUEr6WA@mail.gmail.com>
Subject: Re: [PATCH 01/22] gpu/drm: remove the shmobile drm driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Christoph Hellwig <hch@lst.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
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
X-CRM114-CacheID: sfid-20230113_001950_270226_D0F7084E 
X-CRM114-Status: GOOD (  32.31  )
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

On Fri, Jan 13, 2023 at 8:55 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Jan 13, 2023 at 09:46:49AM +0200, Laurent Pinchart wrote:
> > On Fri, Jan 13, 2023 at 07:23:18AM +0100, Christoph Hellwig wrote:
> > > This driver depends on ARM && ARCH_SHMOBILE, but ARCH_SHMOBILE can only be
> > > set for each/sh, making the driver dead code except for the COMPILE_TEST
> > > case.
> > >
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> >
> > No objection from me.
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> To expand a little bit on this, ARCH_SHMOBILE used to be set for the
> ARM-based shmobile SoCs too, until
>
> commit 08e735233ea29b17bfec8e4cb302e799d9f920b8
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
> Date:   Tue Aug 28 17:10:10 2018 +0200
>
>     ARM: shmobile: Remove the ARCH_SHMOBILE Kconfig symbol
>
>     All drivers for Renesas ARM SoCs have gained proper ARCH_RENESAS
>     platform dependencies.  Hence finish the conversion from ARCH_SHMOBILE
>     to ARCH_RENESAS for Renesas 32-bit ARM SoCs, as started by commit
>     9b5ba0df4ea4f940 ("ARM: shmobile: Introduce ARCH_RENESAS").
>
>     Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>     Acked-by: Arnd Bergmann <arnd@arndb.de>
>     Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>
> merged in v4.20. The DRM shmobile driver's Kconfig entry wasn't updated,
> making it dead code indeed.

Note that it wasn't updated because this driver was not used on Renesas
ARM platforms, due to the lack of DT bindings and DT support, so it
didn't make sense to make it selectable.

> I haven't tested this driver in ages, hence my lack of objection, but
> someone may want to keep it for the pre-R-Car ARM SoCs.

Indeed, this driver should work with the R-Mobile A1 (which made it
into orbit, so we could call it the first member of R-Space ;-) and
SH-Mobile AG5 SoCs.  The major blocker is the lack of DT bindings.

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
