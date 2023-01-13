Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18ACC54EBE
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 08:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NgcLH2J+kMLXaz+GejyHHcAnSfSI1AK0ZdZtqzBou/0=; b=nFnuFvjQAhbDYV
	OWCldJQY2kGNg6powe9UoAD6j3k10lEemmNrpL+Esd/Jq1fCcCwJUGtXFa0GQ0oDb+rHumJ4Hp0a/
	LB/p8zqlQYvwMK2o8U27eLcomVhBAX0rZJD7joKBme1Ui3ZGilevEc1tr9zsJnBQpGi+r21opSuUJ
	+bGf4JdFLhTMFtYiVOAgSuadtqu2nZ1l3t4fSKcDkegTxGhCNyOScE14rZvN2tgd+OO9jR1Njw6Vw
	SjAfVNhGksUauX9h3Cx0xEmm2l9vUKZOclYmEFGGfPLHpP7K2oe03VhZ/d4REgZDAFXv5SmjbszjY
	hrQyyLNKREtz105yHndw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFlq-001KGg-PJ; Fri, 13 Jan 2023 08:50:42 +0000
Received: from mail-qv1-f43.google.com ([209.85.219.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFln-001KFs-Pg
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2023 08:50:41 +0000
Received: by mail-qv1-f43.google.com with SMTP id o17so14422784qvn.4
        for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2023 00:50:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awQakUOIwVvp4xWgkhRGNM/c58rzqkM16qYt20+qNyU=;
        b=vucvIEe9IUps4BKpRmjM1kx7yttnyI5V2zVJeCIfK2KQyXpVsrNaUb3qTAURlcwSXZ
         bqYclO93ZEXH14MBOzpl4va64XE0aJrW3BKEL9mMYHUs+UBkct5d6Dc9+G/sioaIcWhm
         ifVUD2W+9vd+Ze5PHSOQiDJ8MgRw8OVRXPIGi1p+kCXXPRlLroCPQvs+OYw1c41MLBXe
         o0JwTXx2WF0pwaJtWfizc98FUaDczmKPdmLZtDAtKK+2m+Iuf1und9ssz+Pc7BQKukLX
         CDAP/95U6FqtCuc1utuxJjrPD73gmQNfKhI84jhK903STvNTZtV++wQre7PdoS0brqr7
         ysrg==
X-Gm-Message-State: AFqh2kpuA56W73Q20ZRj8FJWy0AGDODEyYqnqIke6c6mB5cCFH0FHc5L
	m127LR9pJxROtb7oPI0EjJjXu1qeyPdrAQ==
X-Google-Smtp-Source: AMrXdXs+8JtEzunNp+cZAm/n1KTm/delkozXVppUIcF+zAGGA8uZYuvmAJUEb0e6j3Etx7G6/jAqpA==
X-Received: by 2002:a0c:c3c9:0:b0:531:8cdb:10a1 with SMTP id p9-20020a0cc3c9000000b005318cdb10a1mr83957695qvi.16.1673599837211;
        Fri, 13 Jan 2023 00:50:37 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id d6-20020a37b406000000b007049f19c736sm12119489qkf.7.2023.01.13.00.50.36
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 00:50:36 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-4c131bede4bso275335957b3.5
        for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2023 00:50:36 -0800 (PST)
X-Received: by 2002:a81:578e:0:b0:4d9:3858:392 with SMTP id
 l136-20020a81578e000000b004d938580392mr551266ywb.502.1673599835999; Fri, 13
 Jan 2023 00:50:35 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de> <20230113062339.1909087-17-hch@lst.de>
In-Reply-To: <20230113062339.1909087-17-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jan 2023 09:50:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU2vaVaCrcKom5YQYD9GLoeerX8HAQav36uFGUksOFc9w@mail.gmail.com>
Message-ID: <CAMuHMdU2vaVaCrcKom5YQYD9GLoeerX8HAQav36uFGUksOFc9w@mail.gmail.com>
Subject: Re: [PATCH 16/22] spi: remove spi-sh-sci
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
X-CRM114-CacheID: sfid-20230113_005039_849277_AAF7DEF0 
X-CRM114-Status: GOOD (  26.46  )
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
>  drivers/spi/Kconfig      |   7 --
>  drivers/spi/Makefile     |   1 -
>  drivers/spi/spi-sh-sci.c | 197 ---------------------------------------
>  3 files changed, 205 deletions(-)
>  delete mode 100644 drivers/spi/spi-sh-sci.c
>
> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
> index 7508dcef909c78..76f3bc6f8c81fc 100644
> --- a/drivers/spi/Kconfig
> +++ b/drivers/spi/Kconfig
> @@ -882,13 +882,6 @@ config SPI_SH_MSIOF
>         help
>           SPI driver for SuperH and SH Mobile MSIOF blocks.
>
> -config SPI_SH_SCI
> -       tristate "SuperH SCI SPI controller"
> -       depends on SUPERH
> -       select SPI_BITBANG
> -       help
> -         SPI driver for SuperH SCI blocks.

This driver uses the Serial Communications Interface (SCI, cfr.
drivers/tty/serial/sh-sci.c) in SPI mode. Hence in theory it could be
used on a variety of Renesas ARM SoCs, and even on RZ/Five.
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
