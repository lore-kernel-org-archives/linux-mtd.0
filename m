Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599FBC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Dec 2021 13:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x2qdpRo9Tg0Q8BWvqAXXdR05csmOzw3N8RYFgVYpIw8=; b=2hnYiBoCUvLHkT
	mT6XDetMsevyM+8CSochdmK2TW06zPdBFJRvnE/7YDKzT72dG+YO1EUFOLOwiIzEyeRcL4pNdGCbP
	ZyE4BlLl4zogyA5MFrej9oA9+WLV9vlQIFFSaTcSZNb14ENJK8w1IvK6r+wnBPnLLdRlCuxBvwl25
	9gRU9PBmNyqPGQANdMYX8foMyKMdEv8ZF98OAg7ko4GhcWvN+cbF0FZZf2DCvssO9hz3FyVST8nSy
	bNCHU6F0P/XB8gWb4I2T0KhQbIRmjxGWpF4DmH/zihLTtsX/j0JTb0l7WqkIzTCeI7SQepyi22P48
	E9i6tk968uJDbHb6K+uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msPO6-008lvl-2U; Wed, 01 Dec 2021 13:11:06 +0000
Received: from mail-vk1-f177.google.com ([209.85.221.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msPJq-008gxg-1R
 for linux-mtd@lists.infradead.org; Wed, 01 Dec 2021 13:06:43 +0000
Received: by mail-vk1-f177.google.com with SMTP id s1so7615157vks.9
 for <linux-mtd@lists.infradead.org>; Wed, 01 Dec 2021 05:06:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AgwbFm5gkjwOtodlhi0zJJvcgS/i7V2fCpFuxG8kd94=;
 b=0lxXn2kWjgHzFg6tEP+r+uUP8ard8wA/MYwrqGD+nDaVeRWq8sTGww3k0OtUNE117S
 EsdjZ5zGuVWHjV1pes8umC4j/DXXXAJ2N2FuVSZvyglzQ0CdbRQ4DNJjxuIWL8eHT08K
 e4ZMbqVx+Ev9ejK9ij3FTOva8u66nsZik8XIXT/CvifSSZjRsWGfMQfztepbuqfNgWKr
 VuBYrRmaxWcwLKnI2lKsCvoTS4MSEf+X5R3hMvXZJ7Ku074xYP14T9MNONWutWCk6FIh
 D7yaaPGM3znzX7Ad7N2M3eBOnEFynpY0xHCavxfVAT3amVfxWyiJqfqStrBbXhxlQzFf
 /oWg==
X-Gm-Message-State: AOAM5311bB7VAKXIRtkfXLLDlVnmWxaangzeDJ2NAE9BetK+qnr+lCE6
 n1ju34MKFtHsHmLhhLiYOyv3xxaMZuJQqA==
X-Google-Smtp-Source: ABdhPJw5lsmC4GnYWGPohG92F+LQWgmhw5SD3VyBhIGC8zUMjVDkUR2ZwH/W473h5DsmH0KLArIPHQ==
X-Received: by 2002:a05:6122:2193:: with SMTP id
 j19mr7107439vkd.7.1638364000225; 
 Wed, 01 Dec 2021 05:06:40 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com.
 [209.85.222.41])
 by smtp.gmail.com with ESMTPSA id h10sm12163240vsl.34.2021.12.01.05.06.39
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 05:06:39 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id az37so48764741uab.13
 for <linux-mtd@lists.infradead.org>; Wed, 01 Dec 2021 05:06:39 -0800 (PST)
X-Received: by 2002:a05:6102:c89:: with SMTP id
 f9mr7151505vst.68.1638363999694; 
 Wed, 01 Dec 2021 05:06:39 -0800 (PST)
MIME-Version: 1.0
References: <20211130164558.85584-1-tsbogend@alpha.franken.de>
 <20211130164558.85584-3-tsbogend@alpha.franken.de>
In-Reply-To: <20211130164558.85584-3-tsbogend@alpha.franken.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Dec 2021 14:06:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXr1bT3U_XKvHKowfQwaW6-4XevYngoNzQFu-bYwdMP_A@mail.gmail.com>
Message-ID: <CAMuHMdXr1bT3U_XKvHKowfQwaW6-4XevYngoNzQFu-bYwdMP_A@mail.gmail.com>
Subject: Re: [PATCH 3/3] MIPS: TXX9: Remove TX4939 SoC support
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
 MTD Maling List <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_050642_147690_6BBB15CA 
X-CRM114-Status: GOOD (  21.32  )
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

Hi Thomas,

On Tue, Nov 30, 2021 at 5:46 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
> After removal of RBTX4939 board support remove code for the TX4939 SoC.
>
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Thanks for your patch!

> ---
>  arch/mips/pci/Makefile                |   1 -
>  arch/mips/pci/pci-tx4939.c            | 107 -----
>  arch/mips/txx9/Kconfig                |   8 -
>  arch/mips/txx9/generic/Makefile       |   1 -
>  arch/mips/txx9/generic/irq_tx4939.c   | 216 ----------
>  arch/mips/txx9/generic/setup_tx4939.c | 568 --------------------------
>  drivers/char/hw_random/Kconfig        |  13 -
>  drivers/char/hw_random/Makefile       |   1 -
>  drivers/char/hw_random/tx4939-rng.c   | 157 -------
>  drivers/mtd/nand/raw/Kconfig          |   2 +-
>  10 files changed, 1 insertion(+), 1073 deletions(-)
>  delete mode 100644 arch/mips/pci/pci-tx4939.c
>  delete mode 100644 arch/mips/txx9/generic/irq_tx4939.c
>  delete mode 100644 arch/mips/txx9/generic/setup_tx4939.c
>  delete mode 100644 drivers/char/hw_random/tx4939-rng.c

You forgot to remove arch/mips/include/asm/txx9/tx4939.h.

My rbtx4927 still works fine afterwards, so
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
