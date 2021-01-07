Return-Path: <SRS0=uqc5=GK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B20BC433DB
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Jan 2021 08:06:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00B3F2312F
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Jan 2021 08:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00B3F2312F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YBgT8Ltpv88kQHT5FLAAWFveL9Hs7YR/aRvexH8XY0A=; b=I6r9FsyqtcBr2tyjKCnsf+9p3
	775BjRJp/H3XVPl+JBpAiQz8W5S6FdLwDXPKVJ/mlRQJIaWf8jFwBaw9eGbuX1+Mb5XGFfncjSnM2
	xpYORmP+GR1hQ39YSZ33n3rUDZ8Wpi2+3nx2MN5s+7WfwpMbo80tvMYN02Sic/7yAVdfieeJOJcPh
	yiMV+/Ie2fGL9Sqjuv5SQpNMA6H9Se2gtVlLNBC/rBRQ0uNUlzceYeiyY/rWj7QL6m02X/r6d91+7
	NjTxgGDThRGqL8RED6SgsMkKsAGJonTEqvNO4yyzh/fj9eF396Z0UJiDbHyr3F1iFwaIACaKkKY8o
	Azf8/SObw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxQI4-000628-5l; Thu, 07 Jan 2021 08:05:04 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxQHv-00061a-1k
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2021 08:04:59 +0000
Received: by mail-ot1-f44.google.com with SMTP id j12so5516487ota.7
 for <linux-mtd@lists.infradead.org>; Thu, 07 Jan 2021 00:04:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0TPseVwGCXsOzziJOFXy0csIKxTAA1WaNx2ZI4idEKY=;
 b=WMdFgKPlSPv3zyD2ZUZMwG4bbxtERpfBD81ZWlQ4StEFtq1Vfa0EIgeRoQw1NImX/7
 Wm5FRdKC5CaDYEwckQrvwaF1ImCFebNDnCasjs57TyFDEGOjgUW35UEAQXB/D1M6Mh3x
 CsihzS9JffuQhKeITpNmGBn0u31p3CKeuFbpdEIGsAskN5LbpiRqkZN9FExgJ0suUfbR
 pR3x2RDv8+YP4fiAqoOimmM/K4nJDfw86djL27K9RMX/MHheJVuz0GAnawrSp11pDPXP
 bcaDI/nUFxBhoi4NlueSVsl+eIHTitsQcFVV1dhl2+iRSeQnRixD0wFt2KfWdQhmZli9
 B6dA==
X-Gm-Message-State: AOAM531spfKSLS2GwDvu8AsOUninWUe9xt8WzWAYS+/OSkX+g/74PbDG
 ENOaBa0wxQIliHEFhbmmygmt8RZ55GiCH6rSRec=
X-Google-Smtp-Source: ABdhPJzVAPf8/NQQQzT3zzrkoDzUv+P+SG+XgCFUWTKsU/u1ByX8ezoz8GuB2nVGz7LNk3BFgEKDp8LcWHb42uaO/Sc=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id
 u26mr5905584oth.250.1610006693990; 
 Thu, 07 Jan 2021 00:04:53 -0800 (PST)
MIME-Version: 1.0
References: <CAMuHMdX=trGqj8RzV7r1iTneqDjWOc4e1T-X+R_B34rxxhJpbg@mail.gmail.com>
 <20210106184839.GA7773@alpha.franken.de>
 <CAMuHMdV86BES7dmWr-7j1jbtoSy0bH1J0e5W41p8evagi0Nqcw@mail.gmail.com>
 <20210107.101729.1936921832901251107.anemo@mba.ocn.ne.jp>
In-Reply-To: <20210107.101729.1936921832901251107.anemo@mba.ocn.ne.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Jan 2021 09:04:43 +0100
Message-ID: <CAMuHMdX6ptaO3r=b55zqwrrK8ADfSRWdunwHA5DYD08PMCAPaA@mail.gmail.com>
Subject: Re: [PATCH 00/10] Remove support for TX49xx
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_030455_536369_6E2B4B0E 
X-CRM114-Status: GOOD (  19.11  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, "R,
 Vignesh" <vigneshr@ti.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-ide@vger.kernel.org,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-rtc@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>,
 Jakub Kicinski <kuba@kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Matt Mackall <mpm@selenic.com>,
 Jaroslav Kysela <perex@perex.cz>, Dan Williams <dan.j.williams@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 netdev <netdev@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 linux-spi <linux-spi@vger.kernel.org>, Vinod <vkoul@kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 dmaengine <dmaengine@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Nemoto-san,

On Thu, Jan 7, 2021 at 2:18 AM Atsushi Nemoto <anemo@mba.ocn.ne.jp> wrote:
> On Wed, 6 Jan 2021 21:41:24 +0100, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >> > Is that sufficient to keep it?
> >>
> >> for me it is. But now we probaly need some reverts then...
> >
> > Indeed. Fortunately not all of it, as some removals were TX4938-only.
>
> These patches should not break RBTX4927:
>
>   net: tc35815: Drop support for TX49XX boards
>   spi: txx9: Remove driver
>   mtd: Remove drivers used by TX49xx
>   char: hw_random: Remove tx4939 driver
>   rtc: tx4939: Remove driver
>   ide: tx4938ide: Remove driver

Indeed.

> And these patches just break audio-support only.
>
>   dma: tx49 removal
>   ASoC: txx9: Remove driver
>
> I think dma and ASoC drivers are hard to maintain now, and can be
> dropped for basic support for RBTX4927.
> (TX39 boards does not have audio-support, so dma txx9 driver can be
> dropped too)

Agreed, I don't test audio anyway, but I know it used to work (I had
intended to use the board as an MPD media server, but never got beyond
the prototyping phase).

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
