Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFEEC677F1
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 08:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kmf/pY/kgvhJlxfpepNBGkuLzKsl0Xllz0ZAMuHlmeY=; b=rXdGmhzgot5V8TlyttF5GYAylg
	ib49GsHBK0iWyGIweP2N+iq8LkejljwVnw3hZVwa6387esrgRlD0cpgOm6ezaMMgVHeZmBOhgdD8e
	CE6aWcOsZch6Dk6doHxjWlfhJBl+jZhDWS+kvgJUkSrDg1qubFOSmULiWaICnAKAqYhS+csLRbVod
	MEdIo8C4Y/PrFNprKdDbdjBjrHjmCbf5kU14t2j6FcsB0xFDiUpWwroIGS7nlvQCgFaAFuR9EUWKc
	AY+J/XBRKZU5GoCmh0s6JP9800aB7lsfTAWbydTw66og75bTE+6rR9odBzs9WMr8uD9TESUv9oPWW
	Flfynq1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFhB-001Izv-4q; Fri, 13 Jan 2023 08:45:53 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFh6-001Ix1-IB
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2023 08:45:50 +0000
Received: from ramsan.of.borg ([84.195.186.194])
	by laurent.telenet-ops.be with bizsmtp
	id 88lL2900C4C55Sk018lL8t; Fri, 13 Jan 2023 09:45:40 +0100
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pGFgd-003qP4-W0;
	Fri, 13 Jan 2023 09:45:19 +0100
Date: Fri, 13 Jan 2023 09:45:19 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Christoph Hellwig <hch@lst.de>
cc: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
    Arnd Bergmann <arnd@arndb.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
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
Subject: Re: [PATCH 13/22] pinctrl: remove renesas sh controllers
In-Reply-To: <20230113062339.1909087-14-hch@lst.de>
Message-ID: <c480ecd6-166c-18b4-2230-418836ce3fb2@linux-m68k.org>
References: <20230113062339.1909087-1-hch@lst.de> <20230113062339.1909087-14-hch@lst.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_004548_769347_63DA5213 
X-CRM114-Status: GOOD (  20.40  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

 	Hi Christoph,

On Fri, 13 Jan 2023, Christoph Hellwig wrote:
> Now that arch/sh is removed these drivers are dead code.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/Kconfig
> +++ b/drivers/pinctrl/renesas/Kconfig
> @@ -255,57 +243,10 @@ config PINCTRL_RZV2M
> 	  This selects GPIO and pinctrl driver for Renesas RZ/V2M
> 	  platforms.
>
> -config PINCTRL_PFC_SH7203
> -	bool "pin control support for SH7203" if COMPILE_TEST
> -	select PINCTRL_SH_FUNC_GPIO

(If this is to be continued) the PINCTRL_SH_FUNC_GPIO symbol itself, and
all its users, can be removed, too.

> --- a/drivers/pinctrl/renesas/core.c
> +++ b/drivers/pinctrl/renesas/core.c
> @@ -753,562 +753,6 @@ static int sh_pfc_suspend_init(struct sh_pfc *pfc) { return 0; }
> #define DEV_PM_OPS	NULL
> #endif /* CONFIG_PM_SLEEP && CONFIG_ARM_PSCI_FW */
>
> -#ifdef DEBUG
> -#define SH_PFC_MAX_REGS		300
> -#define SH_PFC_MAX_ENUMS	5000
> -

This whole hunk should stay (except for the part protected by #ifdef
CONFIG_PINCTRL_SH_FUNC_GPIO), as it is used for validating pin control
tables on ARM SoCs, too.

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
