Return-Path: <SRS0=qtYn=W6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44880C3A5A7
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Sep 2019 15:07:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19E7520882
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Sep 2019 15:07:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S0bOn4Ub"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19E7520882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gamW1t69kKID1byV6Ache4bBmECkLpO0j2p5tZKbrwU=; b=S0bOn4UbEHwi4N
	xsB1srE/CH3/XWeat3pUGKb+Q39IAikRU70KH1kpVAaVjOP/Z8ZkuTHwbnRHHddSop1UXHnATLotO
	3P4AE5fI4y/9zERUin+9s+5LLqOSYynGKdPKxvmFdBZ28RF2xHotrvqU/6H8NosLWXcV28d99h15W
	ddmMYz+xOz32MhXS1oQC7bJHkQsQ3L7UNmfjQ2ZAj/3p1m7SeHHe2e2UWYAOnic2YtuHgEMA7TFJ5
	4hxj2jLau5RAovOWTR2pGMxZPJ+L8rfynsKxjgM23ymfDcSAJrXitwnNo9Py7Fl5Ye9SZIZjt7lsi
	Hxxq7e+Oswg5+ckrWKRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5AOi-0005zh-Gs; Tue, 03 Sep 2019 15:07:08 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5AOf-0005yy-Mo
 for linux-mtd@lists.infradead.org; Tue, 03 Sep 2019 15:07:07 +0000
Received: by mail-ot1-f66.google.com with SMTP id c10so5716355otd.9
 for <linux-mtd@lists.infradead.org>; Tue, 03 Sep 2019 08:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ESEycbkGEsTf561HdtK9W+JMPb2DaqG5d3IDc2e1GG4=;
 b=Wor92OV/fhMAiGjaTIDnWSik5aUUnytxZQrLOK3S1Xxvh+0Yr3ra/zpjsE6jlfy1iZ
 UbAxW65j0pvMpTiI1Bat3+k+1vBe9i2dAdUeJSwLks51CH2PS4FQ9sKXVozlVryBn8za
 uTidD4mdjb8n/mkaacOaHiuTMtadtt5saLo2uBfABFMO0HmJPMGFrKfuiefO+f+2uneC
 PJjCMeKz0pD5rdEGYKA8kVoOlcbilnEb+/IBUQuAKNsgvxTmXLks4h+qhyPvmodq+sRy
 y+FKo1DMKeh10uLbsFW0JXGj/gdphKV++D27zEPwDRaJpNYuB7grGCbbq4dZtf5VFHIt
 S//Q==
X-Gm-Message-State: APjAAAXrugCXASBakczt6kAWBwc1TsFQQetxl+IcUG1YxJrz0o/SviG7
 hwzpTS9GuWKgiU6IgzhcpLRKJ+TmCE0ehY97WQI=
X-Google-Smtp-Source: APXvYqxA9MC/Nx8W7llobkbX6NluWUXF0YQ9719X7MRA85ibLXQx6GzR3vQgyLYDbPoIeefD+uw420FZJO2CBcdT6z4=
X-Received: by 2002:a9d:68c5:: with SMTP id i5mr12305575oto.250.1567523224339; 
 Tue, 03 Sep 2019 08:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190330141637.22632-1-boris.brezillon@collabora.com>
 <20190425194451.GA14552@kroah.com>
In-Reply-To: <20190425194451.GA14552@kroah.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Sep 2019 17:06:52 +0200
Message-ID: <CAMuHMdViBLGurV+w=EN4TMOsDey9vC=YS6qoX6wA4gwvirOoAA@mail.gmail.com>
Subject: Re: [PATCH] eeprom: at25: Convert the driver to the spi-mem interface
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190903_080705_747157_C3FEA74D 
X-CRM114-Status: GOOD (  21.25  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Apr 25, 2019 at 9:44 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Sat, Mar 30, 2019 at 03:16:37PM +0100, Boris Brezillon wrote:
> > The AT25 protocol fits pretty well in the spi-mem model. Convert the
> > at25 spi driver to a spi-mem driver and use the dirmap API instead of
> > forging SPI messages manually.
> > This makes the driver compatible with spi-mem-only controllers
> > (controllers implementing only the spi_mem ops).
> >
> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/misc/eeprom/at25.c | 282 +++++++++++++++++++++++--------------
> >  1 file changed, 176 insertions(+), 106 deletions(-)
>
> Will there be a new version of this to fix up the problems that 0-day
> found in it?

gmail-whitespace-damaged fix:

diff --git a/drivers/misc/eeprom/Kconfig b/drivers/misc/eeprom/Kconfig
index f2abe27010eff133..98145d7d43d0c728 100644
--- a/drivers/misc/eeprom/Kconfig
+++ b/drivers/misc/eeprom/Kconfig
@@ -36,6 +36,7 @@ config EEPROM_AT25
        depends on SPI && SYSFS
        select NVMEM
        select NVMEM_SYSFS
+       select SPI_MEM
        help
          Enable this driver to get read/write support to most SPI EEPROMs,
          after you configure the board init code to know about each eeprom

Boris: what's the plan?

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
