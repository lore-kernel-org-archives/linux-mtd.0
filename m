Return-Path: <SRS0=Nzsu=GJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3C2C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Jan 2021 08:38:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D43723107
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Jan 2021 08:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D43723107
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EK0WqxkOqnpnr/WRvrDzdOBrrnRl/lKdc/0R3JiMpyA=; b=paLp3kngxa0WSFt4v9IkEk3//
	BBWP/e8mhl7tYTdIRZ2vPjrsEoImrB+WBoBo50p7/5AIk4/vM5vPXM6PTXALVY6rMdaApfczn0GTn
	bPnNwpge4YV8yTj1MIJF/LNUESGZySeJQLWb8sCn9UayKdEWbVLipUrHAluF6C4uXn21+EAnI8k2c
	Geh5AI7wQqpiQGmhIeojQKx11Cktn0Fl/Cf8cZWZoulCQjKLxjAXpCYjPvfiMMtp1QdaP12EBrZ2k
	nURk6yCDR9sPXa+sUo3qyO/k8gxrXlCnDq4WSsGhmKZo1+KWai3XtdeLxtnGZ3yjixBjamb/7SS0q
	D+UlPybuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx4Js-0003Hn-TB; Wed, 06 Jan 2021 08:37:28 +0000
Received: from mail-oo1-f47.google.com ([209.85.161.47])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx4Jp-0003FM-4d
 for linux-mtd@lists.infradead.org; Wed, 06 Jan 2021 08:37:26 +0000
Received: by mail-oo1-f47.google.com with SMTP id j8so595913oon.3
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jan 2021 00:37:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7OzcDXMwatEtiJomNBi1fhi3zuuxEWhyROAP2OwThNY=;
 b=Trc4Ux8rMWMm1aE1hmQLDZvVVQofow7a89S0Yr0QlTy+T0+6wFBOz1WPOd/GIWTdSO
 QtcoyKPmUrcgiFSY7LMbLGa3o2Qt8CnGraeU5hkPqALyT7YE7nkokIOK/F1IHHqg63Qn
 +nQdDnIW/q5T4B4eOJkN+8FpohNeHSEEqj3T397TvMD7FKjLFg3UmcxxOv9nm4Yt2Q0o
 ku8+fopIFAXJP8uc+7bmkN1+4O7E0MOtCj5q66rNxswhaJEQreEggknPRy11MVw8V62k
 55U0lo2KckWK68Da9oW7hsu1mEmkj30ywNlh1dgIPfvIgvZcL7ItQQbaOTksGvhYhLuH
 zYzg==
X-Gm-Message-State: AOAM530kTi5Smtp/+3Q08a8e+Z3qhw3rpna/+5g7zrvNCKORxtIMNvZv
 wmM/V0ichojq+qnH3psUxDFq4qBxXQI+8Q/LUA0=
X-Google-Smtp-Source: ABdhPJz+riLQ42T+q9EFB1XsbUqjCK7bS2nCYCFI4IXj5lNnjzpQBlfNrLzEuiXe37snmeLQrap5l7udgxcoLsEDH3o=
X-Received: by 2002:a4a:8353:: with SMTP id q19mr2071403oog.40.1609922242555; 
 Wed, 06 Jan 2021 00:37:22 -0800 (PST)
MIME-Version: 1.0
References: <20210105140305.141401-1-tsbogend@alpha.franken.de>
In-Reply-To: <20210105140305.141401-1-tsbogend@alpha.franken.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Jan 2021 09:37:11 +0100
Message-ID: <CAMuHMdX=trGqj8RzV7r1iTneqDjWOc4e1T-X+R_B34rxxhJpbg@mail.gmail.com>
Subject: Re: [PATCH 00/10] Remove support for TX49xx
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_033725_217041_7E0904D7 
X-CRM114-Status: GOOD (  16.34  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, linux-ide@vger.kernel.org,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-spi <linux-spi@vger.kernel.org>, linux-rtc@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>,
 Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Matt Mackall <mpm@selenic.com>,
 Dan Williams <dan.j.williams@intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Alessandro Zummo <a.zummo@towertech.it>, netdev <netdev@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 dmaengine <dmaengine@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Thomas,

CC Nemoto-san (de-facto TX49XX maintainer)

On Tue, Jan 5, 2021 at 3:03 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
> I couldn't find any buyable product other than reference boards using
> TX49xx CPUs. And since nobody showed interest in keeping support for
> it, it's time to remove it.

I have an RBTX4927 development board in my board farm, boot-test every
bi-weekly renesas-drivers release on it, and fix kernel issues when they
appear.

Is that sufficient to keep it?

TX49xx SoCs were used in Sony LocationFree base stations, running
VxWorks. You can no longer buy them.
I'm not aware of anyone ever porting Linux to them.
https://en.wikipedia.org/wiki/LocationFree_Player

>   spi: txx9: Remove driver

I only noticed the planned removal when I saw the SPI patch was applied.
Doesn't matter for me, as SPI is only present on TX4938, not on TX4927 ;-)

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
